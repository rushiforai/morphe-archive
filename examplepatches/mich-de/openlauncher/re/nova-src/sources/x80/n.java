package x80;

import android.view.Window;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import java.util.ArrayList;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95566a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f95567b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f95568c;

    /* renamed from: d, reason: collision with root package name */
    public Object f95569d;

    /* renamed from: e, reason: collision with root package name */
    public Object f95570e;

    public o a() {
        return new o(this.f95567b, this.f95568c, (String[]) this.f95569d, (String[]) this.f95570e);
    }

    public void b(String... cipherSuites) {
        Intrinsics.g(cipherSuites, "cipherSuites");
        if (!this.f95567b) {
            throw new IllegalArgumentException("no cipher suites for cleartext connections");
        }
        if (cipherSuites.length == 0) {
            throw new IllegalArgumentException("At least one cipher suite is required");
        }
        this.f95569d = (String[]) cipherSuites.clone();
    }

    public void c(m... cipherSuites) {
        Intrinsics.g(cipherSuites, "cipherSuites");
        if (!this.f95567b) {
            throw new IllegalArgumentException("no cipher suites for cleartext connections");
        }
        ArrayList arrayList = new ArrayList(cipherSuites.length);
        for (m mVar : cipherSuites) {
            arrayList.add(mVar.f95552a);
        }
        String[] strArr = (String[]) arrayList.toArray(new String[0]);
        b((String[]) Arrays.copyOf(strArr, strArr.length));
    }

    public void d(String... tlsVersions) {
        Intrinsics.g(tlsVersions, "tlsVersions");
        if (!this.f95567b) {
            throw new IllegalArgumentException("no TLS versions for cleartext connections");
        }
        if (tlsVersions.length == 0) {
            throw new IllegalArgumentException("At least one TLS version is required");
        }
        this.f95570e = (String[]) tlsVersions.clone();
    }

    public void e(r0... r0VarArr) {
        if (!this.f95567b) {
            throw new IllegalArgumentException("no TLS versions for cleartext connections");
        }
        ArrayList arrayList = new ArrayList(r0VarArr.length);
        for (r0 r0Var : r0VarArr) {
            arrayList.add(r0Var.f95607a);
        }
        String[] strArr = (String[]) arrayList.toArray(new String[0]);
        d((String[]) Arrays.copyOf(strArr, strArr.length));
    }

    public void f(int i5, int i11) {
        Window window = (Window) this.f95569d;
        int[] iArr = (int[]) this.f95570e;
        if (iArr[i5] == i11) {
            return;
        }
        iArr[i5] = i11;
        int systemUiVisibility = window.getDecorView().getSystemUiVisibility();
        int length = iArr.length;
        int i12 = systemUiVisibility;
        for (int i13 = 0; i13 < length; i13++) {
            int i14 = iArr[i13];
            if (!this.f95567b) {
                i14 &= -5;
            }
            if (!this.f95568c) {
                i14 &= -2;
            }
            if ((i14 & 1) != 0) {
                i12 |= 16;
            } else if ((i14 & 2) != 0) {
                i12 &= -17;
            }
            if ((i14 & 4) != 0) {
                i12 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
            } else if ((i14 & 8) != 0) {
                i12 &= -8193;
            }
        }
        if (i12 != systemUiVisibility) {
            window.getDecorView().setSystemUiVisibility(i12);
        }
    }

    public String toString() {
        switch (this.f95566a) {
            case 1:
                return "mStates=" + Arrays.toString((int[]) this.f95570e);
            default:
                return super.toString();
        }
    }

    public n(Window window) {
        this.f95566a = 1;
        this.f95570e = new int[5];
        this.f95567b = true;
        this.f95568c = true;
        this.f95569d = window;
    }

    public n() {
        this.f95566a = 0;
        this.f95567b = true;
    }
}
