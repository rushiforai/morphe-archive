package p6;

import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.view.View;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.stripe.android.core.exception.StripeException;
import com.stripe.android.core.strings.ResolvableString;
import e00.f2;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Pattern;
import kotlin.collections.EmptySet;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.StringCompanionObject;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import p1.e1;
import p1.t1;

/* loaded from: classes2.dex */
public abstract class j {
    public static void A(StringBuilder sb2, t5.d0 d0Var, u60.d dVar) {
        sb2.append("Pattern{id=0x");
        sb2.append(Integer.toHexString(System.identityHashCode(dVar)));
        HashSet hashSet = (HashSet) d0Var.f88562b;
        if (hashSet.contains(Integer.valueOf(System.identityHashCode(dVar)))) {
            sb2.append(",[...]");
        } else {
            hashSet.add(Integer.valueOf(System.identityHashCode(dVar)));
            sb2.append(",regex=\"");
            Pattern pattern = dVar.f90646a;
            String str = dVar.f90649d;
            sb2.append(pattern);
            sb2.append(AbstractJsonLexerKt.STRING);
            if (dVar.f90647b) {
                sb2.append(",lookbehind=true");
            }
            if (dVar.f90648c) {
                sb2.append(",greedy=true");
            }
            if (str != null) {
                sb2.append(",alias=\"");
                sb2.append(str);
                sb2.append(AbstractJsonLexerKt.STRING);
            }
            u60.e eVar = dVar.f90650e;
            if (eVar != null) {
                sb2.append(",inside=");
                B(sb2, d0Var, eVar);
            }
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
    }

    public static void B(StringBuilder sb2, t5.d0 d0Var, u60.e eVar) {
        sb2.append("Grammar{id=0x");
        sb2.append(Integer.toHexString(System.identityHashCode(eVar)));
        sb2.append(",name=\"");
        sb2.append(eVar.name());
        sb2.append(AbstractJsonLexerKt.STRING);
        HashSet hashSet = (HashSet) d0Var.f88562b;
        if (hashSet.contains(Integer.valueOf(System.identityHashCode(eVar)))) {
            sb2.append(",[...]");
        } else {
            hashSet.add(Integer.valueOf(System.identityHashCode(eVar)));
            sb2.append(",tokens=[");
            boolean z11 = true;
            for (u60.j jVar : eVar.tokens()) {
                if (z11) {
                    z11 = false;
                } else {
                    sb2.append(AbstractJsonLexerKt.COMMA);
                }
                C(sb2, d0Var, jVar);
            }
            sb2.append(AbstractJsonLexerKt.END_LIST);
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
    }

    public static void C(StringBuilder sb2, t5.d0 d0Var, u60.j jVar) {
        sb2.append("Token{id=0x");
        sb2.append(Integer.toHexString(System.identityHashCode(jVar)));
        sb2.append(",name=\"");
        sb2.append(jVar.f90659a);
        sb2.append(AbstractJsonLexerKt.STRING);
        HashSet hashSet = (HashSet) d0Var.f88562b;
        if (hashSet.contains(Integer.valueOf(System.identityHashCode(jVar)))) {
            sb2.append(",[...]");
        } else {
            hashSet.add(Integer.valueOf(System.identityHashCode(jVar)));
            sb2.append(",patterns=[");
            Iterator it = jVar.f90660b.iterator();
            boolean z11 = true;
            while (it.hasNext()) {
                u60.d dVar = (u60.d) it.next();
                if (z11) {
                    z11 = false;
                } else {
                    sb2.append(AbstractJsonLexerKt.COMMA);
                }
                A(sb2, d0Var, dVar);
            }
            sb2.append(AbstractJsonLexerKt.END_LIST);
        }
        sb2.append(AbstractJsonLexerKt.END_OBJ);
    }

    public static Set E(x80.u uVar) {
        int size = uVar.size();
        TreeSet treeSet = null;
        for (int i5 = 0; i5 < size; i5++) {
            if ("Vary".equalsIgnoreCase(uVar.c(i5))) {
                String strE = uVar.e(i5);
                if (treeSet == null) {
                    Intrinsics.g(StringCompanionObject.f71868a, "<this>");
                    Comparator CASE_INSENSITIVE_ORDER = String.CASE_INSENSITIVE_ORDER;
                    Intrinsics.f(CASE_INSENSITIVE_ORDER, "CASE_INSENSITIVE_ORDER");
                    treeSet = new TreeSet(CASE_INSENSITIVE_ORDER);
                }
                Iterator it = r70.k.h1(strE, new char[]{AbstractJsonLexerKt.COMMA}, 6).iterator();
                while (it.hasNext()) {
                    treeSet.add(r70.k.u1((String) it.next()).toString());
                }
            }
        }
        return treeSet == null ? EmptySet.f71734a : treeSet;
    }

    public static qh.b F(qh.b bVar) {
        return ((bVar instanceof qh.d) || (bVar instanceof qh.c)) ? bVar : bVar instanceof Serializable ? new qh.c(bVar) : new qh.d(bVar);
    }

    public static final y3.l a(long j11, long j12) {
        int i5 = (int) (j11 >> 32);
        int i11 = (int) (j11 & 4294967295L);
        return new y3.l(i5, i11, ((int) (j12 >> 32)) + i5, ((int) (j12 & 4294967295L)) + i11);
    }

    public static final t20.d b(Resources resources, String str, String str2) {
        if (str.length() == 0) {
            throw new IllegalArgumentException("name must not be empty");
        }
        t20.d dVar = new t20.d(resources);
        if (str2 == null) {
            str2 = str;
        }
        t20.c cVar = dVar.f88501a;
        cVar.f88489b = str;
        cVar.f88490c = str2;
        cVar.f88491d = 0.667f;
        return dVar;
    }

    public static final Uri d(String str, String str2) {
        Uri.Builder builderAppendQueryParameter = new Uri.Builder().scheme("letterTileDrawable").authority(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).path(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b).appendQueryParameter(PendingUpgradeStore.KEY_NAME, str);
        if (str2 != null) {
            builderAppendQueryParameter.appendQueryParameter("lookupKey", str2);
        }
        return builderAppendQueryParameter.build();
    }

    public static final void f(String str, Function2 function2, gy.n0 n0Var, List list, Function0 function0, Function1 function1, p1.o oVar, int i5) {
        int i11;
        int i12;
        Function2 function2D;
        p1.t tVar;
        p1.t tVar2 = (p1.t) oVar;
        tVar2.d0(-508736237);
        if ((i5 & 6) == 0) {
            i11 = (tVar2.f(str) ? 4 : 2) | i5;
        } else {
            i11 = i5;
        }
        if ((i5 & 48) == 0) {
            i11 |= 16;
        }
        if ((i5 & 384) == 0) {
            i11 |= (i5 & EventBridgeChannel.QUEUE_CAPACITY) == 0 ? tVar2.f(n0Var) : tVar2.h(n0Var) ? 256 : 128;
        }
        if ((i5 & 3072) == 0) {
            i11 |= tVar2.h(list) ? 2048 : 1024;
        }
        if ((i5 & 24576) == 0) {
            i11 |= tVar2.h(function0) ? ReaderJsonLexerKt.BATCH_SIZE : UserMetadata.MAX_INTERNAL_KEY_SIZE;
        }
        if ((196608 & i5) == 0) {
            i11 |= tVar2.h(function1) ? SQLiteDatabase.OPEN_SHAREDCACHE : SQLiteDatabase.OPEN_FULLMUTEX;
        }
        if ((74899 & i11) == 74898 && tVar2.E()) {
            tVar2.V();
            function2D = function2;
            tVar = tVar2;
        } else {
            tVar2.X();
            if ((i5 & 1) == 0 || tVar2.B()) {
                i12 = i11 & (-113);
                function2D = str != null ? x1.f.d(1302160332, new n00.v(str, 6), tVar2) : null;
            } else {
                tVar2.V();
                i12 = i11 & (-113);
                function2D = function2;
            }
            tVar2.q();
            tVar2.b0(-707684365);
            Object objP = tVar2.P();
            if (objP == p1.n.f81514a) {
                objP = androidx.compose.runtime.d.k(n0Var);
                tVar2.m0(objP);
            }
            e1 e1Var = (e1) objP;
            tVar2.p(false);
            tVar = tVar2;
            jy.k.a(function0, x1.f.d(-640611801, new j00.f(19, function1, e1Var), tVar2), null, x1.f.d(1117015337, new b10.i0(function0, 14), tVar2), function2D, null, 0L, 0.0f, 0L, 0L, 0L, null, x1.f.d(-412405760, new f00.y(list, e1Var, i12), tVar2), tVar, ((i12 >> 12) & 14) | 3120, 3072, 8148);
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new f2(str, function2D, n0Var, list, function0, function1, i5, 4);
        }
    }

    public static final void g(int i5, int i11) {
        if (i5 < 0 || i5 >= i11) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, i11, "index: ", ", size: "));
        }
    }

    public static final void h(int i5, int i11) {
        if (i5 < 0 || i5 > i11) {
            throw new IndexOutOfBoundsException(b.c0.g(i5, i11, "index: ", ", size: "));
        }
    }

    public static final void i(int i5, int i11, int i12) {
        if (i5 < 0 || i11 > i12) {
            StringBuilder sbT = b.c0.t(i5, "fromIndex: ", ", toIndex: ", i11, ", size: ");
            sbT.append(i12);
            throw new IndexOutOfBoundsException(sbT.toString());
        }
        if (i5 > i11) {
            throw new IllegalArgumentException(b.c0.g(i5, i11, "fromIndex: ", " > toIndex: "));
        }
    }

    public static final w0.c l(b3.n nVar) {
        w0.f fVar;
        v0.a aVar = new v0.a();
        t2.c.Q(nVar, z0.c.f97878a, new xu.k(new xu.k(aVar, 7), new ww.g0(1, aVar, v0.a.class, "addFilter", "addFilter$foundation_release(Lkotlin/jvm/functions/Function1;)V", 0, 8)));
        z.j0 j0Var = new z.j0();
        z.j0 j0Var2 = aVar.f91826a;
        Object[] objArr = j0Var2.f97840a;
        int i5 = j0Var2.f97841b;
        int i11 = 0;
        boolean z11 = true;
        w0.b bVar = null;
        while (true) {
            fVar = w0.f.f93425b;
            if (i11 >= i5) {
                break;
            }
            w0.b bVar2 = (w0.b) objArr[i11];
            if (!z11 || bVar2 != fVar) {
                if (bVar2 == fVar && bVar == fVar) {
                    z11 = false;
                    break;
                    break;
                }
                if (bVar2 != fVar) {
                    z.j0 j0Var3 = aVar.f91827b;
                    Object[] objArr2 = j0Var3.f97840a;
                    int i12 = j0Var3.f97841b;
                    for (int i13 = 0; i13 < i12; i13++) {
                        if (!((Boolean) ((Function1) objArr2[i13]).invoke(bVar2)).booleanValue()) {
                            z11 = false;
                            break;
                        }
                    }
                }
                j0Var.g(bVar2);
                z11 = false;
                bVar = bVar2;
            }
            i11++;
        }
        if (((w0.b) (j0Var.d() ? null : j0Var.f97840a[j0Var.f97841b - 1])) == fVar) {
            j0Var.k(j0Var.f97841b - 1);
        }
        z.i0 i0Var = j0Var.f97782c;
        if (i0Var == null) {
            i0Var = new z.i0(j0Var);
            j0Var.f97782c = i0Var;
        }
        return new w0.c(i0Var);
    }

    public static final String m(Throwable th2) {
        Intrinsics.g(th2, "<this>");
        return th2 instanceof StripeException ? ((StripeException) th2).getF44175g() : th2 instanceof IOException ? "ioException" : "unknown";
    }

    public static String p(String str, String str2) {
        Pattern pattern = tn.b.f89542a;
        String str3 = "<script type=\"text/javascript\">" + str + "</script>";
        x7.f.k(str2, "HTML is null or empty");
        ArrayList arrayList = new ArrayList();
        int length = str2.length();
        int i5 = 0;
        while (i5 < length) {
            int iIndexOf = str2.indexOf("<!--", i5);
            if (iIndexOf >= 0) {
                int iIndexOf2 = str2.indexOf("-->", iIndexOf);
                if (iIndexOf2 >= 0) {
                    arrayList.add(new int[]{iIndexOf, iIndexOf2});
                    i5 = iIndexOf2 + 3;
                } else {
                    arrayList.add(new int[]{iIndexOf, length});
                }
            }
            i5 = length;
        }
        int[][] iArr = (int[][]) arrayList.toArray((int[][]) Array.newInstance((Class<?>) Integer.TYPE, 0, 2));
        StringBuilder sb2 = new StringBuilder(str3.length() + str2.length() + 16);
        if (!tn.b.b(str2, sb2, tn.b.f89543b, str3, iArr) && !tn.b.a(str2, sb2, tn.b.f89542a, str3, iArr) && !tn.b.b(str2, sb2, tn.b.f89545d, str3, iArr) && !tn.b.a(str2, sb2, tn.b.f89544c, str3, iArr) && !tn.b.b(str2, sb2, tn.b.f89547f, str3, iArr) && !tn.b.a(str2, sb2, tn.b.f89546e, str3, iArr) && !tn.b.a(str2, sb2, tn.b.f89548g, str3, iArr)) {
            return str3.concat(str2);
        }
        return sb2.toString();
    }

    public static String q(x80.w url) {
        Intrinsics.g(url, "url");
        m90.j jVar = m90.j.f76130d;
        return lm.e.n(url.f95633i).b("MD5").d();
    }

    public static final ArrayList r(Map map, Function1 function1) {
        Intrinsics.g(map, "<this>");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry entry : map.entrySet()) {
            h hVar = (h) entry.getValue();
            Boolean boolValueOf = hVar != null ? Boolean.valueOf(hVar.f82174b) : null;
            Intrinsics.d(boolValueOf);
            if (!boolValueOf.booleanValue() && !hVar.f82175c) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        Set setKeySet = linkedHashMap.keySet();
        ArrayList arrayList = new ArrayList();
        for (Object obj : setKeySet) {
            if (((Boolean) function1.invoke((String) obj)).booleanValue()) {
                arrayList.add(obj);
            }
        }
        return arrayList;
    }

    public static int w(m90.d0 d0Var) throws IOException {
        try {
            long jB = d0Var.b();
            String strR = d0Var.r(Long.MAX_VALUE);
            if (jB >= 0 && jB <= 2147483647L && strR.length() <= 0) {
                return (int) jB;
            }
            throw new IOException("expected an int but was \"" + jB + strR + AbstractJsonLexerKt.STRING);
        } catch (NumberFormatException e3) {
            throw new IOException(e3.getMessage());
        }
    }

    public static final String x(ResolvableString resolvableString, p1.o oVar) {
        Intrinsics.g(resolvableString, "<this>");
        return resolvableString.T((Context) ((p1.t) oVar).j(AndroidCompositionLocals_androidKt.f14166b));
    }

    public static final y3.l y(h2.c cVar) {
        return new y3.l(Math.round(cVar.f59018a), Math.round(cVar.f59019b), Math.round(cVar.f59020c), Math.round(cVar.f59021d));
    }

    public static final h2.c z(y3.l lVar) {
        return new h2.c(lVar.f96607a, lVar.f96608b, lVar.f96609c, lVar.f96610d);
    }

    public abstract boolean D(int i5, View view);

    public abstract int j(int i5, View view);

    public abstract int k(int i5, View view);

    public int n(View view) {
        return 0;
    }

    public int o() {
        return 0;
    }

    public void s(int i5, View view) {
    }

    public abstract void t(int i5);

    public abstract void u(View view, int i5, int i11);

    public abstract void v(View view, float f11, float f12);
}
