package patches.vela

import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.*
import org.junit.Test

class CarScreenDexTest {
    @Test fun generatedScreenUsesOnlyTheHostsFrameworkAndDelegatesTemplateBuilding() {
        val dex = DexBackedDexFile.fromInputStream(Opcodes.forApi(26), carProviderScreenDex())
        val screen = dex.classes.single()
        assertEquals("Lnl/johninnl/vela/car/ProviderScreen;", screen.type)
        assertEquals("Lnt3;", screen.superclass)
        assertTrue(screen.fields.none())
        assertEquals(setOf("<init>", "k", "nativeToggle"), screen.methods.map { it.name }.toSet())
        val constructor = screen.methods.single { it.name == "<init>" }
        assertEquals(listOf("Landroidx/car/app/i;"), constructor.parameterTypes)
        val superCall = constructor.implementation!!.instructions.filterIsInstance<ReferenceInstruction>()
            .map { it.reference }.filterIsInstance<MethodReference>().single()
        assertEquals("Lnt3;", superCall.definingClass)
        assertEquals("<init>", superCall.name)
        val template = screen.methods.single { it.name == "k" }
        assertEquals("Lse4;", template.returnType)
        val call = template.implementation!!.instructions.filterIsInstance<ReferenceInstruction>()
            .map { it.reference }.filterIsInstance<MethodReference>().single()
        assertEquals("Lnl/johninnl/vela/CarUi;", call.definingClass)
        assertEquals("providerTemplate", call.name)
        assertEquals(listOf("Ljava/lang/Object;"), call.parameterTypes)
        val toggle = screen.methods.single { it.name == "nativeToggle" }
        val nativeCalls = toggle.implementation!!.instructions.filterIsInstance<ReferenceInstruction>()
            .map { it.reference }.filterIsInstance<MethodReference>()
        assertEquals(listOf("Ljava/lang/Object;", "Landroidx/car/app/model/Toggle;"), nativeCalls.map { it.definingClass })
        assertEquals(listOf("<init>", "<init>"), nativeCalls.map { it.name })
    }
}
