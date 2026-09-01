package com.google.android.gms.internal.p000firebaseauthapi;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class zzale extends IOException {
    public boolean a;

    public static zzalh a() {
        return new zzalh("Protocol message tag had invalid wire type.");
    }

    public static zzale b() {
        return new zzale("Protocol message contained an invalid tag (zero).");
    }

    public static zzale c() {
        return new zzale("Protocol message had invalid UTF-8.");
    }

    public static zzale d() {
        return new zzale("CodedInputStream encountered a malformed varint.");
    }

    public static zzale e() {
        return new zzale("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    public static zzale f() {
        return new zzale("Failed to parse the message.");
    }

    public static zzale g() {
        return new zzale("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }
}
