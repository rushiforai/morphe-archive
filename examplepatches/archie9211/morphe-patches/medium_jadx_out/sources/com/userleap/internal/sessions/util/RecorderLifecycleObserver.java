package com.userleap.internal.sessions.util;

import defpackage.f03;
import defpackage.iy6;
import defpackage.m45;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\n\u0018\u00002\u00020\u0001B#\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002\u0012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u0002¢\u0006\u0004\b\u0006\u0010\u0007J\u0017\u0010\n\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\bH\u0016¢\u0006\u0004\b\n\u0010\u000bJ\u0017\u0010\u0005\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\bH\u0016¢\u0006\u0004\b\u0005\u0010\u000bR\u001d\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0006¢\u0006\f\n\u0004\b\f\u0010\r\u001a\u0004\b\u000e\u0010\u000fR\u001d\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00030\u00028\u0006¢\u0006\f\n\u0004\b\u0010\u0010\r\u001a\u0004\b\u0011\u0010\u000f¨\u0006\u0012"}, d2 = {"Lcom/userleap/internal/sessions/util/RecorderLifecycleObserver;", "Lf03;", "Lkotlin/Function0;", "Lc1e;", "onBackground", "onResume", "<init>", "(Lm45;Lm45;)V", "Liy6;", "owner", "onPause", "(Liy6;)V", "a", "Lm45;", "getOnBackground", "()Lm45;", "b", "getOnResume", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class RecorderLifecycleObserver implements f03 {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final m45 onBackground;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    public final m45 onResume;

    public RecorderLifecycleObserver(m45 m45Var, m45 m45Var2) {
        m45Var.getClass();
        m45Var2.getClass();
        this.onBackground = m45Var;
        this.onResume = m45Var2;
    }

    public final m45 getOnBackground() {
        return this.onBackground;
    }

    public final m45 getOnResume() {
        return this.onResume;
    }

    @Override // defpackage.f03
    public void onCreate(iy6 iy6Var) {
        iy6Var.getClass();
    }

    @Override // defpackage.f03
    public void onDestroy(iy6 iy6Var) {
        iy6Var.getClass();
    }

    @Override // defpackage.f03
    public void onPause(iy6 owner) {
        owner.getClass();
        this.onBackground.invoke();
    }

    @Override // defpackage.f03
    public void onResume(iy6 owner) {
        owner.getClass();
        this.onResume.invoke();
    }

    @Override // defpackage.f03
    public void onStart(iy6 iy6Var) {
        iy6Var.getClass();
    }

    @Override // defpackage.f03
    public void onStop(iy6 iy6Var) {
        iy6Var.getClass();
    }
}
