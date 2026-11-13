package app.abeja.patches.gamespace.startanimation

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object WallpaperManagerGetCurrentUrlFingerprint : Fingerprint(
    definingClass = "Lcn/nubia/common/wallpaper/WallpaperManager;",
    name = "getCurrentUrl",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

object SplashFragmentShowStartAnimFingerprint : Fingerprint(
    definingClass = "Lcn/nubia/gamelauncher/fragment/SplashFragment;",
    name = "showStartAnim",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = emptyList(),
)

object OtherOptionsFragmentOnCreateFingerprint : Fingerprint(
    definingClass = "Lcn/nubia/gamecenter/settings/basic/OtherOptionsFragment;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

object GameSpaceActivityOnBackPressedFingerprint : Fingerprint(
    definingClass = "Lcn/nubia/gamelauncher/activity/GameSpaceActivity;",
    name = "onBackPressed",
    returnType = "V",
    parameters = emptyList(),
)

object BgmHelperInitMediaPlayerFingerprint : Fingerprint(
    definingClass = "Lcn/nubia/gamelauncher/helper/BgmHelper;",
    name = "initMediaPlayer",
    returnType = "V",
    parameters = emptyList(),
)
