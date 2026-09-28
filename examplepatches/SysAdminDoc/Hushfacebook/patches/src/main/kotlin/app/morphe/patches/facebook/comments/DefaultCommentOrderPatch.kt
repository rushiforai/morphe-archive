/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.comments

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.patches.facebook.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.findMutableMethodOf

/**
 * Comment sheets ask for the order picked in Hushfacebook's settings where Facebook's servers
 * would choose, and a pick in a sheet's own menu stays for that post. See CommentOrderAnchors.kt
 * for how Facebook picks the order, and the extension's DefaultCommentOrder for when it keeps
 * Facebook's.
 *
 * Off in the default selection. Picked, its switch starts on and the order starts as Facebook's
 * own, so nothing changes until an order is chosen.
 */
@Suppress("unused")
val defaultCommentOrderPatch = bytecodePatch(
    name = "Default comment order",
    description = "Opens comments in the order you choose in Hushfacebook's settings, Most relevant, Newest or " +
        "All comments, instead of the one Facebook picks. An order you pick in a post's comments stays for that " +
        "post, and links to a comment still open on it.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    execute {
        val builders = classDefByStrings(ORDER_VARIABLE, StringComparisonType.EQUALS)
            .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
            .flatMap { owner -> owner.methods.mapNotNull { method -> requestFields(method)?.let { method to it } } }
        val (builder, fields) = builders.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one request builder taking FetchFeedbackParams that reads \"$ORDER_VARIABLE\", " +
                "\"$FEEDBACK_ID_VARIABLE\" and \"$FOCUSED_COMMENT_VARIABLE\" from its fields, found ${builders.size}",
        )
        val params = classDefByOrNull(FETCH_FEEDBACK_PARAMS)
            ?: throw PatchException("$PATCH: this build has no $FETCH_FEEDBACK_PARAMS")
        val constructors = params.methods.mapNotNull { method -> requestRegisters(method, fields)?.let { method to it } }
        val (constructor, registers) = constructors.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one constructor of $FETCH_FEEDBACK_PARAMS storing the fields ${builder.definingClass}->" +
                "${builder.name} reads from its own parameters, found ${constructors.size}",
        )
        mutableClassDefBy(FETCH_FEEDBACK_PARAMS).findMutableMethodOf(constructor).askForTheOrder(registers)

        val handlers = classDefByStrings(PICK_QUERY, StringComparisonType.EQUALS)
            .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
            .flatMap { owner -> owner.methods.filter(::isPickHandler) }
        val handler = handlers.singleOrNull() ?: throw PatchException(
            "$PATCH: expected one comment sheet pick handler taking the session and a token that fetches " +
                "\"$PICK_QUERY\", found ${handlers.size}",
        )
        mutableClassDefBy(handler.definingClass).findMutableMethodOf(handler).tellThePick()
        enableStatus("defaultCommentOrder")
    }
}

/**
 * First thing in the params' constructor, the order the request would carry goes to the extension
 * with the feedback id and the focused comment id, and its answer takes the order's place in the
 * parameter the constructor stores it from. Nothing else in the constructor changes.
 */
internal fun MutableMethod.askForTheOrder(registers: RequestRegisters) {
    val read = listOf(registers.order, registers.feedbackId, registers.focusedComment)
    // invoke-static names each register in four bits. The iput-object stores the finder read them
    // from name theirs in four bits too, so this holds wherever the finder matched (v4 to v7 on 577
    // and 580). It stays as the guard in case the finder ever follows a copy instead.
    if (read.any { it > 15 }) {
        throw PatchException("$PATCH: $definingClass->$name keeps the order or the ids past v15: $read")
    }
    addInstructions(
        0,
        """
            invoke-static { ${read.joinToString { "v$it" }} }, $REQUESTED_ORDER
            move-result-object v${registers.order}
        """,
    )
}

/** First thing in the pick handler, the picked token goes to the extension, which only notes it. */
internal fun MutableMethod.tellThePick() {
    // The range form names any register, so the handler's register count doesn't matter.
    val token = parameterRegisterNumber(1)
    addInstructions(0, "invoke-static/range { v$token .. v$token }, $PICKED")
}
