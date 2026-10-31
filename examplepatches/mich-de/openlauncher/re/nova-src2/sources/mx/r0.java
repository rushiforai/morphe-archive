package mx;

import android.content.ComponentName;
import android.content.Intent;
import android.view.View;
import com.teslacoilsw.launcher.NovaLauncher;

/* loaded from: classes.dex */
public final /* synthetic */ class r0 implements d9.i, ya.w {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ NovaLauncher f77235a;

    public /* synthetic */ r0(NovaLauncher novaLauncher) {
        this.f77235a = novaLauncher;
    }

    @Override // d9.i
    public void d(d9.c cVar) {
        ComponentName componentName = NovaLauncher.f45646r1;
        Intent intent = new Intent("android.settings.HOME_SETTINGS");
        intent.addFlags(268468224);
        this.f77235a.q0(null, intent, null);
    }

    @Override // ya.w
    public boolean k(View view, ga.e eVar) {
        ComponentName componentName = NovaLauncher.f45646r1;
        return eVar.f57289a == this.f77235a.M0;
    }
}
