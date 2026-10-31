package ads_mobile_sdk;

import java.util.concurrent.CancellationException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class s53 extends CancellationException {

    /* renamed from: a, reason: collision with root package name */
    public final String f9421a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s53(String message) {
        super(message);
        Intrinsics.g(message, "message");
        this.f9421a = message;
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return this.f9421a;
    }
}
