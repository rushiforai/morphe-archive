package app.pigfoot.patches

import app.pigfoot.patches.pitt.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.immutable.reference.*
import org.junit.Assert.*
import org.junit.Test

/** Execute the actual generated instructions; API doubles model only Android calls. */
class PittGoogleEntryTest {
    private data class Intent(var action: String = "", var uri: String = "")
    private class ApiError(val type: String) : RuntimeException()
    private data class Result(val allowed: Boolean, val toasts: List<String>, val launches: List<Intent>, val packageQueries: Int)
    private fun execute(installed: Boolean = true, enabled: Boolean = true,
        nullContext: Boolean = false, packageError: Boolean = false, launchError: Boolean = false): Result {
        val method = pittGooglePrepareMethod()
        val impl = method.implementation!!
        val code = impl.instructions.toList()
        val pcs = mutableListOf<Int>(); var nextPc = 0
        code.forEach { pcs.add(nextPc); nextPc += it.codeUnits }
        val at = pcs.withIndex().associate { it.value to it.index }
        val regs = arrayOfNulls<Any>(impl.registerCount); regs[4] = if (nullContext) null else "activity"
        var result: Any? = null; var caught: ApiError? = null; var pc = 0; var steps = 0; var queries = 0
        val toasts = mutableListOf<String>(); val launches = mutableListOf<Intent>()
        while (steps++ < 200) {
            val i = code[at.getValue(pc)]; val following = pc + i.codeUnits
            try {
                when (i.opcode) {
                    Opcode.CONST_4 -> regs[(i as OneRegisterInstruction).registerA] = (i as NarrowLiteralInstruction).narrowLiteral
                    Opcode.CONST_STRING -> regs[(i as OneRegisterInstruction).registerA] = (i as ReferenceInstruction).reference.toString()
                    Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_RESULT -> regs[(i as OneRegisterInstruction).registerA] = result
                    Opcode.MOVE_EXCEPTION -> regs[(i as OneRegisterInstruction).registerA] = caught
                    Opcode.NEW_INSTANCE -> regs[(i as OneRegisterInstruction).registerA] = Intent()
                    Opcode.IGET_BOOLEAN -> regs[(i as TwoRegisterInstruction).registerA] = if (enabled) 1 else 0
                    Opcode.IF_EQZ -> {
                        val value = regs[(i as OneRegisterInstruction).registerA]
                        if (value == null || value == 0) { pc += (i as OffsetInstruction).codeOffset; continue }
                    }
                    Opcode.GOTO -> { pc += (i as OffsetInstruction).codeOffset; continue }
                    Opcode.RETURN -> return Result(regs[(i as OneRegisterInstruction).registerA] == 1, toasts, launches, queries)
                    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_STATIC, Opcode.INVOKE_DIRECT -> {
                        val call = i as FiveRegisterInstruction
                        val args = listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount).map { regs[it] }
                        val ref = (i as ReferenceInstruction).reference.toString()
                        result = when (ref) {
                            "Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;" -> {
                                if (packageError) throw ApiError("Ljava/lang/RuntimeException;"); "packageManager"
                            }
                            "Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;" -> {
                                queries++; assertEquals(PITT_GMS_PACKAGE, args[1]); assertEquals(0, args[2])
                                if (!installed) throw ApiError("Landroid/content/pm/PackageManager\$NameNotFoundException;"); "applicationInfo"
                            }
                            "Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;" -> {
                                assertEquals("activity", args[0]); assertEquals(1, args[2]); toasts.add(args[1] as String); "toast"
                            }
                            "Landroid/widget/Toast;->show()V" -> null
                            "Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;" -> args[0]
                            "Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V" -> {
                                (args[0] as Intent).apply { action = args[1] as String; uri = args[2] as String }; null
                            }
                            "Landroid/content/Context;->startActivity(Landroid/content/Intent;)V" -> {
                                launches.add((args[1] as Intent).copy()); if (launchError) throw ApiError("Ljava/lang/RuntimeException;"); null
                            }
                            else -> error("Unexpected generated API: $ref")
                        }
                    }
                    else -> error("Unsupported generated instruction: ${i.opcode}")
                }
                pc = following
            } catch (ex: ApiError) {
                val handler = impl.tryBlocks.filter { pc >= it.startCodeAddress && pc < it.startCodeAddress + it.codeUnitCount }
                    .flatMap { it.exceptionHandlers }.firstOrNull { it.exceptionType == ex.type }
                    ?: throw AssertionError("Uncaught simulated Android API exception: ${ex.type}")
                caught = ex; pc = handler.handlerCodeAddress
            }
        }
        error("Generated helper did not terminate")
    }

    @Test fun compatibleInstalledProviderPreservesLoginWithoutExtraUi() {
        val r = execute(); assertTrue(r.allowed); assertEquals(1, r.packageQueries)
        assertTrue(r.toasts.isEmpty()); assertTrue(r.launches.isEmpty())
    }
    @Test fun missingProviderOffersOnlyOfficialDownloadAfterUserAction() {
        val r = execute(installed = false); assertFalse(r.allowed); assertEquals(1, r.toasts.size)
        assertEquals(listOf(Intent("android.intent.action.VIEW", PITT_MICROG_DOWNLOAD)), r.launches)
        assertFalse(r.launches.any { it.action.contains("INSTALL") || it.action.contains("DELETE") })
    }
    @Test fun disabledProviderOpensItsSettingsInsteadOfDownloadOrLogin() {
        val r = execute(enabled = false); assertFalse(r.allowed); assertEquals(1, r.toasts.size)
        assertEquals(listOf(Intent("android.settings.APPLICATION_DETAILS_SETTINGS", "package:$PITT_GMS_PACKAGE")), r.launches)
    }
    @Test fun unavailableActivityAndPackageChecksFailWithoutCrashOrFakeLogin() {
        assertFalse(execute(installed = false, launchError = true).allowed)
        assertFalse(execute(enabled = false, launchError = true).allowed)
        val error = execute(packageError = true); assertFalse(error.allowed); assertEquals(1, error.toasts.size); assertTrue(error.launches.isEmpty())
        val none = execute(nullContext = true); assertFalse(none.allowed); assertEquals(0, none.packageQueries); assertTrue(none.toasts.isEmpty())
    }
    @Test fun helperHasOnlyLocalDependencyAndUiApisNotAccountsOrProcessExit() {
        val m = pittGooglePrepareMethod(); assertEquals(4105, m.accessFlags); assertEquals(5, m.implementation!!.registerCount)
        val refs = m.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertFalse(refs.any { listOf("AccountManager", "Firebase", "GoogleSignIn", "System;->exit", "Runtime;->exit", "getMessage", "setApplicationEnabledSetting").any(it::contains) })
        assertEquals(1, refs.count { it == PITT_MICROG_DOWNLOAD })
    }
    private fun click(): MutableMethod {
        fun field(op: Opcode, a: Int, b: Int, owner: String, name: String, type: String) = ImmutableInstruction22c(op, a, b, ImmutableFieldReference(owner, name, type))
        return MutableMethod(ImmutableMethod(PITT_GOOGLE_CLICK, "onClick", listOf(ImmutableMethodParameter("Landroid/view/View;", emptySet(), null)), "V", 17, emptySet(), emptySet(),
            ImmutableMethodImplementation(7, listOf(
                ImmutableInstruction21c(Opcode.SGET_OBJECT, 6, ImmutableFieldReference("Lcom/ihad/ptt/model/handler/g2\$b;", "a", PITT_STATE)),
                field(Opcode.IGET_OBJECT, 6, 6, PITT_STATE, "O0", "Ljava/lang/String;"),
                ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 6, 0, 0, 0, 0, ImmutableMethodReference("Ljava/lang/String;", "isEmpty", emptyList(), "Z")),
                ImmutableInstruction11x(Opcode.MOVE_RESULT, 6),
                field(Opcode.IGET_OBJECT, 0, 5, PITT_GOOGLE_CLICK, "a", PITT_LOGIN_OWNER),
                ImmutableInstruction21t(Opcode.IF_EQZ, 6, 8),
                field(Opcode.IGET_OBJECT, 6, 0, PITT_LOGIN_OWNER, "b0", "Lh7/a;"),
                ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 6, 0, 0, 0, 0, ImmutableMethodReference("Lcom/google/android/gms/common/api/c;", "getApplicationContext", emptyList(), "Landroid/content/Context;")),
                ImmutableInstruction10x(Opcode.RETURN_VOID),
                field(Opcode.IGET_OBJECT, 6, 0, "Lcom/ihad/ptt/vd;", "O", "Lcom/google/firebase/auth/FirebaseAuth;"),
                ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 1, 6, 0, 0, 0, 0, ImmutableMethodReference("Lcom/google/firebase/auth/FirebaseAuth;", "c", emptyList(), "V")),
                ImmutableInstruction10x(Opcode.RETURN_VOID)
            ), emptyList(), emptyList())))
    }
    @Test fun clickGuardUsesOnlyDeadScratchAndKeepsOriginalSignOutEdge() {
        val m = click(); val before = m.implementation!!.instructions.toList(); guardPittGoogleEntry(m)
        val after = m.implementation!!.instructions.toList(); assertEquals(before.size + 6, after.size); assertEquals(7, m.implementation!!.registerCount)
        assertEquals(Opcode.IF_EQZ, after[5].opcode); assertEquals(19, (after[5] as OffsetInstruction).codeOffset)
        assertEquals(Opcode.IF_NEZ, after[10].opcode); assertEquals(Opcode.RETURN_VOID, after[11].opcode)
        assertEquals(before.map { it.opcode }, after.filterIndexed { i, _ -> i !in 6..11 }.map { it.opcode })
        assertEquals(6, (after[7] as OneRegisterInstruction).registerA)
        assertThrows(IllegalArgumentException::class.java) { guardPittGoogleEntry(m) }
    }
    @Test fun unexpectedClickOwnerOrPrefixIsRejectedBeforeMutation() {
        val m = click(); m.definingClass = "Lother;"; val before = m.implementation!!.instructions.map { it.opcode }
        assertThrows(IllegalArgumentException::class.java) { guardPittGoogleEntry(m) }; assertEquals(before, m.implementation!!.instructions.map { it.opcode })
        val bad = click(); bad.implementation!!.replaceInstruction(5, com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x(Opcode.NOP))
        assertThrows(IllegalArgumentException::class.java) { guardPittGoogleEntry(bad) }; assertEquals(Opcode.IGET_OBJECT, bad.implementation!!.instructions[6].opcode)
    }
}
