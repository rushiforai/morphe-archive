package r10;

import android.net.Uri;
import android.view.View;
import com.teslacoilsw.launcher.NovaLauncher;

/* loaded from: classes.dex */
public abstract class o1 {

    /* renamed from: a, reason: collision with root package name */
    public final String f85198a;

    /* renamed from: b, reason: collision with root package name */
    public final Uri f85199b;

    /* renamed from: c, reason: collision with root package name */
    public final pp.b0 f85200c;

    public o1(String str, Uri uri, pp.b0 b0Var) {
        this.f85198a = str;
        this.f85199b = uri;
        this.f85200c = b0Var;
    }

    public abstract void a(NovaLauncher novaLauncher, View view);

    public String toString() {
        return "SearchAction(" + this.f85198a + ", " + this.f85199b + ")";
    }
}
