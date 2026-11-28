/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.reels.liked

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.classesAccessing
import app.morphe.patches.instagram.misc.extension.classesLoadingString
import app.morphe.patches.instagram.misc.extension.freeLocalsAt
import app.morphe.patches.instagram.misc.extension.loadsString
import app.morphe.patches.instagram.misc.extension.localRegisterCount
import app.morphe.patches.instagram.misc.extension.requireThisIntact
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Continue through liked Reels"
private const val VIEWER_SOURCE = "Lcom/instagram/clips/intf/ClipsViewerSource;"
private const val CLIPS_VIEWER_CONFIG = "Lcom/instagram/clips/intf/ClipsViewerConfig;"
private const val USER_SESSION = "Lcom/instagram/common/session/UserSession;"
private const val LIKED_SOURCE_HELPER = "$EXTENSION_PACKAGE/reels/LikedReelsScroll;->source(Ljava/lang/Object;)Ljava/lang/Object;"
private const val ACTIVITY_SOURCE_HELPER =
    "$EXTENSION_PACKAGE/reels/LikedReelsScroll;->activityCenterSource(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;"
private const val ACTIVITY_CACHE_HELPER =
    "$EXTENSION_PACKAGE/reels/LikedReelsScroll;->activityCenterCache(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"
/** Logged by the method that opens a reel from a Your activity screen (Likes, Watch history and so on). */
private const val ACTIVITY_CENTER_OPEN = "openActivityCenterMediaReel got empty items for mediaId="
/** The Watch history screen's type, compared with the screen type field in that method. */
private const val SEEN_CONTENT = "seen_content"

/**
 * Where a Your activity screen opens a reel: the viewer source read, the field holding the screen's
 * type, and the write of the one-item cache key that keeps the viewer on that single reel.
 */
private data class ActivityCenterSite(
    val owner: String,
    val name: String,
    val parameters: List<String>,
    val sourceRead: Int,
    val typeField: FieldReference,
    val cacheWrite: Int,
)

private data class LikedReelsSite(val owner: String, val name: String, val parameters: List<String>, val sourceRead: Int, val sourceField: FieldReference)

