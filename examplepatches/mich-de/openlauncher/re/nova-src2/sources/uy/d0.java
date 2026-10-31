package uy;

import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Process;
import android.os.UserHandle;
import android.util.SparseArray;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.util.ComponentKey;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.icon.NovaIconSource;
import e10.y2;
import java.util.ArrayList;
import java.util.EnumMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;
import kl.q0;
import kotlin.math.MathKt;
import o9.t1;

/* loaded from: classes.dex */
public final class d0 {

    /* renamed from: e, reason: collision with root package name */
    public static final d0 f91699e = new d0();

    /* renamed from: f, reason: collision with root package name */
    public static final jz.m f91700f;

    /* renamed from: b, reason: collision with root package name */
    public z.v f91702b;

    /* renamed from: a, reason: collision with root package name */
    public final SparseArray f91701a = new SparseArray();

    /* renamed from: c, reason: collision with root package name */
    public final HashSet f91703c = new HashSet();

    /* renamed from: d, reason: collision with root package name */
    public boolean f91704d = false;

    static {
        jz.m mVar = new jz.m(1);
        mVar.f70552b = new y9.i(1);
        mVar.f70553c = null;
        f91700f = mVar;
    }

    public static d0 i() {
        return f91699e;
    }

    public static jz.m k() {
        Context context = mx.g0.f77088a;
        mx.g0.e();
        jz.m mVar = f91700f;
        mVar.getClass();
        Locale locale = Locale.getDefault();
        if (Locale.getDefault() != ((Locale) mVar.f70553c)) {
            mVar.f70553c = locale;
            mVar.f70552b = new y9.i(1);
        }
        return mVar;
    }

