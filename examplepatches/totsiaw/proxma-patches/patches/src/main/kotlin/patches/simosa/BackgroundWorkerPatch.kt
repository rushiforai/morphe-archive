package patches.simosa

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.util.ReferenceUtil
import org.w3c.dom.Element

/*
 * Background daily check-in.
 *
 * Simosa 3.3.5 ships androidx.work 2.8+ and initialises it through androidx.startup, but it has no
 * worker subclass of its own, so there is nothing to hook: an earlier build of this feature pointed
 * at `com.jazz.jazzworld.presentation.ClaimWorker`, a class that only ever existed in manually
 * patched APKs, and the fingerprint missed on every stock install.
 *
 * So the worker is ours: `DailyCheckinWorker` lives in the extension dex, extends
 * androidx.work.Worker, and is enqueued as unique periodic work (`proxma_simosa_checkin`,
 * ExistingPeriodicWorkPolicy.KEEP, every 24 h, network required). Its doWork() runs
 * BackgroundCheckin.doCheckIn() and then WorkerNotify.notifyStatus().
 *
 * This patch only has to make the app call DailyCheckinWorker.schedule(context) once —
 * MainActivity.onCreate. One instruction, no registers touched beyond p0, no try/catch: if the
 * anchor is missing the patch fails loudly instead of shipping a build where nothing runs.
 *
 * The login data on disk is encrypted, and the key is only put in memory by a private method of
 * MainActivity. A process started for the worker has no Activity, so `getUserData(context)` decrypts
 * with an empty key and gets nothing, and every request goes out with no msisdn or token. The patch
 * copies that key setup into `DataManager.proxmaPrimeLogin()`, which the worker calls first.
 */

private const val MAIN_ACTIVITY = "Lcom/jazz/jazzworld/presentation/ui/main/MainActivity;"
private const val DAILY_CHECKIN_WORKER = "Lapp/proxma/simosa/DailyCheckinWorker;"
private const val DATA_MANAGER = "Lcom/jazz/jazzworld/data/manager/DataManager;"
private const val CONTEXT = "Landroid/content/Context;"
private const val BUNDLE = "Landroid/os/Bundle;"

/**
 * MainActivity.onCreate(Bundle) — `protected`, class name unobfuscated, in classes8. This is the
 * only anchor this patch needs.
 */
internal val mainActivityOnCreateFingerprint = Fingerprint(
    returnType = "V",
    accessFlags = listOf(AccessFlags.PROTECTED),
    parameters = listOf(BUNDLE),
    custom = { method, classDef ->
        classDef.type == MAIN_ACTIVITY && method.name == "onCreate"
    },
)

/** MainActivity strips this stray character from the key after setting it. */
private const val LOGIN_KEY_STRIPPED = "\u00c2"

/**
 * Smali for what MainActivity does to set the login key, found by shape because the names around it
 * are obfuscated: `<holder>.a().<setter>("<key>")`, followed by stripping [LOGIN_KEY_STRIPPED].
 */
private fun loginKeySetup(activity: ClassDef): String {
    val setups = activity.methods.mapNotNull { method ->
        if (method.parameterTypes.isNotEmpty() || method.returnType != "V") return@mapNotNull null
        val body = method.implementation?.instructions?.toList() ?: return@mapNotNull null
        if (body.size < 5) return@mapNotNull null
        val opcodes = body.take(5).map { it.opcode }
        if (opcodes != listOf(
                Opcode.SGET_OBJECT, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT,
                Opcode.CONST_STRING, Opcode.INVOKE_VIRTUAL,
            )
        ) {
            return@mapNotNull null
        }
        val strips = body.any {
            it.opcode == Opcode.CONST_STRING &&
                ((it as ReferenceInstruction).reference as StringReference).string == LOGIN_KEY_STRIPPED
        }
        val setter = (body[4] as ReferenceInstruction).reference as MethodReference
        if (!strips || setter.returnType != "V" ||
            setter.parameterTypes.map { it.toString() } != listOf("Ljava/lang/String;")
        ) {
            return@mapNotNull null
        }
        val holder = (body[0] as ReferenceInstruction).reference as FieldReference
        val getter = (body[1] as ReferenceInstruction).reference as MethodReference
        val key = ((body[3] as ReferenceInstruction).reference as StringReference).string
            .replace(LOGIN_KEY_STRIPPED, "")
            .map { "\\u%04x".format(it.code) }
            .joinToString("")
        """
            sget-object v0, ${ReferenceUtil.getReferenceString(holder)}
            invoke-virtual {v0}, ${ReferenceUtil.getReferenceString(getter)}
            move-result-object v0
            const-string v1, "$key"
            invoke-virtual {v0, v1}, ${ReferenceUtil.getReferenceString(setter)}
            return-void
        """
    }
    return setups.singleOrNull()
        ?: throw PatchException("Expected one login key setup in MainActivity, found ${setups.size}")
}

