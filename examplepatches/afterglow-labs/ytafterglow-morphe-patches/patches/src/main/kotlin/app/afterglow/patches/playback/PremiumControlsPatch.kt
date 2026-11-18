package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.youtube.video.information.videoInformationPatch
import app.morphe.util.cloneMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val PREMIUM = "$EXTENSION_PACKAGE/playback/PremiumControls;"
private const val TRANSPORT = "$EXTENSION_PACKAGE/playback/PremiumControls\$Transport;"
private const val STABLE = "$EXTENSION_PACKAGE/playback/PremiumControls\$StableVolume;"
private const val STABLE_PROVIDER = "$EXTENSION_PACKAGE/playback/PremiumControls\$StableVolumeProvider;"

private fun MutableClass.addPremiumSpeedSetter(name: String, body: String) {
    methods.add(ImmutableMethod(type,name,listOf(ImmutableMethodParameter("F",null,null)),"V",
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,null,null,MutableMethodImplementation(3))
        .toMutable().apply { addInstructions(0,body) })
}

/** Read the exact state already verified by our native play/pause command bridge. */
internal fun MutableClass.installPremiumPlayingState() {
    val code=methods.single{it.name=="afterglow_overlaySetPlaying"}.implementation!!.instructions.toList()
    val reads=code.filter{it.opcode==Opcode.IGET_OBJECT}.map{(it as ReferenceInstruction).reference as FieldReference}
    val button=reads.single{it.definingClass==type&&it.type=="Lokb;"}
    val state=reads.single{it.definingClass==button.type&&it.type=="Larrs;"}
    val value=reads.single{it.definingClass==state.type&&it.type=="Larrr;"}
    val states=code.filter{it.opcode==Opcode.SGET_OBJECT}.map{(it as ReferenceInstruction).reference as FieldReference}
    require(states.size==2&&states.map{it.type}.distinct()==listOf(value.type)
        &&states[0].smali!=states[1].smali)
    addMethod("afterglow_transportPlaying","I",3,"""
        iget-object v0, p0, ${button.smali}
        if-eqz v0, :unavailable
        iget-object v0, v0, ${state.smali}
        if-eqz v0, :unavailable
        iget-object v0, v0, ${value.smali}
        sget-object v1, ${states[0].smali}
        if-eq v0, v1, :playing
        sget-object v1, ${states[1].smali}
        if-ne v0, v1, :unavailable
        const/4 v0, 0x0
        return v0
        :playing
        const/4 v0, 0x1
        return v0
        :unavailable
        const/4 v0, -0x1
        return v0
    """)
}

/** A cold watch creates the overlay root before lazily inflating its controls. */
internal fun MutableClass.installPremiumColdBinding(binder:MutableMethod) {
    require(binder.definingClass==type&&binder.name=="E"&&binder.parameterTypes.isEmpty()&&binder.returnType=="V")
    val root=methods.single{it.name=="afterglow_overlayRoot"}.implementation!!.instructions
        .filter{it.opcode==Opcode.IGET_OBJECT}.map{(it as ReferenceInstruction).reference as FieldReference}.single()
    require(root.definingClass==type&&root.type=="Landroid/widget/FrameLayout;")
    val setup=methods.single{method->method.returnType=="V"&&method.parameterTypes.isEmpty()
        &&method.implementation?.instructions?.any{it.opcode==Opcode.IPUT_OBJECT
            &&(it as? ReferenceInstruction)?.reference?.toString()==root.smali}==true}
    val code=binder.implementation!!.instructions.toList()
    val initialized=code.withIndex().first{it.value.opcode==Opcode.IGET_OBJECT
        &&(it.value as? ReferenceInstruction)?.reference?.toString()=="Lolx;->p:Landroid/view/View;"}
    require(initialized.index>0&&(code[initialized.index-1] as? ReferenceInstruction)?.reference?.toString()==setup.smali)
    val guard=code[initialized.index+1]
    require(guard.opcode==Opcode.IF_NEZ
        &&(guard as OneRegisterInstruction).registerA==(initialized.value as OneRegisterInstruction).registerA)
    val target=(guard as BuilderOffsetInstruction).target.location.index
    require(target>=code.lastIndex-2&&code.last().opcode==Opcode.RETURN_VOID) {
        "Native controls initializer must retain its existing-controls fast return"
    }
    addMethod("afterglow_prepareTransport","V",1,"""
        invoke-virtual { p0 }, ${binder.smali}
        return-void
    """)
    for(index in setup.implementation!!.instructions.withIndex().filter{it.value.opcode==Opcode.RETURN_VOID}.map{it.index}.reversed()){
        setup.addInstructionsAtControlFlowLabel(index,"invoke-static/range { p0 .. p0 }, $PREMIUM->bindTransport($TRANSPORT)V")
    }
}

