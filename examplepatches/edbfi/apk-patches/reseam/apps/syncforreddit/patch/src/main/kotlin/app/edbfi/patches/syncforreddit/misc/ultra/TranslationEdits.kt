// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.ultra

import app.edbfi.extension.syncforreddit.translation.bindings.LocalTranslation
import app.reseam.patch.MethodTarget
import app.reseam.patch.PatchRuntime
import app.reseam.patch.PointTarget
import app.reseam.patch.Type
import app.reseam.patch.XmlDocument
import app.reseam.patch.addMethod
import app.reseam.patch.before
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.Opcode
import app.reseam.patch.fieldOfType
import app.reseam.patch.klass
import app.reseam.patch.methods
import app.reseam.patch.points
import app.reseam.patch.redirectTo
import app.reseam.patch.replace
import app.reseam.patch.skipWhen

private const val VIEW = "android.view.View"
private const val FRAGMENT = "androidx.fragment.app.Fragment"
private const val CONTENT_VALUES_ARRAY = "[Landroid/content/ContentValues;"
private const val ATTRIBUTION = "Translated by Google"
private const val STOCK_BADGE = "[Translated by Google](translate)"
private const val SAVE_TRANSLATION = "edbfiSaveTranslation"
private const val ADVANCE_TRANSLATION = "edbfiAdvanceTranslation"
private const val CHOOSE_SOURCE = "edbfiChooseTranslationSource"
private const val START_BULK_WORK = "edbfiStartBulkWork"
private const val CURSOR_LOADER = "android.content.CursorLoader"
private const val CURSOR = "android.database.Cursor"
private const val ROWS = "java.util.ArrayList"

private val rollout = methods("Read Sync's translation rollout flag") {
    strings("RemoteConfigHelper", TRANSLATE)
    flags(AccessFlags.PUBLIC or AccessFlags.STATIC)
    params()
    returns(Type.Boolean)
}.single()

private val commentActions = methods("Read the Translate all action preference") {
    strings("Unknown action: ")
    flags(AccessFlags.PUBLIC or AccessFlags.STATIC)
    params(Type.Int)
    returns(Type.Boolean)
    accesses { name("comment_action_translate") }
}.single()

private data class InstructionRange(val start: PointTarget, val count: Int) {
    fun remove() = start.method.method.removeInstructions(start.index, count)
}

private fun resolveTranslationGates(): List<InstructionRange> {
    val options = methods("Build the single-comment translation option") {
        strings("Translate comment with Google", "Read aloud")
        params()
        returns(Type.Void)
    }.single()
    val postOptions = klass(
        "com.laurencedawson.reddit_sync.ui.fragment_dialogs.bottom.PostMoreBottomSheetFragment"
    ).methods("Bind the post options with a translation option") {
        params(VIEW, "android.os.Bundle")
        returns(Type.Void)
        accesses { name("mTranslate") }
        calls(rollout)
    }.single()
    val bulkGate = commentActions.points("Check Translate all after reading its visibility preference") {
        field { name("comment_action_translate") }
        opcode(Opcode.IGET_BOOLEAN)
        then { opcode(Opcode.IF_EQZ) }
        then {
            invokeStatic {
                params()
                returns(Type.Boolean)
            }
        }
    }.single()
    // Follow the stock predicate from the Translate all case without affecting its other callers.
    val entitlement = bulkGate.callee()
    val bulkEnd = bulkGate.next {
        opcode(Opcode.MOVE_RESULT)
        then { opcode(Opcode.IF_EQZ) }
    }
    check(bulkEnd.index - bulkGate.index == 2) { "Unexpected Translate all entitlement check" }

    return listOf(options, postOptions).map { menu ->
        val end = menu.points("The translation option's adjacent entitlement and rollout checks") {
            calls(entitlement)
            then { opcode(Opcode.MOVE_RESULT) }
            then { opcode(Opcode.IF_EQZ) }
            then { calls(rollout) }
            then { opcode(Opcode.MOVE_RESULT) }
            then { opcode(Opcode.IF_EQZ) }
        }.single()
        val start = end.previous { calls(entitlement) }
        check(end.index - start.index == 5) { "Unexpected translation menu check" }
        InstructionRange(start, 6)
    } + InstructionRange(bulkGate, 3)
}

