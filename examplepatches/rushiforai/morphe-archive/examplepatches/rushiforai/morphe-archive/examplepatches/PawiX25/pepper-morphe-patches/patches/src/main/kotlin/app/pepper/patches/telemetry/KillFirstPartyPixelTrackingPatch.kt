package app.pepper.patches.telemetry

import app.morphe.patcher.util.proxy.mutableTypes.MutableField
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import app.pepper.patches.shared.clearBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x

/**
 * Two method-body patches that kill Pepper's first-party
 * tracking machinery:
 *
 *  1. `AnalyticsEventTransmissionWorker.a(Continuation)` — Pepper's
 *     CoroutineWorker that fires server-pushed tracking-pixel URLs
 *     (Pepper Ocular `/batch_receiver_app`, `onClickTrackingPixelUrl`,
 *     `onImpressionTrackingPixelUrl`, `bannerOnClickTrackingPixelUrl`,
 *     `productClickedTrackingPixelUrl`, etc) stored in the local Room
 *     DB on user interaction. Replacing the entire method body with
 *     `return Result.Success()` short-circuits the firing loop —
 *     pixel URLs are still STORED in DB but never POSTed outbound.
 *
 *     Why we replace the whole body instead of just neutering the URL
 *     constants: the runtime URL is concatenated from per-event base
 *     domains pushed by the Pepper server (NOT a static constant in
 *     the dex), so a string-redirect pass cannot reach it. The worker
 *     is the only place this pipeline runs, so NOPping it kills 100%
 *     of server-pushed pixel firings — including future schemas where
 *     the URL is built differently.
 *
 *  2. `Lw05;->intercept(Las5;)Ltz9;` — the Pepper-Hardware-Id OkHttp
 *     interceptor. Stock code:
 *         iget-object p0, p0, Lw05;->a:Ljava/lang/String;   ; load HW-ID
 *         if-eqz p0, :cond_1                                 ; null-check
 *         ...adds "Pepper-Hardware-Id: <id>" header...
 *     We replace the `iget-object` with an `invoke-static` to a
 *     synthesized helper method on the same class
 *     `Lw05;->revancedGetMockHwid()Ljava/lang/String;` that returns a
 *     per-install random UUID persisted in SharedPreferences (file
 *     `revanced_pepper`, key `mock_hwid`). Generated once on first
 *     access via `UUID.randomUUID()`, cached in a static field for
 *     subsequent calls. Application Context is obtained via reflection
 *     on `android.app.ActivityThread.currentApplication()` so the
 *     helper works from any callsite — including method bodies that
 *     don't have a Context parameter (interceptor.intercept and the
 *     ReadDeviceData data-class constructor).
 *
 *     The header MUST be present and MUST match the value sent in the
 *     POST `/device` body — otherwise `/rest_api/v2/dealbot/enable`
 *     returns error 20001 ("Żądane urządzenie nie zostało znalezione")
 *     and Daily Picks stops working. Both call sites (the device
 *     registration and the interceptor) use the SAME helper, so the
 *     server sees consistent identifiers from one install.
 *
 * Both fingerprints survive R8 obfuscation across builds:
 *  - The worker is matched by its NON-obfuscated class name (Pepper
 *    keeps its own package names) plus method shape.
 *  - The interceptor is matched by the unique string literal
 *    "Pepper-Hardware-Id" that survives obfuscation as-is.
 *
 * Result.Success class is discovered dynamically at patch time:
 *   1. Find Worker.doWork() return type (the obfuscated Result base).
 *   2. Among that base's subclasses, the one with NO instance fields is
 *      Result.Success (Failure and Retry both carry an `outputData` field).
 *
 * This dodges hard-coding the obfuscated class name (which shifts per
 * release).
 */
