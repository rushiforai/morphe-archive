package z80;

import java.io.IOException;
import kotlin.Unit;
import m90.o;

/* loaded from: classes5.dex */
public final class c extends o {

    /* renamed from: b, reason: collision with root package name */
    public boolean f98308b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ f f98309c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ d f98310d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(m90.d dVar, f fVar, d dVar2) {
        super(dVar);
        this.f98309c = fVar;
        this.f98310d = dVar2;
    }

    @Override // m90.o, java.io.Closeable, java.lang.AutoCloseable
    public final void close() throws IOException {
        super.close();
        if (this.f98308b) {
            return;
        }
        this.f98308b = true;
        f fVar = this.f98309c;
        d dVar = this.f98310d;
        synchronized (fVar) {
            try {
                int i5 = dVar.f98318h - 1;
                dVar.f98318h = i5;
                if (i5 == 0 && dVar.f98316f) {
                    fVar.A(dVar);
                }
                Unit unit = Unit.f71706a;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
