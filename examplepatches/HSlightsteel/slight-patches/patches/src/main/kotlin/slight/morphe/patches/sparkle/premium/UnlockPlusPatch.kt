package slight.morphe.patches.sparkle.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method

@Suppress("unused")
val unlockPlusPatch = bytecodePatch(
    name = "Unlock Plus",
    description = "Unlocks Sparkle TV's Plus features without purchase, including DVR recording, " +
        "timeshift, multiview, VOD (movies & series), multi-source setup, and custom channel/category editing.",
) {
    compatibleWith(
        Compatibility(
            name = "Sparkle TV",
            packageName = "se.hedekonsult.sparkle",
            appIconColor = 0x1A237E,
            targets = listOf(
                AppTarget("2.3.1"),
            ),
        ),
    )

    execute {
        // 1. Bypass the central capability gatekeeper: ph.b0.d(Context, int, int, String)Z.
        // Every UI and player gate checks whether (sync_internal & required_flag) == required_flag
        // via this static helper. Unconditionally returning true unlocks all gated features.
        val gatekeeperClass = classDefByStrings("notification_purchase_timeshift")
            .firstOrNull()
            ?: mutableClassDefByOrNull("Lph/b0;")
            ?: throw PatchException("Sparkle: gatekeeper class (ph.b0) not found.")
        val mutableGatekeeperClass = mutableClassDefBy(gatekeeperClass)

        val gateMethod = mutableGatekeeperClass.methods.firstOrNull { method: Method ->
            method.returnType == "Z" &&
                method.parameterTypes == listOf("Landroid/content/Context;", "I", "I", "Ljava/lang/String;") &&
                AccessFlags.STATIC.isSet(method.accessFlags)
        } ?: throw PatchException("Sparkle: gatekeeper method (Context, int, int, String)Z not found.")

        gateMethod.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // 1b. Bypass b0.G(Context)Z device compatibility check.
        // MainActivity.onStart() calls b0.G(this) and if it returns false, the app launches
        // IncompatibleDeviceActivity and calls finish(), killing the app before any UI renders.
        // This is a safety net for non-standard TV configurations or emulators.
        mutableGatekeeperClass.methods.firstOrNull { method: Method ->
            method.name == "G" &&
                method.returnType == "Z" &&
                method.parameterTypes == listOf("Landroid/content/Context;") &&
                AccessFlags.STATIC.isSet(method.accessFlags)
        }?.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // 2. Patch MainActivity:
        // 2a. Force sync_internal distribution in MainActivity.H(int).
        // Overriding parameter p1 to 0xFF (255) ensures all components receive all feature flags
        // while remaining a valid positive integer (f24955s >= 0).
        val mainActivity = mutableClassDefByOrNull("Lse/hedekonsult/sparkle/MainActivity;")
            ?: throw PatchException("Sparkle: MainActivity not found.")

        val syncMethod = mainActivity.methods.firstOrNull { method: Method ->
            method.name == "H" &&
                method.returnType == "V" &&
                method.parameterTypes == listOf("I")
        } ?: throw PatchException("Sparkle: MainActivity.H(int) distribution method not found.")

        syncMethod.addInstructions(0, "const/16 p1, 0xff")

        // 2b. Seed startup_time (1000L) in SharedPreferences at MainActivity.onCreate(Bundle).
        // MainActivity.onCreate has a large register frame (10+ registers), so using v0..v3 is 100% safe
        // and avoids the VerifyError register overflow that occurs if injected into small 1-register methods.
        // Setting startup_time = 1000L (1000 % 10 == 0) completely neutralizes the background anti-tamper
        // deletion traps in TaskReceiver (line 197), SetupActivity (line 2944), and e0 (line 43).
        val mainActivityOnCreate = mainActivity.methods.firstOrNull { method: Method ->
            method.name == "onCreate" &&
                method.returnType == "V" &&
                method.parameterTypes == listOf("Landroid/os/Bundle;")
        } ?: throw PatchException("Sparkle: MainActivity.onCreate(Bundle) not found.")

        mainActivityOnCreate.addInstructions(
            0,
            """
                invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
                move-result-object v0
                invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v0
                const-string v1, "startup_time"
                const-wide/16 v2, 0x3e8
                invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences${'$'}Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences${'$'}Editor;
                move-result-object v0
                invoke-interface {v0}, Landroid/content/SharedPreferences${'$'}Editor;->apply()V
            """,
        )

        // 3. Patch LibUtils native bridges (LibUtils.x, LibUtils.h, LibUtils.w, feature getters, and string constants).
        val libUtilsClass = classDefByStrings("libutilsJNI")
            .firstOrNull()
            ?: mutableClassDefByOrNull("Lse/hedekonsult/utils/LibUtils;")
            ?: throw PatchException("Sparkle: LibUtils class not found.")
        val mutableLibUtils = mutableClassDefBy(libUtilsClass)

        // 3a. LibUtils.x(MainActivity) -> void: Simple return-void.
        // Uses 0 registers and instantly bypasses calling the native xpoe32871a method.
        mutableLibUtils.methods.firstOrNull { method: Method ->
            method.name == "x" &&
                method.returnType == "V" &&
                AccessFlags.STATIC.isSet(method.accessFlags)
        }?.addInstructions(
            0,
            """
                return-void
            """,
        )

        // 3b. LibUtils.h(Context, ArrayList) -> int (force return 0xFF = 255)
        mutableLibUtils.methods.firstOrNull { method: Method ->
            method.name == "h" &&
                method.returnType == "I" &&
                AccessFlags.STATIC.isSet(method.accessFlags)
        }?.addInstructions(
            0,
            """
                const/16 v0, 0xff
                return v0
            """,
        )

        // 3c. LibUtils.w() -> boolean (neutralize anti-debug check)
        mutableLibUtils.methods.firstOrNull { method: Method ->
            method.name == "w" &&
                method.returnType == "Z" &&
                method.parameterTypes.isEmpty() &&
                AccessFlags.STATIC.isSet(method.accessFlags)
        }?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // 3d. LibUtils.y(Context, String, String) -> boolean (purchase signature verify bypass)
        mutableLibUtils.methods.firstOrNull { method: Method ->
            method.name == "y" &&
                method.returnType == "Z" &&
                AccessFlags.STATIC.isSet(method.accessFlags)
        }?.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // Feature bitmask getters in LibUtils for offline/JNI resilience:
        val featureFlags = mapOf(
            "f" to "0x1",  // Multi-source setup (1)
            "e" to "0x2",  // EPG & channel art cache (2)
            "c" to "0x4",  // Live TV preview session (4)
            "u" to "0x8",  // Timeshift / Catch-up (8)
            "a" to "0x10", // DVR / Recordings (16)
            "v" to "0x20", // VOD / Movies & Series (32)
            "g" to "0x40", // Multiview (64)
            "b" to "0x80", // Category / Channel Editing (128)
        )

        for ((methodName, flagHex) in featureFlags) {
            mutableLibUtils.methods.firstOrNull { method: Method ->
                method.name == methodName &&
                    method.returnType == "I" &&
                    method.parameterTypes.isEmpty() &&
                    AccessFlags.STATIC.isSet(method.accessFlags)
            }?.addInstructions(
                0,
                """
                    const/16 v0, $flagHex
                    return v0
                """,
            )
        }

        // Product SKU and name string getters in LibUtils:
        val stringGetters = mapOf(
            "i" to "Plus Subscription",
            "j" to "Plus",
            "k" to "sparkle_contribute_support_1",
            "l" to "sparkle_contribute_support_2",
            "m" to "sparkle_contribute_support_3",
            "n" to "sparkle_plus",
            "o" to "sparkle_plus_connected",
            "r" to "sparkle_plus_subscription_month",
            "s" to "sparkle_plus_subscription_year",
            "t" to "Shared Plus",
        )

        for ((methodName, stringVal) in stringGetters) {
            mutableLibUtils.methods.firstOrNull { method: Method ->
                method.name == methodName &&
                    method.returnType == "Ljava/lang/String;" &&
                    method.parameterTypes.isEmpty() &&
                    AccessFlags.STATIC.isSet(method.accessFlags)
            }?.addInstructions(
                0,
                """
                    const-string v0, "$stringVal"
                    return-object v0
                """,
            )
        }

        // Native string getters p(Context) and q(Context) hooked for resilience:
        mutableLibUtils.methods.firstOrNull { method: Method ->
            method.name == "p" &&
                method.returnType == "Ljava/lang/String;" &&
                method.parameterTypes == listOf("Landroid/content/Context;") &&
                AccessFlags.STATIC.isSet(method.accessFlags)
        }?.addInstructions(
            0,
            """
                const-string v0, ""
                return-object v0
            """,
        )

        mutableLibUtils.methods.firstOrNull { method: Method ->
            method.name == "q" &&
                method.returnType == "Ljava/lang/String;" &&
                method.parameterTypes == listOf("Landroid/content/Context;") &&
                AccessFlags.STATIC.isSet(method.accessFlags)
        }?.addInstructions(
            0,
            """
                const-string v0, ""
                return-object v0
            """,
        )

        // 4. Force sync_internal in SetupActivity fragments (Add Source, Edit Source, Add XMLTV EPG).
        // SetupActivity$j: Sources setup overview fragment ("Add new source")
        val setupJClass = mutableClassDefByOrNull("Lse/hedekonsult/tvlibrary/core/ui/SetupActivity\$j;")
            ?: classDefByStrings("setup_sources")
                .firstOrNull()
                ?.let { mutableClassDefBy(it) }

        setupJClass?.methods?.firstOrNull { method: Method ->
            method.name == "q1" &&
                method.returnType == "V" &&
                method.parameterTypes.isEmpty()
        }?.let { method ->
            val intFieldName = setupJClass.fields.firstOrNull { it.type == "I" }?.name ?: "r0"
            method.addInstructions(
                0,
                """
                    const/16 v0, 0xff
                    iput v0, p0, ${setupJClass.type}->$intFieldName:I
                """,
            )
        }

        // SetupActivity$d: Source EPG settings fragment ("Add XMLTV EPG")
        val setupDClass = mutableClassDefByOrNull("Lse/hedekonsult/tvlibrary/core/ui/SetupActivity\$d;")
            ?: classDefByStrings("setup_input_settings_epg")
                .firstOrNull()
                ?.let { mutableClassDefBy(it) }

        setupDClass?.methods?.firstOrNull { method: Method ->
            method.name == "q1" &&
                method.returnType == "V" &&
                method.parameterTypes.isEmpty()
        }?.let { method ->
            val intFieldName = setupDClass.fields.firstOrNull { it.type == "I" }?.name ?: "q0"
            method.addInstructions(
                0,
                """
                    const/16 v0, 0xff
                    iput v0, p0, ${setupDClass.type}->$intFieldName:I
                """,
            )
        }

        // SetupActivity$a: Add Source type selection fragment
        val setupAClass = mutableClassDefByOrNull("Lse/hedekonsult/tvlibrary/core/ui/SetupActivity\$a;")
            ?: classDefByStrings("setup_source_add_description")
                .firstOrNull()
                ?.let { mutableClassDefBy(it) }

        setupAClass?.methods?.firstOrNull { method: Method ->
            method.name == "S1" &&
                method.returnType == "V" &&
                method.parameterTypes == listOf("Ljava/util/ArrayList;")
        }?.let { method ->
            val intFieldName = setupAClass.fields.firstOrNull { it.type == "I" }?.name ?: "q0"
            method.addInstructions(
                0,
                """
                    const/16 v0, 0xff
                    iput v0, p0, ${setupAClass.type}->$intFieldName:I
                """,
            )
        }
    }
}
