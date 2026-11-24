/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.returnEarly
import app.morphe.patcher.xml.ResourceXml
import app.morphe.patcher.xml.XmlElement

private const val FLUTTER_RESULT = "Lio/flutter/plugin/common/MethodChannel\$Result;"

/** Returns early with a constant [Boolean] from every concrete method matching [predicate]. */
internal fun MutableClass.returnEarlyAll(
    value: Boolean,
    predicate: (MutableMethod) -> Boolean = { it.returnType == "Z" },
) {
    methods.filter { it.implementation != null && predicate(it) }
        .forEach { it.returnEarly(value) }
}

/** Returns early (`return-void`) from every concrete void method matching [predicate]. */
internal fun MutableClass.returnEarlyVoidAll(
    predicate: (MutableMethod) -> Boolean,
) {
    methods.filter { it.implementation != null && it.returnType == "V" && predicate(it) }
        .forEach { it.returnEarly() }
}

/**
 * Replies immediately on a Flutter `MethodChannel.Result` parameter (default `p2` for
 * `onMethodCall(MethodCall, Result)`) and returns.
 */
internal fun MutableMethod.replyFlutterNull(resultParam: String = "p2") = addInstructions(
    0,
    """
        const/4 v0, 0x0
        invoke-interface {$resultParam, v0}, $FLUTTER_RESULT->success(Ljava/lang/Object;)V
        return-void
    """,
)

internal fun MutableMethod.replyFlutterBool(value: Boolean, resultParam: String = "p2") = addInstructions(
    0,
    """
        const/4 v0, ${if (value) "0x1" else "0x0"}
        invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
        move-result-object v0
        invoke-interface {$resultParam, v0}, $FLUTTER_RESULT->success(Ljava/lang/Object;)V
        return-void
    """,
)

internal fun MutableMethod.replyFlutterString(value: String, resultParam: String = "p2") = addInstructions(
    0,
    """
        const-string v0, "$value"
        invoke-interface {$resultParam, v0}, $FLUTTER_RESULT->success(Ljava/lang/Object;)V
        return-void
    """,
)

internal fun MutableMethod.replyFlutterEmptyMap(resultParam: String = "p2") = addInstructions(
    0,
    """
        new-instance v0, Ljava/util/HashMap;
        invoke-direct {v0}, Ljava/util/HashMap;-><init>()V
        invoke-interface {$resultParam, v0}, $FLUTTER_RESULT->success(Ljava/lang/Object;)V
        return-void
    """,
)

/** Removes every element across [tags] matching [predicate] without mutating during iteration. */
internal fun ResourceXml.removeElements(
    tags: Iterable<String>,
    predicate: (XmlElement) -> Boolean,
) {
    tags.forEach { tag ->
        elements(tag).filter(predicate).toList().forEach { it.remove() }
    }
}

/** Upserts `<meta-data android:name="..." android:value="..."/>` entries under `<application>`. */
internal fun ResourceXml.setMetaData(entries: Map<String, String>) {
    val application = elements("application").firstOrNull() ?: return
    entries.forEach { (name, value) ->
        elementByAttributeOrNull("android:name", name)
            ?.setAttribute("android:value", value)
            ?: application.appendChild("meta-data") {
                setAttribute("android:name", name)
                setAttribute("android:value", value)
            }
    }
}