private const val SYSTEM_FOREGROUND_SERVICE = "androidx.work.impl.foreground.SystemForegroundService"

/*
 * DailyCheckinWorker runs as a dataSync foreground service (WorkManager's setForegroundAsync), since
 * ColorOS kills a plain background job mid-run. Simosa declares WorkManager's SystemForegroundService
 * without a foregroundServiceType, and at targetSdk 34+ startForeground with a type the manifest does
 * not declare is refused, so declare dataSync on it (merged with any type already set). Simosa
 * already holds FOREGROUND_SERVICE and FOREGROUND_SERVICE_DATA_SYNC; they are added only if missing.
 */
private val foregroundServiceManifestPatch = resourcePatch {
    finalize {
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            val permissions = doc.getElementsByTagName("uses-permission")
            listOf(
                "android.permission.FOREGROUND_SERVICE",
                "android.permission.FOREGROUND_SERVICE_DATA_SYNC",
            ).forEach { permission ->
                if ((0 until permissions.length).none {
                        (permissions.item(it) as Element).getAttribute("android:name") == permission
                    }
                ) {
                    manifest.insertBefore(
                        doc.createElement("uses-permission").apply { setAttribute("android:name", permission) },
                        manifest.firstChild,
                    )
                }
            }

            val services = doc.getElementsByTagName("service")
            val service = (0 until services.length).map { services.item(it) as Element }
                .firstOrNull { it.getAttribute("android:name") == SYSTEM_FOREGROUND_SERVICE }
                ?: doc.createElement("service").apply {
                    setAttribute("android:name", SYSTEM_FOREGROUND_SERVICE)
                    setAttribute("android:exported", "false")
                    doc.getElementsByTagName("application").item(0).appendChild(this)
                }
            val types = service.getAttribute("android:foregroundServiceType")
                .split('|').filter { it.isNotBlank() }.toMutableSet()
            types += "dataSync"
            service.setAttribute("android:foregroundServiceType", types.joinToString("|"))
        }
    }
}

@Suppress("unused")
val backgroundWorkerPatch = bytecodePatch(
    name = "Background daily check-in worker",
    description = "Runs the Simosa daily check-in from a 24-hour WorkManager job that this patch " +
        "adds to the app, with two-tier token auth, stale-token retry, a per-account day latch " +
        "and a status notification.",
) {
    compatibleWith(COMPATIBILITY_SIMOSA)
    extendWith("extensions/extension.mpe")
    dependsOn(foregroundServiceManifestPatch)

    execute {
        val onCreate = mainActivityOnCreateFingerprint.method
        val instructions = onCreate.instructions.toList()

        // Insert right after the super call, before the splash screen is installed: the worker
        // enqueue is idempotent (KEEP) and cheap, and it must happen even if onCreate throws later.
        val superCall = instructions.indexOfFirst { instruction ->
            if (instruction.opcode != Opcode.INVOKE_SUPER) {
                return@indexOfFirst false
            }
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ?: return@indexOfFirst false
            reference.name == "onCreate" &&
                reference.parameterTypes.size == 1 &&
                reference.parameterTypes.first().toString() == BUNDLE
        }
        if (superCall < 0) {
            throw PatchException(
                "MainActivity.onCreate has no invoke-super onCreate(Bundle) to anchor the worker on",
            )
        }

        // p0 is the activity itself, and an Activity is a Context, so the call needs no register
        // of its own and cannot clobber the method's live values.
        onCreate.addInstructions(
            superCall + 1,
            "invoke-static {p0}, $DAILY_CHECKIN_WORKER->schedule($CONTEXT)V",
        )

        mutableClassDefBy(DATA_MANAGER).addProxmaMethod(
            "proxmaPrimeLogin", emptyList(), "V", 3,
            loginKeySetup(mutableClassDefBy(MAIN_ACTIVITY)),
        )
    }
}
