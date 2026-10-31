package p8;

import java.io.Closeable;
import kotlin.Unit;
import kotlin.text.Regex;

/* loaded from: classes2.dex */
public final class b implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    public final a f82429a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f82430b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ d f82431c;

    public b(d dVar, a aVar) {
        this.f82431c = dVar;
        this.f82429a = aVar;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        if (this.f82430b) {
            return;
        }
        this.f82430b = true;
        d dVar = this.f82431c;
        synchronized (dVar) {
            try {
                a aVar = this.f82429a;
                int i5 = aVar.f82427h - 1;
                aVar.f82427h = i5;
                if (i5 == 0 && aVar.f82425f) {
                    Regex regex = d.f82433q;
                    dVar.s(aVar);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
