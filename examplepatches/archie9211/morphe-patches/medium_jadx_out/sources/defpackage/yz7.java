package defpackage;

import java.util.List;
import java.util.concurrent.CopyOnWriteArraySet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yz7 {
    public static final CopyOnWriteArraySet d = new CopyOnWriteArraySet();
    public final String a;
    public final String b;
    public final List c;

    public yz7(String str, List list, String str2) {
        this.a = str;
        this.b = str2;
        this.c = list;
    }

    public static final CopyOnWriteArraySet a() {
        if (ec2.a.contains(yz7.class)) {
            return null;
        }
        try {
            return d;
        } catch (Throwable th) {
            ec2.a(yz7.class, th);
            return null;
        }
    }

    public final String b() {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            return this.a;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }
}
