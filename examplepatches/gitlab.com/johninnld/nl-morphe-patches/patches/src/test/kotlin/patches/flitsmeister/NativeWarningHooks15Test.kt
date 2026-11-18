package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.io.ByteArrayInputStream
import java.io.File
import java.security.MessageDigest
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test

class NativeWarningHooks15Test {
    private val signatures=setOf(
        "Lfc0;->J(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;Z)V",
        "Lfc0;->P(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V",
        "Lfc0;->x(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;)V",
        "Lfci;->b(Lnl/flitsmeister/earlywarning/model/EarlyWarningTypeEnum;Lnl/flitsmeister/fmcore/models/data/reports/EarlyWarningReport;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;Ljava/lang/String;ZLs39;)V",
        "Lfci;->l(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;ZZLjava/lang/String;Ls39;)V",
        "Llh7\$c;->onEarlyWarningNotificationUpdate(Landroid/location/Location;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;)V",
        "Lpz2\$c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
        "Lpz2;->J(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z",
        "Lpz2;->K(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z",
        "Lpz2;->L(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z",
        "Lxl\$c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
        "Lxl;->i(Landroid/content/Context;Lnl/flitsmeister/fmcore/models/data/earlywarnings/EarlyWarning;Z)V",
        "Lyy2;->a(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V",
        "Lyy2;->b(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V",
        "Lyy2;->e(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V",
    )
    private val notificationSignature="Llh7\$c;->onEarlyWarningNotificationUpdate(Landroid/location/Location;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;)V"
    private val featureUiHash="983926e18e26b9579ba63245e48638dd02d555699c39f78f5164b9139576f3f3"

    private fun original():List<ClassDef> {
        val path=System.getenv("FLITSMEISTER15_ORIGINAL_APK")?:System.getenv("FLITSMEISTER15_STARTUP_APK");assumeNotNull(path)
        val file=File(path!!)
        val hash=MessageDigest.getInstance("SHA-256").digest(file.readBytes()).joinToString(""){"%02x".format(it.toInt() and 255)}
        assertTrue("Use either supplied FM15.0/1289 original base, never a patched cache",hash in setOf("09d01a21ae058c9c9a75dcd0714f39ddbd37b63b68259692675f19b1a39a66ea","7668b9d93a309520184a01194aa47dde40a05b0e74e96a2237c428ed7a613bf0"))
        val dex=DexFileFactory.loadDexContainer(file,Opcodes.forApi(29))
        return dex.dexEntryNames.flatMap{dex.getEntry(it)!!.dexFile.classes}
    }
    private fun roots(classes:Iterable<ClassDef>):Map<String,Method> = classes.flatMap{it.methods}.filter{it.toString() in signatures}.associateBy{it.toString()}
    private fun nativeRefs(method:Method)=method.implementation!!.instructions.mapNotNull{(it as? ReferenceInstruction)?.reference?.toString()}.filterNot{it.startsWith("Lnl/johninnl/flitsmeister/NativeWarnings;->")}
    private fun captures(method:Method,name:String)=method.implementation!!.instructions.withIndex().filter{(it.value as? ReferenceInstruction)?.reference?.toString()?.startsWith("Lnl/johninnl/flitsmeister/NativeWarnings;->$name(")==true}
    private fun assemble(classes:List<ClassDef>,changed:Map<String,MutableMethod>):Map<String,Method>{
        val pool=DexPool(Opcodes.forApi(29));val owners=changed.values.map{it.definingClass}.toSet()
        classes.filter{it.type in owners}.forEach{cls->pool.internClass(ImmutableClassDef(cls.type,cls.accessFlags,cls.superclass,cls.interfaces,cls.sourceFile,cls.annotations,
            cls.fields,cls.methods.map{changed[it.toString()]?:it}))}
        val store=MemoryDataStore()
        val bytes=try{pool.writeTo(store);store.data}finally{store.close()}
        return roots(DexBackedDexFile.fromInputStream(Opcodes.forApi(29),ByteArrayInputStream(bytes)).classes)
    }