internal fun premiumSpeedMenuFingerprint() = Fingerprint(definingClass = "Lqqo;", name = "onItemClick",
    parameters = listOf("Landroid/widget/AdapterView;", "Landroid/view/View;", "I", "J"), returnType = "V",
    filters = listOf(fieldAccess(smali = "Lqpn;->a:F"), fieldAccess(smali = "Larsv;->a:Laske;"),
        methodCall(smali = "Laske;->T(F)V"), methodCall(smali = "Larsv;->d([Lboht;F)V")))

internal fun premiumSpeedCommandFingerprint() = Fingerprint(definingClass = "Laske;", name = "T",
    parameters = listOf("F"), returnType = "V", filters = listOf(
        methodCall(smali = "Lasaz;->aJ()Z"), fieldAccess(smali = "Laske;->t:Lasmu;"),
        methodCall(smali = "Lasmj;-><init>(FLjava/lang/Float;)V"),
        methodCall(smali = "Lasly;->f(Lasmp;)V"), fieldAccess(smali = "Laske;->o:Laslj;"),
        methodCall(smali = "Lastr;->X(F)V")))

/** Preserve precisely the selected bundle's observers, including optional remembered speed. */
internal fun MutableMethod.premiumSpeedSelectionObservers(): List<MethodReference> {
    val code = implementation!!.instructions.toList()
    val selection = code.withIndex().single {
        it.value.opcode == Opcode.IGET && (it.value as? ReferenceInstruction)?.reference?.toString() == "Lqpn;->a:F"
    }
    val speedRegister = (selection.value as TwoRegisterInstruction).registerA
    val command = code.withIndex().single {
        (it.value as? ReferenceInstruction)?.reference?.toString() == "Laske;->T(F)V"
    }
    require(command.value.invokeRegisters.last() == speedRegister)
    val between = code.subList(selection.index + 1, command.index)
    val native = between.filter { it.opcode != Opcode.INVOKE_STATIC && it.opcode != Opcode.INVOKE_STATIC_RANGE }
    require(native.size == 2 && native[0].opcode == Opcode.CHECK_CAST
        && (native[0] as? ReferenceInstruction)?.reference?.toString() == "Larsv;"
        && native[1].opcode == Opcode.IGET_OBJECT
        && (native[1] as? ReferenceInstruction)?.reference?.toString() == "Larsv;->a:Laske;") {
        "Native speed selection no longer directly reaches its facade command"
    }
    return between.filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }.map {
        val reference = (it as ReferenceInstruction).reference as MethodReference
        require(reference.definingClass.startsWith("Lapp/morphe/extension/")
            && reference.parameterTypes.map(CharSequence::toString) == listOf("F")
            && reference.returnType == "V" && it.invokeRegisters == listOf(speedRegister)) {
            "Unexpected native speed-selection observer: $reference"
        }
        reference
    }.also { observers ->
        require(observers.map { it.smali }.distinct().size == observers.size)
    }
}

internal fun premiumStableCommandFingerprint() = Fingerprint(definingClass = "Lkzs;", name = "b",
            parameters = listOf("Lbdso;","Ljava/util/Map;"), returnType = "V", filters = listOf(
                fieldAccess(smali = "Lbnmf;->b:Lbbju;"),
                methodCall(smali = "Laske;->n()Lasuq;"),
                methodCall(smali = "Lalfi;->g()Lalfd;"),
                methodCall(smali = "Lalfi;->ae()Z"),
                literal(0x02b8b5dc), methodCall(smali = "Laclf;->aV(Lalcu;Ljava/util/List;)Z"),
                fieldAccess(smali = "Lalfd;->I:Z"),
                methodCall(smali = "Lalcu;->P()Z"),
                methodCall(smali = "Lasaz;->bx()Z"),
                methodCall(smali = "Laesm;->k(Lcom/google/common/util/concurrent/ListenableFuture;Ljava/util/concurrent/Executor;Laesi;Laesl;Ljava/lang/Runnable;)V"),
                methodCall(smali = "Laslv;->n(Z)V"),
                methodCall(smali = "Lbvvd;->sU(Ljava/lang/Object;)V"),
                literal(0x02b4eb16)
            ))

