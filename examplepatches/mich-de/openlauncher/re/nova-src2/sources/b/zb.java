package b;

import ads_mobile_sdk.ts1;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes.dex */
public final class zb implements m3 {

    /* renamed from: a, reason: collision with root package name */
    public final m3 f16041a;

    /* renamed from: b, reason: collision with root package name */
    public final m3 f16042b;

    /* renamed from: c, reason: collision with root package name */
    public final Lambda f16043c;

    /* JADX WARN: Multi-variable type inference failed */
    public zb(m3 multiFormatAdRendererMap, m3 rendererMap, Function1 function1) {
        Intrinsics.g(multiFormatAdRendererMap, "multiFormatAdRendererMap");
        Intrinsics.g(rendererMap, "rendererMap");
        this.f16041a = multiFormatAdRendererMap;
        this.f16042b = rendererMap;
        this.f16043c = (Lambda) function1;
    }

    @Override // b.m3
    public final b a(String name) {
        Intrinsics.g(name, "name");
        b bVarA = this.f16042b.a(name);
        if (bVarA != null) {
            return new ts1(bVarA, this);
        }
        m3 m3Var = this.f16041a;
        if (m3Var.a(name) != null) {
            return m3Var.a(name);
        }
        return null;
    }
}
