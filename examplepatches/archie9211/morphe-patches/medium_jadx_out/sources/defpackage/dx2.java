package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public enum dx2 {
    NONE(null),
    ONLY_ME("only_me"),
    FRIENDS("friends"),
    EVERYONE("everyone");

    public final String a;

    dx2(String str) {
        this.a = str;
    }

    public final String getNativeProtocolAudience() {
        return this.a;
    }
}
