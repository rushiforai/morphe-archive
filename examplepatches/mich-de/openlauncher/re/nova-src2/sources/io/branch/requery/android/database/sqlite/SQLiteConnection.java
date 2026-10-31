package io.branch.requery.android.database.sqlite;

import ai.c1;
import android.database.sqlite.SQLiteBindOrColumnIndexOutOfRangeException;
import android.database.sqlite.SQLiteDatabaseLockedException;
import android.database.sqlite.SQLiteException;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.StatFs;
import android.util.Log;
import android.util.Printer;
import b.c0;
import b.u4;
import com.google.android.gms.internal.measurement.k2;
import io.branch.requery.android.database.CursorWindow;
import io.branch.requery.android.database.sqlite.SQLiteDebug;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Pattern;
import kotlin.Unit;

/* loaded from: classes4.dex */
public final class SQLiteConnection implements w4.c {

    /* renamed from: m, reason: collision with root package name */
    public static final String[] f61785m = new String[0];
    public static final byte[] n = new byte[0];
    public static final Pattern o = Pattern.compile("[\\s]*\\n+[\\s]*");

    /* renamed from: a, reason: collision with root package name */
    public final a f61786a;

    /* renamed from: b, reason: collision with root package name */
    public final h f61787b;

    /* renamed from: c, reason: collision with root package name */
    public final q f61788c;

    /* renamed from: d, reason: collision with root package name */
    public final int f61789d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f61790e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f61791f;

    /* renamed from: g, reason: collision with root package name */
    public final tm.o f61792g;

    /* renamed from: h, reason: collision with root package name */
    public e f61793h;

    /* renamed from: i, reason: collision with root package name */
    public final d f61794i;

    /* renamed from: j, reason: collision with root package name */
    public long f61795j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f61796k;

    /* renamed from: l, reason: collision with root package name */
    public int f61797l;

    public SQLiteConnection(h hVar, q qVar, int i5, boolean z11) {
        a aVar = new a();
        this.f61786a = aVar;
        this.f61787b = hVar;
        q qVar2 = new q(qVar);
        this.f61788c = qVar2;
        this.f61789d = i5;
        this.f61790e = z11;
        this.f61791f = (qVar.f61859c & 1) != 0;
        this.f61792g = new tm.o(this, qVar2.f61860d);
        this.f61794i = new d(Boolean.valueOf(qVar2.f61863g));
        aVar.a();
    }

    private static native void nativeBindBlob(long j11, long j12, int i5, byte[] bArr);

    private static native void nativeBindDouble(long j11, long j12, int i5, double d5);

    private static native void nativeBindLong(long j11, long j12, int i5, long j13);

    private static native void nativeBindNull(long j11, long j12, int i5);

    private static native void nativeBindString(long j11, long j12, int i5, String str);

    private static native void nativeCancel(long j11);

    private static native void nativeClose(long j11);

    private static native void nativeExecute(long j11, long j12);

    private static native int nativeExecuteForBlobFileDescriptor(long j11, long j12);

    private static native int nativeExecuteForChangedRowCount(long j11, long j12);

    private static native long nativeExecuteForCursorWindow(long j11, long j12, long j13, int i5, int i11, boolean z11);

    private static native long nativeExecuteForLastInsertedRowId(long j11, long j12);

    private static native long nativeExecuteForLong(long j11, long j12);

    private static native String nativeExecuteForString(long j11, long j12);

    private static native void nativeFinalizeStatement(long j11, long j12);

    private static native int nativeGetColumnCount(long j11, long j12);

    private static native String nativeGetColumnName(long j11, long j12, int i5);

    private static native int nativeGetDbLookaside(long j11);

    private static native int nativeGetParameterCount(long j11, long j12);

    private static native boolean nativeHasCodec();

    private static native boolean nativeIsReadOnly(long j11, long j12);

    private static native void nativeLoadExtension(long j11, String str, String str2);

    private static native long nativeOpen(String str, int i5, String str2, boolean z11, boolean z12);

    private static native long nativePrepareStatement(long j11, String str);

    private static native void nativeRegisterCustomFunction(long j11, SQLiteCustomFunction sQLiteCustomFunction);

    private static native void nativeRegisterFunction(long j11, SQLiteFunction sQLiteFunction);

    private static native void nativeRegisterLocalizedCollators(long j11, String str);

    private static native void nativeResetCancel(long j11, boolean z11);

    private static native void nativeResetStatementAndClearBindings(long j11, long j12);

    public static boolean t() {
        return nativeHasCodec();
    }

