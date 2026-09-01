package com.google.protobuf;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class InvalidProtocolBufferException extends IOException {
    public boolean a;

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    public static class InvalidWireTypeException extends InvalidProtocolBufferException {
    }

    public static InvalidProtocolBufferException a() {
        return new InvalidProtocolBufferException("Protocol message contained an invalid tag (zero).");
    }

    public static InvalidProtocolBufferException b() {
        return new InvalidProtocolBufferException("Protocol message had invalid UTF-8.");
    }

    public static InvalidWireTypeException c() {
        return new InvalidWireTypeException("Protocol message tag had invalid wire type.");
    }

    public static InvalidProtocolBufferException d() {
        return new InvalidProtocolBufferException("CodedInputStream encountered a malformed varint.");
    }

    public static InvalidProtocolBufferException e() {
        return new InvalidProtocolBufferException("CodedInputStream encountered an embedded string or message which claimed to have negative size.");
    }

    public static InvalidProtocolBufferException f() {
        return new InvalidProtocolBufferException("Failed to parse the message.");
    }

    public static InvalidProtocolBufferException g() {
        return new InvalidProtocolBufferException("While parsing a protocol message, the input ended unexpectedly in the middle of a field.  This could mean either that the input has been truncated or that an embedded message misreported its own length.");
    }
}
