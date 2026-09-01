package defpackage;

import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;
import com.medium.proto.event.PrepublishOpen;
import com.medium.proto.event.PrepublishTagsSaved;
import gen.model.SourceParameter;
import java.util.List;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0001\u0018\u00002\u00020\u0001:\u0004\u0002\u0003\u0004\u0005¨\u0006\u0006"}, d2 = {"Lfha;", "Lque;", "er2", "vga", "gga", "gfa", "postpublishing_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class fha extends que {
    public final String b;
    public final String c;
    public final p3 d;
    public final r3 e;
    public final hx4 f;
    public final na5 g;
    public final uoa h;
    public final lob i;
    public final qlb j;
    public final dwc k;
    public final zk2 l;
    public final gl9 m;
    public final cx2 n;
    public final slc o;
    public final String p;
    public final String q;
    public final r6c r;
    public final uua s;
    public final r6c t;
    public boolean u;
    public final wua v;

    public fha(String str, String str2, p3 p3Var, r3 r3Var, hx4 hx4Var, na5 na5Var, uoa uoaVar, lob lobVar, qlb qlbVar, dwc dwcVar, zk2 zk2Var, gl9 gl9Var, cx2 cx2Var, slc slcVar, kb2 kb2Var) {
        str.getClass();
        str2.getClass();
        zk2Var.getClass();
        slcVar.getClass();
        this.b = str;
        this.c = str2;
        this.d = p3Var;
        this.e = r3Var;
        this.f = hx4Var;
        this.g = na5Var;
        this.h = uoaVar;
        this.i = lobVar;
        this.j = qlbVar;
        this.k = dwcVar;
        this.l = zk2Var;
        this.m = gl9Var;
        this.n = cx2Var;
        this.o = slcVar;
        this.p = "publishing_flow";
        this.q = "publishing_flow";
        rqd.a(cx2Var.a, new PrepublishOpen(null, str, null, 5, null), str2, h(), false, null, "publishing_flow", 24);
        r6c r6cVarX = k40.x(0, 7, null);
        this.r = r6cVarX;
        this.s = bo.z(r6cVarX);
        this.t = k40.x(0, 6, null);
        this.v = bo.e0(w2g.r(new u50(12, new eha(this, null)), kb2Var), f76.F(this), l7c.b, iga.a);
    }

    public static f09 g(boolean z, boolean z2, PublicationData publicationData, qvc qvcVar) {
        if (z && !z2 && publicationData == null) {
            return new f09(nga.a, null);
        }
        lga lgaVar = lga.a;
        pga pgaVar = pga.a;
        if (z && !z2 && qvcVar == null) {
            if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.EDITOR) {
                return new f09(pgaVar, lgaVar);
            }
        }
        if (z && !z2 && qvcVar == null) {
            if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.WRITER) {
                return new f09(pgaVar, null);
            }
        }
        jga jgaVar = jga.a;
        if (z && !z2) {
            qvc.Companion.getClass();
            if (bu1.p0(qvc.a, qvcVar)) {
                if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.EDITOR) {
                    return new f09(null, jgaVar);
                }
            }
        }
        mga mgaVar = mga.a;
        if (z && !z2) {
            qvc.Companion.getClass();
            if (bu1.p0(qvc.a, qvcVar)) {
                if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.WRITER) {
                    return new f09(null, mgaVar);
                }
            }
        }
        oga ogaVar = oga.a;
        if (z && z2 && publicationData == null) {
            return new f09(ogaVar, null);
        }
        if (z && z2 && qvcVar == null) {
            if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.EDITOR) {
                return new f09(pgaVar, lgaVar);
            }
        }
        if (z && z2 && qvcVar == null) {
            if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.WRITER) {
                return new f09(pgaVar, null);
            }
        }
        kga kgaVar = kga.a;
        if (z && z2) {
            qvc.Companion.getClass();
            if (bu1.p0(qvc.a, qvcVar)) {
                if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.EDITOR) {
                    return new f09(ogaVar, kgaVar);
                }
            }
        }
        if (z && z2) {
            qvc.Companion.getClass();
            if (bu1.p0(qvc.a, qvcVar)) {
                if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.WRITER) {
                    return new f09(ogaVar, mgaVar);
                }
            }
        }
        if (z && z2) {
            return new f09(ogaVar, null);
        }
        if (!z && !z2) {
            if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.EDITOR) {
                qvc.Companion.getClass();
                if (bu1.p0(qvc.a, qvcVar)) {
                    return new f09(null, jgaVar);
                }
            }
        }
        if (!z && z2) {
            if ((publicationData != null ? publicationData.getRole() : null) == PublicationData.PublicationRole.EDITOR) {
                qvc.Companion.getClass();
                if (bu1.p0(qvc.a, qvcVar)) {
                    return new f09(null, kgaVar);
                }
            }
        }
        wld.a.n(null, "Invalid state for buttons. isCurrentUserThePostAuthor: " + z + ", selectedPublication: " + publicationData + ", mappedSubmissionStatus: " + qvcVar, new Object[0]);
        return new f09(null, null);
    }

    public final void e() {
        this.n.a(this.b, this.c, h(), this.q);
        vx0.c0(f76.F(this), null, null, new wga(this, null, 0), 3);
    }

    public final void f() {
        PublicationData publicationData;
        vga vgaVar = (vga) this.v.a.getValue();
        if ((vgaVar instanceof uga) && (publicationData = ((uga) vgaVar).k) != null) {
            this.n.a(this.b, this.c, h(), this.q);
            vx0.c0(f76.F(this), null, null, new mw9(this, publicationData, null, 7), 3);
        }
    }

    public final String h() {
        return gp7.u(new SourceParameter(this.p, null, null, null, null, this.b, null, null, null, null, null, null, this.l.m(), null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -4130, 8191, null));
    }

    public final void i() {
        vga vgaVar = (vga) this.v.a.getValue();
        if (vgaVar instanceof uga) {
            uga ugaVar = (uga) vgaVar;
            String str = ugaVar.a;
            String str2 = ugaVar.c;
            PublicationData publicationData = ugaVar.k;
            String id = publicationData != null ? publicationData.getId() : null;
            this.n.a(this.b, this.c, h(), this.q);
            vx0.c0(f76.F(this), null, null, new uk8(this, str, str2, id, ugaVar, (n92) null, 12), 3);
        }
    }

    public final void j(List list) {
        list.getClass();
        String strH = h();
        cx2 cx2Var = this.n;
        cx2Var.getClass();
        String str = this.b;
        str.getClass();
        String str2 = this.c;
        str2.getClass();
        String str3 = this.q;
        str3.getClass();
        rqd.a(cx2Var.a, new PrepublishTagsSaved(null, str, null, 5, null), str2, strH, false, null, str3, 24);
        vx0.c0(f76.F(this), null, null, new nx9(this, list, null, 12), 3);
    }

    public final void k() {
        uga ugaVar;
        PublicationData publicationData;
        String id;
        vga vgaVar = (vga) this.v.a.getValue();
        if (!(vgaVar instanceof uga) || (publicationData = (ugaVar = (uga) vgaVar).k) == null || (id = publicationData.getId()) == null) {
            return;
        }
        this.n.a(this.b, this.c, h(), this.q);
        vx0.c0(f76.F(this), null, null, new mw9((que) this, id, (Object) ugaVar, (n92) null, 8), 3);
    }
}
