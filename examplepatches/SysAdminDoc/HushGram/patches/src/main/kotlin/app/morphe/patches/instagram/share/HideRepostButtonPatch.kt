/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.share

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.extension.requireLocals
import app.morphe.patches.instagram.misc.extension.parameterRegisterNumber
import app.morphe.patches.instagram.misc.settings.EXTENSION_ROOT
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PATCH = "Hide the Repost button"
internal const val HIDE_REPOSTS = "$EXTENSION_PACKAGE/share/RepostButton;->hide()Z"
internal const val REPOSTS_ELIGIBLE = "$EXTENSION_PACKAGE/share/RepostButton;->eligible(Ljava/lang/Boolean;)Ljava/lang/Boolean;"
internal const val REPOSTS_FEED_UFI = "$EXTENSION_PACKAGE/share/RepostButton;->feedUfi(Landroid/view/View;Landroid/view/View;)V"
internal const val REPOSTS_FEED_COMPONENT = "$EXTENSION_PACKAGE/share/RepostButton;->feedComponent()Z"
internal const val REPOSTS_FEED_RESTORE = "$EXTENSION_PACKAGE/share/RepostButton;->restoreFeedUfi(Landroid/view/View;Landroid/view/View;)V"

/** The post model, a kept name. */
internal const val MEDIA = "Lcom/instagram/feed/media/Media;"

/**
 * The field that says whether a post or reel can be reposted. Its name predates reposts; 449's
 * clips buttons call what they read from it isEligibleForRepostsProduction. Instagram's data trees
 * key a field by its name's hash.
 */
internal const val REPOSTS_FIELD = "enable_media_notes_production"
internal val REPOSTS_HASH = REPOSTS_FIELD.hashCode()

private const val BOOLEAN = "Ljava/lang/Boolean;"
private const val BOUNCY_UFI_BUTTON = "Lcom/instagram/ui/widget/bouncyufibutton/IgBouncyUfiButtonImageView;"
private const val UFI_COUNT = "Lcom/instagram/common/ui/base/IgTextView;"

/** Feed's inflated repost icon and count in Instagram 449. */
internal const val REPOSTS_UFI_ICON_ID = 0x7f0b35bc
internal const val REPOSTS_UFI_COUNT_ID = 0x7f0b35bb
internal const val REPOSTS_LABEL_ID = 0x7f136d26

/** How far before a tree read its hash may be loaded, for a branch or two in between. */
private const val HASH_REACH = 4

/**
 * Takes the Repost button off posts and reels. Off in the default selection: reposting is one of
 * Instagram's features, so leaving it out is the user's pick.
 */
@Suppress("unused")
val hideRepostButtonPatch = bytecodePatch(
    name = "Hide the Repost button",
    description = "Takes the Repost button and its count off posts and reels, so nothing gets reposted by mistake. " +
        "Share still sends a post or reel to someone.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch, instagramExtensionPatch)
    compatibleWith(*AppCompatibilities.instagram())

    execute {
        requireStatusMethod("repostButton")
        val sites = findRepostSites()
        guardRepostGetter(sites.getter)
        sites.reads.groupBy { Triple(it.type, it.name, it.parameters) }.values.forEach(::filterRepostReads)
        hideFeedUfi(findFeedUfiSite())
        hideFeedComponent(findFeedRepostComponent())
        enableStatus("repostButton")
    }
}

private fun refuse(detail: String): Nothing = throw PatchException("$PATCH: $detail")

/** A read of the field from a post's data tree: where its move-result-object is and the register it fills. */
internal class RepostRead(val type: String, val name: String, val parameters: List<String>, val at: Int, val register: Int)

/** The post model's getter of the field, and every tree read of it outside the model. */
internal class RepostSites(val getter: String, val reads: List<RepostRead>)

/** Feed's already-inflated UFI repost views and the point before the Share button is bound. */
internal class FeedUfiSite(
    val type: String,
    val name: String,
    val parameters: List<String>,
    val insert: Int,
    val holder: Int,
    val icon: FieldReference,
    val count: FieldReference,
)

/**
 * Finds [MEDIA]'s one getter of [REPOSTS_FIELD]: an instance method taking nothing, answering a
 * Boolean, that loads the field's name and its hash and has a register to spare. Then every read
 * of the field from a data tree elsewhere: an interface call taking an int and answering a Boolean,
 * handed [REPOSTS_HASH] loaded just before it, its answer moved straight out. The model's own other
 * reads copy the field between its forms and are left alone. Fails when the getter isn't there,
 * there's more than one, or no button reads the field, since that's an update this patch hasn't
 * seen.
 */
