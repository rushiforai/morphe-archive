package c80;

import java.util.concurrent.atomic.AtomicReferenceArray;
import kotlin.coroutines.CoroutineContext;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import y70.t;

/* loaded from: classes.dex */
public final class l extends t {

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ AtomicReferenceArray f19852e;

    public l(long j11, l lVar, int i5) {
        super(j11, lVar, i5);
        this.f19852e = new AtomicReferenceArray(k.f19851f);
    }

    @Override // y70.t
    public final int g() {
        return k.f19851f;
    }

    @Override // y70.t
    public final void h(int i5, CoroutineContext coroutineContext) {
        this.f19852e.set(i5, k.f19850e);
        i();
    }

    public final String toString() {
        return "SemaphoreSegment[id=" + this.f96826c + ", hashCode=" + hashCode() + AbstractJsonLexerKt.END_LIST;
    }
}
