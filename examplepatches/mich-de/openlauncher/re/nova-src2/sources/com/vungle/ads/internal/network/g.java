package com.vungle.ads.internal.network;

import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public enum g {
    GET,
    POST;


    @NotNull
    public static final f Companion = new Object() { // from class: com.vungle.ads.internal.network.f
        @NotNull
        public final KSerializer<g> serializer() {
            return e.f47239a;
        }
    };
}
