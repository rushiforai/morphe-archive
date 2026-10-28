package io.github.jordanwoodson.patches.shared.apps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import io.github.jordanwoodson.patches.shared.Locators
import io.github.jordanwoodson.patches.shared.SHARED_EXTENSION
import io.github.jordanwoodson.patches.shared.invokeStatic
import io.github.jordanwoodson.patches.shared.parameterRegister
import io.github.jordanwoodson.patches.shared.parameterRegisters
import io.github.jordanwoodson.patches.shared.settings.debugLoggingSetting
import io.github.jordanwoodson.patches.shared.settings.writeLocators
import org.w3c.dom.Element

private const val SETTINGS_ACTIVITY = "io.github.jordanwoodson.extension.shared.settings.SettingsActivity"

/**
 * The exported way into [SETTINGS_ACTIVITY], which stays non-exported. Android's App info page links to the
 * activity of an app that handles APPLICATION_PREFERENCES ("Additional settings in the app", a gear on some
 * phones). The alias answers only that action, and the activity reads nothing from the intent that starts it,
 * so another app that starts it can only open the screen.
 */
private const val PREFERENCES_ALIAS = "io.github.jordanwoodson.extension.shared.settings.AppPreferences"
private const val REACT_INSTANCE = "Lcom/facebook/react/runtime/ReactInstance;"

/** The one match of this fingerprint, found the way [app]'s own patches find theirs ([LurkApp.matcher]). */
context(context: BytecodePatchContext)
internal fun Fingerprint.matchIn(app: LurkApp, what: String): Match = app.matcher(context, this, what)

/**
 * The body of an app's hidden settings patch, which every patch that can be switched at runtime depends on.
 * It declares the Lurk settings activity (opened from the launcher shortcut the extension publishes) and the
 * alias Android's App info page opens it through, starts the extension at the beginning of
 * Application.onCreate ([LurkApp.startup]), runs [extra] (another way into the screen, such as a row in the
 * app's own settings), and once every patch has registered its settings on [LurkApp.settings], writes them
 * into the extension as JSON. The matched names every patch recorded go to `assets/lurk/locators.json`.
 */
internal fun BytecodePatchBuilder.lurkSettings(app: LurkApp, extra: BytecodePatchContext.() -> Unit = {}) {
    compatibleWith(app.compatibility)
    extendWith(SHARED_EXTENSION)

    dependsOn(
        resourcePatch {
            execute {
                Locators.clear()
                document("AndroidManifest.xml").use { document ->
                    val application = document.getElementsByTagName("application").item(0) as Element
                    application.appendChild(
                        document.createElement("activity").apply {
                            setAttribute("android:name", SETTINGS_ACTIVITY)
                            setAttribute("android:exported", "false")
                            setAttribute("android:label", "Lurk")
                            // Launched from the launcher shortcut, it gets a task of its own instead of
                            // joining the app's, which may be a picture-in-picture window.
                            setAttribute("android:taskAffinity", "")
                            // Only for the window shown while it starts (dark, like the apps); the activity picks dark or light.
                            setAttribute("android:theme", "@android:style/Theme.DeviceDefault.NoActionBar")
                        },
                    )
                    // After its target, as Android requires.
                    application.appendChild(
                        document.createElement("activity-alias").apply {
                            setAttribute("android:name", PREFERENCES_ALIAS)
                            setAttribute("android:targetActivity", SETTINGS_ACTIVITY)
                            setAttribute("android:exported", "true")
                            setAttribute("android:label", "Lurk")
                            appendChild(
                                document.createElement("intent-filter").apply {
                                    appendChild(document.createElement("action").apply {
                                        setAttribute("android:name", "android.intent.action.APPLICATION_PREFERENCES")
                                    })
                                    appendChild(document.createElement("category").apply {
                                        setAttribute("android:name", "android.intent.category.DEFAULT")
                                    })
                                },
                            )
                        },
                    )
                }
            }
            // Finalized after every other patch, so everything they matched is recorded.
            finalize { writeLocators(app.slug) }
        },
    )

    execute {
        app.settings.clear()
        app.settings.add(debugLoggingSetting)

        // The extension's context, before any of the app's own startup.
        app.applicationOnCreate.matchIn(app, "${app.applicationName}.onCreate").method.apply {
            val context = parameterRegister(0)
            addInstructions(0, app.startup.joinToString("\n") { invokeStatic(it, context) })
        }

        extra()
    }

    // Every patch has executed and registered its settings by now.
    finalize {
        RegistryFingerprint.matchIn(app, "settings registry").method.apply {
            val stub = implementation!!.instructions.first()
            if (stub.opcode != Opcode.CONST_4 || implementation!!.registerCount != 1) {
                throw PatchException("${app.name}: unexpected settings registry stub")
            }
            replaceInstruction(
                0,
                BuilderInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(app.settings.json())),
            )
        }
    }
}

/**
 * The body of a React Native app's bundle-loader patch, which the patches that change the app's JavaScript
 * depend on: before React Native loads the Hermes bundle from the APK's assets, the app's
 * [ReactNative.bundleClass] may hand it a patched copy to load from a file instead. Only Hermes consumers need
 * this hook; native-only patch combinations never read a manifest.
 */
internal fun BytecodePatchBuilder.reactNativeBundleLoader(app: LurkApp, settingsPatch: BytecodePatch) {
    val reactNative = app.reactNative ?: throw IllegalArgumentException("${app.name} is not a React Native app")
    compatibleWith(app.compatibility)
    dependsOn(settingsPatch)

    execute {
        val match = reactNative.bundleLoader.matchIn(app, "bridgeless asset bundle loader")
        if ("Lcom/facebook/react/bridge/JSBundleLoaderDelegate;" !in match.classDef.interfaces) {
            throw PatchException("${app.name}: unexpected bundle loader interface")
        }
        val method = match.method
        Locators.record("${app.slug}.settings.bundle_loader", method)
        val instructions = method.implementation!!.instructions.toList()
        val index = instructions.indices.singleOrNull { index ->
            val instruction = instructions[index]
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_STATIC &&
                ref?.name == "access\$loadJSBundleFromAssets" &&
                ref.definingClass == REACT_INSTANCE &&
                ref.parameterTypes.map { it.toString() } == listOf(
                    REACT_INSTANCE, "Landroid/content/res/AssetManager;", "Ljava/lang/String;")
        } ?: throw PatchException("${app.name}: no unique native asset load")
        val call = instructions[index] as FiveRegisterInstruction
        if (method.implementation!!.registerCount != 4 || call.registerC != 0 ||
            call.registerD != 1 || call.registerE != 2 || instructions[index + 1].opcode != Opcode.RETURN_VOID) {
            throw PatchException("${app.name}: loader register lifetime changed")
        }
        // loadScriptFromAssets(assets, url, loadSynchronously): the flag's register takes the prepared file.
        val (instance, assets, url, file) = method.parameterRegisters()
        method.addInstructionsWithLabels(
            index,
            """
                ${invokeStatic("${reactNative.bundleClass}->prepare(Landroid/content/res/AssetManager;Ljava/lang/String;)Ljava/lang/String;", assets, url)}
                move-result-object v$file
                if-eqz v$file, :original
                ${invokeStatic("$REACT_INSTANCE->access\$loadJSBundleFromFile(${REACT_INSTANCE}Ljava/lang/String;Ljava/lang/String;)V", instance, file, url)}
                return-void
            """,
            ExternalLabel("original", method.getInstruction(index)),
        )
    }
}
