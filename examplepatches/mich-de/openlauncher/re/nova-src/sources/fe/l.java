package fe;

import android.util.Base64;

/* loaded from: classes3.dex */
public final /* synthetic */ class l implements vk.u {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f54905a = 1;

    @Override // vk.u
    public final Object get() {
        switch (this.f54905a) {
            case 0:
                return new h();
            default:
                byte[] bArr = new byte[12];
                ge.h.f57410h.nextBytes(bArr);
                return Base64.encodeToString(bArr, 10);
        }
    }
}
