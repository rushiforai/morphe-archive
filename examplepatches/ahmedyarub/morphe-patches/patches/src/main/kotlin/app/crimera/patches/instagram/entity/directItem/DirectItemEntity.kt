/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.entity.directItem

import app.crimera.utils.changeFirstString
import app.crimera.utils.changeString
import app.crimera.utils.classNameToExtension
import app.morphe.library.instagram.patches.instagramExtensionPatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val MEDIA_CLASS = "Lcom/instagram/feed/media/Media;"
private const val DIRECT_THREAD_KEY = "Lcom/instagram/model/direct/DirectThreadKey;"

private fun Instruction.isConstString(value: String) =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        (this as ReferenceInstruction).reference.toString() == value

private val ClassDef.methodInstructions
    get() = methods.mapNotNull { method -> method.implementation?.instructions?.toList() }

/**
 * Resolves every obfuscated DirectItem field name at patch time and bakes it into the
 * {@code DirectItem} extension entity, so the runtime never has to discover field/method
 * names by reflection. See {@code mediaDataEntity} for the reference pattern.
 *
 * Every name is required. Each used to be best effort, so a build that moved one left the
 * extension reading a placeholder field and quietly finding nothing.
 */
val directItemEntity =
    bytecodePatch(
        description = "Decodes obfuscated DirectItem (DM) field names at patch time.",
    ) {
        dependsOn(instagramExtensionPatch)
        execute {
            val itemClass = classDefBy(DirectItemDispatchFingerprint.originalClassDef.type)

            // The field the parser stores a key's value in: the first iput after the key.
            fun fieldAfter(key: String): FieldReference =
                itemClass.methodInstructions.firstNotNullOfOrNull { instructions ->
                    val keyIndex = instructions.indexOfFirst { it.isConstString(key) }
                    if (keyIndex < 0) return@firstNotNullOfOrNull null
                    instructions.drop(keyIndex + 1)
                        .firstOrNull { it.opcode.name.startsWith("iput", ignoreCase = true) }
                        ?.let { (it as ReferenceInstruction).reference as FieldReference }
                } ?: throw PatchException("No field is stored after '$key' in ${itemClass.type}")

            // As above, restricted to object fields.
            fun objectFieldAfter(key: String): FieldReference =
                itemClass.methodInstructions.firstNotNullOfOrNull { instructions ->
                    val keyIndex = instructions.indexOfFirst { it.isConstString(key) }
                    if (keyIndex < 0) return@firstNotNullOfOrNull null
                    instructions.drop(keyIndex + 1)
                        .firstOrNull { it.opcode == Opcode.IPUT_OBJECT }
                        ?.let { (it as ReferenceInstruction).reference as FieldReference }
                } ?: throw PatchException("No object field is stored after '$key' in ${itemClass.type}")

            val itemId = fieldAfter("item_id")
            GetItemIdExtension.changeFirstString(itemId.name)
            GetBaseClassNameExtension.changeFirstString(classNameToExtension(itemId.definingClass))

            GetUserIdExtension.changeFirstString(fieldAfter("user_id").name)

            val textField = fieldAfter("text").name
            GetTextExtension.changeString("baseTextField", textField)
            SetTextExtension.changeString("baseTextField", textField)

            GetTimestampRawExtension.changeFirstString(fieldAfter("timestamp").name)

            val hideField = fieldAfter("hide_in_thread").name
            IsHideInThreadExtension.changeFirstString(hideField)
            SetHideInThreadExtension.changeFirstString(hideField)

            IsSentByViewerExtension.changeFirstString(fieldAfter("is_sent_by_viewer").name)

            GetThreadKeyExtension.changeFirstString(fieldAfter("thread_key").name)

            resolveItemType(itemId)
            resolveMedia(::objectFieldAfter, itemClass)
            resolveXmaLink(itemClass)

            // DirectThreadKey is stable but its thread-id field is obfuscated: first String instance field.
            val threadIdField =
                classDefBy(DIRECT_THREAD_KEY).fields.firstOrNull {
                    !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == "Ljava/lang/String;"
                }?.name ?: throw PatchException("DirectThreadKey has no thread id field")
            GetThreadIdExtension.changeFirstString(threadIdField)
        }
    }

