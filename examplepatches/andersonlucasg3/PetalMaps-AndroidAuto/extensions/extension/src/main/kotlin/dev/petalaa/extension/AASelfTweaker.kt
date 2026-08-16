package dev.petalaa.extension

import android.content.Context
import android.content.SharedPreferences
import android.content.pm.PackageManager
import android.database.sqlite.SQLiteDatabase
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.util.Base64
import android.widget.Toast
import java.io.File
import java.security.MessageDigest
import java.security.cert.CertificateFactory
import java.security.cert.X509Certificate
import java.util.concurrent.Executors

/**
 * Self-registration tweaker for the Android Auto allowlist.
 *
 * Called (via bytecode patch) from `MapApplication.onCreate()` of the host
 * Petal Maps APK. On every invocation it runs three phases:
 *
 *  0. **Installer phase** — ensures the package's installer is
 *     `com.android.vending`. When a sideloaded app has a different installer
 *     (e.g. the ROM's package installer), this phase re-installs the APK via
 *     `pm install -r -t -i com.android.vending`, which kills the process.
 *     On the next launch the installer is correct and the remaining phases
 *     run. An anti-loop guard in SharedPreferences prevents repeated
 *     re-installs for the same app version.
 *  1. **Phenotype phase** — verifies, against a root copy of the GMS
 *     phenotype database, whether our own package is present in the
 *     `app_white_list` flag override. If it is, nothing happens; otherwise
 *     the full registration flow runs.
 *  2. **Finsky phase** — forges the two local Play Store
 *     (com.android.vending) checks that the Android Auto validator performs
 *     on sideloaded apps: an `appstate` row in `localappstate.db` and two
 *     `ownership` rows in `library.db` keyed by our signing certificate
 *     hash. This runs on EVERY launch (even when phase 1 is a no-op),
 *     because a Finsky sync may silently wipe the forged rows.
 *
 * ## Safety contract
 *
 * - All work happens on a background single-thread executor, never on the
 *   main thread (this is invoked from `Application.onCreate`).
 * - Every failure is swallowed and logged under the `PetalAA` tag. This
 *   object must NEVER crash the host app, regardless of root state, GMS
 *   version, or database schema drift.
 * - Idempotent and self-healing: the database is the single source of truth.
 *   No blind SharedPreferences caching — if GMS wipes the overrides, the
 *   next call re-applies them.
 */
object AASelfTweaker {

    private const val GMS_PACKAGE = "com.google.android.gms"
    private const val GMS_CAR_PACKAGE = "com.google.android.gms.car"
    private const val GEARHEAD_PACKAGE = "com.google.android.projection.gearhead"
    private const val PHENOTYPE_DB_PATH =
        "/data/data/com.google.android.gms/databases/phenotype.db"
    private const val WORK_DB_NAME = "phenotype_work.db"

    private const val VENDING_PACKAGE = "com.android.vending"
    private const val VENDING_DATA_DIR = "/data/data/com.android.vending"
    private const val LOCAL_APP_STATE_DB_PATH = "$VENDING_DATA_DIR/databases/localappstate.db"
    private const val LIBRARY_DB_PATH = "$VENDING_DATA_DIR/databases/library.db"
    private const val WORK_APPSTATE_DB_NAME = "finsky_appstate_work.db"
    private const val WORK_LIBRARY_DB_NAME = "finsky_library_work.db"

    private const val FLAG_APP_WHITE_LIST = "app_white_list"
    private const val FLAG_BROADCAST_WHITELIST = "car_connect_broadcast_whitelist"

    // SharedPreferences keys for installer-phase guard.
    // We track (installer, success) instead of versionCode because the Petal Maps
    // versionCode is constant (40700322) across our patches — a version-based guard
    // would never allow a retry after the user re-patches and the installer flips
    // back to the ROM's package installer.
    private const val PREFS_NAME = "petalaa_tweaker"
    private const val PREF_LAST_SPOOF_INSTALLER = "last_spoof_installer"
    private const val PREF_LAST_SPOOF_SUCCESS = "last_spoof_success"

    // flag_overrides.type values (new phenotype schema).
    private const val TYPE_BOOL = 1
    private const val TYPE_STRING = 4

    private val executor = Executors.newSingleThreadExecutor { runnable ->
        Thread(runnable, "PetalAA-Tweaker").apply { isDaemon = true }
    }

    /**
     * Entry point patched into `MapApplication.onCreate()`. Dispatches the
     * check/registration to a background thread and returns immediately.
     *
     * PUBLIC CONTRACT — do not change this signature.
     */
    @JvmStatic
    fun ensureRegistered(context: Context) {
        val appContext = context.applicationContext
        // Initialize the logger for this process
        AALogger.init(appContext)
        AALogger.installCrashHandler()
        executor.execute {
            try {
                checkAndRegister(appContext)
            } catch (t: Throwable) {
                // Never propagate: the host app must survive any failure here.
                AALogger.e("ensureRegistered: unexpected failure", t)
            }
        }
    }

    // ---- Core flow ---------------------------------------------------------

