package k5;

import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import as.d0;

/* loaded from: classes2.dex */
public final /* synthetic */ class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71109a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f5.d f71110b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ GetCredentialException f71111c;

    public /* synthetic */ e(f5.d dVar, GetCredentialException getCredentialException, int i5) {
        this.f71109a = i5;
        this.f71110b = dVar;
        this.f71111c = getCredentialException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f71109a) {
            case 0:
                ((d0) this.f71110b).b(this.f71111c);
                break;
            default:
                Object getCredentialUnknownException = this.f71111c;
                if (getCredentialUnknownException == null) {
                    getCredentialUnknownException = new GetCredentialUnknownException("No provider data returned");
                }
                ((d0) this.f71110b).b(getCredentialUnknownException);
                break;
        }
    }
}
