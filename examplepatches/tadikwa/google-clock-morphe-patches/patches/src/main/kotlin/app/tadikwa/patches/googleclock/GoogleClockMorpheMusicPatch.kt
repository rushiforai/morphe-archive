package app.tadikwa.patches.googleclock

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

private const val GOOGLE_CLOCK_PACKAGE = "com.google.android.deskclock"
private const val STOCK_YTM_PACKAGE = "com.google.android.apps.youtube.music"
private const val MORPHE_YTM_PACKAGE = "app.morphe.android.apps.youtube.music"

// Verified against Google Clock 9.0 (943154005), versionCode 76073630.
// Exact obfuscated symbols for this build:
//   YTM provider enum = Ldcg;->c:Ldcg;
//   MusicProviderStatus.appState = Ldch;->b:I
private const val YTM_PROVIDER_FIELD = "Ldcg;->c:Ldcg;"
private const val MUSIC_PROVIDER_STATUS_APP_STATE_FIELD = "Ldch;->b:I"
private const val MUSIC_PROVIDER_STATUS_SEARCH_API_FIELD = "Ldch;->c:I"
private const val MUSIC_PROVIDER_STATUS_BROWSE_API_FIELD = "Ldch;->d:I"
private const val MUSIC_PROVIDER_STATUS_FIRE_API_FIELD = "Ldch;->e:I"
private const val APP_STATE_REQUIRES_PREMIUM = 0x8
private const val APP_STATE_ONLINE = 0xa
private const val API_STATE_CONNECTED = 0x3

private val GOOGLE_CLOCK_COMPATIBILITY = Compatibility(
    name = "Clock",
    packageName = GOOGLE_CLOCK_PACKAGE,
    appIconColor = 0x4285F4,
    targets = listOf(
        AppTarget(
            version = "9.0 (943154005)",
            isExperimental = false,
            description = "Verified against Google Clock 9.0 build 943154005 / versionCode 76073630."
        )
    )
)

private object MusicProviderPackageFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("com.calm.android"),
        string("com.pandora.android"),
        string(STOCK_YTM_PACKAGE),
    )
)

private object MusicProviderStatusClassFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf(
        "MusicProviderStatus {provider=%s, appState=%s, searchAPI=%s, browseAPI=%s, fireAPI=%s, accountType=%s}"
    )
)

private object MusicProviderStatusConstructorFingerprint : Fingerprint(
    classFingerprint = MusicProviderStatusClassFingerprint,
    name = "<init>",
    returnType = "V",
    parameters = listOf("L", "I", "I", "I", "I", "I"),
)

@Suppress("unused")
val googleClockMorpheMusicPatch = bytecodePatch(
    name = "Use Morphe YouTube Music for alarms",
    description = "Redirects Google Clock to Morphe YouTube Music and converts its Premium-required playback session into Clock's normal ready MediaBrowser state.",
    default = true,
) {
    compatibleWith(GOOGLE_CLOCK_COMPATIBILITY)

    execute {
        // Redirect Clock from the stock YT Music package to Morphe's renamed package.
        MusicProviderPackageFingerprint.method.apply {
            val packageInstructionIndex = instructions.indexOfFirst { instruction ->
                if (instruction.opcode != Opcode.CONST_STRING) return@indexOfFirst false
                val reference = (instruction as? ReferenceInstruction)?.reference as? StringReference
                    ?: return@indexOfFirst false
                reference.string == STOCK_YTM_PACKAGE
            }

            if (packageInstructionIndex < 0) {
                throw PatchException("Could not find Google Clock's YouTube Music package constant")
            }

            val register = getInstruction<OneRegisterInstruction>(packageInstructionIndex).registerA

            replaceInstruction(
                packageInstructionIndex,
                BuilderInstruction21c(
                    Opcode.CONST_STRING,
                    register,
                    ImmutableStringReference(MORPHE_YTM_PACKAGE),
                )
            )
        }

        // YT Music's MediaBrowser API reports its real subscription entitlement to Clock.
        // Morphe unlocks YT Music features in-app, but that external MediaBrowser flag remains
        // non-premium. Clock turns it into REQUIRES_PREMIUM and shows the subscription screen.
        //
        // For the YTM provider only, convert:
        //   REQUIRES_PREMIUM (8) -> ONLINE (10)
        // when Clock constructs MusicProviderStatus.
        MusicProviderStatusConstructorFingerprint.method.apply {
            val returnIndex = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
            if (returnIndex < 0) {
                throw PatchException("Could not find MusicProviderStatus constructor return")
            }

            addInstructionsWithLabels(
                returnIndex,
                """
                    sget-object p6, $YTM_PROVIDER_FIELD
                    if-ne p1, p6, :morphe_continue
                    const/16 p6, $APP_STATE_REQUIRES_PREMIUM
                    if-ne p2, p6, :morphe_continue
                    const/16 p2, $APP_STATE_ONLINE
                    iput p2, p0, $MUSIC_PROVIDER_STATUS_APP_STATE_FIELD

                    const/4 p6, $API_STATE_CONNECTED
                    iput p6, p0, $MUSIC_PROVIDER_STATUS_SEARCH_API_FIELD
                    iput p6, p0, $MUSIC_PROVIDER_STATUS_BROWSE_API_FIELD
                    iput p6, p0, $MUSIC_PROVIDER_STATUS_FIRE_API_FIELD
                """,
                ExternalLabel("morphe_continue", getInstruction(returnIndex)),
            )
        }
    }
}
