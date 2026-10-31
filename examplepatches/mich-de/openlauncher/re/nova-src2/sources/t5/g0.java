package t5;

import java.io.File;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class g0 extends Lambda implements Function1 {

    /* renamed from: j, reason: collision with root package name */
    public static final g0 f88589j = new g0(1);

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        File it = (File) obj;
        Intrinsics.g(it, "it");
        String absolutePath = it.getCanonicalFile().getAbsolutePath();
        Intrinsics.f(absolutePath, "file.canonicalFile.absolutePath");
        return new h1(absolutePath);
    }
}
