package t70;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public class v {

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f88868b = AtomicIntegerFieldUpdater.newUpdater(v.class, "_handled$volatile");
    private volatile /* synthetic */ int _handled$volatile;

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f88869a;

    public v(boolean z11, Throwable th2) {
        this.f88869a = th2;
        this._handled$volatile = z11 ? 1 : 0;
    }

    public final String toString() {
        return getClass().getSimpleName() + AbstractJsonLexerKt.BEGIN_LIST + this.f88869a + AbstractJsonLexerKt.END_LIST;
    }
}
