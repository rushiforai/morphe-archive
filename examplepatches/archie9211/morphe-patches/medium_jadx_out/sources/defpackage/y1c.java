package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class y1c {
    public static final y1c IGNORE_CACHE_EXPIRATION;
    public static final y1c SKIP_CACHE_LOOKUP;
    public static final y1c USE_CACHE;
    public static final /* synthetic */ y1c[] a;

    static {
        y1c y1cVar = new y1c("USE_CACHE", 0);
        USE_CACHE = y1cVar;
        y1c y1cVar2 = new y1c("SKIP_CACHE_LOOKUP", 1);
        SKIP_CACHE_LOOKUP = y1cVar2;
        y1c y1cVar3 = new y1c("IGNORE_CACHE_EXPIRATION", 2);
        IGNORE_CACHE_EXPIRATION = y1cVar3;
        a = new y1c[]{y1cVar, y1cVar2, y1cVar3};
    }

    public static y1c valueOf(String str) {
        return (y1c) Enum.valueOf(y1c.class, str);
    }

    public static y1c[] values() {
        return (y1c[]) a.clone();
    }
}
