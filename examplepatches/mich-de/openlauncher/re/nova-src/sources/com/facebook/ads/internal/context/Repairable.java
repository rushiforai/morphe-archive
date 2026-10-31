package com.facebook.ads.internal.context;

import androidx.annotation.Keep;
import com.facebook.infer.annotation.Nullsafe;

@Keep
@Nullsafe(Nullsafe.Mode.LOCAL)
/* loaded from: classes2.dex */
public interface Repairable {
    void repair(Throwable th2);
}
