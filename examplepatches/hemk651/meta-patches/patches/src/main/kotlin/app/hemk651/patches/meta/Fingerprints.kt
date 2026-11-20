/*
 * Meta Patches — fingerprints shared by the Instagram patches.
 *
 * Ported from InstaFL patcher-core (https://github.com/mamiiblt/instafel)
 * by mamiiblt (Muhammed Ali Bulut), reworked for the Morphe patcher.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.patches.meta

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.InstructionLocation.MatchBeforeWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * The method of the ad-pod tracking class that contains the `"Is ad pod"` string.
 *
 * InstaFL ("Remove Ads" patch) makes this method return `true` immediately,
 * which stops the ad pod flow from being registered.
 */
internal object AdPodFingerprint : Fingerprint(
    filters = listOf(
        string("Is ad pod")
    )
)

/**
 * The build lockout duration calculation of the dogfooding (alpha build) snooze warning.
 *
 * The method constructs `Lcom/instagram/release/lockout/DogfoodingEligibilityApi;`
 * and converts "days since the build was released" from a long to an int by dividing
 * with `0x5265c00` (86400000 ms = one day). InstaFL ("Remove Snooze Warning" patch)
 * replaces the `long-to-int` result with `0x0`, so the app believes the build was
 * released today and never shows the expiration warning dialog.
 *
 * The instruction distance from the constructor call to the `long-to-int` has been
 * 17 instructions on every inspected build; the window allows some drift.
 */
internal object DogfoodingLockoutFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lcom/instagram/release/lockout/DogfoodingEligibilityApi;",
            name = "<init>",
            parameters = listOf("Lcom/instagram/common/session/UserSession;"),
            returnType = "V"
        ),
        opcode(Opcode.LONG_TO_INT, MatchAfterWithin(20))
    )
)

/**
 * The static call site that resolves the employee options (developer options) gate.
 *
 * The gate itself lives in an obfuscated class and is only reachable by following the
 * call from a stable, non-obfuscated caller. InstaFL uses a fallback chain of three
 * reference classes; every inspected build resolves through the first one.
 *
 * [app.hemk651.patches.meta.UnlockDeveloperOptionsPatch] loops over these class names
 * and uses the first one that yields a validated gate method.
 */
internal val employeeOptionsReferenceClasses = listOf(
    "Lcom/instagram/notifications/push/ClearNotificationReceiver;",
    "Lcom/instagram/base/activity/BaseFragmentActivity;",
    "Lcom/instagram/business/promote/activity/PromoteActivity;"
)

/**
 * The `const-wide` color literal that feeds `BasePrismColorsV2.GRAY_1600`,
 * the darkest surface color of the Compose prism palette.
 *
 * The long value is a Compose `ColorULong`: the ARGB packed value is shifted
 * left by 32 bits (`shl-long/2addr`) before being stored, so replacing the
 * literal with `0xff000000L` yields opaque black after the shift.
 */
internal object PrismGray1600Fingerprint : Fingerprint(
    definingClass = "Lcom/instagram/compose/core/theme/BasePrismColorsV2;",
    filters = listOf(
        fieldAccess(
            opcode = Opcode.SPUT_WIDE,
            name = "GRAY_1600",
            type = "J"
        ),
        opcode(
            Opcode.CONST_WIDE,
            MatchBeforeWithin(4)
        )
    )
)

/**
 * The `<clinit>` of the release channel enum that contains the `NONE`, `ALPHA`,
 * `BETA` and `PROD` names shown in the developer options UI.
 *
 * Strings are declared unordered because the four `const-string` instructions
 * of the enum constructor appear in a fixed but branching layout.
 */
internal object ChannelNameFingerprint : Fingerprint(
    strings = listOf(
        string("NONE"),
        string("ALPHA"),
        string("BETA"),
        string("PROD")
    )
)

/**
 * The `onCreate` of the Instagram app shell application class.
 *
 * [app.hemk651.patches.meta.AddModsMenuPatch] injects the extension
 * initialization (`ModsInit.init`) right after the `Application.onCreate` super
 * call, mirroring InstaFL's "Add Initialize Instafel" patch.
 */
internal object InstagramAppShellOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/app/InstagramAppShell;",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/app/Application;",
            name = "onCreate",
            parameters = emptyList(),
            returnType = "V"
        )
    )
)

/**
 * The home long click listener that decides what a long press on the home feed
 * performs, by comparing a MobileConfig value against the literal strings
 * `"click"` and `"activity"`.
 *
 * The class holds the main activity and the user session as synthetic fields,
 * which InstaFL ("Change Home Long Click" patch) verifies as well.
 */
internal object HomeLongClickFingerprint : Fingerprint(
    name = "onLongClick",
    strings = listOf(
        string("click"),
        string("activity")
    ),
    custom = { _, classDef ->
        classDef.interfaces.contains("Landroid/view/View${'$'}OnLongClickListener;") &&
                classDef.fields.any { it.type == "Lcom/instagram/mainactivity/InstagramMainActivity;" } &&
                classDef.fields.any { it.type == "Lcom/instagram/common/session/UserSession;" }
    }
)

/**
 * The fragment navigation call of `UserDetailFragment`, the only place in that
 * class that navigates to a bare `Landroidx/fragment/app/Fragment;`.
 *
 * The call goes through the app's FragmentNavigator
 * (`A0I(Landroidx/fragment/app/Fragment;)V`), which InstaFL's
 * "Change Home Long Click" patch re-uses to open the developer options from the
 * home sheet. The navigator class, its add method, its transition method and
 * its constructor signature are all recovered from this call site at patch time.
 */
internal object UserDetailNavigatorFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/profile/fragment/UserDetailFragment;",
    filters = listOf(
        methodCall(
            parameters = listOf("Landroidx/fragment/app/Fragment;"),
            returnType = "V"
        )
    )
)

/**
 * The placeholder `openDeveloperOptions` of the merged extension class.
 *
 * [app.hemk651.patches.meta.AddModsMenuPatch] replaces its body with a call to
 * the app's FragmentNavigator, discovered from
 * [UserDetailNavigatorFingerprint].
 */
internal object ModsHomeSheetOpenDeveloperOptionsFingerprint : Fingerprint(
    definingClass = "Lapp/hemk651/meta/extension/ModsHomeSheet;",
    name = "openDeveloperOptions",
    returnType = "V"
)

/**
 * The merged extension class that holds the applied patches information shown
 * in the menu ("Applied package patches" screen).
 *
 * [app.hemk651.patches.meta.AddModsMenuPatch] replaces the placeholder
 * `[]` value of the `appliedPatchesJson` static field with the static list of
 * the bundle patches. The value can be encoded as the field's initial value in
 * the dex `static_values` (d8 moves constant initializers there) or assigned
 * by a `const-string` in `<clinit>`; both forms are handled.
 */
internal object ModsPatchesInfoClassFingerprint : Fingerprint(
    definingClass = "Lapp/hemk651/meta/extension/activity/ModsPatchesInfoActivity;",
    name = "<init>"
)
