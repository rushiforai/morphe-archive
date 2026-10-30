package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.controls.controlProfiles
import app.hushmessenger.patches.controls.fixtureMethod
import app.hushmessenger.patches.controls.redexStringTables
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertThrows
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test

class RestoreTrustShapesTest {
    private val originalSigners = "Lapp/hushmessenger/extension/MessengerSignature;->" +
        "originalSigners(Landroid/content/pm/PackageInfo;)Ljava/util/List;"

    private fun signersMethod(registers: Int, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Trust;",
            "signers",
            emptyList(),
            "Lfixture/Signers;",
            flags,
            null,
            null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, "const/4 v0, 0x0\nreturn-object v0") }

    private fun MutableMethod.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun MutableMethod.target(index: Int): Int {
        val body = body()
        var address = 0
        val addresses = body.map { instruction -> address.also { address += instruction.codeUnits } }
        return addresses.indexOf(addresses[index] + (body[index] as OffsetInstruction).codeOffset)
    }

    private val Instruction.reference get() = (this as ReferenceInstruction).reference

    @Test
    fun `the answer is read through a copy of this and Messenger's path is kept`() {
        val method = signersMethod(6)
        method.answerOriginalSigners("packageInfo", "Lfixture/Signers;")
        val body = method.body()

        assertEquals(Opcode.MOVE_OBJECT_FROM16, body[0].opcode)
        assertEquals(0, (body[0] as TwoRegisterInstruction).registerA)
        assertEquals(5, (body[0] as TwoRegisterInstruction).registerB, "this")
        assertEquals(Opcode.IGET_OBJECT, body[1].opcode)
        assertEquals(0, (body[1] as TwoRegisterInstruction).registerB)
        assertEquals("packageInfo", (body[1].reference as FieldReference).name)
        assertEquals(originalSigners, (body[2].reference as MethodReference).toString())
        assertEquals(Opcode.IF_EQZ, body[4].opcode)
        assertEquals(9, method.target(4), "null runs Messenger's own code")
        assertEquals(Opcode.RETURN_OBJECT, body[8].opcode)
        assertEquals(Opcode.CONST_4, body[9].opcode)
    }

    @Test
    fun `a method whose this sits above v15 still gets the answer`() {
        val method = signersMethod(20)
        method.answerOriginalSigners("packageInfo", "Lfixture/Signers;")
        val body = method.body()
        assertEquals(Opcode.MOVE_OBJECT_FROM16, body[0].opcode)
        assertEquals(19, (body[0] as TwoRegisterInstruction).registerB)
        assertEquals(Opcode.IGET_OBJECT, body[1].opcode)
        assertEquals(0, (body[1] as TwoRegisterInstruction).registerB)
    }

    @Test
    fun `a method with fewer than three locals stops the patch`() {
        for (registers in 1..3) {
            assertThrows(PatchException::class.java, { signersMethod(registers).answerOriginalSigners("packageInfo", "Lfixture/Signers;") },
                "$registers registers")
        }
    }

    @Test
    fun `a static method has no this to read the field from and stops the patch`() {
        val method = signersMethod(6, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        val before = method.body()
        val failure = assertThrows(PatchException::class.java) { method.answerOriginalSigners("packageInfo", "Lfixture/Signers;") }
        assertEquals(true, failure.message.orEmpty().contains("is static"))
        assertEquals(before, method.body())
    }

    /** FBNS's package check as Messenger writes it, cut down: the package in v0, its signers read into v2. */
    private fun fbnsCheck(read: String = "iget-object v2, v0, $SIGNATURES", jump: String = "") = fixtureMethod(
        "LX/09z;->A00(Landroid/content/Context;LX/0CQ;)V",
        """
            $jump
            iget-object v0, v8, LX/0CQ;->A01:$PACKAGE
            $read
            :after_read
            if-eqz v2, :done
            array-length v1, v2
            const-string v1, "PackageInfoUtil"
            const-string v1, "Failed to create SHA-256 hash"
            :done
            return-void
        """.trimIndent(),
        registers = 9,
        flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
    )

    /** The call and its result sit right after the read, and nothing stock moves or changes. */
    private fun assertRouted(before: List<Instruction>, after: List<Instruction>, label: String) {
        val readAt = before.indexOfFirst { it.isSignaturesRead() }
        val read = before[readAt] as TwoRegisterInstruction
        assertEquals(before.size + 2, after.size, label)
        assertEquals(before, after.filterIndexed { i, _ -> i != readAt + 1 && i != readAt + 2 }, label)
        val call = after[readAt + 1] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_STATIC, call.opcode, label)
        assertEquals(FBNS_SIGNERS, (call as ReferenceInstruction).reference.toString(), label)
        assertEquals(listOf(2, read.registerB, read.registerA), listOf(call.registerCount, call.registerC, call.registerD), label)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, after[readAt + 2].opcode, label)
        assertEquals(read.registerA, (after[readAt + 2] as OneRegisterInstruction).registerA, label)
    }

    private fun Instruction.isSignaturesRead() = opcode == Opcode.IGET_OBJECT &&
        (reference as FieldReference).let { it.definingClass == PACKAGE && it.name == "signatures" }

    @Test
    fun `fbns hashes the signers the extension answers`() {
        val method = fbnsCheck()
        val before = method.body()
        method.routeFbnsSigners()
        assertRouted(before, method.body(), "fixture")
    }

    @Test
    fun `an fbns check the call can't be placed in stops the patch before any edit`() {
        val cases = mapOf(
            "found 2" to fbnsCheck(read = "iget-object v2, v0, $SIGNATURES\niget-object v2, v0, $SIGNATURES"),
            "found 0" to fbnsCheck(read = "const/4 v2, 0x0"),
            "can't name" to fbnsCheck(read = "iget-object v0, v0, $SIGNATURES"),
            "jumps past" to fbnsCheck(jump = "if-eqz v3, :after_read"),
        )
        for ((message, method) in cases) {
            val before = method.body()
            val failure = assertThrows(PatchException::class.java) { method.routeFbnsSigners() }
            assertEquals(true, failure.message.orEmpty().contains(message), "$message: ${failure.message}")
            assertEquals(before, method.body(), message)
        }
    }

    @Test
    fun `the fbns mirror wants the read before both strings`() {
        assertEquals(true, fbnsCheck().isFbnsPackageCheck())
        val tagFirst = fixtureMethod(
            "LX/09z;->A01(Landroid/content/pm/PackageInfo;)V",
            """
                const-string v1, "PackageInfoUtil"
                iget-object v0, p0, $SIGNATURES
                const-string v1, "Failed to create SHA-256 hash"
                return-void
            """.trimIndent(),
            registers = 3,
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
        )
        assertEquals(false, tagFirst.isFbnsPackageCheck())
    }

    /**
     * Mirrors [FbnsPackageCheckFingerprint], whose filters match in order: a void method that reads
     * PackageInfo.signatures, then names "PackageInfoUtil", then "Failed to create SHA-256 hash".
     */
    private fun Method.isFbnsPackageCheck(): Boolean {
        if (returnType != "V") return false
        val code = implementation?.instructions?.toList() ?: return false
        fun at(index: Int) = ((code[index] as? ReferenceInstruction)?.reference as? StringReference)?.string
        val read = code.indexOfFirst { it.isSignaturesRead() }.takeIf { it >= 0 } ?: return false
        val tag = (read + 1 until code.size).firstOrNull { at(it) == "PackageInfoUtil" } ?: return false
        return (tag + 1 until code.size).any { at(it) == "Failed to create SHA-256 hash" }
    }

    /**
     * Threads' link launcher as Messenger writes it, cut down: the link's intent in v1, the family launcher in v0,
     * and the catch block after the return reusing v1 for its log message.
     */
    private fun threadsLauncher(
        pkg: String = "const-string v2, \"com.instagram.barcelona\"",
        build: String = "invoke-static {p2}, $INTENT_FROM_LINK\nmove-result-object v1",
        before: String = "",
        launch: String = "invoke-virtual {v0, p1, v1}, $FAMILY_LAUNCH",
        after: String = "",
        tail: String = "",
    ) = fixtureMethod(
        "LX/Kbf;->A00(Landroid/content/Context;Landroid/net/Uri;)V",
        """
            $pkg
            $build
            invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
            $before
            iget-object v0, p0, LX/Kbf;->A01:LX/0LY;
            invoke-interface {v0}, LX/0LY;->get()Ljava/lang/Object;
            move-result-object v0
            check-cast v0, LX/0Ho;
            :launch
            $launch
            $after
            :done
            return-void
            const-string v1, "ThreadsLinkLauncher"
            $tail
            return-void
        """.trimIndent(),
        registers = 7,
        flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    )

    @Test
    fun `a link launcher's dropped answer reaches the extension and nothing stock moves`() {
        val method = threadsLauncher()
        val before = method.body()
        val site = method.linkLaunchSites("Threads").single()
        method.reportLinkLaunches(listOf(site))
        val after = method.body()
        assertEquals(before.size + 2, after.size)
        assertEquals(before, after.filterIndexed { i, _ -> i != site.index + 1 && i != site.index + 2 })
        assertEquals(Opcode.MOVE_RESULT, after[site.index + 1].opcode)
        assertEquals(0, (after[site.index + 1] as OneRegisterInstruction).registerA, "the launcher register takes the answer")
        val call = after[site.index + 2] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_STATIC, call.opcode)
        assertEquals(FAMILY_LINK_LAUNCHED, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(3, 0, 5, 1), listOf(call.registerCount, call.registerC, call.registerD, call.registerE))
        assertEquals(Opcode.RETURN_VOID, after[site.index + 3].opcode)
    }

    /**
     * Instagram's link launcher since 584, cut down: an installed Instagram gets the link's intent with its
     * package set through one launcher, and without one the intent goes through another. Both drop the answer.
     */
    private fun instagramLauncher(second: String = "invoke-virtual {v0, p1, v1}, $FAMILY_LAUNCH") = fixtureMethod(
        "LX/KUx;->A00(Landroid/content/Context;Landroid/net/Uri;)V",
        """
            const-string v0, "com.instagram.android"
            invoke-static {p2}, $INTENT_FROM_LINK
            move-result-object v1
            if-eqz v0, :none
            invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
            iget-object v0, p0, LX/KUx;->A01:LX/0Ho;
            invoke-virtual {v0, p1, v1}, $FAMILY_LAUNCH
            return-void
            :none
            iget-object v0, p0, LX/KUx;->A01:LX/0Ho;
            $second
            return-void
            const-string v0, "InstagramLinkLauncher"
            return-void
        """.trimIndent(),
        registers = 7,
        flags = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
    )

    @Test
    fun `both of a link launcher's launches reach the extension`() {
        val method = instagramLauncher()
        val before = method.body()
        val sites = method.linkLaunchSites("Instagram")
        assertEquals(2, sites.size)
        method.reportLinkLaunches(sites)
        val after = method.body()
        assertEquals(before.size + 4, after.size)
        val calls = after.withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == FAMILY_LINK_LAUNCHED }
        assertEquals(2, calls.size)
        for ((i, call) in calls) {
            assertEquals(FAMILY_LAUNCH, (after[i - 2] as ReferenceInstruction).reference.toString(), "each call follows a launch")
            assertEquals(Opcode.MOVE_RESULT, after[i - 1].opcode)
            assertEquals(listOf(3, 0, 5, 1), (call as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC, it.registerD, it.registerE) })
            assertEquals(Opcode.RETURN_VOID, after[i + 1].opcode)
        }
        assertEquals(before, after.filterIndexed { i, _ -> calls.none { (c, _) -> i == c || i == c - 1 } })
    }

    @Test
    fun `a link launcher the call can't be placed in stops the patch before any edit`() {
        val cases = listOf(
            "uses its launch's answer" to threadsLauncher(after = "move-result v0"),
            "uses its launch's answer" to threadsLauncher(before = "invoke-virtual {v0, p1, v1}, $FAMILY_LAUNCH"),
            "other than its own" to instagramLauncher(second = "invoke-virtual {v0, v2, v1}, $FAMILY_LAUNCH"),
            "has no launches" to threadsLauncher(launch = "invoke-virtual {v0, p1, v1}, LX/0RU;->A0B(Landroid/content/Context;Landroid/content/Intent;)V"),
            "jumps to the return" to threadsLauncher(before = "if-eqz v2, :done"),
            "other than its own" to threadsLauncher(launch = "invoke-virtual {v0, v2, v1}, $FAMILY_LAUNCH"),
            "can't name" to threadsLauncher(launch = "invoke-virtual {v0, p1, v0}, $FAMILY_LAUNCH"),
            "builds 0 intents" to threadsLauncher(build = "new-instance v1, Landroid/content/Intent;"),
            "other than the one it built" to threadsLauncher(build = "invoke-static {p2}, $INTENT_FROM_LINK\nmove-result-object v3"),
            "writes its intent's register again before its launch" to threadsLauncher(before = "const/4 v1, 0x0"),
            "jumps back to its launch from after it" to threadsLauncher(tail = "goto :launch"),
            "launches an intent other than the one it built" to threadsLauncher(
                build = "const/4 v1, 0x0",
                tail = "invoke-static {p2}, $INTENT_FROM_LINK\nmove-result-object v1",
            ),
            "is static" to fixtureMethod("LX/Kbf;->A00(Landroid/content/Context;Landroid/net/Uri;)V", "return-void",
                registers = 7, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        )
        for ((message, method) in cases) {
            val before = method.body()
            val failure = assertThrows(PatchException::class.java) { method.linkLaunchSites("Threads") }
            assertEquals(true, failure.message.orEmpty().contains(message), "$message: ${failure.message}")
            assertEquals(before, method.body(), message)
        }
    }

    @Test
    fun `a link launcher's package may come from a string table but has to load before its tag`() {
        val table = "LX/000;->A00(I)Ljava/lang/String;"
        val tables = mapOf(table to mapOf(0x2a to "com.instagram.barcelona", 0x2b to "com.instagram.android"))
        // 585's 347014990 family: the key, the table call, and the package in the register setPackage reads.
        val lookup = "const/16 v0, 0x2a\ninvoke-static {v0}, $table\nmove-result-object v2"
        for (method in listOf(threadsLauncher(), threadsLauncher(pkg = lookup))) {
            method.requireLinkPackage("Threads", "com.instagram.barcelona", THREADS_LINK_TAG, tables)
            assertEquals(1, method.linkLaunchSites("Threads").size)
        }
        val cases = listOf(
            "another app's package" to threadsLauncher(pkg = lookup.replace("0x2a", "0x2b")),
            "a key the table doesn't have" to threadsLauncher(pkg = lookup.replace("0x2a", "0x2c")),
            "a lookup in something that isn't a table" to threadsLauncher(pkg = lookup.replace(table, "LX/001;->A00(I)Ljava/lang/String;")),
            "a key in another register" to threadsLauncher(pkg = lookup.replace("const/16 v0", "const/16 v3")),
            "no package" to threadsLauncher(pkg = ""),
            "the package after the tag" to threadsLauncher(pkg = "", tail = "const-string v2, \"com.instagram.barcelona\""),
        )
        for ((case, method) in cases) {
            val before = method.body()
            val failure = assertThrows(PatchException::class.java, { method.requireLinkPackage("Threads", "com.instagram.barcelona", THREADS_LINK_TAG, tables) }, case)
            assertEquals(true, failure.message.orEmpty().contains("doesn't load com.instagram.barcelona"), case)
            assertEquals(before, method.body(), case)
        }
    }

    /** Mirrors the link launcher fingerprints: `(Context, Uri)V` with the app's log tag. */
    private fun Method.isLinkLauncher(tag: String): Boolean =
        returnType == "V" && parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/net/Uri;") &&
            implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == tag } == true

    @Test
    fun `every supported build reports both link launchers`() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString()
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val methods = classes.flatMap { it.methods }
            val tables = redexStringTables(classes)
            for ((app, tag) in listOf("com.instagram.barcelona" to THREADS_LINK_TAG, "com.instagram.android" to INSTAGRAM_LINK_TAG)) {
                val launchers = methods.filter { it.isLinkLauncher(tag) }
                assertEquals(1, launchers.size, "$code $tag")
                launchers.single().requireLinkPackage(tag, app, tag, tables)
                val method = MutableMethod(launchers.single())
                val before = method.body()
                val sites = method.linkLaunchSites(tag)
                method.reportLinkLaunches(sites)
                val after = method.body()
                val calls = after.indices.filter { (after[it] as? ReferenceInstruction)?.reference?.toString() == FAMILY_LINK_LAUNCHED }
                assertEquals(sites.size, calls.size, "$code $tag")
                assertEquals(before, after.filterIndexed { i, _ -> calls.none { c -> i == c || i == c - 1 } }, "$code $tag")
            }
        }
    }

    @Test
    fun `every supported build routes its one fbns check`() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString()
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val checks = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
                .flatMap { it.methods }.filter { it.isFbnsPackageCheck() }
            assertEquals(1, checks.size, code)
            val method = MutableMethod(checks.single())
            val before = method.body()
            method.routeFbnsSigners()
            assertRouted(before, method.body(), code)
        }
    }

    private companion object {
        const val PACKAGE = "Landroid/content/pm/PackageInfo;"
        const val SIGNATURES = "$PACKAGE->signatures:[Landroid/content/pm/Signature;"
        const val INTENT_FROM_LINK = "LX/6kf;->A0F(Landroid/net/Uri;)Landroid/content/Intent;"
        const val FAMILY_LAUNCH = "LX/0RU;->A0A(Landroid/content/Context;Landroid/content/Intent;)Z"
    }
}
