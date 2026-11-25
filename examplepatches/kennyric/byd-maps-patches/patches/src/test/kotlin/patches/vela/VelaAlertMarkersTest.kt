package patches.vela

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

/** Supply VELA_ORIGINAL_APK locally; the publisher artifact is not a CI fixture. */
class VelaAlertMarkersTest {
    private fun classes(): List<ClassDef> {
        val path = System.getenv("VELA_ORIGINAL_APK"); assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.toList()
    }
    private fun refs(m: Method) = m.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
    private fun replace(classes: List<ClassDef>, method: Method): ClassDef {
        val owner = classes.single { it.type == method.definingClass }
        return ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces, owner.sourceFile,
            owner.annotations, owner.fields, owner.methods.map { if (it.toString() == method.toString()) method else it })
    }
    private fun roundtrip(classes: List<ClassDef>, method: Method): Method {
        val pool = DexPool(Opcodes.forApi(26)); pool.internClass(replace(classes, method))
        val memory = MemoryDataStore()
        val bytes = try { pool.writeTo(memory); memory.data } finally { memory.close() }
        return DexBackedDexFile.fromInputStream(Opcodes.forApi(26), ByteArrayInputStream(bytes)).classes.single()
            .methods.single { it.toString() == method.toString() }
    }

    @Test fun styleSetupEndsInTheMarkerHookAfterVelaInstalledItsOwnLayers() {
        val classes = classes()
        val original = validateVelaAlertMarkers(classes)
        val changed = MutableMethod(original); bindVelaPhoneMarkers(changed)
        val assembled = roundtrip(classes, changed)
        val code = assembled.implementation!!.instructions.toList()
        assertEquals(65, assembled.implementation!!.registerCount)
        assertEquals(refs(original), refs(assembled).filterNot { it == VELA_MARKER_STYLE_HOOK })
        val hook = code.withIndex().single { (it.value as? ReferenceInstruction)?.reference?.toString() == VELA_MARKER_STYLE_HOOK }
        assertEquals(Opcode.INVOKE_STATIC_RANGE, hook.value.opcode)
        val range = hook.value as RegisterRangeInstruction
        assertEquals("p0 (the Style) of a static 65-register method", 63, range.startRegister); assertEquals(1, range.registerCount)
        assertEquals(Opcode.RETURN_VOID, code[hook.index + 1].opcode)
        assertEquals(1, code.count { it.opcode == Opcode.RETURN_VOID })
        assertTrue("Every Vela source/layer install precedes the hook", code.take(hook.index).count { (it as? ReferenceInstruction)?.reference?.toString() == "Lorg/maplibre/android/maps/l;->h(Lorg/maplibre/android/style/sources/Source;)V" } > 0)
    }

    @Test fun reapplicationAndChangedRenamedMembersFailBeforeMutation() {
        val classes = classes()
        val once = MutableMethod(validateVelaAlertMarkers(classes)); bindVelaPhoneMarkers(once)
        val patched = velaFingerprint(once)
        assertThrows(IllegalStateException::class.java) { bindVelaPhoneMarkers(once) }
        assertEquals(patched, velaFingerprint(once))
        // A renamed Style member whose body changed (e.g. a different R8 assignment) must not be trusted.
        val style = classes.single { it.type == "Lorg/maplibre/android/maps/l;" }
        val addLayer = style.methods.single { it.toString() == "Lorg/maplibre/android/maps/l;->d(Lorg/maplibre/android/style/layers/Layer;)V" }
        val body = addLayer.implementation!!
        val swapped = ImmutableMethod(addLayer.definingClass, addLayer.name, addLayer.parameters, addLayer.returnType,
            addLayer.accessFlags, addLayer.annotations, addLayer.hiddenApiRestrictions,
            ImmutableMethodImplementation(body.registerCount, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList()))
        val changed = replace(classes, swapped)
        assertThrows(IllegalStateException::class.java) { validateVelaAlertMarkers(classes.map { if (it === style) changed else it }) }
    }
}