@Suppress("unused")
val killFirstPartyPixelTrackingPatch = bytecodePatch(
    name = "Kill Pepper first-party pixel tracking",
    description = "Blocks Pepper's first-party pixel-tracking pings and replaces " +
        "the device-fingerprint header with a per-install random UUID.",
) {
    compatibleWith(*PEPPER_FAMILY)

    // SharedPreferences file + key used by the synthesized helper to
    // persist the per-install UUID. File is private to Pepper's package
    // (Context.MODE_PRIVATE = 0). Naming it `revanced_pepper` makes the
    // origin obvious in `/data/data/com.tippingcanoe.pepperpl/shared_prefs/`
    // for anyone debugging.
    val mockHwidPrefsFile = "revanced_pepper"
    val mockHwidPrefsKey = "mock_hwid"
    val mockHwidFieldName = "revancedMockHwid"
    val mockHwidGetterName = "revancedGetMockHwid"

    execute {
        // Discover the obfuscated Result base type and the Result.Success
        // subclass type. Survives obfuscation drift between Pepper releases.
        val workerClass = classDefByOrNull("Landroidx/work/Worker;")
            ?: throw PatchException("Worker class not found in dex")
        val resultBaseType = workerClass.methods
            .firstOrNull { it.name == "doWork" && it.parameterTypes.isEmpty() }
            ?.returnType
            ?: throw PatchException("Worker.doWork() not found")
        require(resultBaseType.startsWith("L") && resultBaseType.endsWith(";")) {
            "Worker.doWork return type unexpected: $resultBaseType"
        }
        val successClass = classDefByOrNull { classDef ->
            // Success has no INSTANCE fields. Failure/Retry have one
            // `outputData` field each. Static fields (constants) don't count.
            classDef.superclass == resultBaseType &&
                classDef.fields.none { f ->
                    (f.accessFlags and AccessFlags.STATIC.value) == 0
                }
        }
            ?: throw PatchException(
                "Could not identify Worker.Result.Success class (no $resultBaseType " +
                    "subclass with zero instance fields). Result class layout may " +
                    "have changed.",
            )
        val successType = successClass.type

        // === Patch 1: AnalyticsEventTransmissionWorker.a → return Success() ===
        run {
            val method = PixelWorkerDoWorkFingerprint.method
            method.clearBody()
            method.addInstructions(
                0,
                """
                new-instance v0, $successType
                invoke-direct { v0 }, Ljava/lang/Object;-><init>()V
                return-object v0
                """.trimIndent(),
            )
        }

        // === Helper injection: synthesize Lw05;->revancedMockHwid + revancedGetMockHwid() ===
        //
        // Both Patch 2 (ReadDeviceData ctor) and Patch 3 (interceptor) need
        // the SAME UUID at runtime so the registered device row and the
        // request header agree. We synthesize a static helper on the
        // interceptor class that lazy-loads/persists a per-install random
        // UUID via SharedPreferences, with an in-process static cache to
        // avoid hitting prefs on the hot path.
        //
        // We host on the interceptor class (Lw05; in stock 8.13.00) because:
        //   - it's already mutable in this patch (Patch 3 modifies it),
        //   - it's a tiny class with no <clinit> work that could race us,
        //   - it has a stable identity matched by a unique string fingerprint
        //     (the "Pepper-Hardware-Id" literal), which means we don't need
        //     to know its obfuscated name ahead of time.
        val interceptorMethod = PepperHardwareIdInterceptorFingerprint.method
        val interceptorType = interceptorMethod.definingClass
        val helperGetterRef =
            "$interceptorType->$mockHwidGetterName()Ljava/lang/String;"
        val helperFieldRef =
            "$interceptorType->$mockHwidFieldName:Ljava/lang/String;"

        run {
            val interceptorClassDef = classDefByOrNull { it.type == interceptorType }
                ?: throw PatchException(
                    "Interceptor class $interceptorType not found in dex",
                )
            val mutableInterceptor = mutableClassDefBy(interceptorClassDef)

            // Static field holding the in-process UUID cache.
            if (mutableInterceptor.fields.none { it.name == mockHwidFieldName }) {
                val newField = MutableField(
                    ImmutableField(
                        interceptorType,
                        mockHwidFieldName,
                        "Ljava/lang/String;",
                        AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                        null,
                        null,
                        emptySet(),
                    ),
                )
                // Add to both the master `fields` set and the lazily-filtered
                // `staticFields` view so dex writers that iterate either path
                // see the new field. Set.add is idempotent so doing both is
                // safe regardless of the lazy view's init state.
                mutableInterceptor.fields.add(newField)
                mutableInterceptor.staticFields.add(newField)
            }

            // Static helper method. We add the method with a minimal valid
            // body (`return-object null`) and then immediately rewrite its
            // body via addInstructions — that way the smali parser handles
            // labels, register sizing, and method-reference resolution for
            // us, instead of us hand-building BuilderInstructions.
            if (mutableInterceptor.methods.none { it.name == mockHwidGetterName }) {
                // Placeholder declares 5 registers up-front because
                // MutableMethodImplementation.registerCount is final after
                // construction (see shared/MethodExtensions.kt) — addInstructions
                // alone won't grow it. The real body uses v0..v4 (the extra
                // v4 holds the empty-string replacement target for the
                // UUID hyphen-strip).
                val placeholderImpl = ImmutableMethodImplementation(
                    5,
                    listOf(
                        ImmutableInstruction11n(Opcode.CONST_4, 0, 0),
                        ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
                    ),
                    emptyList(),
                    null,
                )
                val newMethod = MutableMethod(
                    ImmutableMethod(
                        interceptorType,
                        mockHwidGetterName,
                        emptyList(),
                        "Ljava/lang/String;",
                        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                        emptySet(),
                        emptySet(),
                        placeholderImpl,
                    ),
                )
                mutableInterceptor.methods.add(newMethod)
                // Static methods are "direct" methods in dex — add to the
                // direct-methods view too for the same reason as fields.
                mutableInterceptor.directMethods.add(newMethod)

                // Real body. Logic:
                //   if (cached != null) return cached;
                //   try {
                //     Context ctx = (Context) Class.forName("android.app.ActivityThread")
                //         .getMethod("currentApplication").invoke(null);
                //     SharedPreferences sp = ctx.getSharedPreferences("revanced_pepper", 0);
                //     String id = sp.getString("mock_hwid", null);
                //     if (id == null) {
                //       id = UUID.randomUUID().toString().replace("-", "");
                //       sp.edit().putString("mock_hwid", id).apply();
                //     }
                //     cached = id;
                //     return id;
                //   } catch (Throwable t) {
                //     // ROM/process pathological state — fall back to a
                //     // process-local random ID. Better an unstable mock
                //     // than a crash that breaks the whole interceptor.
                //     String id = UUID.randomUUID().toString().replace("-", "");
                //     cached = id;
                //     return id;
                //   }
                //
                // The hyphen-strip on `UUID.toString()` is load-bearing: the
                // stock Pepper-Hardware-Id is `MD5(android_id).toHex()`, a
                // 32-char lowercase-hex string with no dashes. A vanilla UUID
                // (`xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx`, 36 chars) would
                // be trivially distinguishable from stock by a regex check
                // on the server side. Stripping the dashes leaves 32 hex
                // chars — bit-for-bit shape-compatible with the stock format,
                // so the header looks indistinguishable in transit.
                //
                // 5 registers are sufficient (v0..v4). We replace the
                // 2-instruction placeholder before injecting the real body.
                newMethod.removeInstructions(0, 2)
                newMethod.addInstructions(
                    0,
                    """
                    sget-object v0, $helperFieldRef
                    if-eqz v0, :do_init
                    return-object v0

                    :do_init
                    :try_start_0
                    const-string v1, "android.app.ActivityThread"
                    invoke-static { v1 }, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
                    move-result-object v1
                    const-string v2, "currentApplication"
                    const/4 v3, 0x0
                    new-array v3, v3, [Ljava/lang/Class;
                    invoke-virtual { v1, v2, v3 }, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
                    move-result-object v1
                    const/4 v2, 0x0
                    new-array v3, v2, [Ljava/lang/Object;
                    invoke-virtual { v1, v2, v3 }, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v1
                    check-cast v1, Landroid/content/Context;

                    const-string v2, "$mockHwidPrefsFile"
                    const/4 v3, 0x0
                    invoke-virtual { v1, v2, v3 }, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
                    move-result-object v1

                    const-string v2, "$mockHwidPrefsKey"
                    const/4 v3, 0x0
                    invoke-interface { v1, v2, v3 }, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v0

                    if-nez v0, :persist_done

                    invoke-static { }, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
                    move-result-object v0
                    invoke-virtual { v0 }, Ljava/util/UUID;->toString()Ljava/lang/String;
                    move-result-object v0

                    # Stock format = 32 lowercase hex chars, no dashes.
                    # UUID.toString() includes 4 dashes — strip them so the
                    # shape matches.
                    const-string v3, "-"
                    const-string v4, ""
                    invoke-virtual { v0, v3, v4 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                    move-result-object v0

                    invoke-interface { v1 }, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences${'$'}Editor;
                    move-result-object v1
                    invoke-interface { v1, v2, v0 }, Landroid/content/SharedPreferences${'$'}Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences${'$'}Editor;
                    move-result-object v1
                    invoke-interface { v1 }, Landroid/content/SharedPreferences${'$'}Editor;->apply()V

                    :persist_done
                    sput-object v0, $helperFieldRef
                    return-object v0
                    :try_end_0
                    .catch Ljava/lang/Throwable; { :try_start_0 .. :try_end_0 } :catch_all_0

                    :catch_all_0
                    invoke-static { }, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;
                    move-result-object v0
                    invoke-virtual { v0 }, Ljava/util/UUID;->toString()Ljava/lang/String;
                    move-result-object v0
                    const-string v1, "-"
                    const-string v2, ""
                    invoke-virtual { v0, v1, v2 }, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
                    move-result-object v0
                    sput-object v0, $helperFieldRef
                    return-object v0
                    """.trimIndent(),
                )
            }
        }

        // === Patch 2: ReadDeviceData.hardwareId → helper-provided UUID ===
        //
        // Daily Picks requires the Pepper-Hardware-Id header to match a device
        // record created by POST /device. Mocking only the header makes
        // /dealbot/enable fail with "device not found", because POST /device
        // still registered the real hardware ID. Patch the ReadDeviceData model
        // constructor too, so registration and subsequent headers agree
        // (both call the same helper getter).
        kotlin.run {
            val readDeviceDataClassDef = classDefByOrNull { classDef ->
                classDef.methods.any { method ->
                    val instructions = method.implementation?.instructions?.toList()
                        ?: return@any false
                    instructions.any { instr ->
                        val ref = (instr as? ReferenceInstruction)?.reference as? StringReference
                        ref?.string == "ReadDeviceData(hardwareId="
                    }
                }
            } ?: throw PatchException("ReadDeviceData class not found")

            val readDeviceDataClass = mutableClassDefBy(readDeviceDataClassDef)
            val constructor = readDeviceDataClass.methods.firstOrNull { method ->
                method.name == "<init>" &&
                    method.returnType == "V" &&
                    method.parameterTypes.firstOrNull() == "Ljava/lang/String;"
            } ?: throw PatchException("ReadDeviceData constructor not found")

            val instructions = constructor.implementation!!.instructions.toList()
            val hardwareIdStoreIdx = instructions.indexOfFirst { instr ->
                if (instr.opcode != Opcode.IPUT_OBJECT) return@indexOfFirst false
                val fieldRef = (instr as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@indexOfFirst false
                fieldRef.definingClass == readDeviceDataClassDef.type &&
                    fieldRef.type == "Ljava/lang/String;"
            }
            if (hardwareIdStoreIdx < 0) {
                throw PatchException("ReadDeviceData.hardwareId field store not found")
            }

            // Replace the value of p1 (the hardwareId parameter) with the
            // helper's return value just before the iput-object that stores
            // it into the field. invoke-static + move-result-object together
            // total 4 code units; the iput-object that follows reads p1
            // immediately so we don't need a temporary.
            constructor.addInstructions(
                hardwareIdStoreIdx,
                """
                invoke-static { }, $helperGetterRef
                move-result-object p1
                """.trimIndent(),
            )
        }

        // === Patch 3: Lw05;->intercept → mock Pepper-Hardware-Id ===
        run {
            val method = PepperHardwareIdInterceptorFingerprint.method
            val implementation = method.implementation!!
            val instructions = implementation.instructions.toList()

            // Find the "Pepper-Hardware-Id" const-string — anchor for the
            // header-add region.
            val headerLiteralIdx = instructions.indexOfFirst { instr ->
                if (instr.opcode != Opcode.CONST_STRING && instr.opcode != Opcode.CONST_STRING_JUMBO) {
                    return@indexOfFirst false
                }
                val ref = (instr as? ReferenceInstruction)?.reference as? StringReference
                ref?.string == "Pepper-Hardware-Id"
            }
            if (headerLiteralIdx < 0) {
                throw PatchException(
                    "Pepper-Hardware-Id literal not found inside the matched intercept body",
                )
            }

            // Walk backwards: the last `iget-object` BEFORE the header literal
            // that loads a `Ljava/lang/String;` field is the hardware-ID load.
            // (There is exactly one such instruction in stock 8.13.00 — patchinfo
            // §4 documents this pattern.)
            val igetIdx = (0 until headerLiteralIdx).reversed().firstOrNull { i ->
                val ins = instructions[i]
                if (ins.opcode != Opcode.IGET_OBJECT) return@firstOrNull false
                val fieldRef = (ins as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@firstOrNull false
                fieldRef.type == "Ljava/lang/String;"
            } ?: throw PatchException(
                "Hardware-ID iget-object load not found before Pepper-Hardware-Id literal",
            )

            // The destination register of the iget — that's the post-iget
            // register holding the hardware-ID String. We swap the
            // load-from-field for an `invoke-static` to our helper getter
            // followed by a `move-result-object` into the same register, so
            // the existing null-check and length-check in the interceptor
            // body fall through and the request gets the header with the
            // per-install UUID.
            //
            // The replacement (invoke-static + move-result-object) is 4
            // code units = 8 bytes, vs the original iget-object's 2 code
            // units = 4 bytes. The mutable method-implementation builder
            // recomputes label offsets correctly when an instruction's
            // encoded size changes, so the downstream branch / try-catch
            // ranges in this method's body stay consistent.
            val destRegister = (instructions[igetIdx] as TwoRegisterInstruction).registerA

            method.removeInstructions(igetIdx, 1)
            method.addInstructions(
                igetIdx,
                """
                invoke-static { }, $helperGetterRef
                move-result-object v$destRegister
                """.trimIndent(),
            )
        }
    }
}
