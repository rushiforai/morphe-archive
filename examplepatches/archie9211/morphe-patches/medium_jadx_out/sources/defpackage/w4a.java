package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class w4a extends h41 implements fj6 {
    public final boolean a;

    public w4a(Object obj, Class cls, String str, String str2, int i) {
        super(obj, cls, str, str2, (i & 1) == 1);
        this.a = (i & 2) == 2;
    }

    @Override // defpackage.h41
    /* JADX INFO: renamed from: a, reason: merged with bridge method [inline-methods] */
    public final fj6 getReflected() {
        if (this.a) {
            ik4.k("Kotlin reflection is not yet supported for synthetic Java properties. Please follow/upvote https://youtrack.jetbrains.com/issue/KT-55980");
            return null;
        }
        rg6 rg6VarCompute = compute();
        if (rg6VarCompute != this) {
            return (fj6) rg6VarCompute;
        }
        throw new in6();
    }

    @Override // defpackage.h41
    public final rg6 compute() {
        return this.a ? this : super.compute();
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof w4a) {
            w4a w4aVar = (w4a) obj;
            return getOwner().equals(w4aVar.getOwner()) && getName().equals(w4aVar.getName()) && getSignature().equals(w4aVar.getSignature()) && g76.L(getBoundReceiver(), w4aVar.getBoundReceiver());
        }
        if (obj instanceof fj6) {
            return obj.equals(compute());
        }
        return false;
    }

    public final int hashCode() {
        return getSignature().hashCode() + ((getName().hashCode() + (getOwner().hashCode() * 31)) * 31);
    }

    public final String toString() {
        rg6 rg6VarCompute = compute();
        if (rg6VarCompute != this) {
            return rg6VarCompute.toString();
        }
        return "property " + getName() + " (Kotlin reflection is not available)";
    }
}
