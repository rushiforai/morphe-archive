/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.externalbrowser

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Test
import java.io.File

/**
 * Facebook's own link-shim recognisers on every build the bundle declares, which
 * ExternalBrowser.unwrapLinkShim copies. Its list of shim hosts and paths is theirs, plus /l.php
 * on messenger.com (Meta's shim host for chat links, which neither build names), so a page like
 * sharer.php that merely carries a "u" stays in the app. When one of these
 * fails on a new build, Facebook changed its list: change the extension's with it, or an outbound
 * link on the new form stays in the in-app browser (the 2026-09-19 bug). Reads the fixture bundles
 * from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class LinkShimFixtureTest {
    /** Facebook's check that a link is on its own domain: facebook.com, a subdomain, or fb.me. */
    private val hostCheck = setOf(".facebook.com", "facebook.com", "fb.me", "our.intern.")

    /** The check the rest of the app asks: a link on those hosts whose path is /l.php. */
    private val shimCheck = setOf("/l.php")

    /** Messenger's check for the shims on its call-to-action links, on facebook.com and its subdomains. */
    private val messengerShimPaths = setOf("/l.php", "/si/ajax/l/", "/l/")

    /** How Messenger reads the destination out of an /l/ shim's path. */
    private val pathShim = "^/l/([a-zA-Z0-9_.-]*)(?:;|/)(.*)$"

    /** The in-app browser's pattern for Facebook's link warning pages. */
    private val warningPages = "(?i)^https://(.*)\\.facebook\\.com/(flx/warn|fblynx/warn|si/linkclick/warn)/(.*)"

    private fun signature(method: Method) =
        method.definingClass + "->" + method.name + method.parameterTypes.joinToString("", "(", ")") + method.returnType

    private fun literals(method: Method): Set<String> = method.implementation?.instructions?.toList().orEmpty()
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.toSet()

    private fun calls(method: Method, target: String) = method.implementation?.instructions?.toList().orEmpty().any {
        val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
        reference != null && reference.definingClass + "->" + reference.name +
            reference.parameterTypes.joinToString("", "(", ")") + reference.returnType == target
    }

    private fun holding(bundle: File, string: String): List<Method> =
        FixtureDex.classesHolding(bundle, string).flatMap { owner -> owner.methods.filter { holdsString(it, string) } }

    @Test
    fun `each declared build knows the link shim by the hosts and paths the extension unwraps`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                check(bundle)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun check(bundle: File) {
        val name = bundle.name

        val hostChecks = holding(bundle, "fb.me").filter { literals(it) == hostCheck }
        assertEquals("$name: methods holding exactly $hostCheck", 1, hostChecks.size)
        val hostCheckSignature = signature(hostChecks.single())
        val shimChecks = holding(bundle, "/l.php").filter { calls(it, hostCheckSignature) }
        assertEquals("$name: methods holding /l.php that ask $hostCheckSignature", 1, shimChecks.size)
        assertEquals("$name: what the shim check compares the path with", shimCheck, literals(shimChecks.single()))

        val messengerChecks = holding(bundle, "/si/ajax/l/")
        assertEquals("$name: methods holding /si/ajax/l/", 1, messengerChecks.size)
        assertEquals("$name: the paths Messenger's shim check knows", messengerShimPaths, literals(messengerChecks.single()))
        assertEquals("$name: methods holding Messenger's /l/ pattern", 1, holding(bundle, pathShim).size)

        assertEquals("$name: methods holding the browser's warning page pattern", 1, holding(bundle, warningPages).size)
    }
}
