package defpackage;

import java.io.FileInputStream;
import java.nio.channels.FileLock;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o58 extends p92 {
    public a98 b;
    public FileInputStream c;
    public FileLock d;
    public boolean e;
    public /* synthetic */ Object f;
    public final /* synthetic */ p58 g;
    public int h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o58(p58 p58Var, p92 p92Var) {
        super(p92Var);
        this.g = p58Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        this.f = obj;
        this.h |= Integer.MIN_VALUE;
        return this.g.d(null, this);
    }
}
