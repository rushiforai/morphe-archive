package io.branch.search.internal;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class O extends Lambda implements Function1<JSONObject, Boolean> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f62998a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public O(String str) {
        super(1);
        this.f62998a = str;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        JSONObject it = (JSONObject) obj;
        Intrinsics.g(it, "it");
        return Boolean.valueOf(Intrinsics.b(it.opt("request_id"), this.f62998a));
    }
}
