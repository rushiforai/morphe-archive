package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val PROGRAMMABLE_NG = "Lapp/morphe/extension/chmate/ProgrammableNgController;"
private const val HIDDEN_ID_NG = "Lapp/morphe/extension/chmate/HiddenIdNg;"

/** Exact legacy hooks. Structural checks abort instead of patching a similar-looking method. */
internal fun BytecodePatchContext.patchProgrammableNg191() {
    patchPosterIdChainNg()
    patchFirstResponseNg()
    check(packageMetadata.versionName == "0.8.10.191 dev")
    val titleFilter = mutableClassDefBy("Lo/r8lambdaGCnF6WpW_bFarRe7yCX2B6KzQ;").methods.single {
        it.name == "c" && it.returnType == "Ljava/util/ArrayList;" &&
            it.parameters.map(CharSequence::toString) == listOf(
                "Ljava/util/ArrayList;", "Lo/mgExternalSyntheticLambda0;", "Ljava/util/ArrayList;"
            )
    }
    val titleReturns = titleFilter.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_OBJECT)
            index to (instruction as OneRegisterInstruction).registerA else null
    }
    check(titleReturns.size == 1) { "191 programmable NG title hook changed" }
    titleReturns.asReversed().forEach { (index, register) ->
        titleFilter.replaceInstruction(index, "move-object/16 p1, v$register")
        titleFilter.addInstructionsWithLabels(index + 1, """
            invoke-static/range {p0 .. p3}, $PROGRAMMABLE_NG->filterLegacyThreadRows(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)Ljava/util/ArrayList;
            move-result-object v$register
            return-object v$register
        """)
    }

    val adapterOwner = "Lo/m9ExternalSyntheticLambda1;"
    val adapter = mutableClassDefBy(adapterOwner)
    val rebuild = adapter.methods.single {
        it.name == "c" && it.returnType == "V" && it.parameters.map(CharSequence::toString) == listOf("Z")
    }
    check(rebuild.implementation!!.instructions.any {
        val reference = (it as? ReferenceInstruction)?.reference as? FieldReference
        reference?.definingClass == adapterOwner && reference.name == "K"
    }) { "191 programmable NG response model anchor changed" }
    rebuild.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p0}, $PROGRAMMABLE_NG->prepareLegacyResponses(Ljava/lang/Object;)V
    """)

    val responseFilter = adapter.methods.single {
        it.name == "SE_" && it.returnType == "I" &&
            it.parameters.map(CharSequence::toString) == listOf(
                "Lo/processAdDisplayErrorPostbackForUserError;", "Z", "Landroid/util/SparseIntArray;"
            )
    }
    val responseReturns = responseFilter.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN)
            index to (instruction as OneRegisterInstruction).registerA else null
    }
    check(responseReturns.size == 2) { "191 programmable NG response hook changed" }
    responseReturns.asReversed().forEach { (index, register) ->
        responseFilter.replaceInstruction(index, "move/16 p2, v$register")
        responseFilter.addInstructionsWithLabels(index + 1, """
            invoke-static/range {p0 .. p2}, $PROGRAMMABLE_NG->mergeLegacyResponseFlags(Ljava/lang/Object;Ljava/lang/Object;I)I
            move-result v$register
            return v$register
        """)
    }
}

/** 226 dev still computes the standard NGWord bit per response. */
internal fun BytecodePatchContext.patchProgrammableNg226() {
    patchPosterIdChainNg()
    patchFirstResponseNg()
    check(packageMetadata.versionName == "0.8.10.226 dev")
    val adapter = mutableClassDefBy("Lo/listener;")
    val rebuild = adapter.methods.single {
        it.name == "b" && it.returnType == "V" && it.parameterTypes == listOf("Z")
    }
    check(rebuild.implementation!!.instructions.any {
        val ref = (it as? ReferenceInstruction)?.reference as? FieldReference
        ref?.definingClass == adapter.type && ref.name == "J"
    }) { "226 ID-less NG source list changed" }
    rebuild.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p0}, $PROGRAMMABLE_NG->prepareModernResponses(Ljava/lang/Object;)V
    """)
    val responseFilter = mutableClassDefBy("Lo/listener;").methods.single {
        it.name == "d" && it.returnType == "I" &&
            it.parameters.map(CharSequence::toString) == listOf(
                "Lo/BouncyCastleSocketAdapterCompanion;", "Z", "Lo/getNextExecuteNanoTimeokhttp;"
            )
    }
    val responseReturns = responseFilter.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        if (instruction.opcode == Opcode.RETURN)
            index to (instruction as OneRegisterInstruction).registerA else null
    }
    check(responseReturns.size >= 2) { "226 programmable NG response hook changed" }
    responseReturns.asReversed().forEach { (index, register) ->
        responseFilter.replaceInstruction(index, "move/16 p2, v$register")
        responseFilter.addInstructionsWithLabels(index + 1, """
            invoke-static/range {p0 .. p2}, $PROGRAMMABLE_NG->mergeModernResponseFlags(Ljava/lang/Object;Ljava/lang/Object;I)I
            move-result v$register
            return v$register
        """)
    }
}

