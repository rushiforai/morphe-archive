package com.google.android.gms.wallet.contract;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import androidx.activity.result.IntentSenderRequest;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.ResolvableApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.Task;
import k.a;
import k.b;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class TaskResultContracts$ResolveApiTaskResult<I, O> extends b {

    /* renamed from: a, reason: collision with root package name */
    public Status f33926a;

    /* renamed from: b, reason: collision with root package name */
    public PendingIntent f33927b;

    public abstract Object a(Task task);

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        PendingIntent pendingIntent = this.f33927b;
        Intrinsics.g(pendingIntent, "pendingIntent");
        IntentSender intentSender = pendingIntent.getIntentSender();
        Intrinsics.f(intentSender, "pendingIntent.intentSender");
        return new Intent("androidx.activity.result.contract.action.INTENT_SENDER_REQUEST").putExtra("androidx.activity.result.contract.extra.INTENT_SENDER_REQUEST", new IntentSenderRequest(intentSender, null, 0, 0));
    }

    @Override // k.b
    public final a getSynchronousResult(Context context, Object obj) {
        Task task = (Task) obj;
        if (!task.p()) {
            throw new IllegalArgumentException("The task has to be executed before using this API to resolve its result.");
        }
        Exception excL = task.l();
        if (excL instanceof ApiException) {
            this.f33926a = ((ApiException) excL).f31794a;
            if (excL instanceof ResolvableApiException) {
                this.f33927b = ((ResolvableApiException) excL).f31794a.f31812h;
            }
        }
        if (this.f33927b == null) {
            return new a(a(task));
        }
        return null;
    }
}
