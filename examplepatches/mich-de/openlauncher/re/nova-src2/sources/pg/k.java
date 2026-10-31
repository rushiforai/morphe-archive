package pg;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.Callable;
import sg.w;

/* loaded from: classes3.dex */
public final /* synthetic */ class k implements Callable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ boolean f82578a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f82579b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ j f82580c;

    public /* synthetic */ k(boolean z11, String str, j jVar) {
        this.f82578a = z11;
        this.f82579b = str;
        this.f82580c = jVar;
    }

    @Override // java.util.concurrent.Callable
    public final Object call() throws NoSuchAlgorithmException {
        MessageDigest messageDigest;
        int i5 = 0;
        boolean z11 = this.f82578a;
        String str = this.f82579b;
        j jVar = this.f82580c;
        String str2 = (z11 || !m.b(str, jVar, true, false).f82591a) ? "not allowed" : "debug cert rejected";
        while (true) {
            if (i5 >= 2) {
                messageDigest = null;
                break;
            }
            try {
                messageDigest = MessageDigest.getInstance("SHA-256");
            } catch (NoSuchAlgorithmException unused) {
            }
            if (messageDigest != null) {
                break;
            }
            i5++;
        }
        w.h(messageDigest);
        return str2 + ": pkg=" + str + ", sha256=" + xg.b.a(messageDigest.digest(jVar.f82577l)) + ", atk=" + z11 + ", ver=12451000.false";
    }
}
