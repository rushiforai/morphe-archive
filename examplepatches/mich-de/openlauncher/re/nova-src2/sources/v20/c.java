package v20;

import android.app.Activity;
import android.content.res.Resources;
import com.teslacoilsw.launcher.theme.ThemeListFragment;
import java.util.ArrayList;
import java.util.Collection;

/* loaded from: classes4.dex */
public enum c extends e {
    @Override // v20.e
    public final boolean a() {
        return false;
    }

    @Override // v20.e
    public final Collection b(Activity activity) {
        ArrayList arrayList = new ArrayList();
        Resources resources = activity.getResources();
        arrayList.add(new ThemeListFragment.BuiltInThemeInfo(resources, "com.teslacoilsw.launcher:GALLERY", resources.getString(2132020123), 2131231592, -2, (activity.getResources().getConfiguration().uiMode & 48) == 32));
        return arrayList;
    }

    @Override // v20.e
    public final int d(Resources resources) {
        return w20.e.k(128);
    }

    @Override // v20.e
    public final int g() {
        return -1;
    }
}
