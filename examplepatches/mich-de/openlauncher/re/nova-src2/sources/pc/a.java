package pc;

import android.content.ComponentName;
import android.os.IBinder;

/* loaded from: classes.dex */
public interface a {
    void onIgniteServiceAuthenticated(String str);

    void onIgniteServiceAuthenticationFailed(String str);

    void onIgniteServiceConnected(ComponentName componentName, IBinder iBinder);

    void onIgniteServiceConnectionFailed(String str);

    void onOdtUnsupported();
}
