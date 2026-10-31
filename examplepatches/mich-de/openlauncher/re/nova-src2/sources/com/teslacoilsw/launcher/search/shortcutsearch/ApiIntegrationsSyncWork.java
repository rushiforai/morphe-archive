package com.teslacoilsw.launcher.search.shortcutsearch;

import android.content.Context;
import androidx.work.CoroutineWorker;
import androidx.work.WorkerParameters;
import e10.a3;
import g20.a;
import g20.c;
import g20.w;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import mc0.d;
import mx.g0;
import o7.m;
import o7.p;
import org.jetbrains.annotations.NotNull;
import ul.b;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lcom/teslacoilsw/launcher/search/shortcutsearch/ApiIntegrationsSyncWork;", "Landroidx/work/CoroutineWorker;", "Landroid/content/Context;", "context", "Landroidx/work/WorkerParameters;", "workerParams", "<init>", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class ApiIntegrationsSyncWork extends CoroutineWorker {
    public ApiIntegrationsSyncWork(@NotNull Context context, @NotNull WorkerParameters workerParameters) {
        super(context, workerParameters);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:29:0x008a A[Catch: Exception -> 0x0033, TryCatch #0 {Exception -> 0x0033, blocks: (B:12:0x002e, B:32:0x00b1, B:27:0x0084, B:29:0x008a, B:33:0x00d8, B:19:0x0041, B:21:0x0057, B:22:0x0068, B:24:0x006e, B:26:0x007e, B:25:0x007c), top: B:37:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00d8 A[Catch: Exception -> 0x0033, TRY_LEAVE, TryCatch #0 {Exception -> 0x0033, blocks: (B:12:0x002e, B:32:0x00b1, B:27:0x0084, B:29:0x008a, B:33:0x00d8, B:19:0x0041, B:21:0x0057, B:22:0x0068, B:24:0x006e, B:26:0x007e, B:25:0x007c), top: B:37:0x0022 }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r2v3, types: [kotlin.collections.EmptyList] */
    /* JADX WARN: Type inference failed for: r2v4, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r2v5, types: [java.util.ArrayList] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:30:0x00ae -> B:32:0x00b1). Please report as a decompilation issue!!! */
    @Override // androidx.work.CoroutineWorker
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object doWork(Continuation continuation) {
        c cVar;
        ?? arrayList;
        ApiIntegrationsSyncWork apiIntegrationsSyncWork;
        Iterator it;
        if (continuation instanceof c) {
            cVar = (c) continuation;
            int i5 = cVar.f56932y;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                cVar.f56932y = i5 - Integer.MIN_VALUE;
            } else {
                cVar = new c(this, (ContinuationImpl) continuation);
            }
        }
        Object objF = cVar.f56930w;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = cVar.f56932y;
        try {
            if (i11 == 0) {
                ResultKt.b(objF);
                d.f76206a.b("ApiIntegrationsSyncWork starting...", new Object[0]);
                Set<String> stringSet = a3.f51435a.f51545a.getStringSet("ssml_enabled_integrations", null);
                if (stringSet != null) {
                    Set<String> set = stringSet;
                    arrayList = new ArrayList(b70.c.u0(set, 10));
                    Iterator it2 = set.iterator();
                    while (it2.hasNext()) {
                        arrayList.add(a.valueOf((String) it2.next()));
                    }
                } else {
                    arrayList = EmptyList.f71733a;
                }
                apiIntegrationsSyncWork = this;
                it = arrayList.iterator();
                if (it.hasNext()) {
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                a aVar = cVar.f56929v;
                it = cVar.f56928u;
                apiIntegrationsSyncWork = cVar.f56927t;
                ResultKt.b(objF);
                int iIntValue = ((Number) objF).intValue();
                d.f76206a.b("  Ingested '" + iIntValue + "' links from " + aVar, new Object[0]);
                if (it.hasNext()) {
                    aVar = (a) it.next();
                    s80.a aVarE = b.E(apiIntegrationsSyncWork.getApplicationContext(), aVar);
                    Context context = g0.f77088a;
                    w wVarC = g0.c();
                    cVar.f56927t = apiIntegrationsSyncWork;
                    cVar.f56928u = it;
                    cVar.f56929v = aVar;
                    cVar.f56932y = 1;
                    objF = wVarC.f(aVarE, cVar);
                    if (objF == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                    int iIntValue2 = ((Number) objF).intValue();
                    d.f76206a.b("  Ingested '" + iIntValue2 + "' links from " + aVar, new Object[0]);
                    if (it.hasNext()) {
                        return p.a();
                    }
                }
            }
        } catch (Exception e3) {
            d.f76206a.o(e3);
            return new m();
        }
    }
}