    public final void A() {
        q qVar = this.f61788c;
        String string = qVar.f61861e.toString();
        nativeRegisterLocalizedCollators(this.f61795j, string);
        String strQ = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (this.f61791f) {
            return;
        }
        try {
            k("CREATE TABLE IF NOT EXISTS android_metadata (locale TEXT)", null, null, false);
            strQ = q("SELECT locale FROM android_metadata UNION SELECT NULL ORDER BY locale DESC LIMIT 1", null);
            if (strQ == null || !strQ.equals(string)) {
                k("BEGIN", null, null, false);
                try {
                    k("DELETE FROM android_metadata", null, null, false);
                    k("INSERT INTO android_metadata (locale) VALUES(?)", new Object[]{string}, null, false);
                    k("REINDEX LOCALIZED", null, null, false);
                    k("COMMIT", null, null, false);
                } catch (Throwable th2) {
                    k("ROLLBACK", null, null, false);
                    throw th2;
                }
            }
        } catch (RuntimeException e3) {
            StringBuilder sb2 = new StringBuilder("Failed to change locale for db ");
            c0.D(sb2, qVar.f61858b, " from ", strQ, " to ");
            sb2.append(string);
            sb2.append(":");
            sb2.append(e3.getMessage());
            throw new SQLiteException(sb2.toString());
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:10:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0080  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void B() {
        q qVar = this.f61788c;
        if (qVar.a() || this.f61791f) {
            return;
        }
        char c11 = 2;
        String str = "NORMAL";
        if ((qVar.f61859c & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0) {
            z("WAL");
            String strQ = q("PRAGMA synchronous", null);
            strQ.getClass();
            switch (strQ.hashCode()) {
                case 48:
                    if (!strQ.equals("0")) {
                        c11 = 65535;
                        break;
                    } else {
                        c11 = 0;
                        break;
                    }
                case 49:
                    if (strQ.equals("1")) {
                        c11 = 1;
                        break;
                    }
                    break;
                case 50:
                    if (!strQ.equals("2")) {
                    }
                    break;
            }
            switch (c11) {
                case 0:
                    str = "OFF";
                    break;
                case 1:
                    break;
                case 2:
                    str = "FULL";
                    break;
                default:
                    str = strQ;
                    break;
            }
            if (str.equalsIgnoreCase("normal")) {
                return;
            }
            k("PRAGMA synchronous=".concat("normal"), null, null, false);
            return;
        }
        z("TRUNCATE");
        String strQ2 = q("PRAGMA synchronous", null);
        strQ2.getClass();
        switch (strQ2.hashCode()) {
            case 48:
                if (!strQ2.equals("0")) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 0;
                    break;
                }
            case 49:
                if (strQ2.equals("1")) {
                    c11 = 1;
                    break;
                }
                break;
            case 50:
                if (!strQ2.equals("2")) {
                }
                break;
        }
        switch (c11) {
            case 0:
                str = "OFF";
                break;
            case 1:
                break;
            case 2:
                str = "FULL";
                break;
            default:
                str = strQ2;
                break;
        }
        if (str.equalsIgnoreCase("FULL")) {
            return;
        }
        k("PRAGMA synchronous=".concat("FULL"), null, null, false);
    }

    public final void C(e eVar) {
        if (this.f61796k && !eVar.f61821f) {
            throw new SQLiteException("Cannot execute this statement because it might modify the database but the connection is read-only.");
        }
    }

    public final e a(String str, boolean z11) {
        boolean z12;
        tm.o oVar = this.f61792g;
        c1 c1Var = (c1) oVar.f89493b;
        c1 c1Var2 = (c1) oVar.f89494c;
        e eVar = (e) c1Var.c(str);
        if (eVar == null) {
            eVar = (e) c1Var2.c(str);
        }
        if (eVar == null) {
            z12 = false;
        } else {
            if (!eVar.f61823h) {
                return eVar;
            }
            z12 = true;
        }
        long jNativePrepareStatement = nativePrepareStatement(this.f61795j, str);
        try {
            int iNativeGetParameterCount = nativeGetParameterCount(this.f61795j, jNativePrepareStatement);
            int iR = a.a.R(str);
            boolean z13 = z11 || nativeIsReadOnly(this.f61795j, jNativePrepareStatement);
            e eVar2 = this.f61793h;
            if (eVar2 != null) {
                this.f61793h = eVar2.f61816a;
                eVar2.f61816a = null;
                eVar2.f61822g = false;
            } else {
                eVar2 = new e();
            }
            eVar2.f61817b = str;
            eVar2.f61818c = jNativePrepareStatement;
            eVar2.f61819d = iNativeGetParameterCount;
            eVar2.f61820e = iR;
            eVar2.f61821f = z13;
            if (!z12) {
                if (iR == 2 || iR == 1) {
                    try {
                        if (((List) ((AtomicReference) oVar.f89495d).get()).contains(str)) {
                            ((c1) oVar.f89493b).d(str, eVar2);
                        } else {
                            c1Var2.d(str, eVar2);
                        }
                        eVar2.f61822g = true;
                    } catch (RuntimeException e3) {
                        e = e3;
                        eVar = eVar2;
                        if (eVar == null || !eVar.f61822g) {
                            nativeFinalizeStatement(this.f61795j, jNativePrepareStatement);
                        }
                        throw e;
                    }
                }
            }
            eVar2.f61823h = true;
            return eVar2;
        } catch (RuntimeException e11) {
            e = e11;
        }
    }

    public final void b(e eVar) {
        if (!this.f61788c.a() && SQLiteDebug.DEBUG_SQL_LOG && Looper.myLooper() == Looper.getMainLooper()) {
            if (eVar.f61821f) {
                Log.w("SQLiteConnection", "Reading from disk on main thread");
            } else {
                Log.w("SQLiteConnection", "Writing to disk on main thread");
            }
        }
    }

    public final void c(w4.d dVar) {
        if (dVar != null) {
            dVar.c();
            int i5 = this.f61797l + 1;
            this.f61797l = i5;
            if (i5 == 1) {
                nativeResetCancel(this.f61795j, true);
                dVar.b(this);
            }
        }
    }

    public final void d(e eVar, Object[] objArr) {
        int length = objArr != null ? objArr.length : 0;
        if (length != eVar.f61819d) {
            throw new SQLiteBindOrColumnIndexOutOfRangeException("Expected " + eVar.f61819d + " bind arguments but " + length + " were provided.");
        }
        if (length == 0) {
            return;
        }
        long j11 = eVar.f61818c;
        for (int i5 = 0; i5 < length; i5++) {
            Object obj = objArr[i5];
            if (obj == null) {
                nativeBindNull(this.f61795j, j11, i5 + 1);
            } else if (obj instanceof byte[]) {
                nativeBindBlob(this.f61795j, j11, i5 + 1, (byte[]) obj);
            } else if ((obj instanceof Float) || (obj instanceof Double)) {
                nativeBindDouble(this.f61795j, j11, i5 + 1, ((Number) obj).doubleValue());
            } else if ((obj instanceof Long) || (obj instanceof Integer) || (obj instanceof Short) || (obj instanceof Byte)) {
                nativeBindLong(this.f61795j, j11, i5 + 1, ((Number) obj).longValue());
            } else if (obj instanceof Boolean) {
                nativeBindLong(this.f61795j, j11, i5 + 1, ((Boolean) obj).booleanValue() ? 1L : 0L);
            } else {
                nativeBindString(this.f61795j, j11, i5 + 1, obj.toString());
            }
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(7:(2:46|4)|38|11|(12:14|42|15|40|16|17|18|23|(1:25)|26|27|12)|48|28|34) */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0040 A[Catch: all -> 0x007d, SQLiteException -> 0x00c3, TRY_LEAVE, TryCatch #0 {SQLiteException -> 0x00c3, blocks: (B:11:0x0035, B:12:0x003a, B:14:0x0040, B:23:0x0083, B:25:0x009a, B:26:0x00ae), top: B:38:0x0035 }] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x009a A[Catch: all -> 0x007d, SQLiteException -> 0x00c3, TryCatch #0 {SQLiteException -> 0x00c3, blocks: (B:11:0x0035, B:12:0x003a, B:14:0x0040, B:23:0x0083, B:25:0x009a, B:26:0x00ae), top: B:38:0x0035 }] */
    /* JADX WARN: Unreachable blocks removed: 1, instructions: 1 */
    /* JADX WARN: Unreachable blocks removed: 2, instructions: 2 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void e(ArrayList arrayList) {
        long jP;
        long jP2;
        CursorWindow cursorWindow;
        int i5;
        long jP3;
        long jP4;
        int iNativeGetDbLookaside = nativeGetDbLookaside(this.f61795j);
        try {
            jP = p("PRAGMA page_count;", null);
        } catch (SQLiteException unused) {
            jP = 0;
        }
        try {
            try {
                jP2 = p("PRAGMA page_size;", null);
            } catch (SQLiteException unused2) {
                jP2 = 0;
                arrayList.add(s(iNativeGetDbLookaside, jP, jP2));
                cursorWindow = new CursorWindow("collectDbStats");
                n("PRAGMA database_list;", null, cursorWindow, 0, 0, false, null);
                while (i5 < cursorWindow.getNumRows()) {
                }
                cursorWindow.close();
                return;
            }
            n("PRAGMA database_list;", null, cursorWindow, 0, 0, false, null);
            for (i5 = 1; i5 < cursorWindow.getNumRows(); i5++) {
                String string = cursorWindow.getString(i5, 1);
                String string2 = cursorWindow.getString(i5, 2);
                try {
                    jP3 = p("PRAGMA " + string + ".page_count;", null);
                    try {
                        jP4 = p("PRAGMA " + string + ".page_size;", null);
                    } catch (SQLiteException unused3) {
                        jP4 = 0;
                        long j11 = jP3;
                        String str = "  (attached) " + string;
                        if (!string2.isEmpty()) {
                        }
                        arrayList.add(new SQLiteDebug.DbStats(str, j11, jP4, 0, 0, 0, 0));
                    }
                } catch (SQLiteException unused4) {
                    jP3 = 0;
                    jP4 = 0;
                    long j112 = jP3;
                    String str2 = "  (attached) " + string;
                    if (!string2.isEmpty()) {
                    }
                    arrayList.add(new SQLiteDebug.DbStats(str2, j112, jP4, 0, 0, 0, 0));
                }
                long j1122 = jP3;
                String str22 = "  (attached) " + string;
                if (!string2.isEmpty()) {
                    str22 = str22 + ": " + string2;
                }
                arrayList.add(new SQLiteDebug.DbStats(str22, j1122, jP4, 0, 0, 0, 0));
            }
            cursorWindow.close();
            return;
        } catch (Throwable th2) {
            cursorWindow.close();
            throw th2;
        }
        arrayList.add(s(iNativeGetDbLookaside, jP, jP2));
        cursorWindow = new CursorWindow("collectDbStats");
    }

    public final void f(List list) {
        tm.o oVar = this.f61792g;
        ((AtomicReference) oVar.f89495d).set(new ArrayList(list));
        c1 c1Var = (c1) oVar.f89493b;
        Set setKeySet = c1Var.h().keySet();
        setKeySet.removeAll(new HashSet(list));
        Iterator it = setKeySet.iterator();
        while (it.hasNext()) {
            c1Var.e((String) it.next());
        }
    }

    public final void finalize() throws Throwable {
        try {
            h hVar = this.f61787b;
            if (hVar != null && this.f61795j != 0) {
                Log.w("SQLiteConnectionPool", "A SQLiteConnection object for database '" + hVar.f61841d.f61858b + "' was leaked!  Please fix your application to end transactions in progress properly and to close the database when it is no longer needed.");
                hVar.f61840c.set(true);
            }
            h(true);
            super.finalize();
        } catch (Throwable th2) {
            super.finalize();
            throw th2;
        }
    }

    public final void g(w4.d dVar) {
        if (dVar != null) {
            int i5 = this.f61797l - 1;
            this.f61797l = i5;
            if (i5 == 0) {
                dVar.b(null);
                nativeResetCancel(this.f61795j, false);
            }
        }
    }

    public final void h(boolean z11) {
        a aVar = this.f61786a;
        if (z11) {
            aVar.b();
        }
        aVar.f61802a = null;
        if (this.f61795j != 0) {
            d dVar = this.f61794i;
            int iA = dVar.a(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n.f39150d, null, null);
            try {
                tm.o oVar = this.f61792g;
                ((c1) oVar.f89493b).i(-1);
                ((c1) oVar.f89494c).i(-1);
                nativeClose(this.f61795j);
                this.f61795j = 0L;
            } finally {
                dVar.b(iA);
            }
        }
    }

    public final void i(Printer printer, boolean z11) {
        int i5;
        int i11;
        printer.println("Connection #" + this.f61789d + ":");
        if (z11) {
            printer.println("  connectionPtr: 0x" + Long.toHexString(this.f61795j));
        }
        printer.println("  isPrimaryConnection: " + this.f61790e);
        printer.println("  onlyAllowReadOnlyOperations: " + this.f61796k);
        printer.println("  enabled operations: " + this.f61794i.f61815d);
        d dVar = this.f61794i;
        if (dVar.f61815d) {
            synchronized (dVar.f61812a) {
                try {
                    printer.println("  Most recently executed operations:");
                    int i12 = dVar.f61813b;
                    c cVar = dVar.f61812a[i12];
                    if (cVar != null) {
                        int i13 = 0;
                        do {
                            StringBuilder sb2 = new StringBuilder();
                            sb2.append("    ");
                            sb2.append(String.format("%02d", Integer.valueOf(i13)));
                            sb2.append(": [");
                            sb2.append(c.f61803i.format(new Date(cVar.f61804a)));
                            sb2.append("] ");
                            cVar.a(sb2, z11);
                            printer.println(sb2.toString());
                            i12 = i12 > 0 ? i12 - 1 : 19;
                            i13++;
                            cVar = dVar.f61812a[i12];
                            if (cVar == null) {
                                break;
                            }
                        } while (i13 < 20);
                    } else {
                        printer.println("    <none>");
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        if (z11) {
            tm.o oVar = this.f61792g;
            c1 c1Var = (c1) oVar.f89493b;
            List list = (List) ((AtomicReference) oVar.f89495d).get();
            LinkedHashMap linkedHashMapH = c1Var.h();
            StringBuilder sb3 = new StringBuilder("  Priority prepared statement cache (hit=");
            synchronized (c1Var.f97859c) {
                i5 = c1Var.f97861e;
            }
            sb3.append(i5);
            sb3.append("/miss=");
            synchronized (c1Var.f97859c) {
                i11 = c1Var.f97862f;
            }
            sb3.append(i11);
            sb3.append("/size=");
            sb3.append(linkedHashMapH.size());
            sb3.append("):");
            printer.println(sb3.toString());
            HashSet hashSet = new HashSet(list);
            for (Map.Entry entry : linkedHashMapH.entrySet()) {
                String str = (String) entry.getKey();
                if (!hashSet.contains(str)) {
                    printer.println("    !!! UNEXPECTED STATEMENT: " + c1.j((e) entry.getValue(), str));
                }
            }
            printer.println("    legend: [*] in cache, [.] configured, [-] not cacheable, [!] not configured");
            Iterator it = hashSet.iterator();
            int i14 = 0;
            while (it.hasNext()) {
                String str2 = (String) it.next();
                StringBuilder sb4 = new StringBuilder("    ");
                sb4.append(String.format("%02d", Integer.valueOf(i14)));
                sb4.append(": ");
                boolean zContains = list.contains(str2);
                boolean zContainsKey = linkedHashMapH.containsKey(str2);
                int iR = a.a.R(str2);
                List list2 = list;
                boolean z12 = true;
                if (iR != 2 && iR != 1) {
                    z12 = false;
                }
                sb4.append((!zContains || zContainsKey) ? zContains ? "[*]" : "[!]" : z12 ? "[.]" : "[-]");
                sb4.append(" ");
                sb4.append(c1.j((e) linkedHashMapH.get(str2), str2));
                printer.println(sb4.toString());
                i14++;
                list = list2;
            }
            LinkedHashMap linkedHashMapH2 = ((c1) oVar.f89494c).h();
            printer.println("  Regular prepared statement cache (size=" + linkedHashMapH2.size() + "):");
            if (linkedHashMapH2.isEmpty()) {
                printer.println("    <none>");
                return;
            }
            int i15 = 0;
            for (Map.Entry entry2 : linkedHashMapH2.entrySet()) {
                e eVar = (e) entry2.getValue();
                if (eVar.f61822g) {
                    printer.println("    " + String.format("%02d", Integer.valueOf(i15)) + ": " + c1.j(eVar, (String) entry2.getKey()));
                }
                i15++;
            }
        }
    }

    public final void j() {
        if (nativeHasCodec()) {
            A();
        }
    }

    public final void k(String str, Object[] objArr, w4.d dVar, boolean z11) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        d dVar2 = this.f61794i;
        int iA = dVar2.a("execute", str, objArr);
        try {
            try {
                e eVarA = a(str, z11);
                try {
                    C(eVarA);
                    d(eVarA, objArr);
                    b(eVarA);
                    c(dVar);
                    try {
                        nativeExecute(this.f61795j, eVarA.f61818c);
                    } finally {
                        g(dVar);
                    }
                } finally {
                    x(eVarA);
                }
            } catch (RuntimeException e3) {
                dVar2.d(iA, e3);
                throw e3;
            }
        } finally {
            dVar2.b(iA);
        }
    }

    public final ParcelFileDescriptor l(String str, Object[] objArr) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        d dVar = this.f61794i;
        int iA = dVar.a("executeForBlobFileDescriptor", str, objArr);
        try {
            try {
                e eVarA = a(str, false);
                try {
                    C(eVarA);
                    d(eVarA, objArr);
                    b(eVarA);
                    int iNativeExecuteForBlobFileDescriptor = nativeExecuteForBlobFileDescriptor(this.f61795j, eVarA.f61818c);
                    return iNativeExecuteForBlobFileDescriptor >= 0 ? ParcelFileDescriptor.adoptFd(iNativeExecuteForBlobFileDescriptor) : null;
                } finally {
                    x(eVarA);
                }
            } finally {
                dVar.b(iA);
            }
        } catch (RuntimeException e3) {
            dVar.d(iA, e3);
            throw e3;
        }
    }

    public final int m(String str, Object[] objArr, boolean z11) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        d dVar = this.f61794i;
        int iA = dVar.a("executeForChangedRowCount", str, objArr);
        try {
            try {
                e eVarA = a(str, z11);
                try {
                    C(eVarA);
                    d(eVarA, objArr);
                    b(eVarA);
                    return nativeExecuteForChangedRowCount(this.f61795j, eVarA.f61818c);
                } finally {
                    x(eVarA);
                }
            } catch (RuntimeException e3) {
                dVar.d(iA, e3);
                throw e3;
            }
        } finally {
            dVar.c(iA);
        }
    }

    public final int n(String str, Object[] objArr, CursorWindow cursorWindow, int i5, int i11, boolean z11, w4.d dVar) {
        d dVar2 = this.f61794i;
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        if (cursorWindow == null) {
            throw new IllegalArgumentException("window must not be null.");
        }
        cursorWindow.acquireReference();
        try {
            int iA = dVar2.a("executeForCursorWindow", str, objArr);
            try {
                try {
                    e eVarA = a(str, false);
                    try {
                        C(eVarA);
                        d(eVarA, objArr);
                        b(eVarA);
                        c(dVar);
                        try {
                            long jNativeExecuteForCursorWindow = nativeExecuteForCursorWindow(this.f61795j, eVarA.f61818c, cursorWindow.mWindowPtr, i5, i11, z11);
                            int i12 = (int) jNativeExecuteForCursorWindow;
                            cursorWindow.getNumRows();
                            cursorWindow.setStartPosition((int) (jNativeExecuteForCursorWindow >> 32));
                            return i12;
                        } finally {
                            g(dVar);
                        }
                    } finally {
                        x(eVarA);
                    }
                } catch (RuntimeException e3) {
                    dVar2.d(iA, e3);
                    throw e3;
                }
            } finally {
                dVar2.c(iA);
            }
        } finally {
            cursorWindow.releaseReference();
        }
    }

    public final long o(String str, Object[] objArr) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        d dVar = this.f61794i;
        int iA = dVar.a("executeForLastInsertedRowId", str, objArr);
        try {
            try {
                e eVarA = a(str, false);
                try {
                    C(eVarA);
                    d(eVarA, objArr);
                    b(eVarA);
                    return nativeExecuteForLastInsertedRowId(this.f61795j, eVarA.f61818c);
                } finally {
                    x(eVarA);
                }
            } finally {
                dVar.b(iA);
            }
        } catch (RuntimeException e3) {
            dVar.d(iA, e3);
            throw e3;
        }
    }

    @Override // w4.c
    public final void onCancel() {
        nativeCancel(this.f61795j);
    }

    public final long p(String str, Object[] objArr) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        d dVar = this.f61794i;
        int iA = dVar.a("executeForLong", str, objArr);
        try {
            try {
                e eVarA = a(str, false);
                try {
                    C(eVarA);
                    d(eVarA, objArr);
                    b(eVarA);
                    return nativeExecuteForLong(this.f61795j, eVarA.f61818c);
                } finally {
                    x(eVarA);
                }
            } finally {
                dVar.b(iA);
            }
        } catch (RuntimeException e3) {
            dVar.d(iA, e3);
            throw e3;
        }
    }

    public final String q(String str, Object[] objArr) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        d dVar = this.f61794i;
        int iA = dVar.a("executeForString", str, objArr);
        try {
            try {
                e eVarA = a(str, false);
                try {
                    C(eVarA);
                    d(eVarA, objArr);
                    b(eVarA);
                    return nativeExecuteForString(this.f61795j, eVarA.f61818c);
                } finally {
                    x(eVarA);
                }
            } finally {
                dVar.b(iA);
            }
        } catch (RuntimeException e3) {
            dVar.d(iA, e3);
            throw e3;
        }
    }

    public final void r(e eVar) {
        nativeFinalizeStatement(this.f61795j, eVar.f61818c);
        eVar.f61817b = null;
        eVar.f61816a = this.f61793h;
        this.f61793h = eVar;
    }

    public final SQLiteDebug.DbStats s(int i5, long j11, long j12) {
        int i11;
        int i12;
        int i13;
        int i14;
        int i15;
        int i16;
        tm.o oVar = this.f61792g;
        String strO = this.f61788c.f61857a;
        if (!this.f61790e) {
            strO = c0.o(k2.k(strO, " ("), this.f61789d, ")");
        }
        String str = strO;
        c1 c1Var = (c1) oVar.f89493b;
        synchronized (c1Var.f97859c) {
            i11 = c1Var.f97861e;
        }
        c1 c1Var2 = (c1) oVar.f89494c;
        synchronized (c1Var2.f97859c) {
            i12 = c1Var2.f97861e;
        }
        int i17 = i12 + i11;
        c1 c1Var3 = (c1) oVar.f89493b;
        synchronized (c1Var3.f97859c) {
            i13 = c1Var3.f97862f;
        }
        c1 c1Var4 = (c1) oVar.f89494c;
        synchronized (c1Var4.f97859c) {
            i14 = c1Var4.f97862f;
        }
        int i18 = i14 + i13;
        c1 c1Var5 = (c1) oVar.f89493b;
        synchronized (c1Var5.f97859c) {
            i15 = c1Var5.f97860d;
        }
        c1 c1Var6 = (c1) oVar.f89494c;
        synchronized (c1Var6.f97859c) {
            i16 = c1Var6.f97860d;
        }
        return new SQLiteDebug.DbStats(str, j11, j12, i5, i17, i18, i16 + i15);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SQLiteConnection: ");
        sb2.append(this.f61788c.f61857a);
        sb2.append(" (");
        return c0.o(sb2, this.f61789d, ")");
    }

    public final void u() {
        q qVar = this.f61788c;
        this.f61795j = nativeOpen(qVar.f61857a, qVar.f61859c & (-536870913), qVar.f61858b, SQLiteDebug.DEBUG_SQL_STATEMENTS, SQLiteDebug.DEBUG_SQL_TIME);
        if (!this.f61788c.a() && !this.f61791f) {
            synchronized (SQLiteGlobal.f61798a) {
                try {
                    if (SQLiteGlobal.f61799b == 0) {
                        SQLiteGlobal.f61799b = new StatFs("/data").getBlockSize();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            if (p("PRAGMA page_size", null) != 1024) {
                k("PRAGMA page_size=1024", null, null, false);
            }
        }
        y();
        if (!this.f61788c.a() && !this.f61791f) {
            if (p("PRAGMA journal_size_limit", null) != 524288) {
                p("PRAGMA journal_size_limit=524288", null);
            }
        }
        if (!this.f61788c.a() && !this.f61791f) {
            if (p("PRAGMA wal_autocheckpoint", null) != 1000) {
                p("PRAGMA wal_autocheckpoint=1000", null);
            }
        }
        if (!nativeHasCodec()) {
            B();
            A();
        }
        int size = this.f61788c.f61864h.size();
        for (int i5 = 0; i5 < size; i5++) {
            nativeRegisterCustomFunction(this.f61795j, (SQLiteCustomFunction) this.f61788c.f61864h.get(i5));
        }
        int size2 = this.f61788c.f61865i.size();
        for (int i11 = 0; i11 < size2; i11++) {
            nativeRegisterFunction(this.f61795j, (SQLiteFunction) this.f61788c.f61865i.get(i11));
        }
        Iterator it = this.f61788c.f61866j.iterator();
        while (it.hasNext()) {
            j jVar = (j) it.next();
            long j11 = this.f61795j;
            jVar.getClass();
            nativeLoadExtension(j11, "libsqlite3ext_branch", null);
        }
    }

    public final void v(String str, y yVar, boolean z11) {
        if (str == null) {
            throw new IllegalArgumentException("sql must not be null.");
        }
        d dVar = this.f61794i;
        int iA = dVar.a("prepare", str, null);
        try {
            try {
                e eVarA = a(str, z11);
                if (yVar != null) {
                    try {
                        yVar.f61881b = eVarA.f61819d;
                        yVar.f61880a = eVarA.f61821f;
                        int iNativeGetColumnCount = nativeGetColumnCount(this.f61795j, eVarA.f61818c);
                        if (iNativeGetColumnCount == 0) {
                            yVar.f61882c = f61785m;
                        } else {
                            yVar.f61882c = new String[iNativeGetColumnCount];
                            for (int i5 = 0; i5 < iNativeGetColumnCount; i5++) {
                                ((String[]) yVar.f61882c)[i5] = nativeGetColumnName(this.f61795j, eVarA.f61818c, i5);
                            }
                        }
                    } catch (Throwable th2) {
                        x(eVarA);
                        throw th2;
                    }
                }
                x(eVarA);
                dVar.b(iA);
            } catch (RuntimeException e3) {
                dVar.d(iA, e3);
                throw e3;
            }
        } catch (Throwable th3) {
            dVar.b(iA);
            throw th3;
        }
    }

    public final void w(q qVar) {
        this.f61796k = false;
        d dVar = this.f61794i;
        dVar.f61815d = qVar.f61863g;
        dVar.f61813b = 0;
        for (int i5 = 0; i5 < 20; i5++) {
            dVar.f61812a[i5] = null;
        }
        int size = qVar.f61864h.size();
        for (int i11 = 0; i11 < size; i11++) {
            SQLiteCustomFunction sQLiteCustomFunction = (SQLiteCustomFunction) qVar.f61864h.get(i11);
            if (!this.f61788c.f61864h.contains(sQLiteCustomFunction)) {
                nativeRegisterCustomFunction(this.f61795j, sQLiteCustomFunction);
            }
        }
        int size2 = qVar.f61865i.size();
        for (int i12 = 0; i12 < size2; i12++) {
            SQLiteFunction sQLiteFunction = (SQLiteFunction) qVar.f61865i.get(i12);
            if (!this.f61788c.f61865i.contains(sQLiteFunction)) {
                nativeRegisterFunction(this.f61795j, sQLiteFunction);
            }
        }
        boolean z11 = qVar.f61862f;
        q qVar2 = this.f61788c;
        boolean z12 = z11 != qVar2.f61862f;
        boolean z13 = ((qVar.f61859c ^ qVar2.f61859c) & SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING) != 0;
        boolean zEquals = qVar.f61861e.equals(qVar2.f61861e);
        this.f61788c.b(qVar);
        tm.o oVar = this.f61792g;
        int i13 = qVar.f61860d;
        c1 c1Var = (c1) oVar.f89493b;
        c1Var.getClass();
        if (i13 <= 0) {
            android.support.v4.media.session.b.k0("maxSize <= 0");
            throw null;
        }
        synchronized (c1Var.f97859c) {
            c1Var.f97857a = i13;
            Unit unit = Unit.f71706a;
        }
        c1Var.i(i13);
        if (z12) {
            y();
        }
        if (z13) {
            B();
        }
        if (zEquals) {
            return;
        }
        A();
    }

    public final void x(e eVar) {
        eVar.f61823h = false;
        if (!eVar.f61822g) {
            r(eVar);
            return;
        }
        try {
            nativeResetStatementAndClearBindings(this.f61795j, eVar.f61818c);
        } catch (SQLiteException unused) {
            String str = eVar.f61817b;
            tm.o oVar = this.f61792g;
            ((c1) oVar.f89493b).e(str);
            ((c1) oVar.f89494c).e(str);
        }
    }

    public final void y() {
        if (this.f61791f) {
            return;
        }
        long j11 = this.f61788c.f61862f ? 1L : 0L;
        if (p("PRAGMA foreign_keys", null) != j11) {
            k(u4.g(j11, "PRAGMA foreign_keys="), null, null, false);
        }
    }

    public final void z(String str) {
        String strQ = q("PRAGMA journal_mode", null);
        if (strQ.equalsIgnoreCase(str)) {
            return;
        }
        try {
            if (q("PRAGMA journal_mode=".concat(str), null).equalsIgnoreCase(str)) {
                return;
            }
        } catch (SQLiteException e3) {
            if (!(e3 instanceof SQLiteDatabaseLockedException)) {
                throw e3;
            }
        }
        StringBuilder sb2 = new StringBuilder("Could not change the database journal mode of '");
        c0.D(sb2, this.f61788c.f61858b, "' from '", strQ, "' to '");
        sb2.append(str);
        sb2.append("' because the database is locked.  This usually means that there are other open connections to the database which prevents the database from enabling or disabling write-ahead logging mode.  Proceeding without changing the journal mode.");
        Log.w("SQLiteConnection", sb2.toString());
    }
}
