/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.caption

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CAPTION_ORDER = "$EXTENSION_PACKAGE/misc/CaptionOrder;"
internal const val CAPTION_ORDER_BEFORE = "$CAPTION_ORDER->before(Ljava/util/ArrayList;ILjava/lang/Object;)V"
internal const val CAPTION_ORDER_AFTER = "$CAPTION_ORDER->after(Ljava/util/ArrayList;I)Ljava/lang/Object;"
internal const val CAPTION_LAYOUT = "Lorg/telegram/ui/Components/ChatAttachAlertPhotoLayout;"
internal const val CAPTION_PHOTO_ENTRY = "Lorg/telegram/messenger/MediaController\$PhotoEntry;"
internal const val CAPTION_IS_EMPTY = "Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z"
private const val HASH_MAP = "Ljava/util/HashMap;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
internal const val CAPTION_PUT_ALL = "$HASH_MAP->putAll(Ljava/util/Map;)V"
internal const val CAPTION_ADD_ALL = "$ARRAY_LIST->addAll(Ljava/util/Collection;)Z"
private const val WHAT = "Keep captions with their photos"

@Suppress("unused")
val captionOrderPatch = bytecodePatch(
    name = "Keep captions with their photos",
    description = "When you remove or reorder photos that each have a caption in the attach menu, every caption stays with " +
        "its own photo instead of moving to the new first photo. On by default. Turn it off in HushTelegram settings > Conversations.",
    default = true,
) {
    category("Fixes")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveCaptionOrder()
        // Assembled on copies first, so a refusal leaves the app untouched.
        sites.insert(MutableMethod(ImmutableMethod.of(sites.add.method)), MutableMethod(ImmutableMethod.of(sites.update.method)))
        sites.insert(sites.add.method, sites.update.method)
        enableStatus("captionOrder")
    }
}

/** A method that changes the picked photos: the register holding the gallery as it starts, and each return with two free locals. */
internal class CaptionOrderSite(val method: MutableMethod, val layout: Int, val returns: List<Pair<Int, List<Int>>>)

/**
 * Where the caption fix goes in. The attach menu's gallery keeps the picked photos in two statics
 * of ChatAttachAlertPhotoLayout, selectedPhotos ([selected], key to photo) and selectedPhotosOrder
 * ([order], the keys in order). While the photos have their own captions (captionForAllMedia,
 * [captionForAll], answers false), the comment field holds the first photo's caption, put there by
 * the photo viewer provider's onApplyCaption ([apply] on the gallery's [provider] field), and
 * sending writes the field back into whichever photo is first then. Two methods change which photo
 * is first without touching the field: addToSelectedPhotos ([add]), which also unpicks a photo
 * picked before, and the preview's updateSelected ([update], inlined by R8 into the preview's write
 * back to the gallery), which takes the preview's order after a drag or a removal there.
 *
 * Each one hands the extension the first key and the captionForAllMedia answer as it starts, and
 * at each return asks again with captionForAllMedia's answer then: Undo of a removal in the preview
 * can bring per-photo captions back. When the first key changed and either answer was false, it
 * calls onApplyCaption, which shows the new first photo's caption in the field.
 */
internal class CaptionOrderSites(
    val add: CaptionOrderSite,
    val update: CaptionOrderSite,
    val order: String,
    val selected: String,
    val captionForAll: String,
    val provider: String,
    val providerType: String,
    val apply: String,
) {
    fun insert(add: MutableMethod, update: MutableMethod) {
        insert(add, this.add)
        insert(update, this.update)
    }

    private fun insert(method: MutableMethod, site: CaptionOrderSite) {
        // Highest index first, so the ones still to come keep their place.
        for ((at, free) in site.returns.sortedByDescending { it.first }) {
            val (answer, nothing) = free
            method.addInstructionsAtControlFlowLabel(at, """
                invoke-static {}, $captionForAll
                move-result v$nothing
                sget-object v$answer, $order
                invoke-static {v$answer, v$nothing}, $CAPTION_ORDER_AFTER
                move-result-object v$answer
                if-eqz v$answer, :hush_same
                check-cast v$answer, $providerType
                const/4 v$nothing, 0x0
                invoke-virtual {v$answer, v$nothing}, $apply
                :hush_same
                nop
            """)
        }
        // Nothing is read before the method's first instruction, so v0 to v2 are free there.
        method.addInstructions(0, """
            move-object/from16 v0, v${site.layout}
            iget-object v1, v0, $provider
            invoke-static {}, $captionForAll
            move-result v2
            sget-object v0, $order
            invoke-static {v0, v2, v1}, $CAPTION_ORDER_BEFORE
        """)
    }
}

