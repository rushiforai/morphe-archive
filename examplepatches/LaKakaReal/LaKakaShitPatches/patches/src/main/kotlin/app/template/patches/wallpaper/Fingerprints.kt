package app.template.patches.wallpaper

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

val LicenseActivityOnCreateFingerprint = Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseActivity;",
    name = "onCreate",
    parameters = listOf("Landroid/os/Bundle;"),
    returnType = "V",
    accessFlags = listOf(AccessFlags.PUBLIC)
)

val LicenseClientFingerprint = Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/jndapp/depth/live/wallpaper/model/Category;",
    strings = listOf("free"),
    returnType = "Z",
    parameters = listOf()
)

object IsPremiumOwnedFingerprint : Fingerprint(
    strings = listOf("premium_lifetime"),
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            name = "contains",
            returnType = "Z"
        )
    )
)

object PremiumSetterFingerprint : Fingerprint(
    strings = listOf("premium_lifetime"),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            name = "contains",
            returnType = "Z"
        ),
        methodCall(
            definingClass = "Ljava/lang/Boolean;",
            name = "valueOf",
            parameters = listOf("Z"),
            returnType = "Ljava/lang/Boolean;"
        )
    )
)

object Fo6ClinitFingerprint : Fingerprint(
    strings = listOf("Favourite", "Recent", "Premium", "Random"),
    name = "<clinit>"
)

object NavigationSetupFingerprint : Fingerprint(
    strings = listOf("Collection", "Wallpapers", "Studio", "Settings")
)

object Km6InvokeFingerprint : Fingerprint(
    strings = listOf("Premium wallpaper", "Play Video Preview")
)