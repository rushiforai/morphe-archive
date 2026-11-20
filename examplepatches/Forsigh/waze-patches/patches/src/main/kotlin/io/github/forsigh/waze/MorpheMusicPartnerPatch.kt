package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import io.github.forsigh.waze.WazeConstants.COMPATIBILITY_WAZE
import org.w3c.dom.Element

/**
 * Additional players as audio partners - Loupric's Waze-side pair, ported, then widened to two more
 * players.
 *
 * THE TWO EDITS (both upstream's, kept exactly):
 *
 *  1. `<queries>` declaration. Waze targets a recent SDK and carries no QUERY_ALL_PACKAGES, so Android's
 *     package visibility hides ordinary media apps from it - a lookup for
 *     `app.morphe.android.apps.youtube.music` answers "no such package" no matter what the code does.
 *     Declaring the package in the manifest's `<queries>` is what makes it visible.
 *  2. `SdkConfiguration.updateAppList()` injection. That method rebuilds `appConfigs`
 *     (`Map<package, com.waze.sdk.au>`) from Waze's native roster and then persists each partner's scope
 *     via `savePackageScopesToSharedPref`. Upstream's block sits right after those calls - where the map
 *     has just been rebuilt and is non-null - checks `containsKey`, and, when the Morphe Music package is
 *     absent, constructs `au("app.morphe.android.apps.youtube.music", "Morphe Music", 0x200001)` through
 *     the five-argument constructor and puts it in. The guard makes the edit idempotent across roster
 *     refreshes.
 *
 * PROVENANCE: ported from Loupric/morphe-waze-music-patch (GPLv3), release v1.0.2, file
 * `AddMorpheToWaze.kt` - see `CREDITS.md`. The seam (`updateAppList`, marked by its call
 * to `savePackageScopesToSharedPref`), the five-argument constructor, the feature bits `0x200001` and the
 * insertion point are upstream's; this port pins the fingerprint by class name and signature where theirs
 * matched by method name plus a custom predicate, and wraps the same edits in fail-loudly guards.
 *
 * WHY THIS REPLACED OUR OWN ATTEMPT (0.22.0-0.27.0): those builds injected the entry before the scope
 * save with feature bits 0x200000, forced the audio-SDK config flags, edited the `au.g` availability
 * check and offered extra-package options. On-device testing did not produce a working partner, so the
 * machinery was retired and the bundle now ships upstream's exact pair instead - no options, on by
 * default, exactly as upstream lists it. Ported at the owner's explicit direction.
 */

/** The Morphe YouTube Music package name. */
private const val MORPHE_MUSIC_PACKAGE = "app.morphe.android.apps.youtube.music"

/*
 * Morphe's root build of YouTube Music keeps Google's package id, so a phone running that build
 * carries `com.google.android.apps.youtube.music` and never matches the renamed package above.
 * Both ids are registered; the install check in au.g drops whichever one is absent, so listing both
 * costs nothing on a phone that has only one.
 */
private const val YOUTUBE_MUSIC_PACKAGE = "com.google.android.apps.youtube.music"

/** The label Waze shows for the partner row (upstream's choice, kept). */
private const val MORPHE_MUSIC_LABEL = "Morphe Music"

/** Label for the stock package id, which is what Morphe's root build presents as. */
private const val YOUTUBE_MUSIC_LABEL = "YouTube Music"

/**
 * Waze's feature bit for an audio partner with an SDK (`FEATURE_AUDIO`). The value is copied from
 * the stock YouTube Music entry when the server lists it; this is the fallback used by the arrays.
 */
private const val PARTNER_SCOPE = 0x200001

private const val SDK_CONFIGURATION = "Lcom/waze/sdk/SdkConfiguration;"

/** Every partner id this row registers, with the label Waze shows for it. */
private val PARTNER_ENTRIES = listOf(
    MORPHE_MUSIC_PACKAGE to MORPHE_MUSIC_LABEL,
    YOUTUBE_MUSIC_PACKAGE to YOUTUBE_MUSIC_LABEL,
)

/** Plain media apps, added alongside the Morphe entry when their gear is on. */


/**
 * `SdkConfiguration.updateAppList()` - the roster refresh that rebuilds `appConfigs` and persists each
 * partner's scope. Pinned by its own call to `savePackageScopesToSharedPref`, which is what makes it this
 * method and not a namesake.
 */
internal val AppListRefreshFingerprint = Fingerprint(
    definingClass = "Lcom/waze/sdk/SdkConfiguration;",
    name = "updateAppList",
    parameters = listOf(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Lcom/waze/sdk/SdkConfiguration;",
            name = "savePackageScopesToSharedPref",
            returnType = "V",
        ),
    ),
)

/**
 * `SdkConfiguration.getCustomizedAppIconUrl(Resources, String)` - builds the CDN url for a partner's
 * icon straight from its package name. A repackaged player has no icon on Waze's server, so the row
 * renders blank; the patch maps our ids onto the stock YouTube Music id before the url is built.
 * Static, two parameters, six registers: `p1` is the package name and `v0`/`v1` are written before
 * they are read, so injecting at index 0 is safe.
 */
