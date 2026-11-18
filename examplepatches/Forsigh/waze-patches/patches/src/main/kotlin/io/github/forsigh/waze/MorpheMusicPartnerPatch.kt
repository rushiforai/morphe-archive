package io.github.forsigh.waze

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
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

/** Every partner id this row registers, with the label Waze shows for it. */
private val PARTNER_ENTRIES = listOf(
    MORPHE_MUSIC_PACKAGE to MORPHE_MUSIC_LABEL,
    YOUTUBE_MUSIC_PACKAGE to YOUTUBE_MUSIC_LABEL,
)

/** Plain media apps, added alongside the Morphe entry when their gear is on. */

/**
 * `au.g(Context)` - the per-partner availability check. Stock, it only takes the install-check path
 * for package equal to the Spotify literal; everything else is asked for a
 * `com.waze.sdk.audio.ACTION_INIT` broadcast receiver, which a plain media app never ships, so it reads
 * as unavailable: the settings row goes dead and the car side drops it. BitChord (1.8.1) and Smart
 * AudioBook Player (11.9.0) both ship a MediaBrowserService but no Waze SDK receiver (their manifests
 * were pulled off the device and read), so this is the gate that keeps them out.
 */
internal val PartnerAvailabilityFingerprint = Fingerprint(
    definingClass = "Lcom/waze/sdk/au;",
    name = "g",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "Z",
)

/**
 * `aw.g(Context)` - 5.27.90.900. `au` became a plain server DTO (four fields, no behaviour), and the
 * runtime partner object is `aw`: package, label, scope, url, cached installed flag. The availability
 * decision moved here, and it is the same shape as the old one - compare the package to
 * "com.spotify.music", then branch. Pinned by `g`'s name and signature; the pin below proves the
 * literal is inside it before touching anything.
 */
internal val PartnerAvailabilityV2Fingerprint = Fingerprint(
    definingClass = "Lcom/waze/sdk/aw;",
    name = "g",
    parameters = listOf("Landroid/content/Context;"),
    returnType = "Z",
)

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
    name = "Morphe YouTube Music as a Waze audio partner",
    description = "Lets Morphe YouTube Music play through Waze.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WAZE)

    dependsOn(morpheMusicSupportPatch)
    // The flags recorded below need the emitter patch in the build; ticking this row alone must
    // still produce an APK carrying them (same contract as every other override).
    dependsOn(configOverridesPatch)

    execute {
        val method = AppListRefreshFingerprint.method
        val matches = AppListRefreshFingerprint.instructionMatches
        if (matches.isEmpty()) {
            throw PatchException(
                "morpheMusicPartnerPatch: updateAppList no longer calls savePackageScopesToSharedPref - " +
                    "refusing to inject into a roster refresh that has moved"
            )
        }

        // Upstream's insertion point: right AFTER the last scope-save call, where the rebuilt map is in
        // hand and non-null. Registers v4-v10 are free there; v1 (the monitor) is not touched.
        val insertIndex = matches.last().index + 1
        // Both ids always: the install check in au.g drops whichever package is absent, so a phone
        // carrying only the renamed Morphe build or only stock YouTube Music gets exactly one entry.
        val entries = PARTNER_ENTRIES
        // 5.27.90.900: appConfigs holds the runtime partner object `aw`, not `au` - `au` is now a
        // four-field server DTO with no behaviour. `aw`'s three-argument constructor takes package,
        // label and scope flags and leaves the install url null, which is exactly what we inject.
        val runtimeClass = if (boundMethodOrNull(PartnerAvailabilityV2Fingerprint) != null) {
            "Lcom/waze/sdk/aw;"
        } else {
            "Lcom/waze/sdk/au;"
        }
        val block = buildString {
            entries.forEachIndexed { index, (pkg, label) ->
                // `aw` takes the same flags but has no byte[] argument, and updateAppList only has
                // v0-v9 to play with (.locals 10), so the 5-register range form would address v10 and
                // fail to assemble. Use the three-argument constructor there and the old range form
                // on the builds where the entry class is still `au`.
                val constructor = if (runtimeClass == "Lcom/waze/sdk/aw;") {
                    """
                    const v8, 0x200001
                    invoke-direct {v5, v6, v7, v8}, Lcom/waze/sdk/aw;-><init>(Ljava/lang/String;Ljava/lang/String;I)V
                    """.trimIndent()
                } else {
                    """
                    const v8, 0x200001
                    const/4 v9, 0x0
                    const/4 v10, 0x0
                    invoke-direct/range {v5 .. v10}, Lcom/waze/sdk/au;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;[B)V
                    """.trimIndent()
                }
                append(
                    """
                    sget-object v4, Lcom/waze/sdk/SdkConfiguration;->appConfigs:Ljava/util/Map;
                    const-string v6, "$pkg"
                    invoke-interface {v4, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
                    move-result v7
                    if-nez v7, :cond_skip_partner_$index
                    new-instance v5, $runtimeClass
                    const-string v7, "$label"
                    $constructor
                    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    :cond_skip_partner_$index
                    nop
                    """.trimIndent() + "\n",
                )
            }
        }
        method.addInstructionsWithLabels(insertIndex, block)
        println("morpheMusicPartnerPatch: injected ${entries.size} partner entries after the scope save " +
            "(missing packages are dropped by the install check at runtime)")

        // One instruction in au.g(Context): after the "com.spotify.music" comparison, stock branches on
        // the equals result and only Spotify gets the install check. Pinning the result to true sends
        // every partner down that path, so an installed player is available instead of waiting for a
        // Waze SDK receiver it does not ship. The branch itself is untouched.
        val availability = resolveAnchor(
            "partner availability", PartnerAvailabilityFingerprint, PartnerAvailabilityV2Fingerprint,
        )
        val implementation = availability.implementation
            ?: throw PatchException("morpheMusicPartnerPatch: au.g has no implementation to patch")
        val instructions = implementation.instructions
        var pinned = false
        for (i in 0 until instructions.size - 2) {
            val insn = instructions.elementAt(i)
            if (insn.opcode != Opcode.CONST_STRING) continue
            val literal = (insn as? ReferenceInstruction)?.reference?.toString() ?: continue
            if (literal != "com.spotify.music") continue
            // Shape: const-string "com.spotify.music" -> invoke-virtual String.equals -> move-result
            // -> if-eqz. The equals call sits between the literal and the result, so scan forward.
            for (j in i + 1 until minOf(i + 5, instructions.size)) {
                val move = instructions.elementAt(j)
                if (move.opcode != Opcode.MOVE_RESULT) continue
                availability.replaceInstruction(j, BuilderInstruction11n(Opcode.CONST_4, (move as Instruction11x).registerA, 1))
                pinned = true
                break
            }
            if (pinned) break
        }
        if (!pinned) {
            throw PatchException(
                "morpheMusicPartnerPatch: au.g no longer compares the Spotify literal before a " +
                    "move-result - refusing to report an availability fix that was not applied"
            )
        }
        println("morpheMusicPartnerPatch: partner availability pinned to the install check in " +
            availability.definingClass.substringAfterLast('/'))

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
