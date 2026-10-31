package eb0;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.Executor;

/* loaded from: classes5.dex */
public final class c extends a {
    public c() {
        super(false, 6);
    }

    @Override // eb0.a
    public final List a(Executor executor) {
        return Arrays.asList(new k(), new o(executor));
    }

    @Override // eb0.a
    public final List b() {
        return Collections.singletonList(new b(1));
    }
}
