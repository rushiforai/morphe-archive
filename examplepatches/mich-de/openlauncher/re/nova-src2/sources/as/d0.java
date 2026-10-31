package as;

import androidx.credentials.exceptions.GetCredentialException;
import c0.g2;
import com.google.android.gms.tasks.Task;
import com.google.android.libraries.places.api.net.FetchPlaceResponse;
import eb0.p0;
import java.io.IOException;
import kotlin.KotlinNullPointerException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import retrofit2.HttpException;
import x80.m0;

/* loaded from: classes4.dex */
public final /* synthetic */ class d0 implements fi.e, eb0.g, ni.g, f5.d, x80.j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15587a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ t70.m f15588b;

    public /* synthetic */ d0(int i5, t70.m mVar) {
        this.f15587a = i5;
        this.f15588b = mVar;
    }

    @Override // eb0.g
    public void a(eb0.d dVar, p0 p0Var) {
        int i5 = this.f15587a;
        t70.m mVar = this.f15588b;
        switch (i5) {
            case 1:
                if (!p0Var.f52631a.c()) {
                    int i11 = Result.f71687b;
                    mVar.resumeWith(ResultKt.a(new HttpException(p0Var)));
                    break;
                } else {
                    Object obj = p0Var.f52632b;
                    if (obj != null) {
                        int i12 = Result.f71687b;
                        mVar.resumeWith(obj);
                        break;
                    } else {
                        Object objCast = eb0.s.class.cast(dVar.S().f95513e.get(eb0.s.class));
                        Intrinsics.d(objCast);
                        eb0.s sVar = (eb0.s) objCast;
                        KotlinNullPointerException kotlinNullPointerException = new KotlinNullPointerException("Response from " + sVar.f52642a.getName() + '.' + sVar.f52644c.getName() + " was null but response body type was declared as non-null");
                        int i13 = Result.f71687b;
                        mVar.resumeWith(ResultKt.a(kotlinNullPointerException));
                        break;
                    }
                }
            case 2:
                if (!p0Var.f52631a.c()) {
                    int i14 = Result.f71687b;
                    mVar.resumeWith(ResultKt.a(new HttpException(p0Var)));
                    break;
                } else {
                    int i15 = Result.f71687b;
                    mVar.resumeWith(p0Var.f52632b);
                    break;
                }
            default:
                int i16 = Result.f71687b;
                mVar.resumeWith(p0Var);
                break;
        }
    }

    public void b(Object obj) {
        GetCredentialException e3 = (GetCredentialException) obj;
        Intrinsics.g(e3, "e");
        t70.m mVar = this.f15588b;
        if (mVar.b()) {
            int i5 = Result.f71687b;
            mVar.resumeWith(ResultKt.a(e3));
        }
    }

    public void c(Object obj) {
        f5.m result = (f5.m) obj;
        Intrinsics.g(result, "result");
        t70.m mVar = this.f15588b;
        if (mVar.b()) {
            int i5 = Result.f71687b;
            mVar.resumeWith(result);
        }
    }

    @Override // eb0.g
    public void e(eb0.d dVar, Throwable th2) {
        int i5 = this.f15587a;
        t70.m mVar = this.f15588b;
        switch (i5) {
            case 1:
                int i11 = Result.f71687b;
                mVar.resumeWith(ResultKt.a(th2));
                break;
            case 2:
                int i12 = Result.f71687b;
                mVar.resumeWith(ResultKt.a(th2));
                break;
            default:
                int i13 = Result.f71687b;
                mVar.resumeWith(ResultKt.a(th2));
                break;
        }
    }

    @Override // ni.g
    public void onAdFailedToLoad(ni.v vVar) {
        int i5 = this.f15587a;
        t70.m mVar = this.f15588b;
        switch (i5) {
            case 4:
                if (mVar.b()) {
                    int i11 = Result.f71687b;
                    mVar.resumeWith(null);
                    break;
                }
                break;
            default:
                if (mVar.b()) {
                    int i12 = Result.f71687b;
                    mVar.resumeWith(null);
                    break;
                }
                break;
        }
    }

    @Override // ni.g
    public void onAdLoaded(Object obj) {
        int i5 = this.f15587a;
        t70.m mVar = this.f15588b;
        switch (i5) {
            case 4:
                Object iconAd = (oi.b) obj;
                Intrinsics.g(iconAd, "iconAd");
                if (mVar.b()) {
                    int i11 = Result.f71687b;
                    mVar.resumeWith(iconAd);
                    break;
                } else {
                    try {
                        int i12 = Result.f71687b;
                        ((g2) iconAd).destroy();
                        Unit unit = Unit.f71706a;
                        break;
                    } catch (Throwable th2) {
                        int i13 = Result.f71687b;
                        ResultKt.a(th2);
                        return;
                    }
                }
            default:
                wi.b ad = (wi.b) obj;
                Intrinsics.g(ad, "ad");
                if (mVar.b()) {
                    int i14 = Result.f71687b;
                    mVar.resumeWith(ad);
                    break;
                }
                break;
        }
    }

    @Override // fi.e
    public void onComplete(Task p02) {
        int i5 = this.f15587a;
        t70.m mVar = this.f15588b;
        switch (i5) {
            case 0:
                Intrinsics.g(p02, "p0");
                int i11 = Result.f71687b;
                mVar.resumeWith(p02);
                break;
            case 8:
                if (!p02.q()) {
                    Exception excL = p02.l();
                    if (excL == null) {
                        excL = new RuntimeException("FetchPlace failed");
                    }
                    int i12 = Result.f71687b;
                    mVar.resumeWith(ResultKt.a(excL));
                    break;
                } else {
                    mVar.i(((FetchPlaceResponse) p02.m()).getPlace(), null);
                    break;
                }
            default:
                Intrinsics.g(p02, "p0");
                int i13 = Result.f71687b;
                mVar.resumeWith(p02);
                break;
        }
    }

    @Override // x80.j
    public void onFailure(x80.i iVar, IOException iOException) {
        t70.m mVar = this.f15588b;
        if (mVar.isCancelled()) {
            return;
        }
        int i5 = Result.f71687b;
        mVar.resumeWith(ResultKt.a(iOException));
    }

    @Override // x80.j
    public void onResponse(x80.i iVar, m0 m0Var) {
        int i5 = Result.f71687b;
        this.f15588b.resumeWith(m0Var);
    }
}
