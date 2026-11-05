package app.southstar21.patches.instagram.layout.profilepicture

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

internal const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/instagram/profilepicture/ViewProfilePicturePatch;"

private const val USER_CLASS = "Lcom/instagram/user/model/User;"

/**
 * The profile page gets the user's full profile from the network here. Unlike the copies
 * shown in feeds and lists, this one includes the full size profile picture.
 */
internal object OnUserUpdatedFromNetworkFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/profile/fragment/UserDetailFragment;",
    returnType = "V",
    parameters = listOf(USER_CLASS, "J", "Z", "Z", "Z"),
    strings = listOf("UserDetailFragment.onUserUpdatedFromNetworkCallback"),
)

/** User's full size profile picture (url, width, height), from "hd_profile_pic_url_info". */
internal object UserHdProfilePicFingerprint : Fingerprint(
    definingClass = USER_CLASS,
    returnType = "Lcom/instagram/api/schemas/ProfilePicUrlInfo;",
    parameters = listOf(),
    filters = listOf(
        string("hd_profile_pic_url_info", StringComparisonType.EQUALS),
    ),
)

/** User's regular profile picture (150px), from "profile_pic_url". */
internal object UserProfilePicFingerprint : Fingerprint(
    definingClass = USER_CLASS,
    returnType = "Lcom/instagram/common/typedurl/ImageUrl;",
    parameters = listOf(),
    filters = listOf(
        string("profile_pic_url", StringComparisonType.EQUALS),
    ),
)

/** The profile page's user, read live from Instagram's user store. */
internal object TabControllerUserFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/profile/fragment/UserDetailTabController;",
    returnType = USER_CLASS,
    parameters = listOf(),
)

/** Called once a profile page's view exists, so the patch can track the page. */
internal object UserDetailFragmentOnViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/profile/fragment/UserDetailFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

