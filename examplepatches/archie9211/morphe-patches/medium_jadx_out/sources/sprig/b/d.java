package sprig.b;

import defpackage.ev6;
import defpackage.g76;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\n\b\u0087@\u0018\u00002\u00020\u0001B\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0002ø\u0001\u0000¢\u0006\u0004\b\u0014\u0010\u0004J\u0010\u0010\u0005\u001a\u00020\u0002HÖ\u0001¢\u0006\u0004\b\u0003\u0010\u0004J\u0010\u0010\t\u001a\u00020\u0006HÖ\u0001¢\u0006\u0004\b\u0007\u0010\bJ\u001a\u0010\u000e\u001a\u00020\u000b2\b\u0010\n\u001a\u0004\u0018\u00010\u0001HÖ\u0003¢\u0006\u0004\b\f\u0010\rR\u0017\u0010\u0013\u001a\u00020\u00028\u0006¢\u0006\f\n\u0004\b\u000f\u0010\u0010\u001a\u0004\b\u0011\u0010\u0012\u0088\u0001\u0013\u0092\u0001\u00020\u0002ø\u0001\u0000\u0082\u0002\u0004\n\u0002\b\u0019¨\u0006\u0015"}, d2 = {"Lsprig/b/d;", "", "", "toString-impl", "(Ljava/lang/String;)Ljava/lang/String;", "toString", "", "hashCode-impl", "(Ljava/lang/String;)I", "hashCode", "other", "", "equals-impl", "(Ljava/lang/String;Ljava/lang/Object;)Z", "equals", "a", "Ljava/lang/String;", "getName", "()Ljava/lang/String;", "name", "constructor-impl", "userleap_release"}, k = 1, mv = {1, 8, 0})
public final class d {

    /* JADX INFO: renamed from: a, reason: from kotlin metadata */
    public final String name;

    public /* synthetic */ d(String str) {
        this.name = str;
    }

    /* JADX INFO: renamed from: box-impl, reason: not valid java name */
    public static final /* synthetic */ d m154boximpl(String str) {
        return new d(str);
    }

    /* JADX INFO: renamed from: constructor-impl, reason: not valid java name */
    public static String m155constructorimpl(String str) {
        str.getClass();
        return str;
    }

    /* JADX INFO: renamed from: equals-impl, reason: not valid java name */
    public static boolean m156equalsimpl(String str, Object obj) {
        return (obj instanceof d) && g76.L(str, ((d) obj).m160unboximpl());
    }

    /* JADX INFO: renamed from: equals-impl0, reason: not valid java name */
    public static final boolean m157equalsimpl0(String str, String str2) {
        return g76.L(str, str2);
    }

    /* JADX INFO: renamed from: hashCode-impl, reason: not valid java name */
    public static int m158hashCodeimpl(String str) {
        return str.hashCode();
    }

    /* JADX INFO: renamed from: toString-impl, reason: not valid java name */
    public static String m159toStringimpl(String str) {
        return ev6.x("FragmentName(name=", str, ")");
    }

    public boolean equals(Object obj) {
        return m156equalsimpl(this.name, obj);
    }

    public final String getName() {
        return this.name;
    }

    public int hashCode() {
        return m158hashCodeimpl(this.name);
    }

    public String toString() {
        return m159toStringimpl(this.name);
    }

    /* JADX INFO: renamed from: unbox-impl, reason: not valid java name */
    public final /* synthetic */ String m160unboximpl() {
        return this.name;
    }
}
