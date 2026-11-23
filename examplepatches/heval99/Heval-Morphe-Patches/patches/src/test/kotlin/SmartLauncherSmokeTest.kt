import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import app.template.patches.smartlauncher.misc.promotions.configParameterRegisters
import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.io.TempDir
import java.io.File

private const val PKG = "ginlemon.flowerfree"
private const val FIREBASE_ANALYTICS = "Lcom/google/firebase/analytics/FirebaseAnalytics;"

class SmartLauncherSmokeTest {

    @TempDir
    lateinit var workDir: File

    private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference
    private fun Instruction.fieldRef() = (this as? ReferenceInstruction)?.reference as? FieldReference
    private fun Instruction.stringRef() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Method.params() = parameterTypes.map(CharSequence::toString)

    /** Register index of p[n] (p0 = this in an instance method). */
    private fun Method.p(n: Int): Int {
        val ins = params().sumOf { if (it == "J" || it == "D") 2 else 1 } + 1
        return implementation!!.registerCount - ins + n
    }

    @Test
    fun `all Smart Launcher patches apply and hook every site`() {
        val root = repoRoot()
        val apk = File(root, "apks/smartlauncher/base.apk")
        assumeTrue(apk.exists(), "skipping: base.apk not present at ${apk.path}")

        val classes = applyPatches(
            apk = apk,
            workDir = workDir,
            pkg = PKG,
            version = "6.6 build 026",
            patchNames = setOf(
                "Disable telemetry",
                "Hide promotions",
                "Spoof signature",
                "Enable Premium",
                "Fix Galaxy Buds3 Pro widget",
            ),
            allPatches = loadAllPatches(newestPatchBundle(root)),
            versionCode = 660260,
        )
        // 0. Spoof signature: the extension carries the Play certificate (SHA-1 is the second constant
        //    the app compares against) and no direct getPackageInfo(String, ..) call is left.
        assertSpoofSignature(classes, PKG, "dfaab993de750d7b5430bbd4217472311d94f9d0")
        val methods = classes.flatMap { cls -> cls.methods.map { cls to it } }

        // 1. Analytics switch: no-arg boolean that reads FirebaseAnalytics.a and calls
        //    Boolean.valueOf. False is loaded into valueOf's argument register right before the
        //    call, and that register is the one returned.
        val switches = methods.filter { (_, m) ->
            m.returnType == "Z" && m.params().isEmpty() && m.implementation != null &&
                m.instructions().any { it.opcode == Opcode.IGET_OBJECT && it.fieldRef()?.definingClass == FIREBASE_ANALYTICS } &&
                m.instructions().any { it.methodRef()?.let { r -> r.definingClass == "Ljava/lang/Boolean;" && r.name == "valueOf" } == true }
        }
        assertEquals(1, switches.size, "expected exactly one analytics switch, found ${switches.map { it.second.name }}")
        val switch = switches.single().second.instructions()
        val valueOf = switch.indexOfFirst { it.methodRef()?.name == "valueOf" }
        val arg = (switch[valueOf] as FiveRegisterInstruction).registerC
        val load = switch[valueOf - 1]
        assertTrue(
            load.opcode == Opcode.CONST_16 && (load as OneRegisterInstruction).registerA == arg &&
                (load as NarrowLiteralInstruction).narrowLiteral == 0,
            "analytics switch does not load false into valueOf's argument (v$arg) before the call"
        )
        val returned = switch.last { it.opcode == Opcode.RETURN } as OneRegisterInstruction
        assertEquals(arg, returned.registerA, "analytics switch returns a different register than the one forced false")

        // 2. FirebaseAnalytics.logEvent: the (String, Bundle) void returns at once.
        val logEvent = classes.single { it.type == FIREBASE_ANALYTICS }.methods.filter {
            it.returnType == "V" && it.params() == listOf("Ljava/lang/String;", "Landroid/os/Bundle;")
        }.single()
        assertEquals(Opcode.RETURN_VOID, logEvent.instructions().first().opcode, "logEvent does not return at once")

        // 3. Crashlytics setter: (Z)V holding the collection key; its boolean parameter is zeroed first.
        val setters = methods.filter { (_, m) ->
            m.returnType == "V" && m.params() == listOf("Z") && m.implementation != null &&
                m.instructions().any { it.stringRef() == "firebase_crashlytics_collection_enabled" } &&
                m.instructions().any { it.methodRef()?.name == "putBoolean" }
        }
        assertEquals(1, setters.size, "expected exactly one Crashlytics collection setter, found ${setters.size}")
        val setter = setters.single().second
        val zero = setter.instructions().first()
        assertTrue(
            zero.opcode == Opcode.CONST_16 && (zero as OneRegisterInstruction).registerA == setter.p(1) &&
                (zero as NarrowLiteralInstruction).narrowLiteral == 0,
            "Crashlytics setter does not zero its boolean parameter at entry; first is ${zero.opcode}"
        )

        // 4. Remote config class (found by its toString prefix): the constructor starts by zeroing the
        //    rating, scheduled promo, seasonal promo, survey tip and Pro banner booleans (p6, p12,
        //    p13, p25, p28 in this build) and blanking the periodic schedule (p16), then runs the
        //    original body (super constructor next).
        val config: ClassDef = classes.single { cls ->
            cls.methods.any { m ->
                m.name == "toString" && m.instructions().any { it.stringRef()?.startsWith("SLConfig(isDefaultConfig=") == true }
            }
        }
        val init = config.methods.single { it.name == "<init>" }
        val toString = config.methods.single {
            it.name == "toString" && it.instructions().any { insn -> insn.stringRef()?.startsWith("SLConfig(isDefaultConfig=") == true }
        }
        val registers = configParameterRegisters(toString, init)
        val expectedBooleans = listOf(
            "isRatingActivityEnabled",
            "isScheduledPromoEnabled",
            "isSeasonalPromoEnabled",
            "showSurveyTip",
            "enableProBanner",
        ).map { property ->
            val (register, type) = registers[property] ?: error("$property missing from the config")
            assertEquals("Z", type, "$property is not a boolean")
            register
        }.toSet()
        val schedule = registers["periodicPromoSchedule"]?.first
            ?: error("periodicPromoSchedule missing from the config")

        val head = init.instructions().take(6)
        val booleans = head.filter { it.opcode == Opcode.CONST_16 }
            .associate { (it as OneRegisterInstruction).registerA to (it as NarrowLiteralInstruction).narrowLiteral }
        assertEquals(expectedBooleans, booleans.keys, "wrong boolean parameters zeroed")
        assertTrue(booleans.values.all { it == 0 }, "a promotion boolean is not forced to false")
        val blank = head.single { it.opcode == Opcode.CONST_STRING } as OneRegisterInstruction
        assertEquals(schedule, blank.registerA, "periodic promo schedule parameter is not the one blanked")
        assertEquals("", (blank as ReferenceInstruction).reference.let { (it as StringReference).string })
        assertEquals(Opcode.INVOKE_DIRECT, init.instructions()[6].opcode, "constructor body does not follow the overwrites")

        // The paywall and leaving-premium parameters are not overwritten.
        val paywall = registers["isLeavingPremiumExperienceEnabled"]?.first
        assertTrue(
            paywall == null || init.instructions().take(6).none { (it as? OneRegisterInstruction)?.registerA == paywall },
            "isLeavingPremiumExperienceEnabled must be left alone"
        )

        // 5. Enable Premium: the PurchasableItems initializer sets the lifetime item and fires the
        //    access-changed broadcast; the licence refresh cannot revoke it.
        val premiumCtors = methods.map { it.second }.filter { m ->
            m.name == "<clinit>" &&
                m.instructions().any { it.stringRef() == "unlockpro" } &&
                m.instructions().any { it.stringRef() == "lifetime" }
        }
        val premiumCtor = premiumCtors.singleOrNull()
            ?: error("expected one PurchasableItems initializer, found ${premiumCtors.map { it.definingClass }}")
        val ctorCalls = premiumCtor.instructions().mapNotNull { it.methodRef() }
        assertTrue(
            ctorCalls.any { ref ->
                ref.parameterTypes.isEmpty() && ref.returnType == "Lginlemon/flower/App;"
            },
            "the lifetime item is not set through the app getter"
        )
        assertTrue(
            ctorCalls.any { ref ->
                ref.returnType == "V" &&
                    ref.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Z")
            },
            "the lifetime item's setter was not called"
        )
        val hasChanged = methods.map { it.second }.filter { m ->
            m.definingClass == premiumCtor.definingClass &&
                m.instructions().any { it.stringRef() == "ginlemon.action.hasPremiumAccessChanged" }
        }.singleOrNull() ?: error("expected one hasPremiumAccessChanged method in ${premiumCtor.definingClass}")
        assertTrue(
            ctorCalls.any { ref ->
                ref.definingClass == hasChanged.definingClass && ref.name == hasChanged.name &&
                    ref.parameterTypes.map(CharSequence::toString) ==
                    hasChanged.params()
            },
            "the premium access-changed broadcast is not fired"
        )

        val refreshes = methods.map { it.second }.filter { m ->
            m.returnType == "V" &&
                m.params() == listOf("Lk19;", "Ljava/util/ArrayList;", "Z", "Lginlemon/flower/App;")
        }
        val refresh = refreshes.singleOrNull()
            ?: error("expected one licence refresh, found ${refreshes.map { "${it.definingClass}->${it.name}" }}")
        val revoke = refresh.instructions().first()
        assertEquals(
            refresh.p(3),
            (revoke as OneRegisterInstruction).registerA,
            "the licence refresh does not zero its revoke flag",
        )
        assertTrue(
            revoke.opcode == Opcode.CONST_4 && (revoke as NarrowLiteralInstruction).narrowLiteral == 0,
            "the licence refresh's revoke flag is not false",
        )

        // 6. Fix Galaxy Buds3 Pro widget: both stock config launches go through the extension, the
        //    size publisher reports only the current measurement and invalidation keeps it.
        val configuration = "Lapp/template/extension/smartlauncher/WidgetConfiguration;"
        val configLaunches = methods.filter { (_, m) ->
            m.instructions().any { insn ->
                insn.methodRef()?.let { ref ->
                    ref.definingClass == configuration && ref.name == "startConfiguration"
                } == true
            }
        }
        assertEquals(2, configLaunches.size, "expected two patched widget config launches, found ${configLaunches.size}")
        for ((cls, method) in configLaunches) {
            assertTrue(
                method.instructions().none { it.methodRef()?.name == "startAppWidgetConfigureActivityForResult" },
                "${cls.type}->${method.name} still calls the stock config launch",
            )
        }

        val sizing = "Lapp/template/extension/smartlauncher/WidgetSizing;"
        val sizeUpdate = classes.single { it.type == "Lhec;" }.methods.single { m ->
            m.name == "e" && m.params() == listOf("Landroid/content/Context;", "I", "Laz4;", "F", "F", "Z")
        }
        val sizeInstructions = sizeUpdate.instructions()
        val updateIndex = sizeInstructions.indexOfFirst { insn ->
            insn.methodRef()?.let { ref ->
                ref.definingClass == sizing && ref.name == "updateBudsSize"
            } == true
        }
        assertTrue(updateIndex >= 0, "the size publisher is not wrapped")
        assertTrue(updateIndex + 3 < sizeInstructions.size, "the size wrapper is truncated")
        assertEquals(Opcode.MOVE_RESULT, sizeInstructions[updateIndex + 1].opcode, "the size wrapper result is not read")
        assertEquals(Opcode.IF_EQZ, sizeInstructions[updateIndex + 2].opcode, "the size wrapper result is not branched on")
        assertEquals(Opcode.RETURN_VOID, sizeInstructions[updateIndex + 3].opcode, "the Buds size path does not return before the stock path")

        val invalidation = classes.single { it.type == "Laac;" }.methods.single { m ->
            m.name == "invokeSuspend" && m.params() == listOf("Ljava/lang/Object;")
        }
        assertTrue(
            invalidation.instructions().any { insn ->
                insn.methodRef()?.let { ref ->
                    ref.definingClass == sizing && ref.name == "invalidateWidgetSize"
                } == true
            },
            "the size invalidation is not wrapped",
        )
        assertTrue(
            invalidation.instructions().none { it.methodRef()?.name == "updateAppWidgetOptions" },
            "the stock size invalidation is still called",
        )
    }
}
