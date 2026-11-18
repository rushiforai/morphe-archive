// SPDX-License-Identifier: AGPL-3.0-or-later
package app.edbfi.patches.syncforreddit.misc.volley

import app.edbfi.patches.shared.uniqueMethod
import app.revanced.patcher.definingClass
import app.revanced.patcher.name
import app.revanced.patcher.parameterTypes
import app.revanced.patcher.patch.BytecodePatchContext
import app.revanced.patcher.returnType

/** Volley, which Sync bundles with its class names kept, sends every API, Redgifs and Imgur request from here. */
internal fun BytecodePatchContext.performRequestMethod() = uniqueMethod("Volley's BasicNetwork.performRequest") {
    definingClass("Lcom/android/volley/toolbox/BasicNetwork;")
    name("performRequest")
    returnType("Lcom/android/volley/NetworkResponse;")
    parameterTypes("Lcom/android/volley/Request;")
}
