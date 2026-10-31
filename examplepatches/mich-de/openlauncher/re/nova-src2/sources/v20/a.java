package v20;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Resources;
import com.teslacoilsw.launcher.theme.ThemeListFragment;
import e10.y2;
import java.util.ArrayList;
import java.util.Collection;

/* loaded from: classes4.dex */
public enum a extends e {
    @Override // v20.e
    public final Collection b(Activity activity) {
        ArrayList arrayList = new ArrayList();
        boolean z11 = (activity.getResources().getConfiguration().uiMode & 48) == 32;
        Resources resources = activity.getResources();
        arrayList.add(new ThemeListFragment.BuiltInThemeInfo(resources, "com.teslacoilsw.launcher", resources.getString(2132017589), 2131231593, -2, z11));
        arrayList.add(new ThemeListFragment.BuiltInThemeInfo(resources, "com.teslacoilsw.launcher:GALLERY", resources.getString(2132020123), 2131231592, -1, z11));
        return arrayList;
    }

    @Override // v20.e
    public final Intent c() {
        Intent intent = new Intent("com.novalauncher.THEME");
        intent.addCategory("com.novalauncher.category.CUSTOM_ICON_PICKER");
        return intent;
    }

    @Override // v20.e
    public final int d(Resources resources) {
        return y2.f51877a.D0(resources);
    }
}
