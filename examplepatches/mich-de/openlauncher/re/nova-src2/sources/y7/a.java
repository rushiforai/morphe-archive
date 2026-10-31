package y7;

import android.app.Application;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f96734a = new a();

    @NotNull
    public final String a() {
        String processName = Application.getProcessName();
        Intrinsics.f(processName, "getProcessName()");
        return processName;
    }
}
