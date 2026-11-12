import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "kgs.com.addmusictovideos"
private const val APP = "Lcom/kgs/AddMusicApplication;"
private const val PREMIUM_KEY = "is_premium"
private const val ENTITLEMENT = "Lcom/qonversion/android/sdk/dto/entitlements/QEntitlement;"
private const val BOOLEAN = "Ljava/lang/Boolean;"

class AddMusicSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Method.strings(): List<String> = instructions().mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }

    private fun Method.calls(owner: String, name: String): Boolean = instructions().any {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == owner && ref.name == name
    }

    private fun Method.isEntitlementSetter(): Boolean = returnType == "V" &&
        parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/Map;") &&
        implementation != null &&
        listOf("entitlements", "premium", PREMIUM_KEY).all { it in strings() } &&
        calls(ENTITLEMENT, "isActive") && calls(BOOLEAN, "valueOf")

    private fun Method.isPremiumGetter(): Boolean {
        if (!AccessFlags.STATIC.isSet(accessFlags) || returnType != "Z" || parameterTypes.isNotEmpty()) return false
        if (implementation == null) return false
        val insns = instructions()
        return insns.any { i -> (i as? ReferenceInstruction)?.reference.let { (it as? MethodReference)?.name == "getValue" } } &&
            insns.any { i -> (i as? ReferenceInstruction)?.reference.let { (it as? MethodReference)?.name == "booleanValue" } }
    }

    @Test
    fun `premium getter, entitlement mapper and startup cache are forced true`() {
        val root = repoRoot()
        val apk = File(root, "apks/addmusic/base.apk")

        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "9.6",
            patchNames = setOf("Enable Premium"),
            allPatches = loadAllPatches(newestPatchBundle(root)),
        )
        val diagnostics = "emitted classes=${classes.size}"
        val byType = classes.associateBy { it.type }

        // 1. The entitlement manager (setter + getter shape) has its getter forced true.
        val managers = classes.filter { cls ->
            cls.methods.any { it.isEntitlementSetter() } && cls.methods.any { it.isPremiumGetter() }
        }
        assertEquals(1, managers.size, "premium managers: ${managers.map { it.type }}")
        val manager = managers.single()
        val getter = manager.methods.single { it.isPremiumGetter() }
        assertForcedBoolean(getter, true, "${manager.type}.${getter.name}()", diagnostics)

        // 2. The mapper forces the Boolean.valueOf input to true.
        val setter = manager.methods.single { it.isEntitlementSetter() }
        val setterInsns = setter.instructions()
        val valueOf = setterInsns.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == BOOLEAN && ref.name == "valueOf"
        }
        assertTrue(valueOf > 0, "${manager.type}.${setter.name}: no Boolean.valueOf")
        val forced = setterInsns[valueOf - 1]
        assertTrue(
            forced is NarrowLiteralInstruction && forced.opcode == Opcode.CONST_4 && forced.narrowLiteral == 1,
            "${manager.type}.${setter.name}: Boolean.valueOf is not forced true; got ${forced.opcode}",
        )

        // 3. The startup cache read seeds true: getBoolean("is_premium", ...) -> move-result -> 1.
        val onCreate = byType.getValue(APP).methods.single {
            it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        val appInsns = onCreate.instructions()
        val key = appInsns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == PREMIUM_KEY
        }
        assertTrue(key >= 0, "$APP.onCreate()V no longer reads $PREMIUM_KEY")
        val getBoolean = (key..appInsns.lastIndex).first {
            val ref = (appInsns[it] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/content/SharedPreferences;" && ref.name == "getBoolean"
        }
        assertEquals(Opcode.MOVE_RESULT, appInsns[getBoolean + 1].opcode, "$APP.onCreate()V getBoolean result")
        val register = (appInsns[getBoolean + 1] as OneRegisterInstruction).registerA
        val seed = appInsns[getBoolean + 2]
        assertTrue(
            seed is NarrowLiteralInstruction && seed.opcode == Opcode.CONST_4 && seed.narrowLiteral == 1 &&
                (seed as OneRegisterInstruction).registerA == register,
            "$APP.onCreate()V does not seed $PREMIUM_KEY true; got ${seed.opcode}",
        )
    }
}