    public static void u(ContentResolver contentResolver, long j11, String str, Boolean bool, int i5, Bitmap bitmap, NovaIconSource novaIconSource, String str2, iz.c cVar, n0 n0Var) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("title", str);
        contentValues.put("tabColor", Integer.valueOf(i5));
        contentValues.put("hideApps", bool);
        if (bitmap == BitmapInfo.f21149c) {
            contentValues.putNull("icon");
            contentValues.putNull("customIconSource");
            contentValues.putNull("customIconLoadedState");
        } else if (bitmap != null) {
            contentValues.put("icon", aa.p.a(bitmap));
            contentValues.put("customIconSource", novaIconSource.b());
            contentValues.put("customIconLoadedState", str2);
        }
        if (n0Var != null) {
            contentValues.put("groupType", n0Var.name());
        }
        contentValues.put("flags", Integer.valueOf(cVar.f68417a));
        contentResolver.update(o0.f91743a, contentValues, "_id = ?", new String[]{Long.toString(j11)});
    }

    public final s a(ContentResolver contentResolver, String str, n0 n0Var, Boolean bool, Integer num, int i5, y30.b bVar, iz.c cVar) throws NumberFormatException {
        ContentValues contentValues = new ContentValues();
        contentValues.put("title", str);
        if (bVar != null) {
            contentValues.put("category_id", bVar.name());
        }
        contentValues.put("groupType", n0Var.name());
        contentValues.put("flags", Integer.valueOf(cVar.f68417a));
        if (i5 == -1) {
            ArrayList arrayListL = l();
            int iMax = 0;
            for (int i11 = 0; i11 < arrayListL.size(); i11++) {
                iMax = Math.max(iMax, ((j) arrayListL.get(i11)).f91754f);
            }
            i5 = iMax + 1;
        }
        contentValues.put("tabOrder", Integer.valueOf(i5));
        if (num != null) {
            contentValues.put("tabColor", num);
        }
        contentValues.put("hideApps", n0Var.a() ? bool : Boolean.FALSE);
        Uri uriInsert = contentResolver.insert(o0.f91743a, contentValues);
        if (n0Var != n0.f91732d) {
            String lastPathSegment = uriInsert.getLastPathSegment();
            if (lastPathSegment == null) {
                return null;
            }
            int i12 = Integer.parseInt(lastPathSegment);
            s sVarB = n0Var.b(str, this);
            if (num != null) {
                sVarB.f91755g = num.intValue();
            }
            sVarB.f91753e = i12;
            sVarB.f91752d = bVar;
            sVarB.f91750b = bool.booleanValue();
            sVarB.f91754f = i5;
            sVarB.f91756h = cVar;
            synchronized (this) {
                try {
                    if (n0Var == n0.f91731c) {
                        sVarB.f91757i = f(sVarB);
                    }
                    this.f91702b.e(sVarB.f91753e, sVarB);
                    q();
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            return sVarB;
        }
        String lastPathSegment2 = uriInsert.getLastPathSegment();
        if (lastPathSegment2 == null) {
            return null;
        }
        int i13 = Integer.parseInt(lastPathSegment2);
        q qVar = new q(str);
        qVar.f91753e = i13;
        qVar.f91752d = bVar;
        qVar.f91750b = bool.booleanValue();
        qVar.f91754f = contentValues.getAsInteger("tabOrder").intValue();
        qVar.f91756h = cVar;
        synchronized (this) {
            qVar.f91757i = f(qVar);
            this.f91702b.e(qVar.f91753e, qVar);
            q();
        }
        iz.a aVar = new iz.a();
        aVar.I = qVar;
        aVar.f57300l = qVar.f91749a;
        BitmapInfo bitmapInfo = qVar.f91746j;
        if (bitmapInfo != null) {
            aVar.f57304r = bitmapInfo;
        }
        t1.d().f80133b.c(new g0(aVar));
        return qVar;
    }

    public final synchronized void b(c0 c0Var) {
        this.f91703c.add(c0Var);
    }

    public final synchronized void c(q qVar, ComponentKey componentKey) {
        ga.a aVar;
        try {
            Context context = t1.d().f80132a;
            Iterator it = t1.d().f80133b.e(context, false).iterator();
            while (true) {
                if (!it.hasNext()) {
                    aVar = null;
                    break;
                }
                aVar = (ga.a) it.next();
                if (!(aVar instanceof ga.c)) {
                    ComponentName componentName = aVar.f57279y;
                    UserHandle userHandle = aVar.o;
                    if (componentKey.f21251a.equals(componentName) && componentKey.f21252b.equals(userHandle)) {
                        break;
                    }
                }
            }
            ga.j jVar = aVar != null ? new ga.j(aVar) : lx.a.a(context, componentKey.f21251a, componentKey.f21252b);
            jVar.f57291c = qVar.g();
            jVar.f57299k = -100;
            jVar.f57290b = 0;
            Iterator it2 = this.f91703c.iterator();
            boolean z11 = true;
            while (it2.hasNext()) {
                if (((c0) it2.next()).D(qVar, jVar)) {
                    z11 = false;
                }
            }
            if (z11) {
                float f11 = 0.0f * 2;
                t1.d().f80133b.g(false, false, null).a(jVar, qVar.g(), 0, new n30.a(MathKt.b(f11)), new n30.a(MathKt.b(f11)));
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final void d(ContentResolver contentResolver, s sVar) {
        synchronized (this) {
            try {
                if (sVar instanceof q) {
                    int iG = ((q) sVar).g();
                    t1.d().f80133b.c(new f0(iG));
                    q0 q0Var = new q0(this);
                    q0Var.h(new ComponentKey(new ComponentName("com.teslacoilsw.launcher", "FOLDER:" + iG), Process.myUserHandle()));
                    q0Var.b(contentResolver);
                }
                this.f91702b.f(sVar.f91753e);
                this.f91701a.remove(sVar.f91753e);
                q();
            } catch (Throwable th2) {
                throw th2;
            }
        }
        String[] strArr = {Integer.toString(sVar.f91753e)};
        contentResolver.delete(i0.f91717a, "groupId = ?", strArr);
        contentResolver.delete(o0.f91743a, "_id = ?", strArr);
        ComponentName componentName = NovaLauncher.f45646r1;
    }

    public final synchronized b e(int i5, boolean z11) {
        b bVar;
        try {
            bVar = (b) this.f91701a.get(i5);
            if (bVar == null) {
                bVar = new b();
                this.f91701a.put(i5, bVar);
            }
            if (z11 && bVar.f91683a == null) {
                bVar.f91683a = e(-100, false);
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return bVar;
    }

    public final synchronized b f(s sVar) {
        return e(sVar.f91753e, sVar.e());
    }

    public final synchronized b g() {
        return e(-1, false);
    }

    public final synchronized s h(int i5) {
        if (i5 != -1) {
            return (s) this.f91702b.c(i5);
        }
        Context context = mx.g0.f77088a;
        return r.g(mx.g0.e());
    }

    public final synchronized ArrayList j(boolean z11) {
        ArrayList arrayList;
        try {
            arrayList = new ArrayList(this.f91702b.g());
            for (int iG = this.f91702b.g() - 1; iG >= 0; iG--) {
                s sVar = (s) this.f91702b.h(iG);
                if (z11 || sVar.d()) {
                    arrayList.add(sVar);
                }
            }
            arrayList.sort(k());
        } catch (Throwable th2) {
            throw th2;
        }
        return arrayList;
    }

    public final synchronized ArrayList l() {
        ArrayList arrayList;
        try {
            arrayList = new ArrayList(this.f91702b.g());
            for (int iG = this.f91702b.g() - 1; iG >= 0; iG--) {
                s sVar = (s) this.f91702b.h(iG);
                if ((sVar instanceof j) && sVar.d()) {
                    arrayList.add((j) sVar);
                }
            }
            arrayList.sort(k());
        } catch (Throwable th2) {
            throw th2;
        }
        return arrayList;
    }

    public final synchronized b m() {
        v();
        b bVar = (b) this.f91701a.get(-1);
        if (bVar != null) {
            return bVar;
        }
        return b.f91682c;
    }

    public final x7.e n() {
        EnumMap enumMap = new EnumMap(y30.b.class);
        Iterator it = j(true).iterator();
        while (it.hasNext()) {
            s sVar = (s) it.next();
            y30.b bVar = sVar.f91752d;
            if (bVar != null) {
                enumMap.put((EnumMap) bVar, (y30.b) sVar);
            }
        }
        s sVar2 = new s("ALREADY_PROCESSED");
        sVar2.f91757i = e(-100, false);
        return new x7.e(enumMap, sVar2);
    }

    public final synchronized void o(Context context) throws Throwable {
        m mVar;
        l lVar;
        ContentResolver contentResolver;
        d0 d0Var;
        int i5;
        try {
            if (this.f91704d) {
                return;
            }
            p(context);
            ja.h hVar = (ja.h) ja.h.f69294h.h(context);
            boolean zG = hVar.g();
            ContentResolver contentResolver2 = context.getContentResolver();
            Cursor cursorQuery = contentResolver2.query(o0.f91743a, null, null, null, "tabOrder, title");
            Object obj = null;
            if (cursorQuery == null || cursorQuery.getCount() <= 0) {
                if (cursorQuery != null) {
                    cursorQuery.close();
                }
                mVar = null;
                lVar = null;
            } else {
                z zVar = new z((t1) t1.f80131h.h(context), cursorQuery);
                this.f91702b = new z.v(zVar.getCount());
                mVar = null;
                l lVar2 = null;
                while (zVar.moveToNext()) {
                    s sVarA = zVar.a(this);
                    if (sVarA != null) {
                        if (!n0.f91729a.equals(sVarA.f91751c)) {
                            if (n0.f91730b.equals(sVarA.f91751c)) {
                                if (mVar == null && zG) {
                                    mVar = (m) sVarA;
                                }
                            }
                            this.f91702b.e(sVarA.f91753e, sVarA);
                        } else if (lVar2 == null) {
                            lVar2 = (l) sVarA;
                            this.f91702b.e(sVarA.f91753e, sVarA);
                        }
                    }
                }
                zVar.close();
                lVar = lVar2;
            }
            if (this.f91702b == null) {
                this.f91702b = new z.v(obj);
            }
            i iVar = new i(hVar, 1);
            if (zG && mVar == null) {
                try {
                    contentResolver = contentResolver2;
                    mVar = (m) a(contentResolver, context.getString(2132017452), n0.f91730b, Boolean.FALSE, 262914, 100, null, new iz.c(0));
                    mVar.f91754f = 100;
                } catch (Throwable th2) {
                    th = th2;
                    throw th;
                }
            } else {
                contentResolver = contentResolver2;
            }
            m mVar2 = mVar;
            if (mVar2 != null) {
                y2.f51877a.getClass();
                boolean zBooleanValue = ((Boolean) y2.b0().l()).booleanValue();
                iz.c cVar = mVar2.f91756h;
                cVar.f68417a = cVar.g(128, !zBooleanValue);
                mVar2.f91721k = new ya.t(iVar, 1);
            }
            if (lVar == null) {
                d0Var = this;
                lVar = (l) d0Var.a(contentResolver, context.getString(2132017979), n0.f91729a, Boolean.FALSE, 262914, -1, null, new iz.c(0));
                lVar.f91754f = 0;
            } else {
                d0Var = this;
            }
            if (mVar2 != null && mVar2.d()) {
                lVar.f91721k = iVar;
            }
            for (y30.b bVar : y30.b.values()) {
                int i11 = 0;
                while (true) {
                    if (i11 >= d0Var.f91702b.g()) {
                        switch (bVar.ordinal()) {
                            case 0:
                                i5 = 2132019506;
                                break;
                            case 1:
                                i5 = 2132019507;
                                break;
                            case 2:
                                i5 = 2132019508;
                                break;
                            case 3:
                                i5 = 2132019509;
                                break;
                            case 4:
                                i5 = 2132019510;
                                break;
                            case 5:
                                i5 = 2132019511;
                                break;
                            case 6:
                                i5 = 2132019512;
                                break;
                            default:
                                i5 = 0;
                                break;
                        }
                        d0Var.a(contentResolver, context.getString(i5), n0.f91732d, Boolean.TRUE, 262914, -1, bVar, new iz.c(128));
                    } else if (((s) d0Var.f91702b.h(i11)).f91752d == bVar) {
                        break;
                    } else {
                        i11++;
                    }
                }
            }
            d0Var.f91704d = true;
        } catch (Throwable th3) {
            th = th3;
        }
    }

    public final void p(Context context) throws IllegalArgumentException {
        Cursor cursorQuery = context.getContentResolver().query(i0.f91717a, new String[]{"groupId", "component"}, null, null, null);
        int columnIndexOrThrow = cursorQuery.getColumnIndexOrThrow("component");
        int columnIndexOrThrow2 = cursorQuery.getColumnIndexOrThrow("groupId");
        SparseArray sparseArray = this.f91701a;
        sparseArray.clear();
        while (cursorQuery.moveToNext()) {
            int i5 = cursorQuery.getInt(columnIndexOrThrow2);
            b bVar = (b) sparseArray.get(i5);
            if (bVar == null) {
                bVar = new b();
                sparseArray.put(i5, bVar);
            }
            ComponentKey componentKeyA = ab.e0.a(context, cursorQuery.getString(columnIndexOrThrow));
            if (componentKeyA != null) {
                bVar.a(componentKeyA);
            }
        }
        cursorQuery.close();
    }

    public final synchronized void q() {
        Iterator it = this.f91703c.iterator();
        while (it.hasNext()) {
            ((c0) it.next()).o();
        }
    }

    public final synchronized void r(Context context) {
        this.f91704d = false;
        this.f91702b = null;
        o(context);
    }

    public final synchronized void s(c0 c0Var) {
        this.f91703c.remove(c0Var);
    }

    public final synchronized void t(q qVar, ComponentKey componentKey) {
        try {
            Iterator it = this.f91703c.iterator();
            while (it.hasNext()) {
                ((c0) it.next()).q(qVar, componentKey);
            }
            t1.d().f80133b.g(false, false, null).g(new b0(0, qVar, componentKey));
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized h0 v() {
        h0 h0Var;
        try {
            h0Var = (h0) this.f91701a.get(-2);
            if (h0Var == null) {
                h0Var = new h0();
                this.f91701a.put(-2, h0Var);
            } else {
                synchronized (h0Var.f91684b) {
                    h0Var.f91684b.clear();
                }
            }
            Set setD = g().d();
            synchronized (h0Var.f91684b) {
                h0Var.f91684b.addAll(setD);
            }
            z.v vVar = this.f91702b;
            if (vVar != null) {
                for (int iG = vVar.g() - 1; iG >= 0; iG--) {
                    s sVar = (s) this.f91702b.h(iG);
                    if (sVar.f91757i != null && sVar.f91750b && sVar.d()) {
                        Set setD2 = sVar.f91757i.d();
                        synchronized (h0Var.f91684b) {
                            h0Var.f91684b.addAll(setD2);
                        }
                    }
                }
            }
        } finally {
        }
        return h0Var;
    }
}
