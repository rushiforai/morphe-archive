package app.pigfoot.patches

import app.pigfoot.patches.gpsjoystick.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.Assert.*
import org.junit.Test

class GpsJoyStickPolicyTest {
    private fun method(p: GpsPolicy, registers: Int = 14, flags: Int = 9) = MutableMethod(ImmutableMethod(
        p.tierOwner,p.tierMethod,emptyList(),"I",flags,emptySet(),emptySet(),
        ImmutableMethodImplementation(registers,listOf(ImmutableInstruction11n(Opcode.CONST_4,0,1),ImmutableInstruction11x(Opcode.RETURN,0)),emptyList(),emptyList())))

    @Test fun localTierReturnsProBeforeAnyCacheReadAndKeepsOriginalBody() {
        for(p in listOf(gpsPlay534,gpsUnlocked534)) {
            val m=method(p);val before=m.implementation!!.instructions.toList()
            enableGpsLocalTier(m,p)
            val code=m.implementation!!.instructions.toList()
            assertEquals(Opcode.CONST_4,code[0].opcode)
            assertEquals(0,(code[0] as OneRegisterInstruction).registerA)
            assertEquals(3,(code[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN,code[1].opcode)
            assertEquals(0,(code[1] as OneRegisterInstruction).registerA)
            assertEquals(before,code.drop(2))
            assertEquals(14,m.implementation!!.registerCount)
            assertTrue(code.take(2).none { it is ReferenceInstruction })
        }
    }

    @Test fun splashAdPreferenceOverridePreservesEveryOtherKeyAndDefault() {
        for(p in listOf(gpsPlay534,gpsUnlocked534)) {
            val m=MutableMethod(ImmutableMethod(p.prefs,p.preferenceMethod,
                listOf(p.keys,"Ljava/lang/Object;").map { ImmutableMethodParameter(it,emptySet(),null) },
                "Ljava/lang/Object;",1,emptySet(),emptySet(),ImmutableMethodImplementation(6,
                    listOf(ImmutableInstruction11x(Opcode.RETURN_OBJECT,5)),emptyList(),emptyList())))
            enableGpsAdFreePreference(m,p)
            val code=m.implementation!!.instructions.toList()
            val field=(code[0] as ReferenceInstruction).reference as FieldReference
            assertEquals(p.keys,field.definingClass);assertEquals(p.adFreeField,field.name)
            assertEquals(Opcode.IF_NE,code[1].opcode)
            assertEquals(4,(code[1] as TwoRegisterInstruction).registerA)
            assertEquals(0,(code[1] as TwoRegisterInstruction).registerB)
            val branchAddress=code[0].codeUnits+(code[1] as OffsetInstruction).codeOffset
            assertEquals(code.take(4).sumOf { it.codeUnits },branchAddress)
            assertEquals(Opcode.RETURN_OBJECT,code[4].opcode)
            assertEquals(5,(code[4] as OneRegisterInstruction).registerA)
            val trueField=(code[2] as ReferenceInstruction).reference as FieldReference
            assertEquals("Ljava/lang/Boolean;",trueField.definingClass);assertEquals("TRUE",trueField.name)
            assertEquals(0,(code[3] as OneRegisterInstruction).registerA)
            assertTrue(code.none { it.opcode.toString().startsWith("IPUT") || it.opcode.toString().startsWith("SPUT") })
        }
    }

    private fun splashCallback(p: GpsPolicy, registers: Int = 3, flags: Int = 1, params: List<String> = listOf("Z"), owner: String = p.splash) =
        MutableMethod(ImmutableMethod(owner,"a",params.map { ImmutableMethodParameter(it,emptySet(),null) },"V",flags,emptySet(),emptySet(),
            ImmutableMethodImplementation(registers,listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)),emptyList(),emptyList())))