    @Test fun all15OriginalRootsTransformWithoutLosingNativeCallsAndRoundTripThroughDexAssembly(){
        val classes=original();val originals=roots(classes);assertEquals(15,originals.size)
            val changed=originals.mapValues{MutableMethod(it.value)}
        bindFlitsmeisterNativeWarnings(changed)
        // Regression: VRI publication follows a wrapper allocation/constructor, not getter+2.
        for(name in listOf("a","b","e")){
            val method=changed.getValue("Lyy2;->$name(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V")
            val hook=captures(method,"vriState").single();val code=method.implementation!!.instructions.toList()
            assertEquals(Opcode.INVOKE_STATIC_RANGE,hook.value.opcode)
            val value=(hook.value as RegisterRangeInstruction).startRegister
            val publish=code[hook.index+1] as FiveRegisterInstruction
            assertEquals(value,publish.registerD)
            assertEquals("Las7;->a(Ljava/lang/Object;)V",(publish as ReferenceInstruction).reference.toString())
            assertTrue(code.take(hook.index).any{(it as? ReferenceInstruction)?.reference?.toString()?.contains("CitsSpeedAdviceWrapper;-><init>(")==true})
        }
        for(name in listOf("J","L")){
            val method=changed.getValue("Lpz2;->$name(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)Z")
            val code=method.implementation!!.instructions.toList();val source=captures(method,"citsSource").single().index
            assertTrue((code[source+1] as ReferenceInstruction).reference.toString().startsWith("Lq71;->c("))
            assertEquals(Opcode.MOVE_RESULT_OBJECT,code[source+2].opcode)
            assertEquals(captures(method,"citsModel").single().index,source+3)
        }
        val notification=changed.getValue("Llh7\$c;->onEarlyWarningNotificationUpdate(Landroid/location/Location;Lnl/flitsmeister/earlywarning/model/EarlyWarningNotification;)V")
        assertEquals(2,captures(notification,"notificationState").size)
        assertEquals(1,captures(changed.getValue("Lpz2\$c;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;"),"earlyRemoved").size)
        assertEquals(1,captures(changed.getValue("Lyy2;->a(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V"),"impact").size)
        assertEquals(1,captures(changed.getValue("Lyy2;->e(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V"),"impactUpdate").size)
        assertEquals(1,captures(changed.getValue("Lyy2;->b(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V"),"impactRemoved").size)
        originals.forEach{(signature,method)->assertEquals("Preserve every original reference in $signature",nativeRefs(method),nativeRefs(changed.getValue(signature)))}

        val assembled=assemble(classes,changed)
        assertEquals(originals.keys,assembled.keys)
        var checkedInvokes=0
        assembled.forEach{(signature,method)->
            assertEquals("Assembly preserves all native references in $signature",nativeRefs(originals.getValue(signature)),nativeRefs(method))
            method.implementation!!.instructions.forEach{instruction->
                val reference=(instruction as? ReferenceInstruction)?.reference
                if(instruction.opcode.toString().startsWith("INVOKE_")&&reference is MethodReference){
                    checkedInvokes++
                    val words=reference.parameterTypes.sumOf{if(it.toString()=="J"||it.toString()=="D")2 else 1}+
                        if(instruction.opcode==Opcode.INVOKE_STATIC||instruction.opcode==Opcode.INVOKE_STATIC_RANGE)0 else 1
                    val actual=when(instruction){is RegisterRangeInstruction->instruction.registerCount;is FiveRegisterInstruction->instruction.registerCount;else->error("Unknown invoke format")}
                    assertEquals("Invocation word count in $signature: $reference",words,actual)
                    if(instruction is RegisterRangeInstruction)assertTrue(instruction.startRegister+instruction.registerCount<=method.implementation!!.registerCount)
                }
            }
        }
        assertTrue("Invocation checks must not be vacuous",checkedInvokes>100)
    }

