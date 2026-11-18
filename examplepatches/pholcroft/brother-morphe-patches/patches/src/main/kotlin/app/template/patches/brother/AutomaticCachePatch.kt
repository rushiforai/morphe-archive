package app.template.patches.brother

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CLIENT = "Lcom/brother/sdk/common/socket/devicemanagement/snmp/SnmpClient;"
private const val REQUEST = "Lcom/brother/sdk/common/socket/devicemanagement/snmp/SnmpRequest;"
private const val RESULT = "Lcom/brother/sdk/common/socket/devicemanagement/snmp/SnmpResult;"
private const val AUTO = "Lapp/template/extension/extension/AutoCache;"
private const val ACTIVITY = "app.template.extension.extension.CacheSettingsActivity"

@Suppress("unused")
val automaticBrotherCache = patch(
    name = "Faster print previews",
    description = "Speed up print previews by remembering your printer's details instead of asking for them every time. The first preview may be slower while the app learns; later previews will open much faster.",
    default = true
) {
    compatibleWith(Compatibility(name="Brother Print Service Plugin",packageName="com.brother.printservice",apkFileType=ApkFileType.APK,appIconColor=0x0033A0,targets=listOf(AppTarget(version="1.17.0"))))
    extendWith("extensions/extension.mpe")
    execute {
        Fingerprint(definingClass="Lcom/brother/printservice/GlobalApp;",name="onCreate",returnType="V",parameters=emptyList()).method.addInstruction(1,
            "invoke-static {p0}, $AUTO->init(Landroid/content/Context;)V")

        val settings = Fingerprint(definingClass="Lcom/brother/printservice/settings/SettingsActivity;", name="onCreate", returnType="V", parameters=listOf("Landroid/os/Bundle;"), filters=listOf(methodCall(name="setContentView")))
        settings.method.addInstruction(settings.instructionMatches.single().index + 1,
            "invoke-static {p0}, Lapp/template/extension/extension/SettingsIntegration;->attach(Landroid/app/Activity;)V")
        val resume = Fingerprint(definingClass="Lcom/brother/printservice/settings/SettingsActivity;", name="onResume", returnType="V", parameters=emptyList()).method
        resume.addInstruction(resume.implementation!!.instructions.count() - 1,
            "invoke-static {p0}, Lapp/template/extension/extension/SettingsIntegration;->attach(Landroid/app/Activity;)V")

        val request = Fingerprint(definingClass=CLIENT,name="requestGet",returnType=RESULT,parameters=listOf(REQUEST,"I","I"),filters=listOf(methodCall(definingClass=CLIENT,name="decResPacket")))
        val method = request.method
        val resultIndex = request.instructionMatches.single().index + 1
        require(method.getInstruction<OneRegisterInstruction>(resultIndex).registerA == 2) { "Unexpected SNMP result register" }
        method.addInstruction(resultIndex + 1,"invoke-static {v6, p1, v2}, $AUTO->record(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V")
        method.addInstructionsWithLabels(0,"""
            iget-object v0, p0, $CLIENT->mSocket:Lcom/brother/sdk/common/socket/ISocket;
            invoke-static {v0, p1, p2, p3}, $AUTO->lookup(Ljava/lang/Object;Ljava/lang/Object;II)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :original
            check-cast v0, $RESULT
            return-object v0
            :original
            nop
        """)
        // A wrapper provides a finally path for unchecked exceptions as well as
        // SDK timeouts, without changing the SDK's existing exception handlers.
        val clientClass=mutableClassDefBy(CLIENT)
        val alias="morpheOriginalRequestGet"
        require(clientClass.methods.none { it.name == alias }) { "SNMP wrapper already exists" }
        clientClass.methods.remove(method)
        method.setName(alias)
        clientClass.methods.add(method)
        val wrapper=ImmutableMethod(CLIENT,"requestGet",listOf(REQUEST,"I","I").map { ImmutableMethodParameter(it,null,null) },RESULT,
            method.accessFlags,null,null,MutableMethodImplementation(6)).toMutable()
        wrapper.addInstructionsWithLabels(0,"""
            invoke-virtual {p0, p1, p2, p3}, $CLIENT->$alias(${REQUEST}II)$RESULT
            move-result-object v0
            invoke-static {}, $AUTO->finishRequest()V
            return-object v0
            move-exception v1
            invoke-static {}, $AUTO->finishRequest()V
            throw v1
        """)
        wrapper.implementation!!.apply { addCatch(newLabelForIndex(0),newLabelForIndex(2),newLabelForIndex(4)) }
        clientClass.methods.add(wrapper)
        resourceXml("AndroidManifest.xml").use { manifest ->
            require(manifest.elements("activity").none { it.attribute("android:name") == ACTIVITY })
            manifest.elements("application").first().appendChild("activity") {
                setAttribute("android:name", ACTIVITY)
                setAttribute("android:exported", "true")
            }
            manifest.elements("application").first().appendChild("activity") {
                setAttribute("android:name", "app.template.extension.extension.ReplayDiffActivity")
                setAttribute("android:exported", "false")
            }
            manifest.elements("application").first().appendChild("activity") {
                setAttribute("android:name", "app.template.extension.extension.DiagnosticsActivity")
                setAttribute("android:exported", "false")
            }
            manifest.elements("application").first().appendChild("activity") {
                setAttribute("android:name", "app.template.extension.extension.ActivityHistoryActivity")
                setAttribute("android:exported", "false")
            }
        }
        resourceXml("res/xml/print_service.xml").use { xml ->
            xml.root.setAttribute("android:settingsActivity", "com.brother.printservice.settings.SettingsActivity")
        }
    }
}

