package u3;

import android.graphics.Typeface;
import android.text.Layout;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.BackgroundColorSpan;
import android.text.style.LeadingMarginSpan;
import android.text.style.ScaleXSpan;
import b.c0;
import b3.h0;
import i2.r0;
import i2.t0;
import i2.u0;
import i2.x0;
import java.text.BreakIterator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.NoSuchElementException;
import java.util.PriorityQueue;
import k60.d;
import kotlin.Pair;
import kotlin.ULong;
import kotlin.Unit;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import m3.f0;
import m3.g0;
import m3.p0;
import m3.t;
import m3.u;
import m3.x;
import m3.z;
import mh.c;
import p3.j;
import p3.k;
import q3.b0;
import q3.o;
import q3.o0;
import q3.v;
import q3.w;
import u3.e;
import x3.l;
import x3.p;
import x3.q;
import x3.s;

/* loaded from: classes.dex */
public final class e implements t {

    /* renamed from: a, reason: collision with root package name */
    public final String f90521a;

    /* renamed from: b, reason: collision with root package name */
    public final p0 f90522b;

    /* renamed from: c, reason: collision with root package name */
    public final List f90523c;

    /* renamed from: d, reason: collision with root package name */
    public final List f90524d;

    /* renamed from: e, reason: collision with root package name */
    public final o f90525e;

    /* renamed from: f, reason: collision with root package name */
    public final y3.c f90526f;

    /* renamed from: g, reason: collision with root package name */
    public final g f90527g;

    /* renamed from: h, reason: collision with root package name */
    public final CharSequence f90528h;

    /* renamed from: i, reason: collision with root package name */
    public final n3.f f90529i;

    /* renamed from: j, reason: collision with root package name */
    public mh.c f90530j;

    /* renamed from: k, reason: collision with root package name */
    public final boolean f90531k;

