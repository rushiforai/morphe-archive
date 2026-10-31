package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class zzafy extends RuntimeException {
    public zzafy() {
        super("Message was missing required fields.  (Lite runtime could not determine which fields were missing).");
    }

    public final zzaeh a() {
        return new zzaeh(getMessage());
    }
}
