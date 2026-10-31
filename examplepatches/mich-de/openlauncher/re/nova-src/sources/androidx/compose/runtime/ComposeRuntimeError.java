package androidx.compose.runtime;

import kotlin.Metadata;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0001\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Landroidx/compose/runtime/ComposeRuntimeError;", "Ljava/lang/IllegalStateException;", "Lkotlin/IllegalStateException;", "runtime"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class ComposeRuntimeError extends IllegalStateException {

    /* renamed from: a, reason: collision with root package name */
    public final String f14102a;

    public ComposeRuntimeError(String str) {
        this.f14102a = str;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f14102a;
    }
}
