package patches.vela

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

/** Supply VELA_ORIGINAL_APK locally; the copyrighted publisher artifact is not a CI fixture. */
class VelaHookGuardTest {
    @Test fun originalIsAcceptedButChangedOperandsAndUnknownConsumersFailBeforeMutation() {
        val path = System.getenv("VELA_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }.toList()
        assertEquals(28, validateVelaContracts(classes).size)
        validateVelaHostAbi(classes)

        // A same-width field substitution in giant MapScreen must invalidate the original guard.
        val owner = classes.single { it.type == "Lq72;" }
        val original = owner.methods.single { it.name == "p" && it.returnType == "V" }
        val body = original.implementation!!
        val instructions = body.instructions.toMutableList()
        val register = (instructions[3137] as OneRegisterInstruction).registerA
        instructions[3137] = ImmutableInstruction21c(Opcode.SGET_OBJECT, register,
            ImmutableFieldReference("Ltw0;", "a", "Lu13;"))
        val changed = ImmutableMethod(original.definingClass, original.name, original.parameters,
            original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(body.registerCount, instructions, body.tryBlocks, body.debugItems))
        val changedOwner = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces,
            owner.sourceFile, owner.annotations, owner.fields, owner.methods.map { if (it == original) changed else it })
        assertThrows(IllegalStateException::class.java) {
            validateVelaContracts(classes.map { if (it === owner) changedOwner else it })
        }

        // New Flock consumers must be reviewed explicitly rather than accidentally left unsuppressed.
        val unknown = ImmutableMethod("LUnknownFlockConsumer;", "read", emptyList(), "V", 9,
            emptySet(), emptySet(), ImmutableMethodImplementation(1, listOf(
                ImmutableInstruction21c(Opcode.SGET_OBJECT, 0, ImmutableFieldReference("Lpw0;", "a", "Lu13;")),
                ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList()))
        val extra: ClassDef = ImmutableClassDef("LUnknownFlockConsumer;", 1, "Ljava/lang/Object;",
            emptyList(), VELA_MAP_ID, emptySet(), emptyList(), listOf(unknown))
        assertThrows(IllegalStateException::class.java) { validateVelaContracts(classes + extra) }
    }
    @Test fun externalSpeedJoinsOnlyAfterNativeHideAndPreferenceGates() {
        val path = System.getenv("VELA_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val original = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
            .single { it.type == "Lq72;" }.methods.single {
                it.toString() == "Lq72;->Q(Le82;ZZLjava/lang/Double;ZFFLr11;Le50;I)V"
            }
        val corner = MutableMethod(original)
        extendVelaSpeedGate(corner)
        val code = corner.implementation!!.instructions.toList()
        val addresses = code.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val byAddress = addresses.withIndex().associate { it.value to it.index }
        val start = code.indices.single { code[it].opcode == Opcode.IF_NEZ && (code[it] as OneRegisterInstruction).registerA == 29 }
        for (bits in 0 until 512) {
            fun bit(at: Int) = bits and (1 shl at) != 0
            val hide = bit(0); val enabled = bit(1); val nav = bit(2); val stopped = bit(3)
            val ended = bit(4); val speed = bit(5); val force = bit(6); val replay = bit(7); val external = bit(8)
            val registers = mutableMapOf(29 to hide, 11 to nav, 30 to force, 17 to replay)
            var result = false
            var pc = start
            var shown: Boolean? = null
            repeat(60) {
                if (shown != null) return@repeat
                val instruction = code[pc]
                val ref = (instruction as? ReferenceInstruction)?.reference?.toString().orEmpty()
                fun branch() { pc = byAddress.getValue(addresses[pc] + (instruction as OffsetInstruction).codeOffset) }
                when (instruction.opcode) {
                    Opcode.CONST -> {
                        shown = when ((instruction as NarrowLiteralInstruction).narrowLiteral) {
                            -1203496955 -> true
                            -1202707974 -> false
                            else -> error("Unexpected gate constant")
                        }
                    }
                    Opcode.CONST_4 -> { registers[(instruction as OneRegisterInstruction).registerA] = (instruction as NarrowLiteralInstruction).narrowLiteral != 0; pc++ }
                    Opcode.SGET_OBJECT -> { assertEquals("Lc54;->a:Lu13;", ref); pc++ }
                    Opcode.INVOKE_STATIC -> { assertEquals("Lnl/johninnl/vela/TelemetryRuntime;->showSpeed(Z)Z", ref); result = external || registers.getValue(3); pc++ }
                    Opcode.INVOKE_VIRTUAL -> { result = if (ref == "Lu13;->getValue()Ljava/lang/Object;") enabled else registers.getValue(3); pc++ }
                    Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_OBJECT -> { registers[(instruction as OneRegisterInstruction).registerA] = result; pc++ }
                    Opcode.CHECK_CAST -> pc++
                    Opcode.IGET_BOOLEAN -> { registers[3] = when (ref) { "Le82;->i2:Z" -> stopped; "Le82;->J0:Z" -> ended; else -> error(ref) }; pc++ }
                    Opcode.IGET_OBJECT -> { assertEquals("Le82;->j:Ljava/lang/Float;", ref); registers[3] = speed; pc++ }
                    Opcode.IF_NEZ -> if (registers.getValue((instruction as OneRegisterInstruction).registerA)) branch() else pc++
                    Opcode.IF_EQZ -> if (!registers.getValue((instruction as OneRegisterInstruction).registerA)) branch() else pc++
                    Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32 -> branch()
                    else -> error("Unexpected gate instruction ${instruction.opcode}")
                }
            }
            assertEquals("Gate combination $bits", !hide && enabled && ((nav && !stopped && !ended && speed) || force || replay || external), shown)
        }
    }

    @Test fun compactCarAndNativeLifecycleBindingsKeepTheirOriginalBoundaries() {
        val path = System.getenv("VELA_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
        fun method(owner: String, name: String) = MutableMethod(classes.single { it.type == owner }.methods.single { it.name == name })
        fun references(method: MutableMethod) = method.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }

        val car = method("Lcw;", "g")
        val originalCarHash = velaFingerprint(car)
        interceptVelaCarSpeed(car)
        val carCode = car.implementation!!.instructions.toList()
        assertEquals(24, car.implementation!!.registerCount)
        assertEquals("Lnl/johninnl/vela/CarUi;->compact(Ljava/lang/Object;Landroid/graphics/Canvas;)Z", (carCode[0] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.IF_EQZ, carCode[2].opcode)
        assertEquals(Opcode.RETURN_VOID, carCode[3].opcode)
        val nativeSuffix = ImmutableMethod(car.definingClass, car.name, car.parameters, car.returnType,
            car.accessFlags, car.annotations, car.hiddenApiRestrictions,
            ImmutableMethodImplementation(24, carCode.drop(4), emptyList(), emptyList()))
        assertEquals(originalCarHash, velaFingerprint(nativeSuffix)) // no old wrappers or double drawing

        val create = method("Lapp/vela/service/NavigationService;", "onCreate")
        val destroy = method("Lapp/vela/service/NavigationService;", "onDestroy")
        bindVelaNavigationService(create, destroy)
        val activeCall = "Lnl/johninnl/vela/TelemetryRuntime;->setNavigationActive(Z)V"
        assertEquals(listOf("Landroid/app/Service;->onCreate()V", activeCall), references(create).filter { it.endsWith("->onCreate()V") || it == activeCall })
        assertEquals(Opcode.CONST_4, destroy.implementation!!.instructions.first().opcode)
        assertEquals(0, (destroy.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(activeCall, (destroy.implementation!!.instructions.elementAt(1) as ReferenceInstruction).reference.toString())

        val session = method("Lxo2;", "<init>")
        bindVelaNavSession(session)
        val sessionCode = session.implementation!!.instructions.toList()
        assertEquals(19, session.implementation!!.registerCount)
        assertEquals("Lxo2;->f:Lcg3;", (sessionCode[29] as ReferenceInstruction).reference.toString())
        assertEquals("Lnl/johninnl/vela/TelemetryRuntime;->bindNavSession(Ljava/lang/Object;)V", (sessionCode[sessionCode.size - 2] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_VOID, sessionCode.last().opcode)
    }

    @Test fun rawPhoneCarDemoAndReplaySamplesPrecedeDerivedNativeValues() {
        val path = System.getenv("VELA_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
        fun original(owner: String, name: String) = classes.single { it.type == owner }.methods.single { it.name == name }
        val sample = "Lnl/johninnl/vela/TelemetryRuntime;->nativeSample(Landroid/location/Location;)V"
        for ((owner, name) in listOf("Ltd2;" to "e", "Lal2;" to "e", "Lvk2;" to "e", "Lz4;" to "a")) {
            val host = original(owner, name)
            val mutable = MutableMethod(host)
            bindVelaRawLocation(mutable)
            val code = mutable.implementation!!.instructions.toList()
            val at = if (owner == "Lz4;") 0 else 3
            assertEquals(host.implementation!!.registerCount, mutable.implementation!!.registerCount)
            assertEquals(sample, (code[at] as ReferenceInstruction).reference.toString())
            if (at == 3) {
                assertEquals(Opcode.CHECK_CAST, code[2].opcode)
                assertEquals("Landroid/location/Location;", (code[2] as ReferenceInstruction).reference.toString())
            }
            fun timeWrites(instructions: Iterable<com.android.tools.smali.dexlib2.iface.instruction.Instruction>) =
                instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
                    .filter { it.contains("Location;->setElapsedRealtimeNanos(") || it.contains("Location;->setTime(") }
            assertEquals(timeWrites(host.implementation!!.instructions), timeWrites(code))
            assertEquals(1, code.count { (it as? ReferenceInstruction)?.reference?.toString() == sample })
        }
        val provider = MutableMethod(original("Lyw1;", "<init>"))
        bindVelaLocationProvider(provider)
        val code = provider.implementation!!.instructions.toList()
        assertEquals("Lnl/johninnl/vela/TelemetryRuntime;->bindLocationProvider(Ljava/lang/Object;)V", (code[code.size - 2] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)
    }

    @Test fun compactPhoneRetainsNativeModifierAndRestartsWithOriginalFallbackLimit() {
        val path = System.getenv("VELA_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val original = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
            .single { it.type == "Lq72;" }.methods.single { it.name == "x0" }
        val speed = MutableMethod(original)
        interceptVelaPhoneSpeed(speed)
        val code = speed.implementation!!.instructions.toList()
        assertEquals(32, speed.implementation!!.registerCount)
        assertEquals("Landroidx/compose/ui/layout/a;->d(Llg2;Lkotlin/jvm/functions/Function1;)Llg2;", (code[75] as ReferenceInstruction).reference.toString())
        assertEquals(16, (code[76] as OneRegisterInstruction).registerA)
        assertEquals("Lnl/johninnl/vela/NativeUi;->compactWidget(Ljava/lang/Object;Ljava/lang/Object;)Z", (code[78] as ReferenceInstruction).reference.toString())
        val addresses = code.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val branch = 80
        assertEquals(Opcode.IF_NEZ, code[branch].opcode)
        val target = addresses.indexOf(addresses[branch] + (code[branch] as OffsetInstruction).codeOffset)
        assertEquals(Opcode.MOVE_OBJECT_FROM16, code[target].opcode)
        assertEquals(2, (code[target] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerA)
        assertEquals(27, (code[target] as com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction).registerB)
        assertEquals("Le50;->u()Lhh3;", (code[target+1] as ReferenceInstruction).reference.toString())
        assertEquals(1, code.count { (it as? ReferenceInstruction)?.reference?.toString()?.startsWith("Lcb4;->a(") == true })
    }

    @Test fun flockCardVoiceAndAnyMasksPreservePreferencesOtherCameraPathsAndInstructionWidths() {
        val path = System.getenv("VELA_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
        val preservedOwners = setOf("Lsw0;", "Lf1;", "Lzk4;", "Llp1;", "Lu72;", "Lapp/vela/VelaApp;")
        val originals = classes.flatMap { it.methods }.filter { it.implementation != null &&
            (it.toString() in velaContracts || it.definingClass in preservedOwners) }.associateBy { it.toString() }
        val mutable = originals.mapValues { MutableMethod(it.value) }
        val before = mutable.mapValues { it.value.implementation!!.instructions.toList() }
        maskVelaFlockAlerts(mutable)
        assertEquals(9, flockAlertMasks.size)
        assertEquals(4, flockAlertMasks.map { it.method }.toSet().size)
        mutable.forEach { (descriptor, method) ->
            val original = originals.getValue(descriptor)
            val masks = flockAlertMasks.filter { it.method == descriptor }.associateBy { it.index }
            val code = method.implementation!!.instructions.toList()
            assertEquals(original.implementation!!.registerCount, method.implementation!!.registerCount)
            assertEquals(before.getValue(descriptor).size, code.size)
            code.forEachIndexed { at, instruction ->
                val old = before.getValue(descriptor)[at]
                assertEquals(old.opcode, instruction.opcode)
                assertEquals(old.codeUnits, instruction.codeUnits)
                masks[at]?.let { mask ->
                    assertEquals(mask.replacement, (instruction as ReferenceInstruction).reference.toString())
                    if(instruction is OneRegisterInstruction) assertEquals((old as OneRegisterInstruction).registerA,instruction.registerA)
                }
            }
            val restored = code.mapIndexed { at, instruction -> if(at in masks) before.getValue(descriptor)[at] else instruction }
            val restoredMethod = ImmutableMethod(method.definingClass,method.name,method.parameters,method.returnType,
                method.accessFlags,method.annotations,method.hiddenApiRestrictions,
                ImmutableMethodImplementation(method.implementation!!.registerCount,restored,
                    method.implementation!!.tryBlocks,method.implementation!!.debugItems))
            assertEquals(velaFingerprint(original),velaFingerprint(restoredMethod))
        }
        // Welcome's native any() call must remain original, and new readers require review.
        val welcome = mutable.getValue("Lzk4;->invoke()Ljava/lang/Object;")
        assertTrue(welcome.implementation!!.instructions.any { (it as? ReferenceInstruction)?.reference?.toString() == "Lsw0;->a()Z" })
        val unknown = ImmutableMethod("LUnknownFlockAny;","read",emptyList(),"V",9,emptySet(),emptySet(),
            ImmutableMethodImplementation(1,listOf(
                ImmutableInstruction35c(Opcode.INVOKE_STATIC,0,0,0,0,0,0,ImmutableMethodReference("Lsw0;","a",emptyList(),"Z")),
                ImmutableInstruction10x(Opcode.RETURN_VOID)),emptyList(),emptyList()))
        val extra: ClassDef = ImmutableClassDef("LUnknownFlockAny;",1,"Ljava/lang/Object;",emptyList(),VELA_MAP_ID,
            emptySet(),emptyList(),listOf(unknown))
        assertThrows(IllegalStateException::class.java) { validateVelaContracts(classes + extra) }
    }

    @Test fun nativeSpeedingUsesFreshSelectedInputsWithoutChangingPreferencesTimersVoiceOrControlFlow() {
        val path = System.getenv("VELA_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val original = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
            .single { it.type == "Ldl2;" }.methods.single { it.toString() == "Ldl2;->j()V" }
        assertEquals(velaContracts.getValue(original.toString()).hash, velaFingerprint(original))
        val speeding = MutableMethod(original)
        bindVelaSpeedingInputs(speeding)
        val before = original.implementation!!.instructions.toList()
        val after = speeding.implementation!!.instructions.toList()
        assertEquals(14, speeding.implementation!!.registerCount)
        assertEquals(before.size + 4, after.size)
        assertEquals("Lnl/johninnl/vela/TelemetryRuntime;->speedKmh(Ljava/lang/Double;)Ljava/lang/Double;", (after[26] as ReferenceInstruction).reference.toString())
        assertEquals(0, (after[27] as OneRegisterInstruction).registerA)
        assertEquals("Lnl/johninnl/vela/TelemetryRuntime;->limitKmh(Ljava/lang/Double;)Ljava/lang/Double;", (after[28] as ReferenceInstruction).reference.toString())
        assertEquals(1, (after[29] as OneRegisterInstruction).registerA)
        assertEquals("Landroid/os/SystemClock;->elapsedRealtime()J", (after[30] as ReferenceInstruction).reference.toString())
        fun addresses(code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>) =
            code.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val oldAddresses = addresses(before)
        val newAddresses = addresses(after)
        before.forEachIndexed { index, old ->
            val current = after[if(index < 26) index else index + 4]
            assertEquals("native opcode $index", old.opcode, current.opcode)
            assertEquals(old.codeUnits, current.codeUnits)
            assertEquals((old as? ReferenceInstruction)?.reference?.toString(), (current as? ReferenceInstruction)?.reference?.toString())
            assertEquals((old as? OneRegisterInstruction)?.registerA, (current as? OneRegisterInstruction)?.registerA)
            assertEquals((old as? com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction)?.registerB, (current as? com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction)?.registerB)
            assertEquals((old as? com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction)?.registerC, (current as? com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction)?.registerC)
            assertEquals((old as? com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction)?.wideLiteral, (current as? com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction)?.wideLiteral)
            if(old is OffsetInstruction) {
                val oldTarget = oldAddresses.indexOf(oldAddresses[index] + old.codeOffset)
                val currentIndex = if(index < 26) index else index + 4
                val newTarget = newAddresses.indexOf(newAddresses[currentIndex] + (current as OffsetInstruction).codeOffset)
                // A branch to native elapsedRealtime must run the wrappers first, even for native null speed.
                assertEquals("native branch $index", if(oldTarget <= 26) oldTarget else oldTarget + 4, newTarget)
            }
        }
        assertEquals("Ld54;->a:Lu13;", (after[0] as ReferenceInstruction).reference.toString())
        assertEquals(0, (after[25] as OneRegisterInstruction).registerA) // native missing speed remains nullable until the override
        val changed = MutableMethod(original)
        changed.implementation!!.replaceInstruction(26, com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x(Opcode.NOP))
        assertThrows(IllegalStateException::class.java) { bindVelaSpeedingInputs(changed) }
    }

    @Test fun carSettingsCapturesTheActualScreenBeforeR8OverwritesItsParameterRegister() {
        val path = System.getenv("VELA_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val original = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
            .single { it.type == "Lhw;" }.methods.single { it.toString() == "Lhw;->k()Lse4;" }
        val before = original.implementation!!.instructions.toList()
        val thisRegister = original.implementation!!.registerCount - 1
        assertEquals(5, thisRegister)
        val writesObject = setOf(Opcode.IGET_OBJECT, Opcode.SGET_OBJECT, Opcode.MOVE_RESULT_OBJECT, Opcode.NEW_INSTANCE, Opcode.MOVE_OBJECT)
        val writesThis = before.withIndex().filter { it.value.opcode in writesObject && (it.value as OneRegisterInstruction).registerA == thisRegister }
        assertEquals(57, writesThis.first().index) // IGET_OBJECT p0,p0,Screen.context destroys the original this.
        val formerHookLastWrite = writesThis.last { it.index < 74 }
        assertEquals(67, formerHookLastWrite.index)
        assertEquals("Landroidx/car/app/model/Action;->BACK:Landroidx/car/app/model/Action;", (formerHookLastWrite.value as ReferenceInstruction).reference.toString())

        val settings = MutableMethod(original)
        bindVelaCarSettings(settings)
        val after = settings.implementation!!.instructions.toList()
        val hook = after[2] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
        assertEquals("Lnl/johninnl/vela/CarUi;->settingsEntry(Ljava/lang/Object;Ljava/lang/Object;)V", (hook as ReferenceInstruction).reference.toString())
        assertEquals(2, hook.registerCount)
        assertEquals(thisRegister, hook.registerC) // actual Screen, with no earlier writes to its register
        assertEquals(0, hook.registerD) // the initialized native ItemList.Builder
        assertTrue(writesThis.none { it.index < 2 })
        assertEquals("Lji1;", (after[0] as ReferenceInstruction).reference.toString())
        assertEquals("Lji1;-><init>()V", (after[1] as ReferenceInstruction).reference.toString())
        assertEquals(6, settings.implementation!!.registerCount)
        // This straight-line native method retains every original operand and native setting.
        val restored = ImmutableMethod(original.definingClass, original.name, original.parameters,
            original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(6, after.filterIndexed { index, _ -> index != 2 },
                original.implementation!!.tryBlocks, original.implementation!!.debugItems))
        assertEquals(velaFingerprint(original), velaFingerprint(restored))
    }

    @Test fun nativeAlertsOnlyRunnableUsesVerifiedCase26SonificationAndRejectsChangedAudioOperands() {
        val path = System.getenv("VELA_ORIGINAL_APK")
        assumeNotNull(path)
        val container = DexFileFactory.loadDexContainer(File(path!!), Opcodes.forApi(26))
        val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }.toList()
        validateVelaHostAbi(classes)
        val owner = classes.single { it.type == "La9;" }
        val original = owner.methods.single { it.toString() == "La9;->run()V" }
        val code = original.implementation!!.instructions.toList()
        val usage = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == "Landroid/media/AudioAttributes\$Builder;->setUsage(I)Landroid/media/AudioAttributes\$Builder;" }
        val content = code.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == "Landroid/media/AudioAttributes\$Builder;->setContentType(I)Landroid/media/AudioAttributes\$Builder;" }
        assertTrue(usage > 0 && content > usage)
        assertEquals(12, (code[usage - 1] as NarrowLiteralInstruction).narrowLiteral) // navigation guidance usage
        assertEquals(4, (code[content - 1] as NarrowLiteralInstruction).narrowLiteral) // native sonification, not speech/music
        val switch = code.indexOfFirst { it.opcode == Opcode.PACKED_SWITCH }
        val addresses = code.runningFold(0) { at, instruction -> at + instruction.codeUnits }
        val payload = code[addresses.indexOf(addresses[switch] + (code[switch] as OffsetInstruction).codeOffset)] as com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
        assertFalse(payload.switchElements.any { it.key == 26 }) // native byte26 takes the default chime branch
        assertEquals("La9;->g:Ljava/lang/Object;", (code[switch + 1] as ReferenceInstruction).reference.toString())
        assertEquals("Ljava/util/List;", (code[switch + 2] as ReferenceInstruction).reference.toString())

        val changedCode = code.toMutableList()
        changedCode[content - 1] = com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n(
            Opcode.CONST_4, (code[content - 1] as OneRegisterInstruction).registerA, 1)
        val changed = ImmutableMethod(original.definingClass, original.name, original.parameters,
            original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(original.implementation!!.registerCount, changedCode,
                original.implementation!!.tryBlocks, original.implementation!!.debugItems))
        val changedOwner = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces,
            owner.sourceFile, owner.annotations, owner.fields, owner.methods.map { if(it == original) changed else it })
        assertThrows(IllegalStateException::class.java) {
            validateVelaContracts(classes.map { if(it === owner) changedOwner else it })
        }
    }

}
