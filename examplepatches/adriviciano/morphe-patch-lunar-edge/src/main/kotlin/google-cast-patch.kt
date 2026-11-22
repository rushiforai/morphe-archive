package local.lunaredge.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.document
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val CAST_ROOT = "Lcom/lunaredge/browser/"
private const val CAST_PLAYER = "Lchuangyuan/ycj/videolibrary/video/ExoUserPlayer;"

@Suppress("unused")
val enableGoogleCast = patch(
    name = "Enable Google Cast",
    description = "Añade Google Cast con puente CORS para HLS local y controles. Exige la corrección del motor y conserva DLNA. Reproducción confirmada en Android TV.",
    default = true
) {
    compatibleWith(Compatibility(packageName = "com.lunaredge.browser", name = "Lunar Edge", targets = listOf(AppTarget("4.0.2", 40002))))
    // Cast nunca debe generar una APK que vuelva a rechazar su nueva firma.
    dependsOn(fixLocalVideoEngine)
    extendWith("extensions/cast.mpe")
    execute {
        // La lista DLNA existente enlaza este servicio, ausente del manifiesto original.
        document("AndroidManifest.xml").use { manifest ->
            val namespace = "http://schemas.android.com/apk/res/android"
            fun androidName(node: org.w3c.dom.Node): String {
                val element = node as org.w3c.dom.Element
                return element.getAttributeNS(namespace, "name").ifEmpty { element.getAttribute("android:name") }
            }
            val application = manifest.getElementsByTagName("application").item(0)
            val services = manifest.getElementsByTagName("service")
            val name = "com.android.cast.dlna.dmc.DLNACastService"
            if ((0 until services.length).none { androidName(services.item(it)) == name }) {
                val service = manifest.createElement("service")
                service.setAttributeNS(namespace, "android:name", name)
                service.setAttributeNS(namespace, "android:exported", "false")
                application.appendChild(service)
            }
            val backgroundName = "local.lunaredge.cast.CastKeepAliveService"
            if ((0 until services.length).none { androidName(services.item(it)) == backgroundName }) {
                val service = manifest.createElement("service")
                service.setAttributeNS(namespace, "android:name", backgroundName)
                service.setAttributeNS(namespace, "android:exported", "false")
                service.setAttributeNS(namespace, "android:stopWithTask", "false")
                service.setAttributeNS(namespace, "android:foregroundServiceType", "connectedDevice")
                application.appendChild(service)
            }
            val permissions = manifest.getElementsByTagName("uses-permission")
            for (permission in listOf("FOREGROUND_SERVICE", "FOREGROUND_SERVICE_CONNECTED_DEVICE", "WAKE_LOCK", "CHANGE_NETWORK_STATE", "CHANGE_WIFI_STATE", "POST_NOTIFICATIONS")) {
                val fullName = "android.permission.$permission"
                if ((0 until permissions.length).none { androidName(permissions.item(it)) == fullName }) {
                    val element = manifest.createElement("uses-permission")
                    element.setAttributeNS(namespace, "android:name", fullName)
                    manifest.documentElement.insertBefore(element, application)
                }
            }
        }
        // El traspaso debe pausar, nunca liberar, el reproductor original.
        val pause = mutableClassDefBy(CAST_PLAYER).methods.single {
            it.name == "L" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        val calls = pause.implementation!!.instructions.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() }
        check(calls.any { it.endsWith("->setPlayWhenReady(Z)V") } && calls.none { it == "${CAST_PLAYER}->R()V" }) {
            "La función de pausa local ha cambiado: no se añade Cast a esta variante."
        }
        val playerClass = mutableClassDefBy("${CAST_ROOT}ui/JYAlternativeZero;")
        val fields = playerClass.fields.associate { it.name to it.type }
        check(fields["D"] == "I" && fields["l"] == "Ljava/util/List;" && fields["j"] == CAST_PLAYER && fields["k"] == "${CAST_ROOT}netbean/JybThrowTask;") {
            "El reproductor ha cambiado: no se añade Cast a esta variante."
        }
        // Siempre se ejecuta super; solo se omite la parada/reanudación local mientras esta Activity emite.
        for (name in listOf("onPause", "onResume")) {
            val method = playerClass.methods.single { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" }
            val implementation = method.implementation!!
            check(implementation.registerCount >= 2) { "Sin registro local para proteger $name." }
            val instructions = implementation.instructions.toList()
            val superIndex = instructions.indexOfFirst {
                it.opcode in listOf(Opcode.INVOKE_SUPER, Opcode.INVOKE_SUPER_RANGE) && (it as? ReferenceInstruction)?.reference.toString().endsWith("->$name()V")
            }
            check(superIndex >= 0 && superIndex + 1 < instructions.size) { "Ciclo de vida incompatible: $name." }
            method.addInstructionsWithLabels(superIndex + 1,
                "invoke-static/range {p0 .. p0}, Llocal/lunaredge/cast/CastBackground;->keepAlive(Landroid/app/Activity;)Z\n" +
                "move-result v0\nif-eqz v0, :lunar_continue\nreturn-void",
                ExternalLabel("lunar_continue", instructions[superIndex + 1]))
        }
        val deviceControl = "Lcom/android/cast/dlna/dmc/control/DeviceControl;"
        val device = "Lorg/fourthline/cling/model/meta/Device;"
        for (suffix in listOf("\$26", "\$27")) {
            val callback = mutableClassDefBy("${CAST_ROOT}ui/JYAlternativeZero$suffix;")
            check(callback.fields.count { it.type == "${CAST_ROOT}ui/JYAlternativeZero;" } == 1)
            callback.methods.single { it.name == "a" && it.parameterTypes.map(CharSequence::toString) == listOf(deviceControl, device) }.addInstructions(0,
                "invoke-static/range {p0 .. p1}, Llocal/lunaredge/cast/CastBackground;->beginDlna(Ljava/lang/Object;Ljava/lang/Object;)V")
        }
        val controlName = "Lcom/android/cast/dlna/dmc/control/CastControlImpl;"
        val control = mutableClassDefBy(controlName)
        control.methods.single { it.name == "a" && it.parameterTypes.size == 1 }.addInstructions(0,
            "invoke-static/range {p0 .. p0}, Llocal/lunaredge/cast/CastBackground;->dlnaStopped(Ljava/lang/Object;)V")
        control.methods.single { it.name == "e" && it.parameterTypes.map(CharSequence::toString) == listOf("Z") }.addInstructions(0,
            "invoke-static/range {p0 .. p1}, Llocal/lunaredge/cast/CastBackground;->dlnaDisposed(Ljava/lang/Object;Z)V")
        val play = control.methods.single { it.name == "c" && it.parameterTypes.size == 2 }
        check(play.implementation!!.registerCount >= 4)
        play.addInstructions(0,
            "invoke-static/range {p0 .. p2}, Llocal/lunaredge/cast/CastBackground;->dlnaPlayCallback(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n" +
            "move-result-object v0\ncheck-cast v0, Lcom/android/cast/dlna/dmc/control/ServiceActionCallback;\nmove-object/from16 p2, v0")
        val subscription = mutableClassDefBy("Lcom/android/cast/dlna/dmc/control/CastControlImpl\$1;")
        check(subscription.fields.count { it.type == controlName } == 1)
        subscription.methods.single { it.name == "c" && it.parameterTypes.size == 2 }.addInstructions(0,
            "invoke-static/range {p0 .. p2}, Llocal/lunaredge/cast/CastBackground;->dlnaEvent(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V")
        for (name in listOf("a", "d")) {
            subscription.methods.single { it.name == name && it.parameterTypes.size == 1 }.addInstructions(0,
                "invoke-static/range {p0 .. p0}, Llocal/lunaredge/cast/CastBackground;->dlnaDisconnected(Ljava/lang/Object;)V")
        }
        val methods = listOf("transformRules" to "lunarDlnaPortrait", "willWindow" to "lunarDlnaLandscape").map { (name, fallback) ->
            val method = playerClass.methods.single { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" }
            check(playerClass.methods.none { it.name == fallback }) { "Cast ya está aplicado. Usa la entrada sin el parche Cast." }
            val original = MutableMethod(ImmutableMethod.of(method)).apply { this.name = fallback }
            method to original
        }
        methods.forEach { (method, original) ->
            playerClass.methods.add(original)
            method.addInstructions(0, "invoke-static/range {p0 .. p0}, Llocal/lunaredge/cast/CastBridge;->show(Landroid/app/Activity;)V\nreturn-void")
        }
    }
}
