package patches.detijd

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val CIM = "Lcom/endare/mediafin/modules/NativeCimTrackerModule;"
private const val VIDEO = "Lcom/endare/mediafin/modules/NativeGemiusVideoTrackerModule;"

internal val nativeTracking = bytecodePatch {
    dependsOn(originalInput, trackingResources)
    execute {
        nativeMethod(CIM, "trackOnAppOpen()V", 4, 11, listOf("open_app", "onOpenApp"))
            .addInstructions(0, "return-void")
        nativeMethod(CIM, "trackScreen(Ljava/lang/String;)V", 4, 11, listOf("screen"))
            .addInstructions(0, "return-void")
        nativeMethod(VIDEO, "newAd(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V", 7, 37, listOf("adId", "adData"))
            .addInstructions(0, "return-void")
        nativeMethod(VIDEO, "newProgram(Ljava/lang/String;Lcom/facebook/react/bridge/ReadableMap;)V", 7, 33, listOf("programId", "programData"))
            .addInstructions(0, "return-void")
        nativeMethod(VIDEO, "trackAdEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;DLcom/facebook/react/bridge/ReadableMap;)V",
            13, 88, listOf("adId", "event"))
            .addInstructions(0, "return-void")
        nativeMethod(VIDEO, "trackProgramEvent(Ljava/lang/String;Ljava/lang/String;DLcom/facebook/react/bridge/ReadableMap;)V",
            9, 60, listOf("programId", "event"))
            .addInstructions(0, "return-void")

        // R8-renamed audio Snowplow method: require its content and actual
        // tracker dispatch as well as the pinned descriptor and method shape.
        val audio = nativeMethod("Llb/b;", "e(Ljava/util/Map;ZLjava/lang/String;)V", 5, 30, listOf("data", "schema"))
        check(audio.instructions.count { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            reference?.toString() == "Lop/b;->f(Lrp/d;)Ljava/util/UUID;"
        } == 1) { "De Tijd audio Snowplow dispatch changed" }
        audio.addInstructions(0, "return-void")

        val startup = nativeMethod("Lcom/endare/mediafin/MainApplication;", "onCreate()V", 3, 21,
            listOf("De Tijd App", "5.6.1", "https://gabe.hit.gemius.pl"))
        val code = startup.instructions.toList()
        val start = code.withIndex().filter { (_, instruction) ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.toString() ==
                "Lcom/gemius/sdk/a;->a(Landroid/content/Context;)V"
        }.single().index
        val tail = code.drop(start)
        val calls = tail.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.map { it.toString() }
        check(start == 6 && tail.size == 15 && tail.last().opcode == Opcode.RETURN_VOID && calls == listOf(
            "Lcom/gemius/sdk/a;->a(Landroid/content/Context;)V",
            "Lcom/gemius/sdk/Config;->setAppInfo(Ljava/lang/String;Ljava/lang/String;)V",
            "Lcom/gemius/sdk/Config;->setDataProcessingConsentSource(Lcom/gemius/sdk/usertracking/DataProcessingConsentSource;)V",
            "Lcom/gemius/sdk/audience/AudienceConfig;->getSingleton()Lcom/gemius/sdk/audience/AudienceConfig;",
            "Lcom/gemius/sdk/audience/AudienceConfig;->setHitCollectorHost(Ljava/lang/String;)V",
            "Lcom/gemius/sdk/audience/AudienceConfig;->getSingleton()Lcom/gemius/sdk/audience/AudienceConfig;",
            "Lcom/gemius/sdk/audience/BaseConfig;->setScriptIdentifier(Ljava/lang/String;)V",
        )) { "De Tijd Gemius startup block changed" }
        // The complete tail before the existing return is Gemius-only. Keep
        // React Native/Expo/application startup and its original final return.
        startup.removeInstructions(start, tail.size - 1)
    }
}
