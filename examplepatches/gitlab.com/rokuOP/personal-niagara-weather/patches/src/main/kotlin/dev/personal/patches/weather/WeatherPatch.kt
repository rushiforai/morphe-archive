package dev.personal.patches.weather

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element

private const val EXT = "Ldev/personal/niagaraweather/WeatherPatch;"
private const val SERVICE = "Lb/Hwu2qIgzKhvPNXQPk7;"
private const val PREFS = "Landroid/content/SharedPreferences;"
private val compatibility = Compatibility(
    name = "Niagara Launcher",
    packageName = "bitpit.launcher",
    apkFileType = ApkFileType.APK,
    appIconColor = 0xA9C1E8,
    targets = listOf(AppTarget(version = "1.16.28"))
)

private val weatherResources = resourcePatch {
    execute {
        if (packageMetadata.versionCode != "1634") {
            throw PatchException("Personal weather supports Niagara 1.16.28 build 1634 only.")
        }
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0)
            val activities = manifest.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                if ((activities.item(i) as Element).getAttribute("android:name") ==
                    "dev.personal.niagaraweather.WeatherSettingsActivity") {
                    throw PatchException("Personal weather is already installed. Select the original APK.")
                }
            }
            val activity = manifest.createElement("activity")
            activity.setAttribute("android:name", "dev.personal.niagaraweather.WeatherSettingsActivity")
            activity.setAttribute("android:exported", "false")
            activity.setAttribute("android:label", "Personal weather")
            activity.setAttribute("android:configChanges", "orientation|screenSize")
            activity.setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
            application.appendChild(activity)
        }
    }
}

