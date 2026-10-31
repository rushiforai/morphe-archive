package com.google.android.gms.internal.measurement;

import android.util.Log;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import java.util.logging.Level;

/* loaded from: classes3.dex */
public final class q extends c3 {

    /* renamed from: f, reason: collision with root package name */
    public static final Set f32970f;

    /* renamed from: g, reason: collision with root package name */
    public static final ki f32971g;

    /* renamed from: h, reason: collision with root package name */
    public static final o f32972h;

    /* renamed from: b, reason: collision with root package name */
    public final String f32973b;

    /* renamed from: c, reason: collision with root package name */
    public final Level f32974c;

    /* renamed from: d, reason: collision with root package name */
    public final Set f32975d;

    /* renamed from: e, reason: collision with root package name */
    public final ki f32976e;

    static {
        Set setUnmodifiableSet = Collections.unmodifiableSet(new HashSet(Arrays.asList(mh.f32825a, bi.f32415b, ci.f32445a)));
        f32970f = setUnmodifiableSet;
        ki kiVar = new ki(gh.a(setUnmodifiableSet));
        f32971g = kiVar;
        f32972h = new o(Level.ALL, setUnmodifiableSet, kiVar);
    }

    public /* synthetic */ q(String str, Level level, Set set, ki kiVar) {
        super(str);
        this.f32973b = h.c(str);
        this.f32974c = level;
        this.f32975d = set;
        this.f32976e = kiVar;
    }

    /* JADX WARN: Code restructure failed: missing block: B:100:0x0198, code lost:
    
        if (r6 >= r11.length()) goto L299;
     */
    /* JADX WARN: Code restructure failed: missing block: B:102:0x01a5, code lost:
    
        if (((char) ((r11.charAt(r6) & 65503) - 65)) >= 26) goto L228;
     */
    /* JADX WARN: Code restructure failed: missing block: B:103:0x01a7, code lost:
    
        r1 = r11.charAt(r6);
        r2 = r1 & ' ';
     */
    /* JADX WARN: Code restructure failed: missing block: B:104:0x01ad, code lost:
    
        if (r2 != 0) goto L106;
     */
    /* JADX WARN: Code restructure failed: missing block: B:105:0x01af, code lost:
    
        r3 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:106:0x01b1, code lost:
    
        r3 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:107:0x01b2, code lost:
    
        r7 = com.google.android.gms.internal.measurement.ei.f32515e;
     */
    /* JADX WARN: Code restructure failed: missing block: B:108:0x01b4, code lost:
    
        if (r12 != r6) goto L110;
     */
    /* JADX WARN: Code restructure failed: missing block: B:109:0x01b6, code lost:
    
        if (r3 == false) goto L111;
     */
    /* JADX WARN: Code restructure failed: missing block: B:111:0x01ba, code lost:
    
        r3 = com.google.android.gms.internal.measurement.ei.f32515e;
        r25 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:112:0x01be, code lost:
    
        r26 = r13;
        r27 = r14;
        r19 = r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:113:0x01c6, code lost:
    
        if (true == r3) goto L115;
     */
    /* JADX WARN: Code restructure failed: missing block: B:114:0x01c8, code lost:
    
        r3 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:115:0x01ca, code lost:
    
        r3 = 128;
     */
    /* JADX WARN: Code restructure failed: missing block: B:116:0x01cc, code lost:
    
        if (r12 != r6) goto L118;
     */
    /* JADX WARN: Code restructure failed: missing block: B:117:0x01ce, code lost:
    
        r25 = r2;
        r3 = new com.google.android.gms.internal.measurement.ei(r3, -1, -1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:118:0x01d8, code lost:
    
        r7 = r12 + 1;
        r25 = r2;
        r2 = r11.charAt(r12);
        r26 = r13;
        r27 = r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x01e8, code lost:
    
        if (r2 < ' ') goto L318;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x01ec, code lost:
    
        if (r2 <= '0') goto L123;
     */
    /* JADX WARN: Code restructure failed: missing block: B:122:0x01ee, code lost:
    
        r19 = r15;
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x01f1, code lost:
    
        r19 = r15;
        r14 = ((int) ((com.google.android.gms.internal.measurement.ei.f32514d >>> ((r2 - ' ') * 3)) & 7)) - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x0202, code lost:
    
        if (r14 >= 0) goto L130;
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x0206, code lost:
    
        if (r2 != '.') goto L300;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x0208, code lost:
    
        r3 = new com.google.android.gms.internal.measurement.ei(r3, -1, com.google.android.gms.internal.measurement.ei.e(r7, r6, r11));
     */
    /* JADX WARN: Code restructure failed: missing block: B:129:0x0218, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.b(r12, "invalid flag", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x0219, code lost:
    
        r2 = 1 << r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x021f, code lost:
    
        if ((r3 & r2) != 0) goto L301;
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x0221, code lost:
    
        r3 = r3 | r2;
        r12 = r7;
        r15 = r19;
        r2 = r25;
        r13 = r26;
        r14 = r27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:134:0x0232, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.b(r12, "repeated flag", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x0235, code lost:
    
        if (r2 > '9') goto L302;
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x0237, code lost:
    
        r2 = r2 - '0';
     */
    /* JADX WARN: Code restructure failed: missing block: B:138:0x0239, code lost:
    
        if (r7 != r6) goto L141;
     */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x023b, code lost:
    
