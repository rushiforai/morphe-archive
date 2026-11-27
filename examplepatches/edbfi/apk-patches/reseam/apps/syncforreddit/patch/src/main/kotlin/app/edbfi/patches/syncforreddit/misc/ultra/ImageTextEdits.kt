// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.ultra

import app.edbfi.extension.syncforreddit.imagetext.bindings.ImageTextWork
import app.reseam.patch.ClassTarget
import app.reseam.patch.CodeScope
import app.reseam.patch.PatchRuntime
import app.reseam.patch.PointTarget
import app.reseam.patch.Type
import app.reseam.patch.ValueRef
import app.reseam.patch.addMethod
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.Opcode
import app.reseam.patch.field
import app.reseam.patch.fieldOfType
import app.reseam.patch.klass
import app.reseam.patch.method
import app.reseam.patch.methods
import app.reseam.patch.points
import app.reseam.patch.replace
import app.reseam.patch.types.FieldRef
import app.reseam.patch.types.NewField

private const val VIEW = "android.view.View"
private const val CONTEXT = "android.content.Context"
private const val ACTIVITY = "android.app.Activity"
private const val FRAGMENT = "androidx.fragment.app.Fragment"
private const val FRAGMENT_ACTIVITY = "androidx.fragment.app.FragmentActivity"
private const val BITMAP = "android.graphics.Bitmap"
private const val WEAK_REFERENCE = "Ljava/lang/ref/WeakReference;"
private const val ORIGINAL_VIEW = "edbfiOriginalView"
private const val START_REQUEST = "edbfiStartImageTextRequest"
private const val WORK_TAG = "edbfi_image_text_work"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val PLAY_SERVICES = "com.google.android.gms.common.GoogleApiAvailability"
private const val ML_KIT_EXCEPTION = "com.google.mlkit.common.MlKitException"
private const val APPLICATION = "com.laurencedawson.reddit_sync.RedditApplication"
private const val ERROR_EXTRACTING_TEXT = "Error extracting text"
private const val SERVICE_INVALID = 9
private const val SERVICE_UPDATING = 18
private const val ML_KIT_UNAVAILABLE = 14
private const val LEGACY_MODULE_LOAD_ERROR = "Failed to load deprecated vision dynamite module."

// Sync ships both the optional and legacy Latin recognizers.
private val pendingModelMessages = listOf(
    "Waiting for the text optional module to be downloaded. Please wait.",
    "Waiting for the text recognition module to be downloaded. Please wait.",
)

private val viewer = klass("com.laurencedawson.reddit_sync.ui.fragments.ImageViewerFragment")
private val resultSheet = klass("Image text result sheet") {
    strings("Extracted text", "Copy text")
}
private val playServices = klass(PLAY_SERVICES)

private data class CallbackView(val target: ClassTarget, val initialized: PointTarget, val field: FieldRef)

