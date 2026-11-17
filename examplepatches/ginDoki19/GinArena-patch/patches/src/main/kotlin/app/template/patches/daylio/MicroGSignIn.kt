package app.template.patches.daylio

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DAYLIO
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element

// ============================================================================
// Google sign-in through MicroG RE - Daylio 1.72.0 (291)
//
// What Daylio actually signs in to
// --------------------------------
// Not a Daylio account and not an ID token. The only Google surface in this build is the Google
// Drive backup: "Log in to Google Account" / "Please log in to your Google Account to enable
// backups", scope https://www.googleapis.com/auth/drive.appdata, obtained through the legacy
// AccountManager / GoogleAuthUtil path. There is no Firebase Auth (0 classes), no Credential
// Manager (0 classes), no One-Tap (0 classes) and no requestIdToken anywhere in the dex.
//
// Why it breaks on a patched build
// --------------------------------
// The app is re-signed by Morphe. Google identifies an Android OAuth client by the pair
// (package name, signing certificate SHA-1); the pair it now presents is not the registered one,
// so the token request is refused. MicroG RE asks Google for the token AS THE ORIGINAL APP, by
// reading the original identity out of the app's own manifest meta-data. Those two values are
// constants, so this keeps working however the APK is re-signed or renamed.
//
// Verified against MicroG RE 7.3.1 (app.revanced.android.gms,
// sha256 a9224a1f7386bb3f22aed44c3a218986ec73822ce18c16fb4849ea406aa185b9):
//   * org.microg.gms.common.PackageSpoofUtils reads exactly
//       app.revanced.android.gms.SPOOFED_PACKAGE_NAME
//       app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE   (bare 40-hex SHA-1, no colons)
//   * its account type is `app.revanced` - resolved out of res/xml/fx.xml -> @0x7f1304d1 ->
//     var_authenticator_account_type, NOT "com.google". A work-profile authenticator exists too and
//     keeps the literal `com.google.work`.
//   * it exports app.revanced.android.gms.auth.GOOGLE_SIGN_IN,
//     ...auth.api.signin.service.START, ...auth.blockstore.service.START, ...chimera, ...phenotype.
//   * it declares com.google.android.gms.auth.GetToken under the ORIGINAL name, and does NOT
//     declare app.revanced...auth.GetToken - so that string must not be rewritten.
//
// Daylio's signing certificate (read from the stock base.apk signing block):
//   SHA-1   f3eac16eba4dd6048574cb20a6c275b2275ebfb8   (subject C=SK, 2015-08-17)
//   SHA-256 6afb7e4100413a77e13b6a1e4f8ac1f9e3421862b3678fb9abe6aa531e859a9d
//           (equals DAYLIO_SIGNER in shared/Constants.kt, which is how this stock build was
//            confirmed to be the same one the repo already pins)
//
// Deliberately NOT ported from the WPS patch: the "report Play services as available" step.
// Daylio does not bundle GoogleApiAvailability, GoogleApiAvailabilityLight, GooglePlayServicesUtil
// or GooglePlayServicesUtilLight at all (checked: 0 classes each), so there is no availability
// check to answer and a fingerprint for it would always fail.
// ============================================================================

internal const val DAYLIO_ORIGINAL_PACKAGE = "net.daylio"
internal const val DAYLIO_ORIGINAL_SIGNER_SHA1 = "f3eac16eba4dd6048574cb20a6c275b2275ebfb8"
internal const val MICROG_PACKAGE = "app.revanced.android.gms"
internal const val MICROG_VENDOR = "app.revanced"

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

/**
 * Daylio bundles Google's own Play-services *client* code, including GoogleSignatureVerifier, which
 * decides whether the installed "com.google.android.gms" package carries one of Google's
 * certificates. That check can never pass against MicroG - MicroG's certificate is its own, and no
 * amount of package-name routing changes that - so the client reports SERVICE_INVALID ("Daylio
 * won't run without Google Play services, which are not supported by your device") and the Backup &
 * Restore screen stops at a dialog instead of reaching the sign-in.
 *
 * Answering "yes, this is a Google-signed package" is what MicroG's own identity spoofing is for;
 * this method is that answer, in the one place Daylio asks the question.
 */
private val googleSignatureVerifier = Fingerprint(
    definingClass = "Lvs3;",
    name = "e",
    returnType = "Z",
    parameters = listOf("Landroid/content/pm/PackageInfo;", "Z"),
)

