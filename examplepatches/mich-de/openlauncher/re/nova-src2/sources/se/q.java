package se;

import ke.u;

/* loaded from: classes3.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f87338a;

    /* renamed from: b, reason: collision with root package name */
    public final String f87339b;

    /* renamed from: c, reason: collision with root package name */
    public final u f87340c;

    /* renamed from: d, reason: collision with root package name */
    public final int f87341d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f87342e;

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0029  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public q(boolean z11, String str, int i5, byte[] bArr, int i11, int i12, byte[] bArr2) {
        char c11 = 0;
        int i13 = 1;
        wf.a.e((i5 == 0) ^ (bArr2 == null));
        this.f87338a = z11;
        this.f87339b = str;
        this.f87341d = i5;
        this.f87342e = bArr2;
        if (str != null) {
            switch (str.hashCode()) {
                case 3046605:
                    if (!str.equals("cbc1")) {
                        c11 = 65535;
                        break;
                    }
                    break;
                case 3046671:
                    if (str.equals("cbcs")) {
                        c11 = 1;
                        break;
                    }
                    break;
                case 3049879:
                    if (str.equals("cenc")) {
                        c11 = 2;
                        break;
                    }
                    break;
                case 3049895:
                    if (str.equals("cens")) {
                        c11 = 3;
                        break;
                    }
                    break;
            }
            switch (c11) {
                case 0:
                case 1:
                    i13 = 2;
                    break;
                case 2:
                case 3:
                    break;
                default:
                    wf.a.D("TrackEncryptionBox", "Unsupported protection scheme type '" + str + "'. Assuming AES-CTR crypto mode.");
                    break;
            }
        }
        this.f87340c = new u(i13, i11, i12, bArr);
    }
}
