/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-26.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.getReference
import app.morphe.util.addFreeRegisters
import app.morphe.util.fingerprint.matchSingle
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField

private const val OBJECT = "Ljava/lang/Object;"
private const val PROTO = "Lcom/google/protobuf/MessageLite;"
private const val CONTEXT = "Landroid/content/Context;"
private const val EXECUTOR = "Ljava/util/concurrent/Executor;"
private const val MODEL_BRIDGE = "rvxSavedPageModel"
private const val PARSER_FIELD = "rvxSavedPageParserProvider"

/** The stock byte-array parser also registers field 777 before returning the native renderable protobuf. */
internal fun BytecodePatchContext.prepareSavedPlaylistModel(
    page: MutableClass, serviceRef: FieldReference, modelInit: MethodReference, default: FieldReference,
): () -> Unit {
    val parser = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = PROTO,
        parameters = listOf("[B", PROTO),
        strings = listOf("Exception while parsing InnerTube response"),
        custom = { method, _ ->
            !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation!!.instructions.any {
                val call = it.getReference<MethodReference>()
                it.opcode == Opcode.INVOKE_VIRTUAL && call?.returnType == "V" && call.parameterTypes.size == 3 &&
                    call.parameterTypes[1] == "Ljava/lang/Class;" && call.parameterTypes[2] == "[B"
            }
        },
    ).matchSingle().method
    val service = mutableClassDefBy(serviceRef.type)
    val serviceInit = service.methods.single { it.name == "<init>" }
    val identity = serviceInit.parameterTypes[2].toString()

    // Read the lazy parser provider from the same app component that supplies the stock disk-cache adapters.
    val cacheFactory = Fingerprint(
        accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
        returnType = OBJECT, parameters = emptyList(),
        custom = { method, _ -> cacheParserProvider(method, parser.definingClass, identity) != null },
    ).matchSingle().method
    val (provider, get) = checkNotNull(cacheParserProvider(cacheFactory, parser.definingClass, identity))
    val serviceFactory = Fingerprint(
        accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
        returnType = OBJECT, parameters = emptyList(),
        custom = { method, _ -> method.implementation?.instructions?.any {
            it.opcode == Opcode.INVOKE_DIRECT_RANGE && it.getReference<MethodReference>() == serviceInit
        } == true },
    ).matchSingle()
    val component = serviceFactory.classDef.fields.single {
        it.type == provider.definingClass && !AccessFlags.STATIC.isSet(it.accessFlags)
    }
    val factory = serviceFactory.method
    val code = factory.implementation!!.instructions.toList()
    val construction = code.indices.single { code[it].getReference<MethodReference>() == serviceInit }
    val serviceRegister = (code[construction] as RegisterRangeInstruction).startRegister
    val scratch = if (serviceRegister == 0) 1 else 0
    check(serviceRegister < 16 && returnsConstructedService(code, construction + 1, serviceRegister)) {
        "browse: no scratch register after the service factory constructor"
    }
    val parserField = "${service.type}->$PARSER_FIELD:${provider.type}"

    return {
        service.instanceFields.add(ImmutableField(
            service.type, PARSER_FIELD, provider.type, AccessFlags.PUBLIC.value, null, emptySet(), emptySet(),
        ).toMutable())
        // Stock can reuse its original receiver register for a constructor argument. Keep the real p0 separate.
        val (preservedFactory, parameterMoves) = factory.addFreeRegisters(1)
        preservedFactory.addInstructions(construction + parameterMoves + 1, """
            move-object/from16 v$scratch, p0
            iget-object v$scratch, v$scratch, $component
            iget-object v$scratch, v$scratch, $provider
            iput-object v$scratch, v$serviceRegister, $parserField
        """)
        service.addDownloadsBridge(MODEL_BRIDGE, listOf("[B"), OBJECT, 4, """
            iget-object v0, p0, $parserField
            if-eqz v0, :rvx_no_model
            invoke-interface {v0}, $get
            move-result-object v0
            check-cast v0, ${parser.definingClass}
            sget-object v1, $default
            invoke-virtual {v0, p1, v1}, $parser
            move-result-object v0
            if-eqz v0, :rvx_no_model
            check-cast v0, ${default.type}
            new-instance v1, ${modelInit.definingClass}
            invoke-direct {v1, v0}, $modelInit
            return-object v1
            :rvx_no_model
            const/4 v0, 0x0
            return-object v0
        """)
        page.addDownloadsBridge(MODEL_BRIDGE, listOf("[B"), OBJECT, 3, """
            iget-object v0, p0, $serviceRef
            invoke-virtual {v0, p1}, ${service.type}->$MODEL_BRIDGE([B)$OBJECT
            move-result-object v0
            return-object v0
        """)
    }
}

private fun cacheParserProvider(
    method: Method, parserType: String, identity: String,
): Pair<FieldReference, MethodReference>? {
    val code = method.implementation?.instructions?.toList() ?: return null
    for (index in 5 until code.size) {
        val constructor = code[index].getReference<MethodReference>() ?: continue
        if (code[index].opcode != Opcode.INVOKE_DIRECT_RANGE || constructor.name != "<init>" ||
            constructor.parameterTypes.size != 5 || constructor.parameterTypes[0] != CONTEXT ||
            constructor.parameterTypes[1] != identity || constructor.parameterTypes[3] != EXECUTOR ||
            constructor.parameterTypes[4] != parserType) continue

        // The generated factory gets the provider, casts its result, then passes it to the cache constructor.
        val load = code[index - 5]
        val get = code[index - 4]
        val result = code[index - 3] as? OneRegisterInstruction ?: continue
        val move = code[index - 2] as? TwoRegisterInstruction ?: continue
        val cast = code[index - 1] as? OneRegisterInstruction ?: continue
        if (load.opcode != Opcode.IGET_OBJECT || get.opcode != Opcode.INVOKE_INTERFACE ||
            result.opcode != Opcode.MOVE_RESULT_OBJECT || move.opcode != Opcode.MOVE_OBJECT ||
            cast.opcode != Opcode.CHECK_CAST || cast.getReference<TypeReference>()?.type != parserType) continue

        val call = code[index] as RegisterRangeInstruction
        if ((load as TwoRegisterInstruction).registerA != (get as FiveRegisterInstruction).registerC ||
            result.registerA != move.registerB || move.registerA != cast.registerA ||
            cast.registerA != call.startRegister + call.registerCount - 1) continue

        val field = load.getReference<FieldReference>() ?: continue
        val accessor = get.getReference<MethodReference>() ?: continue
        if (field.type == accessor.definingClass && accessor.parameterTypes.isEmpty() &&
            accessor.returnType == OBJECT) return field to accessor
    }
    return null
}

private fun returnsConstructedService(code: List<Instruction>, index: Int, serviceRegister: Int): Boolean {
    val next = code[index]
    if (next.opcode == Opcode.RETURN_OBJECT) return (next as OneRegisterInstruction).registerA == serviceRegister
    if (next.opcode != Opcode.MOVE_OBJECT_FROM16) return false

    val move = next as TwoRegisterInstruction
    val returned = code[index + 1]
    return move.registerB == serviceRegister && returned.opcode == Opcode.RETURN_OBJECT &&
        (returned as OneRegisterInstruction).registerA == move.registerA
}