/** Deliberately version-specific: unknown future obfuscation layouts must fail closed. */
@Suppress("unused")
val personalWeatherPatch = bytecodePatch(
    name = "Personal OpenWeather",
    description = "Use your own API key in Niagara's weather display, with modern private key settings. Supports 1.16.28 / 1634.",
    default = true
) {
    compatibleWith(compatibility)
    dependsOn(weatherResources)
    extendWith("extensions/weather.mpe")
    execute {
        if (packageMetadata.versionCode != "1634") throw PatchException("Unsupported Niagara build.")

        method("Lb/X7m7UHOHeaARiPTXKK2yamR7cBhM;", "fO7AVUsg59FX0xLNkI8hhXD2")
            .personalEnabledPrelude("Lb/X7m7UHOHeaARiPTXKK2yamR7cBhM;->hHUdSB3wuWj2NinlqN:$PREFS")
        method("Lb/zZ3uyQTogQnniwWFVAnG5f99S;", "gpCruA4G4HKVloQT5")
            .personalEnabledPrelude("Lb/C8gHS8hr3IXZnBc1sCwD4BM;->ZQ06qh0KYEYo55RfyCExBKXMdDt:$PREFS")

        // Keep v0's shared Pro state intact: battery and calendar still use it afterwards.
        val home = method("Lb/p5wUOpt81ktVxPWx;", "PIFjKdTFx4bkGdxkn5oksjktQ8eg")
        val homeInstructions = home.implementation!!.instructions
        val proField = home.fieldIndex("Lb/IF2RBkN6JdLGGv;", "scSVXSelHn0vGdEhMIkeOConMr")
        val proBranch = (proField + 1 until homeInstructions.size).firstOrNull {
            val instruction = homeInstructions[it]
            instruction is BuilderInstruction21t && instruction.opcode == Opcode.IF_EQZ && instruction.registerA == 0
        } ?: throw PatchException("Home weather visibility branch missing.")
        val branch = homeInstructions[proBranch] as BuilderInstruction21t
        home.replaceInstruction(proBranch, BuilderInstruction21t(Opcode.IF_EQZ, 2, branch.target))
        home.addInstructions(proBranch, """
            invoke-static {v3, v0}, $EXT->allowWeather(${PREFS}Z)Z
            move-result v2
        """)

        val widget = method("Lb/GWKGhGB6jEDgxY8s;", "scSVXSelHn0vGdEhMIkeOConMr")
        val weatherToggle = widget.implementation!!.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "bitpit.launcher.key.WEATHER_ENABLED"
        }
        if (weatherToggle < 0) throw PatchException("Weather settings toggle missing.")
        val widgetIndex = widget.fieldIndex("Lb/IF2RBkN6JdLGGv;", "scSVXSelHn0vGdEhMIkeOConMr", weatherToggle)
        widget.addInstructions(widgetIndex + 1, """
            invoke-static {v4, v8}, $EXT->allowWeather(${PREFS}Z)Z
            move-result v8
        """)

        val settings = method("Lb/wIQj3HwtH374vDsdgRfplS;", "PIFjKdTFx4bkGdxkn5oksjktQ8eg")
        settings.addInstructions(0, """
            iget-object v0, p0, Lb/wIQj3HwtH374vDsdgRfplS;->scSVXSelHn0vGdEhMIkeOConMr:Landroid/content/Context;
            iget-object v1, p0, Lb/wIQj3HwtH374vDsdgRfplS;->lJFNcBQHCClkpT8l7Xkn8v:$PREFS
            invoke-static {v0, v1}, $EXT->openSettings(Landroid/content/Context;$PREFS)V
            return-void
        """)

        // Bind while p0 is still this; p1/p4 are overwritten immediately afterwards.
        val constructor = method(SERVICE, "<init>")
        val bindIndex = constructor.implementation!!.instructions.withIndex().filter {
            it.value.opcode == Opcode.NEW_INSTANCE &&
                ((it.value as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Lb/rj54lj1InqpmWqPfnlqcr;"
        }.singleOrNull()?.index ?: throw PatchException("Weather service constructor layout changed.")
        constructor.addInstructions(bindIndex, """
            iget-object p1, p0, $SERVICE->kEHhMh5WXvE:Landroid/content/Context;
            iget-object p4, p0, $SERVICE->CCnwOKjCwIiCs:$PREFS
            invoke-static {p1, p4, p0}, $EXT->bindService(Landroid/content/Context;${PREFS}Ljava/lang/Object;)V
        """)

        // Selector13 runs on Dispatchers.IO; retain the original branch only without a personal key.
        val fetch = method("Lb/hKoAGpeDNCeUKj;", "QU0xcQ3PL93h1HkpS1")
        val fetchIndex = fetch.fieldIndex(SERVICE, "JfD5anH8HmnM40u")
        val originalFetch = fetch.implementation!!.instructions[fetchIndex]
        fetch.addInstructionsWithLabels(fetchIndex, """
            iget-object v3, v7, Lb/hKoAGpeDNCeUKj;->mSzisdZo1gIkaJJamui2eM:Ljava/lang/Object;
            iget-object v4, v7, Lb/hKoAGpeDNCeUKj;->JfD5anH8HmnM40u:Ljava/lang/Object;
            check-cast v4, Ljava/lang/String;
            invoke-static {v0, v3, v4}, $EXT->fetchIfConfigured(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
            move-result-object v3
            if-eqz v3, :original_weather
            return-object v3
        """, ExternalLabel("original_weather", originalFetch))
    }
}

@Suppress("unused")
val installAlongsidePatch = resourcePatch(
    name = "Install alongside Niagara",
    description = "Give the patched app a separate name and package. Keep the original installation and its settings.",
    default = false
) {
    compatibleWith(compatibility)
    dependsOn(personalWeatherPatch)
    execute {
        document("AndroidManifest.xml").use { manifest ->
            manifest.documentElement.setAttribute("package", "bitpit.launcher.personalweather")
            val application = manifest.getElementsByTagName("application").item(0) as Element
            application.setAttribute("android:label", "Niagara · Personal Weather")
            val all = manifest.getElementsByTagName("*")
            for (i in 0 until all.length) {
                val node = all.item(i) as Element
                val authority = node.getAttribute("android:authorities")
                if (authority.startsWith("bitpit.launcher.")) {
                    node.setAttribute("android:authorities",
                        authority.replaceFirst("bitpit.launcher.", "bitpit.launcher.personalweather."))
                }
                if (node.getAttribute("android:name") == "bitpit.launcher.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION") {
                    node.setAttribute("android:name", "bitpit.launcher.personalweather.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION")
                }
            }
        }
    }
}

private fun BytecodePatchContext.method(type: String, name: String): MutableMethod =
    mutableClassDefBy(type).methods.filter { it.name == name }.singleOrNull()
        ?: throw PatchException("Expected one $type->$name in Niagara 1.16.28.")

private fun MutableMethod.fieldIndex(type: String, fieldName: String, after: Int = 0): Int =
    implementation!!.instructions.withIndex().firstOrNull {
        val reference = (it.value as? ReferenceInstruction)?.reference as? FieldReference
        it.index >= after && reference?.definingClass == type && reference.name == fieldName
    }?.index ?: throw PatchException("Field $type->$fieldName missing in $definingClass->$name")

private fun MutableMethod.personalEnabledPrelude(field: String) {
    val original = implementation!!.instructions[0]
    addInstructionsWithLabels(0, """
        iget-object v0, p0, $field
        invoke-static {v0}, $EXT->configured($PREFS)Z
        move-result v0
        if-eqz v0, :original_availability
        iget-object v0, p0, $field
        const-string v1, "bitpit.launcher.key.WEATHER_ENABLED"
        const/4 v2, 0x0
        invoke-interface {v0, v1, v2}, $PREFS->getBoolean(Ljava/lang/String;Z)Z
        move-result v0
        return v0
    """, ExternalLabel("original_availability", original))
}