internal fun premiumStableProviderFingerprint()=Fingerprint(definingClass="Liep;",name="i",
    parameters=listOf(),returnType="Ljava/lang/Object;",filters=listOf(
        fieldAccess(smali="Lifh;->qK:Lbtld;"),
        fieldAccess(smali="Lieq;->pK:Lbtld;"),
        fieldAccess(smali="Lifb;->hZ:Lbtld;"),
        methodCall(smali="Lkzs;-><init>(Landroid/content/Context;Laske;Lovi;Laktm;I)V")))

/** Derive the exact native provider discriminator instead of copying a guessed DI index. */
internal fun MutableMethod.premiumStableProviderCase():Int {
    val code=implementation!!.instructions.toList()
    val constructor=code.withIndex().single{(it.value as? ReferenceInstruction)?.reference?.toString()==
        "Lkzs;-><init>(Landroid/content/Context;Laske;Lovi;Laktm;I)V"}
    val entry=code.take(constructor.index).withIndex().last{(it.value as? ReferenceInstruction)?.reference?.toString()=="Liep;->b:Lieq;"}
    require(code[entry.index-1].opcode in setOf(Opcode.GOTO,Opcode.GOTO_16,Opcode.GOTO_32))
    val switch=code.withIndex().single{it.value.opcode==Opcode.PACKED_SWITCH}
    val offsets=code.runningFold(0){offset,instruction->offset+instruction.codeUnits}
    val payloadOffset=offsets[switch.index]+(switch.value as OffsetInstruction).codeOffset
    val payload=code[offsets.indexOf(payloadOffset)] as SwitchPayload
    val key=payload.switchElements.single{offsets[switch.index]+it.offset==offsets[entry.index]}.key
    require(key in 1500..1599){"Native DRC provider left its verified factory dispatch range"}
    return key
}

internal fun MutableMethod.clonePremiumStableCommand(): MutableMethod {
        val commandCode = this.implementation!!.instructions.toList()
        require(this.implementation!!.registerCount == 12 && this.implementation!!.tryBlocks.isEmpty())
        val entry = commandCode.withIndex().single {
            ((it.value as? ReferenceInstruction)?.reference as? FieldReference)?.smali == "Lkzs;->d:Ljava/lang/Object;"
                    && (commandCode.getOrNull(it.index + 1) as? ReferenceInstruction)?.reference?.toString() == "Laske;"
        }
        val entryRegisters = entry.value as TwoRegisterInstruction
        require(entry.value.opcode == Opcode.IGET_OBJECT && entryRegisters.registerA == 10 && entryRegisters.registerB == 9)
        require((commandCode[entry.index - 1] as? ReferenceInstruction)?.reference?.toString() == "Lkzs;->a:I")
        require((commandCode[entry.index + 1] as? ReferenceInstruction)?.reference?.toString() == "Laske;")
        require((commandCode[entry.index + 2] as? ReferenceInstruction)?.reference?.toString() == "Laske;->n()Lasuq;")
        val nativeToggle = cloneMutable(name = "afterglow_stableVolumeCommand",
            accessFlags = AccessFlags.PRIVATE.value or AccessFlags.FINAL.value)
        // Same prototype/register layout. p1/p2 are never read in this native branch.
        // Skip only its protobuf-envelope dispatch, leaving every native instruction intact.
        nativeToggle.addInstructionsWithLabels(0,"""
            const/4 v0, 0x0
            const/4 v1, 0x2
            const/4 v2, 0x1
            const/4 v3, 0x0
            goto/32 :native_stable
        """,ExternalLabel("native_stable",nativeToggle.implementation!!.instructions[entry.index]))
    return nativeToggle
}

