package com.fyber.inneractive.sdk.config.global.features;

import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class n extends i implements p {
    static {
        TimeUnit timeUnit = TimeUnit.SECONDS;
        timeUnit.toMillis(45L);
        timeUnit.toMillis(5L);
        timeUnit.toMillis(5L);
        timeUnit.toMillis(45L);
        timeUnit.toMillis(10L);
        timeUnit.toMillis(2L);
        timeUnit.toMillis(15L);
        timeUnit.toMillis(8L);
    }

    public n() {
        super("bid_net");
    }

    @Override // com.fyber.inneractive.sdk.config.global.features.i
    public final i b() {
        n nVar = new n();
        a(nVar);
        return nVar;
    }
}
