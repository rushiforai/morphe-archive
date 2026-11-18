package patches.vela

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

class VelaWarningVoiceTest {
    @Test fun pinnedOriginalVoiceAndFocusHooksPreserveUntaggedListenerBodies() {
        val path=System.getenv("VELA_ORIGINAL_APK");assumeNotNull(path)
        val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.forApi(26))
        val classes=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
        val originals=validateVelaWarningVoice(classes)
        assertEquals(23,originals.size)
        val methods=originals.mapValues { MutableMethod(it.value) }
        bindVelaWarningVoice(methods)
        val speaker="Lnl/johninnl/vela/VelaWarningSpeaker;"
        fun refs(key:String)=methods.getValue(key).implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertEquals(1,refs("Lwy4;->g()V").count { it=="Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioFocusRequest;)I" })
        assertEquals(1,refs("Lwy4;->g()V").count { it=="$speaker->focusResult(Ljava/lang/Object;I)V" })
        assertEquals("$speaker->nativeStop(Ljava/lang/Object;)V",refs("Lwy4;->n()V").first())
        assertEquals("$speaker->nativeSpeech(Ljava/lang/Object;)V",refs("Lwy4;->l(Ljava/lang/String;Z)V").first())
        for(name in listOf("onDone","onError","onStop")) {
            val key=originals.keys.single { it.startsWith("Lvy4;->$name(") }
            val original=originals.getValue(key);val changed=methods.getValue(key)
            val code=changed.implementation!!.instructions.toList()
            if(name=="onStop") {
                assertEquals("$speaker->utteranceStopped(Ljava/lang/Object;Ljava/lang/String;Z)Z",(code[0] as ReferenceInstruction).reference.toString())
                assertEquals(3,(code[0] as RegisterRangeInstruction).registerCount)
                assertEquals(1,(code[0] as RegisterRangeInstruction).startRegister)
                assertEquals(4,changed.implementation!!.registerCount)
            }
            assertEquals(Opcode.IF_EQZ,code[2].opcode)
            assertEquals(Opcode.RETURN_VOID,code[3].opcode)
            val suffix=ImmutableMethod(original.definingClass,original.name,original.parameters,original.returnType,
                original.accessFlags,original.annotations,original.hiddenApiRestrictions,
                ImmutableMethodImplementation(original.implementation!!.registerCount,code.drop(4),emptyList(),emptyList()))
            assertEquals(velaFingerprint(original),velaFingerprint(suffix))
        }
        // Reapplying the patch must fail before any second hook is inserted.
        assertThrows(IllegalStateException::class.java) {
            validateVelaWarningVoice(classes.map { cls ->
                if(cls.type!="Lvy4;")cls else com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                    cls.type,cls.accessFlags,cls.superclass,cls.interfaces,cls.sourceFile,cls.annotations,
                    cls.fields,cls.methods.map { methods[it.toString()]?:it })
            })
        }
    }
}
