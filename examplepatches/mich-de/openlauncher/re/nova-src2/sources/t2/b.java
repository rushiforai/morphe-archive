package t2;

import android.view.KeyEvent;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final KeyEvent f88474a;

    public /* synthetic */ b(KeyEvent keyEvent) {
        this.f88474a = keyEvent;
    }

    public static final /* synthetic */ b a(KeyEvent keyEvent) {
        return new b(keyEvent);
    }

    public final /* synthetic */ KeyEvent b() {
        return this.f88474a;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof b) {
            return Intrinsics.b(this.f88474a, ((b) obj).f88474a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f88474a.hashCode();
    }

    public final String toString() {
        return "KeyEvent(nativeKeyEvent=" + this.f88474a + ')';
    }
}
