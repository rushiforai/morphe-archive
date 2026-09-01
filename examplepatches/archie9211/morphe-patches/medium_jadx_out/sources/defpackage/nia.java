package defpackage;

import android.app.PendingIntent;
import com.medium.android.publication.ui.main.PublicationFragment;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class nia implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ nla b;
    public final /* synthetic */ pia c;

    public /* synthetic */ nia(nla nlaVar, pia piaVar, int i) {
        this.a = i;
        this.b = nlaVar;
        this.c = piaVar;
    }

    @Override // defpackage.m45
    public final Object invoke() throws PendingIntent.CanceledException {
        int i = this.a;
        n92 n92Var = null;
        c1e c1eVar = c1e.a;
        pia piaVar = this.c;
        nla nlaVar = this.b;
        switch (i) {
            case 0:
                nlaVar.b(piaVar.j, piaVar.h, piaVar.c);
                break;
            case 1:
                nlaVar.d(piaVar.j, piaVar.h, piaVar.c);
                break;
            case 2:
                String str = piaVar.a;
                SourceParameter sourceParameter = piaVar.j;
                str.getClass();
                ((kia) nlaVar.a).a(str, sourceParameter);
                break;
            case 3:
                String str2 = piaVar.a;
                SourceParameter sourceParameter2 = piaVar.j;
                str2.getClass();
                PublicationFragment publicationFragment = ((kia) nlaVar.a).a;
                ((p13) publicationFragment.Z()).x(publicationFragment.S(), str2, gp7.u(sourceParameter2));
                break;
            case 4:
                SourceParameter sourceParameter3 = piaVar.j;
                nna nnaVar = nlaVar.b;
                vx0.c0(f76.F(nnaVar), null, null, new jna(nnaVar, sourceParameter3, n92Var, 0), 3);
                break;
            default:
                SourceParameter sourceParameter4 = piaVar.j;
                nna nnaVar2 = nlaVar.b;
                vx0.c0(f76.F(nnaVar2), null, null, new jna(nnaVar2, sourceParameter4, n92Var, 2), 3);
                break;
        }
        return c1eVar;
    }
}
