package w20;

import android.app.Activity;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;

/* loaded from: classes4.dex */
public abstract class a extends Activity {

    /* renamed from: a, reason: collision with root package name */
    public int f93649a = 0;

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        int i5 = m.s.f75339b;
        Resources resources = getResources();
        Configuration configuration = resources.getConfiguration();
        int i11 = configuration.uiMode;
        int i12 = i11 & 48;
        int i13 = i5 == 2 ? 32 : 16;
        if (i12 != i13) {
            configuration.uiMode = i13 | (i11 & (-49));
            resources.updateConfiguration(configuration, null);
            if (this.f93649a != 0) {
                onApplyThemeResource(getTheme(), this.f93649a, false);
            }
        }
        super.onCreate(bundle);
    }

    @Override // android.app.Activity, android.view.ContextThemeWrapper, android.content.ContextWrapper, android.content.Context
    public final void setTheme(int i5) {
        super.setTheme(i5);
        this.f93649a = i5;
    }
}
