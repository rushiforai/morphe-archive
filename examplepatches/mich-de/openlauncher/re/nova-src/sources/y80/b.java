package y80;

import java.util.concurrent.ThreadFactory;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class b implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f96851a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f96852b;

    public /* synthetic */ b(String str, boolean z11) {
        this.f96851a = str;
        this.f96852b = z11;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        String name = this.f96851a;
        Intrinsics.g(name, "$name");
        Thread thread = new Thread(runnable, name);
        thread.setDaemon(this.f96852b);
        return thread;
    }
}