internal fun BytecodePatchContext.findRepostSites(): RepostSites {
    val media = classDefByOrNull(MEDIA) ?: refuse("$MEDIA is missing")
    val getters = media.methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.isEmpty() && method.returnType == BOOLEAN &&
            method.holdsString(REPOSTS_FIELD) && method.holdsHash()
    }
    val getter = getters.singleOrNull() ?: refuse("expected one getter of $REPOSTS_FIELD in $MEDIA, found ${getters.size}")
    val implementation = getter.implementation!!
    if (implementation.registerCount - 1 < 1) refuse("$MEDIA->${getter.name} has no register of its own for the guard")

    val reads = mutableListOf<RepostRead>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT) || classDef.type == MEDIA) return@classDefForEach
        classDef.methods.forEach { method -> reads += method.repostReads(classDef.type) }
    }
    if (reads.isEmpty()) refuse("nothing reads $REPOSTS_FIELD from a post's data tree")
    return RepostSites(getter.name, reads)
}

/**
 * Finds the Feed UFI binder that inflates `reposts_ufi_icon` and `reposts_ufi_count`, then inserts
 * before the next bouncy UFI button field. On 449 that next button is Share, so every native repost
 * icon/count update has already run and Share remains untouched.
 */
internal fun BytecodePatchContext.findFeedUfiSite(): FeedUfiSite {
    val sites = mutableListOf<FeedUfiSite>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            val iconId = code.indexOfLiteral(REPOSTS_UFI_ICON_ID)
            val countId = code.indexOfLiteral(REPOSTS_UFI_COUNT_ID)
            if (iconId < 0 || countId < 0) return@forEach
            val icon = code.fieldStoreAfter(iconId, BOUNCY_UFI_BUTTON) ?: return@forEach
            val count = code.fieldStoreAfter(countId, UFI_COUNT) ?: return@forEach
            if (icon.holder != count.holder) {
                refuse("${classDef.type}->${method.name} stores Feed UFI icon and count on different holders")
            }
            val insert = code.indexOfFirstBouncyReadAfter(maxOf(icon.at, count.at), icon.field)
            if (insert < 0) refuse("${classDef.type}->${method.name} has Feed UFI views but no following Share button read")
            sites += FeedUfiSite(
                classDef.type,
                method.name,
                method.parameterTypes.map(CharSequence::toString),
                insert,
                icon.holder,
                icon.field,
                count.field,
            )
        }
    }
    return sites.singleOrNull()
        ?: refuse("expected one Feed UFI repost binder, found ${sites.size}")
}

/** The component-backed Feed row has its own Repost renderer, separate from the view binder. */
internal fun BytecodePatchContext.findFeedRepostComponent(): Method {
    val renders = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        classDef.methods.forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            if (!AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 1 &&
                method.parameterTypes.single().startsWith("L") && method.returnType.startsWith("L") &&
                method.holdsString("android.widget.Button") && code.indexOfLiteral(REPOSTS_UFI_ICON_ID) >= 0 &&
                code.indexOfLiteral(REPOSTS_LABEL_ID) >= 0) renders += method
        }
    }
    return renders.singleOrNull() ?: refuse("expected one Feed Repost component renderer, found ${renders.size}")
}

/** Native component rendering accepts null for an empty component; neither icon nor count mounts. */
internal fun BytecodePatchContext.hideFeedComponent(found: Method) {
    val method = mutableClassDefBy(found.definingClass).methods.single {
        it.name == found.name && it.parameterTypes.map(CharSequence::toString) == found.parameterTypes.map(CharSequence::toString) &&
            it.returnType == found.returnType
    }
    method.requireLocals(PATCH, 1)
    method.addInstructions(
        0,
        """
            invoke-static { }, $REPOSTS_FEED_COMPONENT
            move-result v0
            if-eqz v0, :draw
            const/4 v0, 0x0
            return-object v0
            :draw
            nop
        """,
    )
}

private fun Method.holdsString(value: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == value
} == true

private fun Method.holdsHash() = implementation?.instructions?.any {
    it is NarrowLiteralInstruction && it.opcode == Opcode.CONST && it.narrowLiteral == REPOSTS_HASH
} == true

private fun List<Instruction>.indexOfLiteral(value: Int) = indexOfFirst {
    it is NarrowLiteralInstruction && it.opcode == Opcode.CONST && it.narrowLiteral == value
}

private class FieldStore(val at: Int, val holder: Int, val field: FieldReference)

private fun List<Instruction>.fieldStoreAfter(start: Int, fieldType: String): FieldStore? {
    for (at in start + 1 until minOf(size, start + 12)) {
        val instruction = this[at]
        if (instruction.opcode != Opcode.IPUT_OBJECT || instruction !is TwoRegisterInstruction) continue
        val field = ((instruction as? ReferenceInstruction)?.reference as? FieldReference) ?: continue
        if (field.type == fieldType) return FieldStore(at, instruction.registerB, field)
    }
    return null
}

private fun List<Instruction>.indexOfFirstBouncyReadAfter(start: Int, skipped: FieldReference): Int {
    for (at in start + 1 until size) {
        val instruction = this[at]
        if (instruction.opcode != Opcode.IGET_OBJECT) continue
        val field = ((instruction as? ReferenceInstruction)?.reference as? FieldReference) ?: continue
        if (field.type == BOUNCY_UFI_BUTTON && field.toString() != skipped.toString()) return at
    }
    return -1
}

