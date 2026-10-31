package io.branch.search.internal;

import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.q9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3334q9 extends Lambda implements Function1<String, Unit> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3350r9<Object> f65565a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3334q9(C3350r9<Object> c3350r9) {
        super(1);
        this.f65565a = c3350r9;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        String strSubstring;
        String line = (String) obj;
        Intrinsics.g(line, "line");
        int length = line.length();
        int i5 = 0;
        while (true) {
            if (i5 >= length) {
                strSubstring = null;
                break;
            }
            if (line.charAt(i5) != 0) {
                strSubstring = line.substring(i5);
                Intrinsics.f(strSubstring, "this as java.lang.String).substring(startIndex)");
                break;
            }
            i5++;
        }
        if (strSubstring != null && strSubstring.length() != 0) {
            try {
                this.f65565a.a(new JSONObject(strSubstring));
            } catch (JSONException e3) {
                C3309p1.a(EnumC3131e9.Others, "Failure converting line to json for TrackingAnalytics ".concat(this.f65565a.getClass().getSimpleName()), e3);
            }
        }
        return Unit.f71706a;
    }
}
