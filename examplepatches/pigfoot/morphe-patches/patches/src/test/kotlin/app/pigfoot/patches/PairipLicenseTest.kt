package app.pigfoot.patches

import app.pigfoot.patches.shared.pairip.*
import app.pigfoot.patches.pikiewalker.*
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.*
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.instruction.*
import com.android.tools.smali.dexlib2.writer.io.MemoryDataStore
import com.android.tools.smali.dexlib2.writer.pool.DexPool
import java.security.MessageDigest
import org.junit.Assert.*
import org.junit.Test

class PairipLicenseTest {
    private fun definition(flags: Int = 9, name: String = "checkLicense", early: Boolean = false): ImmutableClassDef {
        val body = if (early) listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)) else
            listOf(ImmutableInstruction11n(Opcode.CONST_4, 0, 0), ImmutableInstruction10x(Opcode.RETURN_VOID))
        val method = ImmutableMethod(PAIRIP_LICENSE_OWNER, name,
            listOf(ImmutableMethodParameter("Landroid/content/Context;", emptySet(), null)), "V", flags,
            emptySet(), emptySet(), ImmutableMethodImplementation(2, body, emptyList(), emptyList()))
        return ImmutableClassDef(PAIRIP_LICENSE_OWNER, 1, "Ljava/lang/Object;", emptyList(), "synthetic", emptySet(), emptyList(), listOf(method))
    }
    private fun hash(c: ImmutableClassDef, version: Int = 39): String {
        val p = DexPool(Opcodes.forDexVersion(version));p.internClass(c);val s = MemoryDataStore();p.writeTo(s)
        return MessageDigest.getInstance("SHA-256").digest(s.data).joinToString("") { "%02x".format(it) }
    }
    @Test fun guardedCopyReturnsBeforeOriginalEntryAndLeavesSourceUnmodified() {
        for (version in listOf(37,39)) {
            val c = definition();val pin = hash(c, version)
            val m = preparePairipLicenseSkip(c,pin,version)
            assertEquals(Opcode.RETURN_VOID,m.implementation!!.instructions.first().opcode)
            assertEquals(3,m.implementation!!.instructions.count())
            assertEquals(2,c.methods.single().implementation!!.instructions.count())
            assertEquals(pin,hash(c,version))
        }
    }
    @Test fun missingWrongShapeModifiedPinAndAlreadyDisabledInputsReject() {
        val c=definition()
        assertThrows(IllegalArgumentException::class.java) { preparePairipLicenseSkip(c,"0".repeat(64),39) }
        assertThrows(IllegalArgumentException::class.java) { preparePairipLicenseSkip(c,"invalid",39) }
        for (bad in listOf(definition(flags=1),definition(name="other"),definition(early=true))) {
            val before=hash(bad)
            assertThrows(IllegalArgumentException::class.java) { preparePairipLicenseSkip(bad,before,39) }
            assertEquals(before,hash(bad))
        }
    }
    @Test fun rewardAlwaysDependsOnRequiredStartupForSupportedInstallers() {
        assertEquals(setOf(pikieWalkerStartupPatch),pikieWalkerRewardPatch.dependencies)
        assertEquals(setOf(pikieInputPatch),pikieWalkerStartupPatch.dependencies)
        for (installer in listOf(InstallerType.STANDARD,InstallerType.SHIZUKU)) {
            assertEquals(PatchAvailability.REQUIRED,pikieWalkerStartupPatch.availability!!.resolve(installer,ApkArchitecture.ARM64_V8A))
        }
        assertEquals(PatchAvailability.UNAVAILABLE,pikieWalkerStartupPatch.availability!!.resolve(InstallerType.MOUNT,ApkArchitecture.ARM64_V8A))
    }
}
