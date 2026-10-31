package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.i;
import java.io.IOException;
import java.net.SocketException;
import java.net.UnknownHostException;
import javax.net.ssl.SSLHandshakeException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class o {
    @NotNull
    public static final i.a.AbstractC0205a a(@NotNull Exception e3) {
        Intrinsics.g(e3, "e");
        return e3 instanceof UnknownHostException ? i.a.AbstractC0205a.q.f38953c : e3 instanceof SocketException ? i.a.AbstractC0205a.C0207i.f38937c : e3 instanceof SSLHandshakeException ? i.a.AbstractC0205a.j.f38939c : e3 instanceof IOException ? i.a.AbstractC0205a.f.f38931c : e3 instanceof SecurityException ? i.a.AbstractC0205a.g.f38933c : e3 instanceof p ? i.a.AbstractC0205a.m.f38945c : e3 instanceof NumberFormatException ? i.a.AbstractC0205a.l.f38943c : i.a.AbstractC0205a.r.f38955c;
    }
}
