package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class p08 {
    public final int a;
    public final int b;

    public p08(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    public void a(z25 z25Var) {
        z25Var.getClass();
        throw new ei8("Migration functionality with a SupportSQLiteDatabase (without a provided SQLiteDriver) requires overriding the migrate(SupportSQLiteDatabase) function.");
    }

    public void b(anb anbVar) {
        anbVar.getClass();
        if (!(anbVar instanceof t2d)) {
            throw new ei8("Migration functionality with a provided SQLiteDriver requires overriding the migrate(SQLiteConnection) function.");
        }
        a(((t2d) anbVar).a);
    }
}
