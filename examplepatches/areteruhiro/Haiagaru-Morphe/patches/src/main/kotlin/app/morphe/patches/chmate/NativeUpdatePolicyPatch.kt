package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.Opcode

private const val POLICY = "Lapp/morphe/extension/chmate/NativeUpdatePolicy;"
private const val CALLBACK191 = "Lo/r8lambdamHWy7omJVz7G9M7u2KSo5IaRp90;"

internal fun BytecodePatchContext.patchNativeUpdatePolicy(version: String) {
    if (version !in setOf("0.8.10.191 dev", "0.8.10.226 dev", "0.8.10.242 dev")) return

    // Track activity resumes independently from Fragment resumes. A tablet pane switch
    // resumes its thread Fragment while TabletHomeActivity itself stays resumed.
    val tabletHome = mutableClassDefBy("Ljp/syoboi/a2chMate/activity/TabletHomeActivity;")
    val tabletResume = tabletHome.methods.single {
        it.name == "onResume" && it.parameterTypes.isEmpty()
    }
    tabletResume.addInstruction(0,
        "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/chmate/NativeUpdatePolicy;->tabletActivityResume(Ljava/lang/Object;)V")

    // Guard only the automatic resume refresh in the thread Fragment. Explicit refresh
    // actions and first view creation use separate call sites.
    val legacy191 = version == "0.8.10.191 dev"
    val threadFragment = mutableClassDefBy(if (legacy191) "Lo/pa;"
        else "Ljp/syoboi/a2chMate/ui/reslist/ResListFragment;")
    val threadResume = threadFragment.methods.single {
        it.name == "onResume" && it.parameterTypes.isEmpty()
    }
    val resumeInstructions = threadResume.implementation!!.instructions.toList()
    val reloadOwner = if (legacy191) "Lo/r8lambdahIGIGCNpKpFqE0lgDli724UCuDM;"
        else "Ljp/syoboi/a2chMate/fragment/RoidonListFragment;"
    val reloadName = if (version == "0.8.10.226 dev") "d" else "e"
    val reloadSites = resumeInstructions.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_DIRECT)
                && run {
                    ref?.definingClass == reloadOwner
                            && ref.name == reloadName
                            && ref.parameterTypes == listOf("I", "Ljava/lang/Object;")
                            && ref.returnType == "Z"
                }
    }
    check(reloadSites.size == 1) { "$version thread onResume reload site changed: ${reloadSites.size}" }
    val (reloadIndex, reloadInstruction) = reloadSites.single()
    val reload = (reloadInstruction as ReferenceInstruction).reference as MethodReference
    val call = reloadInstruction as FiveRegisterInstruction
    check(call.registerCount == 3) { "$version resume reload argument layout changed" }
    // Caller locals may be live across this call. Put the guard in
    // a separate method so every caller register, branch and result stays native.
    val wrapper = MutableMethod(ImmutableMethod(threadFragment.type, "haiagaruResumeReload",
        (listOf(threadFragment.type) + reload.parameterTypes.map(CharSequence::toString)).map {
            ImmutableMethodParameter(it, emptySet(), null)
        }, reload.returnType, 0x1009, emptySet(), emptySet(),
        ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
    val nativeInvoke = if (reloadInstruction.opcode == Opcode.INVOKE_DIRECT) "invoke-direct/range" else "invoke-virtual/range"
    val result = if (reload.returnType == "V") "return-void" else "move-result v0\nreturn v0"
    val skipped = if (reload.returnType == "V") "return-void" else "const/4 v0, 0x0\nreturn v0"
    wrapper.addInstructions(0, """
        invoke-static/range {p0 .. p0}, $POLICY->shouldSkipTabletResumeReload(Ljava/lang/Object;)Z
        move-result v0
        if-nez v0, :skip
        $nativeInvoke {p0 .. p2}, $reload
        $result
        :skip
        $skipped
    """.trimIndent())
    threadFragment.methods.add(wrapper)
    threadResume.replaceInstruction(reloadIndex,
        "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, $wrapper")

    // The rest of this patch is specific to the 191 transport implementation.
    if (!legacy191) return

    val nativeRequest = mutableClassDefBy("Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;")
    check(nativeRequest.methods.count { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(
        "Lo/r8lambdaDTvcCbM00GfL6vhIvhD78yZ0Us;", "Ljava/lang/String;", "Lokhttp3/Headers;",
        "Lo/r8lambdaGZC8a_4Sth8OENyznWf4FMVcU0;", "Ljava/util/Map;"
    ) } == 1) { "191 immutable request copy constructor changed" }
    for ((name, type) in mapOf("f" to "Lo/r8lambdaDTvcCbM00GfL6vhIvhD78yZ0Us;",
        "c" to "Ljava/lang/String;", "a" to "Lokhttp3/Headers;",
        "e" to "Lo/r8lambdaGZC8a_4Sth8OENyznWf4FMVcU0;", "b" to "Ljava/util/Map;")) {
        check(nativeRequest.instanceFields.count { it.name == name && it.type == type } == 1) {
            "191 request copy field changed: $name"
        }
    }

    val bridge = mutableClassDefBy(POLICY)
    fun newBridge(name: String, registers: Int): MutableMethod {
        val old = bridge.methods.single { it.name == name }
        val replacement = MutableMethod(ImmutableMethod(old.definingClass, old.name, old.parameters,
            old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions,
            ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
        bridge.methods.remove(old)
        bridge.methods.add(replacement)
        return replacement
    }
    newBridge("report191", 4).apply {
        addInstructions(0, """
            invoke-static {p0, p1, p2}, $POLICY->shouldReport(Ljava/lang/Object;II)Z
            move-result v0
            if-eqz v0, :done
            check-cast p0, $CALLBACK191
            invoke-interface {p0, p1, p2}, $CALLBACK191->c(II)V
            :done
            return-void
        """.trimIndent())
    }
    newBridge("configure191", 8).apply {
        addInstructions(0, """
            instance-of v0, p0, Lo/putFloat;
            if-eqz v0, :done
            check-cast p0, Lo/putFloat;
            iget-object v0, p0, Lo/putFloat;->g:Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;
            iget-object v1, v0, Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;->c:Ljava/lang/String;
            iget-object v0, v0, Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;->f:Lo/r8lambdaDTvcCbM00GfL6vhIvhD78yZ0Us;
            invoke-virtual {v0}, Lo/r8lambdaDTvcCbM00GfL6vhIvhD78yZ0Us;->toString()Ljava/lang/String;
            move-result-object v0
            invoke-static {p0, v1, v0}, $POLICY->prepareRequest191(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
            invoke-static {v1, v0}, $POLICY->timeoutNanos(Ljava/lang/String;Ljava/lang/String;)J
            move-result-wide v0
            const-wide/16 v2, 0x0
            cmp-long v5, v0, v2
            if-lez v5, :done
            iget-object v4, p0, Lo/putFloat;->l:Lo/putFloat${'$'}IconCompatParcelizer;
            invoke-virtual {v4}, Lo/StringUtils;->B_()J
            move-result-wide v2
            const-wide/16 v5, 0x0
            cmp-long v5, v2, v5
            if-lez v5, :apply
            cmp-long v5, v2, v0
            if-lez v5, :done
            :apply
            sget-object v6, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;
            invoke-virtual {v4, v0, v1, v6}, Lo/StringUtils;->a(JLjava/util/concurrent/TimeUnit;)Lo/StringUtils;
            :done
            return-void
        """.trimIndent())
    }
    var callbacks = 0
    for (owner in listOf("Lo/getCredentials${'$'}1;", "Lo/getCredentials${'$'}3;")) {
        val method = mutableClassDefBy(owner).methods.single {
            it.name == "read" && it.parameterTypes == listOf("[B", "I", "I")
        }
        method.implementation!!.instructions.toList().forEachIndexed { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.definingClass == CALLBACK191 && ref.name == "c") {
                val call = instruction as FiveRegisterInstruction
                method.replaceInstruction(index,
                    "invoke-static {v${call.registerC}, v${call.registerD}, v${call.registerE}}, $POLICY->report191(Ljava/lang/Object;II)V")
                callbacks++
            }
        }
    }
    check(callbacks == 2) { "191 progress reader bindings changed: $callbacks" }
    var calls = 0
    mutableClassDefBy("Lo/getLabel;").methods.forEach { method ->
        val sites = method.implementation?.instructions?.withIndex()?.filter {
            val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass in setOf("Lo/putFloat;", "Lo/AppLovinVastMediaViewe;")
                && ref?.name == "e" && ref.parameterTypes.isEmpty()
        } ?: return@forEach
        sites.reversed().forEach { (index, instruction) ->
            val receiver = when (instruction) {
                is FiveRegisterInstruction -> instruction.registerC
                is RegisterRangeInstruction -> instruction.startRegister
                else -> error("Unexpected 191 execute instruction")
            }
            method.addInstruction(index, "invoke-static/range {v$receiver .. v$receiver}, $POLICY->configure191(Ljava/lang/Object;)V")
            calls++
        }
    }
    check(calls > 0) { "191 update execute sites missing" }
    val finder = mutableClassDefBy("Lo/putDouble;")
    val nativeCall = MutableMethod(ImmutableMethod(finder.type, "haiagaruCall", emptyList(),
        "Ljava/lang/Object;", 0x1, emptySet(), emptySet(),
        ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList())))
    nativeCall.addInstructions(0, """
        iget-object p0, p0, Lo/putDouble;->h:Lo/putFloat;
        return-object p0
    """.trimIndent())
    finder.methods.add(nativeCall)
    newBridge("call191", 2).addInstructions(0, """
        check-cast p0, Lo/putDouble;
        invoke-virtual {p0}, Lo/putDouble;->haiagaruCall()Ljava/lang/Object;
        move-result-object v0
        return-object v0
    """.trimIndent())
    newBridge("method191", 2).addInstructions(0, """
        check-cast p0, Lo/putFloat;
        iget-object v0, p0, Lo/putFloat;->g:Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;
        iget-object v0, v0, Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;->c:Ljava/lang/String;
        return-object v0
    """.trimIndent())
    newBridge("url191", 2).addInstructions(0, """
        check-cast p0, Lo/putFloat;
        iget-object v0, p0, Lo/putFloat;->g:Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;
        iget-object v0, v0, Lo/r8lambda17vlhACr7B0IDgCdn1Q67LKhir8;->f:Lo/r8lambdaDTvcCbM00GfL6vhIvhD78yZ0Us;
        invoke-virtual {v0}, Lo/r8lambdaDTvcCbM00GfL6vhIvhD78yZ0Us;->toString()Ljava/lang/String;
        move-result-object v0
        return-object v0
    """.trimIndent())
    newBridge("cancelled191", 2).addInstructions(0, """
        check-cast p0, Lo/AppLovinVastMediaViewe;
        invoke-interface {p0}, Lo/AppLovinVastMediaViewe;->b()Z
        move-result v0
        return v0
    """.trimIndent())
    newBridge("direct191", 3).addInstructions(0, """
        check-cast p0, Lo/sExternalSyntheticLambda4;
        iget-object v0, p0, Lo/sExternalSyntheticLambda4;->d:Ljava/net/Proxy;
        invoke-virtual {v0}, Ljava/net/Proxy;->type()Ljava/net/Proxy${'$'}Type;
        move-result-object v0
        sget-object v1, Ljava/net/Proxy${'$'}Type;->DIRECT:Ljava/net/Proxy${'$'}Type;
        if-ne v0, v1, :no
        const/4 v0, 0x1
        return v0
        :no
        const/4 v0, 0x0
        return v0
    """.trimIndent())
    newBridge("endpoint191", 2).addInstructions(0, """
        check-cast p0, Lo/sExternalSyntheticLambda4;
        iget-object v0, p0, Lo/sExternalSyntheticLambda4;->b:Ljava/net/InetSocketAddress;
        return-object v0
    """.trimIndent())
    newBridge("socketFactory191", 2).addInstructions(0, """
        check-cast p0, Lo/sExternalSyntheticLambda4;
        iget-object v0, p0, Lo/sExternalSyntheticLambda4;->a:Lo/populatePlayPauseImage;
        iget-object v0, v0, Lo/populatePlayPauseImage;->j:Ljavax/net/SocketFactory;
        return-object v0
    """.trimIndent())
    newBridge("candidates191", 6).addInstructions(0, """
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        check-cast p0, Lo/putDouble;
        iget-object v1, p0, Lo/putDouble;->j:Lo/putIntArray${'$'}write;
        if-eqz v1, :done
        iget v2, v1, Lo/putIntArray${'$'}write;->c:I
        iget-object v1, v1, Lo/putIntArray${'$'}write;->d:Ljava/util/List;
        invoke-interface {v1}, Ljava/util/List;->size()I
        move-result v3
        if-ltz v2, :done
        if-ge v2, v3, :done
        invoke-interface {v1, v2, v3}, Ljava/util/List;->subList(II)Ljava/util/List;
        move-result-object v1
        invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z
        :done
        return-object v0
    """.trimIndent())
    newBridge("commitRoute191", 8).addInstructions(0, """
        check-cast p0, Lo/putDouble;
        iget-object v0, p0, Lo/putDouble;->j:Lo/putIntArray${'$'}write;
        if-eqz v0, :done
        iget v2, v0, Lo/putIntArray${'$'}write;->c:I
        add-int/lit8 v2, v2, -0x1
        if-ltz v2, :done
        iget-object v1, v0, Lo/putIntArray${'$'}write;->d:Ljava/util/List;
        invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;
        move-result-object v4
        if-ne v4, p1, :done
        invoke-interface {v1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I
        move-result v3
        if-ltz v3, :done
        if-eq v2, v3, :done
        invoke-interface {v1, v2, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
        invoke-interface {v1, v3, v4}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;
        :done
        return-void
    """.trimIndent())
    val routeConnect = finder.methods.single {
        it.name == "b" && it.parameterTypes == listOf("I", "I", "I", "I", "Z")
    }
    val connectSites = routeConnect.implementation!!.instructions.withIndex().filter {
        val ref = (it.value as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/putCharSequenceArrayList;" && ref.name == "<init>"
    }.toList()
    check(connectSites.size == 1) { "191 route construction sites changed: ${connectSites.size}" }
    connectSites.reversed().forEach { (index, instruction) ->
        val call = instruction as FiveRegisterInstruction
        check(call.registerC == 9 && call.registerD == 10 && call.registerE == 7) {
            "191 route constructor registers changed: ${call.registerC},${call.registerD},${call.registerE}"
        }
        // v9 is dead before the preceding NEW_INSTANCE; v1 is the verified this alias.
        val newIndex = index - 2
        check(routeConnect.implementation!!.instructions.elementAt(newIndex).opcode == com.android.tools.smali.dexlib2.Opcode.NEW_INSTANCE) {
            "191 route allocation moved: ${routeConnect.implementation!!.instructions.elementAt(newIndex).opcode}"
        }
        routeConnect.addInstructions(newIndex, """
            move/from16 v9, p1
            invoke-static {v1, v7, v9}, $POLICY->race191(Ljava/lang/Object;Ljava/lang/Object;I)Ljava/lang/Object;
            move-result-object v7
            check-cast v7, Lo/sExternalSyntheticLambda4;
        """.trimIndent())
    }
    val socketConnect = mutableClassDefBy("Lo/putCharSequenceArrayList;").methods.single {
        it.name == "e" && it.parameterTypes == listOf("I", "I", "Lo/AppLovinVastMediaViewe;")
    }
    val originalConnect = socketConnect.implementation!!.instructions.first()
    val sourceSetup = socketConnect.implementation!!.instructions.single {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lo/putObject;" && ref.name == "e"
            && ref.parameterTypes == listOf("Ljava/net/Socket;")
    }
    socketConnect.addInstructionsWithLabels(0, """
        const-string v0, ""
        iget-object v1, p0, Lo/putCharSequenceArrayList;->l:Lo/sExternalSyntheticLambda4;
        invoke-static {v1, p3}, $POLICY->takeSocket191(Ljava/lang/Object;Ljava/lang/Object;)Ljava/net/Socket;
        move-result-object v2
        if-eqz v2, :original_connect
        iput-object v2, p0, Lo/putCharSequenceArrayList;->j:Ljava/net/Socket;
        iget-object v3, v1, Lo/sExternalSyntheticLambda4;->d:Ljava/net/Proxy;
        iget-object v1, v1, Lo/sExternalSyntheticLambda4;->b:Ljava/net/InetSocketAddress;
        invoke-static {p3, v1, v3}, Lo/r8lambda4l2z2UAjoTYsQCZTUnlYqmAWHg;->e(Lo/AppLovinVastMediaViewe;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
        invoke-virtual {v2, p2}, Ljava/net/Socket;->setSoTimeout(I)V
        goto :connected_source
    """.trimIndent(), ExternalLabel("original_connect", originalConnect), ExternalLabel("connected_source", sourceSetup))
    println("191 update safeguards: $callbacks progress readers, $calls scoped native calls, 250ms TCP race/socket handoff")
}
