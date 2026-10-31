package ads_mobile_sdk;

import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.os.SystemClock;
import b.o2;
import c80.d;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class n42 extends SQLiteOpenHelper {

    /* renamed from: f, reason: collision with root package name */
    public static final String f7423f = r70.k.u1("\n      CREATE TABLE offline_buffered_pings (timestamp INTEGER PRIMARY_KEY, gws_query_id TEXT, url TEXT, event_state INTEGER)\n      ").toString();

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f7424a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f7425b;

    /* renamed from: c, reason: collision with root package name */
    public final y42 f7426c;

    /* renamed from: d, reason: collision with root package name */
    public final dn3 f7427d;

    /* renamed from: e, reason: collision with root package name */
    public final d f7428e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n42(Context context, t70.j0 backgroundScope, int i5, o2 clock, y42 offlineWorkManager, dn3 pinger) {
        super(context, "AdMobOfflineBufferedPings.db", (SQLiteDatabase.CursorFactory) null, i5);
        Intrinsics.g(context, "context");
        Intrinsics.g(backgroundScope, "backgroundScope");
        Intrinsics.g(clock, "clock");
        Intrinsics.g(offlineWorkManager, "offlineWorkManager");
        Intrinsics.g(pinger, "pinger");
        this.f7424a = backgroundScope;
        this.f7425b = clock;
        this.f7426c = offlineWorkManager;
        this.f7427d = pinger;
        this.f7428e = new d();
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sqLiteDatabase) throws SQLException {
        Intrinsics.g(sqLiteDatabase, "sqLiteDatabase");
        sqLiteDatabase.execSQL(f7423f);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase sQLiteDatabase, int i5, int i11) throws SQLException {
        Intrinsics.d(sQLiteDatabase);
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS offline_buffered_pings");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sqLiteDatabase, int i5, int i11) throws SQLException {
        Intrinsics.g(sqLiteDatabase, "sqLiteDatabase");
        sqLiteDatabase.execSQL("DROP TABLE IF EXISTS offline_buffered_pings");
    }

    public static final void a(n42 n42Var, SQLiteDatabase sQLiteDatabase) {
        n42Var.getClass();
        sQLiteDatabase.beginTransaction();
        try {
            String[] strArrA = n42Var.a(sQLiteDatabase);
            f42 f42Var = f42.f3155a;
            sQLiteDatabase.delete("offline_buffered_pings", "event_state = ?", new String[]{String.valueOf(1)});
            sQLiteDatabase.setTransactionSuccessful();
            sQLiteDatabase.endTransaction();
            for (String str : strArrA) {
                if (str != null) {
                    dn3 dn3Var = n42Var.f7427d;
                    Uri uri = Uri.parse(str);
                    Intrinsics.f(uri, "parse(...)");
                    dn3Var.getClass();
                    dn3Var.f2573e.j(new Pair(uri, null));
                }
            }
        } catch (Throwable th2) {
            sQLiteDatabase.endTransaction();
            throw th2;
        }
    }

    public final String[] a(SQLiteDatabase sQLiteDatabase) {
        String[] strArr = {"timestamp", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL};
        f42 f42Var = f42.f3155a;
        Cursor cursorQuery = sQLiteDatabase.query("offline_buffered_pings", strArr, "event_state = 1", null, null, null, "timestamp ASC", null);
        Intrinsics.f(cursorQuery, "query(...)");
        String[] strArr2 = new String[cursorQuery.getCount()];
        int i5 = 0;
        while (cursorQuery.moveToNext()) {
            int columnIndex = cursorQuery.getColumnIndex("timestamp");
            int columnIndex2 = cursorQuery.getColumnIndex(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
            if (columnIndex2 != -1) {
                long j11 = cursorQuery.getLong(columnIndex);
                String string = cursorQuery.getString(columnIndex2);
                Intrinsics.f(string, "getString(...)");
                Uri uri = Uri.parse(string);
                this.f7425b.getClass();
                long jElapsedRealtime = SystemClock.elapsedRealtime() - j11;
                String encodedQuery = uri.getEncodedQuery();
                Uri.Builder builderClearQuery = uri.buildUpon().clearQuery();
                builderClearQuery.appendQueryParameter("bd", String.valueOf(jElapsedRealtime));
                strArr2[i5] = b.u4.m(builderClearQuery.build().toString(), "&", encodedQuery);
            }
            i5++;
        }
        cursorQuery.close();
        return strArr2;
    }
}
