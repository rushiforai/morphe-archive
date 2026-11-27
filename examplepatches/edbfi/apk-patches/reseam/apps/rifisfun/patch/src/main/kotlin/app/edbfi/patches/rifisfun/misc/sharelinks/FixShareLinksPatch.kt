// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.rifisfun.misc.sharelinks

import app.edbfi.extension.rifisfun.reading.bindings.ShareLinks
import app.edbfi.patches.rifisfun.RifPatchStrings
import app.edbfi.patches.rifisfun.misc.medialinks.openLink
import app.edbfi.patches.rifisfun.rifIsFun
import app.reseam.patch.Type
import app.reseam.patch.before
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.patch
import app.reseam.patch.points

private val dispatchIncoming = method("dispatch incoming Reddit link") {
    strings("reddit url type %s", "android.intent.action.VIEW", "thread_uri")
    params()
    returns(Type.Void)
    calls { owner("android.content.Intent"); name("getData") }
}

private val dispatchUserPath = method("dispatch incoming user path") {
    inClass(klass("com.andrewshu.android.reddit.intentfilter.UserPathDummyActivity"))
    name("onCreate")
    params("android.os.Bundle")
    returns(Type.Void)
}

private val startUserPath = dispatchUserPath.points("launch stock profile or post activity") {
    invokeVirtual { owner("android.content.Context"); name("startActivity"); params("android.content.Intent") }
}.single().captureArgumentAs("stockIntent", 1)

private val openBrowser = method("open native browser or launch its activity") {
    paramCount(9)
    param(0, "android.net.Uri")
    param(6, "androidx.fragment.app.FragmentManager")
    param(7, "android.content.Context")
    returns(Type.Void)
    strings("android.intent.action.VIEW", "thread_uri", "com.andrewshu.android.reddit.EXTRA_BROWSER_DISPLAY_URL")
}

private val launchBrowser = openBrowser.points("launch prepared browser intent") {
    invokeStatic { params("android.content.Intent", "android.content.Context"); returns(Type.Void) }
}.single().captureArgumentAs("browserIntent", 0)

val fixShareLinks = patch(RifPatchStrings.fixShareLinks) {
    description(RifPatchStrings.fixShareLinksDescription)
    compatibleWith(rifIsFun)
    execute {
        val types = openLink.parameterTypes
        check(dispatchIncoming.owner == "Lcom/andrewshu/android/reddit/MainActivity;")
        startUserPath.instruction
        launchBrowser.instruction
        manifest.edit {
            val activity = findByTag("activity").single {
                it["android:name"] == "com.andrewshu.android.reddit.intentfilter.UserPathDummyActivity"
            }
            val filter = activity.children.single { element ->
                element.children.any { it["android:pathPrefix"] == "/user/" }
            }
            filter.appendChild(createElement("data").apply { this["android:host"] = "np.reddit.com" })
        }
        ShareLinks.resumeInApp.implement {
            call(openLink, param(0), param(1), param(2).cast(types[2]), param(3), param(4), param(5),
                param(6).cast(types[6]), param(7).cast(types[7]), param(8), param(9).cast(types[9]))
            returnVoid()
        }
        openLink.before {
            whenTrue(ShareLinks.resolveInApp(param(0), param(1), param(2), param(3), param(4),
                param(5), param(6), param(7), param(8), param(9))) { returnVoid() }
        }
        startUserPath.before {
            // Leave the trampoline alive until it has launched the resolved or original target.
            whenTrue(ShareLinks.resolveUserPath(thisObject, capture("stockIntent"))) { returnVoid() }
        }
        launchBrowser.before {
            ShareLinks.markStockBrowserIntent(capture("browserIntent"))
        }
        dispatchIncoming.before {
            whenTrue(ShareLinks.resolveIncoming(thisObject)) { returnVoid() }
        }
    }
}
