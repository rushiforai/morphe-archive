package v20;

import android.content.Intent;
import android.content.res.Resources;

/* loaded from: classes4.dex */
public enum b extends e {
    @Override // v20.e
    public final Intent c() {
        Intent intent = new Intent("android.intent.action.SET_WALLPAPER");
        intent.addCategory("android.intent.category.DEFAULT");
        return intent;
    }

    @Override // v20.e
    public final int d(Resources resources) {
        return w20.e.k(128);
    }
}
