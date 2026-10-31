package com.google.firebase.crashlytics.internal.concurrency;

import com.google.android.gms.tasks.Task;
import fi.c;
import java.util.concurrent.Callable;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f34729a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Callable f34730b;

    public /* synthetic */ a(Callable callable, int i5) {
        this.f34729a = i5;
        this.f34730b = callable;
    }

    @Override // fi.c
    public final Object then(Task task) {
        switch (this.f34729a) {
            case 0:
                return CrashlyticsWorker.lambda$submit$0(this.f34730b, task);
            case 1:
                return CrashlyticsWorker.lambda$submitTask$2(this.f34730b, task);
            case 2:
                return CrashlyticsWorker.lambda$submitTask$3(this.f34730b, task);
            default:
                return CrashlyticsWorker.lambda$submitTaskOnSuccess$4(this.f34730b, task);
        }
    }
}
