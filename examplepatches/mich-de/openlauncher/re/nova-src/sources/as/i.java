package as;

import java.util.concurrent.Executor;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i implements Executor {

    /* renamed from: a, reason: collision with root package name */
    public static final i f15610a = new i();

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable r11) {
        Intrinsics.g(r11, "r");
        r11.run();
    }
}
