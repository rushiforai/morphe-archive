/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0). The feed cache's merge as the place to take ads out
 * is the one zeldrisho/morphe-patches found: https://github.com/zeldrisho/morphe-patches
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.parameterRegister
import app.morphe.patches.threads.misc.extension.requireLocals
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.extension.writeStub
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.getReference
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val FEED_ADS = "$EXTENSION_PACKAGE/ads/FeedAds;"
// The shared hook fails for whichever feed patch was selected, so its messages name both.
private const val PATCH = "Feed filter (Hide ads, Hide suggested users)"

/** The pre-cache page boundaries (the feed cache's merge, the spool cache's, and For You's other writes, whole and one item), shared by independently selected feed patches. */
internal val feedPageFilterPatch = bytecodePatch {
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    execute {
        val merge = FeedPageMergeFingerprint.method

        val itemMedia = merge.itemMediaGetter()
        mutableClassDefBy(itemMedia.definingClass).methods.filter {
            it.name == itemMedia.name && it.returnType == MEDIA && it.parameterTypes.isEmpty() &&
                !AccessFlags.STATIC.isSet(it.accessFlags)
        }.singleOrPatchException("$PATCH: declaration of $itemMedia")

        writeStub(
            FEED_ADS, "itemMedia", 2,
            """
                instance-of v0, p0, ${itemMedia.definingClass}
                if-eqz v0, :none
                check-cast p0, ${itemMedia.definingClass}
                invoke-virtual { p0 }, ${itemMedia.definingClass}->${itemMedia.name}()$MEDIA
                move-result-object v0
                return-object v0
                :none
                const/4 v0, 0x0
                return-object v0
            """,
        )
        // The page, first thing. A resumed merge is called again with no page and reads its own saved
        // copy, which is the one filtered here on the first call.
        val page = merge.parameterRegister(4)
        merge.addInstructions(
            0,
            """
                invoke-static/range { $page .. $page }, $FEED_ADS->filter(Ljava/util/List;)Ljava/util/List;
                move-result-object $page
            """,
        )

        // For You's spool cache merges its pages on its own, past the merge above, so its page gets
        // the same filter first thing. It resumes the same way, from its own saved copy.
        val spool = SpoolFeedPageMergeFingerprint.method
        val spoolPage = spool.parameterRegister(5)
        spool.addInstructions(
            0,
            """
                invoke-static/range { $spoolPage .. $spoolPage }, $FEED_ADS->spoolPage(Ljava/util/List;)Ljava/util/List;
                move-result-object $spoolPage
            """,
        )

        // For You's data source writes feed items into either cache more ways than the merges (the
        // refresh's write, the paging flow's, an append to the page it holds, a page it rebuilds),
        // and none passes either filter above. Each handler's write takes its items first thing,
        // before the feed cache handler's own code (some hand on to the feed cache, one builds a page
        // and writes it to disk itself), and a resumed spool write is called again with no list.
        forYouWrites(spool).forEach { (handler, write) ->
            val items = write.parameterRegister(write.parameterTypes.indexOfFirst { it.toString() == LIST })
            val entry = if (handler == SPOOL_FEED_CACHE) "spoolWrite" else "forYouWrite"
            write.addInstructions(
                0,
                """
                    invoke-static/range { $items .. $items }, $FEED_ADS->$entry(Ljava/util/List;)Ljava/util/List;
                    move-result-object $items
                """,
            )
        }

        // It also writes one item at a time (one it adds, puts after a post or swaps in for one it
        // holds), which passes no filter either. Each such write asks first and, for an item a rule
        // takes out, answers the Unit it answers when it's done, so nothing is written. A resumed
        // spool write is called again with no item, which the ask keeps.
        val itemWrites = forYouItemWrites(itemMedia.definingClass)
        val done = doneAnswer(itemWrites.map { it.second })
        itemWrites.forEach { (handler, write) ->
            write.requireLocals(PATCH, 1)
            val item = write.parameterRegister(0)
            val entry = if (handler == SPOOL_FEED_CACHE) "spoolItem" else "forYouItem"
            write.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { $item .. $item }, $FEED_ADS->$entry(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :write
                    sget-object v0, $done
                    return-object v0
                """,
                ExternalLabel("write", write.getInstruction(0)),
            )
        }
    }
}

private const val LIST = "Ljava/util/List;"

/**
 * What every one of [writes] answers when it's done without suspending: Kotlin's Unit. Some builds
 * rename it (454's x86 build answers `LX/BZ8;->A00`, a class whose toString is "X.BZ8"), so it's
 * the one static field of its own type that each write loads straight into its return. The
 * coroutine's suspended marker is compared, never loaded and returned, and a write that returns
 * another call's answer has nothing of that shape there. Unit's class is a bare singleton (an
 * Object with that one static field, no instance fields and no interfaces). The marker's enum
 * isn't, and neither are stateless objects like EmptyList, which implement what they stand in for,
 * so a build whose writes all hand back some other shared field is refused rather than answering it.
 */
internal fun BytecodePatchContext.doneAnswer(writes: List<Method>): String {
    val answers = writes.map { write ->
        write.implementation!!.instructions.zipWithNext().mapNotNull { (load, ret) ->
            val field = load.getReference<FieldReference>()?.takeIf { it.type == it.definingClass }
            field?.takeIf {
                load.opcode == Opcode.SGET_OBJECT && ret.opcode == Opcode.RETURN_OBJECT &&
                    (load as OneRegisterInstruction).registerA == (ret as OneRegisterInstruction).registerA
            }?.toString()
        }.toSet()
    }
    val done = answers.reduce { shared, next -> shared intersect next }.singleOrNull()
        ?: throw PatchException("$PATCH: For You's one-item writes don't share one done answer: $answers")
    val type = done.substringBefore("->")
    val holder = classDefByOrNull(type)
        ?: throw PatchException("$PATCH: For You's one-item writes answer $done, whose class isn't in the app")
    val bare = holder.superclass == "Ljava/lang/Object;" && holder.interfaces.isEmpty() &&
        holder.fields.all { AccessFlags.STATIC.isSet(it.accessFlags) } &&
        holder.fields.count { it.type == type } == 1
    if (!bare) throw PatchException("$PATCH: For You's one-item writes answer $done, which isn't a bare singleton like Unit")
    return done
}

/**
 * For You's writes of one feed item: each abstract method of [FOR_YOU_LOCAL_SOURCE] taking the
 * feed [item] first and answering an Object, as each For You handler implements it. The insert at
 * a position answers an Integer instead, and Hide ads hooks it on its own.
 */
internal fun BytecodePatchContext.forYouItemWrites(item: String): List<Pair<String, MutableMethod>> {
    val declared = classDefBy(FOR_YOU_LOCAL_SOURCE).methods.filter { method ->
        AccessFlags.ABSTRACT.isSet(method.accessFlags) && method.returnType == "Ljava/lang/Object;" &&
            method.parameterTypes.firstOrNull()?.toString() == item
    }
    if (declared.isEmpty()) throw PatchException("$PATCH: $FOR_YOU_LOCAL_SOURCE declares no writes of one $item")
    return listOf(FEED_CACHE_HANDLER, SPOOL_FEED_CACHE).flatMap { handler ->
        val classDef = mutableClassDefBy(handler)
        if (classDef.superclass != FOR_YOU_LOCAL_SOURCE) {
            throw PatchException("$PATCH: $handler no longer extends $FOR_YOU_LOCAL_SOURCE")
        }
        declared.map { declaration ->
            handler to classDef.methods.filter { it.signature() == declaration.signature() && it.implementation != null }
                .singleOrPatchException("$PATCH: $handler's ${declaration.signature()}")
        }
    }
}

private fun Method.signature(): String = name + parameterTypes.joinToString("", "(", ")") + returnType

/**
 * For You's writes of feed items besides its page merge: each abstract method of
 * [FOR_YOU_LOCAL_SOURCE] taking one list, other than the merge the spool's [merge] implements, as
 * each For You handler implements it.
 */
internal fun BytecodePatchContext.forYouWrites(merge: Method): List<Pair<String, MutableMethod>> {
    val declared = classDefBy(FOR_YOU_LOCAL_SOURCE).methods.filter { method ->
        AccessFlags.ABSTRACT.isSet(method.accessFlags) && method.parameterTypes.count { it.toString() == LIST } == 1
    }
    val (merges, writes) = declared.partition { it.signature() == merge.signature() }
    if (merges.size != 1) {
        throw PatchException("$PATCH: $FOR_YOU_LOCAL_SOURCE doesn't declare the spool's merge ${merge.signature()}")
    }
    if (writes.isEmpty()) throw PatchException("$PATCH: $FOR_YOU_LOCAL_SOURCE declares no list writes besides its merge")
    return listOf(FEED_CACHE_HANDLER, SPOOL_FEED_CACHE).flatMap { handler ->
        val classDef = mutableClassDefBy(handler)
        if (classDef.superclass != FOR_YOU_LOCAL_SOURCE) {
            throw PatchException("$PATCH: $handler no longer extends $FOR_YOU_LOCAL_SOURCE")
        }
        writes.map { declaration ->
            handler to classDef.methods.filter { it.signature() == declaration.signature() && it.implementation != null }
                .singleOrPatchException("$PATCH: $handler's ${declaration.signature()}")
        }
    }
}

/**
 * The feed item's own getter for its post, read from the feed cache's merge: a no-argument call
 * answering Media on a receiver the merge last cast to the getter's own class. It answers null for
 * an item that carries none. Hide ads reads the item class from it too.
 */
internal fun Method.itemMediaGetter(): MethodReference {
    val instructions = implementation!!.instructions.toList()
    val getters = instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_VIRTUAL_RANGE) {
            return@mapIndexedNotNull null
        }
        val reference = instruction.getReference<MethodReference>() ?: return@mapIndexedNotNull null
        if (reference.returnType != MEDIA || reference.parameterTypes.isNotEmpty() || reference.definingClass == MEDIA) {
            return@mapIndexedNotNull null
        }
        val receiver = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerC
            is RegisterRangeInstruction -> instruction.startRegister
            else -> return@mapIndexedNotNull null
        }
        val lastWrite = instructions.take(index).lastOrNull {
            val register = (it as? OneRegisterInstruction)?.registerA
            it.opcode.setsRegister() && (register == receiver || it.opcode.setsWideRegister() && register == receiver - 1)
        }
        reference.takeIf {
            lastWrite?.opcode == Opcode.CHECK_CAST &&
                lastWrite.getReference<TypeReference>()?.type == reference.definingClass
        }
    }.distinctBy { it.toString() }
    return getters.singleOrPatchException(
        "$PATCH: item-owned no-argument Media getter in $definingClass->$name",
    )
}
