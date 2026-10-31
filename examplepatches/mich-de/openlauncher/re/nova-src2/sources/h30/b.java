package h30;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.text.TextUtils;
import b.c0;
import com.amplitude.android.migration.DatabaseConstants;
import java.io.File;
import java.io.IOException;
import java.util.AbstractMap;
import java.util.HashSet;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import sp.o;
import sp.r0;

/* loaded from: classes4.dex */
public final class b extends SQLiteOpenHelper {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f59045a = 1;

    /* renamed from: b, reason: collision with root package name */
    public Object f59046b;

    public /* synthetic */ b(Context context, String str, SQLiteDatabase.CursorFactory cursorFactory, int i5) {
        super(context, str, cursorFactory, i5);
    }

    private final void e(SQLiteDatabase sQLiteDatabase, int i5, int i11) {
    }

    public synchronized boolean a(String str) {
        int i5 = o.f87641c;
        if (!d(str)) {
            return false;
        }
        try {
            try {
                SQLiteDatabase writableDatabase = getWritableDatabase();
                this.f59046b = writableDatabase;
                if (writableDatabase.delete(DatabaseConstants.EVENT_TABLE_NAME, "eventKey =?", new String[]{str}) != 1) {
                    return false;
                }
                SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) this.f59046b;
                if (sQLiteDatabase != null) {
                    sQLiteDatabase.close();
                }
                return true;
            } catch (SQLException unused) {
                throw new IOException();
            }
        } finally {
            SQLiteDatabase sQLiteDatabase2 = (SQLiteDatabase) this.f59046b;
            if (sQLiteDatabase2 != null) {
                sQLiteDatabase2.close();
            }
        }
    }

    public synchronized HashSet b() {
        HashSet hashSet;
        SQLiteDatabase sQLiteDatabase;
        try {
            int i5 = o.f87641c;
            hashSet = new HashSet();
            Cursor cursorRawQuery = null;
            try {
                SQLiteDatabase readableDatabase = getReadableDatabase();
                this.f59046b = readableDatabase;
                cursorRawQuery = readableDatabase.rawQuery("SELECT * FROM events", null);
                if (cursorRawQuery != null && cursorRawQuery.getCount() != 0) {
                    cursorRawQuery.moveToFirst();
                    do {
                        hashSet.add(new AbstractMap.SimpleEntry(cursorRawQuery.getString(cursorRawQuery.getColumnIndex("eventKey")), cursorRawQuery.getString(cursorRawQuery.getColumnIndex("value"))));
                    } while (cursorRawQuery.moveToNext());
                }
                if (cursorRawQuery != null) {
                    cursorRawQuery.close();
                }
                sQLiteDatabase = (SQLiteDatabase) this.f59046b;
            } catch (Throwable th2) {
                try {
                    int i11 = o.f87641c;
                    th2.getMessage();
                    r0.c(th2);
                    if (cursorRawQuery != null) {
                        cursorRawQuery.close();
                    }
                    sQLiteDatabase = (SQLiteDatabase) this.f59046b;
                    if (sQLiteDatabase != null) {
                    }
                } catch (Throwable th3) {
                    if (cursorRawQuery != null) {
                        cursorRawQuery.close();
                    }
                    SQLiteDatabase sQLiteDatabase2 = (SQLiteDatabase) this.f59046b;
                    if (sQLiteDatabase2 != null) {
                        sQLiteDatabase2.close();
                    }
                    throw th3;
                }
            }
            if (sQLiteDatabase != null) {
                sQLiteDatabase.close();
            }
            int i12 = o.f87641c;
            hashSet.size();
        } catch (Throwable th4) {
            throw th4;
        }
        return hashSet;
    }

    public synchronized boolean c(String str, String str2) {
        SQLiteDatabase writableDatabase;
        int i5 = o.f87641c;
        if (d(str)) {
            return false;
        }
        SQLiteDatabase sQLiteDatabase = null;
        try {
            try {
                writableDatabase = getWritableDatabase();
            } catch (SQLException e3) {
                e = e3;
            }
        } catch (Throwable th2) {
            th = th2;
        }
        try {
            ContentValues contentValues = new ContentValues();
            contentValues.put("eventKey", str);
            contentValues.put("value", str2);
            if (writableDatabase.insert(DatabaseConstants.EVENT_TABLE_NAME, null, contentValues) != -1) {
                writableDatabase.close();
                return true;
            }
            writableDatabase.close();
            return false;
        } catch (SQLException e11) {
            e = e11;
            sQLiteDatabase = writableDatabase;
            throw new IOException(e);
        } catch (Throwable th3) {
            th = th3;
            sQLiteDatabase = writableDatabase;
            if (sQLiteDatabase != null) {
                sQLiteDatabase.close();
            }
            throw th;
        }
    }

    public synchronized boolean d(String str) {
        int i5 = o.f87641c;
        Cursor cursorRawQuery = null;
        try {
            try {
                SQLiteDatabase writableDatabase = getWritableDatabase();
                this.f59046b = writableDatabase;
                cursorRawQuery = writableDatabase.rawQuery("SELECT * FROM events WHERE eventKey= ?", new String[]{str});
                if (cursorRawQuery == null || cursorRawQuery.getCount() == 0) {
                    return false;
                }
                cursorRawQuery.close();
                cursorRawQuery.close();
                SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) this.f59046b;
                if (sQLiteDatabase != null) {
                    sQLiteDatabase.close();
                }
                return true;
            } catch (SQLException unused) {
                throw new IOException();
            }
        } finally {
            if (cursorRawQuery != null) {
                cursorRawQuery.close();
            }
            SQLiteDatabase sQLiteDatabase2 = (SQLiteDatabase) this.f59046b;
            if (sQLiteDatabase2 != null) {
                sQLiteDatabase2.close();
            }
        }
    }

    public synchronized boolean f(String str, String str2) {
        int i5 = o.f87641c;
        if (!d(str)) {
            return false;
        }
        try {
            try {
                this.f59046b = getWritableDatabase();
                ContentValues contentValues = new ContentValues();
                contentValues.put("eventKey", str);
                contentValues.put("value", str2);
                if (((SQLiteDatabase) this.f59046b).replace(DatabaseConstants.EVENT_TABLE_NAME, null, contentValues) == -1) {
                    return false;
                }
                SQLiteDatabase sQLiteDatabase = (SQLiteDatabase) this.f59046b;
                if (sQLiteDatabase != null) {
                    sQLiteDatabase.close();
                }
                return true;
            } catch (SQLException unused) {
                throw new IOException();
            }
        } finally {
            SQLiteDatabase sQLiteDatabase2 = (SQLiteDatabase) this.f59046b;
            if (sQLiteDatabase2 != null) {
                sQLiteDatabase2.close();
            }
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) throws SQLException {
        switch (this.f59045a) {
            case 0:
                f30.d dVar = g.f59069c;
                f30.c[] cVarArr = dVar.f54301b;
                String str = dVar.f54300a;
                f30.f.a(str != null);
                StringBuilder sb2 = new StringBuilder("CREATE TABLE ");
                sb2.append(str);
                sb2.append(" (_id INTEGER PRIMARY KEY AUTOINCREMENT");
                StringBuilder sb3 = new StringBuilder();
                for (f30.c cVar : cVarArr) {
                    String str2 = cVar.f54293a;
                    String str3 = cVar.f54298f;
                    if (!"_id".equals(str2)) {
                        sb2.append(AbstractJsonLexerKt.COMMA);
                        sb2.append(str2);
                        sb2.append(' ');
                        sb2.append(f30.d.f54299d[cVar.f54294b]);
                        if (!TextUtils.isEmpty(str3)) {
                            sb2.append(" DEFAULT ");
                            sb2.append(str3);
                        }
                        if (cVar.f54296d) {
                            if (sb3.length() == 0) {
                                sb3.append(str2);
                            } else {
                                sb3.append(AbstractJsonLexerKt.COMMA);
                                sb3.append(str2);
                            }
                        }
                    }
                }
                if (sb3.length() > 0) {
                    sb2.append(",UNIQUE(");
                    sb2.append((CharSequence) sb3);
                    sb2.append(')');
                }
                sb2.append(");");
                sQLiteDatabase.execSQL(sb2.toString());
                sb2.setLength(0);
                for (f30.c cVar2 : cVarArr) {
                    boolean z11 = cVar2.f54295c;
                    String str4 = cVar2.f54293a;
                    if (z11) {
                        c0.D(sb2, "CREATE INDEX ", str, "_index_", str4);
                        c0.D(sb2, " ON ", str, " (", str4);
                        sb2.append(");");
                        sQLiteDatabase.execSQL(sb2.toString());
                        sb2.setLength(0);
                    }
                }
                if (dVar.f54302c) {
                    String str5 = str + "_fulltext";
                    sb2.append("CREATE VIRTUAL TABLE ");
                    sb2.append(str5);
                    sb2.append(" USING FTS3 (_id INTEGER PRIMARY KEY");
                    for (f30.c cVar3 : cVarArr) {
                        if (cVar3.f54297e) {
                            String str6 = cVar3.f54293a;
                            sb2.append(AbstractJsonLexerKt.COMMA);
                            sb2.append(str6);
                            sb2.append(" TEXT");
                        }
                    }
                    sb2.append(");");
                    sQLiteDatabase.execSQL(sb2.toString());
                    sb2.setLength(0);
                    StringBuilder sb4 = new StringBuilder("INSERT OR REPLACE INTO ");
                    sb4.append(str5);
                    sb4.append(" (_id");
                    for (f30.c cVar4 : cVarArr) {
                        if (cVar4.f54297e) {
                            sb4.append(AbstractJsonLexerKt.COMMA);
                            sb4.append(cVar4.f54293a);
                        }
                    }
                    sb4.append(") VALUES (new._id");
                    for (f30.c cVar5 : cVarArr) {
                        if (cVar5.f54297e) {
                            sb4.append(",new.");
                            sb4.append(cVar5.f54293a);
                        }
                    }
                    sb4.append(");");
                    String string = sb4.toString();
                    sb2.append("CREATE TRIGGER ");
                    sb2.append(str);
                    c0.D(sb2, "_insert_trigger AFTER INSERT ON ", str, " FOR EACH ROW BEGIN ", string);
                    sb2.append("END;");
                    sQLiteDatabase.execSQL(sb2.toString());
                    sb2.setLength(0);
                    sb2.append("CREATE TRIGGER ");
                    c0.D(sb2, str, "_update_trigger AFTER UPDATE ON ", str, " FOR EACH ROW BEGIN ");
                    sb2.append(string);
                    sb2.append("END;");
                    sQLiteDatabase.execSQL(sb2.toString());
                    sb2.setLength(0);
                    c0.D(sb2, "CREATE TRIGGER ", str, "_delete_trigger AFTER DELETE ON ", str);
                    sb2.append(" FOR EACH ROW BEGIN DELETE FROM ");
                    sb2.append(str5);
                    sb2.append(" WHERE _id = old._id; END;");
                    sQLiteDatabase.execSQL(sb2.toString());
                    sb2.setLength(0);
                }
                for (File file : ((f) this.f59046b).f59063c.listFiles()) {
                    if (!file.delete()) {
                        mc0.d.f76206a.n("fail to remove: %s", file.getAbsolutePath());
                    }
                }
                break;
            default:
                sQLiteDatabase.execSQL("CREATE TABLE events (eventKey  TEXT PRIMARY KEY NOT NULL,value TEXT )");
                break;
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) throws SQLException {
        switch (this.f59045a) {
            case 0:
                f30.d dVar = g.f59069c;
                String str = dVar.f54300a;
                StringBuilder sb2 = new StringBuilder("DROP TABLE IF EXISTS ");
                sb2.append(str);
                sb2.append(';');
                sQLiteDatabase.execSQL(sb2.toString());
                sb2.setLength(0);
                if (dVar.f54302c) {
                    sb2.append("DROP TABLE IF EXISTS ");
                    sb2.append(str);
                    sb2.append("_fulltext");
                    sb2.append(';');
                    sQLiteDatabase.execSQL(sb2.toString());
                }
                onCreate(sQLiteDatabase);
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(f fVar, Context context) {
        super(context, "download.db", (SQLiteDatabase.CursorFactory) null, 2);
        this.f59046b = fVar;
    }
}