internal fun BytecodePatchContext.resolveCaptionOrder(): CaptionOrderSites {
    requireStatusMethod("captionOrder")
    controlHook(CAPTION_ORDER, "before", listOf(ARRAY_LIST, "I", "Ljava/lang/Object;"), "V")
    controlHook(CAPTION_ORDER, "after", listOf(ARRAY_LIST, "I"), "Ljava/lang/Object;")
    val layout = tgMutableClassDefByOrNull(CAPTION_LAYOUT)
    controlShape(layout != null, "the attach menu's gallery is missing")

    // The two statics, from the getters that kept their names.
    fun staticOf(getter: String, type: String): String {
        val method = layout!!.methods.filter { it.origName == getter && it.parameterTypes.isEmpty() && it.returnType == type }
            .controlSingle("the gallery's $getter")
        val read = method.controlBody().filter { it.opcode == Opcode.SGET_OBJECT }.controlSingle("the static $getter reads")
        return read.controlRef()!!.also { controlShape(it.endsWith(":$type"), "$getter reads another type") }
    }
    val order = staticOf("getSelectedPhotosOrder", ARRAY_LIST)
    val selected = staticOf("getSelectedPhotos", HASH_MAP)
    fun Method.readsBoth() = controlBody().let { body ->
        body.any { it.opcode == Opcode.SGET_OBJECT && it.controlRef() == order } &&
            body.any { it.opcode == Opcode.SGET_OBJECT && it.controlRef() == selected }
    }

    val forAll = layout!!.methods.filter { m ->
        m.parameterTypes.isEmpty() && m.returnType == "Z" && m.readsBoth() &&
            m.controlBody().any { it.opcode == Opcode.INVOKE_STATIC && it.controlRef() == CAPTION_IS_EMPTY }
    }.controlSingle("the gallery's captionForAllMedia")
    // Asked at returns too, where no register is sure to still hold the gallery.
    controlShape(AccessFlags.STATIC.isSet(forAll.accessFlags), "the gallery's captionForAllMedia is no longer static")

    // The photo viewer provider: the field whose class loads the first photo's caption into the comment field.
    val providers = layout.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }.mapNotNull { field ->
        val type = tgClassDefByOrNull(field.type) ?: return@mapNotNull null
        val apply = type.methods.filter { m ->
            !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "V" &&
                m.parameterTypes.map { it.toString() } == listOf("Ljava/lang/CharSequence;") && m.readsBoth()
        }
        if (apply.size == 1) Triple(field, type, apply.single()) else null
    }
    val (providerField, providerType, apply) = providers.controlSingle("the gallery's photo viewer provider")
    controlShape(listOf(providerField.accessFlags, apply.accessFlags, forAll.accessFlags).none { AccessFlags.PRIVATE.isSet(it) },
        "the gallery keeps its provider or captionForAllMedia private")

    val add = layout.methods.filter { m ->
        m.origParameterTypes == listOf(CAPTION_PHOTO_ENTRY, "I") && m.origReturnType == "I" &&
            m.controlBody().any { it.opcode == Opcode.SGET_OBJECT && it.controlRef() == selected }
    }.controlSingle("the gallery's addToSelectedPhotos")
    controlShape(!AccessFlags.STATIC.isSet(add.accessFlags), "the gallery's addToSelectedPhotos became static")

    val updates = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        for (method in cls.methods) if (method.takesTheOrder(selected, order)) updates += cls to method
    }
    val (updateClass, updateStock) = updates.controlSingle("the preview's write back to the gallery")
    val updateParameters = updateStock.parameterTypes.map { it.toString() }
    val update = tgMutableClassDefBy(updateClass).methods.single {
        it.name == updateStock.name && it.parameterTypes.map { type -> type.toString() } == updateParameters
    }

    return CaptionOrderSites(
        site(add, add.localRegisterCount()),
        site(update, layoutRegister(update, updateClass.type)),
        order, selected,
        "${forAll.definingClass}->${forAll.name}()Z",
        "${providerField.definingClass}->${providerField.name}:${providerField.type}", providerType.type,
        "${apply.definingClass}->${apply.name}(Ljava/lang/CharSequence;)V",
    )
}

/** The register holding the gallery as [method] starts: this in the gallery's own method, else its one gallery parameter. */
private fun layoutRegister(method: MutableMethod, owner: String): Int {
    val static = AccessFlags.STATIC.isSet(method.accessFlags)
    val first = method.localRegisterCount()
    if (!static && owner == CAPTION_LAYOUT) return first
    val types = method.parameterTypes.map { it.toString() }
    val at = types.indices.filter { types[it] == CAPTION_LAYOUT }.controlSingle("the preview's gallery parameter")
    return first + (if (static) 0 else 1) + types.take(at).sumOf { if (it == "J" || it == "D") 2 else 1 }
}

private fun site(method: MutableMethod, layout: Int): CaptionOrderSite {
    controlShape(method.localRegisterCount() >= 3, "${method.name} has fewer than three locals")
    controlShape(ControlFlow.of(method).normal.none { 0 in it }, "something jumps back to the start of ${method.name}")
    val body = method.controlBody()
    val returns = body.indices.filter { body[it].opcode in RETURNS }
    controlShape(returns.isNotEmpty(), "${method.name} never returns")
    return CaptionOrderSite(method, layout, returns.map { it to method.freeLocalsAt(WHAT, it, 2) })
}

/** Refills [selected] with HashMap.putAll and [order] with ArrayList.addAll, each on a fresh read of the static. */
private fun Method.takesTheOrder(selected: String, order: String): Boolean {
    val body = controlBody()
    if (body.none { it.opcode == Opcode.SGET_OBJECT && it.controlRef() == selected }) return false
    fun fills(call: String, field: String) = body.indices.any { at ->
        body[at].opcode == Opcode.INVOKE_VIRTUAL && body[at].controlRef() == call && readFrom(body, at) == field
    }
    return fills(CAPTION_PUT_ALL, selected) && fills(CAPTION_ADD_ALL, order)
}

/** The static the call at [at] was made on, when only other calls on it (its clear) come between the read and the call. */
private fun readFrom(body: List<Instruction>, at: Int): String? {
    val receiver = (body[at] as FiveRegisterInstruction).registerC
    for (back in at - 1 downTo maxOf(0, at - 4)) {
        val instruction = body[back]
        if (instruction.opcode == Opcode.SGET_OBJECT && (instruction as OneRegisterInstruction).registerA == receiver) {
            return instruction.controlRef()
        }
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL) return null
    }
    return null
}

private val RETURNS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT)
