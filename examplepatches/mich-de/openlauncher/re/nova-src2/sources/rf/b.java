package rf;

import java.util.Collections;
import java.util.List;
import jf.f;

/* loaded from: classes3.dex */
public final class b implements f {

    /* renamed from: b, reason: collision with root package name */
    public static final b f85850b = new b();

    /* renamed from: a, reason: collision with root package name */
    public final List f85851a;

    public b(jf.b bVar) {
        this.f85851a = Collections.singletonList(bVar);
    }

    @Override // jf.f
    public final int a(long j11) {
        return j11 < 0 ? 0 : -1;
    }

    @Override // jf.f
    public final List h(long j11) {
        return j11 >= 0 ? this.f85851a : Collections.EMPTY_LIST;
    }

    @Override // jf.f
    public final long p(int i5) {
        wf.a.e(i5 == 0);
        return 0L;
    }

    @Override // jf.f
    public final int r() {
        return 1;
    }

    public b() {
        this.f85851a = Collections.EMPTY_LIST;
    }
}
