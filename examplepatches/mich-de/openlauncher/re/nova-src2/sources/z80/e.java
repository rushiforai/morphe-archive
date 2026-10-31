package z80;

import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;
import m90.j0;

/* loaded from: classes5.dex */
public final class e implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final String f98321a;

    /* renamed from: b, reason: collision with root package name */
    public final long f98322b;

    /* renamed from: c, reason: collision with root package name */
    public final ArrayList f98323c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f f98324d;

    public e(f fVar, String key, long j11, ArrayList arrayList, long[] lengths) {
        Intrinsics.g(key, "key");
        Intrinsics.g(lengths, "lengths");
        this.f98324d = fVar;
        this.f98321a = key;
        this.f98322b = j11;
        this.f98323c = arrayList;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        Iterator it = this.f98323c.iterator();
        while (it.hasNext()) {
            y80.c.c((j0) it.next());
        }
    }
}
