package p6;

import android.net.Uri;
import android.os.Bundle;
import b.u4;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.ConstrainedOnceSequence;
import z.d1;
import z.e1;
import z.f1;

/* loaded from: classes2.dex */
public abstract class e0 {

    /* renamed from: i, reason: collision with root package name */
    public static final /* synthetic */ int f82151i = 0;

    /* renamed from: a, reason: collision with root package name */
    public final String f82152a;

    /* renamed from: b, reason: collision with root package name */
    public h0 f82153b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f82154c;

    /* renamed from: d, reason: collision with root package name */
    public final d1 f82155d;

    /* renamed from: e, reason: collision with root package name */
    public final LinkedHashMap f82156e;

    /* renamed from: f, reason: collision with root package name */
    public int f82157f;

    /* renamed from: g, reason: collision with root package name */
    public String f82158g;

    /* renamed from: h, reason: collision with root package name */
    public a70.d f82159h;

    static {
        new LinkedHashMap();
    }

    public e0(z0 navigator) {
        Intrinsics.g(navigator, "navigator");
        LinkedHashMap linkedHashMap = b1.f82141b;
        this.f82152a = a1.g(navigator.getClass());
        this.f82154c = new ArrayList();
        this.f82155d = new d1(0);
        this.f82156e = new LinkedHashMap();
    }

    public final Bundle b(Bundle bundle) {
        Object obj;
        LinkedHashMap linkedHashMap = this.f82156e;
        if (bundle == null && linkedHashMap.isEmpty()) {
            return null;
        }
        Bundle bundle2 = new Bundle();
        for (Map.Entry entry : linkedHashMap.entrySet()) {
            String name = (String) entry.getKey();
            h hVar = (h) entry.getValue();
            hVar.getClass();
            Intrinsics.g(name, "name");
            if (hVar.f82175c && (obj = hVar.f82176d) != null) {
                hVar.f82173a.e(bundle2, name, obj);
            }
        }
        if (bundle != null) {
            bundle2.putAll(bundle);
            for (Map.Entry entry2 : linkedHashMap.entrySet()) {
                String name2 = (String) entry2.getKey();
                h hVar2 = (h) entry2.getValue();
                hVar2.getClass();
                x0 x0Var = hVar2.f82173a;
                Intrinsics.g(name2, "name");
                if (hVar2.f82174b || !bundle2.containsKey(name2) || bundle2.get(name2) != null) {
                    try {
                        x0Var.a(name2, bundle2);
                    } catch (ClassCastException unused) {
                    }
                }
                StringBuilder sbK = u4.k("Wrong argument type for '", name2, "' in argument bundle. ");
                sbK.append(x0Var.b());
                sbK.append(" expected.");
                throw new IllegalArgumentException(sbK.toString().toString());
            }
        }
        return bundle2;
    }

    public b0 c(mh.c cVar) {
        ArrayList arrayList = this.f82154c;
        if (arrayList.isEmpty()) {
            return null;
        }
        Iterator it = arrayList.iterator();
        b0 b0Var = null;
        while (it.hasNext()) {
            z zVar = (z) it.next();
            Uri uri = (Uri) cVar.f76324c;
            LinkedHashMap arguments = this.f82156e;
            Bundle bundleD = uri != null ? zVar.d(uri, arguments) : null;
            int iB = zVar.b(uri);
            String str = (String) cVar.f76323b;
            boolean z11 = str != null && str.equals(null);
            if (bundleD == null) {
                if (z11) {
                    Intrinsics.g(arguments, "arguments");
                    Bundle bundle = new Bundle();
                    if (uri != null) {
                        Pattern pattern = (Pattern) zVar.f82303d.getValue();
                        Matcher matcher = pattern != null ? pattern.matcher(uri.toString()) : null;
                        if (matcher != null && matcher.matches()) {
                            zVar.e(matcher, bundle, arguments);
                            if (((Boolean) zVar.f82304e.getValue()).booleanValue()) {
                                zVar.f(uri, bundle, arguments);
                            }
                        }
                    }
                    if (j.r(arguments, new y(1, bundle)).isEmpty()) {
                    }
                }
            }
            b0 b0Var2 = new b0(this, bundleD, zVar.f82311l, iB, z11);
            if (b0Var == null || b0Var2.compareTo(b0Var) > 0) {
                b0Var = b0Var2;
            }
        }
        return b0Var;
    }

