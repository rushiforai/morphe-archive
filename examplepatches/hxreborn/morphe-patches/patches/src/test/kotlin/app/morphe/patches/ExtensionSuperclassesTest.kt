/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import java.nio.ByteBuffer
import kotlin.test.Test
import kotlin.test.assertEquals

internal class ExtensionSuperclassesTest {
    private val d8RuntimePackage = "Lcom/android/tools/r8/"

    private val unloadedLibraryRecords = setOf(
        "Lapp/morphe/extension/shared/StringRef\$StringKeyLookup;",
        "Lapp/morphe/extension/shared/TrieSearch\$TrieCompressedPath;",
    )

    @Test
    fun `no extension class extends a D8 runtime class`() {
        val bytes = checkNotNull(javaClass.getResourceAsStream("/extensions/extension.mpe")) {
            "extensions/extension.mpe is not on the test classpath"
        }.use { it.readBytes() }

        val subclasses = DexBackedDexFile(Opcodes.getDefault(), ByteBuffer.wrap(bytes)).classes
            .filter { it.superclass?.startsWith(d8RuntimePackage) == true && it.type !in unloadedLibraryRecords }
            .map { "${it.type} extends ${it.superclass}" }

        assertEquals(emptyList(), subclasses)
    }
}
