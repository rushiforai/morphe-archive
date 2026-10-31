package com.vungle.ads.internal.model;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class s3 {

    @NotNull
    public static final r3 Companion = new r3();

    /* renamed from: a, reason: collision with root package name */
    public final String f47146a;

    /* renamed from: b, reason: collision with root package name */
    public String f47147b;

    public /* synthetic */ s3(int i5, String str, String str2) {
        if (1 != (i5 & 1)) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, q3.f47133a.getDescriptor());
        }
        this.f47146a = str;
        if ((i5 & 2) == 0) {
            this.f47147b = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        } else {
            this.f47147b = str2;
        }
    }

    public static final void a(s3 self, CompositeEncoder output, PluginGeneratedSerialDescriptor serialDesc) {
        Intrinsics.g(self, "self");
        Intrinsics.g(output, "output");
        Intrinsics.g(serialDesc, "serialDesc");
        output.encodeStringElement(serialDesc, 0, self.f47146a);
        if (!output.shouldEncodeElementDefault(serialDesc, 1) && Intrinsics.b(self.f47147b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
            return;
        }
        output.encodeStringElement(serialDesc, 1, self.f47147b);
    }

    public final boolean equals(Object obj) {
        if (obj != null && s3.class.equals(obj.getClass())) {
            s3 s3Var = (s3) obj;
            if (Intrinsics.b(this.f47146a, s3Var.f47146a) && Intrinsics.b(this.f47147b, s3Var.f47147b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f47147b.hashCode() + (this.f47146a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("UnclosedAd(eventId=");
        sbA.append(this.f47146a);
        sbA.append(", sessionId=");
        return h6.c1.t(sbA, this.f47147b, ')');
    }

    public s3(String eventId, String sessionId) {
        Intrinsics.g(eventId, "eventId");
        Intrinsics.g(sessionId, "sessionId");
        this.f47146a = eventId;
        this.f47147b = sessionId;
    }

    public final void a(String str) {
        Intrinsics.g(str, "<set-?>");
        this.f47147b = str;
    }

    public /* synthetic */ s3(String str) {
        this(str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
    }
}
