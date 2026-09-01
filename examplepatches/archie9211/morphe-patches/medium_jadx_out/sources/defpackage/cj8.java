package defpackage;

import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.android.graphql.fragment.NotificationData;
import com.medium.android.graphql.type.MarkupType;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class cj8 {
    public static final void a(xi8 xi8Var, ek8 ek8Var, obe obeVar, x12 x12Var, int i) {
        obeVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-41033970);
        int i2 = (p65Var.f(xi8Var) ? 4 : 2) | i | (p65Var.f(ek8Var) ? 32 : 16) | (p65Var.f(obeVar) ? 256 : 128);
        if (!p65Var.P(i2 & 1, (i2 & 147) != 146)) {
            p65Var.S();
        } else if (xi8Var instanceof sd1) {
            p65Var.Y(-778932427);
            vx0.c((sd1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof nf1) {
            p65Var.Y(-778926088);
            xz5.e((nf1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof pf1) {
            p65Var.Y(-778919953);
            d46.e((pf1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof vf1) {
            p65Var.Y(-778913965);
            xf1.a((vf1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof cg1) {
            p65Var.Y(-778907655);
            nk7.b((cg1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof yf1) {
            p65Var.Y(-778901027);
            bg1.a((yf1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof ms1) {
            p65Var.Y(-778894572);
            ht2.r((ms1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof f86) {
            p65Var.Y(-778888297);
            o7f.h((f86) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof h86) {
            p65Var.Y(-778881731);
            bgf.o((h86) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof gx7) {
            p65Var.Y(-778875606);
            vo7.d((gx7) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof zd9) {
            p65Var.Y(-778869905);
            ur7.j((zd9) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof ml9) {
            p65Var.Y(-778864148);
            qk7.h((ml9) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof ql9) {
            p65Var.Y(-778858286);
            il7.c((ql9) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof ol9) {
            p65Var.Y(-778852106);
            dl7.c((ol9) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof kn9) {
            p65Var.Y(-778846231);
            en7.b((kn9) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof on9) {
            p65Var.Y(-778840561);
            fo7.u((on9) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof mn9) {
            p65Var.Y(-778834573);
            vn7.d((mn9) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof kra) {
            p65Var.Y(-778829022);
            kp7.b((kra) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof mra) {
            p65Var.Y(-778823668);
            tp7.k((mra) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof pra) {
            p65Var.Y(-778818136);
            vp7.e((pra) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof mdb) {
            p65Var.Y(-778812596);
            odb.a((mdb) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof sdb) {
            p65Var.Y(-778806734);
            yo7.i((sdb) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof pdb) {
            p65Var.Y(-778800554);
            rdb.a((pdb) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof vne) {
            p65Var.Y(-778794415);
            yo7.m((vne) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof xne) {
            p65Var.Y(-778788489);
            ep7.o((xne) xi8Var, ek8Var, obeVar, p65Var, i2 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        } else if (xi8Var instanceof yne) {
            p65Var.Y(-778781055);
            fp7.g((yne) xi8Var, ek8Var, obeVar, p65Var, i2 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION);
            p65Var.p(false);
        } else if (xi8Var instanceof zne) {
            p65Var.Y(-778773484);
            gp7.e((zne) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof ll5) {
            p65Var.Y(-778767374);
            dm2.f((ll5) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof ol5) {
            p65Var.Y(-778761128);
            bo.o((ol5) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof gr1) {
            p65Var.Y(-778754795);
            n01.h((gr1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof kl9) {
            p65Var.Y(-778748555);
            ok7.e((kl9) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof rf1) {
            p65Var.Y(-778742183);
            f76.h((rf1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof tf1) {
            p65Var.Y(-778735819);
            g76.g((tf1) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else if (xi8Var instanceof eda) {
            p65Var.Y(-778729612);
            gq7.b((eda) xi8Var, ek8Var, p65Var, i2 & ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
            p65Var.p(false);
        } else {
            p65Var.Y(-778724626);
            p65Var.p(false);
            wld.a.c("Notification item not handled: ".concat(xi8Var.getClass().getSimpleName()), new Object[0]);
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i, 18, xi8Var, ek8Var, obeVar);
        }
    }

    public static final mx b(List list) {
        list.getClass();
        if (list.isEmpty()) {
            return null;
        }
        kx kxVar = new kx();
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            NotificationData.Paragraph paragraph = (NotificationData.Paragraph) it2.next();
            paragraph.getClass();
            kx kxVar2 = new kx();
            String text = paragraph.getText();
            if (text == null) {
                text = "";
            }
            kxVar2.d(text);
            for (NotificationData.Markup markup : paragraph.getMarkups()) {
                MarkupType type = markup.getType();
                int i = type == null ? -1 : bj8.a[type.ordinal()];
                int i2 = 1;
                if (i == 1) {
                    kxVar2.b(new skc(0L, 0L, d05.h, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65531), markup.getStart(), markup.getEnd());
                } else if (i == 2) {
                    kxVar2.b(new skc(0L, 0L, (d05) null, new zz4(i2), (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, (ohd) null, (i3c) null, 65527), markup.getStart(), markup.getEnd());
                } else if (i != 3) {
                    wld.a.m("Markup type not handle: " + type, new Object[0]);
                } else {
                    kxVar2.b(new skc(0L, 0L, (d05) null, (zz4) null, (a05) null, (az4) null, (String) null, 0L, (lo0) null, (xid) null, (h67) null, 0L, ohd.c, (i3c) null, 61439), markup.getStart(), markup.getEnd());
                }
            }
            kxVar.c(kxVar2.i());
        }
        mx mxVarI = kxVar.i();
        if (muc.b0(mxVarI)) {
            return null;
        }
        return mxVarI;
    }
}
