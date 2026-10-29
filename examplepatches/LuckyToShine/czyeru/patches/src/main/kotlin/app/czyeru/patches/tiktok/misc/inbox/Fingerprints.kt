package app.czyeru.patches.tiktok.misc.inbox

import app.morphe.patcher.Fingerprint

/** Activity notifications tab in merged activity/followers screen. */
internal object NotificationResultFragmentViewCreatedFingerprint : Fingerprint(
    definingClass = "/NotificationResultFragment;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

/** New followers tab in merged activity/followers screen. */
internal object InboxFollowerFragmentV2ViewCreatedFingerprint : Fingerprint(
    definingClass = "/InboxFollowerFragmentV2;",
    name = "onViewCreated",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Landroid/os/Bundle;"),
)

/**
 * AndroidX onBindViewHolder of PowerAdapter (classes5.dex). Shared by all PowerList instances,
 * including NotificationResultFragment and InboxFollowerFragmentV2.
 */
internal object PowerAdapterBindViewHolderFingerprint : Fingerprint(
    definingClass = "/PowerAdapter;",
    name = "onBindViewHolder",
    returnType = "V",
    parameters = listOf("Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;", "I"),
)
