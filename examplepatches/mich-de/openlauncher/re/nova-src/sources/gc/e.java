package gc;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteFullException;
import android.os.Handler;
import android.os.Message;
import android.os.SystemClock;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.api.reward.BackupConstant;
import com.vungle.ads.internal.protos.Sdk;
import fc.h;
import fc.i;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Objects;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/* loaded from: classes2.dex */
public final class e implements Handler.Callback, fc.a {

    /* renamed from: a, reason: collision with root package name */
    public final Context f57346a;

    /* renamed from: b, reason: collision with root package name */
    public final fc.c f57347b;

    /* renamed from: d, reason: collision with root package name */
    public volatile a f57349d;

    /* renamed from: e, reason: collision with root package name */
    public volatile Handler f57350e;

    /* renamed from: f, reason: collision with root package name */
    public volatile Handler f57351f;

    /* renamed from: c, reason: collision with root package name */
    public final ConcurrentHashMap f57348c = new ConcurrentHashMap();

    /* renamed from: g, reason: collision with root package name */
    public volatile boolean f57352g = false;

    public e(Context context, fc.c cVar) {
        this.f57346a = context;
        this.f57347b = cVar;
        cVar.zb(true);
        for (Map.Entry<Class<? extends h>, i> entry : cVar.lud().entrySet()) {
            Class<? extends h> key = entry.getKey();
            this.f57348c.put(key, new b(this, entry.getValue()));
            Objects.toString(key);
        }
        new c(this, 0).start();
        new c(this, 1).start();
    }

    public static void f(e eVar) {
        if (eVar.f57350e == null || eVar.f57351f == null) {
            return;
        }
        for (b bVar : eVar.f57348c.values()) {
            try {
                a aVarB = eVar.b();
                dy.d dVar = bVar.f57337j;
                i iVar = bVar.f57330c;
                long jLud = iVar.lud();
                if (jLud > 0) {
                    try {
                        int iDelete = aVarB.getWritableDatabase().delete(iVar.dj(), "create_time < ?", new String[]{String.valueOf(System.currentTimeMillis() - jLud)});
                        if (iDelete > 0 && dVar != null) {
                            dVar.f(4, iDelete);
                        }
                    } catch (Throwable unused) {
                        if (dVar != null) {
                            dVar.f(10003, 1);
                        }
                    }
                }
                eVar.d(bVar, false);
                dy.d dVar2 = bVar.f57337j;
                if (dVar2 != null) {
                    dVar2.g(eVar.f57350e.getLooper(), bVar);
                }
            } catch (Exception unused2) {
            }
        }
        eVar.f57352g = true;
    }

