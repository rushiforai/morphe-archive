package androidx.core.view;

import android.content.Context;
import android.os.Handler;
import android.view.GestureDetector;

@Deprecated
/* loaded from: classes2.dex */
public final class GestureDetectorCompat {

    /* renamed from: a, reason: collision with root package name */
    public final GestureDetector f14235a;

    public GestureDetectorCompat(Context context, GestureDetector.OnGestureListener onGestureListener) {
        this(context, onGestureListener, null);
    }

    public GestureDetectorCompat(Context context, GestureDetector.OnGestureListener onGestureListener, Handler handler) {
        this.f14235a = new GestureDetector(context, onGestureListener, handler);
    }
}
