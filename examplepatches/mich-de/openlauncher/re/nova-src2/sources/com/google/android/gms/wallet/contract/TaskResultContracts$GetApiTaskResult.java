package com.google.android.gms.wallet.contract;

import android.content.Intent;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.wallet.PaymentData;
import ii.a;

/* loaded from: classes3.dex */
public abstract class TaskResultContracts$GetApiTaskResult<T> extends TaskResultContracts$ResolveApiTaskResult<T, a> {
    @Override // com.google.android.gms.wallet.contract.TaskResultContracts$ResolveApiTaskResult
    public final Object a(Task task) {
        if (task.q()) {
            return new a(task.m(), Status.f31806j);
        }
        if (task.o()) {
            return new a(null, new Status(16, "The task has been canceled.", null, null));
        }
        Status status = this.f33926a;
        return status != null ? new a(null, status) : new a(null, Status.f31808l);
    }

    @Override // k.b
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public a parseResult(int i5, Intent intent) {
        Status status = Status.f31808l;
        if (i5 != -1) {
            return i5 != 0 ? new a(null, status) : new a(null, Status.n);
        }
        PaymentData paymentDataC = intent != null ? c(intent) : null;
        return paymentDataC != null ? new a(paymentDataC, Status.f31806j) : new a(null, status);
    }

    public abstract PaymentData c(Intent intent);
}
