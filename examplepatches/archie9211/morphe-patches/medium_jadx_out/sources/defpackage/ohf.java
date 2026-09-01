package defpackage;

import com.google.android.play.core.integrity.StandardIntegrityException;
import com.google.android.play.integrity.internal.af;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ohf extends kif {
    public final /* synthetic */ phf b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ohf(phf phfVar, wfd wfdVar) {
        super(wfdVar);
        this.b = phfVar;
    }

    @Override // defpackage.kif
    public final void a(Exception exc) {
        if (!(exc instanceof af)) {
            super.a(exc);
        } else if (phf.d(this.b)) {
            super.a(new StandardIntegrityException(-2, exc));
        } else {
            super.a(new StandardIntegrityException(-9, exc));
        }
    }
}
