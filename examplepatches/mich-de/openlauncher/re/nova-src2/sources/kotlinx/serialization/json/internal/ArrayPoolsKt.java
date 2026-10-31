package kotlinx.serialization.json.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Result;
import kotlin.ResultKt;
import r70.i;

@Metadata(d1 = {"\u0000\b\n\u0000\n\u0002\u0010\b\n\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0002"}, d2 = {"MAX_CHARS_IN_POOL", b.f42142b, "kotlinx-serialization-json"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ArrayPoolsKt {
    private static final int MAX_CHARS_IN_POOL;

    static {
        Object objA;
        try {
            int i5 = Result.f71687b;
            String property = System.getProperty("kotlinx.serialization.json.pool.size");
            objA = property != null ? i.u0(property) : null;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Integer num = (Integer) (objA instanceof Result.Failure ? null : objA);
        MAX_CHARS_IN_POOL = num != null ? num.intValue() : 2097152;
    }
}