    private fun checkAndRegister(context: Context) {
        // 1. Root check via shared RootShell helper.
        if (!RootShell.detect()) {
            AALogger.w("Root not available — skipping")
            return
        }

        val ourPackage = context.packageName
        AALogger.i("Root OK. Ensuring Android Auto registration for '$ourPackage'")

        // 2. Phase 0 — ensure installer is com.android.vending.
        //    If this phase triggers a re-install, the process is killed and
        //    the remaining phases run on the next launch.
        val installerOk = ensurePlayStoreInstaller(context, ourPackage)

        // 3. Phase 1 — GMS phenotype allowlist.
        val phenotypeOk = ensurePhenotypeOverrides(context, ourPackage)

        // 4. Phase 2 — Finsky (Play Store) local databases. Runs on EVERY
        //    launch, even when phase 1 was a no-op: a Finsky sync may silently
        //    wipe the forged rows, and the idempotency check re-applies them
        //    only when missing.
        val finskyOk = ensureFinskyRows(context, ourPackage)

        // 5. Phase 3 — Warm up Play Store: battery whitelist + process startup.
        //    On ROMs with aggressive Doze (MIUI/HyperOS), the Play Store process
        //    is killed in background. When the Android Auto validator connects,
        //    it binds to PlayGearheadService in com.android.vending; if the
        //    process is dead, the bind fails with
        //    "isPackageInstalledByPlayCheck service not connected" and the app
        //    is rejected. This phase ensures the Play Store process is alive
        //    and not killed by Doze before the user goes to the car.
        //    Runs AFTER the force-stop of vending (phase 2) so the warmed-up
        //    process already has the forged rows in memory.
        val playWarmupOk = warmUpPlayStore()

        // 6. Single summary toast.
        val installerStatus = when {
            installerOk -> "OK"
            else -> "FAILED"
        }
        AALogger.i(
            "Registration summary: " +
                "installer=$installerStatus, " +
                "phenotype=${if (phenotypeOk) "OK" else "FAILED"}, " +
                "finsky=${if (finskyOk) "OK" else "FAILED"}, " +
                "playWarmup=${if (playWarmupOk) "OK" else "FAILED"}"
        )
        when {
            installerOk && phenotypeOk && finskyOk && playWarmupOk ->
                showToast(context, "Petal AA: ready for Android Auto")
            !installerOk ->
                showToast(context, "Petal AA: installer fix failed — see logs")
            !phenotypeOk && !finskyOk ->
                showToast(context, "Petal AA: registration failed (phenotype + finsky) — see logs")
            !phenotypeOk ->
                showToast(context, "Petal AA: phenotype registration failed — see logs")
            !finskyOk ->
                showToast(context, "Petal AA: finsky forge failed — see logs")
            !playWarmupOk ->
                showToast(context, "Petal AA: ready (Play warmup partial) — see logs")
            else ->
                showToast(context, "Petal AA: ready for Android Auto")
        }
        // Copy log to /sdcard for easy retrieval
        AALogger.shareableCopy()
    }

    // ---- Phase 0 — Play Store installer fix ---------------------------------

