package py;

import android.content.res.Configuration;
import android.content.res.Resources;
import android.view.ContextThemeWrapper;
import b.c0;
import com.teslacoilsw.launcher.NovaLauncher;

/* loaded from: classes.dex */
public final class a extends ContextThemeWrapper {

    /* renamed from: a, reason: collision with root package name */
    public final int f83126a;

    /* renamed from: b, reason: collision with root package name */
    public final NovaLauncher f83127b;

    public a(NovaLauncher novaLauncher, int i5) {
        super(novaLauncher.getBaseContext(), i5);
        this.f83127b = novaLauncher;
        this.f83126a = i5;
    }

    public final void a(int i5) {
        if (i5 == -1) {
            b(0);
        } else if (i5 == 1) {
            b(16);
            return;
        } else if (i5 == 2) {
            b(32);
            return;
        }
        throw new IllegalStateException(c0.h(i5, "Invalid AppCompatNightMode "));
    }

    public final void b(int i5) {
        Resources resources = getResources();
        Configuration configuration = resources.getConfiguration();
        configuration.uiMode = i5 | (configuration.uiMode & (-49));
        resources.updateConfiguration(configuration, null);
        onApplyThemeResource(getTheme(), this.f83126a, false);
    }

    @Override // android.view.ContextThemeWrapper, android.content.ContextWrapper, android.content.Context
    public final void setTheme(int i5) {
        throw new IllegalAccessError("DayNightContextWrapper does not support setTheme");
    }
}