@Suppress("unused")
val continueLikedReelsPatch = bytecodePatch(
    name = PATCH,
    description = "Uses Instagram's liked-Reels source when opening a Reel from Your activity > Likes, so swiping " +
        "continues through that liked feed.",
) {
    category("Reels")
    dependsOn(settingsPatch, instagramExtensionPatch)
    compatibleWith(*AppCompatibilities.instagram())

    execute {
        requireStatusMethod("likedReelsScroll")
        // Older builds open a liked reel through the feed_liked launch. From 457, Your activity > Likes
        // is a Bloks screen that opens it through the Activity Center launch. Either one is enough.
        val feedSite = runCatching { findLikedReelsSite() }
        val activitySite = runCatching { findActivityCenterSite() }
        if (feedSite.isFailure && activitySite.isFailure) {
            refuse("found neither liked reels launch (" + feedSite.exceptionOrNull()?.message + "; " +
                activitySite.exceptionOrNull()?.message + ")")
        }
        feedSite.getOrNull()?.let { hookLikedReelsSource(it) }
        activitySite.getOrNull()?.let { hookActivityCenter(it) }
        enableStatus("likedReelsScroll")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/** Finds the FEED_LIKED source field from Instagram's enum initializer and the viewer launch using it. */
private fun BytecodePatchContext.findLikedReelsSite(): LikedReelsSite {
    val sourceClass = classDefBy(VIEWER_SOURCE)
    val initializer = sourceClass.methods.singleOrNull { it.name == "<clinit>" }
        ?: refuse("$VIEWER_SOURCE has no unique enum initializer")
    val initCode = initializer.implementation?.instructions?.toList()
        ?: refuse("$VIEWER_SOURCE enum initializer has no code")
    val feedLikedString = initCode.indexOfFirst { instruction -> stringAt(instruction) == "feed_liked" }
        ?: refuse("$VIEWER_SOURCE no longer names the feed_liked source")
    val sourceWrite = (feedLikedString + 1 until initCode.size).firstOrNull { index ->
        val instruction = initCode[index]
        instruction.opcode == Opcode.SPUT_OBJECT && (instruction as? ReferenceInstruction)?.reference.let { ref ->
            ref is FieldReference && ref.definingClass == VIEWER_SOURCE && ref.type == VIEWER_SOURCE
        }
    } ?: refuse("could not find the static field for feed_liked")
    val sourceField = (initCode[sourceWrite] as ReferenceInstruction).reference as FieldReference

    val candidates = classesAccessing(VIEWER_SOURCE, sourceField.name, Opcode.SGET_OBJECT)
        .flatMap { it.methods }
        .mapNotNull { method ->
            val code = method.implementation?.instructions?.toList() ?: return@mapNotNull null
            val reads = code.indices.filter { index ->
                code[index].opcode == Opcode.SGET_OBJECT &&
                    (code[index] as? ReferenceInstruction)?.reference == sourceField
            }
            if (reads.size != 1 || !code.any { stringAt(it) == "clips" }) return@mapNotNull null
            val opensClipsViewer = code.any { instruction ->
                val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@any false
                called.name == "<init>" && called.parameterTypes.map(CharSequence::toString) == listOf(VIEWER_SOURCE, USER_SESSION)
            } && code.any { instruction ->
                val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@any false
                called.parameterTypes.map(CharSequence::toString) ==
                    listOf("Landroidx/fragment/app/FragmentActivity;", CLIPS_VIEWER_CONFIG, USER_SESSION)
            }
            if (!opensClipsViewer) return@mapNotNull null
            LikedReelsSite(method.definingClass, method.name, method.parameterTypes.map(CharSequence::toString), reads.single(), sourceField)
        }
    return candidates.singleOrNull()
        ?: refuse("expected one liked-feed clip viewer launch, found ${candidates.size}")
}

private fun stringAt(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction): String? {
    if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) return null
    return ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
}

/** Changes only the source read used to open a clip from the Likes feed. */
private fun BytecodePatchContext.hookLikedReelsSource(site: LikedReelsSite) {
    val method = mutableClassDefBy(site.owner).methods.singleOrNull {
        it.name == site.name && it.parameterTypes.map(CharSequence::toString) == site.parameters
    } ?: refuse("${site.owner}->${site.name} moved after discovery")
    val code = method.implementation?.instructions?.toList()
        ?: refuse("${site.owner}->${site.name} has no code")
    val instruction = code.getOrNull(site.sourceRead) as? OneRegisterInstruction
        ?: refuse("the liked-feed source read no longer has a result register")
    method.addInstructions(
        site.sourceRead + 1,
        """
            invoke-static/range { v${instruction.registerA} .. v${instruction.registerA} }, $LIKED_SOURCE_HELPER
            move-result-object v${instruction.registerA}
            check-cast v${instruction.registerA}, $VIEWER_SOURCE
        """.trimIndent(),
    )
}

/** Finds the method that opens a reel from a Your activity screen, and the spots to hook in it. */
private fun BytecodePatchContext.findActivityCenterSite(): ActivityCenterSite {
    val candidates = classesLoadingString(ACTIVITY_CENTER_OPEN).flatMap { it.methods }.filter { method ->
        method.implementation != null && loadsString(method, ACTIVITY_CENTER_OPEN)
    }
    val method = candidates.singleOrNull()
        ?: refuse("expected one Activity Center reel launch, found ${candidates.size}")
    val code = method.implementation!!.instructions.toList()
    val sourceReads = code.indices.filter { index ->
        code[index].opcode == Opcode.SGET_OBJECT &&
            ((code[index] as ReferenceInstruction).reference as? FieldReference)?.type == VIEWER_SOURCE
    }
    val sourceRead = sourceReads.singleOrNull()
        ?: refuse("the Activity Center launch reads ${sourceReads.size} viewer sources")

    // The screen type: the field read just before it's compared with Watch history's type.
    val seen = code.indexOfFirst { stringAt(it) == SEEN_CONTENT }
    if (seen < 0) refuse("the Activity Center launch no longer checks for $SEEN_CONTENT")
    val typeRead = (seen - 1 downTo 0).firstOrNull { index ->
        code[index].opcode == Opcode.IGET_OBJECT &&
            ((code[index] as ReferenceInstruction).reference as? FieldReference)?.let {
                it.definingClass == method.definingClass && it.type == "Ljava/lang/String;"
            } == true
    } ?: refuse("could not find the Activity Center screen type")
    val typeField = (code[typeRead] as ReferenceInstruction).reference as FieldReference

    // The one-item cache: its key goes in with the reel, through a call taking a String and a List,
    // then into a String field of the viewer config builder after the source read.
    val seed = (0 until sourceRead).lastOrNull { index ->
        val called = (code[index] as? ReferenceInstruction)?.reference as? MethodReference ?: return@lastOrNull false
        called.parameterTypes.map(CharSequence::toString).takeLast(2) == listOf("Ljava/lang/String;", "Ljava/util/List;")
    } ?: refuse("could not find where the Activity Center launch caches its reel")
    val seedCall = code[seed] as? FiveRegisterInstruction
        ?: refuse("the Activity Center cache call takes a register range")
    if (seedCall.registerCount != 4) refuse("the Activity Center cache call takes ${seedCall.registerCount} registers")
    val keyRegister = seedCall.registerE
    val cacheWrite = (sourceRead + 1 until code.size).firstOrNull { index ->
        val instruction = code[index]
        instruction.opcode == Opcode.IPUT_OBJECT &&
            (instruction as TwoRegisterInstruction).registerA == keyRegister &&
            ((instruction as ReferenceInstruction).reference as? FieldReference)?.type == "Ljava/lang/String;"
    } ?: refuse("could not find the Activity Center cache key on the viewer config")
    return ActivityCenterSite(
        method.definingClass, method.name, method.parameterTypes.map(CharSequence::toString),
        sourceRead, typeField, cacheWrite,
    )
}

/**
 * On a Your activity > Likes reel, swaps the viewer source for the liked feed and drops the one-item
 * cache, so the viewer pages through your likes from that reel the way the old Likes screen did.
 */
private fun BytecodePatchContext.hookActivityCenter(site: ActivityCenterSite) {
    val what = "$PATCH (Activity Center)"
    val method = mutableClassDefBy(site.owner).methods.singleOrNull {
        it.name == site.name && it.parameterTypes.map(CharSequence::toString) == site.parameters
    } ?: refuse("${site.owner}->${site.name} moved after discovery")
    val code = method.implementation!!.instructions.toList()
    val self = method.localRegisterCount()
    if (self > 15) refuse("${site.owner}->${site.name} keeps this in v$self, past what iget can name")
    method.requireThisIntact(what, listOf(site.cacheWrite + 1, site.sourceRead + 1))

    // The later spot first, so the earlier index still points where it did.
    val write = code[site.cacheWrite] as TwoRegisterInstruction
    val field = (code[site.cacheWrite] as ReferenceInstruction).reference as FieldReference
    val key = write.registerA
    val builder = write.registerB
    if (key > 15 || builder > 15) refuse("the Activity Center cache key or builder sits past v15")
    val cacheTemp = method.freeLocalsAt(what, site.cacheWrite + 1, 1, except = listOf(key, builder)).single()
    method.addInstructions(
        site.cacheWrite + 1,
        """
            iget-object v$cacheTemp, v$self, ${site.typeField}
            invoke-static { v$key, v$cacheTemp }, $ACTIVITY_CACHE_HELPER
            move-result-object v$cacheTemp
            iput-object v$cacheTemp, v$builder, $field
        """.trimIndent(),
    )

    val source = (code[site.sourceRead] as OneRegisterInstruction).registerA
    if (source > 15) refuse("the Activity Center source sits past v15")
    val sourceTemp = method.freeLocalsAt(what, site.sourceRead + 1, 1, except = listOf(source)).single()
    method.addInstructions(
        site.sourceRead + 1,
        """
            iget-object v$sourceTemp, v$self, ${site.typeField}
            invoke-static { v$source, v$sourceTemp }, $ACTIVITY_SOURCE_HELPER
            move-result-object v$source
            check-cast v$source, $VIEWER_SOURCE
        """.trimIndent(),
    )
}