    @Test fun splashCallbackForcesAdFreeBeforeAnyOtherCodeAndKeepsOriginalBody() {
        for(p in listOf(gpsPlay534,gpsUnlocked534)) {
            val m=splashCallback(p);val before=m.implementation!!.instructions.toList()
            enableGpsSplashAdFree(m,p)
            val code=m.implementation!!.instructions.toList()
            assertEquals(Opcode.CONST_4,code[0].opcode)
            // registerCount 3 with this+boolean parameters: p1 is v2.
            assertEquals(2,(code[0] as OneRegisterInstruction).registerA)
            assertEquals(1,(code[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(before,code.drop(1))
            assertEquals(3,m.implementation!!.registerCount)
            assertTrue(code.take(1).none { it is ReferenceInstruction })
        }
    }

    @Test fun splashCallbackWrongOwnerShapeOrRegistersFailsBeforeMutation() {
        for(p in listOf(gpsPlay534,gpsUnlocked534)) {
            for(m in listOf(splashCallback(p,4),splashCallback(p,3,9),splashCallback(p,3,1,listOf("I")),splashCallback(p,3,1,emptyList()),
                splashCallback(p,3,1,listOf("Z"),"Lunsupported/Owner;"))) {
                val before=m.implementation!!.instructions.toList()
                assertThrows(IllegalArgumentException::class.java){enableGpsSplashAdFree(m,p)}
                assertEquals(before,m.implementation!!.instructions.toList())
            }
        }
    }

    @Test fun everyPolicyPinsTheSplashCallbackWithDistinctVariantHashes() {
        for(p in listOf(gpsPlay534,gpsUnlocked534)) {
            assertEquals("Lse/a;",p.splash);assertEquals(p.splashPin,p.pins[p.splash])
            assertEquals(4,p.pins.size)
        }
        assertNotEquals(gpsPlay534.splashPin,gpsUnlocked534.splashPin)
        val modified = gpsPlay534.pins + (gpsPlay534.splash to "modified")
        assertThrows(IllegalArgumentException::class.java) { selectGpsPolicy(modified) }
        assertThrows(IllegalArgumentException::class.java) { selectGpsPolicy(gpsPlay534.pins - gpsPlay534.splash) }
    }

    @Test fun wrongVersionOwnerOrStaticRegisterShapeFailsBeforeMutation() {
        for(p in listOf(gpsPlay534,gpsUnlocked534)) {
            for(m in listOf(method(p,13),method(p,14,1),method(p.copy(tierOwner="Lunsupported/Owner;")))) {
                val before=m.implementation!!.instructions.toList()
                assertThrows(IllegalArgumentException::class.java){enableGpsLocalTier(m,p)}
                assertEquals(before,m.implementation!!.instructions.toList())
            }
        }
    }

    @Test fun versionsKeepIndependentTierResolversAndManifestPins() {
        requireGpsTarget(GPS_PACKAGE,"5.3.4","3031")
        assertNotEquals(gpsPlay534.adFreeField,gpsUnlocked534.adFreeField)
        assertNotEquals(gpsPlay534.tierPin,gpsUnlocked534.tierPin)
        for((p,v,c) in listOf(Triple("other","5.3.3","3030"),Triple(GPS_PACKAGE,"5.3.2","3030"),Triple(GPS_PACKAGE,"5.3.3","3030"),Triple(GPS_PACKAGE,"5.3.4","3030")))
            assertThrows(IllegalArgumentException::class.java){requireGpsTarget(p,v,c)}
    }
    @Test fun distributionSelectionRequiresExactlyOneCompleteOriginalPinSet() {
        assertEquals(gpsPlay534, selectGpsPolicy(gpsPlay534.pins))
        assertEquals(gpsUnlocked534, selectGpsPolicy(gpsUnlocked534.pins))
        val mixed = gpsPlay534.pins + (gpsUnlocked534.prefs to gpsUnlocked534.prefsPin)
        for (hashes in listOf(emptyMap(), mixed, gpsPlay534.pins - gpsPlay534.keys,
            gpsPlay534.pins + (gpsPlay534.tierOwner to "modified"))) {
            assertThrows(IllegalArgumentException::class.java) { selectGpsPolicy(hashes) }
        }
        assertThrows(IllegalArgumentException::class.java) {
            selectGpsPolicy(gpsPlay534.pins, listOf(gpsPlay534, gpsPlay534))
        }
    }

}
