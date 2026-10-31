package app.template.patches.zalo

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.methodCall
import app.morphe.patcher.literal
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private object OnlineSharingPreference : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(string("PRIVACY_SETTINGS_SHOW_ONLINE_STATUS_")),
)

private object OnlineSharingSetter : Fingerprint(
    returnType = "V",
    parameters = listOf("I", "I"),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    filters = listOf(string("PRIVACY_SETTINGS_SHOW_ONLINE_STATUS_")),
)

private object OnlineListResponse : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        string("data"),
        methodCall(definingClass = "Ljava/util/HashSet;", name = "clear"),
        string("onlines"), string("userId"),
    ),
)

private object LastSeenResponse : Fingerprint(
    filters = listOf(string("timestamp"), string("settingOnlineStatus")),
)

private object FriendListResponse : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(string("onlines"), string("userId"), string("ownerStatus")),
)

private const val SETTINGS_CLASS = "Lapp/template/extension/extension/NezumiSettings;"

private object ChatOnlineListRefresh : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    filters = listOf(
        methodCall(definingClass = "Ljava/util/ArrayList;", name = "isEmpty"),
        methodCall(definingClass = "Ljava/lang/System;", name = "currentTimeMillis"),
        literal(60000),
        methodCall(definingClass = "Lcom/zing/zalo/ui/maintab/MainTabView;"),
        methodCall(name = "H0", parameters = listOf("Ljava/lang/String;"), returnType = "V"),
    ),
)

