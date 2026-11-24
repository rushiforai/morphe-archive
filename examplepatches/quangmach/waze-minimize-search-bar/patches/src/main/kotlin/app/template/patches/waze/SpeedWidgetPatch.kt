package app.template.patches.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Element

internal const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private const val LOCATION_LISTENER = "Lcom/waze/location/LocationSensorListener;"
internal const val WIDGET_PACKAGE = "app.template.extension.extension"
private const val WIDGET_SERVICE = "Lapp/template/extension/extension/SpeedWidgetService;"
private const val PROJECTION_AUTHORITY = "androidx.car.app.connection"
private const val WAZE_CONFIG = "Lcom/waze/config/ConfigValues;"
private const val WAZE_STRING_CONFIG = "Lcom/waze/config/d;"
private const val SIGN_STYLE = "CONFIG_VALUE_MAP_SPEEDOMETER_STYLE"

private object WazeWidgetApplication : Fingerprint(
    definingClass = "Lcom/waze/ls;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
)

private object WazeWidgetMapResume : Fingerprint(
    definingClass = "Lcom/waze/MainActivity;",
    name = "onResume",
    parameters = emptyList(),
    returnType = "V",
)

private object WazeStringConfigValue : Fingerprint(
    definingClass = WAZE_STRING_CONFIG,
    name = "a",
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
)

private object WazeSpeedUpdate : Fingerprint(
    definingClass = LOCATION_LISTENER,
    name = "updateSpeedometer",
    parameters = listOf("I", "Ljava/lang/String;", "I", "D"),
    returnType = "V",
)

private object WazeLastLocation : Fingerprint(
    definingClass = LOCATION_LISTENER,
    name = "getLastLocation",
    parameters = emptyList(),
    returnType = "Landroid/location/Location;",
)

private object WazeEngineInitializer : Fingerprint(
    definingClass = "Lcom/waze/ls;",
    name = "d",
    parameters = listOf("Lg/d/e;"),
    returnType = "Ljava/lang/Object;",
)

private object WazeEngineStarted : Fingerprint(
    definingClass = "Lcom/waze/NativeManager;",
    name = "isAppStarted",
    parameters = emptyList(),
    returnType = "Z",
)

internal fun Element.androidAttribute(name: String, value: String) =
    setAttributeNS(ANDROID_NS, "android:$name", value)

internal fun MutableClass.bindWidgetMethod(name: String, registers: Int, instructions: String) {
    val stub = methods.single { it.name == name }
    val bound = ImmutableMethod(
        stub.definingClass,
        stub.name,
        stub.parameters,
        stub.returnType,
        stub.accessFlags,
        stub.annotations,
        stub.hiddenApiRestrictions,
        MutableMethodImplementation(registers),
    ).toMutable()
    bound.addInstructionsWithLabels(0, instructions)
    methods.remove(stub)
    methods.add(bound)
}

internal fun Element.addWidgetProvider(className: String, label: String, info: String) {
    val manifest = ownerDocument
    appendChild(manifest.createElement("receiver").apply {
        androidAttribute("name", "$WIDGET_PACKAGE.$className")
        androidAttribute("exported", "false")
        androidAttribute("label", label)
        appendChild(manifest.createElement("intent-filter").apply {
            appendChild(manifest.createElement("action").apply {
                androidAttribute("name", "android.appwidget.action.APPWIDGET_UPDATE")
            })
        })
        appendChild(manifest.createElement("meta-data").apply {
            androidAttribute("name", "android.appwidget.provider")
            androidAttribute("resource", "@xml/$info")
        })
    })
}

internal fun copyWidgetResource(name: String) {
    val file = resourceFile("res/$name", false)
    file.parentFile.mkdirs()
    checkNotNull(WazeSpeedUpdate.javaClass.getResourceAsStream("/speed-widget/$name")).use { input ->
        file.outputStream().use { output -> input.copyTo(output) }
    }
}

