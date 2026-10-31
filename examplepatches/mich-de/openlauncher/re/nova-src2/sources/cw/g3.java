package cw;

import android.util.Log;
import com.stripe.android.ui.core.elements.SharedDataSpec;
import java.util.List;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.json.Json;
import kotlinx.serialization.json.JsonKt;

/* loaded from: classes4.dex */
public abstract class g3 {

    /* renamed from: a, reason: collision with root package name */
    public static final Json f48154a = JsonKt.Json$default(null, new cv.n(16), 1, null);

    public static Object a(String str) {
        Object objA;
        Intrinsics.g(str, "str");
        try {
            int i5 = Result.f71687b;
            objA = (List) f48154a.decodeFromString(new ArrayListSerializer(SharedDataSpec.Companion.serializer()), str);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Throwable thA = Result.a(objA);
        if (thA != null) {
            Log.w("STRIPE", "Error parsing LPMs", thA);
        }
        return objA;
    }
}
