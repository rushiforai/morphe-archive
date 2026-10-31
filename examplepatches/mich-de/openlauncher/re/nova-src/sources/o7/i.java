package o7;

import android.app.Notification;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes2.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final int f79671a;

    /* renamed from: b, reason: collision with root package name */
    public final int f79672b;

    /* renamed from: c, reason: collision with root package name */
    public final Notification f79673c;

    public i(int i5, Notification notification, int i11) {
        this.f79671a = i5;
        this.f79673c = notification;
        this.f79672b = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || i.class != obj.getClass()) {
            return false;
        }
        i iVar = (i) obj;
        if (this.f79671a == iVar.f79671a && this.f79672b == iVar.f79672b) {
            return this.f79673c.equals(iVar.f79673c);
        }
        return false;
    }

    public final int hashCode() {
        return this.f79673c.hashCode() + (((this.f79671a * 31) + this.f79672b) * 31);
    }

    public final String toString() {
        return "ForegroundInfo{mNotificationId=" + this.f79671a + ", mForegroundServiceType=" + this.f79672b + ", mNotification=" + this.f79673c + AbstractJsonLexerKt.END_OBJ;
    }
}
