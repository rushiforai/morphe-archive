package app.morphe.extension.discord.bunny.recovery;

import org.json.JSONObject;

import java.io.IOException;

/** Central, stepwise migration chain for portable Bunny backups. */
final class BackupMigrations {
    private BackupMigrations() {}

    static JSONObject migrate(JSONObject backup, int version) throws Exception {
        if (version < 0) throw new IOException("Backup schema version is missing");
        if (version > BunnyBackup.SCHEMA_VERSION) {
            throw new IOException("Backup requires a newer Bunny recovery schema");
        }
        JSONObject migrated = backup;
        int current = version;
        while (current < BunnyBackup.SCHEMA_VERSION) {
            if (current == 0) {
                migrated = migrateV0ToV1(migrated);
                current = 1;
            } else {
                throw new IOException("No migration is available from schema " + current);
            }
        }
        return migrated;
    }

    /** Synthetic legacy format used by tests and early development builds. */
    private static JSONObject migrateV0ToV1(JSONObject old) throws Exception {
        JSONObject migrated = new JSONObject(old.toString());
        migrated.put("schemaVersion", 1);
        if (!migrated.has("createdWithBunnyVersion")) {
            migrated.put("createdWithBunnyVersion", "legacy");
        }
        return migrated;
    }
}
