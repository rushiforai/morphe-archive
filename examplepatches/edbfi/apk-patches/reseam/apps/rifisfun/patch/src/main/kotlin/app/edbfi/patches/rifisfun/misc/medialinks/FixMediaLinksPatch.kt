// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.misc.medialinks

import app.edbfi.extension.rifisfun.reading.bindings.MediaLinks
import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.Type
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points
import app.reseam.patch.redirectTo

internal val openLink = method("open in-app link") {
    flags(AccessFlags.STATIC)
    paramCount(10)
    param(0, Type.String)
    param(1, Type.String)
    param(3, Type.String)
    param(4, Type.String)
    param(5, Type.Boolean)
    param(6, "com.andrewshu.android.reddit.ads.WhitelistStatus")
    param(7, "androidx.fragment.app.FragmentManager")
    param(8, "android.content.Context")
    returns(Type.Void)
}

private val parseLink = openLink.points("parse in-app link") {
    invokeStatic { owner("android.net.Uri"); name("parse"); params(Type.String) }
}.single()

val fixMediaLinks = patch(RifPatchStrings.fixMediaLinks) {
    description(RifPatchStrings.fixMediaLinksDescription)
    compatibleWith(rifIsFun)
    execute {
        parseLink.redirectTo(MediaLinks.parseLink)
    }
}
