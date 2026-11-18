package org.ungoogled.patches.maps.ui.speed

import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.io.File
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

class MapsWarningVoiceTest {
    @Test fun pinnedOriginalHasOneFinalDispatchFenceAndKeepsNativeTerminalHandling() {
        val path=System.getenv("MAPS_ORIGINAL_APK");assumeNotNull(path)
        val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.forApi(29))
        val classes=dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
        val original=validateMapsWarningVoice(classes)
        assertEquals(51,original.size)
        val methods=original.mapValues { MutableMethod(it.value) }
        bindMapsNativeVoice(methods)
        val dispatch=methods.getValue("Lbmyo;->b(Ljava/lang/Object;)V")
        val refs=dispatch.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertEquals(0,refs.count { it=="Lbnau;->d(Lbnas;)V" })
        assertEquals(1,refs.count { it=="Lorg/ungoogled/ui/MapsGuidanceCoordinator;->dispatch(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V" })
        assertEquals(19,dispatch.implementation!!.registerCount)
        assertEquals("Lorg/ungoogled/ui/MapsGuidanceCoordinator;->cancelPreparedCallback(Ljava/lang/Object;)Z",refs.first())
        val focusRefs=methods.getValue("Lbmyh;->g(Lbnbc;I)Z").implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertEquals(1,focusRefs.count { it=="Lorg/ungoogled/ui/MapsGuidanceCoordinator;->requestNativeFocus(Landroid/media/AudioManager;Landroid/media/AudioFocusRequest;)I" })
        assertEquals(0,focusRefs.count { it.contains("->m\$1(Landroid/media/AudioManager;Landroid/media/AudioFocusRequest;)I") })
        val terminal=methods.getValue("Lbmzz;->a(Lbnau;)V")
        assertEquals(original.getValue(terminal.toString()).implementation!!.instructions.count()+1,terminal.implementation!!.instructions.count())
        val terminalRefs=terminal.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertEquals("Lorg/ungoogled/ui/MapsGuidanceCoordinator;->terminal(Ljava/lang/Object;Ljava/lang/Object;)V",terminalRefs.first())
        assertEquals(1,terminalRefs.count { it=="Lbnay;->a(Lbnax;Lbnat;)V" })
        assertThrows(IllegalStateException::class.java) {
            validateMapsWarningVoice(classes.map { cls ->
                if(cls.type!="Lbmyo;")cls else com.android.tools.smali.dexlib2.immutable.ImmutableClassDef(
                    cls.type,cls.accessFlags,cls.superclass,cls.interfaces,cls.sourceFile,cls.annotations,
                    cls.fields,cls.methods.map { methods[it.toString()]?:it })
            })
        }
    }
    @Test fun voiceRecoveryRetainsOriginalEligibilityAndQueueWithoutCameraWrites() {
        val path=System.getenv("MAPS_ORIGINAL_APK");assumeNotNull(path)
        val dex=DexFileFactory.loadDexContainer(File(path!!),Opcodes.forApi(29))
        val original=dex.dexEntryNames.asSequence().flatMap { dex.getEntry(it)!!.dexFile.classes.asSequence() }
            .single { it.type=="Lbmon;" }.methods.single { it.toString()=="Lbmon;->u(Lycx;)V" }
        val before=mapsVoiceFingerprint(original)
        val generated=mapsVoiceResumeMethods(original)
        assertEquals(setOf(MAPS_CAN_RESUME_VOICE,MAPS_RESUME_VOICE),generated.map { it.name }.toSet())
        val nativeRefs=original.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }.toSet()
        val all=generated.flatMap { it.implementation!!.instructions.toList() }
        val refs=all.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        for(ref in listOf("Lbudy;->y(Landroid/content/Context;)Z","Lbnby;->d(Lblvb;Lyda;)Lbncc;","Lbnaz;->j(Lbncc;Lbnbc;Lbnay;)Lcom/google/common/util/concurrent/ListenableFuture;","Lbnbc;->c:Lbnbc;")) {
            assertTrue("Recovery must use the actual guarded native voice branch: $ref",ref in nativeRefs)
            assertEquals(1,refs.count { it==ref })
        }
        assertFalse("Recovery cannot write native camera or selected-step state",all.any { it.opcode.toString().uppercase().startsWith("IPUT")||it.opcode.toString().uppercase().startsWith("SPUT") })
        assertFalse(refs.any { it.startsWith("Lbmoi;")||it.startsWith("Lbmml;")||it.startsWith("Lbmmn;")||it.startsWith("Lbmoa;")||it.contains("->u(Lycx;)V")||it.contains("Ljava/util/Optional;") })
        assertTrue(generated.all { it.parameterTypes.isEmpty() })
        assertEquals("Generating recovery must leave the original user-facing inspect action unchanged",before,mapsVoiceFingerprint(original))
    }

}