/**
 * The other half of the same question, and the one that actually puts the dialog on screen.
 *
 * GoogleApiAvailabilityLight.isGooglePlayServicesAvailable(Context, int) is the method every caller
 * in the bundled client uses to decide "can I talk to Play services?". It answers 0 (fine), 1
 * (missing), 2 (too old), 3 (disabled) or 9 (present but not Google-signed) - and Daylio's own
 * sign-in handler pops the "[App] won't run without Google Play services..." dialog for 1, 2, 3
 * and 9 alike.
 *
 * Forcing only the signature verifier is not enough. This method reaches a status without ever
 * consulting it: on a Google-embedded device it compares the Play Store's certificate with the Play
 * services one directly, and on any device it answers 2 whenever the installed MicroG reports a
 * lower versionCode than the bundled client expects - which is the "which are currently updating"
 * flavour of the same dialog. Morphe's own GmsCore support patch therefore short-circuits this
 * method outright (`GooglePlayUtilityFingerprint.method.returnEarly(0)`); this is the same answer,
 * as an insertion in front of the original body rather than a rewrite of it.
 */
private val playServicesAvailability = Fingerprint(
    definingClass = "Lsr3;",
    name = "b",
    returnType = "I",
    parameters = listOf("I", "Landroid/content/Context;"),
)

/**
 * Exact string constants to rewrite, old -> new. Whole-string matches only, so nothing here can
 * damage a class descriptor, a log tag or a longer action name by accident.
 *
 * Every "new" value was confirmed present in MicroG RE 7.3.1's manifest before being listed.
 * "com.google.android.gms.auth.GetToken" is absent on purpose: MicroG answers to the original name.
 */
internal val DAYLIO_MICROG_ROUTES: Map<String, String> = linkedMapOf(
    // account type: 5 Account(...) constructions + GoogleSignInOptions' default
    "com.google" to MICROG_VENDOR,
    // the Play services package itself (bind targets, provider authorities)
    "com.google.android.gms" to MICROG_PACKAGE,
    // the sign-in handshake.
    // This one must be routed. Daylio's SignInHubActivity validates the incoming action, then
    // re-sends THE SAME action to the Play services package (which this patch rewrites to
    // MicroG). MicroG's AuthSignInActivity advertises only
    // "app.revanced.android.gms.auth.GOOGLE_SIGN_IN" (the original name appears zero times in
    // its manifest), so an unrewritten action finds no activity at all. The app is internally
    // consistent either way - it builds the intent itself with this same literal - so routing
    // it is what makes the outgoing step land.
    "com.google.android.gms.auth.GOOGLE_SIGN_IN" to "$MICROG_PACKAGE.auth.GOOGLE_SIGN_IN",
    "com.google.android.gms.auth.api.signin.service.START" to
        "$MICROG_PACKAGE.auth.api.signin.service.START",
    // token storage used by the sign-in result
    "com.google.android.gms.auth.blockstore.service.START" to
        "$MICROG_PACKAGE.auth.blockstore.service.START",
    // component discovery / config providers
    "com.google.android.gms.chimera" to "$MICROG_PACKAGE.chimera",
    "com.google.android.gms.phenotype" to "$MICROG_PACKAGE.phenotype",
    // provider authority used by EmojiCompat's downloadable-font request (f73: Noto Color Emoji
    // Compat). MicroG serves this authority as app.revanced.android.gms.fonts.
    "com.google.android.gms.fonts" to "$MICROG_PACKAGE.fonts",
)

/**
 * Strings that must survive the rewrite untouched. Asserted after the edit so a future MicroG or
 * Daylio change cannot silently break token acquisition.
 */
/**
 * Content-provider URIs that Daylio builds by concatenation, e.g.
 * "content://com.google.android.gms.phenotype/" + encodedName. An exact-string table cannot see
 * those, so they are matched by prefix. Both replacement authorities were confirmed present in
 * MicroG RE 7.3.1's own manifest (app.revanced.android.gms.phenotype, app.revanced.android.gsf.gservices).
 */
internal val DAYLIO_MICROG_URI_PREFIXES: List<String> = listOf(
    "content://com.google.android.gms.phenotype",
    "content://com.google.android.gsf.gservices",
)

private const val URI_PREFIX = "content://"

/** Exact route first, then a content:// prefix rule. Returns null when nothing applies. */
internal fun microgRouteFor(text: String): String? {
    DAYLIO_MICROG_ROUTES[text]?.let { return it }
    if (!text.startsWith(URI_PREFIX)) return null
    val authority = DAYLIO_MICROG_URI_PREFIXES.firstOrNull { text.startsWith(it) } ?: return null
    return text.replaceFirst(authority, authority.replace("com.google", MICROG_VENDOR))
}

