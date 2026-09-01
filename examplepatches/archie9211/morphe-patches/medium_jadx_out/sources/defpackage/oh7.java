package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oh7 {
    public static mh7 a(Object obj, Object obj2) {
        mh7 mh7VarB = (mh7) obj;
        mh7 mh7Var = (mh7) obj2;
        if (!mh7Var.isEmpty()) {
            if (!mh7VarB.a) {
                mh7VarB = mh7VarB.b();
            }
            mh7VarB.a();
            if (!mh7Var.isEmpty()) {
                mh7VarB.putAll(mh7Var);
            }
        }
        return mh7VarB;
    }
}
