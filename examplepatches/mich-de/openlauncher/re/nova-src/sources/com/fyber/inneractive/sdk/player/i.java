package com.fyber.inneractive.sdk.player;

import com.fyber.inneractive.sdk.player.enums.VideoClickOrigin;
import java.util.Locale;

/* loaded from: classes3.dex */
public final class i implements m {
    @Override // com.fyber.inneractive.sdk.player.m
    public final String a(com.fyber.inneractive.sdk.player.controller.q qVar, VideoClickOrigin videoClickOrigin) {
        return videoClickOrigin.name().toLowerCase(Locale.US);
    }
}
