package org.ungoogled.patches.maps.car

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import java.io.File
import org.junit.Assert.assertThrows
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import org.junit.Assume.assumeNotNull
import org.junit.Test

class MapsGuidanceComponentTest {
    @Test fun ownedCompactSearchUsesTheUnchangedNativeEditorAndPreservesTheUnownedHostPath() {
        val path=System.getenv("MAPS_CAR_ORIGINAL_APK");assumeNotNull(path)
        val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.forApi(29))
        val classes=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
        val original=classes.getValue("Lrhe;").methods.single { it.name=="G" && it.parameterTypes.isEmpty() && it.returnType=="V" }
        val mutable=MutableMethod(original)
        bindMapsCarSearch({ classes.getValue(it) }) { _,_,_,_ -> mutable }
        val before=original.implementation!!.instructions.toList();val after=mutable.instructions.toList()
        assertEquals(before.size+7,after.size)
        assertEquals("Lrhe;->l:Landroid/view/ViewGroup;",(after[0] as ReferenceInstruction).reference.toString())
        assertEquals("Lpatches/maps/gearslip/NativeCarSearch;->target(Landroid/view/View;)I",(after[1] as ReferenceInstruction).reference.toString())
        val pc=mutableListOf(0);after.forEach { pc.add(pc.last()+it.codeUnits) }
        assertEquals(pc[7],pc[3]+(after[3] as OffsetInstruction).codeOffset)
        val nativePc=before.runningFold(0) { p,instruction -> p+instruction.codeUnits }
        val nativeLocal=nativePc.indexOf(nativePc[2]+(before[2] as OffsetInstruction).codeOffset)
        assertEquals(pc[7+nativeLocal],pc[5]+(after[5] as OffsetInstruction).codeOffset)
        before.forEachIndexed { i,instruction ->
            assertEquals(instruction.opcode,after[i+7].opcode)
            assertEquals((instruction as? ReferenceInstruction)?.reference?.toString(),(after[i+7] as? ReferenceInstruction)?.reference?.toString())
        }
        val owner=classes.getValue("Lrhe;")
        val missing=ImmutableClassDef(owner.type,owner.accessFlags,owner.superclass,owner.interfaces,owner.sourceFile,owner.annotations,owner.fields.filter { it.name!="l" },owner.methods)
        assertThrows(IllegalStateException::class.java) { bindMapsCarSearch({ if(it==owner.type)missing else classes.getValue(it) }) { _,_,_,_ -> mutable } }
    }
    @Test fun onlyTheSearchModelCaptureIsHookedAndItPreservesTheOriginalMethod() {
        val path=System.getenv("MAPS_CAR_ORIGINAL_APK");assumeNotNull(path)
        val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.forApi(29))
        val classes=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
        val changed=mutableMapOf<String,MutableMethod>()
        bindMapsNativeContent({ classes.getValue(it) }) { owner,name,parameters,result ->
            val key="$owner->$name(${parameters.joinToString("")})$result"
            changed.getOrPut(key) { MutableMethod(classes.getValue(owner).methods.single { it.name==name&&it.parameterTypes.map(CharSequence::toString)==parameters&&it.returnType==result }) }
        }
        assertEquals(setOf("Lqca;->a(Lbhhr;)Ljava/lang/Object;","Lqbc;->a(Lbhhr;)Ljava/lang/Object;","Lsnk;->a(Lbhhr;)Ljava/lang/Object;"),changed.keys)
        for(owner in listOf("Lqca;","Lqbc;","Lsnk;")) {
            // Switch payloads and their alignment NOPs are regenerated when a method is edited; compare real instructions.
            val original=classes.getValue(owner).methods.single { it.name=="a"&&it.parameterTypes.map(CharSequence::toString)==listOf("Lbhhr;")&&it.returnType=="Ljava/lang/Object;" }.implementation!!.instructions.filterNot { it.opcode.format.isPayloadFormat||it.opcode==Opcode.NOP }
            val after=changed.getValue("$owner->a(Lbhhr;)Ljava/lang/Object;").instructions.filterNot { it.opcode.format.isPayloadFormat||it.opcode==Opcode.NOP }
            val firstDiff=original.indices.firstOrNull { it+1>=after.size||original[it].opcode!=after[it+1].opcode }
            assertEquals("$owner first difference at $firstDiff: original ${firstDiff?.let { i -> original.subList(maxOf(0,i-2),minOf(original.size,i+3)).map { it.opcode } }} after ${firstDiff?.let { i -> after.subList(maxOf(0,i-1),minOf(after.size,i+4)).map { it.opcode } }}",original.size+1,after.size)
            assertEquals("Lpatches/maps/gearslip/NativeCarContent;->capture(Ljava/lang/Object;)V",(after.first() as ReferenceInstruction).reference.toString())
            original.forEachIndexed { index,instruction ->
                assertEquals(instruction.opcode,after[index+1].opcode)
                assertEquals((instruction as? ReferenceInstruction)?.reference?.toString(),(after[index+1] as? ReferenceInstruction)?.reference?.toString())
            }
        }
    }
    @Test fun privateTokenGuardExcludesBothUnsupportedClientsAndPreservesOtherConnectionPaths() {
        val path=System.getenv("MAPS_CAR_ORIGINAL_APK");assumeNotNull(path)
        val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.forApi(29))
        val original=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type=="Lbeop;" }.methods.single { it.name=="e"&&it.parameterTypes.isEmpty()&&it.returnType=="V" }
        val before=original.implementation!!.instructions.toList();val mutable=MutableMethod(original)
        guardMapsPrivateCarToken(mutable);val after=mutable.instructions.toList()
        assertEquals(before.size+6,after.size)
        assertEquals("Lbeop;->d:Lbeqa;",(after[0] as ReferenceInstruction).reference.toString())
        assertEquals("Lbeqt;",(after[1] as ReferenceInstruction).reference.toString())
        assertEquals("Lpxt;",(after[3] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.IF_NEZ,after[2].opcode);assertEquals(Opcode.IF_EQZ,after[4].opcode);assertEquals(Opcode.RETURN_VOID,after[5].opcode)
        val pc=mutableListOf(0);after.forEach { pc.add(pc.last()+it.codeUnits) }
        assertEquals(pc[5],pc[2]+(after[2] as OffsetInstruction).codeOffset)
        assertEquals(pc[6],pc[4]+(after[4] as OffsetInstruction).codeOffset)
        before.forEachIndexed { index,instruction ->
            assertEquals(instruction.opcode,after[index+6].opcode)
            assertEquals((instruction as? ReferenceInstruction)?.reference?.toString(),(after[index+6] as? ReferenceInstruction)?.reference?.toString())
        }
        assertTrue(after.drop(6).isNotEmpty())
    }
    @Test fun suppliedOriginalExposesTheConcreteCachedComponentAndCurrentListener() {
        val path = System.getenv("MAPS_CAR_ORIGINAL_APK"); assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(29))
        val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
        validateMapsGuidanceComponent { classes.getValue(it) }
        validateMapsNavigationProvider { classes.getValue(it) }
        validateMapsNativeContent { classes.getValue(it) }
        // An old interface can still exist while the actual application no longer
        // implements it. Reject that mismatch before emitting another broken APK.
        val app = classes.getValue("Lcom/google/android/apps/gmm/base/app/GoogleMapsApplication;")
        val disconnected = ImmutableClassDef(app.type, app.accessFlags, "Landroid/app/Application;",
            app.interfaces, app.sourceFile, app.annotations, app.fields, app.methods)
        assertThrows(IllegalStateException::class.java) {
            validateMapsGuidanceComponent { if (it == app.type) disconnected else classes.getValue(it) }
        }
        val binder = classes.getValue("Llvp;")
        val missingDispatch = ImmutableClassDef(binder.type, binder.accessFlags, binder.superclass,
            binder.interfaces, binder.sourceFile, binder.annotations, binder.fields, binder.methods.filter { it.name != "y" })
        assertThrows(IllegalStateException::class.java) {
            validateMapsNavigationProvider { if (it == binder.type) missingDispatch else classes.getValue(it) }
        }
        val action=classes.getValue("Lqcr;")
        val missingClick=ImmutableClassDef(action.type,action.accessFlags,action.superclass,action.interfaces,action.sourceFile,action.annotations,action.fields,action.methods.filter { it.name!="j" })
        assertThrows(IllegalStateException::class.java){validateMapsNativeContent { if(it==action.type)missingClick else classes.getValue(it) }}
    }
}
