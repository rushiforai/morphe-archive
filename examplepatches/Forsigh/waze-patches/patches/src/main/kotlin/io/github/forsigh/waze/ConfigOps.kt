package io.github.forsigh.waze

/**
 * Builders for the smali blocks injected into Waze's typed config getters.
 *
 * Each block is prepended to a getter; `p0` is the receiver ConfigValue. If it equals one of the
 * listed `CONFIG_VALUE_*` fields the block returns our forced value, otherwise it falls through
 * to the original body.
 *
 * One block per getter, built from the whole [Overrides] registry - never several. Two blocks with
 * labels in the same method leave the earlier block's branches pointing at the wrong instruction
 * (the later insert shifts it without relocating), and the verifier rejects the class at runtime.
 * `prefix` still namespaces the labels so blocks for different getters cannot collide.
 */

/** smali block force-returning a value per Boolean key. Injected into the Boolean getter. */
internal fun forceBoolean(prefix: String, entries: Map<String, Boolean>): String {
    val keys = entries.keys.toList()
    return buildString {
        keys.forEachIndexed { i, key ->
            append("sget-object v0, Lcom/waze/config/ConfigValues;->$key:Lcom/waze/config/b;\n")
            append("if-eq p0, v0, :${prefix}_b$i\n")
        }
        append("goto :${prefix}_be\n")
        keys.forEachIndexed { i, key ->
            val boxed = if (entries.getValue(key)) "Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;"
                        else "Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;"
            append(":${prefix}_b$i\n")
            append("sget-object v0, $boxed\n")
            append("return-object v0\n")
        }
        append(":${prefix}_be\n")
    }
}

/** smali block force-returning a Long per key. Injected into the Long getter. */
internal fun forceLong(prefix: String, entries: Map<String, Long>): String {
    val keys = entries.keys.toList()
    return buildString {
        keys.forEachIndexed { i, key ->
            append("sget-object v0, Lcom/waze/config/ConfigValues;->$key:Lcom/waze/config/c;\n")
            append("if-eq p0, v0, :${prefix}_l$i\n")
        }
        append("goto :${prefix}_le\n")
        keys.forEachIndexed { i, key ->
            val value = entries.getValue(key)
            // const-wide/16 carries a signed 16-bit literal, /32 a signed 32-bit one; anything
            // beyond needs the full form. Emitting the wrong width is invalid smali and aborts
            // the whole patch with a classDef-null crash, so pick by value.
            val load = when {
                value in Short.MIN_VALUE.toLong()..Short.MAX_VALUE.toLong() -> "const-wide/16 v0, $value"
                value in Int.MIN_VALUE.toLong()..Int.MAX_VALUE.toLong() -> "const-wide/32 v0, $value"
                else -> "const-wide v0, ${value}L"
            }
            append(":${prefix}_l$i\n")
            append("$load\n")
            append("invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;\n")
            append("move-result-object v0\n")
            append("return-object v0\n")
        }
        append(":${prefix}_le\n")
    }
}

/** smali block force-returning a String per key. Injected into the String getter. */
internal fun forceString(prefix: String, entries: Map<String, String>): String {
    val keys = entries.keys.toList()
    return buildString {
        keys.forEachIndexed { i, key ->
            append("sget-object v0, Lcom/waze/config/ConfigValues;->$key:Lcom/waze/config/d;\n")
            append("if-eq p0, v0, :${prefix}_s$i\n")
        }
        append("goto :${prefix}_se\n")
        keys.forEachIndexed { i, key ->
            append(":${prefix}_s$i\n")
            append("const-string v0, \"${entries.getValue(key)}\"\n")
            append("return-object v0\n")
        }
        append(":${prefix}_se\n")
    }
}

/*
 * Recorders. Patches call these to state what they want forced; nothing is injected here. The
 * blocks above are built once, by configOverridesPatch, from the collected registry.
 *
 * `patchId` is only for readability at the call site / diagnostics - the registry is keyed by
 * CONFIG_VALUE name, so a key forced by two patches would be a bug worth seeing rather than merging.
 */

/** Record that [keys] must read as [value]. */
internal fun recordBoolean(patchId: String, value: Boolean, vararg keys: String) {
    keys.forEach { Overrides.booleans[it] = value }
}

/** Record that each key must read as its paired Long value. */
internal fun recordLong(patchId: String, vararg entries: Pair<String, Long>) {
    entries.forEach { (key, value) -> Overrides.longs[key] = value }
}

/** Record that each key must read as its paired String value. */
internal fun recordString(patchId: String, vararg entries: Pair<String, String>) {
    entries.forEach { (key, value) -> Overrides.strings[key] = value }
}

/**
 * Body of the static helper that pushes [entries] into Waze's native config store, by calling the
 * same setter Waze's own settings screen uses. Written once per sync hook, never per key.
 *
 * `ConfigManager.isReady()` is checked first: the sync callbacks also fire before the native layer
 * is up, and the setter throws there.
 */
internal fun nativeSyncBlock(entries: Map<String, Boolean>): String = buildString {
    appendLine("invoke-static {}, Lcom/waze/ConfigManager;->isReady()Z")
    appendLine("move-result v0")
    appendLine("if-eqz v0, :native_done")
    appendLine("invoke-static {}, Lcom/waze/ConfigManager;->getInstance()Lcom/waze/ConfigManager;")
    appendLine("move-result-object v0")
    appendLine("if-nez v0, :native_done")
    entries.forEach { (key, value) ->
        appendLine("sget-object v1, Lcom/waze/config/ConfigValues;->$key:Lcom/waze/config/b;")
        appendLine("if-nez v1, :native_done")
        appendLine("const/4 v2, ${if (value) 1 else 0}")
        appendLine("invoke-virtual {v0, v1, v2}, Lcom/waze/ConfigManager;->setConfigValueBool(Lcom/waze/config/b;Z)V")
    }
    appendLine(":native_done")
    appendLine("return-void")
}

/** Registers a Boolean key that has to reach the native config store, not just the Java getter. */
internal fun recordNativeBoolean(prefix: String, value: Boolean, vararg keys: String) {
    keys.forEach { Overrides.nativeBooleans[it] = value }
    println("${prefix}Native: native config writes = ${keys.joinToString()}")
}
