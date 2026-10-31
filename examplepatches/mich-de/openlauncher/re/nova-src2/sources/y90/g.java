package y90;

import ba0.r;
import ba0.s;
import ba0.t;
import ba0.x;
import cl.l0;
import h6.c1;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/* loaded from: classes5.dex */
public final class g {

    /* renamed from: p, reason: collision with root package name */
    public static final LinkedHashSet f97029p = new LinkedHashSet(Arrays.asList(ba0.b.class, ba0.i.class, ba0.g.class, ba0.j.class, x.class, ba0.p.class, ba0.m.class));

    /* renamed from: q, reason: collision with root package name */
    public static final Map f97030q;

    /* renamed from: a, reason: collision with root package name */
    public CharSequence f97031a;

    /* renamed from: d, reason: collision with root package name */
    public boolean f97034d;

    /* renamed from: h, reason: collision with root package name */
    public boolean f97038h;

    /* renamed from: i, reason: collision with root package name */
    public final List f97039i;

    /* renamed from: j, reason: collision with root package name */
    public final b6.e f97040j;

    /* renamed from: k, reason: collision with root package name */
    public final List f97041k;

    /* renamed from: l, reason: collision with root package name */
    public final e f97042l;
    public final ArrayList n;
    public final LinkedHashSet o;

    /* renamed from: b, reason: collision with root package name */
    public int f97032b = 0;

    /* renamed from: c, reason: collision with root package name */
    public int f97033c = 0;

    /* renamed from: e, reason: collision with root package name */
    public int f97035e = 0;

    /* renamed from: f, reason: collision with root package name */
    public int f97036f = 0;

    /* renamed from: g, reason: collision with root package name */
    public int f97037g = 0;

    /* renamed from: m, reason: collision with root package name */
    public final LinkedHashMap f97043m = new LinkedHashMap();

    static {
        HashMap map = new HashMap();
        map.put(ba0.b.class, new x90.a(1));
        map.put(ba0.i.class, new x90.a(3));
        map.put(ba0.g.class, new x90.a(2));
        map.put(ba0.j.class, new x90.a(4));
        map.put(x.class, new x90.a(7));
        map.put(ba0.p.class, new x90.a(6));
        map.put(ba0.m.class, new x90.a(5));
        f97030q = Collections.unmodifiableMap(map);
    }

    public g(ArrayList arrayList, b6.e eVar, ArrayList arrayList2) {
        ArrayList arrayList3 = new ArrayList();
        this.n = arrayList3;
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        this.o = linkedHashSet;
        this.f97039i = arrayList;
        this.f97040j = eVar;
        this.f97041k = arrayList2;
        e eVar2 = new e(0);
        this.f97042l = eVar2;
        arrayList3.add(eVar2);
        linkedHashSet.add(eVar2);
    }

    public final void a(da0.a aVar) {
        while (!h().b(aVar.e())) {
            e(h());
        }
        h().e().b(aVar.e());
        this.n.add(aVar);
        this.o.add(aVar);
    }

    public final void b(p pVar) {
        l lVar = pVar.f97091b;
        lVar.a();
        Iterator it = lVar.f97075c.iterator();
        while (it.hasNext()) {
            ba0.o oVar = (ba0.o) it.next();
            t tVar = pVar.f97090a;
            oVar.f();
            r rVar = tVar.f17784d;
            oVar.f17784d = rVar;
            if (rVar != null) {
                rVar.f17785e = oVar;
            }
            oVar.f17785e = tVar;
            tVar.f17784d = oVar;
            r rVar2 = tVar.f17781a;
            oVar.f17781a = rVar2;
            if (oVar.f17784d == null) {
                rVar2.f17782b = oVar;
            }
            String str = oVar.f17777f;
            LinkedHashMap linkedHashMap = this.f97043m;
            if (!linkedHashMap.containsKey(str)) {
                linkedHashMap.put(str, oVar);
            }
        }
    }