internal fun PatchRuntime.resolveImageTextEdits(): () -> Unit {
    val rowId = checkNotNull(resources.id("id", "image_options_extract_text")) { "Missing Extract text row ID" }
    val initializeViewer = viewer.methods("Initialize the image viewer") {
        params(VIEW, "android.os.Bundle")
        returns(Type.Void)
        literals(rowId.toLong())
    }.single()
    val findRow = initializeViewer.points("Find the Extract text row") {
        invokeVirtual {
            owner(VIEW)
            name("findViewById")
            params(Type.Int)
            returns(VIEW)
        }
        argument(1) { literal(rowId.toLong()) }
        then { opcode(Opcode.MOVE_RESULT_OBJECT) }
    }.single()
    val endViewerSetup = initializeViewer.points("Finish setting up the Extract text row") {
        invokeVirtual {
            owner(VIEW)
            name("setVisibility")
            params(Type.Int)
            returns(Type.Void)
        }
        then { opcode(Opcode.RETURN_VOID) }
    }.single()
    val setRowVisibility = endViewerSetup.previous { invokeVirtual { name("setVisibility") } }
    val extractTextRow = setRowVisibility.captureArgumentAs("extractTextRow", 0)
    check(extractTextRow.writer(0).index == findRow.index) { "Unexpected Extract text row visibility call" }

    val click = viewer.method("onExtractClicked") {
        params()
        returns(Type.Void)
    }
    val openResultSheet = click.points("Use Sync's native result sheet") {
        opcode(Opcode.CONST_CLASS)
        type(resultSheet.descriptor)
    }.single()
    check(openResultSheet.index == 0) { "Unexpected OCR click handler" }

    val loadBitmap = resultSheet.methods("Request the image for text recognition") {
        flags(AccessFlags.PUBLIC)
        params()
        returns(Type.Void)
        calls {
            owner("android.widget.TextView")
            name("setTextIsSelectable")
            params(Type.Boolean)
        }
    }.single()
    val getView = loadBitmap.points("Read the result sheet's view") {
        invokeVirtual {
            owner(FRAGMENT)
            params()
            returns(VIEW)
        }
    }.single().callee()
    getView.points("Return the nullable fragment view") {
        field {
            owner(FRAGMENT)
            type(VIEW)
        }
        opcode(Opcode.IGET_OBJECT)
        then { opcode(Opcode.RETURN_OBJECT) }
    }.single().index
    val getActivity = klass(FRAGMENT).methods("Read the result sheet's host activity") {
        params()
        returns(FRAGMENT_ACTIVITY)
        calls {
            params()
            returns(ACTIVITY)
        }
    }.single()
    check(resultSheet.classDef.method(START_REQUEST, "()V") == null) { "Already using the OCR request method" }
    check(resources.id("id", WORK_TAG) == null) { "Already using the OCR work tag" }
    val bitmapTargetConstructor = loadBitmap.points("Create the Glide bitmap target") {
        invokeDirect {
            name("<init>")
            params(resultSheet.descriptor)
            returns(Type.Void)
        }
    }.single().callee()
    val bitmapTarget = klass(bitmapTargetConstructor.owner)
    val bitmapTargetSheet = bitmapTarget.fieldOfType(resultSheet.descriptor)
    check(bitmapTargetSheet.owner == bitmapTarget.descriptor) { "Expected the result sheet on the Glide bitmap target" }
    val bitmapSuccess = bitmapTarget.methods("Pass the loaded bitmap to the result sheet") {
        returns(Type.Void)
        calls {
            owner(resultSheet.descriptor)
            params(resultSheet.descriptor, BITMAP)
            returns(Type.Void)
        }
    }.single()
    // Glide's onLoadFailed(Drawable) is renamed to f in this APK's BaseTarget.
    val glideBaseTarget = klass("Glide BaseTarget") { sourceFile("BaseTarget.java") }
    val glideLoadFailed = glideBaseTarget.method("f") {
        params(DRAWABLE)
        returns(Type.Void)
    }
    check(bitmapTarget.classDef.superclassChain.any { it.descriptor == glideLoadFailed.owner }) {
        "Expected the OCR bitmap target to extend ${glideLoadFailed.owner}"
    }
    check(bitmapTarget.classDef.method(glideLoadFailed.name, glideLoadFailed.proto) == null) {
        "OCR bitmap target already overrides ${glideLoadFailed.name}${glideLoadFailed.proto}"
    }

    val recognitionFailure = method("Handle an ML Kit text recognition error") {
        strings(ERROR_EXTRACTING_TEXT)
        params("java.lang.Exception")
        returns(Type.Void)
    }
    val failureSheet = recognitionFailure.field("Recognition callback's result sheet") {
        type(resultSheet.descriptor)
    }
    check(failureSheet.owner == recognitionFailure.owner) { "Expected the result sheet on the OCR failure callback" }
    val recognitionSuccess = method("Handle the text recognition result") {
        strings("No text found")
        params("com.google.mlkit.vision.text.Text")
        returns(Type.Void)
    }
    val successSheet = recognitionSuccess.field("Result callback's result sheet") {
        type(resultSheet.descriptor)
    }
    check(successSheet.owner == recognitionSuccess.owner) { "Expected the result sheet on the OCR result callback" }
    val dismissWithError = recognitionFailure.points("Report the OCR error and dismiss the sheet") {
        invokeStatic {
            owner(resultSheet.descriptor)
            params(resultSheet.descriptor, Type.String)
            returns(Type.Void)
        }
        argument(1) { string(ERROR_EXTRACTING_TEXT) }
    }.single().callee()
    check(dismissWithError.owner == resultSheet.descriptor) {
        "Expected the OCR error handler on ${resultSheet.descriptor}, found ${dismissWithError.owner}"
    }
    val getPlayServices = playServices.methods("Get the Google Play services availability checker") {
        flags(AccessFlags.STATIC)
        params()
        returns(PLAY_SERVICES)
    }.single()
    val availability = playServices.methods("Check Google Play services availability") {
        flags(AccessFlags.PUBLIC)
        params(CONTEXT)
        returns(Type.Int)
    }.single()
    val appContext = klass(APPLICATION).methods("Get Sync's application context") {
        flags(AccessFlags.STATIC)
        params()
        returns(CONTEXT)
    }.single()
    val errorCode = klass(ML_KIT_EXCEPTION).methods("Read the ML Kit error code") {
        flags(AccessFlags.PUBLIC)
        params()
        returns(Type.Int)
    }.single()
    listOf(getView, getActivity, bitmapSuccess, getPlayServices, availability, appContext, errorCode).forEach { it.method }
    val serviceMessages = mapOf(
        1 to "common_google_play_services_install_title",
        2 to "common_google_play_services_update_title",
        3 to "common_google_play_services_enable_title",
    ).mapValues { (_, name) -> checkNotNull(resources.id("string", name)) { "Missing $name" }.toInt() }

    fun resolveCallbackView(target: ClassTarget): CallbackView {
        check(target.classDef.field(ORIGINAL_VIEW) == null) { "Already tracking the callback's original view" }
        val initialized = target.method("<init>") {
            params(resultSheet.descriptor)
            returns(Type.Void)
        }.points("Finish constructing the OCR callback") { opcode(Opcode.RETURN_VOID) }.single()
        initialized.index
        return CallbackView(target, initialized, FieldRef(target.descriptor, ORIGINAL_VIEW, WEAK_REFERENCE))
    }
    val bitmapCallback = resolveCallbackView(bitmapTarget)
    val failureCallback = resolveCallbackView(klass(recognitionFailure.owner))
    val successCallback = resolveCallbackView(klass(recognitionSuccess.owner))

    fun CodeScope.requireLiveActivity(sheet: ValueRef) {
        val activity = sheet.call(getActivity)
        whenNull(activity) { returnVoid() }
        whenTrue(activity.callVirtual(ACTIVITY, "isFinishing", "()Z")) { returnVoid() }
        whenTrue(activity.callVirtual(ACTIVITY, "isDestroyed", "()Z")) { returnVoid() }
    }

    fun CodeScope.requireOriginalView(sheet: ValueRef, originalView: FieldRef, workTagId: Int) {
        val view = sheet.call(getView)
        whenNull(view) { returnVoid() }
        val original = thisObject.field(originalView).callVirtual(WEAK_REFERENCE, "get", "()Ljava/lang/Object;")
        whenNotEqual(view, original) { returnVoid() }
        whenFalse(ImageTextWork.isActive(view, int(workTagId))) { returnVoid() }
        requireLiveActivity(sheet)
    }

    return {
        val workTagId = checkNotNull(resources.addId(WORK_TAG)) { "Could not add the OCR work tag" }.toInt()
        // Keep Sync's request and text setup together and run them after the result view attaches.
        loadBitmap.method.clone(START_REQUEST)
        val startBitmap = resultSheet.method(START_REQUEST) {
            params()
            returns(Type.Void)
        }
        ImageTextWork.startRequest.implement {
            val sheet = param(0).cast(resultSheet.descriptor)
            whenNotEqual(sheet.call(getView), param(1)) { returnVoid() }
            requireLiveActivity(sheet)
            sheet.call(startBitmap)
            returnVoid()
        }
        loadBitmap.replace {
            ImageTextWork.schedule(thisObject.call(getView), thisObject, int(workTagId))
            returnVoid()
        }

        // The last call sets this row only. Keep Sync's click binding and result sheet.
        extractTextRow.before {
            capture("extractTextRow").callVirtual(VIEW, "setVisibility", "(I)V", int(0))
            returnVoid()
        }

        // The application-scoped Glide request can outlive this view, including across recreation.
        listOf(bitmapCallback, failureCallback, successCallback).forEach { (target, initialized, originalView) ->
            target.classDef.addField(NewField(ORIGINAL_VIEW, WEAK_REFERENCE, AccessFlags.PRIVATE.toUInt(), null))
            initialized.before {
                thisObject.set(originalView, newInstance(WEAK_REFERENCE, "(Ljava/lang/Object;)V", param(0).call(getView)))
            }
        }
        bitmapSuccess.before { requireOriginalView(thisObject.field(bitmapTargetSheet), bitmapCallback.field, workTagId) }
        recognitionSuccess.before { requireOriginalView(thisObject.field(successSheet), successCallback.field, workTagId) }

        recognitionFailure.before {
            val sheet = thisObject.field(failureSheet)
            requireOriginalView(sheet, failureCallback.field, workTagId)
            val context = call(appContext)
            val status = call(getPlayServices).call(availability, context)
            for ((serviceStatus, messageId) in serviceMessages) {
                whenEqual(status, int(serviceStatus)) {
                    val message = context.callVirtual(CONTEXT, "getString", "(I)Ljava/lang/String;", int(messageId))
                    call(dismissWithError, sheet, message)
                    returnVoid()
                }
            }
            // The availability checker also reports SERVICE_INVALID when Play Store is missing.
            whenEqual(status, int(SERVICE_INVALID)) {
                call(dismissWithError, sheet, string("Google Play services is unavailable"))
                returnVoid()
            }
            whenEqual(status, int(SERVICE_UPDATING)) {
                call(dismissWithError, sheet, string("Google Play services is updating. Try again when it finishes."))
                returnVoid()
            }
            val failure = param(0)
            whenInstanceOf(failure, ML_KIT_EXCEPTION) {
                val message = failure.callVirtual("java.lang.Throwable", "getMessage", "()Ljava/lang/String;")
                val loadFailed = string(LEGACY_MODULE_LOAD_ERROR)
                    .callVirtual("java.lang.String", "equals", "(Ljava/lang/Object;)Z", message)
                whenTrue(loadFailed) {
                    call(dismissWithError, sheet, string("The text recognition module is unavailable"))
                    returnVoid()
                }
                whenEqual(failure.cast(ML_KIT_EXCEPTION).call(errorCode), int(ML_KIT_UNAVAILABLE)) {
                    for (pending in pendingModelMessages) {
                        val isPending = string(pending)
                            .callVirtual("java.lang.String", "equals", "(Ljava/lang/Object;)Z", message)
                        whenTrue(isPending) {
                            call(dismissWithError, sheet, message)
                            returnVoid()
                        }
                    }
                    call(dismissWithError, sheet, string("Text recognition is temporarily unavailable. Try again later."))
                    returnVoid()
                }
            }
        }

        bitmapTarget.addMethod(glideLoadFailed.name, glideLoadFailed.proto, AccessFlags.PUBLIC) {
            val sheet = thisObject.field(bitmapTargetSheet)
            requireOriginalView(sheet, bitmapCallback.field, workTagId)
            call(dismissWithError, sheet, string(ERROR_EXTRACTING_TEXT))
            returnVoid()
        }
    }
}
