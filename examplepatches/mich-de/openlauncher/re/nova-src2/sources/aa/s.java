package aa;

import com.instabridge.mobilesdk.internal.auth.RequestSigner;
import java.util.function.Supplier;

/* loaded from: classes2.dex */
public final /* synthetic */ class s implements Supplier {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f653a;

    public /* synthetic */ s(int i5) {
        this.f653a = i5;
    }

    @Override // java.util.function.Supplier
    public final Object get() {
        switch (this.f653a) {
            case 0:
                return null;
            default:
                return RequestSigner.rfc1123Format$lambda$6();
        }
    }
}