private fun resolveTranslationSettingsCode(): List<InstructionRange> {
    val key = ultraSettings.points("Find the stock translation information key") { string(TRANSLATE) }.single()
    val listener = ultraSettings.points("Register the external translation information link") {
        string(TRANSLATE)
        then {
            invokeVirtual {
                params("java.lang.CharSequence")
                returns(PREFERENCE)
            }
            argument(1) { string(TRANSLATE) }
        }
        then { opcode(Opcode.MOVE_RESULT_OBJECT) }
        then { opcode(Opcode.NEW_INSTANCE) }
        then {
            invokeDirect {
                name("<init>")
                params(ultraSettings.owner)
                returns(Type.Void)
            }
        }
        then {
            invokeVirtual {
                owner(PREFERENCE)
                params(CLICK_LISTENER)
                returns(Type.Void)
            }
        }
    }.single()
    val rolloutCall = ultraSettings.points("Set the stock translation information visibility") {
        invokeVirtual {
            params("java.lang.CharSequence")
            returns(PREFERENCE)
        }
        argument(1) { string(TRANSLATE) }
        then { opcode(Opcode.MOVE_RESULT_OBJECT) }
        then { calls(rollout) }
        then { opcode(Opcode.MOVE_RESULT) }
        then {
            invokeVirtual {
                owner(PREFERENCE)
                params(Type.Boolean)
                returns(Type.Void)
            }
        }
    }.single()
    val visibility = rolloutCall.previous {
        invokeVirtual {
            params("java.lang.CharSequence")
            returns(PREFERENCE)
        }
    }
    check(listener.index - key.index == 5 && rolloutCall.index - visibility.index == 4) {
        "Unexpected stock translation settings code"
    }
    return listOf(InstructionRange(visibility, 5), InstructionRange(key, 6))
}

internal fun XmlDocument.resolveTranslationSettingsLayoutEdit(): () -> Unit {
    val perks = requirePreference(ULTRA_XML, GUEST_SECTION, "PreferenceCategory")
    val row = requirePreference(ULTRA_XML, TRANSLATE, SYNC_PREFERENCE)
    check(perks.parent?.tag == "PreferenceScreen" && row.parent?.get(KEY) == GUEST_SECTION &&
        row.children.isEmpty() && row["android:title"] == "Translate text" &&
        row["android:summary"] == "Translate comments & selftext (powered by Google)") {
        "Unexpected translation information row in $ULTRA_XML"
    }
    return {
        row["android:summary"] = "Translate comments and text posts to English on this device."
        row["android:selectable"] = "false"
        root.insertBefore(row, perks)
    }
}

private fun MethodTarget.identificationStart(): PointTarget {
    val input = points("Pass the prepared text to ML Kit language detection") {
        invokeStatic {
            owner(IDENTIFICATION)
            params()
            returns(IDENTIFIER)
        }
        then { opcode(Opcode.MOVE_RESULT_OBJECT) }
        then {
            invokeInterface {
                owner(IDENTIFIER)
                params(Type.String)
                returns(TASK)
            }
        }
    }.single().captureArgumentAs("text", 1)
    val start = input.previous { invokeStatic { owner(IDENTIFICATION); returns(IDENTIFIER) } }
    check(input.index - start.index == 2) { "Unexpected language detection start" }
    return start
}

