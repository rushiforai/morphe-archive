package com.google.android.gms.internal.measurement;

import android.net.Uri;
import android.text.TextUtils;
import com.amplitude.android.migration.DatabaseConstants;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes3.dex */
public abstract class gh {

    /* renamed from: a, reason: collision with root package name */
    public static final ii f32579a;

    /* renamed from: b, reason: collision with root package name */
    public static final ji f32580b;

    static {
        int i5 = 1;
        f32579a = new ii(i5);
        f32580b = new ji(i5);
    }

    public static ki a(Set set) {
        ki kiVar = new ki();
        kiVar.f32749d = f32580b;
        Iterator it = set.iterator();
        while (it.hasNext()) {
            th thVar = (th) it.next();
            fb.b(thVar, DatabaseConstants.KEY_FIELD);
            boolean z11 = thVar.f33094c;
            HashMap map = kiVar.f32747b;
            HashMap map2 = kiVar.f32746a;
            if (!z11) {
                map.remove(thVar);
                map2.put(thVar, ki.f32744e);
            } else {
                if (!z11) {
                    throw new IllegalArgumentException("key must be repeating");
                }
                map2.remove(thVar);
                map.put(thVar, ki.f32745f);
            }
        }
        return kiVar;
    }

    public static final File b(Uri uri) throws zzsi {
        if (!uri.getScheme().equals("file")) {
            throw new zzsi("Scheme must be 'file'");
        }
        if (!TextUtils.isEmpty(uri.getQuery())) {
            throw new zzsi("Did not expect uri to have query");
        }
        if (TextUtils.isEmpty(uri.getAuthority())) {
            return new File(uri.getPath());
        }
        throw new zzsi("Did not expect uri to have authority");
    }

    public static void c(int i5, String str, List list) {
        if (list.size() == i5) {
            return;
        }
        throw new IllegalArgumentException(str + " operation requires " + i5 + " parameters found " + list.size());
    }

    public static /* synthetic */ boolean e(int i5, qh qhVar, StringBuilder sb2) {
        if (i5 - 1 != 0 || qhVar == qh.f33021a) {
            return false;
        }
        sb2.append(qhVar.a());
        sb2.append('.');
        sb2.append(qhVar.b());
        sb2.append(AbstractJsonLexerKt.COLON);
        sb2.append(qhVar.c());
        return true;
    }

    public static void f(int i5, String str, List list) {
        if (list.size() >= i5) {
            return;
        }
        throw new IllegalArgumentException(str + " operation requires at least " + i5 + " parameters found " + list.size());
    }

    public static void g(int i5, String str, ArrayList arrayList) {
        if (arrayList.size() <= i5) {
            return;
        }
        throw new IllegalArgumentException(str + " operation requires at most " + i5 + " parameters found " + arrayList.size());
    }

    public static boolean h(f6 f6Var) {
        if (f6Var == null) {
            return false;
        }
        Double dZzd = f6Var.zzd();
        return !dZzd.isNaN() && dZzd.doubleValue() >= 0.0d && dZzd.equals(Double.valueOf(Math.floor(dZzd.doubleValue())));
    }

    public static o6 i(String str) throws NumberFormatException {
        o6 o6Var = null;
        if (str != null && !str.isEmpty()) {
            o6Var = (o6) o6.f32895l0.get(Integer.valueOf(Integer.parseInt(str)));
        }
        if (o6Var != null) {
            return o6Var;
        }
        throw new IllegalArgumentException(b.c0.k("Unsupported commandId ", str));
    }

    public static boolean j(f6 f6Var, f6 f6Var2) {
        if (!f6Var.getClass().equals(f6Var2.getClass())) {
            return false;
        }
        if ((f6Var instanceof j6) || (f6Var instanceof d6)) {
            return true;
        }
        if (!(f6Var instanceof s3)) {
            return f6Var instanceof i6 ? f6Var.zzc().equals(f6Var2.zzc()) : f6Var instanceof h2 ? f6Var.zze().equals(f6Var2.zze()) : f6Var == f6Var2;
        }
        if (Double.isNaN(f6Var.zzd().doubleValue()) || Double.isNaN(f6Var2.zzd().doubleValue())) {
            return false;
        }
        return f6Var.zzd().equals(f6Var2.zzd());
    }

    public static int k(double d5) {
        if (Double.isNaN(d5) || Double.isInfinite(d5) || d5 == 0.0d) {
            return 0;
        }
        return (int) (((d5 > 0.0d ? 1 : -1) * Math.floor(Math.abs(d5))) % 4.294967296E9d);
    }

    public static double l(double d5) {
        if (Double.isNaN(d5)) {
            return 0.0d;
        }
        if (Double.isInfinite(d5) || d5 == 0.0d || d5 == 0.0d) {
            return d5;
        }
        return (d5 > 0.0d ? 1 : -1) * Math.floor(Math.abs(d5));
    }

    public static Object m(f6 f6Var) {
        if (f6.Ro.equals(f6Var)) {
            return null;
        }
        if (f6.Qo.equals(f6Var)) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        if (f6Var instanceof c6) {
            return n((c6) f6Var);
        }
        if (!(f6Var instanceof s1)) {
            return !f6Var.zzd().isNaN() ? f6Var.zzd() : f6Var.zzc();
        }
        ArrayList arrayList = new ArrayList();
        s1 s1Var = (s1) f6Var;
        int i5 = 0;
        while (i5 < s1Var.j()) {
            if (i5 >= s1Var.j()) {
                throw new NoSuchElementException(b.c0.p(new StringBuilder(String.valueOf(i5).length() + 21), "Out of bounds index: ", i5));
            }
            int i11 = i5 + 1;
            Object objM = m(s1Var.k(i5));
            if (objM != null) {
                arrayList.add(objM);
            }
            i5 = i11;
        }
        return arrayList;
    }

    public static HashMap n(c6 c6Var) {
        HashMap map = new HashMap();
        Iterator it = new ArrayList(c6Var.f32427a.keySet()).iterator();
        while (it.hasNext()) {
            String str = (String) it.next();
            Object objM = m(c6Var.b(str));
            if (objM != null) {
                map.put(str, objM);
            }
        }
        return map;
    }

    public static void o(j8 j8Var) {
        int iK = k(j8Var.h("runtime.counter").zzd().doubleValue() + 1.0d);
        if (iK > 1000000) {
            throw new IllegalStateException("Instructions allowed exceeded");
        }
        j8Var.f("runtime.counter", new s3(Double.valueOf(iK)));
    }

    public abstract void d(byte[] bArr, int i5, int i11);
}
