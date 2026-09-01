package com.medium.android.postpublishing.ui.publicationSelection;

import android.content.res.Resources;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;
import com.medium.android.postpublishing.ui.publicationSelection.c;
import com.medium.reader.R;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.b55;
import defpackage.bgf;
import defpackage.bo4;
import defpackage.c1e;
import defpackage.c60;
import defpackage.cqb;
import defpackage.cu;
import defpackage.d8a;
import defpackage.dl7;
import defpackage.dma;
import defpackage.eo;
import defpackage.eu7;
import defpackage.fd3;
import defpackage.fn;
import defpackage.gx1;
import defpackage.hl0;
import defpackage.hlg;
import defpackage.hp7;
import defpackage.i89;
import defpackage.iu0;
import defpackage.jfc;
import defpackage.ka1;
import defpackage.kjd;
import defpackage.kma;
import defpackage.kp7;
import defpackage.kt7;
import defpackage.kyd;
import defpackage.m45;
import defpackage.mkd;
import defpackage.mwa;
import defpackage.n92;
import defpackage.nmb;
import defpackage.nr7;
import defpackage.o28;
import defpackage.omb;
import defpackage.ot2;
import defpackage.p65;
import defpackage.pxf;
import defpackage.q12;
import defpackage.qb8;
import defpackage.r12;
import defpackage.r28;
import defpackage.rr7;
import defpackage.sq6;
import defpackage.tp7;
import defpackage.uk8;
import defpackage.uob;
import defpackage.uv1;
import defpackage.vo7;
import defpackage.w12;
import defpackage.w2g;
import defpackage.wv1;
import defpackage.x12;
import defpackage.x45;
import defpackage.y30;
import defpackage.z46;
import defpackage.zo7;
import defpackage.zpb;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public abstract class c {
    public static final void a(boolean z, final x45 x45Var, r28 r28Var, boolean z2, x12 x12Var, int i) {
        x45Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1794839332);
        int i2 = i | (p65Var.g(z) ? 4 : 2) | (p65Var.h(x45Var) ? 32 : 16) | (p65Var.g(z2) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024);
        final int i3 = 1;
        if (p65Var.P(i2 & 1, (i2 & 1171) != 1170)) {
            r28 r28VarD = jfc.d(r28Var, 1.0f);
            int i4 = i2 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            boolean z3 = i4 == 32;
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (z3 || objM == uobVar) {
                objM = new m45() { // from class: cma
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i5 = i;
                        c1e c1eVar = c1e.a;
                        x45 x45Var2 = x45Var;
                        switch (i5) {
                            case 0:
                                x45Var2.invoke(null);
                                break;
                            default:
                                x45Var2.invoke(null);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM);
            }
            r28 r28VarE = w2g.E(hlg.r(r28VarD, z2, null, null, (m45) objM, 14), 0.0f, 20.0f, 1);
            omb ombVarA = nmb.a(qb8.a, z46.n, p65Var, 48);
            long j = p65Var.T;
            int i5 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarE);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i5));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            i = i4 == 32 ? 1 : 0;
            Object objM2 = p65Var.M();
            if (i != 0 || objM2 == uobVar) {
                objM2 = new m45() { // from class: cma
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i52 = i3;
                        c1e c1eVar = c1e.a;
                        x45 x45Var2 = x45Var;
                        switch (i52) {
                            case 0:
                                x45Var2.invoke(null);
                                break;
                            default:
                                x45Var2.invoke(null);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var.j0(objM2);
            }
            o28 o28Var = o28.b;
            nr7.a(z, (m45) objM2, w2g.G(o28Var, 12.0f, 0.0f, 0.0f, 0.0f, 14), z2, null, null, p65Var, (i2 & 14) | 384 | (i2 & 7168), 48);
            kjd.b(y30.n(4.0f, R.string.publication_selection_no_publication, p65Var, p65Var, o28Var), null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var.j(kt7.c)).n, p65Var, 0, 0, 65534);
            p65Var = p65Var;
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dma(z, x45Var, r28Var, z2, i);
        }
    }

    public static final void c(kma kmaVar, bo4 bo4Var, m45 m45Var, x45 x45Var, x45 x45Var2, x45 x45Var3, x12 x12Var, int i) {
        int i2;
        p65 p65Var;
        kmaVar.getClass();
        bo4Var.getClass();
        m45Var.getClass();
        x45Var.getClass();
        x45Var2.getClass();
        x45Var3.getClass();
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(790072881);
        if ((i & 6) == 0) {
            i2 = (p65Var2.f(kmaVar) ? 4 : 2) | i;
        } else {
            i2 = i;
        }
        int i3 = i2 | (p65Var2.h(bo4Var) ? 32 : 16);
        if ((i & 384) == 0) {
            i3 |= p65Var2.h(m45Var) ? 256 : 128;
        }
        if ((i & 3072) == 0) {
            i3 |= p65Var2.h(x45Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i & 24576) == 0) {
            i3 |= p65Var2.h(x45Var2) ? 16384 : 8192;
        }
        if ((196608 & i) == 0) {
            i3 |= p65Var2.h(x45Var3) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            cqb cqbVarD = zpb.d(p65Var2);
            rr7.d(null, false, cqbVarD, pxf.E(242811212, new c60(15, m45Var), p65Var2), null, null, null, 0, false, null, 0.0f, 0L, 0L, 0L, 0L, 0L, pxf.E(-481744059, new fd3(kmaVar, x45Var, x45Var3, x45Var2, 4), p65Var2), p65Var2, 3072, 262131);
            p65Var = p65Var2;
            Resources resources = (Resources) p65Var.j(eo.c);
            boolean zH = p65Var.h(bo4Var) | ((57344 & i3) == 16384) | ((i3 & 896) == 256) | p65Var.f(cqbVarD) | p65Var.h(resources);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                uk8 uk8Var = new uk8(bo4Var, x45Var2, m45Var, cqbVarD, resources, (n92) null);
                p65Var.j0(uk8Var);
                objM = uk8Var;
            }
            kyd.k(p65Var, (b55) objM, c1e.a);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(kmaVar, bo4Var, m45Var, x45Var, x45Var2, x45Var3, i, 11);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final void b(final PublicationData publicationData, final boolean z, final boolean z2, final x45 x45Var, r28 r28Var, final boolean z3, x12 x12Var, final int i) {
        final r28 r28Var2;
        p65 p65Var;
        final int i2;
        Object obj;
        p65 p65Var2;
        p65 p65Var3;
        publicationData.getClass();
        x45Var.getClass();
        p65 p65Var4 = (p65) x12Var;
        p65Var4.a0(-786755763);
        int i3 = i | (p65Var4.f(publicationData) ? 4 : 2) | (p65Var4.g(z) ? 32 : 16) | (p65Var4.g(z2) ? 256 : 128) | (p65Var4.h(x45Var) ? 2048 : 1024) | 24576 | (p65Var4.g(z3) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        final int i4 = 1;
        if (p65Var4.P(i3 & 1, (74899 & i3) != 74898)) {
            boolean z4 = z3 && publicationData.isAcceptingSubmissions() && (publicationData.getPublishStatePreference() == PublicationData.PublishStatePreference.ANY || (z && publicationData.getPublishStatePreference() == PublicationData.PublishStatePreference.DRAFT) || (z2 && publicationData.getPublishStatePreference() == PublicationData.PublishStatePreference.PUBLISHED));
            o28 o28Var = o28.b;
            r28 r28VarD = jfc.d(o28Var, 1.0f);
            int i5 = i3 & 7168;
            int i6 = i3 & 14;
            boolean z5 = (i5 == 2048) | (i6 == 4);
            Object objM = p65Var4.M();
            Object obj2 = w12.a;
            Object obj3 = objM;
            if (z5 || objM == obj2) {
                Object obj4 = new m45() { // from class: zla
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i7 = i4;
                        c1e c1eVar = c1e.a;
                        PublicationData publicationData2 = publicationData;
                        x45 x45Var2 = x45Var;
                        switch (i7) {
                            case 0:
                                x45Var2.invoke(publicationData2);
                                break;
                            default:
                                x45Var2.invoke(publicationData2);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var4.j0(obj4);
                obj3 = obj4;
            }
            r28 r28VarE = w2g.E(hlg.r(r28VarD, z4, null, null, (m45) obj3, 14), 0.0f, 20.0f, 1);
            omb ombVarA = nmb.a(qb8.e, z46.n, p65Var4, 54);
            long j = p65Var4.T;
            int i7 = (int) (j ^ (j >>> 32));
            i89 i89VarL = p65Var4.l();
            r28 r28VarR = gx1.R(p65Var4, r28VarE);
            r12.W.getClass();
            m45 m45Var = q12.b;
            p65Var4.c0();
            if (p65Var4.S) {
                p65Var4.k(m45Var);
            } else {
                p65Var4.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var4, cuVar, ombVarA);
            cu cuVar2 = q12.e;
            tp7.B(p65Var4, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i7);
            cu cuVar3 = q12.g;
            tp7.B(p65Var4, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var4, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var4, cuVar4, r28VarR);
            boolean zIsSelected = publicationData.isSelected();
            boolean z6 = (i6 == 4) | (i5 == 2048);
            Object objM2 = p65Var4.M();
            if (z6 || objM2 == obj2) {
                i2 = 0;
                Object obj5 = new m45() { // from class: zla
                    @Override // defpackage.m45
                    public final Object invoke() {
                        int i72 = i2;
                        c1e c1eVar = c1e.a;
                        PublicationData publicationData2 = publicationData;
                        x45 x45Var2 = x45Var;
                        switch (i72) {
                            case 0:
                                x45Var2.invoke(publicationData2);
                                break;
                            default:
                                x45Var2.invoke(publicationData2);
                                break;
                        }
                        return c1eVar;
                    }
                };
                p65Var4.j0(obj5);
                obj = obj5;
            } else {
                i2 = 0;
                obj = objM2;
            }
            boolean z7 = i2;
            nr7.a(zIsSelected, (m45) obj, w2g.G(o28Var, 12.0f, 0.0f, 0.0f, 0.0f, 14), z4, null, null, p65Var4, 384, 48);
            hp7.t(p65Var4, jfc.l(o28Var, 4.0f));
            wv1 wv1VarA = uv1.a(qb8.c, z46.p, p65Var4, z7 ? 1 : 0);
            long j2 = p65Var4.T;
            int i8 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL2 = p65Var4.l();
            r28 r28VarR2 = gx1.R(p65Var4, o28Var);
            p65Var4.c0();
            if (p65Var4.S) {
                p65Var4.k(m45Var);
            } else {
                p65Var4.m0();
            }
            tp7.B(p65Var4, cuVar, wv1VarA);
            tp7.B(p65Var4, cuVar2, i89VarL2);
            ka1.z(i8, p65Var4, cuVar3, p65Var4, fnVar);
            tp7.B(p65Var4, cuVar4, r28VarR2);
            String name = publicationData.getName();
            d8a d8aVar = kt7.c;
            kjd.b(name, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, ((eu7) p65Var4.j(d8aVar)).n, p65Var4, 0, 0, 65534);
            p65 p65Var5 = p65Var4;
            mkd mkdVarM = dl7.m(mkd.a(((eu7) p65Var5.j(d8aVar)).o, ((zo7) p65Var5.j(kt7.b)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214));
            if (publicationData.getHasSubmission()) {
                p65Var5.Y(1461645445);
                kjd.b(vo7.R(p65Var5, R.string.publication_selection_submitted), bgf.N(o28Var, "publication_item_submitted"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarM, p65Var5, 48, 0, 65532);
                p65 p65Var6 = p65Var5;
                p65Var6.p(z7);
                p65Var3 = p65Var6;
            } else if (!publicationData.isAcceptingSubmissions()) {
                p65Var5.Y(1461655557);
                kjd.b(vo7.R(p65Var5, R.string.publication_selection_not_accepting_submissions), bgf.N(o28Var, ezwlgQm.DnAzzqbCXmDxG), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarM, p65Var5, 48, 0, 65532);
                p65 p65Var7 = p65Var5;
                p65Var7.p(z7);
                p65Var3 = p65Var7;
            } else if (publicationData.getPublishStatePreference() == PublicationData.PublishStatePreference.DRAFT) {
                p65Var5.Y(1461668144);
                kjd.b(vo7.R(p65Var5, R.string.publication_selection_accept_drafts_only), bgf.N(o28Var, "publication_item_drafts_only"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarM, p65Var5, 48, 0, 65532);
                p65 p65Var8 = p65Var5;
                p65Var8.p(z7);
                p65Var3 = p65Var8;
            } else {
                if (publicationData.getPublishStatePreference() == PublicationData.PublishStatePreference.PUBLISHED) {
                    p65Var5.Y(1461680214);
                    kjd.b(vo7.R(p65Var5, R.string.publication_selection_accept_published_only), bgf.N(o28Var, "publication_item_published_only"), 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkdVarM, p65Var5, 48, 0, 65532);
                    p65Var2 = p65Var5;
                } else {
                    p65Var5.Y(-1946680165);
                    p65Var2 = p65Var5;
                }
                p65Var2.p(z7);
                p65Var3 = p65Var2;
            }
            p65Var3.p(true);
            hp7.t(p65Var3, new sq6(1.0f, true));
            p65 p65Var9 = p65Var3;
            kp7.a(publicationData.m67getAvatarUvEXDLI(), hl0.XS, w2g.G(o28Var, 0.0f, 0.0f, 24.0f, 0.0f, 11), null, null, 0.0f, 0, null, p65Var9, 432, 2040);
            p65 p65Var10 = p65Var9;
            p65Var10.p(true);
            r28Var2 = o28Var;
            p65Var = p65Var10;
        } else {
            p65Var4.S();
            r28Var2 = r28Var;
            p65Var = p65Var4;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b55(z, z2, x45Var, r28Var2, z3, i) { // from class: ama
                public final /* synthetic */ boolean b;
                public final /* synthetic */ boolean c;
                public final /* synthetic */ x45 d;
                public final /* synthetic */ r28 e;
                public final /* synthetic */ boolean f;

                @Override // defpackage.b55
                public final Object invoke(Object obj6, Object obj7) {
                    ((Integer) obj7).getClass();
                    int iY = tr7.y(1);
                    c.b(this.a, this.b, this.c, this.d, this.e, this.f, (x12) obj6, iY);
                    return c1e.a;
                }
            };
        }
    }
}
