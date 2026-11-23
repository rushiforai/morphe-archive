package patapon888.morphe.patches.fruitninja.offline

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.fruitninja.FRUIT_NINJA_CLASSIC
import patapon888.morphe.patches.fruitninja.native.LibraryEdit
import patapon888.morphe.patches.fruitninja.native.NOP
import patapon888.morphe.patches.fruitninja.native.RETURN_FALSE
import patapon888.morphe.patches.fruitninja.native.RETURN_TRUE
import patapon888.morphe.patches.fruitninja.native.arm64OnlyPatch
import patapon888.morphe.patches.fruitninja.native.deactivateGameObjects
import patapon888.morphe.patches.fruitninja.native.patchGameLibrary

/**
 * The online parts of the startup and of the menus are skipped, so the game starts and plays
 * the same with or without network access, including on a first start with no saved data.
 */
@Suppress("unused")
val offlineModePatch = resourcePatch(
    name = "Offline mode",
    description = "Lets the game start and play without network access, also on a first start: " +
        "no privacy, sign-in, Play Games or cloud save pop-ups, and the profile, inbox and leaderboard buttons are hidden. " +
        "The save stays on the device: the game no longer connects to its online account service. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(FRUIT_NINJA_CLASSIC)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                // Loading.StartupLoginAndLoadCoroutine: no privacy policy pop-up (b over the acceptance check),
                // and no wait for it to be accepted (cbz -> nop). Without both, a first start never leaves loading.
                LibraryEdit(0x1D097B8, "e8050035", "2f000014"),
                LibraryEdit(0x1D09880, "e8030034", NOP),
                // PlayFabAuthManager.DefaultSignIn: no "sign in for benefits" pop-up or account linking.
                LibraryEdit(0x1D29960, "48f0ff34", "13000014"),
                // No cloud save conflict, no forced refresh, and the player counts as signed in.
                LibraryEdit(0x1CB51C0, "ff4301d1 fe6701a9", RETURN_FALSE), // CheckForCloudSaveConflict
                LibraryEdit(0x2DC15E0, "fe4fbfa9 f30300aa", RETURN_FALSE), // IsRefreshRequired
                LibraryEdit(0x2D60224, "087840f9 1f0100f1", RETURN_TRUE), // isSignedIn
                // Online-only buttons hide themselves: gameObject.SetActive(false), then return.
                LibraryEdit( // ScreenProfileButton
                    0x2DBB4A8,
                    "fe0f1ff8 e80300aa 001440f9 a00000b4 01c14039 e2031faa fe0741f8",
                    "fe0f1ff8 e1031faa e98c3494 fe0741f8 01008052 e2031faa f89b3414",
                ),
                LibraryEdit( // HBPlusInbox
                    0x1E88604,
                    "fe0f1cf8 f85f01a9 f65702a9 f44f03a9 b41f01f0 889e6f39 f30300aa",
                    "fe0f1ff8 e1031faa 92587194 fe0741f8 01008052 e2031faa a1677114",
                ),
                LibraryEdit( // InboxNotification
                    0x2DA0E18,
                    "fe5fbda9 f65701a9 f44f02a9 14a700f0 885e6039 f30300aa 28010037",
                    "fe0f1ff8 e1031faa 8df63494 fe0741f8 01008052 e2031faa 9c053514",
                ),
                // PlayFabUnityHttp.MakeApiCall: every PlayFab request fails at once through its own OnError
                // (mov x2, x1; ldr x1, [x1, #32] = ApiEndpoint; b OnError), as with no network. The re-signed
                // app can't use its Play Games account, so it would sign in to a new empty PlayFab account
                // whose server data then replaces the local save.
                LibraryEdit(0x32C3270, "fe57bea9 f44f01a9 157e00f0", "e20301aa 211040f9 ca010014"),
                // UnitySocialAuthWrapper.Authenticate coroutine ends at once: no Play Games sign-in pop-up.
                LibraryEdit(0x1D2B990, "e80f1bfc fe6701a9", RETURN_FALSE),
                // BankPlayerDataObject.ApplyDelta reads TotalEarned[code], which throws when a save has no
                // starfruit entry yet, and the game freezes after game over. It now calls
                // this.GetTotalEarned(code), which returns 0 for a missing entry.
                LibraryEdit(0x1C9F1C4, "e00316aa", "e00313aa"), // mov x0, x22 -> mov x0, x19
                LibraryEdit(0x1C9F1D4, "cb201e94", "a0ffff97"), // bl get_Item -> bl GetTotalEarned
            )
        )
        // The weekly leaderboards are online only, empty without an account: the main menu button
        // and the panel on the results screens start hidden.
        deactivateGameObjects(listOf("LeaderBoardsEntryPoint", "LeaderboardPostGame"))
    }
}