    public final b0 d(String route) {
        z zVar;
        Intrinsics.g(route, "route");
        a70.d dVar = this.f82159h;
        if (dVar == null || (zVar = (z) dVar.getValue()) == null) {
            return null;
        }
        Uri uri = Uri.parse("android-app://androidx.navigation/".concat(route));
        Intrinsics.c(uri);
        Bundle bundleD = zVar.d(uri, this.f82156e);
        if (bundleD == null) {
            return null;
        }
        return new b0(this, bundleD, zVar.f82311l, zVar.b(uri), false);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean equals(Object obj) {
        boolean z11;
        LinkedHashMap linkedHashMap;
        boolean z12;
        if (this != obj) {
            if (obj != null && (obj instanceof e0)) {
                e0 e0Var = (e0) obj;
                d1 d1Var = e0Var.f82155d;
                LinkedHashMap linkedHashMap2 = e0Var.f82156e;
                boolean zB = Intrinsics.b(this.f82154c, e0Var.f82154c);
                d1 d1Var2 = this.f82155d;
                if (d1Var2.f() == d1Var.f()) {
                    Iterator it = ((ConstrainedOnceSequence) q70.d.m0(new f1(d1Var2))).iterator();
                    while (it.hasNext()) {
                        int iIntValue = ((Number) it.next()).intValue();
                        if (!Intrinsics.b(e1.b(d1Var2, iIntValue), e1.b(d1Var, iIntValue))) {
                        }
                    }
                    z11 = true;
                    linkedHashMap = this.f82156e;
                    if (linkedHashMap.size() == linkedHashMap2.size()) {
                        for (Map.Entry entry : b70.g.M0(linkedHashMap.entrySet()).f71731a) {
                            if (!linkedHashMap2.containsKey(entry.getKey()) || !Intrinsics.b(linkedHashMap2.get(entry.getKey()), entry.getValue())) {
                            }
                        }
                        z12 = true;
                        if (this.f82157f == e0Var.f82157f || !Intrinsics.b(this.f82158g, e0Var.f82158g) || !zB || !z11 || !z12) {
                        }
                    }
                    z12 = false;
                    if (this.f82157f == e0Var.f82157f) {
                    }
                }
                z11 = false;
                linkedHashMap = this.f82156e;
                if (linkedHashMap.size() == linkedHashMap2.size()) {
                }
                z12 = false;
                if (this.f82157f == e0Var.f82157f) {
                }
            }
            return false;
        }
        return true;
    }

    public int hashCode() {
        int i5 = this.f82157f * 31;
        String str = this.f82158g;
        int iHashCode = i5 + (str != null ? str.hashCode() : 0);
        Iterator it = this.f82154c.iterator();
        while (it.hasNext()) {
            iHashCode = (((z) it.next()).f82300a.hashCode() + (iHashCode * 31)) * 961;
        }
        d1 d1Var = this.f82155d;
        Intrinsics.g(d1Var, "<this>");
        if (d1Var.f() > 0) {
            d1Var.g(0).getClass();
            throw new ClassCastException();
        }
        LinkedHashMap linkedHashMap = this.f82156e;
        for (String str2 : linkedHashMap.keySet()) {
            int iE = b.c0.e(iHashCode * 31, 31, str2);
            Object obj = linkedHashMap.get(str2);
            iHashCode = iE + (obj != null ? obj.hashCode() : 0);
        }
        return iHashCode;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(getClass().getSimpleName());
        sb2.append("(0x");
        sb2.append(Integer.toHexString(this.f82157f));
        sb2.append(")");
        String str = this.f82158g;
        if (str != null && !r70.k.U0(str)) {
            sb2.append(" route=");
            sb2.append(this.f82158g);
        }
        String string = sb2.toString();
        Intrinsics.f(string, "sb.toString()");
        return string;
    }
}
