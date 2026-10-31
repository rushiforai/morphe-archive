package io.branch.search.internal;

import java.util.ArrayList;
import java.util.List;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;

/* renamed from: io.branch.search.internal.l3, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3243l3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3277n3 f64954a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f64955b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ List<String> f64956c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String[] f64957d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ Long[] f64958e;

    public C3243l3(C3277n3 c3277n3, String str, ArrayList arrayList, String[] strArr, Long[] lArr) {
        this.f64954a = c3277n3;
        this.f64955b = str;
        this.f64956c = arrayList;
        this.f64957d = strArr;
        this.f64958e = lArr;
    }

    public final void a(@NotNull C3159g3 bundleAction) throws Throwable {
        Intrinsics.g(bundleAction, "bundleAction");
        C3277n3 c3277n3 = this.f64954a;
        String sessionId = this.f64955b;
        List<String> errorMessages = this.f64956c;
        c3277n3.getClass();
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(errorMessages, "errorMessages");
        try {
            boolean zB = Intrinsics.b(bundleAction.f64551a, "CREATE");
            a50.b bVar = a50.b.f402c;
            if (zB) {
                C3309p1.a(bVar, "BranchSearchSDK", "Ignore bundle create", (Throwable) null);
                return;
            }
            if (Intrinsics.b(bundleAction.f64551a, "UPDATE")) {
                c3277n3.b(sessionId, bundleAction);
                return;
            }
            if (Intrinsics.b(bundleAction.f64551a, "IMAGE_PRELOAD")) {
                if (c3277n3.f65305c.f63047p) {
                    c3277n3.a(sessionId, bundleAction);
                }
            } else {
                if (Intrinsics.b(bundleAction.f64551a, "DELETE")) {
                    C3309p1.a(bVar, "BranchSearchSDK", "Ignore bundle delete", (Throwable) null);
                    return;
                }
                if (Intrinsics.b(bundleAction.f64551a, "CLEAR_IMAGES")) {
                    D7.Companion.a(c3277n3.f65303a, c3277n3.f65314l).a();
                } else {
                    if (Intrinsics.b(bundleAction.f64551a, "SSML_UPDATE")) {
                        t70.m0.u(EmptyCoroutineContext.f71803a, new C3260m3(bundleAction, c3277n3, sessionId, null));
                        return;
                    }
                    errorMessages.add("Bundle ACTION processing failed (request_id: %s), Unkwown type" + bundleAction.f64551a);
                }
            }
        } catch (Exception e3) {
            errorMessages.add("Bundle ACTION(" + bundleAction.f64551a + ") processing failed (request_id: %s) " + e3.getClass().getSimpleName() + ": " + e3.getMessage());
        }
    }

    public final void a(@Nullable JSONObject jSONObject) {
        Cif cif = this.f64954a.f65313k;
        String string = jSONObject.toString();
        Intrinsics.f(string, "it.toString()");
        cif.a(string);
    }

    public final void a(@NotNull String requestId) {
        Intrinsics.g(requestId, "requestId");
        this.f64957d[0] = requestId;
    }
}
