package app.pigfoot.patches

import app.pigfoot.patches.camscanner.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import org.junit.Assert.*
import org.junit.Test

class CamScannerLotteryInitGuardTest {
    private fun method(registers: Int = 11) = MutableMethod(ImmutableMethod(
        LOTTERY_WEB_CLIENT, "onPageFinished", listOf("Landroid/webkit/WebView;", "Ljava/lang/String;")
            .map { ImmutableMethodParameter(it, emptySet(), null) }, "V", AccessFlags.PUBLIC.value,
        emptySet(), emptySet(), ImmutableMethodImplementation(registers,
            listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList())))

    @Test fun assembledSilentPrefixPreservesArgumentsAndUsesOnlyScopedHosts() {
        for ((url, hasView, expected) in listOf(
            Triple("https://mo.camscanner.com/lottery/relottery?intsig_key=private", true, 1),
            Triple("https://www.camscanner.com/lottery/relottery", true, 1),
            Triple("https://mo.camscanner.com.evil.invalid/lottery/relottery", true, 0),
            Triple("http://mo.camscanner.com/lottery/relottery", true, 0),
            Triple(null, true, 0), Triple("https://mo.camscanner.com/lottery/relottery", false, 0))) {
            val m = method(); installLotteryInitGuard(m)
            val code = m.implementation!!.instructions.toList(); val addresses = mutableMapOf<Int, Int>(); var units = 0
            code.forEachIndexed { j, i -> addresses[units] = j; units += i.codeUnits }
            val r = arrayOfNulls<Any>(11); val owner = Any(); val view = if (hasView) Any() else null
            r[8] = owner; r[9] = view; r[10] = url
            var pc = 0; var result: Any? = null; var calls = 0; var steps = 0
            fun truth(v: Any?) = v != null && v != false && v != 0
            while (pc < code.size) {
                check(++steps < 40)
                val i = code[pc]; val one = i as? OneRegisterInstruction; var next = pc + 1
                when (i.opcode) {
                    Opcode.NOP -> Unit
                    Opcode.CONST_STRING -> r[one!!.registerA] = ((i as ReferenceInstruction).reference as StringReference).string
                    Opcode.CONST_4 -> r[one!!.registerA] = (i as WideLiteralInstruction).wideLiteral.toInt()
                    Opcode.MOVE_RESULT -> r[one!!.registerA] = result
                    Opcode.IF_EQZ, Opcode.IF_NEZ -> if (truth(r[one!!.registerA]) == (i.opcode == Opcode.IF_NEZ)) {
                        val address = addresses.entries.single { it.value == pc }.key
                        next = addresses.getValue(address + (i as OffsetInstruction).codeOffset)
                    }
                    Opcode.INVOKE_VIRTUAL -> {
                        val c = i as FiveRegisterInstruction
                        when ((i as ReferenceInstruction).reference.toString()) {
                            "Ljava/lang/String;->startsWith(Ljava/lang/String;)Z" -> result = (r[c.registerC] as String).startsWith(r[c.registerD] as String)
                            "Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V" -> {
                                assertSame(view, r[c.registerC]); assertEquals(lotteryInitOnlyScript, r[c.registerD]); assertEquals(0, r[c.registerE]); calls++
                            }
                            else -> error("Unexpected production initialization call")
                        }
                    }
                    Opcode.RETURN_VOID -> break
                    else -> error("Unexpected production initialization opcode ${i.opcode}")
                }
                pc = next
            }
            assertEquals(expected, calls); assertSame(owner, r[8]); assertSame(view, r[9]); assertEquals(url, r[10])
            assertTrue(m.implementation!!.tryBlocks.isEmpty())
        }
    }
    @Test fun unsupportedMethodShapeAndUnqualifiedWriterDigestFailClosed() {
        assertThrows(IllegalArgumentException::class.java) { requireLotteryInitMethod(method(10)) }
        assertTrue(matchesCamScannerClassPin(LOTTERY_WEB_CLIENT_PIN, "e5ff5a7b1762abaf68ec714da5e1932940881164cc4d55ae17e25ab526b9238a"))
        assertFalse(matchesCamScannerClassPin(LOTTERY_WEB_CLIENT_PIN, "e5ff5a7b1762abaf68ec714da5e1932940881164cc4d55ae17e25ab526b9238b"))
    }
}
