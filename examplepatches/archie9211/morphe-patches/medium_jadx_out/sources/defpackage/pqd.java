package defpackage;

import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u000b\n\u0002\u0010\t\n\u0002\b\u0005\n\u0002\u0010$\n\u0002\b\u0006\b\u0086\b\u0018\u00002\u00020\u0001R\u001a\u0010\u0007\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006R\u001a\u0010\n\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\b\u0010\u0004\u001a\u0004\b\t\u0010\u0006R\u001a\u0010\r\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000b\u0010\u0004\u001a\u0004\b\f\u0010\u0006R\u001a\u0010\u0013\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012R&\u0010\u0019\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00010\u00148\u0006X\u0087\u0004¢\u0006\f\n\u0004\b\u0015\u0010\u0016\u001a\u0004\b\u0017\u0010\u0018¨\u0006\u001a"}, d2 = {"Lpqd;", "", "", "a", "Ljava/lang/String;", "getEventId", "()Ljava/lang/String;", "eventId", "b", "getType", "type", "c", "getKey", "key", "", "d", "J", "getTimestamp", "()J", "timestamp", "", "e", "Ljava/util/Map;", "getData", "()Ljava/util/Map;", "data", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final /* data */ class pqd {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    @g0c("eventId")
    private final String eventId;

    /* JADX INFO: renamed from: b, reason: from kotlin metadata */
    @g0c("type")
    private final String type;

    /* JADX INFO: renamed from: c, reason: from kotlin metadata */
    @g0c("key")
    private final String key;

    /* JADX INFO: renamed from: d, reason: from kotlin metadata */
    @g0c("timestamp")
    private final long timestamp;

    /* JADX INFO: renamed from: e, reason: from kotlin metadata */
    @g0c("data")
    private final Map<String, Object> data;

    public pqd(String str, String str2, String str3, long j, LinkedHashMap linkedHashMap) {
        this.eventId = str;
        this.type = str2;
        this.key = str3;
        this.timestamp = j;
        this.data = linkedHashMap;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !pqd.class.equals(obj.getClass())) {
            return false;
        }
        return g76.L(this.eventId, ((pqd) obj).eventId);
    }

    public final int hashCode() {
        return this.eventId.hashCode();
    }

    public final String toString() {
        return new ch5().h(this);
    }
}
