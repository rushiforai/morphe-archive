package ah;

import android.app.Activity;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes3.dex */
public interface c {
    void a();

    void b(Activity activity, Bundle bundle, Bundle bundle2);

    View c(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle);

    void onCreate(Bundle bundle);

    void onDestroy();

    void onLowMemory();

    void onPause();

    void onResume();

    void onSaveInstanceState(Bundle bundle);

    void onStart();

    void onStop();
}
