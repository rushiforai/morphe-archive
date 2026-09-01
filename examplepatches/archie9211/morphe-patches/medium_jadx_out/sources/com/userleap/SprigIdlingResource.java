package com.userleap;

import defpackage.bc2;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u0017\u0010\u0005\u001a\u00020\u00048\u0006¢\u0006\f\n\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/userleap/SprigIdlingResource;", "", "<init>", "()V", "Lbc2;", "sessionReplayExportIdlingResource", "Lbc2;", "getSessionReplayExportIdlingResource", "()Lbc2;", "userleap_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class SprigIdlingResource {
    public static final SprigIdlingResource INSTANCE = new SprigIdlingResource();
    private static final bc2 sessionReplayExportIdlingResource = new bc2();

    private SprigIdlingResource() {
    }

    public final bc2 getSessionReplayExportIdlingResource() {
        return sessionReplayExportIdlingResource;
    }
}