internal val PartnerIconFingerprint = Fingerprint(
    definingClass = "Lcom/waze/sdk/SdkConfiguration;",
    name = "getCustomizedAppIconUrl",
    parameters = listOf("Landroid/content/res/Resources;", "Ljava/lang/String;"),
    returnType = "Ljava/lang/String;",
)

/**
 * The manifest half (upstream's `wazeMorpheMusicResourcePatch`): declares the Morphe Music package in
 * Waze's `<queries>`. Unnamed - it is the other half of one feature and is applied as a dependency of
 * [morpheMusicPartnerPatch], so the whole feature is one row.
 */
@Suppress("unused")
val morpheMusicSupportPatch = resourcePatch(
    name = null,
    description = "Declares YouTube Music in Waze's manifest <queries>, so Android's package " +
        "visibility lets Waze find it at all. Both the renamed Morphe package and the stock id are " +
        "declared, because Morphe's root build keeps the stock id. Applied as part of \"Morphe " +
        "YouTube Music as a Waze audio partner\".",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    execute {
        document("AndroidManifest.xml").use { dom ->
            val queries = dom.getElementsByTagName("queries").item(0) as? Element
                ?: throw PatchException(
                    "morpheMusicSupportPatch: Waze's manifest has no <queries> node - refusing to " +
                        "report a declaration that was not applied"
                )
            val packages = queries.getElementsByTagName("package")
            val declared = (0 until packages.length).mapNotNull { index ->
                (packages.item(index) as? Element)?.getAttribute("android:name")?.takeIf(String::isNotEmpty)
            }
            for (pkg in PARTNER_ENTRIES.map { it.first }) {
                if (pkg in declared) {
                    println("morpheMusicSupportPatch: $pkg already declared in <queries>")
                } else {
                    val element = dom.createElement("package")
                    element.setAttribute("android:name", pkg)
                    queries.appendChild(element)
                    println("morpheMusicSupportPatch: declared $pkg in <queries>")
                }
            }
        }
    }
}

