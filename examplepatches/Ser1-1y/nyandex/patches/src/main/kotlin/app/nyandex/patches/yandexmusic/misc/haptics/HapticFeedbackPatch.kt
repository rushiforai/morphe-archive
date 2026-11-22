/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.misc.haptics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.nyandex.patches.yandexmusic.misc.settings.nyandexSettingsPatch
import app.nyandex.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import java.util.logging.Logger

private val logger = Logger.getLogger("YandexMusicHapticFeedback")

internal const val HAPTICS_EXTENSION = "extensions/haptics.mpe"
internal const val HAPTICS_HOOK = "Lapp/nyandex/extension/yandexmusic/haptics/HapticsHook;"

private const val FUNCTION0 = "Lkotlin/jvm/functions/Function0;"
private const val OBJECT = "Ljava/lang/Object;"

/** Compose's own element classes keep their names, unlike the app's code. */
private const val CLICKABLE_ELEMENT = "Landroidx/compose/foundation/ClickableElement;"
private const val COMBINED_CLICKABLE_ELEMENT = "Landroidx/compose/foundation/CombinedClickableElement;"
private const val SWIPE_REFRESH_LAYOUT = "Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;"

val hapticFeedbackPatch = patch(
    name = "Тактильный отклик",
    description = "Добавляет настройки виброотклика при нажатии клавиш в параметры Nyandex.",
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    dependsOn(nyandexSettingsPatch)

    extendWith(HAPTICS_EXTENSION)

    execute {
        hookClickable()
        hookCombinedClickable()
        hookPullToRefresh()
    }
}

/**
 * `Modifier.clickable` ends in `new ClickableElement(.., role, onClick)`. The constructor passes
 * the role and the callback through the extension first, which returns a callback that vibrates
 * and then runs the original.
 */
private fun hookClickable() {
    val constructor = constructorOf(CLICKABLE_ELEMENT)
    val types = constructor.parameterTypes.map { it.toString() }
    val onClick = types.lastIndex
    check(types[onClick] == FUNCTION0) { "Unexpected ClickableElement constructor: $types" }
    val role = onClick - 1
    check(isRoleType(types[role])) { "Role parameter of ClickableElement was not found: $types" }

    // Parameter n of an instance method is register p(n + 1).
    mutableClassDefBy(CLICKABLE_ELEMENT).methods.single { it.sameAs(constructor) }.addInstructions(
        0,
        wrapClick(role = register(role), callback = register(onClick)),
    )
    logger.info("Hooked clickable taps in $CLICKABLE_ELEMENT")
}

/**
 * `Modifier.combinedClickable` ends in `new CombinedClickableElement(.., role, .., onClick,
 * onLongClick, onDoubleClick, ..)`; the three callbacks are the only `Function0` parameters.
 * The click gets the role's effect and the long click gets the long press effect.
 */
private fun hookCombinedClickable() {
    val constructor = constructorOf(COMBINED_CLICKABLE_ELEMENT)
    val parameterTypes = constructor.parameterTypes.map { it.toString() }
    val callbacks = parameterTypes.withIndex().filter { it.value == FUNCTION0 }.map { it.index }
    check(callbacks.size == 3) { "Unexpected CombinedClickableElement constructor: $parameterTypes" }
    val (onClick, onLongClick) = callbacks
    val role = parameterTypes.indexOfFirst(::isRoleType)
    check(role in 0 until onClick) { "Role parameter of CombinedClickableElement was not found" }

    mutableClassDefBy(COMBINED_CLICKABLE_ELEMENT).methods.single { it.sameAs(constructor) }.addInstructions(
        0,
        wrapClick(role = register(role), callback = register(onClick)) + "\n" +
            wrapLongClick(callback = register(onLongClick)),
    )
    logger.info("Hooked clickable long presses in $COMBINED_CLICKABLE_ELEMENT")
}

/**
 * `SwipeRefreshLayout` starts the refresh the user pulled for through one private method
 * `(refreshing, notify)`; the app's own `setRefreshing` passes `notify = false`.
 */
private fun hookPullToRefresh() {
    val swipeRefresh = mutableClassDefBy(SWIPE_REFRESH_LAYOUT)
    val method = swipeRefresh.methods.singleOrNull {
        it.parameterTypes == listOf("Z", "Z") && it.returnType == "V" && it.name != "<init>"
    } ?: throw PatchException("SwipeRefreshLayout refresh method was not found")

    method.addInstructions(0, "invoke-static {p1, p2}, $HAPTICS_HOOK->onSpinner(ZZ)V")
    logger.info("Hooked pull to refresh in $SWIPE_REFRESH_LAYOUT.${method.name}")
}

private fun constructorOf(type: String): Method {
    val constructors = mutableClassDefBy(type).methods.filter { it.name == "<init>" }
    return constructors.singleOrNull() ?: throw PatchException("Expected one constructor in $type")
}

/** The boxed `Role` is a class with a single int field, the role's number. */
private fun isRoleType(type: String): Boolean {
    if (!type.startsWith("L")) return false
    val classDef = classDefByOrNull { it.type == type } ?: return false
    val fields = classDef.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
    return fields.size == 1 && fields.single().type == "I"
}

private fun register(parameter: Int) = "p${parameter + 1}"

private fun Method.sameAs(other: Method) = name == other.name && parameterTypes == other.parameterTypes

private fun wrapClick(role: String, callback: String) = """
    invoke-static {$role, $callback}, $HAPTICS_HOOK->wrapClick($OBJECT$OBJECT)$OBJECT
    move-result-object $callback
    check-cast $callback, $FUNCTION0
""".trimIndent()

private fun wrapLongClick(callback: String) = """
    invoke-static {$callback}, $HAPTICS_HOOK->wrapLongClick($OBJECT)$OBJECT
    move-result-object $callback
    check-cast $callback, $FUNCTION0
""".trimIndent()