private fun Method.repostReads(type: String): List<RepostRead> {
    val code = implementation?.instructions?.toList() ?: return emptyList()
    val reads = mutableListOf<RepostRead>()
    for ((at, instruction) in code.withIndex()) {
        if (instruction.opcode != Opcode.INVOKE_INTERFACE && instruction.opcode != Opcode.INVOKE_INTERFACE_RANGE) continue
        val called = (instruction as ReferenceInstruction).reference as MethodReference
        if (called.returnType != BOOLEAN || called.parameterTypes.map(CharSequence::toString) != listOf("I")) continue
        // The tree, then the int it's asked for.
        val key = when (instruction) {
            is FiveRegisterInstruction -> instruction.registerD
            is RegisterRangeInstruction -> instruction.startRegister + 1
            else -> continue
        }
        if (!code.hashLoadedInto(key, at)) continue
        val result = code.getOrNull(at + 1)
        if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) refuse("$type->$name reads $REPOSTS_FIELD and drops the answer")
        reads += RepostRead(type, name, parameterTypes.map(CharSequence::toString), at + 1, (result as OneRegisterInstruction).registerA)
    }
    return reads
}

/** Whether [REPOSTS_HASH] is loaded into [register] within [HASH_REACH] instructions before [at], and nothing else writes it between. */
private fun List<Instruction>.hashLoadedInto(register: Int, at: Int): Boolean {
    for (back in (at - 1) downTo maxOf(0, at - HASH_REACH)) {
        val instruction = this[back]
        val writes = instruction is OneRegisterInstruction && instruction !is FiveRegisterInstruction &&
            instruction.registerA == register && instruction.opcode.setsRegister()
        if (!writes) continue
        return instruction is NarrowLiteralInstruction && instruction.opcode == Opcode.CONST && instruction.narrowLiteral == REPOSTS_HASH
    }
    return false
}

/**
 * First thing in the getter, asks [HIDE_REPOSTS], and on a yes answers FALSE: the post can't be
 * reposted. Otherwise the getter reads the field as it did.
 */
internal fun BytecodePatchContext.guardRepostGetter(getter: String) {
    val method = mutableClassDefBy(MEDIA).methods.single {
        it.name == getter && it.parameterTypes.isEmpty() && it.returnType == BOOLEAN
    }
    method.addInstructions(
        0,
        """
            invoke-static { }, $HIDE_REPOSTS
            move-result v0
            if-eqz v0, :read
            sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
            return-object v0
            :read
            nop
        """,
    )
}

/**
 * Right after each of one method's tree reads moves its answer out, passes it through
 * [REPOSTS_ELIGIBLE]. A range call, so the answer's register may be any.
 */
internal fun BytecodePatchContext.filterRepostReads(reads: List<RepostRead>) {
    val first = reads.first()
    val method = mutableClassDefBy(first.type).methods.single {
        it.name == first.name && it.parameterTypes.map(CharSequence::toString) == first.parameters
    }
    for (read in reads.sortedByDescending { it.at }) {
        method.addInstructions(
            read.at + 1,
            """
                invoke-static/range { v${read.register} .. v${read.register} }, $REPOSTS_ELIGIBLE
                move-result-object v${read.register}
            """,
        )
    }
}

/** Hide the Feed UFI repost views after Instagram has rebound them for this row. */
internal fun BytecodePatchContext.hideFeedUfi(site: FeedUfiSite) {
    val method = mutableClassDefBy(site.type).methods.single {
        it.name == site.name && it.parameterTypes.map(CharSequence::toString) == site.parameters
    }
    val registers = method.getFreeRegisterProvider(site.insert, 2, site.holder)
    val icon = registers.getFreeRegister()
    val count = registers.getFreeRegister()
    method.addInstructionsAtControlFlowLabel(
        site.insert,
        """
            iget-object v$icon, v${site.holder}, ${site.icon}
            iget-object v$count, v${site.holder}, ${site.count}
            invoke-static { v$icon, v$count }, $REPOSTS_FEED_UFI
        """,
    )
    // Native rebinding resets listeners/text, but not every icon's visibility. Remove only
    // our previous hide before it reads the holder, so native state always wins afterwards.
    val holderParameter = method.parameterTypes.indices.singleOrNull { method.parameterTypes[it] == site.icon.definingClass }
        ?: refuse("${site.type}->${site.name} has no unique Feed UFI holder parameter")
    method.requireLocals(PATCH, 3)
    val holder = method.parameterRegisterNumber(holderParameter)
    method.addInstructions(
        0,
        """
            move-object/from16 v0, v$holder
            iget-object v1, v0, ${site.icon}
            iget-object v2, v0, ${site.count}
            invoke-static { v1, v2 }, $REPOSTS_FEED_RESTORE
        """,
    )
}
