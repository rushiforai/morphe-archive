/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-22.
 */
package app.morphe.patches.youtube.shorts.components

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.youtube.utils.extension.Constants.SHORTS_PATH
import app.morphe.util.findMethodOrThrow
import app.morphe.util.fingerprint.matchOrNull
import app.morphe.util.getReference
import app.morphe.util.or
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val TARGET = "$SHORTS_PATH/ShortsDownloadTarget;"
private const val SOURCE = "$SHORTS_PATH/ShortsDownloadTarget\$Source;"
private const val OPTIONAL = "Lj\$/util/Optional;"
private const val STRING = "Ljava/lang/String;"
private const val REEL_WATCH_ENDPOINT_EXTENSION = 139608561L

private val reelWatchFragment = Fingerprint(
    name = "<clinit>",
    filters = listOf(string("\$ReelSequenceControllerStateKey")),
)

private val reelWatchFragmentResume = Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        string("r_fr"),
        methodCall(opcode = Opcode.INVOKE_SUPER, parameters = emptyList(), returnType = "V"),
        string("r_ipl"),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf(STRING),
            returnType = "V",
            location = MatchAfterImmediately(),
        ),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = emptyList(),
            returnType = "Z",
            location = MatchAfterImmediately(),
        ),
        string("ReelWatchFragment.initiatePlayback failed because the fragment is not resumed."),
    ),
)

// This stock method returns the selected item's identifier, not its video ID.
// Match it only to recover the controller, its selected-item accessor and the item type.
private val activeReelIdentifier = Fingerprint(
    returnType = OPTIONAL,
    parameters = emptyList(),
    filters = listOf(
        methodCall(opcode = Opcode.INVOKE_VIRTUAL, parameters = emptyList(), returnType = OPTIONAL),
        methodCall(smali = "$OPTIONAL->get()Ljava/lang/Object;"),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        opcode(Opcode.CHECK_CAST, location = MatchAfterImmediately()),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = emptyList(),
            returnType = STRING,
            location = MatchAfterImmediately(),
        ),
        opcode(Opcode.MOVE_RESULT_OBJECT, location = MatchAfterImmediately()),
        methodCall(smali = "$OPTIONAL->of(Ljava/lang/Object;)$OPTIONAL", location = MatchAfterImmediately()),
    ),
)

private val reelWatchEndpoint = Fingerprint(
    name = "<clinit>",
    filters = listOf(literal(REEL_WATCH_ENDPOINT_EXTENSION), methodCall(name = "newSingularGeneratedExtension")),
)

private fun ClassDef.videoIdField(): FieldReference? {
    val instructions = methods.singleOrNull { it.name == "dynamicMethod" }
        ?.implementation?.instructions?.toList() ?: return null
    val metadataIndex = instructions.indexOfFirst {
        it.getReference<MethodReference>()?.name == "newMessageInfo"
    }
    val metadataCall = instructions.getOrNull(metadataIndex) as? FiveRegisterInstruction ?: return null
    if (metadataCall.registerCount != 3) return null

    val metadataLoad = instructions.getOrNull(metadataIndex - 1) ?: return null
    if ((metadataLoad as? OneRegisterInstruction)?.registerA != metadataCall.registerD) return null
    val metadata = metadataLoad.getReference<StringReference>()?.string ?: return null
    val slot = reelVideoIdSlot(metadata) ?: return null

    // R8 builds the generated Object[] via const-string, const-index, aput-object.
    val fieldName = instructions.subList(0, metadataIndex).windowed(3).mapNotNull { (name, index, store) ->
        if (store.opcode != Opcode.APUT_OBJECT) return@mapNotNull null
        val registers = store as ThreeRegisterInstruction
        if (registers.registerB != metadataCall.registerE ||
            registers.registerA != (name as? OneRegisterInstruction)?.registerA ||
            registers.registerC != (index as? OneRegisterInstruction)?.registerA ||
            (index as? WideLiteralInstruction)?.wideLiteral != slot.toLong()
        ) return@mapNotNull null

        name.getReference<StringReference>()?.string
    }.singleOrNull() ?: return null
    return fields.singleOrNull {
        it.name == fieldName && it.type == STRING && AccessFlags.PUBLIC.isSet(it.accessFlags) &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }
}

