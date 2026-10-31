package app.badfella.extension.ticktick.locallists;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

/** Owns the extension-only database file; TickTick's database is never opened here. */
public final class LocalListsOpenHelper extends SQLiteOpenHelper {
    public static final String DATABASE_NAME = "badfella_local_lists.db";

    public LocalListsOpenHelper(Context context) {
        super(context, DATABASE_NAME, null, LocalListsStore.SCHEMA_VERSION);
    }

    @Override
    public void onConfigure(SQLiteDatabase db) {
        super.onConfigure(db);
        db.setForeignKeyConstraintsEnabled(true);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        LocalListsStore.createSchema(db);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // Schema 1 is the first released schema. Future versions must migrate here
        // without deleting local organization.
        if (newVersion > LocalListsStore.SCHEMA_VERSION) {
            throw new IllegalStateException("Unsupported local organizer schema " + newVersion);
        }
    }
}
