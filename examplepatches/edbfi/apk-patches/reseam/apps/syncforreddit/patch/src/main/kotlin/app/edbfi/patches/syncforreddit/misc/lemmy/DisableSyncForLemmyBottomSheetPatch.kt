// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.lemmy

import app.edbfi.patches.syncforreddit.SyncPatchStrings
import app.edbfi.patches.syncforreddit.syncForReddit
import app.reseam.patch.Type
import app.reseam.patch.dex.Opcode
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points
import app.reseam.patch.skipWhen

private val lemmyButtonLabel = method("Sync for Lemmy button label") {
    strings("Signup to Sync for Lemmy")
    params()
    returns(Type.String)
}

private val startup = klass("com.laurencedawson.reddit_sync.ui.activities.MainActivity").method("onCreate") {
    params("android.os.Bundle")
    returns(Type.Void)
}

val disableSyncForLemmyBottomSheet = patch(SyncPatchStrings.disableSyncForLemmyBottomSheet) {
    description(SyncPatchStrings.disableSyncForLemmyBottomSheetDescription)
    compatibleWith(syncForReddit)

    execute {
        val sheet = lemmyButtonLabel.owner
        startup.points("Show Sync for Lemmy bottom sheet") {
            invokeStatic {
                params("java.lang.Class", "androidx.fragment.app.FragmentManager")
                returns(Type.Void)
            }
            argument(0) {
                opcode(Opcode.CONST_CLASS)
                type(sheet)
            }
        }.single().skipWhen { bool(true) }
    }
}
