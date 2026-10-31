package androidx.datastore.preferences.protobuf;

/* loaded from: classes2.dex */
public class UninitializedMessageException extends RuntimeException {
    public UninitializedMessageException() {
        super("Message was missing required fields.  (Lite runtime could not determine which fields were missing).");
    }

    public final InvalidProtocolBufferException a() {
        return new InvalidProtocolBufferException(getMessage());
    }
}
