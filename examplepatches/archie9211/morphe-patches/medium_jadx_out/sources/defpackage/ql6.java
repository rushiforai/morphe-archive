package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ql6 extends yl6 {
    public abstract Object a();

    public final String toString() {
        String string;
        StringBuilder sb = new StringBuilder(getClass().getSimpleName());
        sb.append('(');
        if (this instanceof tl6) {
            string = "\"" + ((Object) ((tl6) this).a) + '\"';
        } else {
            string = a().toString();
        }
        return ev6.z(sb, string, ')');
    }
}
