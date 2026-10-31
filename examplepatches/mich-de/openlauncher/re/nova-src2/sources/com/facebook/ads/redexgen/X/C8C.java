package com.facebook.ads.redexgen.X;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.nio.ByteBuffer;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.8C, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C8C extends T0<C8B, C8A, C1135Oj> implements InterfaceC1136Ok {
    public static byte[] A01;
    public static String[] A02 = {b.f42142b, "gGSdFUM", "pTuPknSzHhJ41CPeJIuomtRyuFWNs0rA", "2dFfiShNQYozO0IlKmgLljuyDbeVNJIl", "rbG97PpvbS7KOMw2r9z0YNOlXZgVaX3C", "foHth", "MMLkaVeMnd11biFBAIsiAHJ7RN7PAK7F", "OuQeCiSZWfzD1FGRDImaeFtowvQzRLuy"};
    public final String A00;

    public static String A0L(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 23);
            if (A02[4].charAt(14) != 'w') {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[0] = b.f42142b;
            strArr[1] = "8DfgztD";
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0M() {
        A01 = new byte[]{86, 109, 102, 123, 115, 102, 96, 119, 102, 103, 35, 103, 102, 96, 108, 103, 102, 35, 102, 113, 113, 108, 113};
    }

    public abstract InterfaceC1506bV A0g(byte[] bArr, int i5, boolean z11) throws C1135Oj;

    static {
        A0M();
    }

    public C8C(String str) {
        super(new C8B[2], new C8A[2]);
        this.A00 = str;
        A0d(1024);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r0v0, types: [com.facebook.ads.redexgen.X.49] */
    @Override // com.facebook.ads.redexgen.X.T0
    /* renamed from: A0H, reason: merged with bridge method [inline-methods] */
    public final AnonymousClass49 A0c() {
        return new C8A(this) { // from class: com.facebook.ads.redexgen.X.49
            public final C8C A00;

            {
                this.A00 = this;
            }

            @Override // com.facebook.ads.redexgen.X.C8A, com.facebook.ads.redexgen.X.T1
            public final void A0B() {
                this.A00.A0h(this);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.T0
    /* renamed from: A0I, reason: merged with bridge method [inline-methods] */
    public final C1135Oj A0Y(C8B c8b, C8A c8a, boolean z11) {
        try {
            ByteBuffer inputData = (ByteBuffer) AbstractC1062Ln.A01(c8b.A02);
            c8a.A0C(c8b.A01, A0g(inputData.array(), inputData.limit(), z11), c8b.A00);
            c8a.A01(Integer.MIN_VALUE);
            return null;
        } catch (C1135Oj e3) {
            if (A02[5].length() == 15) {
                throw new RuntimeException();
            }
            A02[5] = "YlVeuvKnXQV";
            return e3;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.T0
    /* renamed from: A0J, reason: merged with bridge method [inline-methods] */
    public final C1135Oj A0Z(Throwable th2) {
        return new C1135Oj(A0L(0, 23, 20), th2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // com.facebook.ads.redexgen.X.T0
    /* renamed from: A0K, reason: merged with bridge method [inline-methods] */
    public final C8B A0a() {
        return new C8B();
    }

    public final void A0h(C8A c8a) {
        super.A0f(c8a);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1136Ok
    public final void AKz(long j11) {
    }
}