private val widgetSupportResources = patch {
    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val queries = (manifest.getElementsByTagName("queries").item(0) as? Element)
                ?: manifest.createElement("queries").also { manifest.documentElement.insertBefore(it, application) }
            val queryProviders = queries.getElementsByTagName("provider")
            if ((0 until queryProviders.length).none {
                    (queryProviders.item(it) as Element).getAttributeNS(ANDROID_NS, "authorities") == PROJECTION_AUTHORITY
                }) {
                queries.appendChild(manifest.createElement("provider").apply {
                    androidAttribute("authorities", PROJECTION_AUTHORITY)
                })
            }
            val existingPermissions = manifest.getElementsByTagName("uses-permission")
            listOf(
                "ACCESS_COARSE_LOCATION",
                "ACCESS_FINE_LOCATION",
                "ACCESS_BACKGROUND_LOCATION",
                "ACTIVITY_RECOGNITION",
                "BLUETOOTH_CONNECT",
                "RECEIVE_BOOT_COMPLETED",
                "FOREGROUND_SERVICE",
                "FOREGROUND_SERVICE_LOCATION",
                "POST_NOTIFICATIONS",
            ).forEach { name ->
                val permission = "android.permission.$name"
                if ((0 until existingPermissions.length).none {
                        (existingPermissions.item(it) as Element).getAttributeNS(ANDROID_NS, "name") == permission
                    }) {
                    manifest.documentElement.insertBefore(manifest.createElement("uses-permission").apply {
                        androidAttribute("name", permission)
                    }, application)
                }
            }

            application.appendChild(manifest.createElement("service").apply {
                androidAttribute("name", "$WIDGET_PACKAGE.SpeedWidgetService")
                androidAttribute("exported", "false")
                androidAttribute("foregroundServiceType", "location")
            })
            mapOf(
                "SpeedWidgetBluetooth" to listOf(
                    "android.bluetooth.device.action.ACL_CONNECTED",
                    "android.bluetooth.device.action.ACL_DISCONNECTED",
                    "android.bluetooth.adapter.action.STATE_CHANGED",
                ),
                "SpeedWidgetAuto" to listOf(
                    "android.intent.action.BOOT_COMPLETED",
                    "android.intent.action.MY_PACKAGE_REPLACED",
                ),
            ).forEach { (className, actions) ->
                application.appendChild(manifest.createElement("receiver").apply {
                    androidAttribute("name", "$WIDGET_PACKAGE.$className")
                    androidAttribute("exported", (className == "SpeedWidgetBluetooth").toString())
                    appendChild(manifest.createElement("intent-filter").apply {
                        actions.forEach { action ->
                            appendChild(manifest.createElement("action").apply { androidAttribute("name", action) })
                        }
                    })
                })
            }
            application.appendChild(manifest.createElement("activity").apply {
                androidAttribute("name", "$WIDGET_PACKAGE.SpeedWidgetControls")
                androidAttribute("exported", "false")
                androidAttribute("excludeFromRecents", "true")
                androidAttribute("taskAffinity", "")
                androidAttribute("theme", "@android:style/Theme.Material.Dialog.Alert")
            })
            application.appendChild(manifest.createElement("activity").apply {
                androidAttribute("name", "$WIDGET_PACKAGE.SpeedWidgetAutoSettings")
                androidAttribute("exported", "false")
                androidAttribute("excludeFromRecents", "true")
                androidAttribute("taskAffinity", "")
                androidAttribute("theme", "@android:style/Theme.Material.Dialog.Alert")
            })
        }
    }
}

internal val widgetSupport = patch {
    extendWith("extensions/speed-widget.mpe")
    dependsOn(widgetSupportResources)
    execute {
        val location = WazeLastLocation.method
        val update = WazeSpeedUpdate.method
        val initializer = WazeEngineInitializer.method
        val started = WazeEngineStarted.method
        val application = WazeWidgetApplication.method
        val superOnCreate = application.implementation!!.instructions.indexOfFirst {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Landroid/app/Application;" && reference.name == "onCreate"
        }
        check(superOnCreate >= 0)
        application.addInstructions(superOnCreate + 1, """
            invoke-static/range {p0 .. p0}, Lapp/template/extension/extension/SpeedWidgetProjection;->observe(Landroid/content/Context;)V
        """)
        WazeWidgetMapResume.method.addInstructions(0, """
            invoke-static/range {p0 .. p0}, Lapp/template/extension/extension/SpeedWidgetProjection;->checkConnection(Landroid/content/Context;)V
        """)
        check(update.implementation!!.registerCount > 6)
        update.addInstructions(0, """
            invoke-virtual/range {p0 .. p0}, ${location.definingClass}->${location.name}()Landroid/location/Location;
            move-result-object v0
            invoke-static {p2, p3, v0}, $WIDGET_SERVICE->onWazeLimit(Ljava/lang/String;ILandroid/location/Location;)V
        """)

        val startup = initializer.implementation!!.instructions
        val gate = startup.indexOfFirst { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            call?.definingClass == "Ljava/util/concurrent/atomic/AtomicBoolean;" && call.name == "getAndSet"
        }
        check(gate >= 0 && startup[gate + 1].opcode == Opcode.MOVE_RESULT && startup[gate + 2].opcode == Opcode.IF_NEZ)
        initializer.addInstructions(gate + 3, """
            invoke-static/range {p1 .. p1}, $WIDGET_SERVICE->onWazeEngineInitializing(Ljava/lang/Object;)V
        """)

        // Reuse the active engine. For overlapping cold starts, Waze's initializer
        // uses its own atomic gate and shared completion to run the startup only once.
        val service = mutableClassDefBy(WIDGET_SERVICE)
        val configGetter = WazeStringConfigValue.method
        check(classDefBy(WAZE_CONFIG).fields.any { it.name == SIGN_STYLE && it.type == WAZE_STRING_CONFIG })
        service.bindWidgetMethod("readWazeSignStyle", 1, """
            sget-object v0, $WAZE_CONFIG->$SIGN_STYLE:$WAZE_STRING_CONFIG
            invoke-virtual {v0}, ${configGetter.definingClass}->${configGetter.name}()Ljava/lang/String;
            move-result-object v0
            return-object v0
        """)
        service.bindWidgetMethod("startWazeEngine", 3, """
            invoke-static {}, ${started.definingClass}->${started.name}()Z
            move-result v0
            if-nez v0, :ready
            check-cast p0, ${initializer.definingClass}
            const-class v0, Lg/d/e;
            sget-object v1, Lg/d/k;->a:Lg/d/k;
            invoke-static {v0, v1, p0}, $WIDGET_SERVICE->newContinuation(Ljava/lang/Class;Ljava/lang/Object;Landroid/app/Application;)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lg/d/e;
            invoke-virtual {p0, v0}, ${initializer.definingClass}->${initializer.name}(Lg/d/e;)Ljava/lang/Object;
            :ready
            return-void
        """)
    }
}