internal val DAYLIO_MUST_NOT_ROUTE: Set<String> = setOf(
    "com.google.android.gms.auth.GetToken",
    "com.google.work",
)

internal val spoofDaylioIdentityOption = booleanOption(
    key = "spoofOriginalIdentity",
    default = true,
    title = "Sign in as the original app",
    description = "Tells MicroG Daylio's original package name and signing-certificate SHA-1, which is " +
        "what makes Google accept the sign-in on a re-signed APK.",
)

internal val routeDaylioGoogleCallsOption = booleanOption(
    key = "routeGoogleServices",
    default = true,
    title = "Send Google calls to MicroG",
    description = "Points Daylio's Play services sign-in and account lookups at MicroG.",
)

internal val addDaylioMicrogQueriesOption = booleanOption(
    key = "addMicrogQueries",
    default = true,
    title = "Let the app find Google and MicroG",
    description = "Makes both Play services packages visible on Android 11+. Stock Daylio declares neither, " +
        "so this changes nothing else.",
)

internal val daylioMicroGManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
                ?: throw PatchException("Daylio MicroG patch: AndroidManifest.xml has no root element")
            val application = document.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("Daylio MicroG patch: AndroidManifest.xml has no <application>")

            if (spoofDaylioIdentityOption.value == true) {
                val wanted = mapOf(
                    "$MICROG_PACKAGE.SPOOFED_PACKAGE_NAME" to DAYLIO_ORIGINAL_PACKAGE,
                    "$MICROG_PACKAGE.SPOOFED_PACKAGE_SIGNATURE" to DAYLIO_ORIGINAL_SIGNER_SHA1,
                    "$MICROG_VENDOR.MICROG_PACKAGE_NAME" to MICROG_PACKAGE,
                )
                val present = (0 until application.childNodes.length).mapNotNull { index ->
                    val node = application.childNodes.item(index)
                    if (node is Element && node.tagName == "meta-data") {
                        node.getAttributeNS(ANDROID_NS, "name")
                    } else {
                        null
                    }
                }.toSet()

                wanted.forEach { (name, value) ->
                    if (name in present) return@forEach
                    val entry = document.createElement("meta-data")
                    entry.setAttributeNS(ANDROID_NS, "android:name", name)
                    entry.setAttributeNS(ANDROID_NS, "android:value", value)
                    application.appendChild(entry)
                }
            }

            if (addDaylioMicrogQueriesOption.value == true) {
                val existing = document.getElementsByTagName("queries")
                val queries = if (existing.length > 0) {
                    existing.item(0) as Element
                } else {
                    document.createElement("queries").also { manifest.insertBefore(it, application) }
                }
                listOf("com.google.android.gms", MICROG_PACKAGE).forEach { packageName ->
                    val already = (0 until queries.childNodes.length).any { index ->
                        val node = queries.childNodes.item(index)
                        node is Element && node.tagName == "package" &&
                            node.getAttributeNS(ANDROID_NS, "name") == packageName
                    }
                    if (!already) {
                        val entry = document.createElement("package")
                        entry.setAttributeNS(ANDROID_NS, "android:name", packageName)
                        queries.appendChild(entry)
                    }
                }
            }
        }
    }
}