    @Test fun aRepeatedCameraReturnsAfterOneMinuteAndSilentSignalsAreReported(){
        val classes=original();val changed=roots(classes).mapValues{MutableMethod(it.value)}
        bindFlitsmeisterNativeWarnings(changed)
        val alert=changed.getValue("Lfc0;->J(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;Z)V").implementation!!.instructions.toList()
        val window=alert.withIndex().single{(it.value as? ReferenceInstruction)?.reference?.toString()=="Lye7;->g(ILaf7;)J"}
        val minutes=alert[window.index-1]
        assertEquals(Opcode.CONST_4,minutes.opcode);assertEquals(1L,(minutes as WideLiteralInstruction).wideLiteral)
        assertEquals("The window takes the one-minute literal",(minutes as OneRegisterInstruction).registerA,(window.value as FiveRegisterInstruction).registerC)
        assertEquals("Laf7;->q:Laf7;",(alert[window.index-2] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT_WIDE,alert[window.index+1].opcode)
        val regular=changed.getValue("Lfci;->l(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;ZZLjava/lang/String;Ls39;)V")
        val silent=captures(regular,"noSound").single();val code=regular.implementation!!.instructions.toList()
        assertEquals(Opcode.IF_EQZ,code[silent.index+1].opcode)
        assertEquals("Lfci;->f()Lkdi;",(code[silent.index+2] as ReferenceInstruction).reference.toString())
        val registers=silent.value as FiveRegisterInstruction
        assertEquals(listOf(11,12),listOf(registers.registerC,registers.registerD))
        val assembled=assemble(classes,changed)
        assertEquals(1,captures(assembled.getValue("Lfci;->l(Lnl/flitsmeister/fmcore/data/model/reports/BaseReport;ZZLjava/lang/String;Ls39;)V"),"noSound").size)
    }

    @Test fun fmsChosenSoundAndItsOnScreenSetAreObservedAtTheirJoins(){
        val classes=original()
        val wanted=setOf("Ldci;->invoke(Ljava/lang/Object;)Ljava/lang/Object;","Lwd6;->z(Lma1;)V","Lwd6;->A(Lma1;)V")
        val originals=classes.flatMap{it.methods}.filter{it.toString() in wanted}.associateBy{it.toString()};assertEquals(3,originals.size)
        val changed=originals.mapValues{MutableMethod(it.value)}
        bindFlitsmeisterSoundAndVisibility15(changed.getValue("Ldci;->invoke(Ljava/lang/Object;)Ljava/lang/Object;"),changed.getValue("Lwd6;->z(Lma1;)V"),changed.getValue("Lwd6;->A(Lma1;)V"))
        val sound=changed.getValue("Ldci;->invoke(Ljava/lang/Object;)Ljava/lang/Object;")
        val hook=captures(sound,"sound").single();val code=sound.implementation!!.instructions.toList()
        assertEquals(listOf(2,3,6),(hook.value as FiveRegisterInstruction).let{listOf(it.registerC,it.registerD,it.registerE)})
        assertEquals("Ldci;->q:Ls39;",(code[hook.index+1] as ReferenceInstruction).reference.toString())
        assertEquals(0,captures(changed.getValue("Lwd6;->z(Lma1;)V"),"visible").single().index)
        assertEquals(0,captures(changed.getValue("Lwd6;->A(Lma1;)V"),"hidden").single().index)
        originals.forEach{(signature,method)->assertEquals("Preserve every original reference in $signature",nativeRefs(method),nativeRefs(changed.getValue(signature)))}
        val pool=DexPool(Opcodes.forApi(29));val owners=changed.values.map{it.definingClass}.toSet()
        classes.filter{it.type in owners}.forEach{cls->pool.internClass(ImmutableClassDef(cls.type,cls.accessFlags,cls.superclass,cls.interfaces,cls.sourceFile,cls.annotations,cls.fields,cls.methods.map{changed[it.toString()]?:it}))}
        val store=MemoryDataStore();val bytes=try{pool.writeTo(store);store.data}finally{store.close()}
        val assembled=DexBackedDexFile.fromInputStream(Opcodes.forApi(29),ByteArrayInputStream(bytes)).classes.flatMap{it.methods}.filter{it.toString() in wanted}
        assertEquals(3,assembled.size)
        assertThrows("A second application is refused",IllegalStateException::class.java){bindFlitsmeisterSoundAndVisibility15(sound,changed.getValue("Lwd6;->z(Lma1;)V"),changed.getValue("Lwd6;->A(Lma1;)V"))}
    }

    @Test fun aChangedRootOrSecondApplicationFailsBeforeAnyOtherMethodIsMutated(){
        val originals=roots(original());val changed=originals.mapValues{MutableMethod(it.value)}
        val altered=changed.getValue("Lyy2;->a(Lbemobile/cits/sdk/core/model/response/generalObjects/BaseEvent;)V")
        altered.replaceInstruction(0,"nop")
        val before=changed.mapValues{flitsmeisterWarningFingerprint(it.value)}
        assertThrows(IllegalStateException::class.java){bindFlitsmeisterNativeWarnings(changed)}
        assertEquals(before,changed.mapValues{flitsmeisterWarningFingerprint(it.value)})
        val valid=originals.mapValues{MutableMethod(it.value)};bindFlitsmeisterNativeWarnings(valid)
        val after=valid.mapValues{flitsmeisterWarningFingerprint(it.value)}
        assertThrows(IllegalStateException::class.java){bindFlitsmeisterNativeWarnings(valid)}
        assertEquals(after,valid.mapValues{flitsmeisterWarningFingerprint(it.value)})
    }

    @Test fun theExactExistingUnlockProFeatureUiEditRemainsSupportedAndAnAlteredEditIsRejected(){
        val classes=original();val originals=roots(classes);val selected=originals.mapValues{MutableMethod(it.value)}
        val notification=selected.getValue(notificationSignature)
        val originalCode=notification.implementation!!.instructions.toList()
        assertEquals("Llp0;->k()Z",(originalCode[11] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT,originalCode[12].opcode);assertEquals(0,(originalCode[12] as OneRegisterInstruction).registerA)
        // Exactly the instruction emitted by FeatureUiPatch's validated MethodPlan.
        notification.addInstruction(13,"const/16 v0, 0x1")
        assertEquals(featureUiHash,flitsmeisterWarningFingerprint(notification))
        bindFlitsmeisterNativeWarnings(selected)
        assertEquals(2,captures(notification,"notificationState").size)
        val assembled=assemble(classes,selected)
        val kept=assembled.getValue(notificationSignature).implementation!!.instructions.toList()[13]
        assertEquals(Opcode.CONST_16,kept.opcode);assertEquals(0,(kept as OneRegisterInstruction).registerA);assertEquals(1L,(kept as WideLiteralInstruction).wideLiteral)
        originals.forEach{(signature,method)->assertEquals(nativeRefs(method),nativeRefs(assembled.getValue(signature)))}

        val altered=originals.mapValues{MutableMethod(it.value)}
        altered.getValue(notificationSignature).addInstruction(13,"const/16 v0, 0x2")
        val before=altered.mapValues{flitsmeisterWarningFingerprint(it.value)}
        assertThrows(IllegalStateException::class.java){bindFlitsmeisterNativeWarnings(altered)}
        assertEquals(before,altered.mapValues{flitsmeisterWarningFingerprint(it.value)})
    }
}
