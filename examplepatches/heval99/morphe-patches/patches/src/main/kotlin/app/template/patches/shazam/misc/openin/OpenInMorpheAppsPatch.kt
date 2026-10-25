package app.template.patches.shazam.misc.openin

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SHAZAM
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element

internal const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/template/extension/shazam/OpenInMorpheAppsPatch;"

private val PACKAGE_NAME_REGEX = Regex("^[A-Za-z][A-Za-z0-9_]*(\\.[A-Za-z][A-Za-z0-9_]*)+$")

private val youTubeMusicPackageOption = stringOption(
    key = "youTubeMusicPackage",
    default = "app.morphe.android.apps.youtube.music",
    values = mapOf("Morphe YouTube Music" to "app.morphe.android.apps.youtube.music"),
    title = "YouTube Music package",
    description = "Package name of the patched YouTube Music app that \"Open in YouTube Music\" should open.",
    required = true,
) { it != null && PACKAGE_NAME_REGEX.matches(it) }

private val youTubePackageOption = stringOption(
    key = "youTubePackage",
    default = "app.morphe.android.youtube",
    values = mapOf("Morphe YouTube" to "app.morphe.android.youtube"),
    title = "YouTube package",
    description = "Package name of the patched YouTube app that \"Open in YouTube\" should open.",
    required = true,
) { it != null && PACKAGE_NAME_REGEX.matches(it) }

// Shazam targets SDK 36 and its <queries> only lists the stock Google packages, so without these
// entries getApplicationInfo() cannot see the Morphe apps and the remap never applies.
private val openInMorpheAppsManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val queries = doc.getElementsByTagName("queries").item(0) as? Element
                ?: doc.createElement("queries").also { manifest.appendChild(it) }

            val existing = buildSet {
                val packages = queries.getElementsByTagName("package")
                for (i in 0 until packages.length) {
                    val name = (packages.item(i) as? Element)?.getAttribute("android:name")
                    if (!name.isNullOrEmpty()) add(name)
                }
            }

            listOfNotNull(youTubeMusicPackageOption.value, youTubePackageOption.value)
                .filter { it !in existing }
                .distinct()
                .forEach { packageName ->
                    queries.appendChild(
                        doc.createElement("package").apply { setAttribute("android:name", packageName) },
                    )
                }
        }
    }
}

@Suppress("unused")
val openInMorpheAppsPatch = bytecodePatch(
    name = "Open in Morphe YouTube apps",
    description = "Opens songs in the Morphe YouTube apps when installed.",
) {
    compatibleWith(COMPATIBILITY_SHAZAM)

    dependsOn(openInMorpheAppsManifestPatch)

    extendWith("extensions/shazam.mpe")

    youTubeMusicPackageOption()
    youTubePackageOption()

    execute {
        val youTubeMusicPackage = youTubeMusicPackageOption.value
            ?: throw PatchException("YouTube Music package option is not set")
        val youTubePackage = youTubePackageOption.value
            ?: throw PatchException("YouTube package option is not set")

        // Hand the option values to the extension.
        mutableClassDefBy(EXTENSION_CLASS_DESCRIPTOR).methods.apply {
            single { it.name == "getYouTubeMusicPackage" }.returnEarly(youTubeMusicPackage)
            single { it.name == "getYouTubePackage" }.returnEarly(youTubePackage)
        }

        // Cross-check: the config parser must still build providers through this class,
        // otherwise hooking its constructor would silently change nothing.
        val providerType = StreamingProviderToStringFingerprint.classDef.type
        val parser = StreamingProvidersFromConfigFingerprint.method
        val buildsProviders = parser.implementation!!.instructions.any { instruction ->
            instruction.opcode == Opcode.NEW_INSTANCE &&
                ((instruction as ReferenceInstruction).reference as? TypeReference)?.type == providerType
        }
        if (!buildsProviders) {
            throw PatchException("$providerType is no longer built by the streaming provider config parser")
        }

        // Remap packageName, songUri, artistUri and albumUri (p3..p6) before they are stored.
        StreamingProviderConstructorFingerprint.method.addInstructionsChecked(
            0,
            (3..6).joinToString("\n") { register ->
                """
                    invoke-static/range { p$register .. p$register }, $EXTENSION_CLASS_DESCRIPTOR->remap(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p$register
                """.trimIndent()
            },
        )
    }
}
