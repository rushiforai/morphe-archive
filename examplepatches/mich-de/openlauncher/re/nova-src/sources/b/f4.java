package b;

import android.content.res.Configuration;
import com.google.android.libraries.ads.mobile.sdk.common.AdActivity;
import kotlin.Unit;
import kotlin.coroutines.Continuation;

/* loaded from: classes2.dex */
public interface f4 {
    default Object a(ni.s sVar, Continuation continuation) {
        return Unit.f71706a;
    }

    void a(AdActivity adActivity);

    default void a$1() {
    }

    default void b() {
    }

    default void c() {
    }

    default void e() {
    }

    default void onConfigurationChanged(Configuration configuration) {
    }

    void onDestroy();

    default void onPause() {
    }

    default void onResume() {
    }

    default void onStop() {
    }
}
