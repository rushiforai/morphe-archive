package com.google.android.gms.internal.measurement;

import com.amplitude.core.events.Identify;

/* loaded from: classes3.dex */
public enum di {
    /* JADX INFO: Fake field, exist only in values array */
    STRING('s', 1, "-#", true),
    /* JADX INFO: Fake field, exist only in values array */
    BOOLEAN('b', 2, Identify.UNSET_VALUE, true),
    /* JADX INFO: Fake field, exist only in values array */
    CHAR('c', 3, Identify.UNSET_VALUE, true),
    /* JADX INFO: Fake field, exist only in values array */
    DECIMAL('d', 4, "-0+ ,(", false),
    /* JADX INFO: Fake field, exist only in values array */
    OCTAL('o', 4, "-#0(", false),
    HEX('x', 4, "-#0(", true),
    /* JADX INFO: Fake field, exist only in values array */
    FLOAT('f', 5, "-#0+ ,(", false),
    /* JADX INFO: Fake field, exist only in values array */
    EXPONENT('e', 5, "-#0+ (", true),
    /* JADX INFO: Fake field, exist only in values array */
    GENERAL('g', 5, "-0+ ,(", true),
    /* JADX INFO: Fake field, exist only in values array */
    EXPONENT_HEX('a', 5, "-#0+ ", true);


    /* renamed from: f, reason: collision with root package name */
    public static final di[] f32480f = new di[26];

    /* renamed from: a, reason: collision with root package name */
    public final char f32482a;

    /* renamed from: b, reason: collision with root package name */
    public final int f32483b;

    /* renamed from: c, reason: collision with root package name */
    public final int f32484c;

    /* renamed from: d, reason: collision with root package name */
    public final String f32485d;

    /*  JADX ERROR: NullPointerException in pass: LoopRegionVisitor
        java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.SSAVar.use(jadx.core.dex.instructions.args.RegisterArg)" because "ssaVar" is null
        	at jadx.core.dex.nodes.InsnNode.rebindArgs(InsnNode.java:493)
        	at jadx.core.dex.nodes.InsnNode.rebindArgs(InsnNode.java:496)
        */
    static {
        /*
            com.google.android.gms.internal.measurement.di r0 = new com.google.android.gms.internal.measurement.di
            r3 = 115(0x73, float:1.61E-43)
            r6 = 1
            java.lang.String r1 = "STRING"
            r2 = 0
            r4 = 1
            java.lang.String r5 = "-#"
            r0.<init>(r3, r4, r5, r6)
            com.google.android.gms.internal.measurement.di r1 = new com.google.android.gms.internal.measurement.di
            r4 = 98
            r7 = 1
            java.lang.String r2 = "BOOLEAN"
            r3 = 1
            r5 = 2
            java.lang.String r6 = "-"
            r1.<init>(r4, r5, r6, r7)
            com.google.android.gms.internal.measurement.di r2 = new com.google.android.gms.internal.measurement.di
            r5 = 99
            r8 = 1
            java.lang.String r3 = "CHAR"
            r4 = 2
            r6 = 3
            java.lang.String r7 = "-"
            r2.<init>(r5, r6, r7, r8)
            com.google.android.gms.internal.measurement.di r3 = new com.google.android.gms.internal.measurement.di
            r6 = 100
            r9 = 0
            java.lang.String r4 = "DECIMAL"
            r5 = 3
            r14 = 4
            java.lang.String r8 = "-0+ ,("
            r7 = r14
            r3.<init>(r6, r7, r8, r9)
            com.google.android.gms.internal.measurement.di r4 = new com.google.android.gms.internal.measurement.di
            r13 = 111(0x6f, float:1.56E-43)
            r16 = 0
            java.lang.String r11 = "OCTAL"
            r12 = 4
            java.lang.String r15 = "-#0("
            r10 = r4
            r10.<init>(r13, r14, r15, r16)
            com.google.android.gms.internal.measurement.di r5 = new com.google.android.gms.internal.measurement.di
            r13 = 120(0x78, float:1.68E-43)
            r16 = 1
            java.lang.String r11 = "HEX"
            r12 = 5
            java.lang.String r15 = "-#0("
            r10 = r5
            r10.<init>(r13, r14, r15, r16)
            com.google.android.gms.internal.measurement.di.HEX = r5
            com.google.android.gms.internal.measurement.di r6 = new com.google.android.gms.internal.measurement.di
            r9 = 102(0x66, float:1.43E-43)
            r12 = 0
            java.lang.String r7 = "FLOAT"
            r8 = 6
            r17 = 5
            java.lang.String r11 = "-#0+ ,("
            r10 = r17
            r6.<init>(r9, r10, r11, r12)
            com.google.android.gms.internal.measurement.di r7 = new com.google.android.gms.internal.measurement.di
            r16 = 101(0x65, float:1.42E-43)
            r19 = 1
            java.lang.String r14 = "EXPONENT"
            r15 = 7
            java.lang.String r18 = "-#0+ ("
            r13 = r7
            r13.<init>(r16, r17, r18, r19)
            com.google.android.gms.internal.measurement.di r8 = new com.google.android.gms.internal.measurement.di
            r16 = 103(0x67, float:1.44E-43)
            java.lang.String r14 = "GENERAL"
            r15 = 8
            java.lang.String r18 = "-0+ ,("
            r13 = r8
            r13.<init>(r16, r17, r18, r19)
            com.google.android.gms.internal.measurement.di r9 = new com.google.android.gms.internal.measurement.di
            r16 = 97
            java.lang.String r14 = "EXPONENT_HEX"
            r15 = 9
            java.lang.String r18 = "-#0+ "
            r13 = r9
            r13.<init>(r16, r17, r18, r19)
            com.google.android.gms.internal.measurement.di[] r0 = new com.google.android.gms.internal.measurement.di[]{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9}
            com.google.android.gms.internal.measurement.di.f32481g = r0
            r0 = 26
            com.google.android.gms.internal.measurement.di[] r0 = new com.google.android.gms.internal.measurement.di[r0]
            com.google.android.gms.internal.measurement.di.f32480f = r0
            com.google.android.gms.internal.measurement.di[] r0 = values()
            int r1 = r0.length
            r2 = 0
        La7:
            if (r2 >= r1) goto Lb8
            r3 = r0[r2]
            char r4 = r3.f32482a
            r4 = r4 | 32
            int r4 = r4 + (-97)
            com.google.android.gms.internal.measurement.di[] r5 = com.google.android.gms.internal.measurement.di.f32480f
            r5[r4] = r3
            int r2 = r2 + 1
            goto La7
        Lb8:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.measurement.di.<clinit>():void");
    }

    di(char c11, int i5, String str, boolean z11) {
        this.f32482a = c11;
        this.f32483b = i5;
        ei eiVar = ei.f32515e;
        int i11 = true != z11 ? 0 : 128;
        for (int i12 = 0; i12 < str.length(); i12++) {
            int iCharAt = ((int) ((ei.f32514d >>> ((str.charAt(i12) - ' ') * 3)) & 7)) - 1;
            if (iCharAt < 0) {
                throw new IllegalArgumentException("invalid flags: ".concat(str));
            }
            i11 |= 1 << iCharAt;
        }
        this.f32484c = i11;
        this.f32485d = h6.c1.t(new StringBuilder(String.valueOf(c11).length() + 1), "%", c11);
    }
}
