package app.template.patches.firefox.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.addInstructionChecked
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.dns.geckoTrrMode
import app.template.patches.shared.misc.dns.isValidDohUrl
import app.template.patches.shared.smaliInstructionCount
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** Run by the testFirefox Gradle task; no Android device is needed. */
object FirefoxHelpersTest {
    @JvmStatic
    fun main(args: Array<String>) {
        countsSnippetInstructions()
        countsPayloadBlocksOnce()
        validatesResolverUrls()
        mapsStrictnessToTrrModes()
        checkedInsertKeepsGoodSnippets()
        checkedInsertRefusesRegistersThatDoNotFit()

        println("Firefox helper logic passed")
    }

    private fun countsSnippetInstructions() {
        check(smaliInstructionCount("const/4 v0, 0x1\ninvoke-static {}, Lx;->y()V") == 2)
        check(smaliInstructionCount(":label\n# comment\nconst/4 v0, 0x1\n\n.line 4\nnop\nreturn-void") == 2)
        check(smaliInstructionCount("") == 0)
    }

    private fun countsPayloadBlocksOnce() {
        val snippet = """
            packed-switch v0, :pswitch_data_0
            return-void
            :pswitch_data_0
            .packed-switch 0x1
                :pswitch_0
            .end packed-switch
            :pswitch_0
            const/4 v0, 0x0
            return-void
        """.trimIndent()
        // 4 real instructions plus the payload block.
        check(smaliInstructionCount(snippet) == 5) { "got ${smaliInstructionCount(snippet)}" }
    }

    private fun validatesResolverUrls() {
        listOf(
            "https://doh.cleanbrowsing.org/doh/family-filter/",
            "https://family.cloudflare-dns.com/dns-query",
            "https://family.adguard-dns.com/dns-query",
            "HTTPS://dns.example.com:8443/q",
        ).forEach { check(isValidDohUrl(it)) { it } }

        listOf(
            null, "", "http://a/dns-query", "https://", "https:///x", "https://u@a/",
            "https://a/\"", "https://a/\\u", "https://a/{?dns}", "https://a/#x", "https://a/ b",
            "https://a/\n", "https://a/é", "ftp://a/", "https://" + "a".repeat(600),
        ).forEach { check(!isValidDohUrl(it)) { it.toString() } }
    }

    private fun mapsStrictnessToTrrModes() {
        // network.trr.mode: 3 = TRR only (strict), 2 = TRR first (fallback).
        check(geckoTrrMode(strict = true) == 3)
        check(geckoTrrMode(strict = false) == 2)
    }

    /** Non-static `target(II)V`; with 21 registers p0 = v18, p1 = v19, p2 = v20. */
    private fun target(registers: Int = 21) = ImmutableMethod(
        "Lprobe/Target;",
        "target",
        listOf(ImmutableMethodParameter("I", null, null), ImmutableMethodParameter("I", null, null)),
        "V",
        AccessFlags.PUBLIC.value,
        null,
        null,
        MutableMethodImplementation(registers).apply {
            addInstruction(BuilderInstruction10x(Opcode.RETURN_VOID))
        },
    ).toMutable()

    private fun checkedInsertKeepsGoodSnippets() {
        val method = target()
        method.addInstructionsChecked(0, "const/4 v0, 0x1\nconst/4 v1, 0x0")
        method.addInstructionChecked("const/4 v2, 0x2")
        check(method.implementation!!.instructions.count { it.opcode != Opcode.NOP } == 4) {
            "the kept instructions were not counted"
        }
    }

    private fun checkedInsertRefusesRegistersThatDoNotFit() {
        // const/4 only addresses v0..v15; a snippet naming v17 (or a literal outside -8..7)
        // must fail loudly — either the compiler refuses it or the checked wrapper notices
        // the instruction never landed. Silence is the one unacceptable outcome.
        listOf(
            { target().addInstructionsChecked(0, "const/4 v0, 0x1\nconst/4 v17, 0x0") },
            { target().addInstructionsChecked(0, "const/4 v17, 0x0") },
            { target().addInstructionChecked("const/4 v0, 0x8") }, // literal outside -8..7
        ).forEach { block ->
            val failure = runCatching { block() }.exceptionOrNull()
            check(failure != null) { "a bad register or literal must not be accepted silently" }
            if (failure is PatchException) {
                check(failure.message!!.contains("Lprobe/Target;->target(II)V")) {
                    "the refusal must name the method: ${failure.message}"
                }
            }
        }
    }
}
