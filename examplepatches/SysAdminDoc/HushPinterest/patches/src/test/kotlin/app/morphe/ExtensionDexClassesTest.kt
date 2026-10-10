/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe

import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * The patcher merges the extension's classes into Pinterest by name, so a class the extension
 * defines outside its own package lands on top of Pinterest's copy. R8 copies a library class in
 * whenever code names it, a Class.forName literal included, which is how kotlin/Unit got in once.
 */
class ExtensionDexClassesTest {
    @Test
    fun `the extension defines no classes outside its package but the kept Kotlin intrinsics`() {
        val foreign = ExtensionDex.classes().map { it.type }
            .filterNot { it.startsWith("Lapp/hushpinterest/extension/") }.sorted()
        assertEquals(KEPT, foreign)
    }

    private companion object {
        /** In every release so far, through the Intrinsics keep rule in extensions/proguard-rules.pro. */
        val KEPT = listOf(
            "Lkotlin/KotlinNullPointerException;",
            "Lkotlin/UninitializedPropertyAccessException;",
            "Lkotlin/jvm/internal/Intrinsics;",
        )
    }
}
