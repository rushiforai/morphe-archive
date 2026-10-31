package com.novalauncher.novalytics;

import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import com.novalauncher.novalytics.stats.internal.DailyMetricsDatabase;
import java.time.LocalDate;
import java.time.chrono.ChronoLocalDate;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.json.Json;
import np.d;
import np.g;
import np.k;
import o7.m;
import o7.p;
import org.jetbrains.annotations.NotNull;
import qp.c;
import x7.f;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001:\u0001\bB\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\t"}, d2 = {"Lcom/novalauncher/novalytics/ReportSubmitWork;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "workerParams", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "np/f", "lib_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
public final class ReportSubmitWork extends CoroutineWorker {

    /* renamed from: f, reason: collision with root package name */
    public final WorkerParameters f42238f;

    /* renamed from: g, reason: collision with root package name */
    public final String f42239g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ReportSubmitWork(@NotNull Context context, @NotNull WorkerParameters workerParams) {
        super(context, workerParams);
        Intrinsics.g(context, "context");
        Intrinsics.g(workerParams, "workerParams");
        this.f42238f = workerParams;
        String string = context.getString(2132019016);
        Intrinsics.f(string, "getString(...)");
        this.f42239g = string;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // androidx.work.CoroutineWorker
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object doWork(Continuation continuation) {
        g gVar;
        d metrics;
        if (continuation instanceof g) {
            gVar = (g) continuation;
            int i5 = gVar.f78515w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                gVar.f78515w = i5 - Integer.MIN_VALUE;
            } else {
                gVar = new g(this, (ContinuationImpl) continuation);
            }
        }
        Object objA = gVar.f78513u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = gVar.f78515w;
        if (i11 == 0) {
            ResultKt.b(objA);
            String str = this.f42239g;
            if (str.length() == 0) {
                return p.a();
            }
            String strB = this.f42238f.f15320b.b("reportJson");
            if (strB == null) {
                return new m();
            }
            Json.Companion companion = Json.INSTANCE;
            companion.getSerializersModule();
            d dVar = (d) companion.decodeFromString(d.Companion.serializer(), strB);
            if (dVar.f78486a.plusDays(3L).compareTo((ChronoLocalDate) LocalDate.now()) < 0) {
                return p.a();
            }
            c cVar = c.f84300a;
            gVar.f78512t = dVar;
            gVar.f78515w = 1;
            objA = cVar.a(dVar, str, gVar);
            if (objA == coroutineSingletons) {
                return coroutineSingletons;
            }
            metrics = dVar;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            metrics = gVar.f78512t;
            ResultKt.b(objA);
        }
        if (!((Boolean) objA).booleanValue()) {
            return new m();
        }
        k kVar = k.f78521d;
        Intrinsics.g(metrics, "metrics");
        metrics.f78493h = kVar;
        DailyMetricsDatabase dailyMetricsDatabase = f.f95132a;
        if (dailyMetricsDatabase != null) {
            dailyMetricsDatabase.d().r(metrics);
            return p.a();
        }
        Intrinsics.m("db");
        throw null;
    }
}
