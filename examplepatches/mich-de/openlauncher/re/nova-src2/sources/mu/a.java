package mu;

import com.stripe.android.model.ElementsSession;
import ft.v;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f76814a = new a();

    public static b a(ElementsSession elementsSession) throws ClassNotFoundException {
        boolean z11;
        if (elementsSession != null ? Intrinsics.b(elementsSession.f43391f.get(v.f56054c), Boolean.TRUE) : false) {
            if (!(elementsSession != null ? Intrinsics.b(elementsSession.f43391f.get(v.f56053b), Boolean.TRUE) : false)) {
                return b.f76816b;
            }
        }
        try {
            Class.forName("com.stripe.android.financialconnections.FinancialConnectionsSheet");
            z11 = true;
        } catch (Exception unused) {
            z11 = false;
        }
        if (z11) {
            return b.f76815a;
        }
        if (elementsSession != null ? Intrinsics.b(elementsSession.f43391f.get(v.f56053b), Boolean.TRUE) : false) {
            return null;
        }
        return b.f76816b;
    }
}
