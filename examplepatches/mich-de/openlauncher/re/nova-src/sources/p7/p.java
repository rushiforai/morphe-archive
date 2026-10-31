package p7;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public abstract class p {

    /* renamed from: a, reason: collision with root package name */
    public static final String f82365a;

    /* renamed from: b, reason: collision with root package name */
    public static final String[] f82366b;

    static {
        String strE = o7.r.e("WrkDbPathHelper");
        Intrinsics.f(strE, "tagWithPrefix(\"WrkDbPathHelper\")");
        f82365a = strE;
        f82366b = new String[]{"-journal", "-shm", "-wal"};
    }
}
