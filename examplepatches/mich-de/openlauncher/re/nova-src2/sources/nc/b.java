package nc;

import java.util.HashMap;

/* loaded from: classes2.dex */
public enum b {
    FAILED_INIT_ENCRYPTION("failed to init encryption"),
    FAILED_EXTRACT_ENCRYPTED_DATA("failed to extract encrypted data"),
    FAILED_STORE_ENCRYPTED_DATA("failed to store encrypted data"),
    IGNITE_SERVICE_UNAVAILABLE("Ignite service unavailable"),
    /* JADX INFO: Fake field, exist only in values array */
    IGNITE_SERVICE_INVALID_SESSION("Invalid session token"),
    /* JADX INFO: Fake field, exist only in values array */
    ONE_DT_EMPTY_ENTITY("received empty one dt from the service"),
    /* JADX INFO: Fake field, exist only in values array */
    ONE_DT_AUTHENTICATOR_DESTROYED("authenticator already destroyed");


    /* renamed from: f, reason: collision with root package name */
    public static final HashMap f78189f = new HashMap();

    /* renamed from: a, reason: collision with root package name */
    public final String f78191a;

    static {
        for (b bVar : values()) {
            f78189f.put(bVar.f78191a, bVar);
        }
    }

    b(String str) {
        this.f78191a = str;
    }
}