    public final void c() {
        CharSequence charSequenceSubSequence;
        if (this.f97034d) {
            int i5 = this.f97032b + 1;
            CharSequence charSequence = this.f97031a;
            CharSequence charSequenceSubSequence2 = charSequence.subSequence(i5, charSequence.length());
            int i11 = 4 - (this.f97033c % 4);
            StringBuilder sb2 = new StringBuilder(charSequenceSubSequence2.length() + i11);
            for (int i12 = 0; i12 < i11; i12++) {
                sb2.append(' ');
            }
            sb2.append(charSequenceSubSequence2);
            charSequenceSubSequence = sb2.toString();
        } else {
            CharSequence charSequence2 = this.f97031a;
            charSequenceSubSequence = charSequence2.subSequence(this.f97032b, charSequence2.length());
        }
        h().a(charSequenceSubSequence);
    }

    public final void d() {
        if (this.f97031a.charAt(this.f97032b) != '\t') {
            this.f97032b++;
            this.f97033c++;
        } else {
            this.f97032b++;
            int i5 = this.f97033c;
            this.f97033c = (4 - (i5 % 4)) + i5;
        }
    }

    public final void e(da0.a aVar) {
        if (h() == aVar) {
            this.n.remove(r0.size() - 1);
        }
        if (aVar instanceof p) {
            b((p) aVar);
        }
        aVar.d();
    }

    public final void f(List list) {
        for (int size = list.size() - 1; size >= 0; size--) {
            e((da0.a) list.get(size));
        }
    }

    public final void g() {
        int i5 = this.f97032b;
        int i11 = this.f97033c;
        this.f97038h = true;
        int length = this.f97031a.length();
        while (true) {
            if (i5 >= length) {
                break;
            }
            char cCharAt = this.f97031a.charAt(i5);
            if (cCharAt == '\t') {
                i5++;
                i11 += 4 - (i11 % 4);
            } else if (cCharAt != ' ') {
                this.f97038h = false;
                break;
            } else {
                i5++;
                i11++;
            }
        }
        this.f97035e = i5;
        this.f97036f = i11;
        this.f97037g = i11 - this.f97033c;
    }

    public final da0.a h() {
        return (da0.a) c1.l(this.n, 1);
    }

