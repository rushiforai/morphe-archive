package defpackage;

import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class eo2 implements f8a {
    public final /* synthetic */ int a;
    public final ko2 b;
    public final int c;
    public final z65 d;
    public final z65 e;

    public /* synthetic */ eo2(ko2 ko2Var, z65 z65Var, z65 z65Var2, int i, int i2) {
        this.a = i2;
        this.b = ko2Var;
        this.d = z65Var;
        this.e = z65Var2;
        this.c = i;
    }

    @Override // defpackage.g8a
    public final Object get() {
        int i = this.a;
        int i2 = this.c;
        z65 z65Var = this.e;
        ko2 ko2Var = this.b;
        switch (i) {
            case 0:
                switch (i2) {
                    case 0:
                        return new kn2(this);
                    case 1:
                        return new vn2();
                    case 2:
                        return new xn2();
                    case 3:
                        return new yn2();
                    case 4:
                        return new zn2();
                    case 5:
                        return new ao2();
                    case 6:
                        return new bo2();
                    case 7:
                        return new co2(this);
                    case 8:
                        return new do2();
                    case 9:
                        return new an2();
                    case 10:
                        return new bn2();
                    case 11:
                        return new cn2();
                    case 12:
                        return new dn2();
                    case 13:
                        return new en2();
                    case 14:
                        return new fn2();
                    case 15:
                        return new gn2();
                    case 16:
                        return new hn2();
                    case 17:
                        return new in2();
                    case 18:
                        return new jn2();
                    case 19:
                        return new ln2();
                    case 20:
                        return new mn2();
                    case 21:
                        return new nn2();
                    case 22:
                        return new on2();
                    case 23:
                        return new pn2();
                    case 24:
                        return new qn2();
                    case 25:
                        return new rn2(this);
                    case 26:
                        return new ks8(((fo2) z65Var).a, ko2Var.s(), ko2Var.c(), ((xm2) this.d).b());
                    case 27:
                        return new sn2(this);
                    case 28:
                        return new tn2(this);
                    case 29:
                        return new un2(this);
                    case 30:
                        return new wn2(this);
                    default:
                        throw new AssertionError(i2);
                }
            default:
                ys2 ys2Var = (ys2) z65Var;
                int i3 = i2 / 100;
                if (i3 != 0) {
                    if (i3 != 1) {
                        throw new AssertionError(i2);
                    }
                    switch (i2) {
                        case 100:
                            return new es2(this);
                        case 101:
                            return new fs2(this);
                        case 102:
                            return new gs2(this);
                        case 103:
                            return new hs2(this);
                        case 104:
                            return new is2(this);
                        case PanasonicMakernoteDirectory.TAG_COUNTRY /* 105 */:
                            return new bee(ys2Var.z(), ys2Var.a);
                        case 106:
                            return new js2(this);
                        case 107:
                            return new ks2(this);
                        case 108:
                            return new ls2(this);
                        case 109:
                            return new ns2(this);
                        case 110:
                            return new os2(this);
                        case PanasonicMakernoteDirectory.TAG_LANDMARK /* 111 */:
                            return new ps2(this);
                        case PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION /* 112 */:
                            return new qs2(this);
                        case 113:
                            return new x9d(ys2Var.E());
                        case 114:
                            return new rs2(this);
                        case 115:
                            return new c9d(ys2Var.E());
                        case 116:
                            return new ss2(this);
                        case 117:
                            return new ts2(this);
                        case 118:
                            return new kub(ys2Var.u());
                        case PanasonicMakernoteDirectory.TAG_BURST_SPEED /* 119 */:
                            return new us2(this);
                        case 120:
                            return new vs2(this);
                        case PanasonicMakernoteDirectory.TAG_INTELLIGENT_D_RANGE /* 121 */:
                            return new ws2(this);
                        case 122:
                            return new lo2(this);
                        case 123:
                            return new mo2(this);
                        case PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH /* 124 */:
                            return new c9e(ys2Var.N());
                        case 125:
                            return new no2(this);
                        case ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER /* 126 */:
                            return new oo2(this);
                        case 127:
                            return new po2(this);
                        case 128:
                            return new qo2(this);
                        case 129:
                            return new ro2(this);
                        case NikonType2MakernoteDirectory.TAG_ADAPTER /* 130 */:
                            return new so2(this);
                        case 131:
                            return new to2(this);
                        case NikonType2MakernoteDirectory.TAG_LENS /* 132 */:
                            return new uo2(this);
                        case NikonType2MakernoteDirectory.TAG_MANUAL_FOCUS_DISTANCE /* 133 */:
                            return new wo2(this);
                        case NikonType2MakernoteDirectory.TAG_DIGITAL_ZOOM /* 134 */:
                            return new rub(ys2Var.u());
                        case NikonType2MakernoteDirectory.TAG_FLASH_USED /* 135 */:
                            return new xo2(this);
                        case 136:
                            return new yo2(this);
                        case 137:
                            return new zo2(this);
                        case 138:
                            return new zj2(ys2Var.S(), ys2Var.N());
                        case NikonType2MakernoteDirectory.TAG_LENS_STOPS /* 139 */:
                            return new ek2(ys2Var.S(), ys2Var.P(), (zk2) ko2Var.r.get(), ys2Var.N());
                        case 140:
                            return new gl2(ys2Var.S(), ys2Var.N());
                        case 141:
                            return new ap2(this);
                        case 142:
                            return new bp2(this);
                        case 143:
                            return new cp2(this);
                        case 144:
                            return new dp2(this);
                        default:
                            throw new AssertionError(i2);
                    }
                }
                switch (i2) {
                    case 0:
                        vob vobVar = ys2Var.a;
                        fr9 fr9VarR = ys2Var.r();
                        gn9 gn9Var = (gn9) ko2Var.u.get();
                        vo3 vo3Var = new vo3((qi1) ys2Var.b.t.get());
                        ty2 ty2VarQ = ko2Var.q();
                        tl tlVarP = ys2Var.p();
                        ax2 ax2VarT = ko2Var.t();
                        r13 r13Var = xg3.a;
                        iq7.s(r13Var);
                        return new ua(vobVar, fr9VarR, gn9Var, vo3Var, ty2VarQ, tlVarP, ax2VarT, r13Var);
                    case 1:
                        vob vobVar2 = ys2Var.a;
                        ko2 ko2Var2 = ys2Var.b;
                        le2 le2Var = new le2((qi1) ko2Var2.t.get(), ko2Var2.k());
                        r13 r13Var2 = xg3.a;
                        iq7.s(r13Var2);
                        return new we2(vobVar2, le2Var, r13Var2);
                    case 2:
                        vob vobVar3 = ys2Var.a;
                        ko2 ko2Var3 = ys2Var.b;
                        c53 c53Var = new c53((qi1) ko2Var3.t.get(), ko2Var3.k());
                        r13 r13Var3 = xg3.a;
                        iq7.s(r13Var3);
                        return new j53(vobVar3, c53Var, r13Var3);
                    case 3:
                        vl5 vl5Var = new vl5((zk2) ys2Var.b.r.get(), ys2Var.N());
                        cxe cxeVarP = ys2Var.P();
                        r13 r13Var4 = xg3.a;
                        iq7.s(r13Var4);
                        return new dm5(vl5Var, cxeVarP, r13Var4);
                    case 4:
                        return new mv5(ko2Var.u());
                    case 5:
                        ko2Var.getClass();
                        i03 i03Var = i03.a;
                        return new to6(new h1c(), new iu7(), (w50) ko2Var.L.get(), new gg5((zk2) ys2Var.b.r.get(), on7.b()), (pz2) ko2Var.H.get(), (slc) ko2Var.G.get());
                    case 6:
                        return new n4a(ys2Var.a, new olb(14, ys2Var.N()));
                    case 7:
                        return new wea(ys2Var.E());
                    case 8:
                        vob vobVar4 = ys2Var.a;
                        ko2 ko2Var4 = ys2Var.b;
                        ed4 ed4Var = new ed4((qi1) ko2Var4.t.get());
                        r4e r4eVar = new r4e((qi1) ko2Var4.t.get());
                        ax2 ax2VarK = ko2Var.k();
                        r13 r13Var5 = xg3.a;
                        iq7.s(r13Var5);
                        return new h5e(vobVar4, ed4Var, r4eVar, ax2VarK, r13Var5);
                    case 9:
                        bud budVar = (bud) ko2Var.F.get();
                        r13 r13Var6 = xg3.a;
                        iq7.s(r13Var6);
                        return new wwe(budVar, r13Var6);
                    case 10:
                        return new np2(this);
                    case 11:
                        return new yp2(this);
                    case 12:
                        return new jq2(this);
                    case 13:
                        return new uq2(this);
                    case 14:
                        return new fr2(this);
                    case 15:
                        return new qr2(this);
                    case 16:
                        return new bs2(this);
                    case 17:
                        return new ms2(this);
                    case 18:
                        return new xs2(this);
                    case 19:
                        return new vo2(this);
                    case 20:
                        return new ep2(this);
                    case 21:
                        return new fp2(this);
                    case 22:
                        return new gp2(this);
                    case 23:
                        return new hp2(this);
                    case 24:
                        return new ip2(this);
                    case 25:
                        return new jp2(this);
                    case 26:
                        return new ctb(ys2Var.u());
                    case 27:
                        return new kp2(this);
                    case 28:
                        return new etb(ys2Var.u());
                    case 29:
                        return new lp2(this);
                    case 30:
                        return new mp2(this);
                    case 31:
                        return new op2(this);
                    case 32:
                        return new pp2(this);
                    case 33:
                        return new qp2(this);
                    case 34:
                        return new rp2(this);
                    case 35:
                        return new sp2(this);
                    case 36:
                        return new tp2(this);
                    case 37:
                        return new up2(this);
                    case 38:
                        return new vp2(this);
                    case 39:
                        return new wp2(this);
                    case 40:
                        return new xp2(this);
                    case 41:
                        return new bc4((cba) ko2Var.Q.get());
                    case 42:
                        return new zp2(this);
                    case 43:
                        return new aq2(this);
                    case 44:
                        return new bq2(this);
                    case 45:
                        return new cq2(this);
                    case 46:
                        return new dq2(this);
                    case 47:
                        return new eq2(this);
                    case 48:
                        return new fq2(this);
                    case 49:
                        return new gq2(this);
                    case 50:
                        return new hq2(this);
                    case 51:
                        return new iq2(this);
                    case 52:
                        return new kq2(this);
                    case 53:
                        return new lq2(this);
                    case 54:
                        return new mq2(this);
                    case 55:
                        return new nq2(this);
                    case 56:
                        return new oq2(this);
                    case 57:
                        return new pq2(this);
                    case 58:
                        return new qq2(this);
                    case 59:
                        return new rq2(this);
                    case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                        return new sq2(this);
                    case 61:
                        return new tq2(this);
                    case 62:
                        return new zk8((uj8) ko2Var.U.get());
                    case 63:
                        return new vq2(this);
                    case 64:
                        return new wq2(this);
                    case 65:
                        return new xq2(this);
                    case 66:
                        return new sye((nfb) ko2Var.V.get(), ko2Var.r(), ys2Var.a);
                    case 67:
                        return new yq2(this);
                    case 68:
                        return new otb(ys2Var.u());
                    case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
                        return new zq2(this);
                    case 70:
                        return new ar2(this);
                    case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
                        return new x8a(ys2Var.z(), ys2Var.a);
                    case 72:
                        return new br2(this);
                    case 73:
                        return new cr2(this);
                    case 74:
                        return new dr2(this);
                    case 75:
                        return new er2(this);
                    case 76:
                        return new gr2(this);
                    case PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION /* 77 */:
                        return new hr2(this);
                    case 78:
                        return new ir2(this);
                    case 79:
                        return new jr2(this);
                    case 80:
                        return new kr2(this);
                    case PanasonicMakernoteDirectory.TAG_LENS_TYPE /* 81 */:
                        return new lr2(this);
                    case 82:
                        return new mr2(this);
                    case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
                        return new nr2(this);
                    case 84:
                        return new or2(this);
                    case 85:
                        return new pr2(this);
                    case 86:
                        return new rr2();
                    case 87:
                        return new sr2(this);
                    case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
                        return new tr2(this);
                    case PanasonicMakernoteDirectory.TAG_TRANSFORM /* 89 */:
                        return new ur2(this);
                    case ReconyxHyperFire2MakernoteDirectory.TAG_FLASH /* 90 */:
                        return new vr2(this);
                    case 91:
                        return new wr2(this);
                    case 92:
                        return new xr2(this);
                    case 93:
                        return new yr2(this);
                    case 94:
                        return new fxe((nfb) ko2Var.V.get(), ko2Var.r(), ys2Var.a, 0);
                    case 95:
                        return new fxe((nfb) ko2Var.V.get(), ko2Var.r(), ys2Var.a, 1);
                    case 96:
                        return new zr2(this);
                    case PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO /* 97 */:
                        return new as2(this);
                    case 98:
                        return new cs2(this);
                    case PanasonicMakernoteDirectory.TAG_RECOGNIZED_FACE_FLAGS /* 99 */:
                        return new ds2(this);
                    default:
                        throw new AssertionError(i2);
                }
        }
    }
}
