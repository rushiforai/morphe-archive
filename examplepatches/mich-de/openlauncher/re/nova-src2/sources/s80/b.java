package s80;

import android.app.Activity;
import android.content.Intent;
import nova.branch.engage.sesame_lite.api_integration.AskPermissionActivity;

/* loaded from: classes5.dex */
public final class b {
    public static Intent a(Activity activity, String[] strArr) {
        Intent intent = new Intent(activity, (Class<?>) AskPermissionActivity.class);
        intent.putExtra("extra_permissions", strArr);
        return intent;
    }
}
