// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.ultra

import app.reseam.patch.PatchRuntime
import app.reseam.patch.Type
import app.reseam.patch.after
import app.reseam.patch.alwaysReturn
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.klass
import app.reseam.patch.methods
import app.reseam.patch.points
import app.reseam.patch.replace

private const val FUNCTIONS = "com.google.firebase.functions.FirebaseFunctions"
private const val CALLABLE = "com.google.firebase.functions.HttpsCallableReference"
private const val CALLABLE_RESULT = "com.google.firebase.functions.HttpsCallableResult"
private const val MENU_ITEM = "android.view.MenuItem"

private fun cloudRequest(operation: String, vararg anchors: String) =
    methods("Call Sync's $operation cloud function") {
        strings(operation, "purchase_token", *anchors)
        returns(Type.Void)
        calls {
            owner(FUNCTIONS)
            params(Type.String)
            returns(CALLABLE)
        }
    }.single()

internal fun PatchRuntime.resolveUserAnnotationEdits(): () -> Unit {
    val localWrites = listOf(
        "addTagWithDetails" to "Skipped adding tag remotely",
        "removeTag" to "Skipped removing tag remotely",
        "addPaintWithDetails" to "Skipped adding paint remotely",
        "removePaint" to "Skipped removing paint remotely",
    ).map { (operation, skipped) ->
        val update = cloudRequest(operation, skipped)
        val save = update.points("Save locally before $operation") {
            invokeStatic {
                owner(update.owner)
                params(Type.String, "java.util.Map")
                returns(Type.Void)
            }
        }.single()
        val firebase = update.points("Get Firebase Functions for $operation") {
            invokeStatic {
                owner(FUNCTIONS)
                params()
                returns(FUNCTIONS)
            }
        }.single()
        check(save.index < firebase.index) { "Expected the local write before $operation" }
        save
    }

    val batchTags = cloudRequest("addTagBatch", "Importing local, this may take a minute...")
    batchTags.method
    val tagMenu = methods("Build the tag management overflow menu") {
        strings("Clear all", "Force refresh", "Import local (", "user_tags")
        params("android.view.View")
        returns(Type.Void)
    }.single()
    val importLabel = tagMenu.points("Label the cloud tag import action") { string("Import local (") }.single()
    val visibility = tagMenu.points("Set the visibility of a cloud tag menu item") {
        invokeInterface {
            owner(MENU_ITEM)
            name("setVisible")
            params(Type.Boolean)
            returns(MENU_ITEM)
        }
    }.all
    check(visibility.size == 2 && visibility.count { it.index > importLabel.index } == 1) {
        "Expected one visibility check each for tag refresh and import"
    }
    val importVisibility = visibility.single { it.index > importLabel.index }.captureArgumentAs("visible", 1)
    importVisibility.index

    val jobs = listOf("Paints", "Tags").map { annotations ->
        val fetch = cloudRequest("get$annotations")
        val callback = fetch.parameterTypes.single()
        val worker = klass(fetch.owner)
        val onFinished = methods("Handle the $annotations sync result") {
            inClass(worker)
            params(callback, CALLABLE_RESULT)
            returns(Type.Void)
            calls {
                owner(callback)
                name("onFinished")
                params()
                returns(Type.Void)
            }
        }.single().points("Notify the $annotations callback on completion") {
            invokeInterface {
                owner(callback)
                name("onFinished")
                params()
                returns(Type.Void)
            }
        }.single().callee()
        onFinished.method
        fetch to onFinished
    }

    val menus = listOf("Paint", "Tag").map { annotation ->
        val sheet = klass("$annotation management sheet") {
            sourceFile("UltraManage${annotation}SelectionBottomSheet.java")
            strings("Clear all", "Force refresh", "Import local (")
        }
        val dispatch = methods("Handle $annotation management overflow actions") {
            inClass(sheet)
            strings("TODO", "Refreshing")
            params(MENU_ITEM, MENU_ITEM, MENU_ITEM, "java.util.HashSet", MENU_ITEM)
            returns(Type.Boolean)
        }.single()
        val clearAll = dispatch.points("Start the retired $annotation bulk clear") {
            invokeStatic {
                params()
                returns(Type.Boolean)
            }
        }.single()
        val refresh = dispatch.points("Start the retired $annotation refresh") { string("Refreshing") }.single()
        val toast = dispatch.points("Display the stock bulk clear placeholder") {
            invokeStatic {
                params(Type.String)
                returns(Type.Void)
            }
            argument(0) { string("TODO") }
        }.single().callee()
        toast.method
        check(clearAll.index < refresh.index) { "Unexpected $annotation management dispatch order" }

        val clear = cloudRequest("clear${annotation}s")
        val clearDialog = klass(clear.owner)
        val dismiss = methods("Handle failed $annotation bulk clear") {
            inClass(clearDialog)
            strings("Error clearing user ${annotation.lowercase()}s")
            flags(AccessFlags.PRIVATE)
            params()
            returns(Type.Void)
        }.single().points("Dismiss the bulk clear progress sheet") {
            invokeVirtual {
                owner("com.google.android.material.bottomsheet.BottomSheetDialogFragment")
                params()
                returns(Type.Void)
            }
        }.single().callee()
        dismiss.method

        val apply: () -> Unit = {
            clearAll.before {
                call(toast, string("TODO"))
                returnTrue()
            }
            refresh.before { returnTrue() }
            // A saved confirmation can still open the old progress dialog after an update.
            clear.replace {
                thisObject.call(dismiss)
                call(toast, string("TODO"))
                returnVoid()
            }
        }
        apply
    }

    return {
        localWrites.forEach { save -> save.after { returnVoid() } }
        batchTags.alwaysReturn()
        importVisibility.before { capture("visible").assign(bool(false)) }
        jobs.forEach { (fetch, onFinished) ->
            fetch.replace {
                param(0).call(onFinished)
                returnVoid()
            }
        }
        menus.forEach { it() }
    }
}