internal val daylioMicroGSignInPatch = bytecodePatch(
    // Named after what it does for Daylio rather than after the mechanism: WPS Office already ships a
    // patch called "Google sign-in via MicroG RE", and two patches with the same name collide in
    // patches-list.json - every README row would resolve to the first of the two identical headings.
    name = "Google Drive backup via MicroG RE",
    description = "Makes the Google Drive backup sign-in work on a re-signed Daylio by signing in as the " +
        "original app, and stops the \"won't run without Google Play services\" dialog. Needs MicroG RE " +
        "installed with a Google account added. Daylio's local journal and every other feature are " +
        "unaffected.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DAYLIO)
    dependsOn(daylioMicroGManifestPatch)

    spoofDaylioIdentityOption()
    routeDaylioGoogleCallsOption()
    addDaylioMicrogQueriesOption()

    execute {
        check(packageMetadata.packageName == DAYLIO_ORIGINAL_PACKAGE) { "This patch is for net.daylio only." }

        if (routeDaylioGoogleCallsOption.value == true) {
            // An APK that already carries this patch must not be mistaken for a broken dex. Look
            // for MicroG's package name once, up front, and if it is already there leave the
            // routing untouched - re-patching a patched APK is a normal thing for users to do.
            var alreadyRouted = false
            classDefForEach { classDef ->
                if (alreadyRouted) return@classDefForEach
                classDef.methods.forEach { method ->
                    if (alreadyRouted) return@forEach
                    method.implementation?.instructions?.forEach { instruction ->
                        val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                        if (text != null && text.startsWith(MICROG_PACKAGE)) alreadyRouted = true
                    }
                }
            }
            if (alreadyRouted) {
                println(
                    "Daylio MicroG: this APK already routes Google calls to MicroG RE - " +
                        "nothing to rewrite, keeping it as is.",
                )
            }

            // Collect first: the class list must not be mutated while iterating it.
            val targets = mutableListOf<ClassDef>()
            classDefForEach { classDef ->
                val hit = classDef.methods.any { method ->
                    method.implementation?.instructions?.any { instruction ->
                        val value = (instruction as? ReferenceInstruction)?.reference as? StringReference
                        val text = value?.string
                        text != null && microgRouteFor(text) != null
                    } == true
                }
                if (hit) targets += classDef
            }

            var edits = 0
            val touched = mutableMapOf<String, Int>()
            for (classDef in targets) {
                val mutableClass = mutableClassDefBy(classDef)
                for (method in mutableClass.methods) {
                    val instructions = method.implementation?.instructions?.toList() ?: continue
                    instructions.forEachIndexed { index, instruction: Instruction ->
                        if (instruction.opcode != Opcode.CONST_STRING &&
                            instruction.opcode != Opcode.CONST_STRING_JUMBO
                        ) {
                            return@forEachIndexed
                        }
                        val value = (instruction as? ReferenceInstruction)?.reference as? StringReference
                        val text = value?.string ?: return@forEachIndexed
                        // GoogleAuthUtil has a fixed 3-slot allow-list of account types and throws
                        // "Account type not supported" for anything else. Rewriting "com.google"
                        // there would make a real Google account unusable with this build. Every
                        // other site must speak microG's account type, so inside that one method
                        // the unused China variant is swapped instead and "com.google" is kept.
                        val inAccountTypeList = classDef.type == "Lwr3;" && method.name == "<clinit>"
                        val replacement: String? = when {
                            inAccountTypeList && text == "com.google" -> null
                            inAccountTypeList && text == "cn.google" -> MICROG_VENDOR
                            else -> microgRouteFor(text)
                        } ?: return@forEachIndexed
                        val register = (instruction as OneRegisterInstruction).registerA
                        method.replaceInstruction(index, "const-string v$register, \"$replacement\"")
                        edits++
                        touched[text] = (touched[text] ?: 0) + 1
                        if (text !in DAYLIO_MICROG_ROUTES) {
                            val prefix = DAYLIO_MICROG_URI_PREFIXES.firstOrNull { text.startsWith(it) }
                            if (prefix != null) touched[prefix] = (touched[prefix] ?: 0) + 1
                        }
                    }
                }
            }

            if (edits == 0) {
                if (!alreadyRouted) {
                    throw PatchException(
                        "Daylio MicroG patch: no Google Play services string was rewritten and the APK " +
                            "does not point at MicroG either - the dex layout changed. " +
                            "Daylio 1.72.0 (291) is the supported build.",
                    )
                }
            }

            // Every route that was supposed to be present must have been found, otherwise the table
            // has drifted from the app and the sign-in would silently point at the wrong service.
            val missing = if (alreadyRouted) {
                emptyList()
            } else {
                (DAYLIO_MICROG_ROUTES.keys + DAYLIO_MICROG_URI_PREFIXES).filter { (touched[it] ?: 0) == 0 }
            }
            if (missing.isNotEmpty()) {
                throw PatchException("Daylio MicroG patch: expected strings not found in the dex: $missing")
            }
            // And the two that must not move are still the originals.
            var guarded = 0
            classDefForEach { classDef ->
                classDef.methods.forEach { method ->
                    method.implementation?.instructions?.forEach { instruction ->
                        val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                        if (text in DAYLIO_MUST_NOT_ROUTE) guarded++
                    }
                }
            }
            check(guarded >= 2) { "Daylio MicroG patch: the GetToken / work-account strings went missing." }

            if (edits > 0) {
                println(
                    "Daylio MicroG: rewrote $edits string(s) in ${targets.size} class(es): " +
                        touched.entries.joinToString { "${it.key}=${it.value}" },
                )
            }

            // ---- accept MicroG as the Google-signed Play services package --------------------
            // Structural check first: this must still be the verifier (it names the Play services
            // package) and must still take (PackageInfo, boolean) and answer a boolean.
            val verifier = googleSignatureVerifier.method
            val instructions = verifier.implementation?.instructions?.toList().orEmpty()
            val namesGms = instructions.any { instruction ->
                val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                text == "com.google.android.gms" || text == MICROG_PACKAGE
            }
            // Re-patching an already patched APK is normal for users, so recognise our own prologue
            // instead of failing on it.
            val alreadyAccepted = instructions.size >= 2 &&
                instructions[0].opcode == Opcode.CONST_4 &&
                (instructions[0] as? NarrowLiteralInstruction)?.narrowLiteral == 1 &&
                instructions[1].opcode == Opcode.RETURN
            // Order matters: the original body stays behind our prologue, so it keeps naming the
            // Play services package. Testing "does it name gms" first would therefore be true on an
            // already-patched APK too and would stack a second, redundant prologue on every
            // re-patch. Ask "am I already here?" first instead.
            if (alreadyAccepted) {
                println("Daylio MicroG: signature check already accepts MicroG - leaving it.")
            } else if (namesGms) {
                check((verifier.implementation?.registerCount ?: 0) >= 1) {
                    "Daylio MicroG: the signature verifier lost its registers."
                }
                verifier.addInstructionsWithLabels(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """,
                )
                println(
                    "Daylio MicroG: the Play-services signature check now accepts MicroG " +
                        "(this is what produced the \"won't run without Google Play services\" dialog).",
                )
            } else {
                throw PatchException(
                    "Daylio MicroG: the Play-services signature verifier neither names the Play " +
                        "services package nor carries this patch's answer - refusing to patch blind.",
                )
            }

            // ---- answer "Play services are available" so the dialog cannot be reached -------
            // Identity check first: this must still be the availability method. It is the only
            // method in the APK that carries these two strings, and both are Google-generated.
            val availability = playServicesAvailability.method
            val availabilityBody = availability.implementation?.instructions?.toList().orEmpty()
            fun availabilityString(needle: String) = availabilityBody.any { instruction ->
                val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                text != null && text.contains(needle)
            }
            val looksLikeAvailability = availabilityString("MetadataValueReader") &&
                availabilityString(" requires Google Play services, but their signature is invalid.")
            // Same rule as above: recognise our own answer before looking at the body, because the
            // retained original body keeps every string this method ever had.
            val alreadyAvailable = availabilityBody.any { instruction ->
                val text = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                text == MICROG_PACKAGE
            } && availabilityBody.take(12).any { instruction ->
                instruction.opcode == Opcode.IF_EQZ || instruction.opcode == Opcode.IF_NEZ
            } && availabilityBody.take(12).any { instruction ->
                instruction.opcode == Opcode.CONST_4 &&
                    (instruction as? NarrowLiteralInstruction)?.narrowLiteral == 0
            } && availabilityBody.take(12).any { it.opcode == Opcode.RETURN }
            if (alreadyAvailable) {
                println("Daylio MicroG: Play-services availability already answers ok - leaving it.")
            } else if (looksLikeAvailability) {
                check((availability.implementation?.registerCount ?: 0) >= 4) {
                    "Daylio MicroG: the availability method lost its registers."
                }
                // Answering 0 unconditionally would be a lie if MicroG is not installed: the
                // sign-in would then be attempted against a package that does not exist. So answer
                // 0 only when MicroG RE is really there, and otherwise fall through to the original
                // body, which reports it as missing exactly like stock Daylio would.
                // getLaunchIntentForPackage is used because it returns null instead of throwing.
                availability.addInstructionsWithLabels(
                    0,
                    """
                        invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
                        move-result-object v1
                        const-string v2, "$MICROG_PACKAGE"
                        invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;
                        move-result-object v1
                        if-eqz v1, :daylio_microg_availability_missing
                        const/4 v0, 0x0
                        return v0
                        :daylio_microg_availability_missing
                        nop
                    """,
                )
                println(
                    "Daylio MicroG: Play-services availability answers 0 while MicroG RE is " +
                        "installed, so the \"won't run without Google Play services\" dialog cannot appear.",
                )
            } else {
                throw PatchException(
                    "Daylio MicroG: the Play-services availability method no longer carries " +
                        "Google's own strings - refusing to patch blind.",
                )
            }
        }

        println(
            "Daylio MicroG: identity is $DAYLIO_ORIGINAL_PACKAGE signed by $DAYLIO_ORIGINAL_SIGNER_SHA1; " +
                "MicroG RE must be installed as $MICROG_PACKAGE.",
        )
    }
}
