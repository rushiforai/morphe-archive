package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class LyricsFallback2703Test {
    private fun original(): Map<String, ClassDef> {
        val path = System.getenv("DEEZER_ORIGINAL_2703_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        return dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
    }

    @Test fun serializedBridgeHasValidConstructorsInterfacesAndRegisterFrames() {
        val dex = lyricsAdapterDex().buffered().use { DexBackedDexFile.fromInputStream(null, it) }
        assertEquals(setOf(LYRIC_FACTORY, LYRIC_OBSERVABLE, LYRIC_OBSERVER, LYRIC_ARTWORK, LYRIC_MISSING_COMPLETE),
            dex.classes.map { it.type }.toSet())
        for (cls in dex.classes) {
            assertFalse(cls.virtualMethods.any { it.name == "<init>" })
            cls.directMethods.filter { it.name == "<init>" }.forEach {
                assertTrue(AccessFlags.CONSTRUCTOR.isSet(it.accessFlags))
            }
            for (method in cls.methods) {
                assertBranchBoundaries(MutableMethod(method))
                val registers = method.implementation!!.registerCount
                for (instruction in method.implementation!!.instructions) {
                    val used = when (instruction) {
                        is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
                        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE,
                            instruction.registerF, instruction.registerG).take(instruction.registerCount)
                        is ThreeRegisterInstruction -> listOf(instruction.registerA, instruction.registerB, instruction.registerC)
                        is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
                        is OneRegisterInstruction -> listOf(instruction.registerA)
                        else -> emptyList()
                    }
                    assertTrue("${method.name} register frame", used.all { it in 0 until registers })
                    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                    if (call != null && instruction.opcode.name.startsWith("INVOKE_")) {
                        val words = call.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 } +
                            if (instruction.opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)) 0 else 1
                        assertEquals("${method.name}: $call argument width", words, used.size)
                    }
                }
            }
        }
        val observable = dex.classes.single { it.type == LYRIC_OBSERVABLE }
        assertEquals(LYRIC_RX_PARENT, observable.superclass)
        assertEquals(setOf(LYRIC_RX_OBSERVER, LYRIC_DISPOSABLE, LYRIC_OUTPUT),
            dex.classes.single { it.type == LYRIC_OBSERVER }.interfaces.toSet())
    }

    @Test fun everyNativeBridgeReferenceResolvesAgainstTheActualInputOrOwnedExtension() {
        val input = original()
        val patched = input.mapValues { MutableClass(it.value) }
        bindLyricsFallback(patched::getValue)
        val extension = lyricsExtension().buffered().use { DexBackedDexFile.fromInputStream(null, it) }.classes.associateBy { it.type }
        val classes = patched + extension
        fun hierarchy(type: String): Sequence<ClassDef> = sequence {
            val seen = mutableSetOf<String>()
            val pending = ArrayDeque<String>(); pending.add(type)
            while (pending.isNotEmpty()) {
                val name = pending.removeFirst()
                if (!seen.add(name)) continue
                val cls = classes[name] ?: continue
                yield(cls)
                cls.superclass?.let(pending::addLast)
                cls.interfaces.forEach(pending::addLast)
            }
        }
        val bridge = lyricsAdapterDex().buffered().use { DexBackedDexFile.fromInputStream(null, it) }
        for (cls in bridge.classes) for (method in cls.methods) for (instruction in method.implementation!!.instructions) {
            when (val reference = (instruction as? ReferenceInstruction)?.reference) {
                is MethodReference -> {
                    if (reference.definingClass.startsWith("Ljava/") || reference.definingClass.startsWith("Landroid/")) continue
                    assertNotNull("Missing class ${reference.definingClass}", classes[reference.definingClass])
                    val found = hierarchy(reference.definingClass).flatMap { it.methods.asSequence() }.firstOrNull {
                        it.name == reference.name && it.returnType == reference.returnType &&
                            it.parameterTypes.map(CharSequence::toString) == reference.parameterTypes.map(CharSequence::toString)
                    }
                    assertNotNull("Missing method $reference", found)
                    assertTrue("Non-public cross-class reference $reference", found!!.definingClass == cls.type ||
                        AccessFlags.PUBLIC.isSet(found.accessFlags) || AccessFlags.PROTECTED.isSet(found.accessFlags))
                }
                is FieldReference -> {
                    if (reference.definingClass.startsWith("Ljava/") || reference.definingClass.startsWith("Landroid/")) continue
                    val found = hierarchy(reference.definingClass).flatMap { it.fields.asSequence() }.firstOrNull {
                        it.name == reference.name && it.type == reference.type
                    }
                    assertNotNull("Missing field $reference", found)
                    assertTrue("Non-public cross-class field $reference", found!!.definingClass == cls.type || AccessFlags.PUBLIC.isSet(found.accessFlags))
                }
            }
        }
    }

    @Test fun nativeAvailabilityQueryUnwrapsItsDtoBeforeTheBridge() {
        val input = original()
        fun refs(owner: String, name: String) = input.getValue(owner).methods.single { it.name == name }
            .implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertTrue(refs("LlllllIlIIIIlIlI;", "IllIlIlIIlIllIll").contains(LYRIC_DTO))
        assertTrue(refs("LIIlIlIIIllIIIIIl;", "IllIlIlIIlIllIll").contains("LIIlIIlIIIIlIIll;-><init>(I)V"))
        assertTrue(refs("LIIlIIlIIIIlIIll;", "invoke").contains(
            "LIIIIlIIlIIlllIlI;->lIlIIIlIlIIlIlI(LIIlIIIIIlllIIIlI;)Ljava/lang/Object;"))
        assertTrue(refs("LIIIIlIIlIIlllIlI;", "lIlIIIlIlIIlIlI").contains(
            "LlIllIlIlIIIIIll;->llIIIIIIlIIIIll:Ljava/lang/Object;"))
    }

    @Test fun nativeAvailabilityBodyAndMainThreadSchedulingArePreservedBehindTypedWrappers() {
        val classes = original().mapValues { MutableClass(it.value) }
        val availability = classes.getValue("LlllllIlIIIIlIlI;").methods.single { it.name == "IllIlIlIIlIllIll" }
        val before = availability.instructions.toList()
        val manager = classes.getValue("LIllIIllIlIlIIIIl;").methods.single { it.name == "IllIlIlIIlIllIll" }
        val managerBefore = manager.instructions.toList()
        bindLyricsFallback(classes::getValue)
        val alias = classes.getValue(availability.definingClass).methods.single { it.name == "morpheNativeLyricsAvailability" }
        assertEquals(before.map { it.opcode }, alias.instructions.map { it.opcode })
        assertEquals(before.map { (it as? ReferenceInstruction)?.reference?.toString() },
            alias.instructions.map { (it as? ReferenceInstruction)?.reference?.toString() })
        val after = manager.instructions.toList()
        assertEquals(managerBefore.size + 4, after.size)
        managerBefore.indices.filter { it != 75 }.forEach { i ->
            assertSame(managerBefore[i], after[i + if (i >= 60) 4 else 0])
        }
        assertEquals("$LYRIC_RX->IIllIIIIIIIllIll(LIIIllIIlIllIlllI;)LIIIIIlIIllIIlI;",
            (after[66] as ReferenceInstruction).reference.toString())
        for (cls in classes.values.filter { it.type in setOf(availability.definingClass, manager.definingClass,
            LYRIC_MODEL, LYRIC_ACTIVITY, "LIIIllIIllIIlIlll;") }) {
            for (method in cls.methods.filter { it.implementation != null }) assertBranchBoundaries(method)
        }
        assertTrue(runCatching { bindLyricsFallback(classes::getValue) }.exceptionOrNull() is IllegalStateException)
    }

    @Test fun missingNativeMetadataStartsFallbackBeforeReturningAndPublishesThroughTheNativeConsumer() {
        val classes = original().mapValues { MutableClass(it.value) }
        bindLyricsFallback(classes::getValue)
        val manager = classes.getValue(LYRIC_MANAGER).methods.single { it.name == "IllIlIlIIlIllIll" }
        val code = manager.instructions.toList()
        val missing = (code[23] as BuilderOffsetInstruction).target.location.index
        assertEquals("$LYRIC_FACTORY->loadMissing($LYRIC_MANAGER$LYRIC_TRACK)V",
            (code[missing] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_VOID, code[missing + 1].opcode)
        // Metadata stays native. No cached-only flag can prevent the first lookup.
        assertEquals("$LYRIC_TRACK->IlIIIIIIIlllIIl()I", (code[20] as ReferenceInstruction).reference.toString())
        val bridge = lyricsAdapterDex().buffered().use { DexBackedDexFile.fromInputStream(null, it) }
        val start = bridge.classes.single { it.type == LYRIC_FACTORY }.methods.single { it.name == "loadMissing" }
        val references = start.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertTrue(references.contains("LIIIIIlIlllIIIlIl;-><init>(${LYRIC_MANAGER}I)V"))
        assertTrue(references.contains("$LYRIC_MANAGER->IlIIIlIIIIlllIl:LIIllIIIIIIIlIIll;"))
        assertTrue(references.contains("$LYRIC_RX->IIllIIIIIIIllIll(LIIIllIIlIllIlllI;)LIIIIIlIIllIIlI;"))
        // The original consumer changes state to ready and emits the native model.
        val publish = classes.getValue("LIIIIIlIlllIIIlIl;").methods.single { it.name == "accept" }
        val publishRefs = publish.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertTrue(publishRefs.contains("LlIIIlIIlIIIllI;->IIlllIIIIIIIIIlI(I)V"))
        assertTrue(publishRefs.contains("$LYRIC_MANAGER->IIllllIIIIIlIIl:LIlIIIlIlIIIIII;"))
    }

    @Test fun closeLyricsIsDeferredUntilMissingCompletionAndNeverSentBeforeTheLookup() {
        val input = original()
        val nativeState = input.getValue(LYRIC_VM).methods.single {
            it.name == "IIlllIIIIIIIIIlI" && it.parameterTypes.map(CharSequence::toString) == listOf("I")
        }
        val closeEvent = "LIIIIIIIIIIlIIlII;"
        assertTrue(nativeState.implementation!!.instructions.any {
            (it as? ReferenceInstruction)?.reference?.toString() == "$closeEvent->IllIlIlIIlIllIll:$closeEvent"
        })
        val dispatch = input.getValue("LIIIllIIllIIlIlll;").methods.single { it.name == "invoke" }
            .implementation!!.instructions.toList()
        val closeType = dispatch.indexOfFirst { it.opcode == Opcode.INSTANCE_OF &&
            (it as? ReferenceInstruction)?.reference?.toString() == closeEvent }
        assertTrue(closeType >= 0)
        assertEquals("Landroid/app/Activity;->finish()V", (dispatch[closeType + 2] as ReferenceInstruction).reference.toString())
        val generated = lyricsAdapterDex().buffered().use { DexBackedDexFile.fromInputStream(null, it) }
        val start = generated.classes.single { it.type == LYRIC_FACTORY }.methods.single { it.name == "loadMissing" }
            .implementation!!.instructions.toList()
        val controllerCall = start.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() ==
            "LlIIIlIIlIIIllI;->IIlllIIIIIIIIIlI(I)V" }
        assertTrue(controllerCall >= 0)
        assertEquals(1L, (start[controllerCall - 1] as NarrowLiteralInstruction).narrowLiteral.toLong())
        assertTrue(start.any { (it as? ReferenceInstruction)?.reference?.toString() ==
            "$LYRIC_MISSING_COMPLETE-><init>($LYRIC_MANAGER$LYRIC_TRACK)V" })
        val complete = generated.classes.single { it.type == LYRIC_MISSING_COMPLETE }.methods.single { it.name == "run" }
            .implementation!!.instructions.toList()
        val completeRefs = complete.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertTrue(completeRefs.contains("$LYRIC_MANAGER->IlIIlIIlIlIllI:$LYRIC_MODEL"))
        assertTrue(completeRefs.contains("$LYRIC_MANAGER->IIllllIIIIllIl:$LYRIC_TRACK"))
    }

    @Test fun artworkBindingPrefetchesWithoutOpeningLyricsAndRecyclingCancelsItsOwner() {
        val classes = original().mapValues { MutableClass(it.value) }
        val adapter = classes.getValue(LYRIC_ARTWORK_ADAPTER)
        val nativeBind = adapter.methods.single { it.name == "onBindViewHolder" }.instructions.toList()
        bindLyricsFallback(classes::getValue)
        val alias = adapter.methods.single { it.name == "morpheNativeArtworkBind" }.instructions.toList()
        assertEquals(nativeBind.map { it.opcode }, alias.map { it.opcode })
        assertEquals(nativeBind.map { (it as? ReferenceInstruction)?.reference?.toString() },
            alias.map { (it as? ReferenceInstruction)?.reference?.toString() })
        val bindRefs = adapter.methods.single { it.name == "onBindViewHolder" }.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference?.toString()
        }
        assertTrue(bindRefs.contains("$LYRIC_FACTORY->bindArtwork($LYRIC_ARTWORK_HOLDER)V"))
        val recycleRefs = adapter.methods.single { it.name == "onViewRecycled" }.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference?.toString()
        }
        assertTrue(recycleRefs.contains("$LYRIC_FACTORY->unbindArtwork($LYRIC_ARTWORK_HOLDER)V"))
        val field = classes.getValue(LYRIC_ARTWORK_HOLDER).fields.single { it.name == LYRIC_HOLDER_FLOW }
        assertEquals(LYRIC_FLOW, field.type)
        assertTrue(AccessFlags.VOLATILE.isSet(field.accessFlags))
        val generated = lyricsAdapterDex().buffered().use { DexBackedDexFile.fromInputStream(null, it) }
        val artwork = generated.classes.single { it.type == LYRIC_ARTWORK }
        fun refs(name: String) = artwork.methods.single { it.name == name }.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference?.toString()
        }
        // Start with a missing source: lookup does not depend on opening the full-screen manager.
        assertTrue(refs("start").contains("$LYRIC_FLOW->nativeComplete()V"))
        assertTrue(refs("value").contains("Landroid/view/View;->post(Ljava/lang/Runnable;)Z"))
        assertTrue(refs("run").contains("$LYRIC_ARTWORK->isCurrent()Z"))
        assertTrue(refs("run").contains("Landroid/view/View;->setVisibility(I)V"))
        assertTrue(refs("isCurrent").contains("$LYRIC_ARTWORK_HOLDER->$LYRIC_HOLDER_FLOW:$LYRIC_FLOW"))
        assertFalse(artwork.methods.flatMap { it.implementation!!.instructions.toList() }.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == LYRIC_MANAGER
        })
        adapter.methods.filter { it.implementation != null }.forEach(::assertBranchBoundaries)
    }
}
