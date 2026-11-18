package io.github.kirby1997.patches.twitter

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.kirby1997.patches.shared.Constants

// The version X reports is a compile-time constant, not a PackageInfo lookup, and it
// reaches the server on every request:
//
//   com.twitter.network.i1.a(URI, UserIdentifier, u$a)
//       -> header "X-Twitter-Client-Version" = "12.7.1-release.0"
//   com.twitter.app.x.c.e()   the com.x stack's app-config version name (implements
//                             com.x.common.api.a, the same config the force-update
//                             checker reads)
//   com.twitter.app.x.c.j()   the same constant, split on "-" to drop the release suffix
//   com.twitter.network.r1.<init>  the User-Agent, which embeds the version inside a larger
//                             literal: "TwitterAndroid" + "/12.7.1-release.0 (" + versionCode
//
// The "This app is out of date" screen is drawn from server-supplied copy - neither its
// title nor its body exists anywhere in the APK's resources or dex - so it is issued in
// response to the version the client announces rather than decided locally. Reporting a
// higher version is therefore the fix; there is no local flag to clear.
private const val STOCK_VERSION = "12.7.1-release.0"

object ClientVersionHeaderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "Ljava/net/URI;",
        "Lcom/twitter/util/user/UserIdentifier;",
        "Lcom/twitter/network/u\$a;",
    ),
    definingClass = "Lcom/twitter/network/i1;",
    name = "a",
)

object AppConfigVersionNameFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    definingClass = "Lcom/twitter/app/x/c;",
    name = "e",
)

object UserAgentBuilderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/twitter/util/telephony/g;",
        "Lcom/twitter/util/android/q;",
    ),
    definingClass = "Lcom/twitter/network/r1;",
    name = "<init>",
)

object AppConfigShortVersionFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    definingClass = "Lcom/twitter/app/x/c;",
    name = "j",
)

@Suppress("unused")
val spoofClientVersionPatch = bytecodePatch(
    name = "Bypass version deprecation notice",
    description = "Reports a newer app version to X, so the server stops serving the full-screen " +
        "\"This app is out of date\" gate that cannot be dismissed. Rewrites the hardcoded version " +
        "constant in the X-Twitter-Client-Version header, the User-Agent, and the app-config version getters.",
) {
    compatibleWith(Constants.TWITTER_12_7_1)

    val spoofedVersion by stringOption(
        key = "spoofedVersion",
        default = "12.99.0-release.0",
        title = "Spoofed app version",
        description = "The version string reported to X. Must keep X's <major>.<minor>.<patch>-release.<n> " +
            "shape. Raise it if the deprecation gate returns.",
        required = true,
    )

    execute {
        val version = spoofedVersion ?: "12.99.0-release.0"

        // Each site holds the version in a const-string, but not always alone - the
        // User-Agent embeds it in "/12.7.1-release.0 (". Substitute within the literal and
        // keep the original destination register, leaving the surrounding code untouched.
        fun Fingerprint.rewriteVersionConstant() {
            val patchedMethod = method
            patchedMethod.instructions
                .withIndex()
                .filter { (_, instruction) ->
                    (instruction.opcode == Opcode.CONST_STRING || instruction.opcode == Opcode.CONST_STRING_JUMBO) &&
                        ((instruction as ReferenceInstruction).reference as StringReference).string.contains(STOCK_VERSION)
                }
                // Rewrite back to front so earlier indexes stay valid.
                .reversed()
                .forEach { (index, instruction) ->
                    val register = (instruction as OneRegisterInstruction).registerA
                    val literal = ((instruction as ReferenceInstruction).reference as StringReference)
                        .string
                        .replace(STOCK_VERSION, version)
                    patchedMethod.replaceInstruction(index, "const-string v$register, \"$literal\"")
                }
        }

        ClientVersionHeaderFingerprint.rewriteVersionConstant()
        UserAgentBuilderFingerprint.rewriteVersionConstant()
        AppConfigVersionNameFingerprint.rewriteVersionConstant()
        AppConfigShortVersionFingerprint.rewriteVersionConstant()
    }
}