/** 241/243 build their response flags in maps before composing rows. */
internal fun BytecodePatchContext.patchProgrammableNgModern(
    owner: String,
    fullName: String,
    compactName: String,
) {
    patchPosterIdChainNg()
    patchFirstResponseNg()
    val target = mutableClassDefBy(owner)
    val full = target.methods.single {
        it.name == fullName && it.returnType == "Ljava/util/ArrayList;" &&
            it.parameters.size == 14 &&
            it.parameters[4].toString() == "Ljava/util/List;" &&
            it.parameters[9].toString() == "Ljava/util/Map;"
    }
    val compact = target.methods.single {
        it.name == compactName && it.returnType == "Ljava/util/ArrayList;" &&
            it.parameters.size == 8 &&
            it.parameters[0].toString() == "Ljava/util/List;" &&
            it.parameters[2].toString() == "Ljava/util/Map;"
    }
    val hiddenIdFull = if (packageMetadata.versionName == "0.8.10.242 dev") """
        invoke-static/range {p9 .. p9}, $HIDDEN_ID_NG->modernFlags(Ljava/util/Map;)Ljava/util/Map;
        move-result-object p9
    """ else ""
    val hiddenIdCompact = if (packageMetadata.versionName == "0.8.10.242 dev") """
        invoke-static/range {p2 .. p2}, $HIDDEN_ID_NG->modernFlags(Ljava/util/Map;)Ljava/util/Map;
        move-result-object p2
    """ else ""
    if (packageMetadata.versionName == "0.8.10.242 dev") {
        val result = mutableClassDefBy("Lo/AvailabilityException;")
        check(result.fields.single { it.name == "a" }.type == "Lo/KeJ12;")
        check(result.fields.single { it.name == "d" }.type == "Ljp/syoboi/a2chMate/client/BBSUrlInfo;")
        val constructor = result.methods.single { it.name == "<init>" && it.parameterTypes == listOf(
            "Lo/KeJ12;", "Ljp/syoboi/a2chMate/client/BBSUrlInfo;") }
        val exits = constructor.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
        check(exits.size == 1)
        constructor.addInstructionsWithLabels(exits.single().index, """
            invoke-static/range {p0 .. p0}, $HIDDEN_ID_NG->bind242(Ljava/lang/Object;)V
            invoke-static/range {p0 .. p0}, $PROGRAMMABLE_NG->bindModernResponses(Ljava/lang/Object;)V
        """)
    }
    full.addInstructionsWithLabels(0, """
        invoke-static/range {p4 .. p4}, $PROGRAMMABLE_NG->pendingModernResponses(Ljava/lang/Object;)V
        invoke-static/range {p9 .. p9}, $PROGRAMMABLE_NG->applyPendingModernResponseFlags(Ljava/lang/Object;)Ljava/util/Map;
        move-result-object p9
        $hiddenIdFull
    """)
    compact.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p0}, $PROGRAMMABLE_NG->pendingModernResponses(Ljava/lang/Object;)V
        invoke-static/range {p2 .. p2}, $PROGRAMMABLE_NG->applyPendingModernResponseFlags(Ljava/lang/Object;)Ljava/util/Map;
        move-result-object p2
        $hiddenIdCompact
    """)
}
