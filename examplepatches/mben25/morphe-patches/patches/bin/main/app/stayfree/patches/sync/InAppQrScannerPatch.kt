package app.stayfree.patches.sync

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.stayfree.patches.shared.Constants.COMPATIBILITY_STAYFREE
import app.stayfree.patches.shared.resource.androidManifest
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element

private const val QR_PAIRING = "Lapp/template/extension/stayfree/QrPairing;"
private const val QR_SCAN_ACTIVITY = "app.template.extension.stayfree.QrScanActivity"
private const val APPLICATION_CLASS = "Lcom/burockgames/timeclocker/StayFreeMobileApplication;"
private const val CAMERA_PERMISSION = "android.permission.CAMERA"

/**
 * A navigator lambda (`Lhr0;->invoke` in 20.14.1) builds a Kotlin function reference to
 * `NavigationManager.navigateTo(BaseActivity, Screen)`; R8 keeps the reference's name and
 * signature strings, and the `const-class` before them is the (obfuscated) navigator class
 * (`Lu70;`). Its two-argument `navigateTo` (`Lu70;->a(Lds0;Lbe9;)V`) is where every screen and
 * bottom sheet is opened, directly or through the lambdas.
 */
private object NavigateToReferenceFingerprint : Fingerprint(
    filters = listOf(
        string("navigateTo(Lcom/burockgames/timeclocker/BaseActivity;Lcom/burockgames/timeclocker/common/sealed/Screen;)V"),
    ),
)

private val inAppQrScannerManifestPatch = resourcePatch(
    description = "Declares the QR scanner activity and the camera permission.",
) {
    execute {
        androidManifest {
            val manifest = documentElement
            val application = getElementsByTagName("application").item(0) as Element

            fun hasChild(parent: Element, tag: String, name: String): Boolean {
                val nodes = parent.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val node = nodes.item(i) as Element
                    if (node.parentNode == parent && node.getAttribute("android:name") == name) return true
                }
                return false
            }

            fun child(parent: Element, tag: String, vararg attributes: Pair<String, String>) {
                if (hasChild(parent, tag, attributes.first { it.first == "android:name" }.second)) return
                val element = createElement(tag)
                attributes.forEach { (key, value) -> element.setAttribute(key, value) }
                // <uses-*> must precede <application>.
                if (parent == manifest) parent.insertBefore(element, application) else parent.appendChild(element)
            }

            child(manifest, "uses-permission", "android:name" to CAMERA_PERMISSION)
            // Optional, so the app stays installable on devices without a (focusing) camera.
            child(manifest, "uses-feature", "android:name" to "android.hardware.camera", "android:required" to "false")
            child(manifest, "uses-feature", "android:name" to "android.hardware.camera.autofocus", "android:required" to "false")
            child(
                application,
                "activity",
                "android:name" to QR_SCAN_ACTIVITY,
                "android:exported" to "false",
                "android:label" to "Scan QR code",
                "android:screenOrientation" to "portrait",
                "android:configChanges" to "keyboard|keyboardHidden|screenSize|smallestScreenSize|screenLayout|uiMode",
                "android:theme" to "@android:style/Theme.DeviceDefault.NoActionBar",
            )
        }
    }
}

@Suppress("unused")
val inAppQrScannerPatch = bytecodePatch(
    name = "In-app QR scanner",
    description = "Scans the browser extension's pairing QR code inside StayFree, like Brave's " +
        "built-in scanner, instead of asking you to open the camera app (whose link can't open a " +
        "patched app). Opens on its own when you choose to pair with a browser extension or the " +
        "desktop app, and from a \"Scan QR code\" shortcut on the app icon. Uses ZXing, so it " +
        "works without Google Play Services.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STAYFREE)

    extendWith("extensions/extension.mpe")

    dependsOn(inAppQrScannerManifestPatch)

    execute {
        // 1. Application.onCreate: publish the "Scan QR code" launcher shortcut. Declared on the
        //    (obfuscated) base class of StayFreeMobileApplication in 20.14.1, so walk up.
        var type: String? = APPLICATION_CLASS
        var onCreate: MutableMethod? = null
        while (type != null && type != "Landroid/app/Application;" && onCreate == null) {
            val classDef = mutableClassDefBy(type)
            onCreate = classDef.methods.firstOrNull {
                it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V"
            }
            type = classDef.superclass
        }
        (onCreate ?: throw PatchException("Application.onCreate not found")).addInstructions(
            0,
            "invoke-static {p0}, $QR_PAIRING->start(Landroid/content/Context;)V",
        )

        // 2. navigateTo(BaseActivity, Screen): opening the "enter pairing code" sheet for the
        //    browser extension / desktop app also opens the scanner on top of it. The extension
        //    recognises that sheet from StayFree's unobfuscated ScreenBundle / ScreenArg classes.
        val referenceMethod = NavigateToReferenceFingerprint.method
        val instructions = referenceMethod.implementation!!.instructions.toList()
        val stringIndex = NavigateToReferenceFingerprint.instructionMatches.first().index
        val navigatorClass = (stringIndex downTo 0)
            .firstOrNull { instructions[it].opcode == Opcode.CONST_CLASS }
            ?.let { ((instructions[it] as ReferenceInstruction).reference as TypeReference).type }
            ?: throw PatchException("Navigator class not found")

        val navigateTo = instructions.asSequence()
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .map { (it as ReferenceInstruction).reference as MethodReference }
            .firstOrNull {
                it.definingClass == navigatorClass && it.returnType == "V" && it.parameterTypes.size == 2
            } ?: throw PatchException("navigateTo(BaseActivity, Screen) call not found")

        mutableClassDefBy(navigatorClass).methods.first {
            it.name == navigateTo.name && it.returnType == "V" &&
                it.parameterTypes.map(CharSequence::toString) == navigateTo.parameterTypes.map(CharSequence::toString)
        }.addInstructions(
            0,
            "invoke-static {p1, p2}, $QR_PAIRING->onNavigate(Landroid/app/Activity;Ljava/lang/Object;)V",
        )
    }
}