/** Protobuf lite's generated metadata lists oneof/has-bit slots before its sorted field records. */
internal fun reelVideoIdSlot(metadata: String): Int? {
    val prefix = IntArray(12)
    var offset = 0
    for (index in prefix.indices) {
        var shift = 0
        while (true) {
            val unit = metadata.getOrNull(offset++)?.code ?: return null
            if (unit < 0xd800) {
                prefix[index] = prefix[index] or (unit shl shift)
                break
            }
            prefix[index] = prefix[index] or ((unit and 0x1fff) shl shift)
            shift += 13
            if (shift >= 32) return null
        }
    }

    // The first field must be wire field 1, a non-oneof string. Field 53 is the reel identifier.
    if (prefix[1] <= 0 || prefix[4] != 1 || prefix[10] != 1 || (prefix[11] and 0xff) != 8) return null
    return prefix[2] * 2 + prefix[3]
}

private fun ClassDef.reelEndpointGetter(endpoint: String, extension: FieldReference): Method? =
    methods.singleOrNull { method ->
        method.parameters.isEmpty() && method.returnType == endpoint && AccessFlags.PUBLIC.isSet(method.accessFlags) &&
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation?.instructions?.any {
                it.opcode == Opcode.SGET_OBJECT && it.getReference<FieldReference>() == extension
            } == true
    }

internal fun BytecodePatchContext.hookShortsDownloadTarget(): Boolean {
    // Modern Shorts must not fall back to IDs observed in prefetched Litho or player responses.
    findMethodOrThrow(TARGET) { name == "usesNativeSource" }.returnEarly(true)

    val fragment = reelWatchFragment.matchOrNull() ?: return false
    val resume = reelWatchFragmentResume.matchOrNull(fragment.originalClassDef) ?: return false
    val identifier = activeReelIdentifier.matchOrNull(fragment.originalClassDef) ?: return false

    val superResume = resume.instructionMatches[1]
    val receiver = superResume.getInstruction<FiveRegisterInstruction>().registerC
    val resumedCheck = resume.instructionMatches[4]
    if (resumedCheck.getInstruction<FiveRegisterInstruction>().registerC != receiver) return false

    val selector = identifier.instructionMatches.first()
    val controllerRead = identifier.originalMethod.implementation?.instructions?.firstOrNull() ?: return false
    val controller = controllerRead.getReference<FieldReference>() ?: return false
    if (controllerRead.opcode != Opcode.IGET_OBJECT || controller.definingClass != fragment.originalClassDef.type ||
        controller.type != selector.methodReference.definingClass ||
        (controllerRead as TwoRegisterInstruction).registerA !=
            selector.getInstruction<FiveRegisterInstruction>().registerC
    ) return false
    val pageType = identifier.instructionMatches[3].instruction.getReference<TypeReference>()?.type ?: return false
    val page = classDefByOrNull(pageType) ?: return false

    val endpoint = reelWatchEndpoint.matchOrNull() ?: return false
    val endpointType = endpoint.originalClassDef.type
    val extensionStore = endpoint.originalMethod.implementation?.instructions
        ?.elementAtOrNull(endpoint.instructionMatches.last().index + 2) ?: return false
    val extension = extensionStore.getReference<FieldReference>() ?: return false
    if (extensionStore.opcode != Opcode.SPUT_OBJECT || extension.definingClass != endpointType) return false
    val getEndpoint = page.reelEndpointGetter(endpointType, extension) ?: return false
    val videoId = endpoint.originalClassDef.videoIdField() ?: return false

    val fragmentClass = fragment.classDef
    fragmentClass.interfaces.add(SOURCE)
    fragmentClass.methods.add(
        ImmutableMethod(
            fragmentClass.type,
            "patch_getActiveShortDownloadId",
            emptyList(),
            STRING,
            AccessFlags.PUBLIC or AccessFlags.FINAL,
            null,
            null,
            MutableMethodImplementation(3),
        ).toMutable().apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual {p0}, ${resumedCheck.methodReference}
                    move-result v0
                    if-eqz v0, :unavailable
                    iget-object v0, p0, $controller
                    if-eqz v0, :unavailable
                    invoke-virtual {v0}, ${selector.methodReference}
                    move-result-object v0
                    const/4 v1, 0x0
                    invoke-virtual {v0, v1}, $OPTIONAL->orElse(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v0
                    if-eqz v0, :unavailable
                    check-cast v0, $pageType
                    invoke-virtual {v0}, $getEndpoint
                    move-result-object v0
                    if-eqz v0, :unavailable
                    iget-object v0, v0, $videoId
                    return-object v0
                    :unavailable
                    const/4 v0, 0x0
                    return-object v0
                """,
            )
        },
    )

    // This precedes the flag-controlled native provider and runs for either flyout renderer.
    resume.method.addInstruction(
        superResume.index + 1,
        "invoke-static/range {v$receiver .. v$receiver}, $TARGET->onReelResumed($SOURCE)V",
    )
    return true
}
