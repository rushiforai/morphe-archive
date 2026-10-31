package io.branch.search.internal;

import android.app.ActivityManager;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import com.tiktok.util.TTConst;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import io.branch.requery.android.database.sqlite.SQLiteOpenHelper;
import io.branch.search.internal.Rb;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Yb implements Xb {

    @NotNull
    public static final b Companion = new b();

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final List<String> f63755c = ul.b.Q("CREATE TABLE IF NOT EXISTS policy(\n     policy_type TEXT,\n     time_threshold INTEGER,\n     delay INTEGER\n)", "CREATE TABLE IF NOT EXISTS retry_entry(\n    id INTEGER PRIMARY KEY AUTOINCREMENT,\n    create_time INTEGER NOT NULL,\n    type INTEGER NOT NULL,\n    state INTEGER NOT NULL,\n    url TEXT NOT NULL,\n    crash_count INT NOT NULL DEFAULT 0,\n    fail_count INT NOT NULL DEFAULT 0\n)", "CREATE TABLE IF NOT EXISTS retry_entry_schedule(\n    retry_entry_id INTEGER NOT NULL,\n    time INTEGER NOT NULL,\n    FOREIGN KEY(retry_entry_id) REFERENCES retry_entry(id) ON DELETE CASCADE\n)", "CREATE INDEX retry_schedule_index ON retry_entry_schedule(retry_entry_id);");

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final a f63756a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public List<Sb> f63757b;

    public static final class a extends SQLiteOpenHelper {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ Context f63758a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Yb f63759b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(Context context, Yb yb2) {
            super(context, "retry.db", null, 2);
            this.f63758a = context;
            this.f63759b = yb2;
        }

        @Override // io.branch.requery.android.database.sqlite.SQLiteOpenHelper
        public final void onConfigure(@NotNull SQLiteDatabase db2) throws SQLException {
            Intrinsics.g(db2, "db");
            db2.execSQL("PRAGMA foreign_keys = ON;");
            db2.enableWriteAheadLogging();
            if (((ActivityManager) this.f63758a.getSystemService(ActivityManager.class)).isLowRamDevice()) {
                db2.query("PRAGMA soft_heap_limit = 2097152").close();
            }
        }

        @Override // io.branch.requery.android.database.sqlite.SQLiteOpenHelper
        public final void onCreate(@NotNull SQLiteDatabase db2) {
            Intrinsics.g(db2, "db");
            Yb.a(this.f63759b, new C3178h5(db2));
        }

        @Override // io.branch.requery.android.database.sqlite.SQLiteOpenHelper
        public final void onUpgrade(@NotNull SQLiteDatabase db2, int i5, int i11) {
            Intrinsics.g(db2, "db");
            Yb.a(this.f63759b, new C3178h5(db2));
        }
    }

    public static final class b {
    }

    public static final class c extends Lambda implements Function1<InterfaceC3365s7, Rb.a> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ String f63760a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(String str) {
            super(1);
            this.f63760a = str;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            InterfaceC3365s7 inTransaction = (InterfaceC3365s7) obj;
            Intrinsics.g(inTransaction, "$this$inTransaction");
            long jCurrentTimeMillis = System.currentTimeMillis();
            ContentValues contentValues = new ContentValues();
            String str = this.f63760a;
            contentValues.put("create_time", Long.valueOf(jCurrentTimeMillis));
            contentValues.put(TTConst.TRACK_TYPE, "CLICK_EVENT");
            Wb wb2 = Wb.NEW;
            contentValues.put("state", "NEW");
            contentValues.put(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, str);
            contentValues.put("crash_count", (Integer) 0);
            contentValues.put("fail_count", (Integer) 0);
            Unit unit = Unit.f71706a;
            return new Rb.a(inTransaction.insert("retry_entry", 5, contentValues), jCurrentTimeMillis, wb2, this.f63760a, 0, 0);
        }
    }

    public static final class d extends Lambda implements Function1<InterfaceC3365s7, List<Rb>> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ Wb[] f63761a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Yb f63762b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(Wb[] wbArr, Yb yb2) {
            super(1);
            this.f63761a = wbArr;
            this.f63762b = yb2;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) throws IOException {
            InterfaceC3365s7 inTransaction = (InterfaceC3365s7) obj;
            Intrinsics.g(inTransaction, "$this$inTransaction");
            ArrayList arrayList = new ArrayList();
            Cursor cursorA = inTransaction.a("SELECT * FROM retry_entry WHERE state in " + kotlin.collections.c.O0(this.f63761a, ", ", "(", ")", Zb.f63830a, 24), new Object[0], new w4.d());
            Yb yb2 = this.f63762b;
            while (cursorA.moveToNext()) {
                try {
                    arrayList.add(Yb.a(yb2, cursorA));
                } finally {
                }
            }
            Unit unit = Unit.f71706a;
            cursorA.close();
            return arrayList;
        }
    }

    public static final class e extends Lambda implements Function1<InterfaceC3365s7, Pair<? extends Rb, ? extends Long>> {
        public e() {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) throws IOException {
            InterfaceC3365s7 inTransaction = (InterfaceC3365s7) obj;
            Intrinsics.g(inTransaction, "$this$inTransaction");
            Cursor cursorA = inTransaction.a("SELECT time, id, create_time, type, state, url, crash_count, fail_count FROM retry_entry_schedule as schedule\nLEFT JOIN retry_entry on schedule.retry_entry_id = retry_entry.id\nWHERE state != 'SUCCESS' and state != 'PROCESSING'\nORDER BY time ASC LIMIT 1;", new Object[0], new w4.d());
            try {
                Pair pair = cursorA.moveToNext() ? new Pair(Yb.a(Yb.this, cursorA), Long.valueOf(cursorA.getLong(R4.a(cursorA, "time")))) : null;
                cursorA.close();
                return pair;
            } finally {
            }
        }
    }

    public static final class f extends Lambda implements Function1<InterfaceC3365s7, List<? extends Sb>> {

        /* renamed from: a, reason: collision with root package name */
        public static final f f63764a = new f();

        public f() {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) throws IOException {
            InterfaceC3365s7 inTransaction = (InterfaceC3365s7) obj;
            Intrinsics.g(inTransaction, "$this$inTransaction");
            ArrayList arrayList = new ArrayList();
            Cursor cursorA = inTransaction.a("SELECT * FROM policy", new Object[0], new w4.d());
            while (cursorA.moveToNext()) {
                try {
                    String string = cursorA.getString(R4.a(cursorA, "policy_type"));
                    Intrinsics.f(string, "getString(checkColumnIndex(column))");
                    arrayList.add(new Sb(EnumC3065ab.valueOf(string), cursorA.getLong(R4.a(cursorA, "time_threshold")), cursorA.getLong(R4.a(cursorA, "delay"))));
                } finally {
                }
            }
            Unit unit = Unit.f71706a;
            cursorA.close();
            return arrayList.isEmpty() ? Vb.f63541a : arrayList;
        }
    }

    public /* synthetic */ class g extends FunctionReferenceImpl implements Function1<InterfaceC3365s7, Unit> {
        public g(Xb xb2) {
            super(1, 0, Yb.class, xb2, "recreateTables", "recreateTables(Lio/branch/search/internal/rawsqlite/database/IDatabase;)V");
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            InterfaceC3365s7 p02 = (InterfaceC3365s7) obj;
            Intrinsics.g(p02, "p0");
            Yb.a((Yb) this.receiver, p02);
            return Unit.f71706a;
        }
    }

    public static final class h extends Lambda implements Function1<InterfaceC3365s7, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ long f63765a;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public h(long j11) {
            super(1);
            this.f63765a = j11;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            InterfaceC3365s7 inTransaction = (InterfaceC3365s7) obj;
            Intrinsics.g(inTransaction, "$this$inTransaction");
            inTransaction.execSQL("DELETE FROM retry_entry WHERE ID = ?", new Object[]{Long.valueOf(this.f63765a)});
            return Unit.f71706a;
        }
    }

    public static final class i extends Lambda implements Function1<InterfaceC3365s7, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ List<Sb> f63766a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Yb f63767b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public i(Yb yb2, List list) {
            super(1);
            this.f63766a = list;
            this.f63767b = yb2;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            InterfaceC3365s7 inTransaction = (InterfaceC3365s7) obj;
            Intrinsics.g(inTransaction, "$this$inTransaction");
            inTransaction.execSQL("DELETE FROM POLICY");
            for (Sb sb2 : this.f63766a) {
                inTransaction.execSQL("INSERT INTO policy(policy_type, time_threshold, delay)\nVALUES (?, ?, ?)", new Object[]{sb2.f63349a.name(), Long.valueOf(sb2.f63350b), Long.valueOf(sb2.f63351c)});
            }
            this.f63767b.f63757b = b70.g.I1(this.f63766a);
            return Unit.f71706a;
        }
    }

    public static final class j extends Lambda implements Function1<InterfaceC3365s7, Long> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ long f63768a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ long f63769b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public j(long j11, long j12) {
            super(1);
            this.f63768a = j11;
            this.f63769b = j12;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            InterfaceC3365s7 inTransaction = (InterfaceC3365s7) obj;
            Intrinsics.g(inTransaction, "$this$inTransaction");
            inTransaction.execSQL("DELETE FROM retry_entry_schedule WHERE retry_entry_id = " + this.f63768a);
            ContentValues contentValues = new ContentValues();
            long j11 = this.f63768a;
            long j12 = this.f63769b;
            contentValues.put("retry_entry_id", Long.valueOf(j11));
            contentValues.put("time", Long.valueOf(j12));
            Unit unit = Unit.f71706a;
            return Long.valueOf(inTransaction.insert("retry_entry_schedule", 5, contentValues));
        }
    }

    public static final class k extends Lambda implements Function1<InterfaceC3365s7, Unit> {

        /* renamed from: a, reason: collision with root package name */
        public final /* synthetic */ Wb f63770a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ Integer f63771b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ Integer f63772c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ long f63773d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public k(long j11, Wb wb2, Integer num, Integer num2) {
            super(1);
            this.f63770a = wb2;
            this.f63771b = num;
            this.f63772c = num2;
            this.f63773d = j11;
        }

        @Override // kotlin.jvm.functions.Function1
        public final Object invoke(Object obj) {
            InterfaceC3365s7 inTransaction = (InterfaceC3365s7) obj;
            Intrinsics.g(inTransaction, "$this$inTransaction");
            inTransaction.execSQL("\n                    UPDATE retry_entry\n                    SET STATE = ?, crash_count = coalesce(?, crash_count), fail_count = coalesce(?, fail_count)\n                    WHERE ID = ?\n                ", new Object[]{this.f63770a.name(), this.f63771b, this.f63772c, Long.valueOf(this.f63773d)});
            return Unit.f71706a;
        }
    }

    public Yb(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f63756a = new a(context, this);
    }

    public static final Rb.a a(Yb yb2, Cursor cursor) {
        yb2.getClass();
        Intrinsics.g(cursor, "<this>");
        long j11 = cursor.getLong(R4.a(cursor, "id"));
        long j12 = cursor.getLong(R4.a(cursor, "create_time"));
        String string = cursor.getString(R4.a(cursor, "state"));
        Intrinsics.f(string, "getString(checkColumnIndex(column))");
        return new Rb.a(j11, j12, Wb.valueOf(string), C3053a.a(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "column", cursor, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, "getString(checkColumnIndex(column))"), cursor.getInt(R4.a(cursor, "crash_count")), cursor.getInt(R4.a(cursor, "fail_count")));
    }

    @NotNull
    public final C3178h5 b() {
        SQLiteDatabase writableDatabase = this.f63756a.getWritableDatabase();
        Intrinsics.f(writableDatabase, "mHelper.writableDatabase");
        return new C3178h5(writableDatabase);
    }

    @Override // io.branch.search.internal.Xb
    @Nullable
    public final Pair<Rb, Long> c() {
        SQLiteDatabase readableDatabase = this.f63756a.getReadableDatabase();
        Intrinsics.f(readableDatabase, "mHelper.readableDatabase");
        return (Pair) C3083bc.a(new C3178h5(readableDatabase), new e());
    }

    @Override // io.branch.search.internal.Xb
    @NotNull
    public final List<Sb> d() {
        List<Sb> list = this.f63757b;
        if (list != null) {
            return list;
        }
        SQLiteDatabase readableDatabase = this.f63756a.getReadableDatabase();
        Intrinsics.f(readableDatabase, "mHelper.readableDatabase");
        List<Sb> list2 = (List) C3083bc.a(new C3178h5(readableDatabase), f.f63764a);
        this.f63757b = list2;
        return list2;
    }

    public static final void a(Yb yb2, InterfaceC3365s7 interfaceC3365s7) {
        yb2.getClass();
        interfaceC3365s7.execSQL("PRAGMA foreign_keys = ON;");
        interfaceC3365s7.execSQL("DROP INDEX IF EXISTS retry_schedule_index");
        interfaceC3365s7.execSQL("DROP TABLE IF EXISTS retry_entry_schedule");
        interfaceC3365s7.execSQL("DROP TABLE IF EXISTS retry_entry");
        interfaceC3365s7.execSQL("DROP TABLE IF EXISTS policy");
        Iterator<T> it = f63755c.iterator();
        while (it.hasNext()) {
            interfaceC3365s7.execSQL((String) it.next());
        }
    }

    @Override // io.branch.search.internal.Xb
    @NotNull
    public final Rb.a a(@NotNull String url) {
        Intrinsics.g(url, "url");
        return (Rb.a) C3083bc.a(b(), new c(url));
    }

    @Override // io.branch.search.internal.Xb
    @NotNull
    public final List<Rb> a(@NotNull Wb... state) {
        Intrinsics.g(state, "state");
        SQLiteDatabase readableDatabase = this.f63756a.getReadableDatabase();
        Intrinsics.f(readableDatabase, "mHelper.readableDatabase");
        return (List) C3083bc.a(new C3178h5(readableDatabase), new d(state, this));
    }

    @Override // io.branch.search.internal.Xb
    public final void a() {
        C3083bc.a(b(), new g(this));
    }

    @Override // io.branch.search.internal.Xb
    public final void a(long j11) {
        C3083bc.a(b(), new h(j11));
    }

    @Override // io.branch.search.internal.Xb
    public final void a(@NotNull List<Sb> policies) {
        Intrinsics.g(policies, "policies");
        C3083bc.a(b(), new i(this, policies));
    }

    @Override // io.branch.search.internal.Xb
    public final void a(long j11, long j12) {
        C3083bc.a(b(), new j(j11, j12));
    }

    @Override // io.branch.search.internal.Xb
    public final void a(long j11, @NotNull Wb state, @Nullable Integer num, @Nullable Integer num2) {
        Intrinsics.g(state, "state");
        C3083bc.a(b(), new k(j11, state, num, num2));
    }
}
