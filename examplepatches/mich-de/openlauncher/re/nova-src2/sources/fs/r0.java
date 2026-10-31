package fs;

import android.content.Context;
import android.content.SharedPreferences;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r0 {

    /* renamed from: a, reason: collision with root package name */
    public final a70.d f55825a;

    public r0(Context context) {
        Intrinsics.g(context, "context");
        this.f55825a = LazyKt.a(new ar.c(context, 26));
    }

    public final void a() {
        Object value = this.f55825a.getValue();
        Intrinsics.f(value, "getValue(...)");
        SharedPreferences.Editor editorEdit = ((SharedPreferences) value).edit();
        editorEdit.putBoolean("has_used_link", true);
        editorEdit.apply();
    }
}
