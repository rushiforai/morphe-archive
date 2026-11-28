/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.extension

import app.morphe.patches.instagram.download.reel.OFFER
import app.morphe.patches.instagram.media.taptoplay.AUTOPLAY_ALLOWED
import app.morphe.patches.instagram.media.taptoplay.PlayerHooks
import app.morphe.patches.instagram.media.taptoplay.RESUME_HELD_STORY
import java.io.File
import java.lang.reflect.Modifier
import java.util.zip.ZipFile
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * No hook the patches write takes a boolean. A method that returns Z may return a register ART
 * types as int or byte (an `and-int/lit8` before the return is enough), and handing that register
 * to a Z parameter fails verification when Instagram's class loads, so every hook takes Instagram's
 * yes or no as an int and reads non-zero as yes.
 *
 * The hooks are the patches' string constants that name a method of the extension, read from the
 * compiled patches, so a constant put together from other constants counts as what it spells.
 */
class BooleanHookParametersTest {
    @Test
    fun `no hook takes a boolean`() {
        val hooks = hookDescriptors()
        assertTrue(
            "found none of the hooks this was written against, so it checks nothing: $hooks",
            listOf(AUTOPLAY_ALLOWED, OFFER, RESUME_HELD_STORY).all { it in hooks },
        )
        val booleans = hooks.filter { "Z" in parameters(it) }.sorted()
        assertTrue(
            "These hooks take a boolean, which a register Instagram's code types as int won't pass. " +
                "Give the extension an int entry that reads non-zero as yes and call that:\n" +
                booleans.joinToString("\n"),
            booleans.isEmpty(),
        )
    }

    @Test
    fun `a descriptor's parameters are read one type at a time`() {
        assertEquals(listOf("Z", "Ljava/lang/Object;"), parameters("La;->b(ZLjava/lang/Object;)Z"))
        assertEquals(listOf("[Z", "I", "LZ;", "[[Ljava/lang/String;"), parameters("La;->b([ZILZ;[[Ljava/lang/String;)V"))
        assertEquals(emptyList<String>(), parameters("La;->b()Z"))
    }

    /** Every static String constant of the compiled patches that names a method of the extension. */
    private fun hookDescriptors(): Set<String> {
        val root = File(PlayerHooks::class.java.protectionDomain.codeSource.location.toURI())
        val entries = if (root.isDirectory) {
            root.walkTopDown().filter { it.isFile }.map { it.relativeTo(root).invariantSeparatorsPath }.toList()
        } else {
            ZipFile(root).use { zip -> zip.entries().asSequence().map { it.name }.toList() }
        }
        return entries.filter { it.startsWith("app/morphe/") && it.endsWith(".class") }
            .map { Class.forName(it.removeSuffix(".class").replace('/', '.'), false, javaClass.classLoader) }
            .flatMap { type ->
                type.declaredFields.filter {
                    Modifier.isStatic(it.modifiers) && Modifier.isFinal(it.modifiers) && it.type == String::class.java
                }.mapNotNull { field -> field.trySetAccessible(); field.get(null) as String? }
            }
            .filter { HOOK.matches(it) }
            .toSet()
    }

    /** The parameter types of [descriptor], a method reference, in order. */
    private fun parameters(descriptor: String): List<String> {
        val list = descriptor.substringAfter('(').substringBefore(')')
        val types = mutableListOf<String>()
        var start = 0
        while (start < list.length) {
            var end = start
            while (list[end] == '[') end++
            end = if (list[end] == 'L') list.indexOf(';', end) + 1 else end + 1
            types += list.substring(start, end)
            start = end
        }
        return types
    }

    private companion object {
        val HOOK = Regex("""Lapp/hushgram/extension/[^;]+;->[^(]+\([^)]*\).+""")
    }
}