@Suppress("unused")
val viewOnlineStatusPrivatelyPatch = bytecodePatch(
    name = "View online status privately",
    description = "Hide your activity and show confirmed current-online status in the individual chat header when available.",
    default = false,
) {
    compatibleWith(Compatibility(
        name = "Zalo",
        packageName = "com.zing.zalo",
        apkFileType = ApkFileType.APKM,
        appIconColor = 0x0068FF,
        targets = listOf(AppTarget(version = "26.08.01"), AppTarget(version = "26.10.02")),
    ))

    dependsOn(nativeSignaturePatch)
    extendWith("extensions/extension.mpe")

    execute {
        check(OnlineSharingPreference.matchAll(1..1).size == 1)
        val preference = OnlineSharingPreference.method
        check(OnlineSharingSetter.matchAll(1..1).size == 1)
        val sharingSetter = OnlineSharingSetter.method
        val incomingMethods = mutableListOf<Pair<app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, Int>>()
        classDefForEach { classDef ->
            classDef.methods.filter { it.implementation != null }.forEach { original ->
                val instructions = original.implementation!!.instructions.toList()
                val gateIndexes = instructions.indices.filter { index ->
                    val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                    call?.definingClass == preference.definingClass && call.name == preference.name &&
                        call.parameterTypes.isEmpty() && call.returnType == "Z"
                }
                if (gateIndexes.isEmpty()) return@forEach
                val strings = instructions.mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                }
                val incoming = "SETTING_SHOW_ONLINE_FRIEND_WITH_STATUS" in strings ||
                    original.parameterTypes == listOf("Ljava/lang/String;") && original.returnType == "J" ||
                    original.parameterTypes.isEmpty() && original.returnType == "V" &&
                    original.accessFlags and AccessFlags.STATIC.value != 0 && instructions.any {
                        val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                        call?.definingClass == "Ljava/lang/System;" && call.name == "currentTimeMillis"
                    }
                if (!incoming) return@forEach
                check(gateIndexes.size == 1)
                val index = gateIndexes.single()
                check(instructions[index].opcode == Opcode.INVOKE_STATIC)
                check(instructions[index + 1].opcode == Opcode.MOVE_RESULT)
                val mutableClass = mutableClassDefBy(classDef)
                val method = mutableClass.methods.single {
                    it.name == original.name && it.parameterTypes == original.parameterTypes &&
                        it.returnType == original.returnType
                }
                incomingMethods.add(method to index)
            }
        }
        check(incomingMethods.size == 5) { "Expected five incoming online-status gates, found ${incomingMethods.size}" }
        val originalSharing = mutableClassDefBy("Lapp/template/extension/extension/NezumiSettings;")
            .methods.single { it.name == "originalOnlineSharing" }
        val implementation = originalSharing.implementation!!
        repeat(implementation.instructions.size) { implementation.removeInstruction(0) }
        originalSharing.addInstructions(0, """
            invoke-static {}, ${preference.definingClass}->${preference.name}()Z
            move-result v0
            return v0
        """.trimIndent())
        incomingMethods.forEach { (method, index) ->
            method.replaceInstruction(index, "invoke-static {}, Lapp/template/extension/extension/NezumiSettings;->shouldFetchOnlineStatus()Z")
        }
        check(OnlineListResponse.matchAll(1..1).size == 1)
        val response = OnlineListResponse.method
        val responseInstructions = response.implementation!!.instructions.toList()
        val dataIndex = responseInstructions.indices.single { index ->
            val call = (responseInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == "Lorg/json/JSONObject;" && call.name == "getJSONObject" &&
                call.parameterTypes == listOf("Ljava/lang/String;")
        }
        check(responseInstructions[dataIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        val dataRegister = (responseInstructions[dataIndex + 1] as OneRegisterInstruction).registerA
        check(dataRegister <= 15)
        response.addInstructions(dataIndex + 2,
            "invoke-static {v$dataRegister}, Lapp/template/extension/extension/NezumiSettings;->traceOnlineResponse(Lorg/json/JSONObject;)V")
        check(FriendListResponse.matchAll(1..1).size == 1)
        val friendResponse = FriendListResponse.method
        val friendInstructions = friendResponse.implementation!!.instructions.toList()
        val onlineArrayIndex = friendInstructions.indices.single { index ->
            val call = (friendInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            val key = if (index > 0) {
                ((friendInstructions[index - 1] as? ReferenceInstruction)?.reference as? StringReference)?.string
            } else null
            call?.definingClass == "Lorg/json/JSONObject;" && call.name == "isNull" && key == "onlines"
        }
        val onlineArrayCall = friendInstructions[onlineArrayIndex] as FiveRegisterInstruction
        check(onlineArrayCall.registerCount == 2)
        friendResponse.replaceInstruction(onlineArrayIndex,
            "invoke-static {v${onlineArrayCall.registerC}}, $SETTINGS_CLASS->traceFriendListResponse(Lorg/json/JSONObject;)V")
        friendResponse.addInstructions(onlineArrayIndex + 1,
            "invoke-static {v${onlineArrayCall.registerC}}, $SETTINGS_CLASS->updateChatOnlineUsers(Lorg/json/JSONObject;)V\n" +
                "invoke-virtual {v${onlineArrayCall.registerC}, v${onlineArrayCall.registerD}}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z")
        check(LastSeenResponse.matchAll(1..1).size == 1)
        val lastSeen = LastSeenResponse.method
        val lastSeenInstructions = lastSeen.implementation!!.instructions.toList()
        val timestampIndex = lastSeenInstructions.indices.single { index ->
            ((lastSeenInstructions[index] as? ReferenceInstruction)?.reference as? StringReference)?.string == "timestamp"
        }
        val timestampInstruction = lastSeenInstructions[timestampIndex] as OneRegisterInstruction
        val timestampCall = lastSeenInstructions[timestampIndex + 1] as FiveRegisterInstruction
        val timestampReference = (lastSeenInstructions[timestampIndex + 1] as ReferenceInstruction).reference as MethodReference
        check(timestampReference.definingClass == "Lorg/json/JSONObject;" && timestampReference.name == "optLong")
        check(timestampCall.registerCount == 2 && timestampCall.registerC <= 15)
        lastSeen.replaceInstruction(timestampIndex,
            "invoke-static {v${timestampCall.registerC}}, Lapp/template/extension/extension/NezumiSettings;->traceLastSeenResponse(Lorg/json/JSONObject;)V")
        lastSeen.addInstructions(timestampIndex + 1,
            "const-string v${timestampInstruction.registerA}, \"timestamp\"")
        val socketType = "Lcom/zing/zalocore/connection/socket/NativeSocket;"
        val socket = mutableClassDefBy(socketType)
        socket.accessFlags = socket.accessFlags or AccessFlags.PUBLIC.value
        val stateBridge = socket.methods.single { method ->
            method.accessFlags and AccessFlags.PUBLIC.value != 0 &&
                method.accessFlags and AccessFlags.STATIC.value != 0 &&
                method.parameterTypes == listOf("I") && method.returnType == "V" &&
                method.implementation?.instructions?.any {
                    val call = (it as? ReferenceInstruction)?.reference as? MethodReference
                    call?.definingClass == socketType && call.name == "nativeChangedStateApplication"
                } == true
        }
        var stateHooks = 0
        socket.methods.filter { it.implementation != null }.forEach { method ->
            val instructions = method.implementation!!.instructions.toList()
            instructions.indices.reversed().forEach { index ->
                val call = (instructions[index] as? ReferenceInstruction)?.reference as? MethodReference
                if (call?.definingClass != socketType ||
                    call.name !in setOf("nativeChangedStateApplication", "nativeInitSocket")) return@forEach
                val invoke = instructions[index] as FiveRegisterInstruction
                val register = if (call.name == "nativeInitSocket") {
                    check(invoke.registerCount == 4 && call.parameterTypes == listOf("I", "I", "I"))
                    invoke.registerF
                } else {
                    check(invoke.registerCount == 1 && call.parameterTypes == listOf("I"))
                    invoke.registerC
                }
                check(register <= 15)
                val originalCall = if (call.name == "nativeInitSocket") {
                    "invoke-direct {v${invoke.registerC}, v${invoke.registerD}, v${invoke.registerE}, v${invoke.registerF}}, $socketType->nativeInitSocket(III)V"
                } else {
                    "invoke-static {v$register}, $socketType->nativeChangedStateApplication(I)V"
                }
                method.replaceInstruction(index,
                    "invoke-static {v$register}, Lapp/template/extension/extension/NezumiSettings;->mapOnlineState(I)I")
                method.addInstructions(index + 1, "move-result v$register\n$originalCall")
                stateHooks++
            }
        }
        check(stateHooks == 2) { "Expected two socket activity hooks, found $stateHooks" }
        val publishState = mutableClassDefBy("Lapp/template/extension/extension/NezumiSettings;")
            .methods.single { it.name == "publishOnlineState" }
        repeat(publishState.implementation!!.instructions.size) {
            publishState.implementation!!.removeInstruction(0)
        }
        publishState.addInstructions(0, "invoke-static {p0}, $socketType->${stateBridge.name}(I)V\nreturn-void")
        val applySharing = mutableClassDefBy("Lapp/template/extension/extension/NezumiSettings;")
            .methods.single { it.name == "applyOriginalOnlineSharing" }
        repeat(applySharing.implementation!!.instructions.size) {
            applySharing.implementation!!.removeInstruction(0)
        }
        applySharing.addInstructions(0, "const/16 v0, 0x1b\ninvoke-static {v0, p0}, ${sharingSetter.definingClass}->${sharingSetter.name}(II)V\nreturn-void")
        val available = mutableClassDefBy("Lapp/template/extension/extension/NezumiSettings;")
            .methods.single { it.name == "isOnlinePatchAvailable" }
        repeat(available.implementation!!.instructions.size) {
            available.implementation!!.removeInstruction(0)
        }
        available.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        val chatView = mutableClassDefBy("Lcom/zing/zalo/ui/chat/ChatView;")
        check(ChatOnlineListRefresh.matchAll(1..1).size == 1)
        val refresh = ChatOnlineListRefresh.method
        val onlineRepository = mutableClassDefBy(refresh.definingClass)
        val refreshInstructions = refresh.implementation!!.instructions.toList()
        check(refresh.implementation!!.registerCount == 5)
        val tabIndex = refreshInstructions.indices.first { index ->
            val call = (refreshInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == "Lcom/zing/zalo/ui/maintab/MainTabView;"
        }
        val networkIndex = refreshInstructions.indices.first { index ->
            val call = (refreshInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            index > tabIndex && refreshInstructions[index].opcode == Opcode.INVOKE_STATIC &&
                call?.parameterTypes?.isEmpty() == true && call.returnType == "Z"
        }
        check(networkIndex > tabIndex)
        val dispatchIndex = refreshInstructions.indices.single { index ->
            val call = (refreshInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            call?.name == "H0" && call.parameterTypes == listOf("Ljava/lang/String;") &&
                call.returnType == "V"
        }
        check(dispatchIndex > networkIndex)
        refresh.addInstructions(dispatchIndex,
            "invoke-static {}, $SETTINGS_CLASS->traceChatOnlineDispatch()V")
        refresh.addInstructionsWithLabels(tabIndex, """
            invoke-static {}, $SETTINGS_CLASS->isChatOnlineRefresh()Z
            move-result v0
            if-nez v0, :nezumi_chat_network
        """.trimIndent(), ExternalLabel("nezumi_chat_network", refreshInstructions[networkIndex]))
        val throttleIndex = refreshInstructions.indices.single { index ->
            refreshInstructions[index].opcode == Opcode.CONST_WIDE_32 &&
                (refreshInstructions[index] as? WideLiteralInstruction)?.wideLiteral == 60000L
        }
        check(throttleIndex < tabIndex)
        val throttleRegister = (refreshInstructions[throttleIndex] as OneRegisterInstruction).registerA
        refresh.replaceInstruction(throttleIndex,
            "invoke-static {}, $SETTINGS_CLASS->onlineRefreshInterval()J")
        refresh.addInstructions(throttleIndex + 1, "move-result-wide v$throttleRegister")
        refresh.addInstructions(0,
            "invoke-static {p0}, $SETTINGS_CLASS->traceChatOnlineGate(Ljava/lang/Object;)V")
        val requestBridge = mutableClassDefBy(SETTINGS_CLASS).methods.single { it.name == "requestChatOnlineList" }
        check(requestBridge.implementation!!.registerCount >= 1)
        repeat(requestBridge.implementation!!.instructions.size) { requestBridge.implementation!!.removeInstruction(0) }
        requestBridge.addInstructions(0, """
            invoke-static {}, ${onlineRepository.type}->n()${onlineRepository.type}
            move-result-object v0
            invoke-virtual {v0}, ${onlineRepository.type}->${refresh.name}()V
            return-void
        """.trimIndent())
        val chatArguments = chatView.methods.single { method ->
            method.parameterTypes == listOf("Landroid/os/Bundle;") &&
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "Wrong chat argument: UID is null or empty. Current uid empty? "
                } == true
        }
        check(chatArguments.implementation!!.registerCount == 5)
        chatArguments.addInstructions(0,
            "invoke-static {p0, p1}, $SETTINGS_CLASS->setChatPresenceTarget(Ljava/lang/Object;Landroid/os/Bundle;)V")
        val subtitleMethod = chatView.methods.single {
            it.parameterTypes.isEmpty() &&
                it.returnType == "Lcom/zing/zalo/ui/widget/RobotoTextView;" &&
                it.implementation?.instructions?.any { instruction ->
                    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    call?.name == "getMiddleSubTitleItem" &&
                        call.definingClass == "Lcom/zing/zalo/zdesign/component/header/ZdsActionBar;"
                } == true
        }
        val subtitleInstructions = subtitleMethod.implementation!!.instructions.toList()
        val subtitleGetterIndex = subtitleInstructions.indices.single { index ->
            val call = (subtitleInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            call?.name == "getMiddleSubTitleItem" && call.parameterTypes.isEmpty()
        }
        check(subtitleInstructions[subtitleGetterIndex + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        val subtitleRegister = (subtitleInstructions[subtitleGetterIndex + 1] as OneRegisterInstruction).registerA
        check(subtitleRegister <= 15)
        subtitleMethod.addInstructions(subtitleGetterIndex + 2,
            "invoke-static {p0, v$subtitleRegister}, $SETTINGS_CLASS->bindChatSubtitle(Ljava/lang/Object;Landroid/widget/TextView;)V")
        val subtitleSetter = chatView.methods.single { method ->
            method.parameterTypes.size == 2 && method.parameterTypes.first() == "Ljava/lang/CharSequence;" &&
                method.returnType == "V" && method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "tip.csc.headername"
                } == true
        }
        val setterInstructions = subtitleSetter.implementation!!.instructions.toList()
        check(subtitleSetter.implementation!!.registerCount == 5)
        val clearIndex = setterInstructions.indices.single { index ->
            setterInstructions[index].opcode == Opcode.CONST_16 &&
                (setterInstructions[index] as? WideLiteralInstruction)?.wideLiteral == 8L
        }
        val clearValue = (setterInstructions[clearIndex] as OneRegisterInstruction).registerA
        val hideCall = setterInstructions[clearIndex + 1] as FiveRegisterInstruction
        val hideReference = (setterInstructions[clearIndex + 1] as ReferenceInstruction).reference as MethodReference
        check(hideReference.name == "setVisibility" && hideCall.registerD == clearValue)
        check(setterInstructions[clearIndex + 4].opcode == Opcode.RETURN_VOID)
        subtitleSetter.replaceInstruction(clearIndex,
            "invoke-static {v${hideCall.registerC}}, $SETTINGS_CLASS->retainChatOnlineSubtitle(Landroid/widget/TextView;)Z")
        subtitleSetter.addInstructionsWithLabels(clearIndex + 1, """
            move-result v$clearValue
            if-nez v$clearValue, :nezumi_subtitle_retained
            const/16 v$clearValue, 0x8
        """.trimIndent(), ExternalLabel("nezumi_subtitle_retained", setterInstructions[clearIndex + 4]))
        attachNezumiSettings()
    }
}