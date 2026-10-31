package com.google.android.gms.internal.measurement;

import android.text.TextUtils;
import java.util.ArrayDeque;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes3.dex */
public abstract class dg implements zg {

    /* renamed from: a, reason: collision with root package name */
    public final dg f32473a;

    /* renamed from: b, reason: collision with root package name */
    public final UUID f32474b;

    /* renamed from: c, reason: collision with root package name */
    public final String f32475c;

    /* renamed from: d, reason: collision with root package name */
    public final String f32476d;

    /* renamed from: e, reason: collision with root package name */
    public Thread f32477e;

    public dg(String str, dg dgVar, yg ygVar) {
        str.getClass();
        this.f32476d = str;
        this.f32473a = dgVar;
        this.f32474b = dgVar.f32474b;
        this.f32475c = dgVar.f32475c;
        this.f32477e = Thread.currentThread();
    }

    public static String a(UUID uuid) {
        return "tk-trace-id: ".concat(String.valueOf(Long.toString(uuid.getLeastSignificantBits() >>> 1, 36)));
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        yg ygVarC = jg.c();
        zg zgVar = ygVarC.f33266b;
        String str = this.f32476d;
        if (zgVar == null) {
            throw new ig(b.c0.r(new StringBuilder(String.valueOf(str).length() + 101), "Tried to end [", str, "], but no trace was active. This is caused by mismatched or missing calls to beginSpan."));
        }
        if (this == zgVar) {
            jg.b(ygVarC, ((dg) zgVar).f32473a);
            this.f32477e = null;
            return;
        }
        String str2 = ((dg) zgVar).f32476d;
        StringBuilder sb2 = new StringBuilder(String.valueOf(str).length() + 79 + String.valueOf(str2).length() + 1);
        b.c0.D(sb2, "Tried to end span ", str, ", but that span is not the current span. The current span is ", str2);
        sb2.append(".");
        throw new ig(sb2.toString());
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0094, code lost:
    
        r15 = ((com.google.android.gms.internal.measurement.vg) r1.f33232g).f33161d;
        r16 = r6;
        r6 = java.lang.Integer.valueOf(r13);
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00a4, code lost:
    
        if (r15.containsKey(r6) != false) goto L123;
     */
    /* JADX WARN: Code restructure failed: missing block: B:33:0x00a6, code lost:
    
        ((com.google.android.gms.internal.measurement.vg) r1.f33232g).f33161d.put(r6, new com.google.android.gms.internal.measurement.vg(r7, 1073741824));
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00b4, code lost:
    
        if (r14 == null) goto L127;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00b6, code lost:
    
        r14.f33160c = (com.google.android.gms.internal.measurement.vg) r1.f33232g;
     */
    /* JADX WARN: Code restructure failed: missing block: B:37:0x00c7, code lost:
    
        if (r14 == null) goto L39;
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00c9, code lost:
    
        r14.f33160c = (com.google.android.gms.internal.measurement.vg) r1.f33232g;
     */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x00cf, code lost:
    
        r1.f33227b = r7;
        r1.f33228c++;
        r1.a();
     */
    /* JADX WARN: Removed duplicated region for block: B:103:0x02bb A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:134:0x01fc A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:18:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01fb  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x025b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String toString() {
        int i5;
        int i11;
        wg wgVar;
        Iterator it;
        ug ugVar;
        int i12;
        String strConcat;
        AtomicReference atomicReference = jg.f32692a;
        int i13 = 0;
        int length = 0;
        dg dgVar = this;
        while (dgVar != null) {
            i13++;
            length += dgVar.f32476d.length();
            dgVar = dgVar.f32473a;
            if (dgVar != null) {
                length += 4;
            }
        }
        if (i13 > 250) {
            String[] strArr = new String[i13];
            dg dgVar2 = this;
            for (int i14 = i13 - 1; i14 >= 0; i14--) {
                strArr[i14] = dgVar2.f32476d;
                dgVar2 = dgVar2.f32473a;
            }
            c30.c cVarA = xk.x0.a();
            lh.h it2 = xk.d1.o(strArr).iterator();
            int i15 = 0;
            while (it2.hasNext()) {
                cVarA.p(it2.next(), Integer.valueOf(i15));
                i15++;
            }
            int i16 = 1;
            xk.w2 w2VarC = cVarA.c(true);
            int i17 = w2VarC.f96045f;
            int i18 = i13 >> 2;
            if (i17 > i18) {
                wgVar = null;
                strConcat = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (wgVar != null) {
                    int i19 = wgVar.f33198a;
                    String strConcat2 = i19 > 0 ? String.valueOf(TextUtils.join(" -> ", Arrays.copyOf(strArr, i19))).concat(" -> ") : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    int i21 = wgVar.f33199b;
                    int i22 = wgVar.f33200c;
                    int i23 = ((i21 - i19) * i22) + i19;
                    if (i23 < i13) {
                        strConcat = " -> ".concat(String.valueOf(TextUtils.join(" -> ", Arrays.copyOfRange(strArr, i23, i13))));
                    }
                    String strJoin = TextUtils.join(" -> ", Arrays.copyOfRange(strArr, i19, i21));
                    Locale locale = Locale.US;
                    strConcat = strConcat2 + "{" + strJoin + "}x" + i22 + strConcat;
                }
                if (!strConcat.isEmpty()) {
                    return strConcat;
                }
            } else {
                int i24 = i13 + 1;
                int[] iArr = new int[i24];
                for (int i25 = 0; i25 < i13; i25++) {
                    iArr[i25] = ((Integer) w2VarC.get(strArr[i25])).intValue();
                }
                iArr[i13] = i17;
                xg xgVar = new xg(iArr);
                int i26 = 0;
                while (true) {
                    int i27 = -1;
                    if (i26 >= i24) {
                        break;
                    }
                    xgVar.f33229d += i16;
                    int i28 = iArr[i26];
                    while (true) {
                        vg vgVar = null;
                        while (true) {
                            if (xgVar.f33229d <= 0) {
                                i12 = i16;
                                break;
                            }
                            if (xgVar.f33228c == 0) {
                                break;
                            }
                            i12 = i16;
                            int i29 = ((vg) ((vg) xgVar.f33232g).f33161d.get(Integer.valueOf(iArr[xgVar.f33227b]))).f33158a;
                            int i31 = xgVar.f33228c;
                            if (iArr[i29 + i31] == i28) {
                                if (vgVar != null) {
                                    vgVar.f33160c = (vg) xgVar.f33232g;
                                }
                                xgVar.f33228c = i31 + 1;
                                xgVar.a();
                            } else {
                                vg vgVar2 = (vg) ((vg) xgVar.f33232g).f33161d.get(Integer.valueOf(iArr[xgVar.f33227b]));
                                int i32 = i27;
                                vg vgVar3 = new vg(vgVar2.f33158a, (xgVar.f33228c + r0) - 1);
                                ((vg) xgVar.f33232g).f33161d.put(Integer.valueOf(iArr[xgVar.f33227b]), vgVar3);
                                int i33 = vgVar3.f33159b + 1;
                                Integer numValueOf = Integer.valueOf(iArr[i33]);
                                HashMap map = vgVar3.f33161d;
                                map.put(numValueOf, vgVar2);
                                vgVar2.f33158a = i33;
                                if (vgVar != null) {
                                    vgVar.f33160c = vgVar3;
                                }
                                map.put(Integer.valueOf(i28), new vg(i26, 1073741824));
                                xgVar.f33229d--;
                                xgVar.b();
                                vgVar = vgVar3;
                                i16 = i12;
                                i27 = i32;
                            }
                        }
                        xgVar.f33229d += i27;
                        xgVar.b();
                        i16 = i12;
                    }
                    i26++;
                    i16 = i12;
                }
                int i34 = i16;
                ArrayDeque arrayDeque = new ArrayDeque();
                vg vgVar4 = (vg) xgVar.f33231f;
                ug ugVar2 = new ug(vgVar4, 0, -1, -1);
                arrayDeque.push(ugVar2);
                while (!arrayDeque.isEmpty()) {
                    ug ugVar3 = (ug) arrayDeque.pop();
                    Iterator it3 = ugVar3.f33117d.f33161d.values().iterator();
                    while (it3.hasNext()) {
                        vg vgVar5 = (vg) it3.next();
                        int i35 = ugVar3.f33115b;
                        int i36 = ugVar3.f33116c;
                        int i37 = vgVar5.f33158a;
                        vg vgVar6 = vgVar4;
                        int i38 = vgVar5.f33159b;
                        if (xgVar.e(i35, i36, i37, i38)) {
                            it = it3;
                        } else {
                            if (vgVar5.f33161d.isEmpty()) {
                                int i39 = vgVar5.f33158a;
                                it = it3;
                                if (xgVar.e(i35, i36, i39, (i39 + i36) - i35)) {
                                }
                                if (ugVar2.f33114a < ugVar.f33114a) {
                                    ugVar2 = ugVar;
                                }
                                arrayDeque.push(ugVar);
                                vgVar4 = vgVar6;
                                it3 = it;
                                i34 = 1;
                            } else {
                                it = it3;
                            }
                            ugVar = new ug(vgVar5, i34, vgVar5.f33158a, i38);
                            if (ugVar2.f33114a < ugVar.f33114a) {
                            }
                            arrayDeque.push(ugVar);
                            vgVar4 = vgVar6;
                            it3 = it;
                            i34 = 1;
                        }
                        ugVar = new ug(vgVar5, ugVar3.f33114a + i34, i35, i36);
                        if (ugVar2.f33114a < ugVar.f33114a) {
                        }
                        arrayDeque.push(ugVar);
                        vgVar4 = vgVar6;
                        it3 = it;
                        i34 = 1;
                    }
                    i34 = 1;
                }
                int iMin = Math.min(iArr.length, ugVar2.f33116c + 1);
                int i40 = 0;
                loop9: while (true) {
                    i5 = ugVar2.f33115b;
                    i11 = iMin - i5;
                    vgVar4 = (vg) vgVar4.f33161d.get(Integer.valueOf(iArr[(i40 % i11) + i5]));
                    if (vgVar4 == null) {
                        break;
                    }
                    for (int i41 = vgVar4.f33158a; i41 < vgVar4.f33159b + 1 && i41 < iArr.length; i41++) {
                        if (iArr[(i40 % i11) + i5] != iArr[i41]) {
                            break loop9;
                        }
                        i40++;
                    }
                }
                int i42 = i40 / i11;
                wg wgVar2 = new wg(i5, iMin, i42);
                if (i11 * i42 >= i18) {
                    wgVar = wgVar2;
                }
                strConcat = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                if (wgVar != null) {
                }
                if (!strConcat.isEmpty()) {
                }
            }
        }
        char[] cArr = new char[length];
        dg dgVar3 = this;
        while (dgVar3 != null) {
            String str = dgVar3.f32476d;
            length -= str.length();
            str.getChars(0, str.length(), cArr, length);
            dgVar3 = dgVar3.f32473a;
            if (dgVar3 != null) {
                length -= 4;
                " -> ".getChars(0, 4, cArr, length);
            }
        }
        return new String(cArr);
    }

    public dg(String str, UUID uuid, String str2, yg ygVar) {
        str.getClass();
        this.f32476d = str;
        this.f32473a = null;
        this.f32474b = uuid;
        this.f32475c = str2;
        ygVar.getClass();
        this.f32477e = Thread.currentThread();
    }
}
