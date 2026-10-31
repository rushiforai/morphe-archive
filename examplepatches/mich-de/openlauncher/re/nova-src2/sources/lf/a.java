package lf;

import java.util.List;

/* loaded from: classes3.dex */
public final class a extends jf.e {

    /* renamed from: m, reason: collision with root package name */
    public final /* synthetic */ int f74879m;
    public final Object n;

    public a(List list) {
        this.f74879m = 0;
        byte[] bArr = (byte[]) list.get(0);
        int length = bArr.length;
        this.n = new h(((bArr[0] & 255) << 8) | (bArr[1] & 255), (bArr[3] & 255) | ((bArr[2] & 255) << 8));
    }

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException
        */
    @Override // jf.e
    public final jf.f f(byte[] r50, int r51, boolean r52) {
        /*
            Method dump skipped, instructions count: 1228
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: lf.a.f(byte[], int, boolean):jf.f");
    }

    public a() {
        this.f74879m = 1;
        this.n = new com.google.android.gms.internal.consent_sdk.a(13, (byte) 0);
    }
}
