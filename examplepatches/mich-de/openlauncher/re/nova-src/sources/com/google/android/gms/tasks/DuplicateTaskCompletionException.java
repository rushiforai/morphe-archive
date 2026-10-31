package com.google.android.gms.tasks;

import fi.t;

/* loaded from: classes3.dex */
public final class DuplicateTaskCompletionException extends IllegalStateException {
    public static IllegalStateException a(t tVar) {
        if (!tVar.p()) {
            return new IllegalStateException("DuplicateTaskCompletionException can only be created from completed Task.");
        }
        Exception excL = tVar.l();
        return new DuplicateTaskCompletionException("Complete with: ".concat(excL != null ? "failure" : tVar.q() ? "result ".concat(String.valueOf(tVar.m())) : tVar.f55162d ? "cancellation" : "unknown issue"), excL);
    }
}