    /* renamed from: l, reason: collision with root package name */
    public final int f90532l;

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0304  */
    /* JADX WARN: Removed duplicated region for block: B:193:0x03bb  */
    /* JADX WARN: Removed duplicated region for block: B:218:0x045d  */
    /* JADX WARN: Removed duplicated region for block: B:221:0x0472  */
    /* JADX WARN: Removed duplicated region for block: B:245:0x04b1  */
    /* JADX WARN: Removed duplicated region for block: B:251:0x04bc  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x04f7  */
    /* JADX WARN: Removed duplicated region for block: B:262:0x052e  */
    /* JADX WARN: Removed duplicated region for block: B:291:0x05d2  */
    /* JADX WARN: Removed duplicated region for block: B:300:0x05f2  */
    /* JADX WARN: Removed duplicated region for block: B:355:0x072b  */
    /* JADX WARN: Removed duplicated region for block: B:366:0x0754  */
    /* JADX WARN: Removed duplicated region for block: B:379:0x0798  */
    /* JADX WARN: Removed duplicated region for block: B:384:0x07b3 A[LOOP:5: B:383:0x07b1->B:384:0x07b3, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:387:0x07c8  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:6:0x004c  */
    /* JADX WARN: Type inference failed for: r1v6, types: [java.lang.CharSequence, java.lang.String] */
    /* JADX WARN: Type inference failed for: r3v12, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r3v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r3v5, types: [java.util.List] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public e(String str, p0 p0Var, List list, List list2, o oVar, y3.c cVar) {
        Locale locale;
        int i5;
        Object obj;
        Typeface typefaceE;
        long j11;
        Collection arrayList;
        long j12;
        int i11;
        q qVar;
        d dVar;
        ArrayList arrayList2;
        int size;
        int i12;
        Collection collection;
        g0 g0Var;
        ArrayList arrayList3;
        int i13;
        int i14;
        int size2;
        int i15;
        boolean z11;
        q qVar2;
        int size3;
        int i16;
        int size4;
        int i17;
        Spannable spannable;
        long j13;
        int i18;
        int i19;
        int i21;
        int i22;
        boolean z12;
        Spannable spannable2;
        int i23;
        u uVar;
        int i24;
        int i25;
        x xVar;
        this.f90521a = str;
        this.f90522b = p0Var;
        this.f90523c = list;
        this.f90524d = list2;
        this.f90525e = oVar;
        this.f90526f = cVar;
        float density = cVar.getDensity();
        g gVar = new g(1);
        ((TextPaint) gVar).density = density;
        gVar.f90536b = l.f95020b;
        gVar.f90537c = 3;
        gVar.f90538d = u0.f61170d;
        this.f90527g = gVar;
        z zVar = p0Var.f75958c;
        this.f90531k = false;
        u uVar2 = p0Var.f75957b;
        int i26 = uVar2.f75974b;
        g0 g0Var2 = p0Var.f75956a;
        t3.b bVar = g0Var2.f75893k;
        if (i26 != 4) {
            if (i26 != 5) {
                if (i26 == 1) {
                    i5 = 0;
                } else if (i26 == 2) {
                    i5 = 1;
                } else {
                    if (i26 != 3 && i26 != Integer.MIN_VALUE) {
                        throw new IllegalStateException("Invalid TextDirection.");
                    }
                    int layoutDirectionFromLocale = TextUtils.getLayoutDirectionFromLocale((bVar == null || (locale = bVar.c().f88509a) == null) ? Locale.getDefault() : locale);
                    i5 = (layoutDirectionFromLocale == 0 || layoutDirectionFromLocale != 1) ? 2 : 3;
                }
            }
        }
        this.f90532l = i5;
        d dVar2 = new d(this);
        s sVar = uVar2.f75981i;
        sVar = sVar == null ? s.f95033c : sVar;
        gVar.setFlags(sVar.f95036b ? gVar.getFlags() | 128 : gVar.getFlags() & (-129));
        int i27 = sVar.f95035a;
        if (i27 == 1) {
            gVar.setFlags(gVar.getFlags() | 64);
            gVar.setHinting(0);
        } else if (i27 == 2) {
            gVar.getFlags();
            gVar.setHinting(1);
        } else if (i27 == 3) {
            gVar.getFlags();
            gVar.setHinting(0);
        } else {
            gVar.getFlags();
        }
        int size5 = list.size();
        int i28 = 0;
        while (true) {
            if (i28 >= size5) {
                obj = null;
                break;
            }
            obj = list.get(i28);
            if (((m3.e) obj).f75852a instanceof g0) {
                break;
            } else {
                i28++;
            }
        }
        boolean z13 = obj != null;
        long j14 = g0Var2.f75884b;
        b0 b0Var = g0Var2.f75885c;
        v vVar = g0Var2.f75886d;
        String str2 = g0Var2.f75889g;
        t3.b bVar2 = g0Var2.f75893k;
        x3.o oVar2 = g0Var2.f75883a;
        p pVar = g0Var2.f75892j;
        long j15 = g0Var2.f75890h;
        long jB = y3.p.b(j14);
        if (y3.q.a(jB, 4294967296L)) {
            gVar.setTextSize(cVar.mo101toPxR2X_6o(j14));
        } else if (y3.q.a(jB, 8589934592L)) {
            gVar.setTextSize(y3.p.c(j14) * gVar.getTextSize());
        }
        q3.p pVar2 = g0Var2.f75888f;
        if (pVar2 != null || vVar != null || b0Var != null) {
            b0Var = b0Var == null ? b0.f83532f : b0Var;
            int i29 = vVar != null ? vVar.f83601a : 0;
            w wVar = g0Var2.f75887e;
            int i31 = wVar != null ? wVar.f83602a : 65535;
            e eVar = dVar2.f90520a;
            q3.p0 p0VarB = ((q3.q) eVar.f90525e).b(pVar2, b0Var, i29, i31);
            if (p0VarB instanceof o0) {
                Object obj2 = ((o0) p0VarB).f83584a;
                Intrinsics.e(obj2, "null cannot be cast to non-null type android.graphics.Typeface");
                typefaceE = (Typeface) obj2;
            } else {
                mh.c cVar2 = new mh.c(p0VarB, eVar.f90530j);
                eVar.f90530j = cVar2;
                typefaceE = cVar2.E();
            }
            gVar.setTypeface(typefaceE);
        }
        if (bVar2 != null) {
            t3.b bVar3 = t3.b.f88510c;
            if (!bVar2.equals(t3.c.f88513a.p())) {
                p50.i.v(gVar, bVar2);
            }
        }
        if (str2 != null && !str2.equals(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
            gVar.setFontFeatureSettings(str2);
        }
        if (pVar != null && !pVar.equals(p.f95026c)) {
            gVar.setTextScaleX(gVar.getTextScaleX() * pVar.f95027a);
            gVar.setTextSkewX(gVar.getTextSkewX() + pVar.f95028b);
        }
        gVar.d(oVar2.b());
        gVar.c(oVar2.c(), 9205357640488583168L, oVar2.a());
        gVar.f(g0Var2.n);
        gVar.g(g0Var2.f75895m);
        gVar.e(g0Var2.f75896p);
        if (!y3.q.a(y3.p.b(j15), 4294967296L) || y3.p.c(j15) == 0.0f) {
            j11 = j15;
            if (y3.q.a(y3.p.b(j11), 8589934592L)) {
                gVar.setLetterSpacing(y3.p.c(j11));
            }
        } else {
            float textScaleX = gVar.getTextScaleX() * gVar.getTextSize();
            j11 = j15;
            float fMo101toPxR2X_6o = cVar.mo101toPxR2X_6o(j11);
            if (textScaleX != 0.0f) {
                gVar.setLetterSpacing(fMo101toPxR2X_6o / textScaleX);
            }
        }
        long j16 = g0Var2.f75894l;
        x3.a aVar = g0Var2.f75891i;
        boolean z14 = z13 && y3.q.a(y3.p.b(j11), 4294967296L) && y3.p.c(j11) != 0.0f;
        long j17 = i2.s.f61147m;
        boolean z15 = (ULong.a(j16, j17) || ULong.a(j16, i2.s.f61146l)) ? false : true;
        boolean z16 = (aVar == null || Float.compare(aVar.f95001a, 0.0f) == 0) ? false : true;
        g0 g0Var3 = (z14 || z15 || z16) ? new g0(0L, 0L, (b0) null, (v) null, (w) null, (q3.p) null, (String) null, z14 ? j11 : y3.p.f96617c, z16 ? aVar : null, (p) null, (t3.b) null, z15 ? j16 : j17, (l) null, (u0) null, 63103) : null;
        if (g0Var3 != null) {
            int size6 = this.f90523c.size() + 1;
            arrayList = new ArrayList(size6);
            int i32 = 0;
            while (i32 < size6) {
                arrayList.add(i32 == 0 ? new m3.e(g0Var3, 0, this.f90521a.length()) : (m3.e) this.f90523c.get(i32 - 1));
                i32++;
            }
        } else {
            arrayList = this.f90523c;
        }
        ?? r12 = this.f90521a;
        float textSize = this.f90527g.getTextSize();
        p0 p0Var2 = this.f90522b;
        List list3 = this.f90524d;
        y3.c cVar3 = this.f90526f;
        b bVar4 = c.f90519a;
        if (arrayList.isEmpty() && list3.isEmpty() && Intrinsics.b(p0Var2.f75957b.f75976d, q.f95029c)) {
            spannable = r12;
            if ((p0Var2.f75957b.f75975c & 1095216660480L) != 0) {
            }
        } else {
            final Spannable spannableString = r12 instanceof Spannable ? (Spannable) r12 : new SpannableString(r12);
            g0 g0Var4 = p0Var2.f75956a;
            u uVar3 = p0Var2.f75957b;
            if (Intrinsics.b(g0Var4.f75895m, l.f95021c)) {
                j12 = 0;
                spannableString.setSpan(c.f90519a, 0, r12.length(), 33);
            } else {
                j12 = 0;
            }
            z zVar2 = p0Var2.f75958c;
            if (((zVar2 == null || (xVar = zVar2.f75991b) == null) ? false : xVar.f75988a) && uVar3.f75978f == null) {
                float fA = v3.b.a(uVar3.f75975c, textSize, cVar3);
                if (!Float.isNaN(fA)) {
                    spannableString.setSpan(new p3.f(fA), 0, spannableString.length(), 33);
                }
            } else {
                x3.i iVar = uVar3.f75978f;
                iVar = iVar == null ? x3.i.f95013c : iVar;
                float fA2 = v3.b.a(uVar3.f75975c, textSize, cVar3);
                if (!Float.isNaN(fA2)) {
                    int length = (spannableString.length() == 0 || r70.l.F1(spannableString) == '\n') ? spannableString.length() + 1 : spannableString.length();
                    int i33 = iVar.f95015b;
                    i11 = 0;
                    spannableString.setSpan(new p3.g(fA2, length, (i33 & 1) > 0, (i33 & 16) > 0, iVar.f95014a, false), 0, spannableString.length(), 33);
                }
                qVar = uVar3.f75976d;
                if (qVar == null) {
                    int i34 = i11;
                    long j18 = qVar.f95030a;
                    long j19 = qVar.f95031b;
                    if ((y3.p.a(j18, w20.h.j(i34)) && y3.p.a(j19, w20.h.j(i34))) || (j18 & 1095216660480L) == j12 || (j19 & 1095216660480L) == j12) {
                        dVar = dVar2;
                    } else {
                        long jB2 = y3.p.b(j18);
                        dVar = dVar2;
                        float fMo101toPxR2X_6o2 = y3.q.a(jB2, 4294967296L) ? cVar3.mo101toPxR2X_6o(j18) : y3.q.a(jB2, 8589934592L) ? y3.p.c(j18) * textSize : 0.0f;
                        long jB3 = y3.p.b(j19);
                        spannableString.setSpan(new LeadingMarginSpan.Standard((int) Math.ceil(fMo101toPxR2X_6o2), (int) Math.ceil(y3.q.a(jB3, 4294967296L) ? cVar3.mo101toPxR2X_6o(j19) : y3.q.a(jB3, 8589934592L) ? y3.p.c(j19) * textSize : 0.0f)), 0, spannableString.length(), 33);
                    }
                } else {
                    dVar = dVar2;
                }
                arrayList2 = new ArrayList(arrayList.size());
                Collection collection2 = arrayList;
                size = collection2.size();
                for (i12 = 0; i12 < size; i12++) {
                    m3.e eVar2 = (m3.e) arrayList.get(i12);
                    Object obj3 = eVar2.f75852a;
                    if (obj3 instanceof g0) {
                        g0 g0Var5 = (g0) obj3;
                        if (((g0Var5.f75888f == null && g0Var5.f75886d == null && g0Var5.f75885c == null) ? false : true) || ((g0) obj3).f75887e != null) {
                            arrayList2.add(eVar2);
                        }
                    }
                }
                g0 g0Var6 = p0Var2.f75956a;
                q3.p pVar3 = g0Var6.f75888f;
                g0 g0Var7 = ((pVar3 == null || g0Var6.f75886d != null || g0Var6.f75885c != null) && g0Var6.f75887e == null) ? null : new g0(0L, 0L, g0Var6.f75885c, g0Var6.f75886d, g0Var6.f75887e, pVar3, (String) null, 0L, (x3.a) null, (p) null, (t3.b) null, 0L, (l) null, (u0) null, 65475);
                final d dVar3 = dVar;
                Function3 function3 = new Function3() { // from class: v3.a
                    @Override // kotlin.jvm.functions.Function3
                    public final Object invoke(Object obj4, Object obj5, Object obj6) {
                        Typeface typefaceE2;
                        g0 g0Var8 = (g0) obj4;
                        int iIntValue = ((Integer) obj5).intValue();
                        int iIntValue2 = ((Integer) obj6).intValue();
                        q3.p pVar4 = g0Var8.f75888f;
                        b0 b0Var2 = g0Var8.f75885c;
                        if (b0Var2 == null) {
                            b0Var2 = b0.f83532f;
                        }
                        v vVar2 = g0Var8.f75886d;
                        int i35 = vVar2 != null ? vVar2.f83601a : 0;
                        w wVar2 = g0Var8.f75887e;
                        int i36 = wVar2 != null ? wVar2.f83602a : 65535;
                        e eVar3 = dVar3.f90520a;
                        q3.p0 p0VarB2 = ((q3.q) eVar3.f90525e).b(pVar4, b0Var2, i35, i36);
                        if (p0VarB2 instanceof o0) {
                            Object obj7 = ((o0) p0VarB2).f83584a;
                            Intrinsics.e(obj7, "null cannot be cast to non-null type android.graphics.Typeface");
                            typefaceE2 = (Typeface) obj7;
                        } else {
                            c cVar4 = new c(p0VarB2, eVar3.f90530j);
                            eVar3.f90530j = cVar4;
                            typefaceE2 = cVar4.E();
                        }
                        spannableString.setSpan(new d(typefaceE2, 2), iIntValue, iIntValue2, 33);
                        return Unit.f71706a;
                    }
                };
                if (arrayList2.size() > 1) {
                    if (!arrayList2.isEmpty()) {
                        g0 g0Var8 = (g0) ((m3.e) arrayList2.get(0)).f75852a;
                        function3.invoke(g0Var7 != null ? g0Var7.c(g0Var8) : g0Var8, Integer.valueOf(((m3.e) arrayList2.get(0)).f75853b), Integer.valueOf(((m3.e) arrayList2.get(0)).f75854c));
                    }
                    collection = collection2;
                } else {
                    int size7 = arrayList2.size();
                    int i35 = size7 * 2;
                    int[] iArr = new int[i35];
                    int size8 = arrayList2.size();
                    int i36 = 0;
                    while (i36 < size8) {
                        m3.e eVar3 = (m3.e) arrayList2.get(i36);
                        iArr[i36] = eVar3.f75853b;
                        iArr[i36 + size7] = eVar3.f75854c;
                        i36++;
                        collection2 = collection2;
                    }
                    collection = collection2;
                    if (i35 > 1) {
                        Arrays.sort(iArr);
                    }
                    int iW0 = kotlin.collections.c.w0(iArr);
                    int i37 = 0;
                    while (i37 < i35) {
                        int i38 = iArr[i37];
                        if (i38 == iW0) {
                            arrayList3 = arrayList2;
                            g0Var = g0Var7;
                            i13 = i37;
                            i14 = i35;
                        } else {
                            int size9 = arrayList2.size();
                            g0Var = g0Var7;
                            int i39 = 0;
                            while (i39 < size9) {
                                ArrayList arrayList4 = arrayList2;
                                m3.e eVar4 = (m3.e) arrayList2.get(i39);
                                int i40 = i37;
                                int i41 = eVar4.f75853b;
                                int i42 = i35;
                                int i43 = eVar4.f75854c;
                                if (i41 != i43 && m3.h.b(iW0, i38, i41, i43)) {
                                    g0 g0Var9 = (g0) eVar4.f75852a;
                                    g0Var7 = g0Var7 != null ? g0Var7.c(g0Var9) : g0Var9;
                                }
                                i39++;
                                i37 = i40;
                                arrayList2 = arrayList4;
                                i35 = i42;
                            }
                            arrayList3 = arrayList2;
                            i13 = i37;
                            i14 = i35;
                            if (g0Var7 != null) {
                                function3.invoke(g0Var7, Integer.valueOf(iW0), Integer.valueOf(i38));
                            }
                            iW0 = i38;
                        }
                        i37 = i13 + 1;
                        g0Var7 = g0Var;
                        arrayList2 = arrayList3;
                        i35 = i14;
                    }
                }
                size2 = collection.size();
                boolean z17 = false;
                i15 = 0;
                while (i15 < size2) {
                    m3.e eVar5 = (m3.e) arrayList.get(i15);
                    Object obj4 = eVar5.f75852a;
                    if (obj4 instanceof g0) {
                        int i44 = eVar5.f75853b;
                        int i45 = eVar5.f75854c;
                        if (i44 < 0 || i44 >= spannableString.length() || i45 <= i44 || i45 > spannableString.length()) {
                            i22 = size2;
                            z12 = z17;
                            spannable2 = spannableString;
                            i23 = i15;
                            uVar = uVar3;
                        } else {
                            g0 g0Var10 = (g0) obj4;
                            long j21 = g0Var10.f75890h;
                            x3.a aVar2 = g0Var10.f75891i;
                            x3.o oVar3 = g0Var10.f75883a;
                            if (aVar2 != null) {
                                i22 = size2;
                                spannableString.setSpan(new p3.a(aVar2.f95001a), i44, i45, 33);
                            } else {
                                i22 = size2;
                            }
                            boolean z18 = z17;
                            v3.b.b(spannableString, oVar3.b(), i44, i45);
                            i2.p pVarC = oVar3.c();
                            float fA3 = oVar3.a();
                            if (pVarC != null) {
                                if (pVarC instanceof x0) {
                                    v3.b.b(spannableString, ((x0) pVarC).f61189a, i44, i45);
                                } else {
                                    spannableString.setSpan(new w3.b((t0) pVarC, fA3), i44, i45, 33);
                                }
                            }
                            l lVar = g0Var10.f75895m;
                            if (lVar != null) {
                                int i46 = lVar.f95023a;
                                z12 = z18;
                                p3.l lVar2 = new p3.l((i46 | 1) == i46, (i46 | 2) == i46);
                                i24 = 33;
                                spannableString.setSpan(lVar2, i44, i45, 33);
                            } else {
                                z12 = z18;
                                i24 = 33;
                            }
                            uVar = uVar3;
                            spannable2 = spannableString;
                            v3.b.c(spannable2, g0Var10.f75884b, cVar3, i44, i45);
                            String str3 = g0Var10.f75889g;
                            if (str3 != null) {
                                spannable2.setSpan(new k60.d(str3, 1), i44, i45, i24);
                            }
                            p pVar4 = g0Var10.f75892j;
                            if (pVar4 != null) {
                                spannable2.setSpan(new ScaleXSpan(pVar4.f95027a), i44, i45, i24);
                                spannable2.setSpan(new k(pVar4.f95028b), i44, i45, i24);
                            }
                            t3.b bVar5 = g0Var10.f75893k;
                            if (bVar5 != null) {
                                spannable2.setSpan(p50.i.u(bVar5), i44, i45, i24);
                            }
                            long j22 = g0Var10.f75894l;
                            if (j22 != 16) {
                                spannable2.setSpan(new BackgroundColorSpan(r0.r(j22)), i44, i45, i24);
                            }
                            u0 u0Var = g0Var10.n;
                            if (u0Var != null) {
                                long j23 = u0Var.f61172b;
                                int iR = r0.r(u0Var.f61171a);
                                i23 = i15;
                                float fIntBitsToFloat = Float.intBitsToFloat((int) (j23 >> 32));
                                float fIntBitsToFloat2 = Float.intBitsToFloat((int) (j23 & 4294967295L));
                                float f11 = u0Var.f61173c;
                                j jVar = new j(fIntBitsToFloat, fIntBitsToFloat2, f11 == 0.0f ? Float.MIN_VALUE : f11, iR);
                                i25 = 33;
                                spannable2.setSpan(jVar, i44, i45, 33);
                            } else {
                                i23 = i15;
                                i25 = 33;
                            }
                            k2.g gVar2 = g0Var10.f75896p;
                            if (gVar2 != null) {
                                spannable2.setSpan(new w3.a(gVar2), i44, i45, i25);
                            }
                            if (y3.q.a(y3.p.b(j21), 4294967296L) || y3.q.a(y3.p.b(j21), 8589934592L)) {
                                z12 = true;
                            }
                        }
                    }
                    i15 = i23 + 1;
                    uVar3 = uVar;
                    spannableString = spannable2;
                    size2 = i22;
                    z17 = z12;
                }
                z11 = z17;
                Spannable spannable3 = spannableString;
                u uVar4 = uVar3;
                if (z11) {
                    int size10 = collection.size();
                    int i47 = 0;
                    while (i47 < size10) {
                        m3.e eVar6 = (m3.e) arrayList.get(i47);
                        m3.b bVar6 = (m3.b) eVar6.f75852a;
                        if (bVar6 instanceof g0) {
                            int i48 = eVar6.f75853b;
                            int i49 = eVar6.f75854c;
                            if (i48 < 0 || i48 >= spannable3.length() || i49 <= i48 || i49 > spannable3.length()) {
                                i21 = i47;
                            } else {
                                long j24 = ((g0) bVar6).f75890h;
                                long jB4 = y3.p.b(j24);
                                i21 = i47;
                                Object eVar7 = y3.q.a(jB4, 4294967296L) ? new p3.e(cVar3.mo101toPxR2X_6o(j24)) : y3.q.a(jB4, 8589934592L) ? new p3.d(y3.p.c(j24)) : null;
                                if (eVar7 != null) {
                                    spannable3.setSpan(eVar7, i48, i49, 33);
                                }
                            }
                        }
                        i47 = i21 + 1;
                    }
                }
                qVar2 = uVar4.f75976d;
                if (qVar2 != null) {
                    long j25 = qVar2.f95030a;
                    if (y3.q.a(y3.p.b(j25), 4294967296L)) {
                        cVar3.mo101toPxR2X_6o(j25);
                    }
                }
                size3 = collection.size();
                for (i16 = 0; i16 < size3; i16++) {
                    Object obj5 = ((m3.e) arrayList.get(i16)).f75852a;
                }
                size4 = list3.size();
                for (i17 = 0; i17 < size4; i17++) {
                    m3.e eVar8 = (m3.e) list3.get(i17);
                    m3.w wVar2 = (m3.w) eVar8.f75852a;
                    int i51 = eVar8.f75853b;
                    int i52 = eVar8.f75854c;
                    for (Object obj6 : spannable3.getSpans(i51, i52, a6.b.class)) {
                        c0.y(obj6);
                        spannable3.removeSpan(null);
                    }
                    float fC = y3.p.c(wVar2.c());
                    long jB5 = y3.p.b(wVar2.c());
                    if (y3.q.a(jB5, 4294967296L)) {
                        j13 = 8589934592L;
                        i18 = 0;
                    } else {
                        j13 = 8589934592L;
                        i18 = y3.q.a(jB5, 8589934592L) ? 1 : 2;
                    }
                    float fC2 = y3.p.c(wVar2.a());
                    long jB6 = y3.p.b(wVar2.a());
                    int i53 = y3.q.a(jB6, 4294967296L) ? 0 : y3.q.a(jB6, j13) ? 1 : 2;
                    float density2 = cVar3.getDensity() * cVar3.getFontScale();
                    int iB = wVar2.b();
                    if (f0.a(iB, 1)) {
                        i19 = 0;
                    } else if (f0.a(iB, 2)) {
                        i19 = 1;
                    } else if (f0.a(iB, 3)) {
                        i19 = 2;
                    } else if (f0.a(iB, 4)) {
                        i19 = 3;
                    } else if (f0.a(iB, 5)) {
                        i19 = 4;
                    } else if (f0.a(iB, 6)) {
                        i19 = 5;
                    } else {
                        if (!f0.a(iB, 7)) {
                            throw new IllegalStateException("Invalid PlaceholderVerticalAlign");
                        }
                        i19 = 6;
                    }
                    spannable3.setSpan(new p3.h(i18, i53, fC, fC2, i19, density2), i51, i52, 33);
                }
                spannable = spannable3;
            }
            i11 = 0;
            qVar = uVar3.f75976d;
            if (qVar == null) {
            }
            arrayList2 = new ArrayList(arrayList.size());
            Collection collection22 = arrayList;
            size = collection22.size();
            while (i12 < size) {
            }
            g0 g0Var62 = p0Var2.f75956a;
            q3.p pVar32 = g0Var62.f75888f;
            if (pVar32 == null) {
                if (pVar32 == null || g0Var62.f75886d != null || g0Var62.f75885c != null) {
                    final d dVar32 = dVar;
                    Function3 function32 = new Function3() { // from class: v3.a
                        @Override // kotlin.jvm.functions.Function3
                        public final Object invoke(Object obj42, Object obj52, Object obj62) {
                            Typeface typefaceE2;
                            g0 g0Var82 = (g0) obj42;
                            int iIntValue = ((Integer) obj52).intValue();
                            int iIntValue2 = ((Integer) obj62).intValue();
                            q3.p pVar42 = g0Var82.f75888f;
                            b0 b0Var2 = g0Var82.f75885c;
                            if (b0Var2 == null) {
                                b0Var2 = b0.f83532f;
                            }
                            v vVar2 = g0Var82.f75886d;
                            int i352 = vVar2 != null ? vVar2.f83601a : 0;
                            w wVar22 = g0Var82.f75887e;
                            int i362 = wVar22 != null ? wVar22.f83602a : 65535;
                            e eVar32 = dVar32.f90520a;
                            q3.p0 p0VarB2 = ((q3.q) eVar32.f90525e).b(pVar42, b0Var2, i352, i362);
                            if (p0VarB2 instanceof o0) {
                                Object obj7 = ((o0) p0VarB2).f83584a;
                                Intrinsics.e(obj7, "null cannot be cast to non-null type android.graphics.Typeface");
                                typefaceE2 = (Typeface) obj7;
                            } else {
                                c cVar4 = new c(p0VarB2, eVar32.f90530j);
                                eVar32.f90530j = cVar4;
                                typefaceE2 = cVar4.E();
                            }
                            spannableString.setSpan(new d(typefaceE2, 2), iIntValue, iIntValue2, 33);
                            return Unit.f71706a;
                        }
                    };
                    if (arrayList2.size() > 1) {
                    }
                    size2 = collection.size();
                    boolean z172 = false;
                    i15 = 0;
                    while (i15 < size2) {
                    }
                    z11 = z172;
                    Spannable spannable32 = spannableString;
                    u uVar42 = uVar3;
                    if (z11) {
                    }
                    qVar2 = uVar42.f75976d;
                    if (qVar2 != null) {
                    }
                    size3 = collection.size();
                    while (i16 < size3) {
                    }
                    size4 = list3.size();
                    while (i17 < size4) {
                    }
                    spannable = spannable32;
                }
            }
        }
        this.f90528h = spannable;
        this.f90529i = new n3.f(spannable, this.f90527g, this.f90532l);
    }

    @Override // m3.t
    public final boolean a() {
        mh.c cVar = this.f90530j;
        if (cVar != null ? cVar.H() : false) {
            return true;
        }
        if (!this.f90531k) {
            z zVar = this.f90522b.f75958c;
        }
        return false;
    }

    @Override // m3.t
    public final float b() {
        return this.f90529i.c();
    }

    @Override // m3.t
    public final float c() {
        float f11;
        n3.f fVar = this.f90529i;
        float f12 = fVar.f77752e;
        TextPaint textPaint = fVar.f77749b;
        if (!Float.isNaN(f12)) {
            return fVar.f77752e;
        }
        BreakIterator lineInstance = BreakIterator.getLineInstance(textPaint.getTextLocale());
        CharSequence charSequence = fVar.f77748a;
        lineInstance.setText(new n3.c(charSequence.length(), charSequence));
        PriorityQueue priorityQueue = new PriorityQueue(10, new h0(7));
        int i5 = 0;
        for (int next = lineInstance.next(); next != -1; next = lineInstance.next()) {
            if (priorityQueue.size() < 10) {
                priorityQueue.add(new Pair(Integer.valueOf(i5), Integer.valueOf(next)));
            } else {
                Pair pair = (Pair) priorityQueue.peek();
                if (pair != null && ((Number) pair.f71684b).intValue() - ((Number) pair.f71683a).intValue() < next - i5) {
                    priorityQueue.poll();
                    priorityQueue.add(new Pair(Integer.valueOf(i5), Integer.valueOf(next)));
                }
            }
            i5 = next;
        }
        if (priorityQueue.isEmpty()) {
            f11 = 0.0f;
        } else {
            Iterator it = priorityQueue.iterator();
            if (!it.hasNext()) {
                throw new NoSuchElementException();
            }
            Pair pair2 = (Pair) it.next();
            float desiredWidth = Layout.getDesiredWidth(fVar.b(), ((Number) pair2.f71683a).intValue(), ((Number) pair2.f71684b).intValue(), textPaint);
            while (it.hasNext()) {
                Pair pair3 = (Pair) it.next();
                desiredWidth = Math.max(desiredWidth, Layout.getDesiredWidth(fVar.b(), ((Number) pair3.f71683a).intValue(), ((Number) pair3.f71684b).intValue(), textPaint));
            }
            f11 = desiredWidth;
        }
        fVar.f77752e = f11;
        return f11;
    }
}
