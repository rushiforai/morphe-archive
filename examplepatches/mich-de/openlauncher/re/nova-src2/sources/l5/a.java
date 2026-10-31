package l5;

import androidx.credentials.exceptions.GetCredentialException;
import as.d0;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f74713a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b f74714b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ GetCredentialException f74715c;

    public /* synthetic */ a(b bVar, GetCredentialException getCredentialException, int i5) {
        this.f74713a = i5;
        this.f74714b = bVar;
        this.f74715c = getCredentialException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.f74713a) {
            case 0:
                ((d0) this.f74714b.d()).b(this.f74715c);
                break;
            case 1:
                ((d0) this.f74714b.d()).b(this.f74715c);
                break;
            default:
                ((d0) this.f74714b.d()).b(this.f74715c);
                break;
        }
    }
}
