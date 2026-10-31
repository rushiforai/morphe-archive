package xw;

import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public static final b f96454a = new b();

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable r11) {
        Intrinsics.g(r11, "r");
        r11.run();
    }
}
