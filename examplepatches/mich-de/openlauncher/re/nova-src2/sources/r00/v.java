package r00;

import android.content.ComponentName;
import com.vungle.ads.internal.protos.Sdk;
import fz.h0;
import kotlin.Unit;
import kotlin.jvm.functions.Function4;

/* loaded from: classes4.dex */
public final class v implements Function4 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85051a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f85052b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f85053c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ mx.f f85054d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ gz.f f85055e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ h0 f85056f;

    public /* synthetic */ v(float f11, float f12, mx.f fVar, gz.f fVar2, h0 h0Var, int i5) {
        this.f85051a = i5;
        this.f85052b = f11;
        this.f85053c = f12;
        this.f85054d = fVar;
        this.f85055e = fVar2;
        this.f85056f = h0Var;
    }

    @Override // kotlin.jvm.functions.Function4
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4) {
        switch (this.f85051a) {
            case 0:
                int iIntValue = ((Number) obj4).intValue() & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE;
                z.f(this.f85052b, this.f85053c, this.f85054d, this.f85055e, this.f85056f, (ComponentName) obj, (String) obj2, (p1.o) obj3, iIntValue);
                break;
            default:
                int iIntValue2 = ((Number) obj4).intValue() & Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE;
                z.f(this.f85052b, this.f85053c, this.f85054d, this.f85055e, this.f85056f, (ComponentName) obj, (String) obj2, (p1.o) obj3, iIntValue2);
                break;
        }
        return Unit.f71706a;
    }
}
