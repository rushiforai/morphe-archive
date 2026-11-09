package app.template.patches.telegram.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.signature.telegramSpoofDependency
import com.android.tools.smali.dexlib2.Opcode
import org.w3c.dom.Element

// Verified against the supplied Telegram 13.1.1 build 72371 APK.
private val telegramSettingsRowsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/p91;",
    name = "b0",
    returnType = "V",
    parameters = listOf("Lorg/telegram/ui/p91;", "Ljava/util/ArrayList;"),
)

// Verified against the supplied Telegram Web 13.1.1 build 72379 APK.
private val telegramWebSettingsRowsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/ui/t91;",
    name = "b0",
    returnType = "V",
    parameters = listOf("Lorg/telegram/ui/t91;", "Ljava/util/ArrayList;"),
)

private val postInitApplicationFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/ApplicationLoader;",
    name = "postInitApplication",
    returnType = "V",
    parameters = emptyList(),
)

private val morpheSettingsActivityManifestPatch = resourcePatch(
    name = "Register Morphe Settings Activity",
    description = "Registers the in-app Morphe settings Activity in the target Telegram manifest.",
) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            require(applications.length > 0) { "AndroidManifest.xml has no application element" }
            val application = applications.item(0) as Element
            val androidNs = "http://schemas.android.com/apk/res/android"
            val activityName = "app.template.extension.telegram.MorpheSettingsActivity"
            var found = false
            val children = application.childNodes
            for (i in 0 until children.length) {
                val element = children.item(i) as? Element ?: continue
                if (element.tagName == "activity" &&
                    element.getAttributeNS(androidNs, "name") == activityName) {
                    element.setAttributeNS(androidNs, "android:exported", "false")
                    found = true
                    break
                }
            }
            if (!found) {
                val activity = doc.createElement("activity")
                activity.setAttributeNS(androidNs, "android:name", activityName)
                activity.setAttributeNS(androidNs, "android:exported", "false")
                application.appendChild(activity)
            }
        }
    }
}

private fun settingsRowInstructions(componentClass: String): String = """
    sget-object v4, Lorg/telegram/messenger/ApplicationLoader;->applicationContext:Landroid/content/Context;
    invoke-static {v4}, Lapp/template/extension/telegram/MorpheSettingsEntry;->createSettingsRow(Landroid/content/Context;)Landroid/view/View;
    move-result-object v0
    invoke-static {v0}, Lorg/telegram/ui/Components/$componentClass;->l(Landroid/view/View;)Lorg/telegram/ui/Components/$componentClass;
    move-result-object v2
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
""".trimIndent()

/**
 * Add the row on every normal method exit. The audited 13.1.1 methods each contain
 * two RETURN_VOID sites: one early exit and one normal completion. Insert in reverse
 * index order so earlier instruction indices remain stable.
 */

@Suppress("unused")
val telegramMorpheSettingsPatch = bytecodePatch(
    name = "Morphe Settings",
    description = "Adds Morphe Settings to Telegram Android and Telegram Web and initializes forwarding at startup.",
) {
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY)
    dependsOn(telegramSpoofDependency(), morpheSettingsActivityManifestPatch)

    execute {
/**
 * Resolve the editable method through the patcher's mutable class API. Fingerprint.methodOrNull
 * returns a read-only Method in this Morphe Patcher version, so it must only be used to
 * establish that the target exists; mutations are performed on mutableClassDefBy(...).
 */
fun patchSettingsBuilder(
    targetClass: String,
    targetMethod: String,
    componentClass: String,
) {
    classDefForEach { classDef ->
        if (classDef.type != targetClass) return@classDefForEach

        val mutableMethod = mutableClassDefBy(classDef).methods.firstOrNull { method ->
            method.name == targetMethod &&
                method.parameterTypes.map { it.toString() } == listOf(targetClass, "Ljava/util/ArrayList;") &&
                method.returnType == "V"
        } ?: error("Could not resolve editable settings builder $targetClass->$targetMethod")

        val implementation = requireNotNull(mutableMethod.instructionsOrNull) {
            "Settings builder $targetClass->$targetMethod has no implementation"
        }
        val returnIndexes = implementation.mapIndexedNotNull { index, instruction ->
            index.takeIf { instruction.opcode == Opcode.RETURN_VOID }
        }
        require(returnIndexes.size == 2) {
            "Unexpected $targetClass->$targetMethod control flow: expected 2 RETURN_VOID sites, found ${returnIndexes.size}"
        }
        require(mutableMethod.implementation!!.registerCount >= 22) {
            "Unexpected $targetClass->$targetMethod register layout: expected at least 22 registers, found ${mutableMethod.implementation!!.registerCount}"
        }
        val instructions = settingsRowInstructions(componentClass)
        returnIndexes.asReversed().forEach { index ->
            mutableMethod.addInstructions(index, instructions)
        }
    }
}


        val telegramMethod = telegramSettingsRowsFingerprint.methodOrNull
        val webMethod = telegramWebSettingsRowsFingerprint.methodOrNull

        when {
            telegramMethod != null && webMethod == null ->
                patchSettingsBuilder("Lorg/telegram/ui/p91;", "b0", "r71")
            webMethod != null && telegramMethod == null ->
                patchSettingsBuilder("Lorg/telegram/ui/t91;", "b0", "g71")
            telegramMethod == null && webMethod == null -> error(
                "Could not resolve Telegram 13.1.1 Settings builder (p91/t91). Check APK version and fingerprints."
            )
            else -> error(
                "Ambiguous Morphe Settings target: both Telegram Android and Telegram Web settings builders matched."
            )
        }

        requireNotNull(postInitApplicationFingerprint.methodOrNull) {
            "Missing ApplicationLoader.postInitApplication()V"
        }
        classDefForEach { classDef ->
            if (classDef.type != "Lorg/telegram/messenger/ApplicationLoader;") return@classDefForEach
            val startupMethod = mutableClassDefBy(classDef).methods.firstOrNull {
                it.name == "postInitApplication" && it.parameterTypes.isEmpty() && it.returnType == "V"
            } ?: error("Could not resolve editable ApplicationLoader.postInitApplication()V")
            val startupInstructions = requireNotNull(startupMethod.instructionsOrNull) {
                "ApplicationLoader.postInitApplication()V has no implementation"
            }
            val startupReturns = startupInstructions.count { it.opcode == Opcode.RETURN_VOID }
            require(startupReturns == 1) {
                "Unexpected ApplicationLoader.postInitApplication()V control flow: expected 1 RETURN_VOID site, found $startupReturns"
            }
            startupMethod.addInstructions(
                startupInstructions.size - 1,
                "invoke-static {}, Lapp/template/extension/telegram/MorpheForwardingRuntime;->install()V",
            )
        }
    }
}
