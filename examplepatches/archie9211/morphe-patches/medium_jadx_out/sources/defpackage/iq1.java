package defpackage;

import android.app.Activity;
import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.text.Layout;
import android.util.Log;
import android.view.View;
import androidx.compose.ui.platform.ComposeView;
import androidx.constraintlayout.widget.ConstraintLayout;
import com.drew.metadata.exif.makernotes.SonyType1MakernoteDirectory;
import com.facebook.CurrentAccessTokenExpirationBroadcastReceiver;
import com.facebook.FacebookException;
import com.google.firebase.auth.FirebaseAuthRegistrar;
import com.medium.android.explore.ui.vAWg.OphtYB;
import j$.util.DesugarCollections;
import java.text.Bidi;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import org.json.JSONException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class iq1 implements ete, en6, x77, b29, zy1, vq6, dz1 {
    public static iq1 h;
    public static iq1 j;
    public static iq1 l;
    public final /* synthetic */ int a;
    public Object b;
    public Object c;
    public Object d;
    public Object e;
    public Object f;
    public static final zi5 g = new zi5(13);
    public static final y3b i = new y3b(10);
    public static final Object k = new Object();

    public iq1(mx mxVar, mkd mkdVar, List list, m73 m73Var, yy4 yy4Var) {
        int i2;
        String str;
        mkd mkdVar2;
        mx mxVar2 = mxVar;
        mkd mkdVar3 = mkdVar;
        this.a = 13;
        this.b = mxVar2;
        this.c = list;
        yw6 yw6Var = yw6.NONE;
        final int i3 = 0;
        this.d = vx0.d0(yw6Var, new m45(this) { // from class: g58
            public final /* synthetic */ iq1 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i4 = i3;
                Object obj = null;
                int i5 = 1;
                iq1 iq1Var = this.b;
                switch (i4) {
                    case 0:
                        ArrayList arrayList = (ArrayList) iq1Var.f;
                        if (!arrayList.isEmpty()) {
                            Object obj2 = arrayList.get(0);
                            float fH = ((a29) obj2).a.h();
                            int size = arrayList.size() - 1;
                            if (1 <= size) {
                                while (true) {
                                    Object obj3 = arrayList.get(i5);
                                    float fH2 = ((a29) obj3).a.h();
                                    if (Float.compare(fH, fH2) < 0) {
                                        obj2 = obj3;
                                        fH = fH2;
                                    }
                                    if (i5 != size) {
                                        i5++;
                                    }
                                }
                            }
                            obj = obj2;
                        }
                        a29 a29Var = (a29) obj;
                        return Float.valueOf(a29Var != null ? a29Var.a.h() : 0.0f);
                    default:
                        ArrayList arrayList2 = (ArrayList) iq1Var.f;
                        if (!arrayList2.isEmpty()) {
                            Object obj4 = arrayList2.get(0);
                            float fC = ((a29) obj4).a.i.c();
                            int size2 = arrayList2.size() - 1;
                            if (1 <= size2) {
                                while (true) {
                                    Object obj5 = arrayList2.get(i5);
                                    float fC2 = ((a29) obj5).a.i.c();
                                    if (Float.compare(fC, fC2) < 0) {
                                        obj4 = obj5;
                                        fC = fC2;
                                    }
                                    if (i5 != size2) {
                                        i5++;
                                    }
                                }
                            }
                            obj = obj4;
                        }
                        a29 a29Var2 = (a29) obj;
                        return Float.valueOf(a29Var2 != null ? a29Var2.a.i.c() : 0.0f);
                }
            }
        });
        final int i4 = 1;
        this.e = vx0.d0(yw6Var, new m45(this) { // from class: g58
            public final /* synthetic */ iq1 b;

            {
                this.b = this;
            }

            @Override // defpackage.m45
            public final Object invoke() {
                int i42 = i4;
                Object obj = null;
                int i5 = 1;
                iq1 iq1Var = this.b;
                switch (i42) {
                    case 0:
                        ArrayList arrayList = (ArrayList) iq1Var.f;
                        if (!arrayList.isEmpty()) {
                            Object obj2 = arrayList.get(0);
                            float fH = ((a29) obj2).a.h();
                            int size = arrayList.size() - 1;
                            if (1 <= size) {
                                while (true) {
                                    Object obj3 = arrayList.get(i5);
                                    float fH2 = ((a29) obj3).a.h();
                                    if (Float.compare(fH, fH2) < 0) {
                                        obj2 = obj3;
                                        fH = fH2;
                                    }
                                    if (i5 != size) {
                                        i5++;
                                    }
                                }
                            }
                            obj = obj2;
                        }
                        a29 a29Var = (a29) obj;
                        return Float.valueOf(a29Var != null ? a29Var.a.h() : 0.0f);
                    default:
                        ArrayList arrayList2 = (ArrayList) iq1Var.f;
                        if (!arrayList2.isEmpty()) {
                            Object obj4 = arrayList2.get(0);
                            float fC = ((a29) obj4).a.i.c();
                            int size2 = arrayList2.size() - 1;
                            if (1 <= size2) {
                                while (true) {
                                    Object obj5 = arrayList2.get(i5);
                                    float fC2 = ((a29) obj5).a.i.c();
                                    if (Float.compare(fC, fC2) < 0) {
                                        obj4 = obj5;
                                        fC = fC2;
                                    }
                                    if (i5 != size2) {
                                        i5++;
                                    }
                                }
                            }
                            obj = obj4;
                        }
                        a29 a29Var2 = (a29) obj;
                        return Float.valueOf(a29Var2 != null ? a29Var2.a.i.c() : 0.0f);
                }
            }
        });
        s29 s29Var = mkdVar3.b;
        mx mxVar3 = ox.a;
        ArrayList arrayList = mxVar2.d;
        String str2 = mxVar2.b;
        ey3 ey3Var = ey3.a;
        List listF1 = arrayList != null ? bu1.f1(arrayList, new js4(7)) : ey3Var;
        ArrayList arrayList2 = new ArrayList();
        m70 m70Var = new m70();
        int size = listF1.size();
        int i5 = 0;
        int i6 = 0;
        while (i5 < size) {
            lx lxVar = (lx) listF1.get(i5);
            lx lxVarA = lx.a(lxVar, s29Var.a((s29) lxVar.a), i3, 14);
            Object obj = lxVarA.a;
            int i7 = lxVarA.c;
            int i8 = lxVarA.b;
            while (i6 < i8 && !m70Var.isEmpty()) {
                lx lxVar2 = (lx) m70Var.last();
                List list2 = listF1;
                int i9 = lxVar2.c;
                ey3 ey3Var2 = ey3Var;
                Object obj2 = lxVar2.a;
                if (i8 < i9) {
                    arrayList2.add(new lx(i6, i8, obj2));
                    i6 = i8;
                    listF1 = list2;
                    ey3Var = ey3Var2;
                } else {
                    int i10 = size;
                    arrayList2.add(new lx(i6, i9, obj2));
                    i6 = lxVar2.c;
                    while (!m70Var.isEmpty() && i6 == ((lx) m70Var.last()).c) {
                        m70Var.removeLast();
                    }
                    listF1 = list2;
                    ey3Var = ey3Var2;
                    size = i10;
                }
            }
            List list3 = listF1;
            ey3 ey3Var3 = ey3Var;
            int i11 = size;
            if (i6 < i8) {
                arrayList2.add(new lx(i6, i8, s29Var));
                i6 = i8;
            }
            lx lxVar3 = (lx) m70Var.q();
            if (lxVar3 != null) {
                int i12 = lxVar3.c;
                Object obj3 = lxVar3.a;
                int i13 = lxVar3.b;
                if (i13 == i8 && i12 == i7) {
                    m70Var.removeLast();
                    m70Var.addLast(new lx(i8, i7, ((s29) obj3).a((s29) obj)));
                } else if (i13 == i12) {
                    arrayList2.add(new lx(i13, i12, obj3));
                    m70Var.removeLast();
                    m70Var.addLast(new lx(i8, i7, obj));
                } else {
                    if (i12 < i7) {
                        lg8.r();
                        throw null;
                    }
                    m70Var.addLast(new lx(i8, i7, ((s29) obj3).a((s29) obj)));
                }
            } else {
                m70Var.addLast(new lx(i8, i7, obj));
            }
            i5++;
            listF1 = list3;
            ey3Var = ey3Var3;
            size = i11;
            i3 = 0;
        }
        ey3 ey3Var4 = ey3Var;
        while (i6 <= str2.length() && !m70Var.isEmpty()) {
            lx lxVar4 = (lx) m70Var.last();
            Object obj4 = lxVar4.a;
            int i14 = lxVar4.c;
            arrayList2.add(new lx(i6, i14, obj4));
            while (!m70Var.isEmpty() && i14 == ((lx) m70Var.last()).c) {
                m70Var.removeLast();
            }
            i6 = i14;
        }
        if (i6 < str2.length()) {
            arrayList2.add(new lx(i6, str2.length(), s29Var));
        }
        if (arrayList2.isEmpty()) {
            arrayList2.add(new lx(0, 0, s29Var));
        }
        ArrayList arrayList3 = new ArrayList(arrayList2.size());
        int size2 = arrayList2.size();
        int i15 = 0;
        while (i15 < size2) {
            lx lxVar5 = (lx) arrayList2.get(i15);
            int i16 = lxVar5.b;
            int i17 = lxVar5.c;
            String strSubstring = i16 != i17 ? str2.substring(i16, i17) : "";
            List listA = ox.a(mxVar2, i16, i17, new nx(0));
            mx mxVar4 = new mx(strSubstring, listA == null ? ey3Var4 : listA);
            s29 s29Var2 = (s29) lxVar5.a;
            if (s29Var2.b == 0) {
                i2 = size2;
                str = str2;
                s29Var2 = new s29(s29Var2.a, s29Var.b, s29Var2.c, s29Var2.d, s29Var2.e, s29Var2.f, s29Var2.g, s29Var2.h, s29Var2.i);
            } else {
                i2 = size2;
                str = str2;
            }
            mkd mkdVar4 = new mkd(mkdVar3.a, s29Var.a(s29Var2));
            List list4 = mxVar4.a;
            List list5 = list4 == null ? ey3Var4 : list4;
            List list6 = (List) this.c;
            ArrayList arrayList4 = new ArrayList(list6.size());
            int size3 = list6.size();
            int i18 = 0;
            while (i18 < size3) {
                lx lxVar6 = (lx) list6.get(i18);
                int i19 = lxVar6.b;
                s29 s29Var3 = s29Var;
                int i20 = lxVar6.c;
                if (ox.b(i16, i17, i19, i20)) {
                    if (i16 > i19 || i20 > i17) {
                        c26.a("placeholder can not overlap with paragraph.");
                    }
                    mkdVar2 = mkdVar4;
                    arrayList4.add(new lx(i19 - i16, i20 - i16, lxVar6.a));
                } else {
                    mkdVar2 = mkdVar4;
                }
                i18++;
                mkdVar4 = mkdVar2;
                s29Var = s29Var3;
            }
            arrayList3.add(new a29(new ar(strSubstring, mkdVar4, list5, arrayList4, yy4Var, m73Var), i16, i17));
            i15++;
            mxVar2 = mxVar;
            mkdVar3 = mkdVar;
            str2 = str;
            size2 = i2;
        }
        this.f = arrayList3;
    }

    public static iq1 C(Context context) {
        iq1 iq1Var;
        synchronized (k) {
            try {
                iq1Var = l;
                if (iq1Var == null) {
                    iq1Var = new iq1(context.getApplicationContext());
                    l = iq1Var;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return iq1Var;
    }

    public float A(int i2, boolean z) {
        Layout layout = (Layout) this.b;
        int lineEnd = layout.getLineEnd(layout.getLineForOffset(i2));
        if (i2 > lineEnd) {
            i2 = lineEnd;
        }
        return z ? layout.getPrimaryHorizontal(i2) : layout.getSecondaryHorizontal(i2);
    }

    public float B(int i2, boolean z, boolean z2) {
        int i3;
        int i4;
        Layout layout = (Layout) this.b;
        if (!z2) {
            return A(i2, z);
        }
        int iU = w2g.u(layout, i2, z2);
        int lineStart = layout.getLineStart(iU);
        int lineEnd = layout.getLineEnd(iU);
        if (i2 != lineStart && i2 != lineEnd) {
            return A(i2, z);
        }
        if (i2 == 0 || i2 == layout.getText().length()) {
            return A(i2, z);
        }
        int iE = E(i2, z2);
        boolean z3 = layout.getParagraphDirection(layout.getLineForOffset(F(iE))) == -1;
        int iH = H(lineEnd, lineStart);
        int iF = F(iE);
        int i5 = lineStart - iF;
        int i6 = iH - iF;
        Bidi bidiW = w(iE);
        Bidi bidiCreateLineBidi = bidiW != null ? bidiW.createLineBidi(i5, i6) : null;
        if (bidiCreateLineBidi == null || bidiCreateLineBidi.getRunCount() == 1) {
            boolean zIsRtlCharAt = layout.isRtlCharAt(lineStart);
            if (z || z3 == zIsRtlCharAt) {
                z3 = !z3;
            }
            return i2 == lineStart ? z3 : !z3 ? layout.getLineLeft(iU) : layout.getLineRight(iU);
        }
        int runCount = bidiCreateLineBidi.getRunCount();
        kp6[] kp6VarArr = new kp6[runCount];
        for (int i7 = 0; i7 < runCount; i7++) {
            kp6VarArr[i7] = new kp6(bidiCreateLineBidi.getRunStart(i7) + lineStart, bidiCreateLineBidi.getRunLimit(i7) + lineStart, bidiCreateLineBidi.getRunLevel(i7) % 2 == 1);
        }
        int runCount2 = bidiCreateLineBidi.getRunCount();
        byte[] bArr = new byte[runCount2];
        for (int i8 = 0; i8 < runCount2; i8++) {
            bArr[i8] = (byte) bidiCreateLineBidi.getRunLevel(i8);
        }
        Bidi.reorderVisually(bArr, 0, kp6VarArr, 0, runCount);
        if (i2 == lineStart) {
            int i9 = 0;
            while (true) {
                if (i9 >= runCount) {
                    i4 = -1;
                    break;
                }
                if (kp6VarArr[i9].a == i2) {
                    i4 = i9;
                    break;
                }
                i9++;
            }
            boolean z4 = (z || z3 == kp6VarArr[i4].c) ? !z3 : z3;
            return (i4 == 0 && z4) ? layout.getLineLeft(iU) : (i4 != runCount - 1 || z4) ? z4 ? layout.getPrimaryHorizontal(kp6VarArr[i4 - 1].a) : layout.getPrimaryHorizontal(kp6VarArr[i4 + 1].a) : layout.getLineRight(iU);
        }
        int iH2 = i2 > iH ? H(i2, lineStart) : i2;
        int i10 = 0;
        while (true) {
            if (i10 >= runCount) {
                i3 = -1;
                break;
            }
            if (kp6VarArr[i10].b == iH2) {
                i3 = i10;
                break;
            }
            i10++;
        }
        boolean z5 = (z || z3 == kp6VarArr[i3].c) ? z3 : !z3;
        return (i3 == 0 && z5) ? layout.getLineLeft(iU) : (i3 != runCount - 1 || z5) ? z5 ? layout.getPrimaryHorizontal(kp6VarArr[i3 - 1].b) : layout.getPrimaryHorizontal(kp6VarArr[i3 + 1].b) : layout.getLineRight(iU);
    }

    public xpc D(String str, Object obj) {
        LinkedHashMap linkedHashMap = (LinkedHashMap) this.b;
        LinkedHashMap linkedHashMap2 = (LinkedHashMap) this.e;
        Object objJ = linkedHashMap2.get(str);
        if (objJ == null) {
            if (!linkedHashMap.containsKey(str)) {
                linkedHashMap.put(str, obj);
            }
            objJ = vv2.j(linkedHashMap.get(str));
            linkedHashMap2.put(str, objJ);
        }
        return (xpc) objJ;
    }

    public int E(int i2, boolean z) {
        ArrayList arrayList = (ArrayList) this.c;
        int iU = d46.u(arrayList, Integer.valueOf(i2));
        int i3 = iU < 0 ? -(iU + 1) : iU + 1;
        if (z && i3 > 0) {
            int i4 = i3 - 1;
            if (i2 == ((Number) arrayList.get(i4)).intValue()) {
                return i4;
            }
        }
        return i3;
    }

    public int F(int i2) {
        if (i2 == 0) {
            return 0;
        }
        return ((Number) ((ArrayList) this.c).get(i2 - 1)).intValue();
    }

    public void G(String str, String str2) {
        str2.getClass();
        ru ruVar = (ru) this.d;
        ruVar.getClass();
        iq7.J(str);
        iq7.K(str2, str);
        ruVar.i(str);
        iq7.B(ruVar, str, str2);
    }

    public int H(int i2, int i3) {
        while (i2 > i3) {
            char cCharAt = ((Layout) this.b).getText().charAt(i2 - 1);
            if (cCharAt != ' ' && cCharAt != '\n' && cCharAt != 5760 && ((g76.Q(cCharAt, 8192) < 0 || g76.Q(cCharAt, SonyType1MakernoteDirectory.TAG_HDR) > 0 || cCharAt == 8199) && cCharAt != 8287 && cCharAt != 12288)) {
                return i2;
            }
            i2--;
        }
        return i2;
    }

    public void I() {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            for (Activity activity : (Set) this.c) {
                if (activity != null) {
                    ((LinkedHashSet) this.d).add(new hq1(r40.E(activity), (Handler) this.b, (HashSet) this.e, activity.getClass().getSimpleName()));
                }
            }
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public void J(String str, sbb sbbVar) {
        str.getClass();
        if (str.length() <= 0) {
            ay0.e("method.isEmpty() == true");
            return;
        }
        if (sbbVar == null) {
            if (str.equals("POST") || str.equals("PUT") || str.equals("PATCH") || str.equals("PROPPATCH") || str.equals("QUERY") || str.equals("REPORT")) {
                ywb.g(ev6.x("method ", str, " must have a request body."));
                return;
            }
        } else if (!vv2.U(str)) {
            ywb.g(ev6.x("method ", str, " must not have a request body."));
            return;
        }
        this.c = str;
        this.e = sbbVar;
    }

    public void K() {
        w3 w3Var = (w3) this.d;
        if (w3Var == null) {
            return;
        }
        String str = w3Var.k;
        final int i2 = 0;
        final int i3 = 1;
        if (((AtomicBoolean) this.e).compareAndSet(false, true)) {
            this.f = new Date();
            HashSet hashSet = new HashSet();
            HashSet hashSet2 = new HashSet();
            HashSet hashSet3 = new HashSet();
            AtomicBoolean atomicBoolean = new AtomicBoolean(false);
            e4 e4Var = new e4();
            final z3 z3Var = new z3(atomicBoolean, hashSet, hashSet2, hashSet3, 0);
            final a4 a4Var = new a4(i2, e4Var);
            final b4 b4Var = new b4(e4Var, w3Var, atomicBoolean, hashSet, hashSet2, hashSet3, this);
            Bundle bundle = new Bundle();
            bundle.putString("fields", "permission,status");
            String str2 = ff5.j;
            ff5 ff5VarG0 = xz5.g0(w3Var, "me/permissions", z3Var);
            ff5VarG0.d = bundle;
            dt5 dt5Var = dt5.GET;
            ff5VarG0.k(dt5Var);
            f4 h1cVar = (str == null ? "facebook" : str).equals("instagram") ? new h1c(10) : new jzb();
            Bundle bundle2 = new Bundle();
            bundle2.putString("grant_type", h1cVar.v());
            bundle2.putString("client_id", w3Var.h);
            bundle2.putString("fields", "access_token,expires_at,expires_in,data_access_expiration_time,graph_domain");
            ff5 ff5VarG02 = xz5.g0(w3Var, h1cVar.Q(), a4Var);
            ff5VarG02.d = bundle2;
            ff5VarG02.k(dt5Var);
            if (g76.L(str, "gaming")) {
                final AtomicInteger atomicInteger = new AtomicInteger(0);
                bf5 bf5Var = new bf5() { // from class: c4
                    @Override // defpackage.bf5
                    public final void a(if5 if5Var) {
                        int i4 = i2;
                        b4 b4Var2 = b4Var;
                        AtomicInteger atomicInteger2 = atomicInteger;
                        bf5 bf5Var2 = z3Var;
                        switch (i4) {
                            case 0:
                                ((z3) bf5Var2).a(if5Var);
                                if (atomicInteger2.incrementAndGet() == 2) {
                                    b4Var2.run();
                                }
                                break;
                            default:
                                ((a4) bf5Var2).a(if5Var);
                                if (atomicInteger2.incrementAndGet() == 2) {
                                    b4Var2.run();
                                }
                                break;
                        }
                    }
                };
                bf5 bf5Var2 = new bf5() { // from class: c4
                    @Override // defpackage.bf5
                    public final void a(if5 if5Var) {
                        int i4 = i3;
                        b4 b4Var2 = b4Var;
                        AtomicInteger atomicInteger2 = atomicInteger;
                        bf5 bf5Var22 = a4Var;
                        switch (i4) {
                            case 0:
                                ((z3) bf5Var22).a(if5Var);
                                if (atomicInteger2.incrementAndGet() == 2) {
                                    b4Var2.run();
                                }
                                break;
                            default:
                                ((a4) bf5Var22).a(if5Var);
                                if (atomicInteger2.incrementAndGet() == 2) {
                                    b4Var2.run();
                                }
                                break;
                        }
                    }
                };
                ff5VarG0.j(bf5Var);
                ff5VarG02.j(bf5Var2);
                ff5VarG0.d();
                ff5VarG02.d();
                return;
            }
            hf5 hf5Var = new hf5(ff5VarG0, ff5VarG02);
            d4 d4Var = new d4(b4Var);
            ArrayList arrayList = hf5Var.d;
            if (!arrayList.contains(d4Var)) {
                arrayList.add(d4Var);
            }
            hk7.D(hf5Var);
            new gf5(hf5Var).executeOnExecutor(f94.c(), new Void[0]);
        }
    }

    public void L(BroadcastReceiver broadcastReceiver, IntentFilter intentFilter) {
        synchronized (((HashMap) this.f)) {
            try {
                w57 w57Var = new w57(broadcastReceiver, intentFilter);
                ArrayList arrayList = (ArrayList) ((HashMap) this.f).get(broadcastReceiver);
                if (arrayList == null) {
                    arrayList = new ArrayList(1);
                    ((HashMap) this.f).put(broadcastReceiver, arrayList);
                }
                arrayList.add(w57Var);
                for (int i2 = 0; i2 < intentFilter.countActions(); i2++) {
                    String action = intentFilter.getAction(i2);
                    ArrayList arrayList2 = (ArrayList) ((HashMap) this.c).get(action);
                    if (arrayList2 == null) {
                        arrayList2 = new ArrayList(1);
                        ((HashMap) this.c).put(action, arrayList2);
                    }
                    arrayList2.add(w57Var);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void M(Activity activity) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            if (Thread.currentThread() != Looper.getMainLooper().getThread()) {
                throw new FacebookException("Can't remove activity from CodelessMatcher on non-UI thread");
            }
            ((Set) this.c).remove(activity);
            ((LinkedHashSet) this.d).clear();
            HashMap map = (HashMap) this.f;
            Integer numValueOf = Integer.valueOf(activity.hashCode());
            Object objClone = ((HashSet) this.e).clone();
            objClone.getClass();
            map.put(numValueOf, (HashSet) objClone);
            ((HashSet) this.e).clear();
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    public void N(gj0 gj0Var, qsd qsdVar) {
        psd psdVar = (psd) this.f;
        kk0 kk0Var = (kk0) this.b;
        String str = (String) this.c;
        qrd qrdVar = (qrd) this.e;
        if (qrdVar == null) {
            z72.c("Null transformer");
            return;
        }
        wy3 wy3Var = (wy3) this.d;
        s13 s13Var = psdVar.c;
        kk0 kk0VarB = kk0Var.b(gj0Var.b);
        hj0 hj0Var = new hj0();
        hj0Var.i = new HashMap();
        hj0Var.g = Long.valueOf(psdVar.a.e());
        hj0Var.h = Long.valueOf(psdVar.b.e());
        hj0Var.b = str;
        hj0Var.f = new qy3(wy3Var, (byte[]) qrdVar.apply(gj0Var.a));
        hj0Var.d = null;
        ak0 ak0Var = gj0Var.c;
        if (ak0Var != null) {
            hj0Var.e = ak0Var.a;
        }
        s13Var.b.execute(new q13(s13Var, kk0VarB, qsdVar, hj0Var.b(), 0));
    }

    public boolean O(Intent intent) {
        ArrayList arrayList;
        synchronized (((HashMap) this.f)) {
            try {
                String action = intent.getAction();
                String strResolveTypeIfNeeded = intent.resolveTypeIfNeeded(((Context) this.b).getContentResolver());
                Uri data = intent.getData();
                String scheme = intent.getScheme();
                Set<String> categories = intent.getCategories();
                boolean z = (intent.getFlags() & 8) != 0;
                if (z) {
                    Log.v("LocalBroadcastManager", "Resolving type " + strResolveTypeIfNeeded + " scheme " + scheme + " of intent " + intent);
                }
                ArrayList arrayList2 = (ArrayList) ((HashMap) this.c).get(intent.getAction());
                if (arrayList2 != null) {
                    if (z) {
                        Log.v("LocalBroadcastManager", "Action list: " + arrayList2);
                    }
                    ArrayList arrayList3 = null;
                    int i2 = 0;
                    while (i2 < arrayList2.size()) {
                        w57 w57Var = (w57) arrayList2.get(i2);
                        if (z) {
                            Log.v("LocalBroadcastManager", "Matching against filter " + w57Var.a);
                        }
                        if (w57Var.c) {
                            if (z) {
                                Log.v("LocalBroadcastManager", "  Filter's target already added");
                            }
                            arrayList = arrayList2;
                        } else {
                            int iMatch = w57Var.a.match(action, strResolveTypeIfNeeded, scheme, data, categories, "LocalBroadcastManager");
                            if (iMatch >= 0) {
                                if (z) {
                                    StringBuilder sb = new StringBuilder();
                                    arrayList = arrayList2;
                                    sb.append("  Filter matched!  match=0x");
                                    sb.append(Integer.toHexString(iMatch));
                                    Log.v("LocalBroadcastManager", sb.toString());
                                } else {
                                    arrayList = arrayList2;
                                }
                                if (arrayList3 == null) {
                                    arrayList3 = new ArrayList();
                                }
                                arrayList3.add(w57Var);
                                w57Var.c = true;
                            } else {
                                arrayList = arrayList2;
                                if (z) {
                                    Log.v("LocalBroadcastManager", "  Filter did not match: " + (iMatch != -4 ? iMatch != -3 ? iMatch != -2 ? iMatch != -1 ? "unknown reason" : "type" : "data" : "action" : "category"));
                                }
                            }
                        }
                        i2++;
                        arrayList2 = arrayList;
                    }
                    if (arrayList3 != null) {
                        for (int i3 = 0; i3 < arrayList3.size(); i3++) {
                            ((w57) arrayList3.get(i3)).c = false;
                        }
                        ((ArrayList) this.d).add(new gg5(intent, 11, arrayList3));
                        if (!((xc) this.e).hasMessages(1)) {
                            ((xc) this.e).sendEmptyMessage(1);
                        }
                        return true;
                    }
                }
                return false;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void Q(String str, Object obj) {
        str.getClass();
        ((LinkedHashMap) this.b).put(str, obj);
        xpc xpcVar = (xpc) ((LinkedHashMap) this.d).get(str);
        if (xpcVar != null) {
            xpcVar.l(obj);
        }
        xpc xpcVar2 = (xpc) ((LinkedHashMap) this.e).get(str);
        if (xpcVar2 != null) {
            xpcVar2.l(obj);
        }
    }

    public void R(w3 w3Var, boolean z) {
        w3 w3Var2 = (w3) this.d;
        String str = w3Var2 != null ? w3Var2.i : null;
        String str2 = w3Var != null ? w3Var.i : null;
        if (str != null && !str.equals(str2)) {
            l40.d(xq4.EAGER_FLUSHING_EVENT);
        }
        this.d = w3Var;
        ((AtomicBoolean) this.e).set(false);
        this.f = new Date(0L);
        if (z) {
            SharedPreferences sharedPreferences = ((dsc) this.c).a;
            if (w3Var != null) {
                try {
                    sharedPreferences.edit().putString("com.facebook.AccessTokenManager.CachedAccessToken", w3Var.a().toString()).apply();
                } catch (JSONException unused) {
                }
            } else {
                sharedPreferences.edit().remove("com.facebook.AccessTokenManager.CachedAccessToken").apply();
                epe.c(f94.a());
            }
        }
        if (w3Var2 == null ? w3Var == null : w3Var2.equals(w3Var)) {
            return;
        }
        P(w3Var2, w3Var);
        Context contextA = f94.a();
        Date date = w3.l;
        w3 w3VarR = wgf.r();
        AlarmManager alarmManager = (AlarmManager) contextA.getSystemService("alarm");
        if (wgf.B()) {
            if ((w3VarR != null ? w3VarR.a : null) == null || alarmManager == null) {
                return;
            }
            Intent intent = new Intent(contextA, (Class<?>) CurrentAccessTokenExpirationBroadcastReceiver.class);
            intent.setAction("com.facebook.sdk.ACTION_CURRENT_ACCESS_TOKEN_CHANGED");
            try {
                alarmManager.set(1, w3VarR.a.getTime(), PendingIntent.getBroadcast(contextA, 0, intent, 67108864));
            } catch (Exception unused2) {
            }
        }
    }

    public Set S(Class cls) {
        return d(rqa.a(cls));
    }

    public void T(BroadcastReceiver broadcastReceiver) {
        synchronized (((HashMap) this.f)) {
            try {
                ArrayList arrayList = (ArrayList) ((HashMap) this.f).remove(broadcastReceiver);
                if (arrayList == null) {
                    return;
                }
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    w57 w57Var = (w57) arrayList.get(size);
                    w57Var.d = true;
                    for (int i2 = 0; i2 < w57Var.a.countActions(); i2++) {
                        String action = w57Var.a.getAction(i2);
                        ArrayList arrayList2 = (ArrayList) ((HashMap) this.c).get(action);
                        if (arrayList2 != null) {
                            for (int size2 = arrayList2.size() - 1; size2 >= 0; size2--) {
                                w57 w57Var2 = (w57) arrayList2.get(size2);
                                if (w57Var2.b == broadcastReceiver) {
                                    w57Var2.d = true;
                                    arrayList2.remove(size2);
                                }
                            }
                            if (arrayList2.size() <= 0) {
                                ((HashMap) this.c).remove(action);
                            }
                        }
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public void U(String str) {
        str.getClass();
        if (tuc.N(str, "ws:", true)) {
            str = "http:".concat(str.substring(3));
        } else if (tuc.N(str, "wss:", true)) {
            str = "https:".concat(str.substring(4));
        }
        pt5 pt5Var = new pt5();
        pt5Var.f(null, str);
        this.b = pt5Var.c();
    }

    @Override // defpackage.b29
    public boolean a() {
        ArrayList arrayList = (ArrayList) this.f;
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            if (((a29) arrayList.get(i2)).a.a()) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.en6
    public void b() {
        ((jz1) this.c).b();
        jz1 jz1Var = (jz1) this.d;
        ((HashMap) jz1Var.b).put((n98) this.e, new jy((yx) bu1.a1((ArrayList) this.f)));
    }

    @Override // defpackage.zy1
    public Object c(Class cls) {
        if (!((Set) this.c).contains(rqa.a(cls))) {
            lg8.n("Attempting to request an undeclared dependency ", cls, ".");
            return null;
        }
        Object objC = ((zy1) this.f).c(cls);
        if (!cls.equals(xoa.class)) {
            return objC;
        }
        return new sib();
    }

    @Override // defpackage.zy1
    public Set d(rqa rqaVar) {
        if (((Set) this.e).contains(rqaVar)) {
            return ((zy1) this.f).d(rqaVar);
        }
        lg8.n("Attempting to request an undeclared dependency Set<", rqaVar, ">.");
        return null;
    }

    @Override // defpackage.zy1
    public h8a e(Class cls) {
        return l(rqa.a(cls));
    }

    @Override // defpackage.dz1
    public Object f(iq1 iq1Var) {
        return FirebaseAuthRegistrar.lambda$getComponents$0((rqa) this.b, (rqa) this.c, (rqa) this.d, (rqa) this.e, (rqa) this.f, iq1Var);
    }

    @Override // defpackage.en6
    public void g(n98 n98Var, Object obj) {
        ((jz1) this.b).g(n98Var, obj);
    }

    @Override // defpackage.ete
    public View getRoot() {
        return (ConstraintLayout) this.b;
    }

    @Override // defpackage.vq6
    public Object getValue() {
        que queVar = (que) this.f;
        if (queVar != null) {
            return queVar;
        }
        vue vueVar = (vue) ((m45) this.c).invoke();
        uue uueVar = (uue) ((m45) this.d).invoke();
        qg2 qg2Var = (qg2) ((m45) this.e).invoke();
        vueVar.getClass();
        uueVar.getClass();
        qg2Var.getClass();
        o2b o2bVar = new o2b(vueVar, uueVar, qg2Var);
        wg6 wg6Var = (wg6) this.b;
        wg6Var.getClass();
        String strD = wg6Var.d();
        if (strD == null) {
            ay0.e("Local and anonymous classes can not be ViewModels");
            return null;
        }
        que queVarO = o2bVar.o(wg6Var, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strD));
        this.f = queVarO;
        return queVarO;
    }

    @Override // defpackage.b29
    public float h() {
        return ((Number) ((vq6) this.d).getValue()).floatValue();
    }

    @Override // defpackage.x77
    public void i(int i2, String str, Throwable th, LinkedHashMap linkedHashMap, HashSet hashSet) {
        l66 l66Var = (l66) this.d;
        str.getClass();
        if (i2 < -1) {
            return;
        }
        l66Var.g().getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        LinkedHashMap linkedHashMap2 = new LinkedHashMap();
        ysb feature = l66Var.getFeature("logs");
        if (feature != null) {
            linkedHashMap2.putAll(new LinkedHashMap(ei7.W(((ha7) feature.c).g)));
        }
        linkedHashMap2.putAll(linkedHashMap);
        if (((gg5) this.f).Y()) {
            if (feature != null) {
                String name = Thread.currentThread().getName();
                LinkedHashSet linkedHashSet = new LinkedHashSet();
                linkedHashSet.add("rum");
                linkedHashSet.add("tracing");
                feature.b(linkedHashSet, new fv2(this, i2, str, th, linkedHashMap2, hashSet, name, jCurrentTimeMillis));
            } else {
                f49.K(l66Var.e(), d66.WARN, e66.USER, ot2.o, null, false, 56);
            }
        }
        if (i2 >= 6) {
            ysb feature2 = l66Var.getFeature("rum");
            if (feature2 != null) {
                feature2.a(ei7.Q(new f09("type", "logger_error"), new f09("message", str), new f09("throwable", th), new f09("attributes", linkedHashMap2)));
            } else {
                f49.K(l66Var.e(), d66.INFO, e66.USER, ot2.p, null, false, 56);
            }
        }
    }

    @Override // defpackage.en6
    public void j(n98 n98Var, rn1 rn1Var) {
        ((jz1) this.b).j(n98Var, rn1Var);
    }

    @Override // defpackage.zy1
    public bw8 k(rqa rqaVar) {
        if (((Set) this.d).contains(rqaVar)) {
            return ((zy1) this.f).k(rqaVar);
        }
        lg8.n("Attempting to request an undeclared dependency Deferred<", rqaVar, ">.");
        return null;
    }

    @Override // defpackage.zy1
    public h8a l(rqa rqaVar) {
        if (((Set) this.b).contains(rqaVar)) {
            return ((zy1) this.f).l(rqaVar);
        }
        lg8.n("Attempting to request an undeclared dependency Provider<", rqaVar, ">.");
        return null;
    }

    @Override // defpackage.en6
    public fn6 m(n98 n98Var) {
        return ((jz1) this.b).m(n98Var);
    }

    @Override // defpackage.en6
    public void n(n98 n98Var, mn1 mn1Var, n98 n98Var2) {
        ((jz1) this.b).n(n98Var, mn1Var, n98Var2);
    }

    @Override // defpackage.zy1
    public Object o(rqa rqaVar) {
        if (((Set) this.c).contains(rqaVar)) {
            return ((zy1) this.f).o(rqaVar);
        }
        lg8.n("Attempting to request an undeclared dependency ", rqaVar, ".");
        return null;
    }

    @Override // defpackage.en6
    public en6 p(mn1 mn1Var, n98 n98Var) {
        return ((jz1) this.b).p(mn1Var, n98Var);
    }

    @Override // defpackage.b29
    public float q() {
        return ((Number) ((vq6) this.e).getValue()).floatValue();
    }

    public void r(bf4 bf4Var, wg6 wg6Var) {
        ((ArrayList) this.e).add(new n(bf4Var, 27, wg6Var));
    }

    public void s(bi7 bi7Var, wg6 wg6Var) {
        ((ArrayList) this.c).add(new f09(bi7Var, wg6Var));
    }

    public void t(Activity activity) {
        Set set = ec2.a;
        if (set.contains(this)) {
            return;
        }
        try {
            if (Thread.currentThread() != Looper.getMainLooper().getThread()) {
                throw new FacebookException("Can't add activity to CodelessMatcher on non-UI thread");
            }
            ((Set) this.c).add(activity);
            ((HashSet) this.e).clear();
            HashSet hashSet = (HashSet) ((HashMap) this.f).get(Integer.valueOf(activity.hashCode()));
            if (hashSet != null) {
                this.e = hashSet;
            }
            if (set.contains(this)) {
                return;
            }
            try {
                if (Thread.currentThread() == Looper.getMainLooper().getThread()) {
                    I();
                } else {
                    ((Handler) this.b).post(new v0(10, this));
                }
            } catch (Throwable th) {
                ec2.a(this, th);
            }
        } catch (Throwable th2) {
            ec2.a(this, th2);
        }
    }

    public String toString() {
        String str;
        switch (this.a) {
            case 11:
                StringBuilder sb = new StringBuilder("KmVersionRequirement(kind=");
                sm6 sm6Var = (sm6) this.b;
                if (sm6Var == null) {
                    g76.g0("kind");
                    throw null;
                }
                sb.append(sm6Var);
                sb.append(", level=");
                rm6 rm6Var = (rm6) this.c;
                if (rm6Var == null) {
                    g76.g0("level");
                    throw null;
                }
                sb.append(rm6Var);
                sb.append(", version=");
                qm6 qm6Var = (qm6) this.f;
                if (qm6Var == null) {
                    g76.g0("version");
                    throw null;
                }
                sb.append(qm6Var);
                sb.append(", errorCode=");
                sb.append((Integer) this.d);
                sb.append(", message=");
                return ev6.z(sb, (String) this.e, ')');
            case 18:
                String str2 = (String) this.f;
                StringBuilder sb2 = new StringBuilder("since ");
                sb2.append((jse) this.b);
                sb2.append(' ');
                sb2.append((b83) this.d);
                Integer num = (Integer) this.e;
                if (num != null) {
                    str = " error " + num.intValue();
                } else {
                    str = "";
                }
                sb2.append(str);
                sb2.append(str2 != null ? ": ".concat(str2) : "");
                return sb2.toString();
            default:
                return super.toString();
        }
    }

    public y51 u(ql0 ql0Var, m45 m45Var) {
        int i2;
        int i3;
        pya pyaVar = new pya();
        pyaVar.a = -1;
        synchronized (this.b) {
            Throwable th = (Throwable) this.c;
            if (th != null) {
                ql0Var.b(th);
                return dq1.d;
            }
            x90 x90Var = (x90) this.d;
            do {
                i2 = x90Var.get();
                i3 = i2 + 1;
            } while (!x90Var.compareAndSet(i2, i3));
            boolean z = true;
            if ((134217727 & i3) != 1) {
                z = false;
            }
            pyaVar.a = (i3 >>> 27) & 15;
            ((x68) this.e).a(ql0Var);
            if (z) {
                try {
                    m45Var.invoke();
                } catch (Throwable th2) {
                    x(th2);
                }
            }
            return new hx4(new le0(ql0Var, this, pyaVar, 3));
        }
    }

    public void v(String str, String str2) {
        str.getClass();
        str2.getClass();
        ((ru) this.d).c(str, str2);
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0076  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.text.Bidi w(int r15) {
        /*
            r14 = this;
            java.lang.Object r0 = r14.b
            android.text.Layout r0 = (android.text.Layout) r0
            java.lang.Object r1 = r14.c
            java.util.ArrayList r1 = (java.util.ArrayList) r1
            java.lang.Object r2 = r14.d
            java.util.ArrayList r2 = (java.util.ArrayList) r2
            java.lang.Object r3 = r14.e
            boolean[] r3 = (boolean[]) r3
            boolean r4 = r3[r15]
            if (r4 == 0) goto L1b
            java.lang.Object r14 = r2.get(r15)
            java.text.Bidi r14 = (java.text.Bidi) r14
            return r14
        L1b:
            r4 = 0
            if (r15 != 0) goto L20
            r5 = r4
            goto L2c
        L20:
            int r5 = r15 + (-1)
            java.lang.Object r5 = r1.get(r5)
            java.lang.Number r5 = (java.lang.Number) r5
            int r5 = r5.intValue()
        L2c:
            java.lang.Object r1 = r1.get(r15)
            java.lang.Number r1 = (java.lang.Number) r1
            int r1 = r1.intValue()
            int r11 = r1 - r5
            java.lang.Object r6 = r14.f
            char[] r6 = (char[]) r6
            if (r6 == 0) goto L44
            int r7 = r6.length
            if (r7 >= r11) goto L42
            goto L44
        L42:
            r7 = r6
            goto L47
        L44:
            char[] r6 = new char[r11]
            goto L42
        L47:
            java.lang.CharSequence r6 = r0.getText()
            android.text.TextUtils.getChars(r6, r5, r1, r7, r4)
            boolean r1 = java.text.Bidi.requiresBidi(r7, r4, r11)
            r5 = 0
            r13 = 1
            if (r1 == 0) goto L76
            int r1 = r14.F(r15)
            int r1 = r0.getLineForOffset(r1)
            int r0 = r0.getParagraphDirection(r1)
            r1 = -1
            if (r0 != r1) goto L67
            r12 = r13
            goto L68
        L67:
            r12 = r4
        L68:
            java.text.Bidi r6 = new java.text.Bidi
            r9 = 0
            r10 = 0
            r8 = 0
            r6.<init>(r7, r8, r9, r10, r11, r12)
            int r0 = r6.getRunCount()
            if (r0 != r13) goto L77
        L76:
            r6 = r5
        L77:
            r2.set(r15, r6)
            r3[r15] = r13
            if (r6 == 0) goto L87
            java.lang.Object r15 = r14.f
            char[] r15 = (char[]) r15
            if (r7 != r15) goto L86
            r7 = r5
            goto L87
        L86:
            r7 = r15
        L87:
            r14.f = r7
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.iq1.w(int):java.text.Bidi");
    }

    public void x(Throwable th) {
        int i2;
        synchronized (this.b) {
            try {
                if (((Throwable) this.c) != null) {
                    return;
                }
                this.c = th;
                x68 x68Var = (x68) this.e;
                Object[] objArr = x68Var.a;
                int i3 = x68Var.b;
                for (int i4 = 0; i4 < i3; i4++) {
                    ((ql0) objArr[i4]).b(th);
                }
                ((x68) this.e).d();
                x90 x90Var = (x90) this.d;
                do {
                    i2 = x90Var.get();
                } while (!x90Var.compareAndSet(i2, ((((i2 >>> 27) & 15) + 1) & 15) << 27));
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public void y(x45 x45Var) {
        int i2;
        synchronized (this.b) {
            try {
                x68 x68Var = (x68) this.e;
                this.e = (x68) this.f;
                this.f = x68Var;
                x90 x90Var = (x90) this.d;
                do {
                    i2 = x90Var.get();
                } while (!x90Var.compareAndSet(i2, ((((i2 >>> 27) & 15) + 1) & 15) << 27));
                int i3 = x68Var.b;
                for (int i4 = 0; i4 < i3; i4++) {
                    x45Var.invoke(x68Var.f(i4));
                }
                x68Var.d();
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    public bw8 z(Class cls) {
        return k(rqa.a(cls));
    }

    public void P(w3 w3Var, w3 w3Var2) {
        Intent intent = new Intent(f94.a(), (Class<?>) CurrentAccessTokenExpirationBroadcastReceiver.class);
        intent.setAction(OphtYB.TGaRamZxL);
        intent.putExtra("com.facebook.sdk.EXTRA_OLD_ACCESS_TOKEN", w3Var);
        intent.putExtra("com.facebook.sdk.EXTRA_NEW_ACCESS_TOKEN", w3Var2);
        ((iq1) this.b).O(intent);
    }

    public /* synthetic */ iq1(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i2) {
        this.a = i2;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
        this.f = obj5;
    }

    public /* synthetic */ iq1(boolean z) {
        this.a = 14;
    }

    public iq1(String str, ev2 ev2Var, l66 l66Var, ru2 ru2Var, gg5 gg5Var) {
        this.a = 8;
        str.getClass();
        this.b = str;
        this.c = ev2Var;
        this.d = l66Var;
        this.e = ru2Var;
        this.f = gg5Var;
    }

    public iq1(jse jseVar, d7a d7aVar, b83 b83Var, Integer num, String str) {
        this.a = 18;
        b83Var.getClass();
        this.b = jseVar;
        this.c = d7aVar;
        this.d = b83Var;
        this.e = num;
        this.f = str;
    }

    public iq1(Map map) {
        this.a = 16;
        map.getClass();
        this.b = new LinkedHashMap(map);
        this.c = new LinkedHashMap();
        this.d = new LinkedHashMap();
        this.e = new LinkedHashMap();
        this.f = new ny1(6, this);
    }

    public iq1(iq1 iq1Var, dsc dscVar) {
        this.a = 1;
        this.b = iq1Var;
        this.c = dscVar;
        this.e = new AtomicBoolean(false);
        this.f = new Date(0L);
    }

    public iq1(Layout layout) {
        this.a = 12;
        this.b = layout;
        ArrayList arrayList = new ArrayList();
        int length = 0;
        do {
            int iY = muc.Y(((Layout) this.b).getText(), '\n', length, 4);
            length = iY < 0 ? ((Layout) this.b).getText().length() : iY + 1;
            arrayList.add(Integer.valueOf(length));
        } while (length < ((Layout) this.b).getText().length());
        this.c = arrayList;
        int size = arrayList.size();
        ArrayList arrayList2 = new ArrayList(size);
        for (int i2 = 0; i2 < size; i2++) {
            arrayList2.add(null);
        }
        this.d = arrayList2;
        this.e = new boolean[((ArrayList) this.c).size()];
        ((ArrayList) this.c).size();
    }

    public iq1(wg6 wg6Var, m45 m45Var, m45 m45Var2, m45 m45Var3) {
        this.a = 19;
        wg6Var.getClass();
        this.b = wg6Var;
        this.c = m45Var;
        this.d = m45Var2;
        this.e = m45Var3;
    }

    public iq1(iy1 iy1Var, zy1 zy1Var) {
        this.a = 15;
        HashSet hashSet = new HashSet();
        HashSet hashSet2 = new HashSet();
        HashSet hashSet3 = new HashSet();
        HashSet hashSet4 = new HashSet();
        HashSet hashSet5 = new HashSet();
        Set<s73> set = iy1Var.c;
        Set set2 = iy1Var.g;
        for (s73 s73Var : set) {
            int i2 = s73Var.c;
            int i3 = s73Var.b;
            boolean z = i2 == 0;
            rqa rqaVar = s73Var.a;
            if (z) {
                if (i3 == 2) {
                    hashSet4.add(rqaVar);
                } else {
                    hashSet.add(rqaVar);
                }
            } else if (i2 == 2) {
                hashSet3.add(rqaVar);
            } else if (i3 == 2) {
                hashSet5.add(rqaVar);
            } else {
                hashSet2.add(rqaVar);
            }
        }
        if (!set2.isEmpty()) {
            hashSet.add(rqa.a(xoa.class));
        }
        this.c = DesugarCollections.unmodifiableSet(hashSet);
        this.b = DesugarCollections.unmodifiableSet(hashSet2);
        this.d = DesugarCollections.unmodifiableSet(hashSet3);
        this.e = DesugarCollections.unmodifiableSet(hashSet4);
        DesugarCollections.unmodifiableSet(hashSet5);
        this.f = zy1Var;
    }

    public iq1(int i2) {
        this.a = i2;
        switch (i2) {
            case 5:
                this.b = new Object();
                this.d = new x90(0);
                this.e = new x68();
                this.f = new x68();
                break;
            case 14:
                this.f = oy3.e;
                this.c = "GET";
                this.d = new ru(3);
                break;
            default:
                this.b = new Handler(Looper.getMainLooper());
                Set setNewSetFromMap = Collections.newSetFromMap(new WeakHashMap());
                setNewSetFromMap.getClass();
                this.c = setNewSetFromMap;
                this.d = new LinkedHashSet();
                this.e = new HashSet();
                this.f = new HashMap();
                break;
        }
    }

    public /* synthetic */ iq1(int i2, boolean z) {
        this.a = i2;
    }

    public iq1(ConstraintLayout constraintLayout, ComposeView composeView, ComposeView composeView2, ComposeView composeView3, ComposeView composeView4, ConstraintLayout constraintLayout2) {
        this.a = 3;
        this.b = constraintLayout;
        this.c = composeView;
        this.d = composeView2;
        this.e = composeView3;
        this.f = composeView4;
    }

    public iq1(Context context) {
        this.a = 2;
        this.f = new HashMap();
        this.c = new HashMap();
        this.d = new ArrayList();
        this.b = context;
        this.e = new xc(this, context.getMainLooper(), 1);
    }

    public iq1(gz1 gz1Var) {
        this.a = 7;
        this.b = bu1.n1(gz1Var.a);
        this.c = bu1.n1(gz1Var.b);
        this.d = bu1.n1(gz1Var.c);
        List list = (List) gz1Var.f.getValue();
        ArrayList arrayList = new ArrayList();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList.add(new l8(23, (f09) it2.next()));
        }
        this.e = arrayList;
        List list2 = (List) gz1Var.g.getValue();
        ArrayList arrayList2 = new ArrayList();
        Iterator it3 = list2.iterator();
        while (it3.hasNext()) {
            arrayList2.add(new fz1((jw2) it3.next(), 1));
        }
        this.f = arrayList2;
    }

    public iq1(jz1 jz1Var, jz1 jz1Var2, n98 n98Var, ArrayList arrayList) {
        this.a = 6;
        this.c = jz1Var;
        this.d = jz1Var2;
        this.e = n98Var;
        this.f = arrayList;
        this.b = jz1Var;
    }

    public iq1(cgd cgdVar) {
        this.a = 10;
        cgdVar.getClass();
        this.b = cgdVar;
        this.e = ns5.a;
        this.f = eo4.a;
    }
}
