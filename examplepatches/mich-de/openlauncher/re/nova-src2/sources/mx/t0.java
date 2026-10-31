package mx;

import android.content.ComponentName;
import android.view.View;
import com.teslacoilsw.launcher.NovaLauncher;

/* loaded from: classes.dex */
public final /* synthetic */ class t0 implements ya.w, ya.k {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77243a;

    public /* synthetic */ t0(int i5) {
        this.f77243a = i5;
    }

    @Override // ya.k
    public int apply(int i5) {
        return i5 & (~this.f77243a);
    }

    @Override // ya.w
    public boolean k(View view, ga.e eVar) {
        ComponentName componentName = NovaLauncher.f45646r1;
        return eVar.f57289a == this.f77243a;
    }
}
