package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tp4 {
    public boolean a;
    public long b;
    public final Object c;
    public Object d;

    public tp4(tk7 tk7Var, t99 t99Var, long j) {
        this.c = tk7Var;
        this.d = t99Var;
        this.b = j;
        this.a = true;
    }

    public boolean a() {
        Boolean bool = (Boolean) this.d;
        return bool != null ? bool.booleanValue() : this.a;
    }

    public tp4(boolean z, String str) {
        this.a = z;
        this.c = str;
    }
}
