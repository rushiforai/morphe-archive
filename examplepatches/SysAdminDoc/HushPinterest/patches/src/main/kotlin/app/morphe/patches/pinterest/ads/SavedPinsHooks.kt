/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.requireStub
import app.morphe.patches.pinterest.misc.extension.writeStub
import app.morphe.patches.pinterest.ui.calls
import app.morphe.patches.pinterest.ui.fields
import app.morphe.patches.pinterest.ui.instructions
import app.morphe.patches.pinterest.ui.methodsWithString
import app.morphe.patches.pinterest.ui.mutable
import app.morphe.patches.pinterest.ui.one
import app.morphe.patches.pinterest.ui.parameters
import app.morphe.patches.pinterest.ui.strings
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val SAVED_PINS = "$EXTENSION_PACKAGE/ads/SavedPins;"
private const val HOME_MODEL = "Lcom/pinterest/feature/home/model/"
private const val DYNAMIC_FEED = "Lcom/pinterest/legacy/feeds/DynamicFeed;"
private const val HOME_POST_TEST = "android_hf_api_request_get_to_post"
private const val COMPRESSED_FIELDS = "compressed_fields"
private const val HOME_FIELD_SET = "DYNAMIC_GRID_FEED_WITH_BOARD_FIELDS"

/** Where Home's request has just read its field list, and the register the list is in. */
internal class HomeFields(val request: Method, val after: Int, val register: Int)

/**
 * Home's request names an enum of field sets and asks one static method for the list that set spells
 * out, once, before it picks how to send it. Null when the build has no such request. Throws when it
 * has one this can't read.
 */
internal fun BytecodePatchContext.homeFieldsOrNull(): HomeFields? {
    val requests = methodsWithString(HOME_POST_TEST).filter {
        it.definingClass.startsWith(HOME_MODEL) && COMPRESSED_FIELDS in it.strings()
    }
    if (requests.isEmpty()) return null
    val request = requests.one("Home's request")
    val set = request.fields().firstOrNull { it.name == HOME_FIELD_SET }?.type
        ?: throw PatchException("Home's request doesn't name $HOME_FIELD_SET")
    val body = request.instructions()
    val read = body.withIndex().filter { (_, instruction) ->
        val called = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        instruction.opcode == Opcode.INVOKE_STATIC && called?.returnType == "Ljava/lang/String;" && called.parameters() == listOf(set)
    }.one("Home's field list").index
    val result = body.getOrNull(read + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT } as? OneRegisterInstruction
        ?: throw PatchException("Home's field list isn't kept where it's read")
    return HomeFields(request, read + 2, result.registerA)
}

/** Both Filter feed and Download pins want this, and it goes in once either way. */
internal fun BytecodePatchContext.installHomeFields(fields: HomeFields) = with(fields) {
    val method = mutable(request)
    if (method.calls().any { it.definingClass == SAVED_PINS && it.name == "homeFields" }) return@with
    method.addInstructions(after, """
        invoke-static/range { v$register .. v$register }, $SAVED_PINS->homeFields(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v$register
    """)
}

/** Where Home's callback has a page in hand as the feed's own type, and how to read the page's items. */
internal class HomePage(val callback: Method, val after: Int, val register: Int, val items: Method)

/** Null when the build has no such callback. Throws when it has one this can't read. */
internal fun BytecodePatchContext.homePageOrNull(): HomePage? {
    // A logging callback casts the page too, then drops it. The one that matters hands it back.
    fun casts(method: Method): List<IndexedValue<Instruction>> {
        val body = method.instructions()
        val returned = body.filter { it.opcode == Opcode.RETURN_OBJECT }.map { (it as OneRegisterInstruction).registerA }
        return body.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.CHECK_CAST && (instruction as ReferenceInstruction).reference.toString() == DYNAMIC_FEED &&
                (instruction as OneRegisterInstruction).registerA in returned
        }
    }
    val callbacks = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(HOME_MODEL)) owner.methods.filterTo(callbacks) { it.name == "invoke" && casts(it).isNotEmpty() }
    }
    if (callbacks.isEmpty()) return null
    val callback = callbacks.one("Home's page callback")
    val cast = casts(callback).one("Home's page in its callback")
    val page = classDefByOrNull(DYNAMIC_FEED) ?: throw PatchException("Home's page class isn't in the app")
    if (!AccessFlags.PUBLIC.isSet(page.accessFlags)) throw PatchException("Home's page class is private")
    val items = page.methods.filter { method ->
        method.returnType == "Ljava/util/List;" && method.parameterTypes.isEmpty() &&
            AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags)
    }.one("Home's page items")
    requireStub(SAVED_PINS, "pageItems")
    return HomePage(callback, cast.index + 1, (cast.value as OneRegisterInstruction).registerA, items)
}

internal fun BytecodePatchContext.installHomePage(page: HomePage) = with(page) {
    writeStub(SAVED_PINS, "pageItems", 2, """
        check-cast p0, $DYNAMIC_FEED
        invoke-virtual { p0 }, $items
        move-result-object v0
        return-object v0
    """)
    mutable(callback).addInstructions(after, "invoke-static/range { v$register .. v$register }, $SAVED_PINS->homePage(Ljava/lang/Object;)V")
}