/** Native 21.43.523 action ownership; the UI does not synthesize a second player. */
internal val premiumControlsHookPatch = bytecodePatch {
    dependsOn(playerOverlayHookPatch, overlayButtonsHookPatch, videoInformationPatch)
    execute {
        premiumSpeedMenuFingerprint().method
        premiumSpeedCommandFingerprint().method
        val binder = Fingerprint(definingClass = "Lolx;", returnType = "V", filters = listOf(
            literal(159962), resourceLiteral(ResourceType.ID,"player_control_next_button"),
            resourceLiteral(ResourceType.ID,"player_control_next_button_touch_area"),
            methodCall(smali = "Loir;->e(Landroid/view/View;I)Lafpf;")
        )).method
        val nextMatch = Fingerprint(definingClass = binder.definingClass, name = binder.name, filters = listOf(
            resourceLiteral(ResourceType.ID,"player_control_next_button")
        )).instructionMatches.single()
        val code = binder.implementation!!.instructions.toList()
        val nextId = (code[nextMatch.index] as NarrowLiteralInstruction).narrowLiteral
        // This view is the actual Next click target (Loir.y), not its larger touch delegate.
        require(code.subList(nextMatch.index + 1,nextMatch.index + 4).mapNotNull {
            (it as? ReferenceInstruction)?.reference as? FieldReference
        }.single().smali == "Loir;->y:Lafpf;") { "Native Next button binding changed" }
        val nextListener = Fingerprint(definingClass = "Loee;", name = "onClick", filters = listOf(
            fieldAccess(smali = "Loir;->a:Loij;"), methodCall(smali = "Larsx;->jO()V"),
            methodCall(smali = "Larsx;->jN()V")
        )).method
        require(nextListener.parameterTypes.map { it.toString() } == listOf("Landroid/view/View;"))
        val host = mutableClassDefBy(binder.definingClass)
        require("$EXTENSION_PACKAGE/playback/PauseOnOverlay\$Controller;" in host.interfaces)
        require(host.methods.any { it.name == "afterglow_overlayRoot" && it.returnType == "Landroid/view/View;" })
        val paddles = host.fields.single { it.type == "Loir;" }
        val paddleClass = mutableClassDefBy(paddles.type)
        val facade = paddleClass.fields.single { it.type == "Laske;" }
        paddleClass.addMethod("afterglow_premiumVideoId","Ljava/lang/String;",2,"""
            iget-object v0, p0, ${facade.smali}
            invoke-virtual { v0 }, Laske;->s()Ljava/lang/String;
            move-result-object v0
            return-object v0
        """)
        paddleClass.addMethod("afterglow_premiumPlayer","Ljava/lang/Object;",2,"""
            iget-object v0, p0, ${facade.smali}
            return-object v0
        """)
        paddleClass.addPremiumSpeedSetter("afterglow_premiumSetPlaybackSpeed","""
            iget-object v0, p0, ${facade.smali}
            invoke-virtual { v0, p1 }, Laske;->T(F)V
            return-void
        """)
        host.interfaces.add(TRANSPORT)
        host.installPremiumPlayingState()
        host.installPremiumColdBinding(binder)
        host.addMethod("afterglow_transportVideoId","Ljava/lang/String;",2,"""
            iget-object v0, p0, ${paddles.smali}
            invoke-virtual { v0 }, ${paddleClass.type}->afterglow_premiumVideoId()Ljava/lang/String;
            move-result-object v0
            return-object v0
        """)
        host.addMethod("afterglow_transportPlayer","Ljava/lang/Object;",2,"""
            iget-object v0, p0, ${paddles.smali}
            invoke-virtual { v0 }, ${paddleClass.type}->afterglow_premiumPlayer()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """)
        host.addPremiumSpeedSetter("afterglow_selectPlaybackSpeed","""
            iget-object v0, p0, ${paddles.smali}
            invoke-virtual { v0, p1 }, ${paddleClass.type}->afterglow_premiumSetPlaybackSpeed(F)V
            return-void
        """)
        host.addMethod("afterglow_nextButton","Landroid/view/View;",3,"""
            invoke-virtual { p0 }, ${host.type}->afterglow_overlayRoot()Landroid/view/View;
            move-result-object v0
            if-eqz v0, :done
            const v1, $nextId
            invoke-virtual { v0, v1 }, Landroid/view/View;->findViewById(I)Landroid/view/View;
            move-result-object v0
            :done
            return-object v0
        """)
        for (index in code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }.reversed()) {
            binder.addInstructionsAtControlFlowLabel(index,
                "invoke-static/range { p0 .. p0 }, $PREMIUM->bindTransport($TRANSPORT)V")
        }

        // The original DRC endpoint preserves availability checks, both audio architectures,
        // native state publication, analytics and the native failure toast. Reuse its body.
        val command = premiumStableCommandFingerprint().method
        val commandClass = mutableClassDefBy(command.definingClass)
        val nativeToggle = command.clonePremiumStableCommand()
        commandClass.methods.add(nativeToggle)
        commandClass.interfaces.add(STABLE)
        commandClass.addMethod("afterglow_stablePlayer","Ljava/lang/Object;",2,"""
            iget-object v0, p0, Lkzs;->d:Ljava/lang/Object;
            return-object v0
        """)
        commandClass.addMethod("afterglow_stableVideoId","Ljava/lang/String;",2,"""
            iget-object v0, p0, Lkzs;->d:Ljava/lang/Object;
            check-cast v0, Laske;
            invoke-virtual { v0 }, Laske;->s()Ljava/lang/String;
            move-result-object v0
            return-object v0
        """)
        commandClass.addMethod("afterglow_toggleStableVolume","V",2,"""
            const/4 v0, 0x0
            invoke-direct { p0, v0, v0 }, ${nativeToggle.smali}
            return-void
        """)
        // Identical support predicate from the native command above, then its actual stream state.
        // Both the legacy DRC flag and the newer selected-format policy are honored.
        commandClass.addMethod("afterglow_stableState","I",9,"""
            iget-object v0, p0, Lkzs;->d:Ljava/lang/Object;
            check-cast v0, Laske;
            invoke-virtual { v0 }, Laske;->n()Lasuq;
            move-result-object v1
            if-eqz v1, :no_player
            invoke-interface { v1 }, Lasuq;->d()Lalfi;
            move-result-object v1
            if-eqz v1, :no_response
            invoke-interface { v1 }, Lalfi;->g()Lalfd;
            move-result-object v2
            invoke-interface { v1 }, Lalfi;->ae()Z
            move-result v1
            if-eqz v1, :legacy
            iget-object v1, v0, Laske;->c:Laowv;
            invoke-virtual { v1 }, Laowv;->e()Lalcu;
            move-result-object v1
            if-eqz v1, :no_stream
            if-eqz v2, :no_formats
            iget-object v4, p0, Lkzs;->e:Ljava/lang/Object;
            check-cast v4, Laktm;
            const/16 v5, 0xf2
            const-wide/32 v6, 0x02b8b5dc
            const/4 v3, 0x0
            invoke-virtual { v4, v5, v6, v7, v3 }, Laktm;->m(IJZ)Z
            move-result v3
            if-eqz v3, :native_policy
            iget-object v2, v2, Lalfd;->t:Ljava/util/List;
            invoke-static { v1, v2 }, Laclf;->aV(Lalcu;Ljava/util/List;)Z
            move-result v2
            if-eqz v2, :unsupported
            goto :state
            :legacy
            if-eqz v2, :no_formats
            iget-boolean v2, v2, Lalfd;->I:Z
            if-eqz v2, :unsupported
            :state
            iget-object v1, v0, Laske;->c:Laowv;
            invoke-virtual { v1 }, Laowv;->e()Lalcu;
            move-result-object v1
            if-eqz v1, :off
            invoke-virtual { v1 }, Lalcu;->P()Z
            move-result v0
            return v0
            :off
            const/4 v0, 0x0
            return v0
            :no_player
            const/4 v0, -0x1
            return v0
            :no_response
            const/4 v0, -0x2
            return v0
            :no_formats
            const/4 v0, -0x3
            return v0
            :no_stream
            const/4 v0, -0x4
            return v0
            :native_policy
            const/4 v0, -0x5
            return v0
            :unsupported
            const/4 v0, -0x6
            return v0
        """)
        val constructor = Fingerprint(definingClass = command.definingClass, name = "<init>",
            parameters = listOf("Landroid/content/Context;","Laske;","Lovi;","Laktm;","I"),
            filters = listOf(fieldAccess(smali = "Lkzs;->d:Ljava/lang/Object;"),
                fieldAccess(smali = "Lkzs;->e:Ljava/lang/Object;"))).method
        val constructorReturn = constructor.implementation!!.instructions.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }.index
        constructor.addInstructionsAtControlFlowLabel(constructorReturn,
            "invoke-static/range { p0 .. p0 }, $PREMIUM->bindStableVolume($STABLE)V")

        val providerFactory=premiumStableProviderFingerprint().method
        val providerCase=providerFactory.premiumStableProviderCase()
        val provider=mutableClassDefBy(providerFactory.definingClass)
        provider.interfaces.add(STABLE_PROVIDER)
        provider.addMethod("afterglow_stableProviderPlayer","Ljava/lang/Object;",2,"""
            iget-object v0, p0, Liep;->a:Lifb;
            iget-object v0, v0, Lifb;->a:Lifh;
            iget-object v0, v0, Lifh;->qK:Lbtld;
            invoke-interface { v0 }, Lbtld;->pc()Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """)
        provider.addMethod("afterglow_createStableVolume",STABLE,2,"""
            invoke-direct { p0 }, Liep;->i()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, $STABLE
            return-object v0
        """)
        val providerConstructor=Fingerprint(definingClass="Liep;",name="<init>",
            parameters=listOf("Lifb;","Likp;","Lieq;","I"),filters=listOf(
                fieldAccess(smali="Liep;->a:Lifb;",opcode=Opcode.IPUT_OBJECT),
                fieldAccess(smali="Liep;->c:I",opcode=Opcode.IPUT))).method
        val providerCode=providerConstructor.implementation!!.instructions.toList()
        require(providerConstructor.implementation!!.registerCount==5&&providerCode.last().opcode==Opcode.RETURN_VOID
            &&(providerCode[providerCode.lastIndex-1] as? ReferenceInstruction)?.reference?.toString()=="Liep;->c:I")
        // Every parameter has been stored; p1 is dead at the unique return.
        providerConstructor.addInstructionsWithLabels(providerCode.lastIndex,"""
            const/16 p1, $providerCase
            if-ne p4, p1, :other_provider
            invoke-static { p0 }, $PREMIUM->bindStableVolumeProvider($STABLE_PROVIDER)V
        """,ExternalLabel("other_provider",providerConstructor.implementation!!.instructions.last()))

        val info = "Lapp/morphe/extension/youtube/patches/VideoInformation;"
        for ((stub, getter) in mapOf("nativeMetadataId" to "getVideoId", "nativeTitle" to "getVideoTitle", "nativeChannel" to "getChannelName")) {
            require(classDefBy(info).methods.any { it.name == getter && it.parameterTypes.isEmpty()
                    && it.returnType == "Ljava/lang/String;" && AccessFlags.STATIC.isSet(it.accessFlags) })
            val method = mutableClassDefBy(PREMIUM).methods.single { it.name == stub }
            method.addInstructions(0,"""
                invoke-static {}, $info->$getter()Ljava/lang/String;
                move-result-object v0
                return-object v0
            """)
        }
        println("Afterglow Premium controls: transport=${binder.smali}; Next=$nextId; native DRC=${command.smali}; lazy provider=$providerCase; metadata=$info")
    }
    finalize {
        val observers = premiumSpeedMenuFingerprint().method.premiumSpeedSelectionObservers()
        require(observers.any { it.smali == "Lapp/morphe/extension/youtube/patches/VideoInformation;->userSelectedPlaybackSpeed(F)V" }) {
            "Original Video information speed-selection observer was not installed"
        }
        val selection = mutableClassDefBy(PREMIUM).methods.single { it.name == "nativeSpeedSelected" }
        selection.addInstructions(0, observers.joinToString("\n") { "invoke-static { p0 }, ${it.smali}" })
        println("Afterglow Premium speed: native Laske.T; ${observers.size} installed user-selection observers preserved")
    }
}