    /* JADX WARN: Not initialized variable reg: 8, insn: 0x0224: IF  (r8 I:??[int, boolean, OBJECT, ARRAY, byte, short, char]) == (0 ??[int, boolean, OBJECT, ARRAY, byte, short, char])  -> B:146:0x022f, block:B:142:0x0224 */
    /* JADX WARN: Removed duplicated region for block: B:124:0x01df  */
    /* JADX WARN: Removed duplicated region for block: B:202:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0116 A[Catch: Exception -> 0x0131, PHI: r8 r15
      0x0116: PHI (r8v7 android.database.sqlite.SQLiteDatabase) = (r8v6 android.database.sqlite.SQLiteDatabase), (r8v8 android.database.sqlite.SQLiteDatabase) binds: [B:73:0x012e, B:64:0x0114] A[DONT_GENERATE, DONT_INLINE]
      0x0116: PHI (r15v6 java.util.ArrayList) = (r15v5 java.util.ArrayList), (r15v7 java.util.ArrayList) binds: [B:73:0x012e, B:64:0x0114] A[DONT_GENERATE, DONT_INLINE], TRY_LEAVE, TryCatch #8 {Exception -> 0x0131, blocks: (B:72:0x012a, B:65:0x0116, B:63:0x0110), top: B:169:0x0029 }] */
    /* JADX WARN: Removed duplicated region for block: B:77:0x0134  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01aa A[Catch: Exception -> 0x01d6, PHI: r4
      0x01aa: PHI (r4v10 android.database.sqlite.SQLiteDatabase) = (r4v9 android.database.sqlite.SQLiteDatabase), (r4v11 android.database.sqlite.SQLiteDatabase) binds: [B:109:0x01c1, B:97:0x01a8] A[DONT_GENERATE, DONT_INLINE], TRY_LEAVE, TryCatch #4 {Exception -> 0x01d6, blocks: (B:96:0x01a4, B:98:0x01aa, B:108:0x01bd), top: B:167:0x0168 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a(b bVar) {
        ArrayList arrayList;
        SQLiteDatabase sQLiteDatabase;
        ArrayList arrayList2;
        boolean z11;
        HashSet hashSet;
        SQLiteDatabase writableDatabase;
        SQLiteDatabase writableDatabase2;
        if (bVar.f57328a.size() == 0) {
            Objects.toString(bVar.f57330c);
            return;
        }
        fc.c cVar = this.f57347b;
        a aVarB = b();
        synchronized (bVar.f57328a) {
            arrayList = new ArrayList(bVar.f57328a);
        }
        boolean z12 = false;
        boolean z13 = true;
        try {
            try {
            } catch (Throwable th2) {
                if (sQLiteDatabase != null) {
                    try {
                        if (sQLiteDatabase.inTransaction()) {
                            sQLiteDatabase.endTransaction();
                        }
                    } catch (Exception unused) {
                    }
                }
                throw th2;
            }
        } catch (Exception unused2) {
        }
        if (arrayList.isEmpty()) {
            z11 = false;
            Objects.toString(bVar.f57330c);
            if (this.f57350e != null) {
                if (!z11) {
                    b();
                    bVar.f();
                    return;
                }
                if (!this.f57350e.hasMessages(1002, bVar) && bVar.f57331d.isEmpty()) {
                    z12 = true;
                }
                boolean z14 = !this.f57347b.jw();
                if (z12 || !bVar.n || bVar.f57335h.get() < bVar.f57330c.fby()) {
                    z13 = z12;
                } else {
                    Objects.toString(bVar.f57330c);
                    z14 = true;
                }
                if (z13) {
                    d(bVar, z14);
                    return;
                }
                return;
            }
            return;
        }
        try {
            writableDatabase2 = aVarB.getWritableDatabase();
            try {
                try {
                    writableDatabase2.beginTransaction();
                    if (bVar.f57338k == null) {
                        bVar.f57338k = writableDatabase2.compileStatement("INSERT OR REPLACE INTO " + bVar.f57330c.dj() + "(data_id,data,priority,upload_retry_count,create_time) VALUES (?,?,?,?,?)");
                    }
                    int size = arrayList.size();
                    int i5 = 0;
                    while (i5 < size) {
                        try {
                            h hVar = (h) arrayList.get(i5);
                            byte[] bArrDj = hVar.dj();
                            if (bArrDj == null || bArrDj.length == 0) {
                                arrayList2 = arrayList;
                                hVar.toString();
                                dy.d dVar = bVar.f57337j;
                                if (dVar != null) {
                                    dVar.f(9, 1);
                                }
                            } else {
                                fc.e eVarDj = cVar.dj();
                                if (eVarDj != null) {
                                    byte[] bArrYcx = eVarDj.ycx(bArrDj);
                                    if (bArrYcx != null) {
                                        dy.d dVar2 = bVar.f57337j;
                                        if (dVar2 != null) {
                                            dVar2.f(5, 1);
                                        }
                                        bArrDj = bArrYcx;
                                    } else {
                                        dy.d dVar3 = bVar.f57337j;
                                        if (dVar3 != null) {
                                            dVar3.f(6, 1);
                                        }
                                    }
                                }
                                bVar.f57338k.clearBindings();
                                bVar.f57338k.bindString(1, hVar.lt());
                                bVar.f57338k.bindBlob(2, bArrDj);
                                arrayList2 = arrayList;
                                try {
                                    try {
                                        bVar.f57338k.bindLong(3, hVar.zb());
                                        bVar.f57338k.bindLong(4, hVar.lud());
                                        bVar.f57338k.bindLong(5, hVar.ycx());
                                        bVar.f57338k.executeInsert();
                                    } catch (Throwable unused3) {
                                        dy.d dVar4 = bVar.f57337j;
                                        if (dVar4 != null) {
                                            dVar4.f(10004, 1);
                                        }
                                        if (writableDatabase2 != null && writableDatabase2.inTransaction()) {
                                            writableDatabase2.endTransaction();
                                        }
                                        z11 = false;
                                        if (z11) {
                                        }
                                        Objects.toString(bVar.f57330c);
                                        if (this.f57350e != null) {
                                        }
                                    }
                                } catch (Exception unused4) {
                                    try {
                                        dy.d dVar5 = bVar.f57337j;
                                        if (dVar5 != null) {
                                            dVar5.f(12, 1);
                                        }
                                        i5++;
                                        arrayList = arrayList2;
                                    } catch (SQLiteFullException unused5) {
                                        arrayList2.size();
                                        dy.d dVar6 = bVar.f57337j;
                                        if (dVar6 != null) {
                                            dVar6.f(10006, 1);
                                        }
                                        if (writableDatabase2 != null && writableDatabase2.inTransaction()) {
                                        }
                                        z11 = false;
                                        if (z11) {
                                        }
                                        Objects.toString(bVar.f57330c);
                                        if (this.f57350e != null) {
                                        }
                                    }
                                }
                            }
                        } catch (Exception unused6) {
                            arrayList2 = arrayList;
                        }
                        i5++;
                        arrayList = arrayList2;
                    }
                    arrayList2 = arrayList;
                    writableDatabase2.setTransactionSuccessful();
                    arrayList2.size();
                    try {
                        if (writableDatabase2.inTransaction()) {
                            writableDatabase2.endTransaction();
                        }
                    } catch (Exception unused7) {
                    }
                    z11 = true;
                } catch (SQLiteFullException unused8) {
                    arrayList2 = arrayList;
                }
            } catch (Throwable unused9) {
                arrayList2 = arrayList;
            }
        } catch (SQLiteFullException unused10) {
            arrayList2 = arrayList;
            writableDatabase2 = null;
        } catch (Throwable unused11) {
            arrayList2 = arrayList;
            writableDatabase2 = null;
        }
        if (z11) {
            bVar.f57340m = SystemClock.elapsedRealtime();
            bVar.f57335h.addAndGet(arrayList2.size());
            synchronized (bVar.f57328a) {
                bVar.f57328a.removeAll(arrayList2);
                arrayList2.size();
            }
            if (!bVar.f57332e.isEmpty()) {
                synchronized (bVar.f57332e) {
                    hashSet = new HashSet(bVar.f57332e);
                    bVar.f57332e.clear();
                }
                try {
                    writableDatabase = aVarB.getWritableDatabase();
                } catch (Throwable unused12) {
                    writableDatabase = null;
                }
                try {
                    writableDatabase.beginTransaction();
                    HashSet hashSet2 = new HashSet();
                    Iterator it = hashSet.iterator();
                    while (it.hasNext()) {
                        String str = (String) it.next();
                        if (writableDatabase.delete(bVar.f57330c.dj(), "data_id = ?", new String[]{str}) == 0) {
                            hashSet2.add(str);
                        }
                    }
                    writableDatabase.setTransactionSuccessful();
                    hashSet.size();
                    hashSet2.size();
                } catch (Throwable unused13) {
                    try {
                        dy.d dVar7 = bVar.f57337j;
                        if (dVar7 != null) {
                            dVar7.f(Sdk.SDKError.Reason.AD_LOAD_TOO_FREQUENTLY_VALUE, 1);
                        }
                        if (writableDatabase != null && writableDatabase.inTransaction()) {
                        }
                        Objects.toString(bVar.f57330c);
                        if (this.f57350e != null) {
                        }
                    } catch (Throwable th3) {
                        if (writableDatabase != null) {
                            try {
                                if (writableDatabase.inTransaction()) {
                                    writableDatabase.endTransaction();
                                }
                            } catch (Exception unused14) {
                            }
                        }
                        throw th3;
                    }
                }
                if (writableDatabase.inTransaction()) {
                    writableDatabase.endTransaction();
                }
            }
        }
        Objects.toString(bVar.f57330c);
        if (this.f57350e != null) {
        }
    }

    public final a b() {
        if (this.f57349d == null) {
            synchronized (this) {
                try {
                    if (this.f57349d == null) {
                        this.f57349d = new a(this.f57346a, this, this.f57347b);
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return this.f57349d;
    }

    public final void c(h hVar, boolean z11) {
        int size;
        char c11;
        Handler handler;
        Objects.toString(hVar);
        b bVar = (b) this.f57348c.get(hVar.getClass());
        if (bVar == null) {
            return;
        }
        synchronized (bVar.f57328a) {
            bVar.f57328a.add(hVar);
            size = bVar.f57328a.size();
        }
        if (hVar.zb() == 1) {
            c11 = 6;
        } else {
            int iT = (int) (t2.c.T(true) * bVar.f57330c.jw());
            if (iT <= 0) {
                iT = 1;
            }
            c11 = size > iT ? (char) 2 : (char) 1;
        }
        if ((c11 & 4) == 4 && this.f57347b.ycx()) {
            hVar.toString();
            b();
            bVar.f();
        }
        if (z11 || (c11 & 2) == 2) {
            if (this.f57351f != null) {
                this.f57351f.removeMessages(1001, bVar);
            }
            hVar.toString();
            a(bVar);
        } else if (this.f57351f != null && !this.f57351f.hasMessages(1001, bVar)) {
            Handler handler2 = this.f57351f;
            Message messageObtainMessage = this.f57351f.obtainMessage(1001, bVar);
            long jT = (long) (t2.c.T(true) * bVar.f57330c.jc());
            if (jT <= 0) {
                jT = 100;
            }
            handler2.sendMessageDelayed(messageObtainMessage, jT);
            bVar.f57330c.jc();
            t2.c.T(true);
        }
        dy.d dVar = bVar.f57337j;
        if (dVar == null || (handler = dVar.f49839b) == null || handler.hasMessages(10000)) {
            return;
        }
        dVar.f49839b.sendEmptyMessageDelayed(10000, 60000L);
    }

    public final void d(b bVar, boolean z11) {
        long jMin = 0;
        if (!z11) {
            long jT = (long) (t2.c.T(false) * bVar.f57330c.ycx());
            if (jT <= 0 || jT > TTAdConstant.AD_MAX_EVENT_TIME) {
                jT = 15000;
            }
            if (bVar.f57336i.get() < 2) {
                jMin = jT;
            } else {
                jMin = (long) Math.min(600000.0d, Math.pow(2.0d, bVar.f57336i.get()) * jT);
                bVar.f57336i.get();
            }
        }
        this.f57350e.removeMessages(1002, bVar);
        this.f57350e.sendMessageDelayed(this.f57350e.obtainMessage(1002, bVar), jMin);
        Objects.toString(bVar.f57330c);
    }

    public final void e(b bVar, boolean z11, boolean z12, boolean z13) {
        if (z12 && !z11) {
            Objects.toString(bVar.f57330c);
            return;
        }
        if (z12 && z13) {
            Objects.toString(bVar.f57330c);
        } else if (this.f57350e.hasMessages(1002, bVar)) {
            return;
        }
        d(bVar, z12 && z11);
    }

    public final void g(h hVar) {
        fc.b bVarZb = this.f57347b.zb();
        ExecutorService executorServiceYcx = bVarZb != null ? bVarZb.ycx() : null;
        if (executorServiceYcx == null) {
            if (ic.b.f61515a == null) {
                synchronized (ic.b.class) {
                    try {
                        if (ic.b.f61515a == null) {
                            ic.b.f61515a = new ThreadPoolExecutor(1, 2, 60L, TimeUnit.SECONDS, new PriorityBlockingQueue(), new ic.a(0));
                        }
                    } catch (Throwable th2) {
                        throw th2;
                    }
                }
            }
            executorServiceYcx = ic.b.f61515a;
        }
        Objects.toString(hVar);
        executorServiceYcx.execute(new d(this, hVar.ul(), hVar));
    }

    @Override // android.os.Handler.Callback
    public final boolean handleMessage(Message message) {
        if (vh.a.f92766b) {
            try {
                switch (message.what) {
                    case 1000:
                        Object obj = message.obj;
                        if (!(obj instanceof h)) {
                            obj.getClass();
                            break;
                        } else {
                            c((h) obj, false);
                            return true;
                        }
                    case 1001:
                        a((b) message.obj);
                        return true;
                    case 1002:
                        ((b) message.obj).d(b(), this.f57347b.fby());
                        return true;
                    case BackupConstant.SCENE_CLOSED_WITHOUT_SHOW /* 1003 */:
                        ((b) message.obj).a(b());
                        return true;
                    case 1004:
                        ((b) message.obj).b(b());
                        return true;
                }
            } catch (Exception unused) {
            }
        }
        return true;
    }
}
