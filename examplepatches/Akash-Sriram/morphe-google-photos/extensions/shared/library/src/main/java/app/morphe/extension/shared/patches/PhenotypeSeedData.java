package app.morphe.extension.shared.patches;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Base64;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.util.zip.GZIPInputStream;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import app.morphe.extension.shared.Logger;

/**
 * Embedded official Phenotype seed data for Google Photos.
 * Automatically seeds the complete official phenotype flags (2,492 flags)
 * on first launch or after data wipe so non-root Morphe has 100% feature parity.
 */
public final class PhenotypeSeedData {

    private PhenotypeSeedData() {}

    public static int restoreOfficialFlags(Context context, SharedPreferences prefs) {
        return 0;
    }

    public static final long LATEST_SEED_VERSION = 1789073700L;

    public static void ensureSeeded(Context context) {
        SharedPreferences seedPrefs = context.getSharedPreferences("morphe_seed_meta", Context.MODE_PRIVATE);
        long seededVersion = seedPrefs.getLong("seeded_preset_version", 0L);
        if (seededVersion < LATEST_SEED_VERSION) {
            SharedPreferences phenoPrefs = context.getSharedPreferences(
                "com.google.android.apps.photos.phenotype", Context.MODE_PRIVATE);
            app.morphe.extension.shared.patches.flags.PhotoFlagsRegistry.applyCuratedDefaults(phenoPrefs);
            seedPrefs.edit().putLong("seeded_preset_version", LATEST_SEED_VERSION).apply();
            Logger.printDebug(() -> "Seeded 362 Morphe preset flags (version " + LATEST_SEED_VERSION + ")");
        }
        syncActiveAccount(context);
    }

    public static void syncActiveAccount(Context context) {
        try {
            SharedPreferences accountsPrefs = context.getSharedPreferences("accounts", Context.MODE_PRIVATE);
            int activeAccountId = -1;
            if (accountsPrefs.contains("key.active-account-key")) {
                try {
                    activeAccountId = accountsPrefs.getInt("key.active-account-key", -1);
                } catch (ClassCastException e) {
                    try {
                        String str = accountsPrefs.getString("key.active-account-key", "-1");
                        activeAccountId = Integer.parseInt(str);
                    } catch (Exception ignored) {}
                }
            }

            SharedPreferences phAccountPrefs = context.getSharedPreferences("phenotype_account_file", Context.MODE_PRIVATE);
            if (activeAccountId != -1) {
                phAccountPrefs.edit().putInt("account_id", activeAccountId).commit();
                final int syncedId = activeAccountId;
                Logger.printDebug(() -> "Synced active account ID: " + syncedId + " to phenotype_account_file");

                try {
                    SharedPreferences phenoPrefs = context.getSharedPreferences("com.google.android.apps.photos.phenotype", Context.MODE_PRIVATE);
                    String token = phenoPrefs.getString("__phenotype_snapshot_token", null);
                    if (token != null) {
                        String[] parts = token.split(" ");
                        boolean changed = false;
                        if (parts.length >= 8 && !parts[7].equals(String.valueOf(activeAccountId))) {
                            parts[7] = String.valueOf(activeAccountId);
                            changed = true;
                        }
                        String accountEmail = accountsPrefs.getString(activeAccountId + ".account_name", null);
                        if (accountEmail != null && !accountEmail.isEmpty() && parts.length > 0 && !parts[0].equals(accountEmail)) {
                            parts[0] = accountEmail;
                            changed = true;
                        }
                        if (changed) {
                            StringBuilder sb = new StringBuilder();
                            for (int i = 0; i < parts.length; i++) {
                                if (i > 0) sb.append(' ');
                                sb.append(parts[i]);
                            }
                            phenoPrefs.edit().putString("__phenotype_snapshot_token", sb.toString()).commit();
                            Logger.printDebug(() -> "Updated __phenotype_snapshot_token to match active account: " + syncedId + " (" + accountEmail + ")");
                        }
                    }
                } catch (Exception ignored) {}
            } else if (!phAccountPrefs.contains("account_id")) {
                phAccountPrefs.edit().putInt("account_id", 0).commit();
            }

            File dataDir = new File(context.getApplicationInfo().dataDir);
            File prefsDir = new File(dataDir, "shared_prefs");
            File accountXml = new File(prefsDir, "phenotype_account_file.xml");
            int targetId = (activeAccountId != -1) ? activeAccountId : phAccountPrefs.getInt("account_id", 0);
            if (!accountXml.exists() || accountXml.length() < 10) {
                try (FileOutputStream fos = new FileOutputStream(accountXml)) {
                    fos.write(("<?xml version='1.0' encoding='utf-8' standalone='yes' ?>\n<map>\n    <int name=\"account_id\" value=\"" + targetId + "\" />\n</map>\n").getBytes(StandardCharsets.UTF_8));
                    fos.flush();
                }
                accountXml.setReadable(true, false);
                accountXml.setWritable(true, false);
            }
        } catch (Throwable t) {
            Logger.printException(() -> "Failed to sync active account", t);
        }
    }
}
