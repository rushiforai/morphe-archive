package com.fyber.inneractive.sdk.player;

import com.fyber.inneractive.sdk.player.enums.VideoClickOrigin;
import com.fyber.inneractive.sdk.util.c0;

/* loaded from: classes3.dex */
public final class j implements m {
    @Override // com.fyber.inneractive.sdk.player.m
    public final String a(com.fyber.inneractive.sdk.player.controller.q qVar, VideoClickOrigin videoClickOrigin) {
        return qVar != null ? c0.a(qVar.b()) : "00:00:00.000";
    }
}
