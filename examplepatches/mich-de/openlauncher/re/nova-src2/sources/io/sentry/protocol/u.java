package io.sentry.protocol;

import com.amplitude.core.events.Identify;
import io.sentry.ILogger;
import io.sentry.e3;
import io.sentry.i1;
import io.sentry.y1;
import java.nio.charset.Charset;
import java.util.UUID;

/* loaded from: classes4.dex */
public final class u implements i1 {

    /* renamed from: b, reason: collision with root package name */
    public static final u f67620b = new u(new UUID(0, 0));

    /* renamed from: a, reason: collision with root package name */
    public final UUID f67621a;

    public u(UUID uuid) {
        this.f67621a = uuid == null ? UUID.randomUUID() : uuid;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && u.class == obj.getClass() && this.f67621a.compareTo(((u) obj).f67621a) == 0;
    }

    public final int hashCode() {
        return this.f67621a.hashCode();
    }

    @Override // io.sentry.i1
    public final void serialize(y1 y1Var, ILogger iLogger) {
        ((e3) y1Var).A(toString());
    }

    public final String toString() {
        String string = this.f67621a.toString();
        Charset charset = io.sentry.util.h.f67833a;
        if (string.equals("0000-0000")) {
            string = "00000000-0000-0000-0000-000000000000";
        }
        return string.replace(Identify.UNSET_VALUE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }

    public u(String str) {
        Charset charset = io.sentry.util.h.f67833a;
        str = str.equals("0000-0000") ? "00000000-0000-0000-0000-000000000000" : str;
        str = str.length() == 32 ? new StringBuilder(str).insert(8, Identify.UNSET_VALUE).insert(13, Identify.UNSET_VALUE).insert(18, Identify.UNSET_VALUE).insert(23, Identify.UNSET_VALUE).toString() : str;
        if (str.length() == 36) {
            this.f67621a = UUID.fromString(str);
            return;
        }
        throw new IllegalArgumentException("String representation of SentryId has either 32 (UUID no dashes) or 36 characters long (completed UUID). Received: ".concat(str));
    }
}
