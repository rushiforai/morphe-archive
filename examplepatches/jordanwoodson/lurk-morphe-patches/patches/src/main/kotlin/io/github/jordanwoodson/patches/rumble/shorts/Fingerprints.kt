package io.github.jordanwoodson.patches.rumble.shorts

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import com.android.tools.smali.dexlib2.Opcode
import io.github.jordanwoodson.patches.rumble.shared.composableFingerprint
import io.github.jordanwoodson.patches.shared.compose.dtoGetterFingerprint

// The horizontal Shorts row (title, "View all" and cards) on Home, My Feed, channels, search and
// My Videos.
internal val ShortsListViewFingerprint =
    composableFingerprint("com.rumble.battles.discover.presentation.views.ShortsListView")

// HomeSectionKind.fromValue(kind): the type of each Home section the server sends. Gson DTOs keep their names.
internal object HomeSectionKindFingerprint : Fingerprint(
    definingClass = "Lcom/rumble/network/dto/home/HomeSectionKind\$Companion;",
    returnType = "Lcom/rumble/network/dto/home/HomeSectionKind;",
    parameters = listOf("Ljava/lang/String;"),
)

// Creator.tabs: the channel page tabs ("all", "shorts", "live", ...).
internal object CreatorTabsFingerprint : Fingerprint(
    definingClass = "Lcom/rumble/network/dto/creator/Creator;",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
    filters = listOf(fieldAccess(definingClass = "this", name = "tabs", opcode = Opcode.IGET_OBJECT)),
)

// FollowingFeedPillsData.items: My Feed's filter pills ("all", "today", "live", "videos", "shorts",
// "continue-watching", "reposts"), which the server sends since 3.22.0.
internal val FeedPillsFingerprint =
    dtoGetterFingerprint("Lcom/rumble/network/dto/video/FollowingFeedPillsData;", "items", "Ljava/util/List;")
