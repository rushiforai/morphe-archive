package a2;

import com.google.android.gms.internal.measurement.k2;
import com.google.firebase.crashlytics.internal.concurrency.CrashlyticsWorkers;
import com.moloco.sdk.internal.services.bidtoken.A;
import com.moloco.sdk.internal.services.bidtoken.providers.l;
import com.moloco.sdk.publisher.Moloco;
import com.moloco.sdk.service_locator.a;
import kotlin.jvm.functions.Function0;
import p1.z2;
import z1.v;

/* loaded from: classes.dex */
public final /* synthetic */ class k implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f114a;

    public /* synthetic */ k(int i5) {
        this.f114a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f114a) {
            case 0:
                z2 z2Var = l.f115a;
                return null;
            case 1:
                throw new IllegalStateException("No SnackbarHostState provided");
            case 2:
                v vVar = new v(new a00.a(12));
                vVar.e();
                return vVar;
            case 3:
                return new s50.d();
            case 4:
                return CrashlyticsWorkers.Companion.checkBackgroundThread$lambda$2();
            case 5:
                return CrashlyticsWorkers.Companion.checkNotMainThread$lambda$0();
            case 6:
                return com.moloco.sdk.acm.services.e.g();
            case 7:
                return A.a();
            case 8:
                return com.moloco.sdk.internal.services.bidtoken.n.b();
            case 9:
                return l.a.b();
            case 10:
                return com.moloco.sdk.internal.services.encryption.b.f();
            case 11:
                return com.moloco.sdk.internal.services.encryption.b.e();
            case 12:
                return com.moloco.sdk.internal.services.encryption.b.d();
            case 13:
                return com.moloco.sdk.internal.services.encryption.b.c();
            case 14:
                return com.moloco.sdk.internal.services.encryption.b.g();
            case 15:
                return Moloco.initializationHandler_delegate$lambda$7();
            case 16:
                return Moloco.bidTokenHandler_delegate$lambda$8();
            case 17:
                return Moloco.adCreator_delegate$lambda$9();
            case 18:
                return k2.s();
            case 19:
                return a.b.a();
            case 20:
                return a.b.j();
            case 21:
                return a.b.b();
            case 22:
                return a.b.c();
            case 23:
                return a.b.i();
            case 24:
                return a.c.a();
            case 25:
                return a.d.a();
            case 26:
                return a.e.b();
            case 27:
                return a.e.f();
            case 28:
                return a.e.c();
            default:
                return a.e.n();
        }
    }
}