        r7 = new com.google.android.gms.internal.measurement.ei(r3, r2, -1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:140:0x0241, code lost:
    
        r3 = r7;
     */
    /* JADX WARN: Code restructure failed: missing block: B:141:0x0243, code lost:
    
        r13 = r7 + 1;
        r14 = r11.charAt(r7);
     */
    /* JADX WARN: Code restructure failed: missing block: B:142:0x024b, code lost:
    
        if (r14 != '.') goto L217;
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x024d, code lost:
    
        r7 = new com.google.android.gms.internal.measurement.ei(r3, r2, com.google.android.gms.internal.measurement.ei.e(r13, r6, r11));
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x0257, code lost:
    
        r2 = com.google.android.gms.internal.measurement.di.f32480f[(r1 | ' ') - 97];
     */
    /* JADX WARN: Code restructure failed: missing block: B:145:0x0260, code lost:
    
        if (r25 != 0) goto L151;
     */
    /* JADX WARN: Code restructure failed: missing block: B:146:0x0262, code lost:
    
        if (r2 == null) goto L150;
     */
    /* JADX WARN: Code restructure failed: missing block: B:148:0x0269, code lost:
    
        if ((r2.f32484c & 128) == 0) goto L150;
     */
    /* JADX WARN: Code restructure failed: missing block: B:150:0x026c, code lost:
    
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x026d, code lost:
    
        r12 = r6 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x026f, code lost:
    
        if (r2 == null) goto L176;
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x0271, code lost:
    
        r3.getClass();
        r1 = r2.f32484c;
        r6 = r2.f32483b;
     */
    /* JADX WARN: Code restructure failed: missing block: B:154:0x0279, code lost:
    
        if (r6 == 1) goto L163;
     */
    /* JADX WARN: Code restructure failed: missing block: B:156:0x027c, code lost:
    
        if (r6 == 2) goto L165;
     */
    /* JADX WARN: Code restructure failed: missing block: B:158:0x0280, code lost:
    
        if (r6 == r18) goto L165;
     */
    /* JADX WARN: Code restructure failed: missing block: B:160:0x0283, code lost:
    
        if (r6 == 4) goto L165;
     */
    /* JADX WARN: Code restructure failed: missing block: B:162:0x0286, code lost:
    
        if (r6 != 5) goto L303;
     */
    /* JADX WARN: Code restructure failed: missing block: B:163:0x0288, code lost:
    
        r6 = true;
     */
    /* JADX WARN: Code restructure failed: missing block: B:164:0x028a, code lost:
    
        throw null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:165:0x028b, code lost:
    
        r6 = false;
     */
    /* JADX WARN: Code restructure failed: missing block: B:167:0x0290, code lost:
    
        if (r3.b(r1, r6) == false) goto L304;
     */
    /* JADX WARN: Code restructure failed: missing block: B:169:0x0294, code lost:
    
        if (r9 >= 10) goto L173;
     */
    /* JADX WARN: Code restructure failed: missing block: B:170:0x0296, code lost:
    
        r1 = com.google.android.gms.internal.measurement.b0.f32397d;
     */
    /* JADX WARN: Code restructure failed: missing block: B:171:0x029c, code lost:
    
        if (r3.a() == false) goto L173;
     */
    /* JADX WARN: Code restructure failed: missing block: B:172:0x029e, code lost:
    
        r1 = (com.google.android.gms.internal.measurement.b0[]) com.google.android.gms.internal.measurement.b0.f32397d.get(r2);
        com.google.android.gms.internal.measurement.fb.b(r1, "default parameter");
        r1 = r1[r9];
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x02ae, code lost:
    
        r1 = new com.google.android.gms.internal.measurement.b0(r9, r2, r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:175:0x02ba, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.a(r8, r12, "invalid format specifier", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:177:0x02c1, code lost:
    
        if (r1 == 't') goto L180;
     */
    /* JADX WARN: Code restructure failed: missing block: B:179:0x02c5, code lost:
    
        if (r1 != 'T') goto L181;
     */
    /* JADX WARN: Code restructure failed: missing block: B:182:0x02cb, code lost:
    
        if (r1 == 'h') goto L185;
     */
    /* JADX WARN: Code restructure failed: missing block: B:184:0x02cf, code lost:
    
        if (r1 != 'H') goto L305;
     */
    /* JADX WARN: Code restructure failed: missing block: B:187:0x02d7, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.a(r8, r12, "invalid format specification", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:189:0x02dc, code lost:
    
        if (r3.b(160, false) == false) goto L306;
     */
    /* JADX WARN: Code restructure failed: missing block: B:190:0x02de, code lost:
    
        r1 = new com.google.android.gms.internal.measurement.c0(r3, r9);
     */
    /* JADX WARN: Code restructure failed: missing block: B:192:0x02e9, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.a(r8, r12, "invalid format specification", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:194:0x02ee, code lost:
    
        if (r3.b(160, false) == false) goto L307;
     */
    /* JADX WARN: Code restructure failed: missing block: B:195:0x02f0, code lost:
    
        r6 = r6 + 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:196:0x02f6, code lost:
    
        if (r6 > r11.length()) goto L308;
     */
    /* JADX WARN: Code restructure failed: missing block: B:197:0x02f8, code lost:
    
        r1 = (com.google.android.gms.internal.measurement.y) com.google.android.gms.internal.measurement.y.f33235b.get(java.lang.Character.valueOf(r11.charAt(r12)));
     */
    /* JADX WARN: Code restructure failed: missing block: B:198:0x0308, code lost:
    
        if (r1 == null) goto L309;
     */
    /* JADX WARN: Code restructure failed: missing block: B:199:0x030a, code lost:
    
        r1 = new com.google.android.gms.internal.measurement.z(r3, r9, r1);
        r12 = r6;
     */
    /* JADX WARN: Code restructure failed: missing block: B:200:0x0311, code lost:
    
        r2 = r1.f32362a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:201:0x0315, code lost:
    
        if (r2 >= 32) goto L203;
     */
    /* JADX WARN: Code restructure failed: missing block: B:202:0x0317, code lost:
    
        r10.f33227b |= 1 << r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:203:0x0320, code lost:
    
        r10.f33228c = java.lang.Math.max(r10.f33228c, r2);
        r5.f(r10.f33229d, r8, r11, r4);
        r2 = (java.lang.Object[]) r10.f33231f;
        r3 = r1.f32362a;
     */
    /* JADX WARN: Code restructure failed: missing block: B:204:0x0334, code lost:
    
        if (r3 >= r2.length) goto L209;
     */
    /* JADX WARN: Code restructure failed: missing block: B:205:0x0336, code lost:
    
        r2 = r2[r3];
     */
    /* JADX WARN: Code restructure failed: missing block: B:206:0x0338, code lost:
    
        if (r2 == null) goto L208;
     */
    /* JADX WARN: Code restructure failed: missing block: B:207:0x033a, code lost:
    
        r1.f(r10, r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:208:0x033e, code lost:
    
        r4.append(kotlinx.serialization.json.internal.AbstractJsonLexerKt.NULL);
     */
    /* JADX WARN: Code restructure failed: missing block: B:209:0x0344, code lost:
    
        r4.append("[ERROR: MISSING LOG ARGUMENT]");
     */
    /* JADX WARN: Code restructure failed: missing block: B:212:0x0362, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.b(r12, "illegal date/time conversion", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:214:0x0369, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.b(r8, "truncated format specifier", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:216:0x036e, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.a(r8, r12, "invalid format specification", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:217:0x036f, code lost:
    
        r14 = (char) (r14 - '0');
     */
    /* JADX WARN: Code restructure failed: missing block: B:218:0x0378, code lost:
    
        if (r14 >= '\n') goto L310;
     */
    /* JADX WARN: Code restructure failed: missing block: B:219:0x037a, code lost:
    
        r2 = (r2 * 10) + r14;
     */
    /* JADX WARN: Code restructure failed: missing block: B:220:0x0380, code lost:
    
        if (r2 > 999999) goto L311;
     */
    /* JADX WARN: Code restructure failed: missing block: B:221:0x0382, code lost:
    
        r7 = r13;
        r18 = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:223:0x038d, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.a(r12, r6, "width too large", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:225:0x0394, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.b(r7, "invalid width character", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:227:0x0399, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.b(r12, "invalid flag", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:228:0x039a, code lost:
    
        r6 = r6 + 1;
        r15 = r15;
        r18 = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:230:0x03b4, code lost:
    
        throw new com.google.android.gms.internal.measurement.zzabo(com.google.android.gms.internal.measurement.zzabo.c(r8, -1, "unterminated parameter", r11));
     */
    /* JADX WARN: Code restructure failed: missing block: B:73:0x0135, code lost:
    
        if (r1 != '$') goto L87;
     */
    /* JADX WARN: Code restructure failed: missing block: B:75:0x0139, code lost:
    
        if ((r22 - r12) == 0) goto L294;
     */
    /* JADX WARN: Code restructure failed: missing block: B:77:0x013f, code lost:
    
        if (r11.charAt(r12) == '0') goto L295;
     */
    /* JADX WARN: Code restructure failed: missing block: B:78:0x0141, code lost:
    
        r19 = r19 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:79:0x0147, code lost:
    
        if (r6 == r11.length()) goto L296;
     */
    /* JADX WARN: Code restructure failed: missing block: B:80:0x0149, code lost:
    
        r12 = r6;
        r6 = r22 + 2;
        r9 = r19;
        r7 = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:82:0x015b, code lost:
    
        throw new com.google.android.gms.internal.measurement.zzabo(com.google.android.gms.internal.measurement.zzabo.c(r8, -1, "unterminated parameter", r11));
     */
    /* JADX WARN: Code restructure failed: missing block: B:84:0x0162, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.a(r8, r6, "index has leading zero", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:86:0x0169, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.a(r8, r6, "missing index", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:87:0x016a, code lost:
    
        r7 = -1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:88:0x016d, code lost:
    
        if (r1 != '<') goto L97;
     */
    /* JADX WARN: Code restructure failed: missing block: B:89:0x016f, code lost:
    
        if (r9 == (-1)) goto L297;
     */
    /* JADX WARN: Code restructure failed: missing block: B:91:0x0175, code lost:
    
        if (r6 == r11.length()) goto L298;
     */
    /* JADX WARN: Code restructure failed: missing block: B:92:0x0177, code lost:
    
        r12 = r6;
        r6 = r22 + 2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:94:0x0185, code lost:
    
        throw new com.google.android.gms.internal.measurement.zzabo(com.google.android.gms.internal.measurement.zzabo.c(r8, -1, "unterminated parameter", r11));
     */
    /* JADX WARN: Code restructure failed: missing block: B:96:0x018c, code lost:
    
        throw com.google.android.gms.internal.measurement.zzabo.a(r8, r6, "invalid relative parameter", r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:97:0x018d, code lost:
    
        r9 = r16;
        r16 = r16 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:98:0x0193, code lost:
    
        r6 = r6 + r7;
     */
    /* JADX WARN: Removed duplicated region for block: B:40:0x009a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void m(jh jhVar, String str, Level level, Set set, ki kiVar) {
        c niVar;
        c cVar;
        Level level2;
        StringBuilder sb2;
        Level level3;
        c cVar2;
        StringBuilder sb3;
        String str2;
        String str3;
        int i5;
        String string;
        h hVarC = jhVar.c();
        Level level4 = jhVar.f32697a;
        Boolean bool = (Boolean) hVarC.j(ci.f32445a);
        if (bool == null || !bool.booleanValue()) {
            ((i) d.f32446a).getClass();
            h hVarC2 = n.f32839b.c();
            h hVarC3 = jhVar.c();
            int iA = hVarC3.a();
            if (iA == 0) {
                niVar = c.f32416a;
            } else {
                niVar = iA <= 28 ? new ni(hVarC2, hVarC3) : new oi(hVarC2, hVarC3);
            }
            boolean z11 = level4.intValue() < level.intValue();
            if (!z11) {
                int i11 = f.f32519a;
                if (jhVar.f32702f == null && niVar.b() <= set.size() && set.containsAll(niVar.c())) {
                    if (!(jhVar.f32702f == null)) {
                        throw new IllegalStateException("cannot get literal argument if a template context exists");
                    }
                    Object[] objArr = jhVar.f32703g;
                    if (objArr == null) {
                        throw new IllegalStateException("cannot get literal argument before calling log()");
                    }
                    string = gi.a(objArr[0]);
                    level2 = level4;
                } else {
                    StringBuilder sb4 = new StringBuilder();
                    qh qhVar = jhVar.f32700d;
                    if (qhVar == null) {
                        throw new IllegalStateException("cannot request log site information prior to postProcess()");
                    }
                    if (gh.e(2, qhVar, sb4)) {
                        sb4.append(" ");
                    }
                    if (!z11 || jhVar.f32702f == null) {
                        g gVar = jhVar.f32702f;
                        if (gVar != null) {
                            String str4 = "cannot get arguments unless a template context exists";
                            if (!(gVar != null)) {
                                throw new IllegalStateException("cannot get arguments unless a template context exists");
                            }
                            Object[] objArr2 = jhVar.f32703g;
                            String str5 = "cannot get arguments before calling log()";
                            if (objArr2 == null) {
                                throw new IllegalStateException("cannot get arguments before calling log()");
                            }
                            xg xgVar = new xg(gVar, objArr2, sb4);
                            StringBuilder sb5 = (StringBuilder) xgVar.f33232g;
                            g gVar2 = (g) xgVar.f33230e;
                            d0 d0Var = gVar2.f32547a;
                            String str6 = gVar2.f32548b;
                            d0Var.getClass();
                            int iG = e0.g(0, str6);
                            int i12 = -1;
                            int i13 = 0;
                            while (true) {
                                int i14 = 3;
                                if (iG >= 0) {
                                    int i15 = iG + 1;
                                    int i16 = i15;
                                    int i17 = 0;
                                    while (true) {
                                        level3 = level4;
                                        if (i16 >= str6.length()) {
                                            throw new zzabo(zzabo.c(iG, -1, "unterminated parameter", str6));
                                        }
                                        int i18 = i16 + 1;
                                        char cCharAt = str6.charAt(i16);
                                        int i19 = i16;
                                        char c11 = (char) (cCharAt - '0');
                                        cVar2 = niVar;
                                        if (c11 >= '\n') {
                                            break;
                                        }
                                        int i21 = (i17 * 10) + c11;
                                        if (i21 >= 1000000) {
                                            throw zzabo.a(iG, i18, "index too large", str6);
                                        }
                                        i17 = i21;
                                        i16 = i18;
                                        level4 = level3;
                                        niVar = cVar2;
                                    }
                                } else {
                                    cVar = niVar;
                                    level2 = level4;
                                    StringBuilder sb6 = sb4;
                                    String str7 = str4;
                                    String str8 = str5;
                                    int i22 = xgVar.f33227b;
                                    if (((i22 + 1) & i22) != 0 || (xgVar.f33228c > 31 && i22 != -1)) {
                                        throw new zzabo(String.format("unreferenced arguments [first missing index=%d]", Integer.valueOf(Integer.numberOfTrailingZeros(~i22))));
                                    }
                                    d0Var.f(xgVar.f33229d, str6.length(), str6, sb5);
                                    if (!(jhVar.f32702f != null)) {
                                        throw new IllegalStateException(str7);
                                    }
                                    Object[] objArr3 = jhVar.f32703g;
                                    if (objArr3 == null) {
                                        throw new IllegalStateException(str8);
                                    }
                                    if (objArr3.length > xgVar.f33228c + 1) {
                                        sb5.append(" [ERROR: UNUSED LOG ARGUMENTS]");
                                    }
                                    sb2 = sb6;
                                }
                                xgVar.f33229d = i5;
                                iG = e0.g(i5, str6);
                                str5 = str3;
                                level4 = level3;
                                niVar = cVar2;
                                sb4 = sb3;
                                str4 = str2;
                            }
                        } else {
                            cVar = niVar;
                            level2 = level4;
                            if (!(gVar == null)) {
                                throw new IllegalStateException("cannot get literal argument if a template context exists");
                            }
                            Object[] objArr4 = jhVar.f32703g;
                            if (objArr4 == null) {
                                throw new IllegalStateException("cannot get literal argument before calling log()");
                            }
                            sb2 = sb4;
                            sb2.append(gi.a(objArr4[0]));
                        }
                        int i23 = f.f32519a;
                        fi fiVar = new fi(sb2);
                        cVar.a(kiVar, fiVar);
                        if (fiVar.f32546b) {
                            sb2.append(" ]");
                        }
                    } else {
                        sb4.append("(REDACTED) ");
                        sb4.append(jhVar.f32702f.f32548b);
                        level2 = level4;
                        sb2 = sb4;
                    }
                    string = sb2.toString();
                }
            }
            Throwable th2 = (Throwable) jhVar.c().j(mh.f32825a);
            int iF = h.f(level2);
            if (iF == 2 || iF == 3) {
                return;
            }
            if (iF == 4) {
                Log.i(str, string, th2);
            } else if (iF != 5) {
                Log.e(str, string, th2);
            } else {
                Log.w(str, string, th2);
            }
        }
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final boolean e(Level level) {
        int iF = h.f(level);
        return Log.isLoggable(this.f32973b, iF) || Log.isLoggable("all", iF);
    }

    @Override // com.google.android.gms.internal.measurement.c3
    public final void f(jh jhVar) {
        m(jhVar, this.f32973b, this.f32974c, this.f32975d, this.f32976e);
    }
}
