package w5;

import android.content.SharedPreferences;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final SharedPreferences f93765a;

    /* renamed from: b, reason: collision with root package name */
    public final Set f93766b;

    public e(SharedPreferences prefs, Set set) {
        Intrinsics.g(prefs, "prefs");
        this.f93765a = prefs;
        this.f93766b = set;
    }
}
