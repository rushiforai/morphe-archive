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
import app.morphe.patches.threads.feed.writes
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
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val FEED_ADS = "$EXTENSION_PACKAGE/ads/FeedAds;"
// The shared hook fails for whichever feed patch was selected, so its messages name both.
private const val PATCH = "Feed filter (Hide ads, Hide suggested users)"

/** The pre-cache page boundaries (the feed cache's merge and For You's other writes, whole and one item), shared by independently selected feed patches. */
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

        // For You writes feed items into the feed cache more ways than the merge (the refresh's
        // write, the paging flow's, an append to the page it holds, a page it rebuilds), and none
        // passes the filter above. 455 calls the cache's own writes straight from where it writes,
        // with no handler between (454's handlers handed on to them), so each takes its items first
        // thing. A resumed write is called again with the list it saved, already filtered.
        forYouWrites(merge).forEach { write ->
            val items = write.parameterRegister(write.parameterTypes.indexOfFirst { it.toString() == LIST })
            write.addInstructions(
                0,
                """
                    invoke-static/range { $items .. $items }, $FEED_ADS->forYouWrite(Ljava/util/List;)Ljava/util/List;
                    move-result-object $items
                """,
            )
        }

        // It also writes one item at a time (one it adds, puts after a post or swaps in for one it
        // holds), which passes no filter either. Each such write asks first and, for an item a rule
        // takes out, answers the Unit it answers when it's done, so nothing is written.
        val itemWrites = forYouItemWrites(itemMedia.definingClass)
        val done = doneAnswer(itemWrites)
        itemWrites.forEach { write ->
            write.requireLocals(PATCH, 1)
            val item = write.parameterRegister(0)
            write.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range { $item .. $item }, $FEED_ADS->forYouItem(Ljava/lang/Object;)Z
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
 * The static fields of their own type that [method] hands back as it is: each loaded with
 * sget-object into the register the next return-object returns, with nothing between that
 * branches or writes that register. 455's writes unlock the cache between the load and the return.
 */
internal fun Method.selfTypedAnswers(): Set<String> {
    val body = implementation!!.instructions.toList()
    return body.indices.mapNotNull { index ->
        val load = body[index]
        val field = load.getReference<FieldReference>()?.takeIf { load.opcode == Opcode.SGET_OBJECT && it.type == it.definingClass }
            ?: return@mapNotNull null
        val register = (load as OneRegisterInstruction).registerA
        val ret = (index + 1 until body.size).firstOrNull { body[it].opcode == Opcode.RETURN_OBJECT } ?: return@mapNotNull null
        val between = body.subList(index + 1, ret)
        field.toString().takeIf {
            (body[ret] as OneRegisterInstruction).registerA == register &&
                between.all { it.opcode.canContinue() && it !is OffsetInstruction && !it.writes(register) }
        }
    }.toSet()
}

/**
 * What every one of [writes] answers when it's done without suspending: Kotlin's Unit. Some builds
 * rename it (454's x86 build answers `LX/BZ8;->A00`, a class whose toString is "X.BZ8"), so it's
 * the one static field of its own type that each write hands back as it is. The coroutine's
 * suspended marker is compared before it's returned, and a write that returns another call's
 * answer has nothing of that shape there. Unit's class is a bare singleton (an Object with that
 * one static field, no instance fields and no interfaces). The marker's enum isn't, and neither
 * are stateless objects like EmptyList, which implement what they stand in for, so a build whose
 * writes all hand back some other shared field is refused rather than answering it.
 */
internal fun BytecodePatchContext.doneAnswer(writes: List<Method>): String {
    val answers = writes.map { it.selfTypedAnswers() }
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

/** The feed cache's own suspend writes: its instance methods with a body that answer an Object. */
private fun BytecodePatchContext.cacheWrites(): List<MutableMethod> = mutableClassDefBy(FEED_CACHE).methods.filter {
    !AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.PRIVATE.isSet(it.accessFlags) &&
        it.returnType == "Ljava/lang/Object;" && it.implementation != null
}

/**
 * For You's writes of one feed item: each of the feed cache's writes taking the feed [item] first.
 * The insert at a position lives elsewhere and answers an Integer, and Hide ads hooks it on its own.
 */
internal fun BytecodePatchContext.forYouItemWrites(item: String): List<MutableMethod> =
    cacheWrites().filter { it.parameterTypes.firstOrNull()?.toString() == item }
        .ifEmpty { throw PatchException("$PATCH: $FEED_CACHE has no writes of one $item") }

/**
 * For You's writes of feed items besides its page [merge]: each of the feed cache's writes taking
 * one list and the continuation the merge takes (Redex sorts parameters, so it isn't always last),
 * whose other parameters are only what a write of a page takes besides its items: the merge's page
 * key, a count, a callback, flags. The cache's reads take a list too, beside their request type,
 * offsets and a timestamp.
 */
internal fun BytecodePatchContext.forYouWrites(merge: Method): List<MutableMethod> {
    val continuation = merge.parameterTypes[MERGE_CONTINUATION].toString()
    val besides = setOf(merge.parameterTypes[0].toString(), "Ljava/lang/Integer;", "Lkotlin/jvm/functions/Function0;", "Z")
    return cacheWrites().filter { write ->
        val types = write.parameterTypes.map { it.toString() }
        types.count { it == LIST } == 1 && types.count { it == continuation } == 1 &&
            types.all { it == LIST || it == continuation || it in besides }
    }.ifEmpty { throw PatchException("$PATCH: $FEED_CACHE has no list writes besides its merge") }
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
