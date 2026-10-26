import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File
import kotlin.test.assertEquals
import kotlin.test.assertTrue

private const val PKG = "com.hdoapp.hdo_box"
private const val APK = "hdo_box_app_4.4.7.apk"
private const val VERSION = "4.4.7"

private const val UNITY_ADS_PLUGIN_CHANNEL = "com.rebeloid.unity_ads"
private const val FLUTTER_FIREBASE_ANALYTICS_PLUGIN =
    "Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAnalyticsPlugin;"
private const val ADS_SDK_INITIALIZER =
    "Lcom/unity3d/services/core/configuration/AdsSdkInitializer;"

/** Event names the patched plugin is expected to emit instead of the real ad lifecycle. */
private val FAKE_EVENTS = listOf("initComplete", "loadComplete", "showStart", "showComplete")

/** Plugin methods that must be answered locally instead of by the Unity SDK. */
private val AD_METHODS = listOf("init", "showVideo", "load", "isInitialized", "privacyConsent_set")

class HdoBoxSmokeTest {

    @TempDir
    lateinit var workDir: File

    @Test
    fun `HDO Box patches remove ads and analytics and drop tracking permissions`() {
        val root = repoRoot()
        val apk = File(root, APK)

        assumeTrue(apk.exists(), "skipping: $APK not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = VERSION,
            patchNames = setOf(
                "Remove ads", "Disable analytics", "Remove tracking permissions",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val byType = classes.associateBy { it.type }

        assertRemoveAds(classes, byType)
        assertDisableAnalytics(byType)
    }

    private fun assertRemoveAds(classes: List<ClassDef>, byType: Map<String, ClassDef>) {
        val plugin = classes.single { classDef ->
            classDef.methods.any { method ->
                method.strings().contains(UNITY_ADS_PLUGIN_CHANNEL) &&
                    method.name == "onAttachedToEngine"
            }
        }
        val onMethodCall = plugin.method("onMethodCall")
        val strings = onMethodCall.strings()

        // Every patched plugin method is answered with an injected event and success result.
        for (event in FAKE_EVENTS) {
            assertTrue(
                event in strings,
                "${plugin.type}.onMethodCall no longer reports the \"$event\" event",
            )
        }
        for (method in AD_METHODS) {
            assertTrue(
                method in strings,
                "${plugin.type}.onMethodCall no longer intercepts \"$method\"",
            )
        }

        // The injected block starts by reading the method name, and the original dispatcher follows it.
        assertEquals(Opcode.IGET_OBJECT, onMethodCall.instructions().first().opcode)
        assertTrue(
            onMethodCall.strings().size > FAKE_EVENTS.size,
            "${plugin.type}.onMethodCall lost its original dispatcher",
        )

        // `MethodChannel.Result` is an interface, so success must be invoked with invoke-interface;
        // invoke-virtual would pass dex verification but fail at runtime on ART.
        val successCalls = onMethodCall.instructions().filter {
            val method = it.methodOrNull() ?: return@filter false
            method.definingClass == "Lio/flutter/plugin/common/MethodChannel\$Result;" &&
                method.name == "success"
        }
        assertTrue(successCalls.size >= AD_METHODS.size, "injected success calls are missing")
        successCalls.forEach {
            assertEquals(
                Opcode.INVOKE_INTERFACE,
                it.opcode,
                "MethodChannel.Result.success is not invoked with invoke-interface",
            )
        }

        // Each ad lifecycle event must be sent through the plugin's MethodChannel bridge.
        val instructions = onMethodCall.instructions()
        val bridgeCalls = instructions.withIndex().filter { (_, instruction) ->
            instruction.methodOrNull()?.parameterTypes == listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/util/HashMap;",
            )
        }
        val bridgedEvents = bridgeCalls.map { (index, instruction) ->
            val event = (index downTo maxOf(0, index - 4))
                .firstNotNullOfOrNull { instructions[it].stringOrNull() }
                ?: error("bridge call at $index has no event name")
            event to instruction.methodOrNull()!!
        }
        assertEquals(
            setOf("loadComplete", "showStart", "showComplete"),
            bridgedEvents.map { it.first }.toSet(),
            "events are not forwarded through the plugin bridge",
        )
        assertEquals(3, bridgedEvents.size, "unexpected number of bridged ad events")
        val dispatchClass = bridgedEvents.first().second.definingClass
        bridgedEvents.forEach { (event, method) ->
            assertEquals(
                dispatchClass,
                method.definingClass,
                "$event is sent to a different bridge than the other events",
            )
        }
        assertTrue(
            plugin.fields.any { it.type == dispatchClass },
            "${plugin.type} has no field of the event bridge type $dispatchClass",
        )

        // The androidx.startup initializer of the Unity SDK must not do anything.
        val initializer = byType[ADS_SDK_INITIALIZER] ?: error("$ADS_SDK_INITIALIZER not found")
        val entryPoints = initializer.methods.filter { method ->
            method.parameterTypes == listOf("Landroid/content/Context;") && method.returnType == "V"
        }
        assertTrue(
            entryPoints.isNotEmpty(),
            "$ADS_SDK_INITIALIZER has no context entry point",
        )
        entryPoints.forEach { assertReturnsEarlyVoid(it, label = "${initializer.type}.${it.name}") }
    }

    private fun assertDisableAnalytics(byType: Map<String, ClassDef>) {
        val plugin = byType[FLUTTER_FIREBASE_ANALYTICS_PLUGIN]
            ?: error("$FLUTTER_FIREBASE_ANALYTICS_PLUGIN not found")
        val setCollectionEnabled = plugin.methods.single {
            it.name == "setAnalyticsCollectionEnabled" &&
                it.parameterTypes.size == 2 && it.parameterTypes[0] == "Z"
        }
        val first = setCollectionEnabled.instructions().first()
        assertTrue(
            first.opcode == Opcode.CONST_4 &&
                (first as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction)
                    .narrowLiteral == 0,
            "setAnalyticsCollectionEnabled is not forced to false; first instruction is ${first.opcode}",
        )
    }

    private fun Method.strings(): List<String> = instructions().mapNotNull { it.stringOrNull() }

    private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.stringOrNull(): String? {
        val reference = (this as? ReferenceInstruction)?.reference
        return (reference as? StringReference)?.string
    }

    private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.methodOrNull(): MethodReference? =
        (this as? ReferenceInstruction)?.reference as? MethodReference
}