internal fun PatchRuntime.resolveTranslationEdits(): () -> Unit {
    bytecode.requireTranslationApi()
    val removeGates = resolveTranslationGates()
    val removeSettingsCode = resolveTranslationSettingsCode()
    val single = klass("Single translation progress sheet") {
        strings("translate_post", "override_language", "Already translated")
    }
    val bulk = klass("Bulk translation progress sheet") {
        strings("Translation complete", "Translating pos: ", "No string")
    }
    val viewGetters = klass(FRAGMENT).methods("Find the fragment view getter") {
        params()
        returns(VIEW)
    }.all.filter { candidate ->
        candidate.points("Get the nullable fragment root view") {
            field { owner(FRAGMENT); type(VIEW) }
            opcode(Opcode.IGET_OBJECT)
            then { opcode(Opcode.RETURN_OBJECT) }
        }.all.size == 1
    }
    val currentView = checkNotNull(viewGetters.singleOrNull()) {
        "Expected one fragment view getter for translation, found ${viewGetters.size}"
    }
    val singleStart = single.methods("Prepare the comment or self-text for translation") {
        strings("No text to translate", "Already translated")
        params()
        returns(Type.Void)
    }.single()
    val bulkItem = bulk.methods("Prepare a discussion item for translation") {
        strings("Translating pos: ", "No string")
        params(Type.Int)
        returns(Type.Void)
    }.single()
    val singleAuto = singleStart.identificationStart()
    val bulkAuto = bulkItem.identificationStart()
    val skipBulk = bulkItem.points("Skip a discussion item without new text") { string("No string") }.single()
    skipBulk.index
    val singleManual = single.methods("Translate from a selected source language") {
        params(Type.String, Type.String)
        flags(AccessFlags.PRIVATE)
        returns(Type.Void)
        calls { owner(TRANSLATOR); returns(TASK) }
    }.single()
    val saveSingleBody = single.methods("Store the comment translation") {
        strings("body_raw", "body_processed")
        params(Type.String, Type.String)
    }.single()
    val saveSingleSelfText = single.methods("Store the self-text translation") {
        strings("selftext_raw", "selftext_processed")
        params(Type.String, Type.String)
    }.single()
    val saveSingle = single.methods("Store a single translation using the matching post type") {
        params(Type.String, Type.String)
        calls(saveSingleBody)
        calls(saveSingleSelfText)
    }.single()
    val saveBulk = bulk.methods("Stage a discussion translation using the matching post type") {
        strings("Translation complete: ")
        params(Type.Int, Type.String, Type.String)
    }.single()
    val advanceBulk = bulk.methods("Advance or complete the discussion translation") {
        strings("Translation complete", "ERROR: (")
        params(Type.Int, Type.String)
    }.single()
    val results = bulk.fieldOfType(CONTENT_VALUES_ARRAY)
    val bulkNotice = advanceBulk.points("Report completion of the discussion translation") {
        invokeStatic {
            params(Type.String)
            returns(Type.Void)
        }
        argument(0) { string("Translation complete") }
    }.single().captureArgumentAs("message", 0)
    val dismiss = advanceBulk.points("Dismiss Sync's translation sheet after completing work") {
        invokeVirtual {
            owner("com.google.android.material.bottomsheet.BottomSheetDialogFragment")
            params()
            returns(Type.Void)
        }
    }.single().callee()
    val isShowing = bulkItem.points("Check that Sync's translation sheet is showing") {
        invokeVirtual { params(); returns(Type.Boolean) }
    }.single().callee()
    val chooserCallback = methods("Open Sync's manual translation source picker") {
        strings("und", "Could not detect language")
        params(Type.String)
        returns(Type.Void)
    }.single()
    val callback = klass(chooserCallback.owner)
    val chooserConstructor = callback.methods("Bind the source picker to the single translation sheet") {
        name("<init>")
        params(single.descriptor, Type.String)
        returns(Type.Void)
    }.single()
    val obsoleteNotice = chooserCallback.points("Show the stock language-detection notice") {
        invokeStatic { params(Type.String); returns(Type.Void) }
        argument(0) { string("Could not detect language") }
    }.single()
    val priorTranslation = listOf(singleStart to 2, bulkItem to 1).flatMap { (worker, count) ->
        worker.points("Check whether the source already has a translation") {
            invokeStatic {
                owner("org.apache.commons.lang3.StringUtils")
                name("contains")
                params("java.lang.CharSequence", "java.lang.CharSequence")
                returns(Type.Boolean)
            }
            argument(1) { string(ATTRIBUTION) }
        }.all.also { check(it.size == count) { "Expected $count translation marker checks, found ${it.size}" } }
    }
    val attribution = listOf("comment" to saveSingleBody, "self-text" to saveSingleSelfText).map { (kind, save) ->
        methods("Format a $kind translation with an attribution badge") {
            calledBy(save)
            strings(STOCK_BADGE, "\n\n-----\n")
            flags(AccessFlags.PUBLIC or AccessFlags.STATIC)
            paramCount(3)
            param(1, Type.String)
            param(2, Type.String)
            returns(Type.String)
        }.single()
    }
    check(attribution.map { it.ref }.distinct().size == 2) { "Expected distinct comment and self-text formatters" }
    attribution.forEach { it.points("The remote badge markup") { string(STOCK_BADGE) }.single().index }

    val query = bulk.methods("Query the comments for discussion translation") {
        params()
        returns(Type.Void)
        calls { owner(CURSOR_LOADER); name("startLoading") }
    }.single()
    val registerLoader = query.points("Register the discussion cursor loader's callback") {
        invokeVirtual {
            owner(CURSOR_LOADER)
            name("registerListener")
            params(Type.Int, "android.content.Loader\$OnLoadCompleteListener")
            returns(Type.Void)
        }
    }.single().captureArgumentAs("loader", 0)
    val startLoader = query.points("Start the discussion cursor loader") {
        invokeVirtual { owner(CURSOR_LOADER); name("startLoading"); params(); returns(Type.Void) }
    }.single()
    check(startLoader.index == registerLoader.index + 1) { "Unexpected discussion cursor loader setup" }
    val constructor = registerLoader.previous {
        invokeDirect { name("<init>"); params(bulk.descriptor); returns(Type.Void) }
    }.callee()
    val loaderCallback = klass(constructor.owner)
    val loadComplete = loaderCallback.methods("Handle the queried discussion comments") {
        strings("Error translating all (no items found)")
        params("android.content.Loader", CURSOR)
        returns(Type.Void)
    }.single()
    val copyRow = loadComplete.points("Copy a discussion row from the cursor") {
        invokeStatic { params(CURSOR, Type.Int) }
    }.single()
    val appendRow = loadComplete.points("Append a copied discussion row to the list") {
        invokeVirtual { owner(ROWS); name("add"); params(Type.Object); returns(Type.Boolean) }
    }.single()
    check(appendRow.index == copyRow.index + 2) { "Unexpected discussion cursor row copy" }
    val readRow = copyRow.callee()
    val progressBar = loadComplete.points("Read the bulk translation progress bar") {
        invokeVirtual {
            params()
            returns("com.google.android.material.progressindicator.CircularProgressIndicator")
        }
    }.single().callee()
    val beginBulk = loadComplete.points("Start translating the copied discussion rows") {
        invokeStatic { owner(bulk.descriptor); params(bulk.descriptor, Type.Int); returns(Type.Void) }
    }.single().callee()
    val bulkRows = bulk.fieldOfType(ROWS)

    val singleSaveProto = "(Ljava/lang/String;Ljava/lang/String;)V"
    val bulkSaveProto = "(ILjava/lang/String;Ljava/lang/String;)V"
    val startBulkProto = "(Ljava/util/ArrayList;$CONTENT_VALUES_ARRAY)V"
    listOf(
        Triple(single, SAVE_TRANSLATION, singleSaveProto),
        Triple(single, CHOOSE_SOURCE, "()V"),
        Triple(bulk, SAVE_TRANSLATION, bulkSaveProto),
        Triple(bulk, ADVANCE_TRANSLATION, "(I)V"),
        Triple(bulk, START_BULK_WORK, startBulkProto),
    ).forEach { (sheet, name, proto) ->
        check(sheet.classDef.method(name, proto) == null) { "Already defined $name on the translation sheet" }
    }
    listOf(
        currentView, singleManual, saveSingle, saveBulk, advanceBulk, dismiss, isShowing,
        chooserCallback, chooserConstructor, readRow, progressBar, beginBulk,
    ).forEach { it.method }
    listOf(bulkNotice, obsoleteNotice, registerLoader).forEach { it.index }
    val progress = checkNotNull(bulk.classDef.superclass) { "Missing translation progress sheet superclass" }
    check(progress == single.classDef.superclass) { "Translation sheets no longer share a progress sheet" }

    return {
        removeGates.forEach { it.remove() }
        removeSettingsCode.forEach { it.remove() }
        priorTranslation.forEach { it.redirectTo(LocalTranslation.alreadyTranslated) }
        attribution.forEach { check(it.method.replaceAllStrings(STOCK_BADGE, ATTRIBUTION) == 1) }

        val writeSingle = single.addMethod(SAVE_TRANSLATION, singleSaveProto) {
            thisObject.call(saveSingle, param(0), param(1))
            returnVoid()
        }
        val writeBulk = bulk.addMethod(SAVE_TRANSLATION, bulkSaveProto) {
            thisObject.call(saveBulk, param(0), param(1), param(2))
            returnVoid()
        }
        val skipItem = bulk.addMethod(ADVANCE_TRANSLATION, "(I)V") {
            thisObject.call(advanceBulk, param(0), nullObject)
            returnVoid()
        }
        obsoleteNotice.skipWhen { bool(true) }
        val showPicker = single.addMethod(CHOOSE_SOURCE, "()V") {
            newInstance(chooserCallback.owner, "(${single.descriptor}Ljava/lang/String;)V", thisObject, string(""))
                .call(chooserCallback, string("und"))
            returnVoid()
        }
        val startBulk = bulk.addMethod(START_BULK_WORK, startBulkProto) {
            thisObject.set(bulkRows, param(0))
            thisObject.set(results, param(1))
            thisObject.call(progressBar).callVirtual(
                "android.widget.ProgressBar", "setMax", "(I)V", param(1).size(),
            )
            call(beginBulk, thisObject, int(0))
            returnVoid()
        }

        LocalTranslation.isCurrent.implement {
            val sheet = param(0).cast(progress)
            whenNotEqual(sheet.call(currentView), param(1)) { returnFalse() }
            returnValue(sheet.call(isShowing))
        }
        LocalTranslation.closeSheet.implement {
            param(0).cast(progress).call(dismiss)
            returnVoid()
        }
        LocalTranslation.chooseSource.implement {
            param(0).cast(single.descriptor).call(showPicker)
            returnVoid()
        }
        LocalTranslation.saveSingle.implement {
            param(0).cast(single.descriptor).call(writeSingle, param(1), param(2))
            returnVoid()
        }
        LocalTranslation.saveBulk.implement {
            param(0).cast(bulk.descriptor).call(writeBulk, param(1), param(2), param(3))
            returnVoid()
        }
        LocalTranslation.advanceBulk.implement {
            param(0).cast(bulk.descriptor).call(skipItem, param(1))
            returnVoid()
        }
        LocalTranslation.readBulkRow.implement {
            returnValue(call(readRow, param(0), param(1)))
        }
        LocalTranslation.startBulkWork.implement {
            param(0).cast(bulk.descriptor).call(startBulk, param(1), param(2))
            returnVoid()
        }

        singleAuto.before {
            LocalTranslation.single(thisObject.call(currentView), thisObject, capture("text"), nullObject)
            returnVoid()
        }
        singleManual.replace {
            LocalTranslation.single(thisObject.call(currentView), thisObject, param(0), param(1))
            returnVoid()
        }
        bulkAuto.before {
            LocalTranslation.bulk(thisObject.call(currentView), thisObject, param(0), capture("text"))
            returnVoid()
        }
        skipBulk.before {
            LocalTranslation.bulk(thisObject.call(currentView), thisObject, param(0), string(""))
            returnVoid()
        }
        bulkNotice.before {
            capture("message").assign(LocalTranslation.bulkMessage(thisObject.call(currentView), thisObject.field(results)))
        }

        registerLoader.before {
            LocalTranslation.queryBulk(thisObject.call(currentView), thisObject, capture("loader"))
            returnVoid()
        }
    }
}