    /**
     * Phase 0 — ensures our package's installer is com.android.vending.
     *
     * Android Auto's CAR.VALIDATOR rejects apps whose installerPackageName is
     * not the Play Store. When installed via Morphe Manager (or any sideload
     * tool), the installer is the ROM's package installer, which causes the
     * "failed all other checks" rejection.
     *
     * This phase:
     *  1. Reads the current installer via PackageManager.
     *  2. If already com.android.vending → no-op.
     *  3. Otherwise, re-installs the APK with `pm install -r -t -i com.android.vending`,
     *     which sets the installer to the Play Store package.
     *
     * The re-install kills this process immediately. On the next launch the
     * installer is correct and the remaining phases run.
     *
     * Anti-loop guard: SharedPreferences track (last_spoof_installer,
     * last_spoof_success). If the current installer matches a previous attempt
     * that failed, we skip to avoid a restart loop. When the user re-patches
     * (installer changes again), the guard allows a new attempt. We do NOT use
     * versionCode because the Petal Maps versionCode is constant across our
     * patches and would permanently block retries.
     *
     * Returns true when the installer is already correct or the re-install
     * command reported success (the process will be killed right after).
     * Returns false on any failure (caller continues with remaining phases).
     */
    @Suppress("DEPRECATION")
    private fun ensurePlayStoreInstaller(context: Context, pkg: String): Boolean {
        val pm = context.packageManager

        // 1. Read current installer.
        val currentInstaller = try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                pm.getInstallSourceInfo(pkg).installingPackageName
            } else {
                // Deprecated but still works on API < 30.
                pm.getInstallerPackageName(pkg)
            }
        } catch (t: Throwable) {
            AALogger.e("Could not read installer for '$pkg'", t)
            return false
        }

        if (currentInstaller == VENDING_PACKAGE) {
            AALogger.i("Installer already $VENDING_PACKAGE — nothing to do")
            return true
        }

        AALogger.i("Installer is '$currentInstaller' (expected $VENDING_PACKAGE)")

        // 2. Anti-loop guard: skip if we already failed with this exact installer.
        //    Allows retry when the user re-patches (installer changes), but blocks
        //    infinite loops when pm install keeps failing for the same installer.
        val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
        val lastSpoofInstaller = prefs.getString(PREF_LAST_SPOOF_INSTALLER, null)
        val lastSpoofSuccess = prefs.getBoolean(PREF_LAST_SPOOF_SUCCESS, false)
        if (!lastSpoofSuccess && lastSpoofInstaller == currentInstaller) {
            AALogger.w(
                "Installer spoof already failed for '$currentInstaller' — " +
                    "skipping to avoid loop"
            )
            return false
        }

        // 3. Obtain our own APK path from PackageManager.
        val sourceDir = try {
            context.applicationInfo.sourceDir
        } catch (t: Throwable) {
            AALogger.e("Could not read sourceDir for '$pkg'", t)
            return false
        }

        // 5. Notify the user that the app is about to close.
        val msg = "Petal AA: reinstalling as Play Store app — app will close; reopen it"
        AALogger.i(msg)
        showToast(context, msg)

        // 4. Run the re-install via root. This kills our process on success.
        val cmd = "pm install -r -t -i $VENDING_PACKAGE $sourceDir"
        AALogger.i("Executing: $cmd")
        val (exit, out, err) = RootShell.run(cmd, timeoutSec = 60)
        val success = exit == 0 && out.contains("Success", ignoreCase = true)

        // Persist guard state BEFORE the process dies (on success) so the next
        // launch knows whether to retry.
        prefs.edit()
            .putString(PREF_LAST_SPOOF_INSTALLER, currentInstaller)
            .putBoolean(PREF_LAST_SPOOF_SUCCESS, success)
            .apply()

        if (success) {
            AALogger.i("pm install succeeded — app will be restarted by the system")
        } else {
            AALogger.e(
                "pm install failed (exit=$exit):\nOUT: ${out.trim()}\nERR: ${err.trim()}"
            )
        }
        return success
    }

    // ---- Phase 1 — GMS phenotype allowlist ----------------------------------

    /**
     * Phase 1 — verifies/registers our package in the GMS phenotype
     * allowlist. Returns true when the package is whitelisted (already
     * present or successfully registered), false on any failure.
     */
    private fun ensurePhenotypeOverrides(context: Context, ourPackage: String): Boolean {
        // 1. Kill GMS first so it does not rewrite the db while we work on it.
        RootShell.run("am kill all $GMS_PACKAGE")

        // 2. Snapshot uid/gid of the original db for later restoration.
        val (statExit, statOut, _) = RootShell.run("stat -c '%u %g' $PHENOTYPE_DB_PATH")
        val ownerIds = statOut.trim().split(Regex("\\s+"))
        if (statExit != 0 || ownerIds.size < 2) {
            AALogger.w("Could not stat phenotype.db (exit=$statExit, out='$statOut') — skipping")
            return false
        }
        val uid = ownerIds[0]
        val gid = ownerIds[1]

        // 3. Copy the db (plus WAL/SHM if present) into our private dir.
        val workDb = File(context.filesDir, WORK_DB_NAME)
        if (!copyDbToWorkDir(workDb)) {
            AALogger.w("Failed to copy phenotype.db to work dir — skipping")
            return false
        }

        var success = false
        try {
            // 4. Open the COPY read/write. Never touch the original directly.
            val db = SQLiteDatabase.openDatabase(
                workDb.absolutePath, null, SQLiteDatabase.OPEN_READWRITE
            )
            try {
                val hasNewSchema = tableExists(db, "flag_overrides")
                val hasLegacySchema = tableExists(db, "FlagOverrides")
                when {
                    hasNewSchema -> {
                        AALogger.i("New phenotype schema detected (flag_overrides)")
                        if (isPackageWhitelistedNewSchema(db, ourPackage)) {
                            AALogger.i("'$ourPackage' already in $FLAG_APP_WHITE_LIST — nothing to do")
                            return true
                        }
                        AALogger.i("'$ourPackage' missing from allowlist — registering (new schema)")
                        applyNewSchemaOverrides(db, ourPackage)
                    }
                    hasLegacySchema -> {
                        AALogger.i("Legacy phenotype schema detected (FlagOverrides)")
                        if (isPackageWhitelisted(db, ourPackage)) {
                            AALogger.i("'$ourPackage' already in $FLAG_APP_WHITE_LIST — nothing to do")
                            return true
                        }
                        AALogger.i("'$ourPackage' missing from allowlist — registering (legacy schema)")
                        applyFlagOverrides(db, ourPackage)
                    }
                    else -> {
                        AALogger.w("No known overrides table (flag_overrides / FlagOverrides) " +
                                "— unsupported GMS schema, skipping")
                        return false
                    }
                }

                // 5. Checkpoint the WAL so all changes live in the main db file
                //    before we copy it back over the original.
                checkpointWal(db)
            } finally {
                runCatching { db.close() }
            }

            // 6. Push the patched copy back over the original.
            val (cpExit, _, cpErr) = RootShell.run("cp ${workDb.absolutePath} $PHENOTYPE_DB_PATH")
            if (cpExit != 0) {
                AALogger.e("Failed to copy patched db back: $cpErr")
                return false
            }
            AALogger.i("Patched db copied back to $PHENOTYPE_DB_PATH")

            // 6b. Drop stale WAL/SHM at the destination so GMS cannot replay an
            //     old journal over the patched db.
            val (rmExit, _, rmErr) = RootShell.run("rm -f $PHENOTYPE_DB_PATH-wal $PHENOTYPE_DB_PATH-shm")
            if (rmExit != 0) {
                AALogger.w("rm of stale -wal/-shm failed (exit=$rmExit): $rmErr")
            }

            // 7. Restore ownership and SELinux context so GMS can open the db.
            RootShell.run("chown $uid:$gid $PHENOTYPE_DB_PATH")
            val (rcExit, _, rcErr) = RootShell.run("restorecon $PHENOTYPE_DB_PATH")
            if (rcExit != 0) {
                // restorecon may not exist on some ROMs — not fatal.
                AALogger.d("restorecon failed/absent (exit=$rcExit): $rcErr")
            }

            // 8. Restart Android Auto so it re-reads the flags.
            RootShell.run("am force-stop $GEARHEAD_PACKAGE")

            success = true
        } catch (t: Throwable) {
            AALogger.e("Phenotype registration flow failed", t)
        } finally {
            deleteWorkDb(workDb)
        }

        if (success) {
            AALogger.i("Registered '$ourPackage' in Android Auto allowlist (phenotype)")
        }
        return success
    }

    // ---- Finsky forge (Play Store local validation) -------------------------

    /**
     * Phase 2 — forges the two local Finsky (com.android.vending) checks that
     * the Android Auto validator performs against sideloaded apps:
     *
     *   1. localappstate.db / appstate — one row for our package.
     *   2. library.db / ownership — two rows ("u-tpl" without hash, library
     *      "3" with our signing certificate hash), mirroring what a
     *      Play-installed AA app has.
     *
     * Idempotent: when the appstate row AND an ownership row carrying the
     * CURRENT certificate hash already exist, nothing is written and the
     * originals are left untouched. Returns true when the rows are in place,
     * false on any failure.
     */
    private fun ensureFinskyRows(context: Context, pkg: String): Boolean {
        AALogger.i("Finsky forge: checking rows for '$pkg'")

        // 1. Compute the certificate hash first — no root needed.
        val hash = getCertificateHash(context)
        if (hash == null) {
            AALogger.e("Finsky forge: signing certificate hash unavailable — skipping")
            return false
        }
        AALogger.i("Finsky forge: certificate hash='$hash'")

        // 2. Stop vending so it does not rewrite the dbs while we work on them.
        RootShell.run("am force-stop $VENDING_PACKAGE")

        // 3. Discover the owner (uid:gid) of the vending dbs at runtime —
        //    it varies by device/ROM and must never be hardcoded.
        //    `ls -ln` is available everywhere; `stat -c` misbehaves in some
        //    root shells when called from an app process.
        var owner = ""
        val (lsExit, lsOut, _) = RootShell.run("ls -ln $LOCAL_APP_STATE_DB_PATH")
        if (lsExit == 0) {
            // -rw-rw---- 1 10150 10150 ... -> fields[2]=uid fields[3]=gid
            val parts = lsOut.trim().split(Regex("\\s+"))
            if (parts.size >= 4 && parts[2].all { it.isDigit() }) {
                owner = "${parts[2]}:${parts[3]}"
            }
        }
        if (owner.isEmpty()) {
            // Fallback: "package:com.android.vending uid:10150,1010150,..."
            val (_, pkgOut, _) = RootShell.run("cmd package list packages -U $VENDING_PACKAGE")
            val uidMatch = Regex("uid:(\\d+)").find(pkgOut)
            if (uidMatch != null) {
                owner = "${uidMatch.groupValues[1]}:${uidMatch.groupValues[1]}"
            }
        }
        if (owner.isEmpty()) {
            AALogger.w("Finsky forge: could not determine vending owner " +
                    "(ls exit=$lsExit, out='${lsOut.trim()}') — skipping")
            return false
        }
        AALogger.i("Finsky forge: vending data owner=$owner")

        // 4. Copy both dbs (plus WAL/SHM when present) into our private dir.
        val workAppState = File(context.filesDir, WORK_APPSTATE_DB_NAME)
        val workLibrary = File(context.filesDir, WORK_LIBRARY_DB_NAME)
        if (!copyFinskyDbs(workAppState, workLibrary)) {
            deleteWorkDb(workAppState)
            deleteWorkDb(workLibrary)
            return false
        }

        try {
            var appStateDirty = false
            var libraryDirty = false

            // 5. appstate: exactly one row keyed by package_name.
            val appStateDb = SQLiteDatabase.openDatabase(
                workAppState.absolutePath, null, SQLiteDatabase.OPEN_READWRITE
            )
            try {
                if (!tableExists(appStateDb, "appstate")) {
                    AALogger.w("Finsky forge: 'appstate' table missing — unsupported schema")
                    return false
                }
                if (rowExists(
                        appStateDb,
                        "SELECT 1 FROM appstate WHERE package_name=?", arrayOf(pkg)
                    )
                ) {
                    AALogger.i("Finsky forge: appstate row for '$pkg' already present")
                } else {
                    insertAppStateRow(appStateDb, pkg)
                    appStateDirty = true
                }
                checkpointWal(appStateDb)
            } finally {
                runCatching { appStateDb.close() }
            }

            // 6. ownership: discover a real Play account from the db, then check/insert.
            //    The Finsky service queries with account!='' and backend=3;
            //    rows with account='' (from old forges) are ignored by it.
            val libraryDb = SQLiteDatabase.openDatabase(
                workLibrary.absolutePath, null, SQLiteDatabase.OPEN_READWRITE
            )
            try {
                if (!tableExists(libraryDb, "ownership")) {
                    AALogger.w("Finsky forge: 'ownership' table missing — unsupported schema")
                    return false
                }
                val account = discoverFinskyAccount(libraryDb)
                AALogger.i("Finsky forge: discovered account='$account'")
                // Idempotency: a row counts only if it matches the account and
                // backend the Finsky service actually queries (backend=3).
                // Old rows with account='' or backend=0 do NOT satisfy this.
                if (rowExists(
                        libraryDb,
                        "SELECT 1 FROM ownership WHERE doc_id=? AND app_certificate_hash=? " +
                            "AND account=? AND backend=3",
                        arrayOf(pkg, hash, account)
                    )
                ) {
                    AALogger.i("Finsky forge: ownership row with our hash already present (account='$account')")
                } else {
                    insertOwnershipRows(libraryDb, pkg, hash, account)
                    libraryDirty = true
                }
                checkpointWal(libraryDb)
            } finally {
                runCatching { libraryDb.close() }
            }

            if (!appStateDirty && !libraryDirty) {
                AALogger.i("Finsky forge: all rows already in place — nothing written")
                return true
            }

            // 7. Push the patched copies back over the originals and restore
            //    ownership/permissions/SELinux context so vending can open them.
            if (!pushBackFinskyDbs(workAppState, workLibrary, owner, appStateDirty, libraryDirty)) {
                return false
            }

            // 8. Restart vending and Android Auto so the next bind re-reads
            //    the forged rows.
            RootShell.run("am force-stop $VENDING_PACKAGE")
            RootShell.run("am force-stop $GEARHEAD_PACKAGE")

            AALogger.i(
                "Finsky forge: rows forged for '$pkg' " +
                    "(appState written=$appStateDirty, ownership written=$libraryDirty)"
            )
            return true
        } catch (t: Throwable) {
            AALogger.e("Finsky forge failed", t)
            return false
        } finally {
            deleteWorkDb(workAppState)
            deleteWorkDb(workLibrary)
        }
    }

    // ---- Phase 3 — Play Store warmup (battery whitelist + process startup) ----

    /**
     * Phase 3 — warms up the Play Store process so the Android Auto validator
     * can bind to PlayGearheadService without failing.
     *
     * On ROMs with aggressive Doze (MIUI/HyperOS), the Play Store process is
     * killed in background. When the validator connects to the car, it binds
     * to `com.google.android.finsky.services.PlayGearheadService` in
     * `com.android.vending`; if the process is dead, the bind fails with
     * "isPackageInstalledByPlayCheck service not connected" and the app is
     * rejected.
     *
     * This phase:
     *   1. Adds com.android.vending to the deviceidle whitelist (battery
     *      optimization bypass, idempotent).
     *   2. Attempts to start the PlayGearheadService via explicit component.
     *   3. Falls back to starting the Play Store main activity if the service
     *      cannot be started directly.
     *   4. Last resort: monkey to launch the Play Store process.
     *
     * Returns true when at least one method succeeded in starting the process.
     */
    private fun warmUpPlayStore(): Boolean {
        // Step 1: Battery whitelist — idempotent, always run.
        val (wlExit, wlOut, wlErr) = RootShell.run("dumpsys deviceidle whitelist +$VENDING_PACKAGE")
        if (wlExit == 0) {
            AALogger.i("Play warmup: battery whitelist added ($VENDING_PACKAGE)")
        } else {
            AALogger.w(
                "Play warmup: deviceidle whitelist failed (exit=$wlExit, " +
                    "out='${wlOut.trim()}', err='${wlErr.trim()}')"
            )
        }

        // Step 2: Try to start PlayGearheadService via explicit component.
        // Source: com.android.vending manifest declares
        //   <service android:name="com.google.android.finsky.services.PlayGearheadService"
        //            android:exported="true"/>
        // (see: https://gist.github.com/daniiielsistrapped/68621e491b4b6ac7e40b5107b190dbea)
        val serviceComponent = "$VENDING_PACKAGE/com.google.android.finsky.services.PlayGearheadService"
        val (svcExit, svcOut, svcErr) = RootShell.run("am startservice -n $serviceComponent", timeoutSec = 10)
        if (svcExit == 0 || svcOut.contains("Started", ignoreCase = true)) {
            AALogger.i("Play warmup: PlayGearheadService started via explicit component")
            return true
        }
        AALogger.d(
            "Play warmup: startservice PlayGearheadService failed (exit=$svcExit, " +
                "out='${svcOut.trim()}', err='${svcErr.trim()}')"
        )

        // Step 3: Fallback — start the Play Store main activity (brings up UI,
        // but reliably starts the process with all services).
        val (actExit, actOut, actErr) = RootShell.run(
            "am start -n $VENDING_PACKAGE/com.google.android.finsky.activities.MainActivity",
            timeoutSec = 10
        )
        if (actExit == 0 || actOut.contains("Started", ignoreCase = true)) {
            AALogger.i("Play warmup: Play Store MainActivity started (fallback)")
            return true
        }
        AALogger.d(
            "Play warmup: MainActivity start failed (exit=$actExit, " +
                "out='${actOut.trim()}', err='${actErr.trim()}')"
        )

        // Step 4: Last resort — monkey to launch the Play Store process.
        // This is ugly (flashes UI) but is the most reliable way to start
        // the process on stubborn ROMs.
        val (mkExit, mkOut, mkErr) = RootShell.run(
            "monkey -p $VENDING_PACKAGE -c android.intent.category.LAUNCHER 1",
            timeoutSec = 15
        )
        if (mkExit == 0 || mkOut.contains("Events injected: 1")) {
            AALogger.i("Play warmup: monkey launched Play Store (last resort)")
            return true
        }
        AALogger.e(
            "Play warmup: monkey failed (exit=$mkExit, " +
                "out='${mkOut.trim()}', err='${mkErr.trim()}')"
        )

        AALogger.e("Play warmup: all methods failed — Play Store process may not be reachable")
        return false
    }

    /**
     * Computes the 27-character base64url (no padding) SHA-1 of our own
     * signing certificate DER — the value Finsky stores in
     * `ownership.app_certificate_hash`.
     */
    @Suppress("DEPRECATION")
    private fun getCertificateHash(context: Context): String? {
        return try {
            val pm = context.packageManager
            val signature = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                pm.getPackageInfo(context.packageName, PackageManager.GET_SIGNING_CERTIFICATES)
                    .signingInfo?.apkContentsSigners?.firstOrNull()
            } else {
                pm.getPackageInfo(context.packageName, PackageManager.GET_SIGNATURES)
                    .signatures?.firstOrNull()
            } ?: run {
                AALogger.e("No signing certificate found for '${context.packageName}'")
                return null
            }
            val cert = CertificateFactory.getInstance("X.509")
                .generateCertificate(signature.toByteArray().inputStream()) as X509Certificate
            val sha1 = MessageDigest.getInstance("SHA-1").digest(cert.encoded)
            Base64.encodeToString(sha1, Base64.URL_SAFE or Base64.NO_PADDING or Base64.NO_WRAP)
        } catch (t: Throwable) {
            AALogger.e("getCertificateHash failed", t)
            null
        }
    }

    /** INSERT OR REPLACE the single appstate row mirroring a Play-installed app. */
    private fun insertAppStateRow(db: SQLiteDatabase, pkg: String) {
        val now = System.currentTimeMillis()
        AALogger.i("Finsky forge: INSERT appstate package_name='$pkg' first_download_ms=$now")
        db.execSQL(
            "INSERT OR REPLACE INTO appstate(" +
                "package_name,account,first_download_ms,persistent_flags," +
                "permissions_version,install_reason,sandbox_version," +
                "desired_version,installer_state,flags" +
                ") VALUES (?,'',?,1,1,'unknown',1,-1,0,0)",
            arrayOf<Any>(pkg, now)
        )
    }

    /**
 * Discovers a real Google account from the ownership table so our forged
 * rows match the schema the Finsky service actually queries. Returns "" if
 * no account is found (device without a logged-in Play account).
 */
    private fun discoverFinskyAccount(db: SQLiteDatabase): String {
        return runCatching {
            db.rawQuery("SELECT account FROM ownership WHERE account != '' LIMIT 1", null).use {
                if (it.moveToFirst()) it.getString(0) else ""
            }
        }.getOrElse {
            ""
        }
    }

    /**
     * INSERT OR REPLACE the two ownership rows mirroring a Play-installed app:
     *   1. library "u-tpl" — empty certificate hash (match-all entry).
     *   2. library "3"     — our [hash], shareability=2.
     *
     * Columns match the real rows the Finsky service queries:
     *   account=<discovered>, backend=3, doc_type=1, offer_type=1.
     * Using backend=0 or account='' causes the PlayGearheadService query to
     * return empty, leading to "app owners empty" rejection.
     */
    private fun insertOwnershipRows(db: SQLiteDatabase, pkg: String, hash: String, account: String) {
        val now = System.currentTimeMillis()
        AALogger.i("Finsky forge: INSERT ownership doc_id='$pkg' library_id='u-tpl' account='$account' hash=''")
        db.execSQL(
            "INSERT OR REPLACE INTO ownership(" +
                "library_id,backend,account,doc_id,doc_type,offer_type," +
                "app_certificate_hash,shareability,purchase_time" +
                ") VALUES ('u-tpl',3,?,?,'1',1,'',2,?)",
            arrayOf<Any>(account, pkg, now)
        )
        AALogger.i("Finsky forge: INSERT ownership doc_id='$pkg' library_id='3' account='$account' hash='$hash'")
        db.execSQL(
            "INSERT OR REPLACE INTO ownership(" +
                "library_id,backend,account,doc_id,doc_type,offer_type," +
                "app_certificate_hash,shareability,purchase_time" +
                ") VALUES ('3',3,?,?,'1',1,?,2,?)",
            arrayOf<Any>(account, pkg, hash, now)
        )
    }

    /** Copies [originalPath] (and -wal/-shm when present) into [workDb]. */
    /**
     * Copies both Finsky dbs (and WAL/SHM companions) into our private dir in
     * a SINGLE su session. Some root solutions hand each `su -c` call a
     * different mount namespace, which made per-file copies fail with
     * "No such file or directory" right after `ls` saw the same file.
     * The result is verified from the app side (exists + readable + writable).
     */
    private fun copyFinskyDbs(workAppState: File, workLibrary: File): Boolean {
        val cmd = "cp $LOCAL_APP_STATE_DB_PATH ${workAppState.absolutePath}; " +
            "cp $LIBRARY_DB_PATH ${workLibrary.absolutePath}; " +
            "cp ${LOCAL_APP_STATE_DB_PATH}-wal ${workAppState.absolutePath}-wal 2>/dev/null; " +
            "cp ${LOCAL_APP_STATE_DB_PATH}-shm ${workAppState.absolutePath}-shm 2>/dev/null; " +
            "cp ${LIBRARY_DB_PATH}-wal ${workLibrary.absolutePath}-wal 2>/dev/null; " +
            "cp ${LIBRARY_DB_PATH}-shm ${workLibrary.absolutePath}-shm 2>/dev/null; " +
            "chmod 666 ${workAppState.absolutePath} ${workLibrary.absolutePath} " +
            "${workAppState.absolutePath}-wal ${workAppState.absolutePath}-shm " +
            "${workLibrary.absolutePath}-wal ${workLibrary.absolutePath}-shm 2>/dev/null; " +
            "true"
        val (exit, out, err) = RootShell.run(cmd)
        val ok = workAppState.canRead() && workAppState.canWrite() &&
            workLibrary.canRead() && workLibrary.canWrite()
        if (!ok) {
            AALogger.e(
                "Finsky forge: db copies not usable " +
                    "(exit=$exit, out='${out.trim()}', err='${err.trim()}')"
            )
            return false
        }
        return true
    }

    /**
     * Copies the patched dbs back over the originals in a SINGLE su session,
     * drops stale WAL/SHM at the destination, and restores owner/permissions/
     * SELinux context so Finsky can open them.
     */
    private fun pushBackFinskyDbs(
        workAppState: File,
        workLibrary: File,
        owner: String,
        pushAppState: Boolean,
        pushLibrary: Boolean
    ): Boolean {
        val parts = mutableListOf<String>()
        if (pushAppState) parts.add("cp ${workAppState.absolutePath} $LOCAL_APP_STATE_DB_PATH")
        if (pushLibrary) parts.add("cp ${workLibrary.absolutePath} $LIBRARY_DB_PATH")
        parts.add(
            "rm -f $LOCAL_APP_STATE_DB_PATH-wal $LOCAL_APP_STATE_DB_PATH-shm " +
                "$LIBRARY_DB_PATH-wal $LIBRARY_DB_PATH-shm"
        )
        parts.add("chown $owner $LOCAL_APP_STATE_DB_PATH $LIBRARY_DB_PATH")
        parts.add("chmod 660 $LOCAL_APP_STATE_DB_PATH $LIBRARY_DB_PATH")
        val cmd = parts.joinToString(" && ") +
            "; restorecon $LOCAL_APP_STATE_DB_PATH $LIBRARY_DB_PATH 2>/dev/null || true"
        val (exit, _, err) = RootShell.run(cmd)
        if (exit != 0) {
            AALogger.e("Finsky forge: failed to copy patched dbs back (exit=$exit): ${err.trim()}")
            return false
        }
        AALogger.i("Finsky forge: patched dbs restored")
        return true
    }

    /** True when [sql] returns at least one row. Never throws. */
    private fun rowExists(db: SQLiteDatabase, sql: String, args: Array<String>): Boolean {
        return runCatching {
            db.rawQuery(sql, args).use { it.moveToFirst() }
        }.getOrElse {
            AALogger.e("Query failed: $sql", it)
            false
        }
    }

    /** Checkpoints the WAL so all changes live in the main db file. */
    private fun checkpointWal(db: SQLiteDatabase) {
        runCatching {
            db.rawQuery("PRAGMA wal_checkpoint(TRUNCATE)", null).use { it.moveToFirst() }
        }
    }

    /** Deletes a work db copy plus its WAL/SHM companions. */
    private fun deleteWorkDb(workDb: File) {
        runCatching { workDb.delete() }
        runCatching { File(workDb.absolutePath + "-wal").delete() }
        runCatching { File(workDb.absolutePath + "-shm").delete() }
    }

    // ---- Database helpers ---------------------------------------------------

    /** Copies phenotype.db (and -wal/-shm when present) into [workDb]. */
    private fun copyDbToWorkDir(workDb: File): Boolean {
        val (cpExit, _, cpErr) = RootShell.run("cp $PHENOTYPE_DB_PATH ${workDb.absolutePath}")
        if (cpExit != 0) {
            AALogger.e("cp of phenotype.db failed: $cpErr")
            return false
        }
        // WAL/SHM companions are optional; ignore failures.
        RootShell.run("cp $PHENOTYPE_DB_PATH-wal ${workDb.absolutePath}-wal")
        RootShell.run("cp $PHENOTYPE_DB_PATH-shm ${workDb.absolutePath}-shm")
        // Root-copied files are root-owned; make them readable by our process.
        RootShell.run("chmod 666 ${workDb.absolutePath} ${workDb.absolutePath}-wal ${workDb.absolutePath}-shm")
        return true
    }

    private fun tableExists(db: SQLiteDatabase, table: String): Boolean {
        db.rawQuery(
            "SELECT 1 FROM sqlite_master WHERE type='table' AND name=?", arrayOf(table)
        ).use { return it.moveToFirst() }
    }

    /** True when [pkg] already appears in the `app_white_list` override. */
    private fun isPackageWhitelisted(db: SQLiteDatabase, pkg: String): Boolean {
        val current = readOverrideValue(db, GMS_CAR_PACKAGE, FLAG_APP_WHITE_LIST) ?: return false
        AALogger.i("Current $FLAG_APP_WHITE_LIST value: '$current'")
        return current.split(',').any { it.trim() == pkg }
    }

    private fun readOverrideValue(db: SQLiteDatabase, packageName: String, name: String): String? {
        return runCatching {
            db.rawQuery(
                "SELECT stringVal FROM FlagOverrides WHERE packageName=? AND name=?",
                arrayOf(packageName, name)
            ).use { cursor ->
                if (cursor.moveToFirst() && !cursor.isNull(0)) cursor.getString(0) else null
            }
        }.getOrElse {
            AALogger.e("Could not read override '$name'", it)
            null
        }
    }

    // ---- New schema (flag_overrides, GMS >= 26.x) --------------------------

    /**
     * Resolves the numeric `config_package_id` for a config package name.
     * IDs are device-specific (e.g. 230 for gms.car on the test device), so
     * they must be looked up at runtime. An exact name match is preferred
     * over a prefix (LIKE 'prefix%') match when several rows qualify.
     */
    private fun resolveConfigPackageId(db: SQLiteDatabase, packagePrefix: String): Long? {
        return runCatching {
            db.rawQuery(
                "SELECT config_package_id, name FROM config_packages WHERE name LIKE ?",
                arrayOf("$packagePrefix%")
            ).use { cursor ->
                var firstId: Long? = null
                while (cursor.moveToNext()) {
                    val id = cursor.getLong(0)
                    val name = cursor.getString(1)
                    if (firstId == null) firstId = id
                    if (name == packagePrefix) {
                        AALogger.i("Resolved config_package_id=$id for exact match '$name'")
                        return@use id
                    }
                }
                firstId?.also {
                    AALogger.i("Resolved config_package_id=$it for prefix '$packagePrefix%'")
                }
            }
        }.getOrElse {
            AALogger.e("Failed to resolve config_package_id for '$packagePrefix'", it)
            null
        }
    }

    /** Reads a `flag_overrides.value` for the given config package (new schema). */
    private fun readNewOverrideValue(
        db: SQLiteDatabase, configPackageId: Long, name: String
    ): String? {
        return runCatching {
            db.rawQuery(
                "SELECT value FROM flag_overrides " +
                    "WHERE config_package_id=? AND account_id=0 AND active=1 AND name=?",
                arrayOf(configPackageId.toString(), name)
            ).use { cursor ->
                if (cursor.moveToFirst() && !cursor.isNull(0)) cursor.getString(0) else null
            }
        }.getOrElse {
            AALogger.e("Could not read new-schema override '$name'", it)
            null
        }
    }

    /** True when [pkg] already appears in `app_white_list` (new schema). */
    private fun isPackageWhitelistedNewSchema(db: SQLiteDatabase, pkg: String): Boolean {
        val gmsCarId = resolveConfigPackageId(db, GMS_CAR_PACKAGE) ?: run {
            AALogger.w("config_packages has no entry for '$GMS_CAR_PACKAGE' — cannot verify")
            return false
        }
        val current = readNewOverrideValue(db, gmsCarId, FLAG_APP_WHITE_LIST) ?: return false
        AALogger.i("Current $FLAG_APP_WHITE_LIST value: '$current'")
        return current.split(',').any { it.trim() == pkg }
    }

    /** INSERT OR REPLACE one row into flag_overrides (new schema), with logging. */
    private fun putNewOverride(
        db: SQLiteDatabase, configPackageId: Long, name: String, value: String, type: Int
    ) {
        AALogger.i("INSERT flag_overrides: config_package_id=$configPackageId " +
                "name='$name' value='$value' type=$type")
        db.execSQL(
            "INSERT OR REPLACE INTO flag_overrides " +
                "(config_package_id, config_package_name, account_id, active, name, value, type, source) " +
                "VALUES (?, NULL, 0, 1, ?, ?, ?, 0)",
            arrayOf<Any>(configPackageId, name, value, type)
        )
    }

    /**
     * Applies the full override set using the new `flag_overrides` schema.
     * String flags merge our package into the existing CSV (preserving other
     * apps' entries); boolean flags are unconditional.
     */
    private fun applyNewSchemaOverrides(db: SQLiteDatabase, pkg: String) {
        val gmsCarId = resolveConfigPackageId(db, GMS_CAR_PACKAGE)
        val gearheadId = resolveConfigPackageId(db, GEARHEAD_PACKAGE)
        if (gmsCarId == null && gearheadId == null) {
            AALogger.w("Could not resolve any config_package_id — nothing written")
            return
        }

        if (gmsCarId != null) {
            val mergedWhiteList = mergeCsv(
                readNewOverrideValue(db, gmsCarId, FLAG_APP_WHITE_LIST), pkg
            )
            val mergedBroadcast = mergeCsv(
                readNewOverrideValue(db, gmsCarId, FLAG_BROADCAST_WHITELIST), pkg
            )
            putNewOverride(db, gmsCarId, FLAG_APP_WHITE_LIST, mergedWhiteList, TYPE_STRING)
            putNewOverride(db, gmsCarId, FLAG_BROADCAST_WHITELIST, mergedBroadcast, TYPE_STRING)
            putNewOverride(db, gmsCarId, "should_bypass_validation", "1", TYPE_BOOL)
            putNewOverride(
                db, gmsCarId,
                "FrameworkCarProjectionValidatorFlags__use_package_manager_api_for_installed_by_play_check",
                "0", TYPE_BOOL
            )
        } else {
            AALogger.w("No config_package_id for '$GMS_CAR_PACKAGE' — gms.car flags skipped")
        }

        if (gearheadId != null) {
            putNewOverride(db, gearheadId, "AppValidation__should_bypass_validation", "1", TYPE_BOOL)
            putNewOverride(db, gearheadId, "AppValidation__play_install_api", "0", TYPE_BOOL)
            putNewOverride(db, gearheadId, "AppValidation__allowed_package_list", "", TYPE_STRING)
            putNewOverride(db, gearheadId, "AppValidation__blocked_packages_by_installer", "", TYPE_STRING)
            putNewOverride(db, gearheadId, "UnknownSources__allow_full_screen_apps", "1", TYPE_BOOL)
        } else {
            AALogger.w("No config_package_id for '$GEARHEAD_PACKAGE' — gearhead flags skipped")
        }

        // Best effort: the Flags table may not exist in the new schema.
        runCatching {
            db.execSQL("DELETE FROM Flags WHERE name='app_black_list'")
            AALogger.i("DELETE FROM Flags WHERE name='app_black_list' executed")
        }.onFailure {
            AALogger.d("DELETE FROM Flags skipped (table absent?): ${it.message}")
        }
    }

    /**
     * CSV-merge [pkg] into [current]: appends our package only if absent.
     * Never drops packages registered by other apps.
     */
    private fun mergeCsv(current: String?, pkg: String): String {
        if (current.isNullOrBlank()) return pkg
        val entries = current.split(',').map { it.trim() }.filter { it.isNotEmpty() }
        if (entries.any { it == pkg }) return entries.joinToString(",")
        return (entries + pkg).joinToString(",")
    }

    /**
     * Applies the full set of FlagOverrides rows. String-valued rows merge our
     * package into the existing CSV; boolean rows are unconditional.
     */
    private fun applyFlagOverrides(db: SQLiteDatabase, pkg: String) {
        runCatching { db.execSQL("DROP TRIGGER IF EXISTS aa_patched_apps") }
            .onFailure { AALogger.d("DROP TRIGGER aa_patched_apps skipped: ${it.message}") }

        // Merged CSV overrides — preserve entries from other apps.
        val mergedWhiteList = mergeCsv(
            readOverrideValue(db, GMS_CAR_PACKAGE, FLAG_APP_WHITE_LIST), pkg
        )
        val mergedBroadcast = mergeCsv(
            readOverrideValue(db, GMS_CAR_PACKAGE, FLAG_BROADCAST_WHITELIST), pkg
        )

        AALogger.i("INSERT FlagOverrides: name='$FLAG_APP_WHITE_LIST' stringVal='$mergedWhiteList'")
        db.execSQL(
            "INSERT OR REPLACE INTO FlagOverrides " +
                "(packageName,flagType,name,user,stringVal,committed) VALUES (?,0,?,?,?,0)",
            arrayOf(GMS_CAR_PACKAGE, FLAG_APP_WHITE_LIST, "", mergedWhiteList)
        )
        AALogger.i("INSERT FlagOverrides: name='$FLAG_BROADCAST_WHITELIST' stringVal='$mergedBroadcast'")
        db.execSQL(
            "INSERT OR REPLACE INTO FlagOverrides " +
                "(packageName,flagType,name,user,stringVal,committed) VALUES (?,0,?,?,?,0)",
            arrayOf(GMS_CAR_PACKAGE, FLAG_BROADCAST_WHITELIST, "", mergedBroadcast)
        )

        // Empty-string overrides: clear gearhead-side validation lists.
        val emptyStringRows = listOf(
            GEARHEAD_PACKAGE to "AppValidation__allowed_package_list",
            GEARHEAD_PACKAGE to "AppValidation__blocked_packages_by_installer"
        )
        for ((owner, name) in emptyStringRows) {
            AALogger.i("INSERT FlagOverrides: package='$owner' name='$name' stringVal=''")
            db.execSQL(
                "INSERT OR REPLACE INTO FlagOverrides " +
                    "(packageName,flagType,name,user,stringVal,committed) VALUES (?,0,?,'','',0)",
                arrayOf(owner, name)
            )
        }

        // Boolean overrides: bypass validation on both gearhead and gms.car.
        val boolRows = listOf(
            Triple(GEARHEAD_PACKAGE, "AppValidation__should_bypass_validation", 1),
            Triple(GEARHEAD_PACKAGE, "AppValidation__play_install_api", 0),
            Triple(GMS_CAR_PACKAGE, "should_bypass_validation", 1),
            Triple(
                GMS_CAR_PACKAGE,
                "FrameworkCarProjectionValidatorFlags__use_package_manager_api_for_installed_by_play_check",
                0
            ),
            Triple(GEARHEAD_PACKAGE, "UnknownSources__allow_full_screen_apps", 1)
        )
        for ((owner, name, value) in boolRows) {
            AALogger.i("INSERT FlagOverrides: package='$owner' name='$name' boolVal=$value")
            db.execSQL(
                "INSERT OR REPLACE INTO FlagOverrides " +
                    "(packageName,flagType,name,user,boolVal,committed) VALUES (?,0,?,'',?,0)",
                arrayOf<Any>(owner, name, value)
            )
        }

        runCatching {
            db.execSQL("DELETE FROM Flags WHERE name='app_black_list'")
            AALogger.i("DELETE FROM Flags WHERE name='app_black_list' executed")
        }.onFailure {
            AALogger.d("DELETE FROM Flags skipped (table absent?): ${it.message}")
        }
    }

    // ---- UI helpers -------------------------------------------------

    private fun showToast(context: Context, message: String) {
        Handler(Looper.getMainLooper()).post {
            runCatching {
                Toast.makeText(context, message, Toast.LENGTH_LONG).show()
            }
        }
    }
}