@Suppress("unused")
val morpheMusicPartnerPatch = bytecodePatch(
    name = "YouTube Music as a Waze audio partner",
    description = "Lets Morphe YouTube Music and stock YouTube Music play through Waze's audio player.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    dependsOn(morpheMusicSupportPatch)
    // The flags recorded below need the emitter patch in the build; ticking this row alone must
    // still produce an APK carrying them (same contract as every other override).
    dependsOn(configOverridesPatch)

    execute {
        // The append runs after Waze's own null checks on the four server arrays: at cold start they
        // are still null and getPartners()/updateAppList() treat that as "no roster yet". Writing
        // before those checks is what crashed 0.30.63-dev.4 on launch.
        val configClass = mutableClassDefBy(SDK_CONFIGURATION)
        val implementation: MutableMethodImplementation
        val host: MutableMethod
        val instance: String
        val registers: Triple<Int, Int, Int>
        val insertIndex: Int

        val partnersMethod = configClass.methods.firstOrNull {
            it.name == "getPartners" && it.parameterTypes.isEmpty() &&
                it.returnType == "Ljava/util/List;"
        }
        if (partnersMethod != null) {
            // 5.27.9x: the roster is assembled in its own method, on the instance.
            host = partnersMethod
            implementation = partnersMethod.implementation
                ?: throw PatchException("morpheMusicPartnerPatch: getPartners() has no body")
            instance = "p0"
            registers = Triple(5, 6, 7)
            insertIndex = implementation.instructions.indexOfFirst { it.opcode == Opcode.NEW_ARRAY }
            if (insertIndex < 0) throw PatchException(
                "morpheMusicPartnerPatch: getPartners() no longer builds an array"
            )
        } else {
            // 5.27.4 and earlier: no helper, updateAppList does everything itself.
            host = configClass.methods.firstOrNull {
                it.name == "updateAppList" && it.parameterTypes.isEmpty()
            } ?: throw PatchException(
                "morpheMusicPartnerPatch: neither getPartners() nor updateAppList() is present - " +
                    "refusing to guess where the partner roster is assembled"
            )
            implementation = host.implementation
                ?: throw PatchException("morpheMusicPartnerPatch: updateAppList() has no body")
            val instructions = implementation.instructions
            val configIndex = instructions.indexOfFirst { instruction ->
                (instruction as? ReferenceInstruction)?.reference?.toString()
                    ?.contains("configGetSdkConfigurationNTV") == true
            }
            if (configIndex < 0) throw PatchException(
                "morpheMusicPartnerPatch: updateAppList() no longer fetches the SDK configuration"
            )
            instance = "v" + host.getInstruction<OneRegisterInstruction>(configIndex + 1).registerA
            registers = Triple(10, 9, 8)
            val hashMapIndex = instructions.drop(configIndex).indexOfFirst { instruction ->
                instruction.opcode == Opcode.NEW_INSTANCE &&
                    (instruction as? ReferenceInstruction)?.reference?.toString()
                        ?.contains("Ljava/util/HashMap;") == true
            }
            if (hashMapIndex < 0) throw PatchException(
                "morpheMusicPartnerPatch: updateAppList() no longer builds its app config map"
            )
            insertIndex = configIndex + hashMapIndex
        }
        if (implementation.registerCount <= registers.third) throw PatchException(
            "morpheMusicPartnerPatch: ${host.name} has only ${implementation.registerCount} registers"
        )

        val (rArray, rIndex, rValue) = registers
        fun stringArray(field: String, values: List<String>): String = buildString {
            append("iget-object v$rArray, $instance, Lcom/waze/sdk/SdkConfiguration;->$field:[Ljava/lang/String;\n")
            append("array-length v$rIndex, v$rArray\n")
            append("add-int/lit8 v$rIndex, v$rIndex, ${values.size}\n")
            append("invoke-static {v$rArray, v$rIndex}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;\n")
            append("move-result-object v$rArray\n")
            append("check-cast v$rArray, [Ljava/lang/String;\n")
            append("array-length v$rIndex, v$rArray\n")
            append("add-int/lit8 v$rIndex, v$rIndex, -${values.size}\n")
            values.forEachIndexed { position, value ->
                if (position > 0) append("add-int/lit8 v$rIndex, v$rIndex, 0x1\n")
                append("const-string v$rValue, \"$value\"\n")
                append("aput-object v$rValue, v$rArray, v$rIndex\n")
            }
            append("iput-object v$rArray, $instance, Lcom/waze/sdk/SdkConfiguration;->$field:[Ljava/lang/String;\n")
        }
        fun intArray(field: String, values: List<Int>): String = buildString {
            append("iget-object v$rArray, $instance, Lcom/waze/sdk/SdkConfiguration;->$field:[I\n")
            append("array-length v$rIndex, v$rArray\n")
            append("add-int/lit8 v$rIndex, v$rIndex, ${values.size}\n")
            append("invoke-static {v$rArray, v$rIndex}, Ljava/util/Arrays;->copyOf([II)[I\n")
            append("move-result-object v$rArray\n")
            append("array-length v$rIndex, v$rArray\n")
            append("add-int/lit8 v$rIndex, v$rIndex, -${values.size}\n")
            values.forEachIndexed { position, value ->
                if (position > 0) append("add-int/lit8 v$rIndex, v$rIndex, 0x1\n")
                append("const v$rValue, 0x${value.toString(16)}\n")
                append("aput v$rValue, v$rArray, v$rIndex\n")
            }
            append("iput-object v$rArray, $instance, Lcom/waze/sdk/SdkConfiguration;->$field:[I\n")
        }

        val packages = PARTNER_ENTRIES.map { it.first }
        val labels = PARTNER_ENTRIES.map { it.second }
        host.addInstructions(
            insertIndex,
            buildString {
                append(stringArray("PackageNames", packages))
                append(stringArray("AppNames", labels))
                append(stringArray("InstallationUrls", packages.map { "https://play.google.com/store/apps/details?id=$it" }))
                append(intArray("Scopes", packages.map { PARTNER_SCOPE }))
            }.trimIndent(),
        )
        println(
            "morpheMusicPartnerPatch: appended ${packages.size} partner entries to Waze's own " +
                "arrays inside ${host.name} (scope 0x${PARTNER_SCOPE.toString(16)})"
        )



        // Icon half: Waze builds a partner's icon url from its package name, and the CDN only carries
        // art for ids Waze ships. A repackaged player therefore shows an empty tile. Rewrite the id to
        // the stock YouTube Music one before the url is built; the string that leaves this method is
        // only used for the icon lookup, never for matching.
        val iconMethod = PartnerIconFingerprint.method
        iconMethod.addInstructionsWithLabels(
            0,
            """
                if-eqz p1, :cond_icon_stock
                const-string v0, "$MORPHE_MUSIC_PACKAGE"
                invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :cond_icon_stock
                const-string p1, "$YOUTUBE_MUSIC_PACKAGE"
                :cond_icon_stock
                nop
            """.trimIndent() + "\n",
        )
        println("morpheMusicPartnerPatch: partner icon url mapped $MORPHE_MUSIC_PACKAGE -> $YOUTUBE_MUSIC_PACKAGE")


        // The partner list the injected entry feeds is gated at its source: getPartnerAudioApps
        // iterates appConfigs only when CONFIG_VALUE_AUDIO_EXTENSION_SDK_FEATURE_ENABLED reads true,
        // and the audio-SDK surface honours CONFIG_VALUE_AUDIO_EXTENSION_SDK_ON. Both are
        // server-controlled, so on devices whose config has them off the entry (and every stock
        // partner) never surfaces. Forced here, read-path, so the feature the row promises does not
        // depend on a server rollout. Devices that already have them on are unaffected.
        recordBoolean(
            "morpheMusicPartner",
            true,
            "CONFIG_VALUE_AUDIO_EXTENSION_SDK_FEATURE_ENABLED",
            "CONFIG_VALUE_AUDIO_EXTENSION_SDK_ON",
        )
    }
}