/** The item type, and the field MQTT items keep their text in. */
context(patchContext: BytecodePatchContext)
private fun resolveItemType(itemId: FieldReference) {
    // item_type: the only enum with 2+ fields on the base class; primary sorts last by name.
    val baseDescriptor = itemId.definingClass
    val baseClass = patchContext.classDefBy(baseDescriptor)

    fun isEnumType(type: String) = patchContext.classDefByOrNull(type)?.superclass == "Ljava/lang/Enum;"

    val itemTypeField =
        baseClass.fields
            .filter { !AccessFlags.STATIC.isSet(it.accessFlags) && isEnumType(it.type) }
            .groupBy { it.type }
            .maxByOrNull { it.value.size }
            ?.value
            ?.maxByOrNull { it.name }
            ?: throw PatchException("Could not identify the item type field on $baseDescriptor")
    GetItemTypeExtension.changeFirstString(itemTypeField.name)

    // MQTT items store text in an Object field on the subclass, set after the item-type setter.
    val subClass =
        patchContext.classDefByOrNull { it.superclass == baseDescriptor }
            ?: throw PatchException("$baseDescriptor has no subclass")
    val subTextField =
        subClass.methodInstructions.firstNotNullOfOrNull { instructions ->
            instructions.indices.firstNotNullOfOrNull { index ->
                val reference = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                if (instructions[index].opcode != Opcode.INVOKE_VIRTUAL || reference == null ||
                    reference.parameterTypes.singleOrNull()?.toString() != itemTypeField.type
                ) {
                    return@firstNotNullOfOrNull null
                }
                instructions.drop(index + 1).take(3)
                    .firstOrNull { it.opcode.name.startsWith("iput", true) }
                    ?.let { (it as ReferenceInstruction).reference as? FieldReference }
                    ?.takeIf { it.type == "Ljava/lang/Object;" }
                    ?.name
            }
        } ?: throw PatchException("Could not identify the MQTT text field on ${subClass.type}")
    GetTextExtension.changeString("subTextField", subTextField)
    SetTextExtension.changeString("subTextField", subTextField)
}

/**
 * Every supported DM media shape carries a com.instagram.feed.media.Media object, the unobfuscated
 * anchor, whose field is found by its JSON key on the deserializer.
 *
 * animated_media, story_share, xma and link are intentionally not resolved: their URL sits in an
 * obfuscated wrapper with no stable type or getter to anchor on, so those shapes degrade to a
 * "[type]" label at runtime. See DirectItem.getMediaUrl().
 */
context(patchContext: BytecodePatchContext)
private fun resolveMedia(
    objectFieldAfter: (String) -> FieldReference,
    itemClass: ClassDef,
) {
    // The concrete item class the media fields are declared on, a subclass of the scalar base,
    // which is why media must be read off it. Class.forName needs the binary name (X.6fW).
    GetMediaClassNameExtension.changeFirstString(classNameToExtension(objectFieldAfter("media").definingClass))

    fun direct(
        key: String,
        fingerprint: Fingerprint,
    ) {
        val field = objectFieldAfter(key)
        if (field.type != MEDIA_CLASS) throw PatchException("'$key' is not stored as Media")
        fingerprint.changeFirstString(field.name)
    }
    direct("media", FieldMediaExtension)
    direct("media_share", FieldMediaShareExtension)
    direct("raven_media", FieldRavenMediaExtension)

    // Wrapped shapes: the wrapper field on the item, then the wrapper's Media field, found by type
    // so the obfuscated wrapper name is never depended on.
    fun wrapped(
        key: String,
        wrapperFingerprint: Fingerprint,
        innerFingerprint: Fingerprint,
    ) {
        val wrapperField = objectFieldAfter(key)
        val inner =
            patchContext.classDefBy(wrapperField.type).fields.firstOrNull { it.type == MEDIA_CLASS }
                ?: throw PatchException("The '$key' wrapper holds no Media")
        wrapperFingerprint.changeFirstString(wrapperField.name)
        innerFingerprint.changeFirstString(inner.name)
    }
    wrapped("clip", FieldClipExtension, FieldClipMediaExtension)
    wrapped("reel_share", FieldReelExtension, FieldReelMediaExtension)
    wrapped("voice_media", FieldVoiceExtension, FieldVoiceMediaExtension)
    // Disappearing media: carries the payload that raven_media leaves null.
    wrapped("visual_media", FieldVisualExtension, FieldVisualMediaExtension)
}

