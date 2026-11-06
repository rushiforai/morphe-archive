package app.template.extension.smashyroad2;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.Handler;
import android.os.Looper;
import android.provider.MediaStore;
import android.widget.Toast;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Smashy Road 2 (com.rkgames.basisgame) save patcher.
 *
 * <p>The game is Unity-based and keeps progress in Unity PlayerPrefs:
 * {@code /data/data/com.rkgames.basisgame/shared_prefs/com.rkgames.basisgame.v2.playerprefs.xml}
 *
 * <p>Runs at the very start of UnityPlayerActivity.onCreate, before the Unity
 * player loads PlayerPrefs from disk, so the edited values win the race.
 *
 * <p>Every launch:
 * <ol>
 *   <li>If {@code <ext>/SR2_RESTORE.txt} exists, the pristine backup is copied
 *       back over the live save, the trigger is deleted, a Toast confirms,
 *       and no patching happens.
 *   <li>If no backup exists yet, {@code shared_prefs/} (plus small files from
 *       {@code files/}) is copied to {@code <ext>/morphe_backup/} with a
 *       {@code BACKUP_DONE} marker. The pristine backup is never overwritten.
 *   <li>Cash keys are set to 9,999,999 and every upgrade-card key to 10,000 in
 *       each shared_prefs XML. Pre-patch copies go to {@code <ext>/sr2_debug/}
 *       and a change log is appended, so a missed key can be diagnosed from
 *       real data.
 * </ol>
 *
 * <p>Cash keys (heuristic): any int/long pref whose name starts with "cash" or
 * "money" (case-insensitive) — e.g. cashAmount, moneyAmount.
 *
 * <p>Upgrade-card keys (exact, taken from the game's own string table):
 * {@code {common,rare,epic,legendary}Upgrade{,Value,Value2,ValuePerson}}.
 *
 * <p>Pro Pass: sets the local entitlement flags {@code proPassEnabled},
 * {@code hasProPass} (and the lowercase variant) to 1 / "true" — the same
 * flags the game sets in {@code purchaseProPassComplete}.
 *
 * <p>Slot machine upgrades: the ownership flags {@code hasMachine1},
 * {@code hasMachine2} (blue, 50/spin), {@code hasMachine3} (red, 25/spin,
 * always 3 items) are set to 1 — the same flags the game sets in
 * {@code purchaseMachine1/2/3} after a real purchase. A leftover
 * red-slot-machine name heuristic is kept as a fallback.
 *
 * <p>Missions (REAL mechanism from code analysis, 2026-09-25):
 * {@code mainQuestProgress<N>=1} means "available/in-progress", not complete.
 * The game hardcodes 21 quest IDs; their progress is set to 99. The actual
 * completion flag is {@code mainQuestClaimed<N>=1} (reward claimed = done).
 * Every {@code sideQuestProgress<N>} is maxed to 999999 so all progress
 * targets are exceeded.
 *
 * <p>Durability: the per-rarity health upgrade levels ({@code commonHealth},
 * {@code rareHealth}, {@code epicHealth}, {@code legendaryHealth},
 * {@code mysteryHealth}) are set to 999 so vehicles are at max durability.
 *
 * <p>Never crashes the game: every failure is swallowed after logging.
 */
public final class CoinPatcher {

    private static boolean sRan = false;

    private static final long CASH_AMOUNT = 9_999_999L;
    private static final long CARD_AMOUNT = 10_000L;

    private static final Pattern UPGRADE_KEY = Pattern.compile(
            "^(common|rare|epic|legendary)Upgrade(Value|Value2|ValuePerson)?$");
    private static final Pattern CASH_KEY = Pattern.compile(
            "^(cash|money).*$", Pattern.CASE_INSENSITIVE);

    /**
     * Pro Pass entitlement flags (exact key names from the game's string table;
     * set by purchaseProPassComplete after a real purchase).
     */
    private static final String[] PRO_PASS_KEYS =
            {"proPassEnabled", "hasProPass", "propassenabled"};

    /**
     * Slot machine ownership flags (exact key names from the game's string
     * table). machine1 = default, machine2 = blue (50/spin), machine3 = red
     * (25/spin, always 3 items). Set by purchaseMachine1/2/3 after a real
     * purchase.
     */
    private static final String[] MACHINE_KEYS =
            {"hasMachine1", "hasMachine2", "hasMachine3"};

    /**
     * Red Slot Machine ownership (best effort): no definitive key name was
     * found in the game's string table, so match any int pref that looks like
     * a red-slot-machine flag. Most likely a no-op; the sr2_debug/ dump lets
     * us identify the real key from a live save afterwards.
     */
    private static final Pattern RED_SLOT_KEY = Pattern.compile(
            "^(.*red.*slot.*|.*slot.*red.*|.*red.*machine.*|.*machine.*red.*)$",
            Pattern.CASE_INSENSITIVE);

    /**
     * Lottery machine keys (best effort): match any pref with "lottery" in
     * the name. Set to 1 (owned/unlocked).
     */
    private static final Pattern LOTTERY_KEY = Pattern.compile(
            "^.*lottery.*$",
            Pattern.CASE_INSENSITIVE);

    /**
     * Mission/quest completion flags — REAL format discovered from a live save
     * (2026-09-25). The game does NOT use questDone*; it uses:
     *   mainQuestProgress<N> = 1 (1 = completed)
     *   sideQuestProgress<N> = <progress counter> (e.g. 470/500 kills)
     * Seen in the wild: mainQuestProgress29-32=1, sideQuestProgress1=17,
     * sideQuestProgress2=2, sideQuestProgress6=470.
     * The old questDone* pattern is kept for rewriting existing keys but no
     * longer seeded.
     */
    private static final Pattern MAIN_QUEST_KEY = Pattern.compile(
            "^mainQuestProgress\\d+$");
    private static final Pattern SIDE_QUEST_KEY = Pattern.compile(
            "^sideQuestProgress\\d+$");

    /**
     * Vehicle durability/health upgrade levels (exact key names from the
     * game's string table). Set to max so all vehicles are at 100% durability.
     */
    private static final String[] HEALTH_KEYS = {
            "commonHealth", "rareHealth", "epicHealth", "legendaryHealth", "mysteryHealth"
    };

    /** Durability level that effectively maxes vehicle health. */
    private static final long DURABILITY_LEVEL = 999L;

    /**
     * Vehicle/character unlock flags (exact key format from a live save:
     * check&lt;Rarity&gt;Veh&lt;N&gt; / check&lt;Rarity&gt;Char&lt;N&gt;).
     * 0 = locked, 1 = unlocked. Seen in the wild: checkCommonVeh0-44,
     * checkRareVeh10-20, checkLegendaryVeh0-8, checkMysteryVeh0-9,
     * checkCommonChar20-29, checkRareChar10-13, checkEpicChar5,
     * checkLegendaryChar0-5.
     *
     * RE-ENABLED 2026-10-15 per user request: unlock all characters/vehicles
     * without spinning. Note: this may reset legitimate slot-machine win
     * tracking (the reason it was disabled in v1.8.3), but the user explicitly
     * wants everything unlocked.
     */
    private static final Pattern VEHICLE_UNLOCK_KEY = Pattern.compile(
            "^check(Common|Rare|Epic|Legendary|Mystery)(Veh|Char)\\d+$");

    /**
     * Vehicle/character lock keys — the game explicitly locks specific
     * vehicles with lock&lt;Rarity&gt;&lt;N&gt;=1 (e.g. lockCommon0,
     * lockRare5, lockCommonPerson0). Setting to 0 removes the lock.
     */
    private static final Pattern VEHICLE_LOCK_KEY = Pattern.compile(
            "^lock(Common|Rare|Epic|Legendary|Mystery)(Person)?\\d+$");

    /**
     * Main quest claimed flags — the REAL completion mechanism.
     * mainQuestClaimed&lt;N&gt;=1 means quest N's reward was claimed (done).
     * The game hardcodes: 1, 2, 3, 4, 5, 8, 9.
     */
    private static final Pattern MAIN_QUEST_CLAIMED_KEY = Pattern.compile(
            "^mainQuestClaimed\\d+$");

    /**
     * The 21 hardcoded main quest IDs (from the game's string table).
     * mainQuestProgress&lt;N&gt;=1 means "available/in-progress", not complete.
     */
    private static final int[] MAIN_QUEST_IDS = {
            0, 1, 3, 6, 7, 8, 9, 10, 11, 12, 14, 15, 18, 19, 20, 21, 22,
            29, 30, 31, 32
    };

    /** Max index to pre-seed per vehicle/character rarity group. */
    private static final int MAX_VEHICLE_INDEX = 44;
    private static final int MAX_CHAR_INDEX = 29;

    /** Unity's PlayerPrefs emission: <int name="..." value="..." /> */
    private static final Pattern INT_TAG = Pattern.compile(
            "<(int|long)\\s+name=\"([^\"]+)\"\\s+value=\"(-?\\d+)\"\\s*/>");

    /** Unity's PlayerPrefs emission: <string name="...">...</string> */
    private static final Pattern STRING_TAG = Pattern.compile(
            "<string\\s+name=\"([^\"]+)\">([^<]*)</string>");

    private static final String BACKUP_DIR = "morphe_backup";
    private static final String BACKUP_MARKER = "BACKUP_DONE";
    private static final String RESTORE_TRIGGER = "SR2_RESTORE.txt";
    private static final String PATCHED_MARKER = "SR2_PATCHED.txt";
    private static final String DEBUG_DIR = "sr2_debug";
    private static final String LOG_FILE = "sr2_patch_log.txt";
    /**
     * Patcher version. Bump this whenever the patch logic changes (new keys,
     * new unlocks, bug fixes). If the version in SR2_PATCHED.txt doesn't match,
     * the patch re-runs automatically — no manual marker deletion needed.
     */
    private static final String PATCHER_VERSION = "1.24.0";

    /** Skip huge downloads/caches when backing up files/. */
    private static final long BACKUP_FILE_SIZE_CAP = 10L * 1024 * 1024;

    private CoinPatcher() {
    }

    public static void run(Context context) {
        if (sRan) return;
        sRan = true;
        try {
            doRun(context);
        } catch (Throwable ignored) {
            // Never crash the game.
        }
    }

    private static void doRun(Context context) throws Exception {
        File dataDir = getDataDir(context);
        File extDir = context.getExternalFilesDir(null);
        if (extDir == null) extDir = context.getFilesDir();
        File backupDir = new File(extDir, BACKUP_DIR);
        File debugDir = new File(extDir, DEBUG_DIR);

        // 1. Restore path: trigger file wins over everything.
        File trigger = new File(extDir, RESTORE_TRIGGER);
        if (trigger.exists()) {
            boolean ok = restoreBackup(dataDir, backupDir);
            appendLog(extDir, "restore: trigger found, restore " + (ok ? "OK" : "FAILED (no backup?)"));
            try {
                trigger.delete();
            } catch (Throwable ignored) {
            }
            // Clear the patched marker so the patch re-runs after restore.
            try {
                new File(extDir, PATCHED_MARKER).delete();
            } catch (Throwable ignored) {
            }
            toast(context, ok ? "SR2 patch: save restored from backup"
                    : "SR2 patch: restore failed \u2014 no backup found");
            return;
        }

        // 1b. Patch-once: if we've already patched with THIS version, leave the
        // save alone so the user's progress is preserved across relaunches.
        // If the patcher version changed, re-run automatically. Delete
        // SR2_PATCHED.txt to force a re-patch manually.
        File patchedMarker = new File(extDir, PATCHED_MARKER);
        if (patchedMarker.exists()) {
            String markedVersion = readMarkerVersion(patchedMarker);
            if (PATCHER_VERSION.equals(markedVersion)) {
                return;
            }
            // Version changed — re-patch with new logic.
        }

        File prefsDir = new File(dataDir, "shared_prefs");
        List<File> prefsFiles = listXml(prefsDir);
        if (prefsFiles.isEmpty()) {
            appendLog(extDir, "run: no shared_prefs yet (fresh install or unexpected layout).");
            toast(context, "SR2 patch: no save yet \u2014 play first, then reopen");
            return;
        }

        // 2. Pristine backup, once ever.
        File marker = new File(backupDir, BACKUP_MARKER);
        if (!marker.exists()) {
            boolean ok = backupSave(dataDir, backupDir);
            appendLog(extDir, "backup: " + (ok ? "OK -> " + backupDir.getAbsolutePath() : "FAILED"));
            toast(context, ok ? "SR2 patch: save backed up"
                    : "SR2 patch: backup failed, patch NOT applied");
            if (!ok) return;
        }

        // 3. Patch every prefs XML.
        int changedTotal = 0;
        int cashTotal = 0;
        int cardTotal = 0;
        int unlockTotal = 0;
        int questTotal = 0;
        int durabilityTotal = 0;
        int vehicleTotal = 0;
        List<String> changedKeys = new ArrayList<>();
        debugDir.mkdirs();
        for (File prefs : prefsFiles) {
            String xml = readText(prefs);
            // Keep a pre-patch copy for forensics.
            try {
                writeAll(new File(debugDir, "before_" + prefs.getName()),
                        xml.getBytes(StandardCharsets.UTF_8));
            } catch (Throwable ignored) {
            }
            PatchResult r = patchPrefsXml(xml);
            if (r.changes > 0) {
                writeAll(prefs, r.xml.getBytes(StandardCharsets.UTF_8));
                changedTotal += r.changes;
                cashTotal += r.cashChanges;
                cardTotal += r.cardChanges;
                unlockTotal += r.unlockChanges;
                questTotal += r.questChanges;
                durabilityTotal += r.durabilityChanges;
                vehicleTotal += r.vehicleChanges;
                changedKeys.addAll(r.keys);
            }
        }

        appendLog(extDir, "run: patched " + prefsFiles.size() + " prefs file(s), "
                + changedTotal + " value(s) changed "
                + "(cash=" + cashTotal + ", cards=" + cardTotal
                + ", unlocks=" + unlockTotal + ", quests=" + questTotal
                + ", durability=" + durabilityTotal + ", vehicles=" + vehicleTotal
                + "): " + changedKeys);

        // Copy debug files to Downloads so the user can grab them without
        // needing access to Android/data (blocked on Android 11+).
        copyDebugToDownloads(context, debugDir, extDir);

        if (changedTotal == 0) {
            toast(context, "SR2 patch: no coin/card keys found \u2014 recon saved, send me the log");
        } else {
            toast(context, "SR2 patch: cash 9,999,999 + " + cardTotal
                    + " cards + " + unlockTotal + " unlocks + "
                    + questTotal + " missions + durability maxed + "
                    + vehicleTotal + " vehicles/chars");
            // Mark as patched so we don't overwrite progress on next launch.
            // Delete SR2_PATCHED.txt to force a re-patch.
            try {
                writeAll(new File(extDir, PATCHED_MARKER),
                        (PATCHER_VERSION + " " + System.currentTimeMillis()).getBytes(StandardCharsets.UTF_8));
            } catch (Throwable ignored) {
            }
        }
    }

    /**
     * Copies sr2_debug/ files and the patch log to the public Downloads
     * folder (via MediaStore on Android 10+, direct file on older) so the
     * user can retrieve them with any file manager.
     */
    private static void copyDebugToDownloads(Context context, File debugDir, File extDir) {
        try {
            List<File> toCopy = new ArrayList<>();
            if (debugDir.isDirectory()) {
                File[] kids = debugDir.listFiles();
                if (kids != null) {
                    for (File k : kids) {
                        if (k.isFile() && k.getName().endsWith(".xml")) toCopy.add(k);
                    }
                }
            }
            File log = new File(extDir, LOG_FILE);
            if (log.isFile()) toCopy.add(log);
            for (File src : toCopy) {
                String name = "sr2_" + src.getName();
                byte[] data = readAll(src);
                if (data == null) continue;
                if (Build.VERSION.SDK_INT >= 29) {
                    ContentValues v = new ContentValues();
                    v.put(MediaStore.Downloads.DISPLAY_NAME, name);
                    v.put(MediaStore.Downloads.MIME_TYPE, "text/xml");
                    v.put(MediaStore.Downloads.RELATIVE_PATH, Environment.DIRECTORY_DOWNLOADS);
                    ContentResolver cr = context.getContentResolver();
                    Uri uri = cr.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, v);
                    if (uri == null) continue;
                    OutputStream os = null;
                    try {
                        os = cr.openOutputStream(uri);
                        if (os != null) os.write(data);
                    } finally {
                        if (os != null) try { os.close(); } catch (Throwable ignored) {}
                    }
                } else {
                    File dl = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS);
                    if (dl != null) {
                        // noinspection ResultOfMethodCallIgnored
                        dl.mkdirs();
                        writeAll(new File(dl, name), data);
                    }
                }
            }
            appendLog(extDir, "debug: copied " + toCopy.size() + " file(s) to Downloads");
        } catch (Throwable t) {
            try {
                appendLog(extDir, "debug: Downloads copy failed: " + t);
            } catch (Throwable ignored) {
            }
        }
    }

    // ------------------------------------------------------------------ //
    // Backup / restore                                                    //
    // ------------------------------------------------------------------ //

    /** Copies shared_prefs/ and small files/ files into the backup dir. */
    private static boolean backupSave(File dataDir, File backupDir) {
        try {
            if (!backupDir.mkdirs() && !backupDir.isDirectory()) return false;
            File prefs = new File(dataDir, "shared_prefs");
            if (prefs.isDirectory()) {
                copyRecursive(prefs, new File(backupDir, "shared_prefs"), true);
            }
            File files = new File(dataDir, "files");
            if (files.isDirectory()) {
                copyRecursive(files, new File(backupDir, "files"), false);
            }
            File databases = new File(dataDir, "databases");
            if (databases.isDirectory()) {
                copyRecursive(databases, new File(backupDir, "databases"), true);
            }
            writeAll(new File(backupDir, BACKUP_MARKER),
                    ("backed up " + System.currentTimeMillis()).getBytes(StandardCharsets.UTF_8));
            return new File(backupDir, BACKUP_MARKER).exists();
        } catch (Throwable t) {
            return false;
        }
    }

    /** Copies the pristine backup back over the live save. */
    private static boolean restoreBackup(File dataDir, File backupDir) {
        try {
            if (!new File(backupDir, BACKUP_MARKER).exists()) return false;
            for (String sub : new String[]{"shared_prefs", "files", "databases"}) {
                File src = new File(backupDir, sub);
                if (src.isDirectory()) {
                    copyRecursive(src, new File(dataDir, sub), true);
                }
            }
            return true;
        } catch (Throwable t) {
            return false;
        }
    }

    /**
     * Copies src -> dst recursively. When respectCap is false, files larger
     * than BACKUP_FILE_SIZE_CAP are skipped (asset bundles, caches).
     */
    private static void copyRecursive(File src, File dst, boolean respectCap) throws Exception {
        if (src.isDirectory()) {
            if (!dst.mkdirs() && !dst.isDirectory()) {
                throw new IllegalStateException("cannot mkdir " + dst);
            }
            File[] kids = src.listFiles();
            if (kids != null) {
                for (File kid : kids) {
                    copyRecursive(kid, new File(dst, kid.getName()), respectCap);
                }
            }
            return;
        }
        if (!respectCap && src.length() > BACKUP_FILE_SIZE_CAP) return;
        copyFile(src, dst);
    }

    // ------------------------------------------------------------------ //
    // Prefs patching                                                      //
    // ------------------------------------------------------------------ //

    private static final class PatchResult {
        String xml;
        int changes;
        int cashChanges;
        int cardChanges;
        int unlockChanges;
        int questChanges;
        int durabilityChanges;
        int vehicleChanges;
        final List<String> keys = new ArrayList<>();
    }

    private static boolean isProPassKey(String name) {
        for (String k : PRO_PASS_KEYS) {
            if (k.equals(name)) return true;
        }
        return false;
    }

    private static boolean isMachineKey(String name) {
        for (String k : MACHINE_KEYS) {
            if (k.equals(name)) return true;
        }
        return false;
    }

    private static boolean isHealthKey(String name) {
        for (String k : HEALTH_KEYS) {
            if (k.equals(name)) return true;
        }
        return false;
    }

    private static boolean isUnlockKey(String name) {
        return isProPassKey(name) || isMachineKey(name);
    }

    /**
     * Rewrites matching int/long/string values in a PlayerPrefs XML string.
     * Only the value attributes/text of matched keys change; everything else
     * in the file is preserved byte-for-byte.
     *
     * <p>Keys that don't exist yet (e.g. a rarity the player never earned, or
     * the Pro Pass entitlement) are inserted before {@code </map>} so
     * first-time grants work too.
     */
    private static PatchResult patchPrefsXml(String xml) {
        PatchResult r = new PatchResult();
        String current = patchIntTags(xml, r);
        current = patchStringTags(current, r);
        current = insertMissingKeys(current, r);
        r.xml = current;
        return r;
    }

    /**
     * Inserts target keys that are absent from the prefs file. Without this,
     * rarities/entitlements the player never earned can't be granted because
     * there is no existing value to rewrite.
     */
    private static String insertMissingKeys(String xml, PatchResult r) {
        int mapEnd = xml.lastIndexOf("</map>");
        if (mapEnd < 0) return xml;
        StringBuilder missing = new StringBuilder();
        for (String rarity : new String[]{"common", "rare", "epic", "legendary"}) {
            for (String suffix : new String[]{"Upgrade", "UpgradeValue", "UpgradeValue2", "UpgradeValuePerson"}) {
                String key = rarity + suffix;
                if (!xml.contains("name=\"" + key + "\"")) {
                    missing.append("    <int name=\"").append(key)
                            .append("\" value=\"").append(CARD_AMOUNT).append("\" />\n");
                    r.changes++;
                    r.cardChanges++;
                    r.keys.add(key + "=NEW->" + CARD_AMOUNT);
                }
            }
        }
        for (String key : PRO_PASS_KEYS) {
            if (!xml.contains("name=\"" + key + "\"")) {
                missing.append("    <int name=\"").append(key)
                        .append("\" value=\"1\" />\n");
                r.changes++;
                r.unlockChanges++;
                r.keys.add(key + "=NEW->1");
            }
        }
        for (String key : MACHINE_KEYS) {
            if (!xml.contains("name=\"" + key + "\"")) {
                missing.append("    <int name=\"").append(key)
                        .append("\" value=\"1\" />\n");
                r.changes++;
                r.unlockChanges++;
                r.keys.add(key + "=NEW->1");
            }
        }
        // Mission/quest completion (REAL mechanism from code analysis):
        // mainQuestProgress<N>=1 means "available/in-progress", NOT complete.
        // The game hardcodes 21 quest IDs; set their progress to 99 (max steps).
        // The REAL completion flag is mainQuestClaimed<N>=1 (reward claimed).
        // Hardcoded claimed IDs: 1, 2, 3, 4, 5, 8, 9.
        for (int id : MAIN_QUEST_IDS) {
            String key = "mainQuestProgress" + id;
            if (!xml.contains("name=\"" + key + "\"")) {
                missing.append("    <int name=\"").append(key)
                        .append("\" value=\"99\" />\n");
                r.changes++;
                r.questChanges++;
            }
        }
        // Seed the 7 hardcoded claimed flags.
        for (int id : new int[]{1, 2, 3, 4, 5, 8, 9}) {
            String key = "mainQuestClaimed" + id;
            if (!xml.contains("name=\"" + key + "\"")) {
                missing.append("    <int name=\"").append(key)
                        .append("\" value=\"1\" />\n");
                r.changes++;
                r.questChanges++;
            }
        }
        for (int i = 0; i <= 30; i++) {
            String key = "sideQuestProgress" + i;
            if (!xml.contains("name=\"" + key + "\"")) {
                missing.append("    <int name=\"").append(key)
                        .append("\" value=\"999999\" />\n");
                r.changes++;
                r.questChanges++;
            }
        }
        if (r.questChanges > 0) {
            r.keys.add("quests=NEW->" + r.questChanges + " flags");
        }
        // Vehicle durability: seed missing health upgrade levels at max.
        for (String key : HEALTH_KEYS) {
            if (!xml.contains("name=\"" + key + "\"")) {
                missing.append("    <int name=\"").append(key)
                        .append("\" value=\"").append(DURABILITY_LEVEL).append("\" />\n");
                r.changes++;
                r.durabilityChanges++;
                r.keys.add(key + "=NEW->" + DURABILITY_LEVEL);
            }
        }
        // Vehicle/character unlocks: RE-ENABLED 2026-10-15 per user request.
        // Unlock all vehicles and characters without spinning.
        // Format: check<Rarity>Veh<N> and check<Rarity>Char<N>, 1 = unlocked.
        for (String rarity : new String[]{"Common", "Rare", "Epic", "Legendary", "Mystery"}) {
            for (int i = 0; i <= MAX_VEHICLE_INDEX; i++) {
                String key = "check" + rarity + "Veh" + i;
                if (!xml.contains("name=\"" + key + "\"")) {
                    missing.append("    <int name=\"").append(key)
                            .append("\" value=\"1\" />\n");
                    r.changes++;
                    r.vehicleChanges++;
                }
            }
            for (int i = 0; i <= MAX_CHAR_INDEX; i++) {
                String key = "check" + rarity + "Char" + i;
                if (!xml.contains("name=\"" + key + "\"")) {
                    missing.append("    <int name=\"").append(key)
                            .append("\" value=\"1\" />\n");
                    r.changes++;
                    r.vehicleChanges++;
                }
            }
        }
        if (r.vehicleChanges > 0) {
            r.keys.add("vehicles/chars=NEW->" + r.vehicleChanges + " unlocked");
        }
        if (missing.length() == 0) return xml;
        return xml.substring(0, mapEnd) + missing + xml.substring(mapEnd);
    }

    private static String patchIntTags(String xml, PatchResult r) {
        Matcher m = INT_TAG.matcher(xml);
        StringBuffer out = new StringBuffer();
        while (m.find()) {
            String name = m.group(2);
            long newValue;
            String kind;
            if (UPGRADE_KEY.matcher(name).matches()) {
                newValue = CARD_AMOUNT;
                kind = "card";
            } else if (isHealthKey(name)) {
                newValue = DURABILITY_LEVEL;
                kind = "durability";
            } else if (VEHICLE_LOCK_KEY.matcher(name).matches()) {
                // Remove explicit vehicle locks (0 = unlocked).
                newValue = 0L;
                kind = "unlock";
            } else if (VEHICLE_UNLOCK_KEY.matcher(name).matches()) {
                // Unlock vehicle/character (1 = unlocked).
                newValue = 1L;
                kind = "vehicle";
            } else if (MAIN_QUEST_CLAIMED_KEY.matcher(name).matches()) {
                // Quest reward claimed = quest complete.
                newValue = 1L;
                kind = "quest";
            } else if (isUnlockKey(name) || RED_SLOT_KEY.matcher(name).matches()
                    || LOTTERY_KEY.matcher(name).matches()) {
                newValue = 1L;
                kind = "unlock";
            } else if (MAIN_QUEST_KEY.matcher(name).matches()) {
                // Main quest progress: max out steps so all are done.
                newValue = 99L;
                kind = "quest";
            } else if (SIDE_QUEST_KEY.matcher(name).matches()) {
                // Side quest: progress counter — max it out so any target is met.
                newValue = 999999L;
                kind = "quest";
            } else if (CASH_KEY.matcher(name).matches()) {
                newValue = CASH_AMOUNT;
                kind = "cash";
            } else {
                continue;
            }
            long oldValue;
            try {
                oldValue = Long.parseLong(m.group(3));
            } catch (NumberFormatException e) {
                continue;
            }
            if (oldValue == newValue) continue;
            String replacement = "<" + m.group(1) + " name=\"" + name
                    + "\" value=\"" + newValue + "\" />";
            m.appendReplacement(out, Matcher.quoteReplacement(replacement));
            r.changes++;
            if ("card".equals(kind)) r.cardChanges++;
            else if ("cash".equals(kind)) r.cashChanges++;
            else if ("quest".equals(kind)) r.questChanges++;
            else if ("durability".equals(kind)) r.durabilityChanges++;
            else if ("vehicle".equals(kind)) r.vehicleChanges++;
            else r.unlockChanges++;
            r.keys.add(name + "=" + oldValue + "->" + newValue);
        }
        m.appendTail(out);
        return out.toString();
    }

    /**
     * Flips exact Pro Pass keys stored as strings ("false"->"true",
     * "0"->"1"). Only touches the known entitlement key names.
     */
    private static String patchStringTags(String xml, PatchResult r) {
        Matcher m = STRING_TAG.matcher(xml);
        StringBuffer out = new StringBuffer();
        while (m.find()) {
            String name = m.group(1);
            if (!isUnlockKey(name)) continue;
            String val = m.group(2);
            String newVal = null;
            if ("false".equalsIgnoreCase(val)) newVal = "true";
            else if ("0".equals(val)) newVal = "1";
            if (newVal == null || newVal.equals(val)) continue;
            String replacement = "<string name=\"" + name + "\">"
                    + newVal + "</string>";
            m.appendReplacement(out, Matcher.quoteReplacement(replacement));
            r.changes++;
            r.unlockChanges++;
            r.keys.add(name + "=" + val + "->" + newVal);
        }
        m.appendTail(out);
        return out.toString();
    }

    private static List<File> listXml(File dir) {
        List<File> out = new ArrayList<>();
        if (dir == null || !dir.isDirectory()) return out;
        File[] files = dir.listFiles();
        if (files == null) return out;
        for (File f : files) {
            if (f.isFile() && f.getName().endsWith(".xml")) out.add(f);
        }
        return out;
    }

    // ------------------------------------------------------------------ //
    // Small IO + UI helpers                                               //
    // ------------------------------------------------------------------ //

    private static File getDataDir(Context context) {
        try {
            return context.getDataDir();
        } catch (Throwable t) {
            return new File(context.getApplicationInfo().dataDir);
        }
    }

    private static void copyFile(File src, File dst) throws Exception {
        File parent = dst.getParentFile();
        if (parent != null) parent.mkdirs();
        InputStream in = new FileInputStream(src);
        try {
            OutputStream out = new FileOutputStream(dst);
            try {
                byte[] buf = new byte[8192];
                int n;
                while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
            } finally {
                out.close();
            }
        } finally {
            in.close();
        }
    }

    private static String readText(File f) throws Exception {
        InputStream in = new FileInputStream(f);
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
            return new String(out.toByteArray(), StandardCharsets.UTF_8);
        } finally {
            in.close();
        }
    }

    /**
     * Reads the patcher version from SR2_PATCHED.txt.
     * Returns null if the file is missing, unreadable, or has no version
     * (old format "patched <timestamp>").
     */
    private static String readMarkerVersion(File marker) {
        try {
            String content = readText(marker).trim();
            // New format: "<version> <timestamp>"
            // Old format: "patched <timestamp>"
            int space = content.indexOf(' ');
            if (space > 0) {
                String ver = content.substring(0, space);
                if (!"patched".equals(ver)) return ver;
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static void writeAll(File f, byte[] bytes) throws Exception {
        File parent = f.getParentFile();
        if (parent != null) parent.mkdirs();
        OutputStream out = new FileOutputStream(f);
        try {
            out.write(bytes);
        } finally {
            out.close();
        }
    }

    private static byte[] readAll(File f) {
        InputStream in = null;
        try {
            in = new FileInputStream(f);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buf = new byte[8192];
            int n;
            while ((n = in.read(buf)) != -1) out.write(buf, 0, n);
            return out.toByteArray();
        } catch (Throwable t) {
            return null;
        } finally {
            if (in != null) try { in.close(); } catch (Throwable ignored) {}
        }
    }

    private static void appendLog(File extDir, String line) {
        try {
            File log = new File(extDir, LOG_FILE);
            String prev = "";
            if (log.exists()) {
                try {
                    prev = readText(log);
                } catch (Throwable ignored) {
                }
                if (prev.length() > 20000) prev = prev.substring(prev.length() - 20000);
            }
            String entry = "[" + System.currentTimeMillis() + "] " + line + "\n";
            writeAll(log, (prev + entry).getBytes(StandardCharsets.UTF_8));
        } catch (Throwable ignored) {
        }
    }

    private static void toast(final Context context, final String text) {
        try {
            final Context app = context.getApplicationContext();
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                @Override
                public void run() {
                    try {
                        Toast.makeText(app, text, Toast.LENGTH_LONG).show();
                    } catch (Throwable ignored) {
                    }
                }
            });
        } catch (Throwable ignored) {
        }
    }
}
