package app.morphe.patches.klikktv.user

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.klikktv.shared.Constants.COMPATIBILITY_KLIKKTV
import app.morphe.patches.klikktv.shared.patches.utils.ioUtils.getSharedPreferenceStringPatch

@Suppress("unused")
val fakeUserPatch = bytecodePatch(
    name = "Fake user",
    description = "Fakes logged in user",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KLIKKTV)

    dependsOn(getSharedPreferenceStringPatch)
}