/**
 * An xma reshare (a shared post or reel) has no Media object; the item holds a List of xma
 * elements whose permalink is a String under the JSON key "target_url".
 *
 * The item stores four such lists, all built by the same converter, so the one wanted is found by
 * following the "xma_*" reshare keys' branch: each does equals -> if-nez -> a shared block, whose
 * List iput and converter call pin the field and the element's parser.
 */
context(patchContext: BytecodePatchContext)
private fun resolveXmaLink(itemClass: ClassDef) {
    // Only the deserializer stores target_url with an iput; the serializer uses a call.
    fun targetUrlField(parserType: String): FieldReference? =
        patchContext.classDefByOrNull(parserType)?.methodInstructions?.firstNotNullOfOrNull { instructions ->
            val keyIndex = instructions.indexOfFirst { it.isConstString("target_url") }
            if (keyIndex < 0) return@firstNotNullOfOrNull null
            instructions.drop(keyIndex + 1)
                .takeWhile { it.opcode != Opcode.CONST_STRING && it.opcode != Opcode.CONST_STRING_JUMBO }
                .firstOrNull {
                    it.opcode == Opcode.IPUT_OBJECT &&
                        ((it as ReferenceInstruction).reference as? FieldReference)?.type == "Ljava/lang/String;"
                }?.let { (it as ReferenceInstruction).reference as FieldReference }
        }

    for (instructions in itemClass.methodInstructions) {
        val xmaKeyIndex =
            instructions.indexOfFirst {
                (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                    (it as ReferenceInstruction).reference.toString().startsWith("xma_")
            }
        if (xmaKeyIndex < 0) continue
        val ifNez = instructions.drop(xmaKeyIndex + 1).firstOrNull { it.opcode == Opcode.IF_NEZ } ?: continue

        var address = 0
        val addresses = instructions.map { instruction -> address.also { address += instruction.codeUnits } }
        val ifNezIndex = instructions.indexOf(ifNez)
        val targetIndex = addresses.indexOf(addresses[ifNezIndex] + (ifNez as OffsetInstruction).codeOffset)
        if (targetIndex < 0) continue

        val block = instructions.drop(targetIndex)
        val listField =
            block.firstOrNull {
                it.opcode == Opcode.IPUT_OBJECT &&
                    ((it as ReferenceInstruction).reference as? FieldReference)?.type == "Ljava/util/List;"
            }?.let { (it as ReferenceInstruction).reference as FieldReference } ?: continue
        // The call is declared on the abstract base, so the parser class comes from the sget.
        val parseIndex =
            block.indexOfFirst {
                it.opcode == Opcode.INVOKE_VIRTUAL &&
                    ((it as ReferenceInstruction).reference as? MethodReference)?.name == "parseFromJsonParser"
            }
        if (parseIndex < 0) continue
        val parserType =
            block.take(parseIndex)
                .lastOrNull { it.opcode == Opcode.SGET_OBJECT }
                ?.let { (it as ReferenceInstruction).reference as? FieldReference }
                ?.type ?: continue
        val linkField = targetUrlField(parserType) ?: continue

        FieldXmaExtension.changeFirstString(listField.name)
        FieldXmaLinkExtension.changeFirstString(linkField.name)
        return
    }

    throw PatchException("Could not identify the xma reshare fields on ${itemClass.type}")
}