    /* JADX WARN: Code restructure failed: missing block: B:109:0x01b9, code lost:
    
        if (r3 < 1) goto L119;
     */
    /* JADX WARN: Code restructure failed: missing block: B:110:0x01bb, code lost:
    
        r3 = r15 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x01c1, code lost:
    
        if (r3 >= r13.length()) goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x01c3, code lost:
    
        r6 = r13.charAt(r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x01c9, code lost:
    
        if (r6 == '\t') goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x01cd, code lost:
    
        if (r6 == ' ') goto L117;
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x01d0, code lost:
    
        r6 = r13.subSequence(r8, r15).toString();
        r14 = new ba0.s();
        r14.f17786g = java.lang.Integer.parseInt(r6);
        r14.f17787h = r5;
        r5 = new y90.m(r14, r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:390:0x06ae, code lost:
    
        k(r22.f97035e);
     */
    /* JADX WARN: Code restructure failed: missing block: B:44:0x00c0, code lost:
    
        r21 = r6;
     */
    /* JADX WARN: Failed to find 'out' block for switch in B:102:0x01a6. Please report as an issue. */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0218  */
    /* JADX WARN: Removed duplicated region for block: B:148:0x0255  */
    /* JADX WARN: Removed duplicated region for block: B:155:0x0267 A[PHI: r21
      0x0267: PHI (r21v13 da0.a) = 
      (r21v5 da0.a)
      (r21v5 da0.a)
      (r21v5 da0.a)
      (r21v5 da0.a)
      (r21v5 da0.a)
      (r21v5 da0.a)
      (r21v6 da0.a)
      (r21v7 da0.a)
      (r21v7 da0.a)
      (r21v9 da0.a)
      (r21v9 da0.a)
      (r21v9 da0.a)
      (r21v10 da0.a)
      (r21v10 da0.a)
      (r21v10 da0.a)
      (r21v11 da0.a)
      (r21v11 da0.a)
      (r21v15 da0.a)
      (r21v19 da0.a)
     binds: [B:303:0x054e, B:305:0x055a, B:307:0x0566, B:359:0x060a, B:361:0x0610, B:363:0x061e, B:292:0x0511, B:260:0x0498, B:289:0x04f3, B:198:0x0377, B:255:0x046f, B:257:0x0475, B:183:0x0322, B:185:0x032a, B:443:0x0267, B:175:0x02ed, B:181:0x0316, B:154:0x0265, B:84:0x016a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:156:0x026a  */
    /* JADX WARN: Removed duplicated region for block: B:239:0x0414  */
    /* JADX WARN: Removed duplicated region for block: B:241:0x0417  */
    /* JADX WARN: Removed duplicated region for block: B:243:0x042a  */
    /* JADX WARN: Removed duplicated region for block: B:251:0x0451  */
    /* JADX WARN: Removed duplicated region for block: B:254:0x046d  */
    /* JADX WARN: Removed duplicated region for block: B:288:0x04f2  */
    /* JADX WARN: Removed duplicated region for block: B:290:0x04f5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void i(String str) {
        da0.a aVar;
        int i5;
        b bVar;
        boolean z11;
        b bVar2;
        int i11;
        int i12;
        char cCharAt;
        int i13;
        h hVar;
        b bVar3;
        i iVar;
        int i14;
        StringBuilder sbD;
        int i15;
        m mVar;
        char cCharAt2;
        m mVar2;
        int i16;
        String string = str;
        int length = string.length();
        int i17 = 0;
        StringBuilder sb2 = null;
        for (int i18 = 0; i18 < length; i18++) {
            char cCharAt3 = string.charAt(i18);
            if (cCharAt3 == 0) {
                if (sb2 == null) {
                    sb2 = new StringBuilder(length);
                    sb2.append((CharSequence) string, 0, i18);
                }
                sb2.append((char) 65533);
            } else if (sb2 != null) {
                sb2.append(cCharAt3);
            }
        }
        if (sb2 != null) {
            string = sb2.toString();
        }
        this.f97031a = string;
        this.f97032b = 0;
        this.f97033c = 0;
        this.f97034d = false;
        ArrayList arrayList = this.n;
        int i19 = 1;
        for (da0.a aVar2 : arrayList.subList(1, arrayList.size())) {
            g();
            cf.c cVarH = aVar2.h(this);
            if (cVarH == null) {
                break;
            }
            if (cVarH.f19945c) {
                e(aVar2);
                return;
            }
            int i21 = cVarH.f19943a;
            if (i21 != -1) {
                k(i21);
            } else {
                int i22 = cVarH.f19944b;
                if (i22 != -1) {
                    j(i22);
                }
            }
            i19++;
        }
        ArrayList arrayList2 = new ArrayList(arrayList.subList(i19, arrayList.size()));
        da0.a aVar3 = (da0.a) arrayList.get(i19 - 1);
        boolean zIsEmpty = arrayList2.isEmpty();
        boolean zF = (aVar3.e() instanceof t) || aVar3.f();
        while (true) {
            if (zF) {
                g();
                if (!this.f97038h) {
                    int i23 = 4;
                    if (this.f97037g >= 4 || !Character.isLetter(Character.codePointAt(this.f97031a, this.f97035e))) {
                        f fVar = new f(aVar3);
                        Iterator it = this.f97039i.iterator();
                        while (true) {
                            if (it.hasNext()) {
                                i5 = i17;
                                char c11 = ' ';
                                switch (((x90.a) it.next()).f95727a) {
                                    case 0:
                                        aVar = aVar3;
                                        CharSequence charSequence = this.f97031a;
                                        StringBuilder sbD2 = fVar.d();
                                        if (sbD2 != null && sbD2.toString().contains("|") && !sbD2.toString().contains("\n")) {
                                            CharSequence charSequenceSubSequence = charSequence.subSequence(this.f97032b, charSequence.length());
                                            ArrayList arrayList3 = new ArrayList();
                                            int i24 = i5;
                                            int i25 = i24;
                                            int i26 = i25;
                                            while (true) {
                                                if (i25 < charSequenceSubSequence.length()) {
                                                    char cCharAt4 = charSequenceSubSequence.charAt(i25);
                                                    if (cCharAt4 == '\t' || cCharAt4 == ' ') {
                                                        i25++;
                                                    } else if (cCharAt4 == '-' || cCharAt4 == ':') {
                                                        if (i26 != 0 || arrayList3.isEmpty()) {
                                                            if (cCharAt4 == ':') {
                                                                i25++;
                                                                i11 = 1;
                                                            } else {
                                                                i11 = i5;
                                                            }
                                                            int i27 = i5;
                                                            while (i25 < charSequenceSubSequence.length() && charSequenceSubSequence.charAt(i25) == '-') {
                                                                i25++;
                                                                i27 = 1;
                                                            }
                                                            if (i27 != 0) {
                                                                if (i25 >= charSequenceSubSequence.length() || charSequenceSubSequence.charAt(i25) != ':') {
                                                                    i12 = i5;
                                                                } else {
                                                                    i25++;
                                                                    i12 = 1;
                                                                }
                                                                arrayList3.add((i11 == 0 || i12 == 0) ? i11 != 0 ? w90.c.f94120a : i12 != 0 ? w90.c.f94122c : null : w90.c.f94121b);
                                                                i26 = i5;
                                                            }
                                                        }
                                                    } else if (cCharAt4 == '|') {
                                                        i25++;
                                                        i26++;
                                                        if (i26 <= 1) {
                                                            i24 = 1;
                                                        }
                                                    }
                                                } else if (i24 == 0) {
                                                }
                                            }
                                            arrayList3 = null;
                                            if (arrayList3 != null && !arrayList3.isEmpty()) {
                                                ArrayList arrayListJ = x90.b.j(sbD2);
                                                if (arrayList3.size() >= arrayListJ.size()) {
                                                    x90.b bVar4 = new x90.b(arrayList3, arrayListJ);
                                                    da0.a[] aVarArr = new da0.a[1];
                                                    aVarArr[i5] = bVar4;
                                                    bVar2 = new b(aVarArr);
                                                    bVar2.f97007b = this.f97032b;
                                                    bVar2.f97009d = true;
                                                    bVar = bVar2;
                                                    break;
                                                }
                                            }
                                        }
                                        bVar = null;
                                        break;
                                    case 1:
                                        aVar = aVar3;
                                        int i28 = this.f97035e;
                                        if (a.i(this, i28)) {
                                            int i29 = this.f97033c + this.f97037g;
                                            int i31 = i29 + 1;
                                            CharSequence charSequence2 = this.f97031a;
                                            int i32 = i28 + 1;
                                            if (i32 < charSequence2.length() && ((cCharAt = charSequence2.charAt(i32)) == '\t' || cCharAt == ' ')) {
                                                i31 = i29 + 2;
                                            }
                                            da0.a[] aVarArr2 = new da0.a[1];
                                            aVarArr2[i5] = new a();
                                            bVar = new b(aVarArr2);
                                            bVar.f97008c = i31;
                                            break;
                                        } else {
                                            bVar = null;
                                            break;
                                        }
                                        break;
                                    case 2:
                                        aVar = aVar3;
                                        int i33 = this.f97037g;
                                        if (i33 < 4) {
                                            int i34 = this.f97035e;
                                            CharSequence charSequence3 = this.f97031a;
                                            int length2 = charSequence3.length();
                                            int i35 = i34;
                                            int i36 = i5;
                                            int i37 = i36;
                                            while (true) {
                                                i13 = i34;
                                                if (i35 < length2) {
                                                    char cCharAt5 = charSequence3.charAt(i35);
                                                    if (cCharAt5 == '`') {
                                                        i36++;
                                                    } else if (cCharAt5 == '~') {
                                                        i37++;
                                                    }
                                                    i35++;
                                                    i34 = i13;
                                                }
                                            }
                                            int i38 = 3;
                                            if (i36 < 3) {
                                                hVar = (i37 >= i38 || i36 != 0) ? null : new h(i37, i33, '~');
                                                if (hVar != null) {
                                                    da0.a[] aVarArr3 = new da0.a[1];
                                                    aVarArr3[i5] = hVar;
                                                    bVar3 = new b(aVarArr3);
                                                    bVar3.f97007b = i13 + hVar.f97044a.f17766g;
                                                    bVar = bVar3;
                                                    break;
                                                }
                                            } else if (i37 == 0) {
                                                int i39 = i13 + i36;
                                                int length3 = charSequence3.length();
                                                while (true) {
                                                    if (i39 >= length3) {
                                                        i39 = -1;
                                                    } else if (charSequence3.charAt(i39) != '`') {
                                                        i39++;
                                                    }
                                                }
                                                if (i39 == -1) {
                                                    hVar = new h(i36, i33, '`');
                                                }
                                                if (hVar != null) {
                                                }
                                            } else {
                                                i38 = 3;
                                                if (i37 >= i38) {
                                                    if (hVar != null) {
                                                    }
                                                }
                                            }
                                        }
                                        bVar = null;
                                        break;
                                    case 3:
                                        aVar = aVar3;
                                        if (this.f97037g < 4) {
                                            CharSequence charSequence4 = this.f97031a;
                                            int i40 = this.f97035e;
                                            int iO = l0.O('#', i40, charSequence4.length(), charSequence4) - i40;
                                            if (iO == 0 || iO > 6) {
                                                iVar = null;
                                                if (iVar == null) {
                                                    da0.a[] aVarArr4 = new da0.a[1];
                                                    aVarArr4[i5] = iVar;
                                                    bVar3 = new b(aVarArr4);
                                                    bVar3.f97007b = charSequence4.length();
                                                } else {
                                                    char cCharAt6 = charSequence4.charAt(i40);
                                                    if (cCharAt6 == '-') {
                                                        i14 = l0.P(charSequence4, l0.O('-', i40 + 1, charSequence4.length(), charSequence4), charSequence4.length()) >= charSequence4.length() ? 2 : i5;
                                                        if (i14 > 0 && (sbD = fVar.d()) != null) {
                                                            i iVar2 = new i(i14, sbD.toString());
                                                            da0.a[] aVarArr5 = new da0.a[1];
                                                            aVarArr5[i5] = iVar2;
                                                            bVar3 = new b(aVarArr5);
                                                            bVar3.f97007b = charSequence4.length();
                                                            bVar3.f97009d = true;
                                                        }
                                                    } else {
                                                        if (cCharAt6 == '=') {
                                                            if (l0.P(charSequence4, l0.O('=', i40 + 1, charSequence4.length(), charSequence4), charSequence4.length()) >= charSequence4.length()) {
                                                                i14 = 1;
                                                            }
                                                        }
                                                        if (i14 > 0) {
                                                            i iVar22 = new i(i14, sbD.toString());
                                                            da0.a[] aVarArr52 = new da0.a[1];
                                                            aVarArr52[i5] = iVar22;
                                                            bVar3 = new b(aVarArr52);
                                                            bVar3.f97007b = charSequence4.length();
                                                            bVar3.f97009d = true;
                                                        }
                                                    }
                                                }
                                                bVar = bVar3;
                                                break;
                                            } else {
                                                int i41 = i40 + iO;
                                                if (i41 >= charSequence4.length()) {
                                                    iVar = new i(iO, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
                                                } else {
                                                    char cCharAt7 = charSequence4.charAt(i41);
                                                    char c12 = ' ';
                                                    char c13 = '\t';
                                                    if (cCharAt7 == ' ' || cCharAt7 == '\t') {
                                                        int length4 = charSequence4.length() - 1;
                                                        while (true) {
                                                            if (length4 < i41) {
                                                                length4 = i41 - 1;
                                                            } else {
                                                                char cCharAt8 = charSequence4.charAt(length4);
                                                                if (cCharAt8 == c13 || cCharAt8 == c12) {
                                                                    length4--;
                                                                    c12 = ' ';
                                                                    c13 = '\t';
                                                                }
                                                            }
                                                        }
                                                        int i42 = length4;
                                                        while (true) {
                                                            if (i42 < i41) {
                                                                i42 = i41 - 1;
                                                            } else if (charSequence4.charAt(i42) == '#') {
                                                                i42--;
                                                            }
                                                        }
                                                        int i43 = i42;
                                                        while (true) {
                                                            if (i43 < i41) {
                                                                i43 = i41 - 1;
                                                            } else {
                                                                char cCharAt9 = charSequence4.charAt(i43);
                                                                if (cCharAt9 == '\t' || cCharAt9 == ' ') {
                                                                    i43--;
                                                                }
                                                            }
                                                        }
                                                        iVar = i43 != i42 ? new i(iO, charSequence4.subSequence(i41, i43 + 1).toString()) : new i(iO, charSequence4.subSequence(i41, length4 + 1).toString());
                                                    }
                                                }
                                                if (iVar == null) {
                                                }
                                                bVar = bVar3;
                                            }
                                        }
                                        bVar = null;
                                        break;
                                    case 4:
                                        aVar = aVar3;
                                        int i44 = i23;
                                        int i45 = this.f97035e;
                                        CharSequence charSequence5 = this.f97031a;
                                        if (this.f97037g < i44 && charSequence5.charAt(i45) == '<') {
                                            for (int i46 = 1; i46 <= 7; i46++) {
                                                if (i46 != 7 || !(((da0.a) fVar.f97028a).e() instanceof t)) {
                                                    Pattern[] patternArr = j.f97050e[i46];
                                                    Pattern pattern = patternArr[i5];
                                                    Pattern pattern2 = patternArr[1];
                                                    if (pattern.matcher(charSequence5.subSequence(i45, charSequence5.length())).find()) {
                                                        da0.a[] aVarArr6 = new da0.a[1];
                                                        aVarArr6[i5] = new j(pattern2);
                                                        bVar = new b(aVarArr6);
                                                        bVar.f97007b = this.f97032b;
                                                        break;
                                                    }
                                                }
                                            }
                                            bVar = null;
                                            break;
                                        }
                                        break;
                                    case 5:
                                        aVar = aVar3;
                                        if (this.f97037g >= 4) {
                                            if (!this.f97038h && !(h().e() instanceof t)) {
                                                da0.a[] aVarArr7 = new da0.a[1];
                                                aVarArr7[i5] = new i();
                                                bVar = new b(aVarArr7);
                                                bVar.f97008c = this.f97033c + 4;
                                                break;
                                            } else {
                                                bVar = null;
                                                break;
                                            }
                                        }
                                        break;
                                    case 6:
                                        da0.a aVar4 = (da0.a) fVar.f97028a;
                                        int i47 = this.f97037g;
                                        if (i47 >= 4) {
                                            aVar = aVar3;
                                        } else {
                                            int i48 = this.f97035e;
                                            int i49 = this.f97033c + i47;
                                            int i51 = fVar.d() != null ? 1 : i5;
                                            CharSequence charSequence6 = this.f97031a;
                                            char cCharAt10 = charSequence6.charAt(i48);
                                            if (cCharAt10 == '*' || cCharAt10 == '+' || cCharAt10 == '-') {
                                                i15 = i51;
                                                aVar = aVar3;
                                                int i52 = i48 + 1;
                                                if (i52 >= charSequence6.length() || (cCharAt2 = charSequence6.charAt(i52)) == '\t' || cCharAt2 == ' ') {
                                                    ba0.c cVar = new ba0.c();
                                                    cVar.f17763g = cCharAt10;
                                                    mVar = new m(cVar, i52);
                                                } else {
                                                    mVar = null;
                                                }
                                                if (mVar == null) {
                                                    mVar2 = null;
                                                    if (mVar2 == null) {
                                                        ba0.p pVar = mVar2.f97082a;
                                                        int i53 = mVar2.f97083b;
                                                        o oVar = new o(i53 - this.f97033c);
                                                        if (aVar4 instanceof n) {
                                                            ba0.p pVar2 = ((n) aVar4).f97084a;
                                                            if ((((pVar2 instanceof ba0.c) && (pVar instanceof ba0.c)) ? Character.valueOf(((ba0.c) pVar2).f17763g).equals(Character.valueOf(((ba0.c) pVar).f17763g)) : ((pVar2 instanceof s) && (pVar instanceof s)) ? Character.valueOf(((s) pVar2).f17787h).equals(Character.valueOf(((s) pVar).f17787h)) : i5) != 0) {
                                                                da0.a[] aVarArr8 = new da0.a[1];
                                                                aVarArr8[i5] = oVar;
                                                                b bVar5 = new b(aVarArr8);
                                                                bVar5.f97008c = i53;
                                                                bVar = bVar5;
                                                                break;
                                                            }
                                                        }
                                                        n nVar = new n(pVar);
                                                        pVar.f17780f = true;
                                                        da0.a[] aVarArr9 = new da0.a[2];
                                                        aVarArr9[i5] = nVar;
                                                        aVarArr9[1] = oVar;
                                                        bVar2 = new b(aVarArr9);
                                                        bVar2.f97008c = i53;
                                                        bVar = bVar2;
                                                        break;
                                                    }
                                                } else {
                                                    ba0.p pVar3 = mVar.f97082a;
                                                    int i54 = mVar.f97083b;
                                                    int i55 = (i54 - i48) + i49;
                                                    int length5 = charSequence6.length();
                                                    int i56 = i55;
                                                    while (true) {
                                                        if (i54 >= length5) {
                                                            i16 = i5;
                                                        } else {
                                                            char cCharAt11 = charSequence6.charAt(i54);
                                                            if (cCharAt11 == '\t') {
                                                                i56 = (4 - (i56 % 4)) + i56;
                                                            } else if (cCharAt11 == ' ') {
                                                                i56++;
                                                            } else {
                                                                i16 = 1;
                                                            }
                                                            i54++;
                                                        }
                                                    }
                                                    if (i15 == 0 || ((!(pVar3 instanceof s) || ((s) pVar3).f17786g == 1) && i16 != 0)) {
                                                        if (i16 == 0 || i56 - i55 > 4) {
                                                            i56 = i55 + 1;
                                                        }
                                                        mVar2 = new m(pVar3, i56);
                                                    }
                                                    if (mVar2 == null) {
                                                    }
                                                }
                                            } else {
                                                int length6 = charSequence6.length();
                                                int i57 = i48;
                                                int i58 = i5;
                                                while (true) {
                                                    i15 = i51;
                                                    if (i57 < length6) {
                                                        char cCharAt12 = charSequence6.charAt(i57);
                                                        aVar = aVar3;
                                                        if (cCharAt12 == ')' || cCharAt12 == '.') {
                                                            break;
                                                        } else {
                                                            switch (cCharAt12) {
                                                                case '0':
                                                                case '1':
                                                                case '2':
                                                                case '3':
                                                                case '4':
                                                                case '5':
                                                                case '6':
                                                                case '7':
                                                                case '8':
                                                                case '9':
                                                                    i58++;
                                                                    if (i58 > 9) {
                                                                        break;
                                                                    } else {
                                                                        i57++;
                                                                        i51 = i15;
                                                                        aVar3 = aVar;
                                                                    }
                                                            }
                                                            if (mVar == null) {
                                                            }
                                                        }
                                                    } else {
                                                        aVar = aVar3;
                                                    }
                                                }
                                                mVar = null;
                                                if (mVar == null) {
                                                }
                                            }
                                        }
                                        bVar = null;
                                        break;
                                    default:
                                        if (this.f97037g >= i23) {
                                            bVar = null;
                                            aVar = aVar3;
                                            break;
                                        } else {
                                            int i59 = this.f97035e;
                                            CharSequence charSequence7 = this.f97031a;
                                            int length7 = charSequence7.length();
                                            int i61 = i5;
                                            int i62 = i61;
                                            int i63 = i62;
                                            while (true) {
                                                if (i59 >= length7) {
                                                    int i64 = i62;
                                                    int i65 = i63;
                                                    if ((i61 >= 3 && i64 == 0 && i65 == 0) || ((i64 >= 3 && i61 == 0 && i65 == 0) || (i65 >= 3 && i61 == 0 && i64 == 0))) {
                                                        da0.a[] aVarArr10 = new da0.a[1];
                                                        aVarArr10[i5] = new e(1);
                                                        bVar = new b(aVarArr10);
                                                        bVar.f97007b = charSequence7.length();
                                                    }
                                                } else {
                                                    char cCharAt13 = charSequence7.charAt(i59);
                                                    if (cCharAt13 == '\t' || cCharAt13 == c11) {
                                                        i62 = i62;
                                                        i63 = i63;
                                                    } else if (cCharAt13 == '*') {
                                                        i63++;
                                                    } else if (cCharAt13 == '-') {
                                                        i61++;
                                                    } else if (cCharAt13 == '_') {
                                                        i62++;
                                                    }
                                                    i59++;
                                                    c11 = ' ';
                                                }
                                            }
                                            bVar = null;
                                            aVar = aVar3;
                                        }
                                }
                                if (bVar == null) {
                                    i17 = i5;
                                    aVar3 = aVar;
                                    i23 = 4;
                                }
                            } else {
                                i5 = i17;
                                aVar = aVar3;
                                bVar = null;
                            }
                        }
                        if (bVar == null) {
                            k(this.f97035e);
                        } else {
                            if (!zIsEmpty) {
                                f(arrayList2);
                                zIsEmpty = true;
                            }
                            int i66 = bVar.f97007b;
                            if (i66 != -1) {
                                k(i66);
                            } else {
                                int i67 = bVar.f97008c;
                                if (i67 != -1) {
                                    j(i67);
                                }
                            }
                            if (bVar.f97009d) {
                                da0.a aVarH = h();
                                z11 = true;
                                arrayList.remove(arrayList.size() - 1);
                                this.o.remove(aVarH);
                                if (aVarH instanceof p) {
                                    b((p) aVarH);
                                }
                                aVarH.e().f();
                            } else {
                                z11 = true;
                            }
                            da0.a[] aVarArr11 = bVar.f97006a;
                            int length8 = aVarArr11.length;
                            aVar3 = aVar;
                            for (int i68 = i5; i68 < length8; i68++) {
                                aVar3 = aVarArr11[i68];
                                a(aVar3);
                                zF = aVar3.f();
                            }
                            i17 = i5;
                        }
                    }
                }
            } else {
                aVar = aVar3;
            }
        }
        if (!zIsEmpty && !this.f97038h && h().c()) {
            c();
            return;
        }
        if (!zIsEmpty) {
            f(arrayList2);
        }
        if (!aVar.f()) {
            c();
        } else {
            if (this.f97038h) {
                return;
            }
            a(new p());
            c();
        }
    }

    public final void j(int i5) {
        int i11;
        int i12 = this.f97036f;
        if (i5 >= i12) {
            this.f97032b = this.f97035e;
            this.f97033c = i12;
        }
        int length = this.f97031a.length();
        while (true) {
            i11 = this.f97033c;
            if (i11 >= i5 || this.f97032b == length) {
                break;
            } else {
                d();
            }
        }
        if (i11 <= i5) {
            this.f97034d = false;
            return;
        }
        this.f97032b--;
        this.f97033c = i5;
        this.f97034d = true;
    }

    public final void k(int i5) {
        int i11 = this.f97035e;
        if (i5 >= i11) {
            this.f97032b = i11;
            this.f97033c = this.f97036f;
        }
        int length = this.f97031a.length();
        while (true) {
            int i12 = this.f97032b;
            if (i12 >= i5 || i12 == length) {
                break;
            } else {
                d();
            }
        }
        this.f97034d = false;
    }
}
