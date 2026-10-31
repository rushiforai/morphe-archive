package com.bytedance.sdk.component.lt.ycx.ycx;

import com.bytedance.sdk.component.lt.ycx.ycx.zb.ul;
import java.util.List;
import java.util.Queue;

/* loaded from: classes2.dex */
public class lt implements dj {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.ycx.zb.zb f23872dj;

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23873ea;
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx fby;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23874jc;

    /* renamed from: jw, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23875jw;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.ycx.zb.sya f23876lt;
    private ul lud;

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23877ok;

    /* renamed from: ry, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23878ry;
    private com.bytedance.sdk.component.lt.ycx.ycx.zb.ycx sya;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.ycx.zb.lt f23879ul;
    private Queue<String> xkz;
    lud ycx = com.bytedance.sdk.component.lt.ycx.ul.lt().sya();

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.ycx.zb.lud f23880zb;

    public lt(Queue<String> queue) {
        this.xkz = queue;
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx()) {
            com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVarEa = com.bytedance.sdk.component.lt.ycx.ul.lt().ea();
            this.fby = ycxVarEa;
            this.f23880zb = new com.bytedance.sdk.component.lt.ycx.ycx.zb.lud(ycxVarEa, queue);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lud()) {
            if (com.bytedance.sdk.component.lt.ycx.ul.lt().jw() != null) {
                this.f23874jc = com.bytedance.sdk.component.lt.ycx.ul.lt().jw();
            } else {
                this.f23874jc = com.bytedance.sdk.component.lt.ycx.ul.lt().ok();
            }
            this.f23872dj = new com.bytedance.sdk.component.lt.ycx.ycx.zb.zb(this.f23874jc, queue);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.zb()) {
            com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVarOk = com.bytedance.sdk.component.lt.ycx.ul.lt().ok();
            this.f23875jw = ycxVarOk;
            this.sya = new com.bytedance.sdk.component.lt.ycx.ycx.zb.ycx(ycxVarOk, queue);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.sya()) {
            com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVarOk2 = com.bytedance.sdk.component.lt.ycx.ul.lt().ok();
            this.f23873ea = ycxVarOk2;
            this.lud = new ul(ycxVarOk2, queue);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.dj()) {
            com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVarRy = com.bytedance.sdk.component.lt.ycx.ul.lt().ry();
            this.f23877ok = ycxVarRy;
            this.f23876lt = new com.bytedance.sdk.component.lt.ycx.ycx.zb.sya(ycxVarRy, queue);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lt()) {
            com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVarXkz = com.bytedance.sdk.component.lt.ycx.ul.lt().xkz();
            this.f23878ry = ycxVarXkz;
            this.f23879ul = new com.bytedance.sdk.component.lt.ycx.ycx.zb.lt(ycxVarXkz, queue);
        }
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public void ycx(int i5, long j11) {
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, int i5) {
        try {
            byte bDj = ycxVar.dj();
            byte bLud = ycxVar.lud();
            if (bDj == 0 && bLud == 1 && com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx()) {
                this.f23880zb.ycx(ycxVar);
                return;
            }
            if (bDj == 3 && bLud == 2 && com.bytedance.sdk.component.lt.ycx.zb.ycx.lud()) {
                this.f23872dj.ycx(ycxVar);
                return;
            }
            if (bDj == 0 && bLud == 2 && com.bytedance.sdk.component.lt.ycx.zb.ycx.zb()) {
                this.sya.ycx(ycxVar);
                return;
            }
            if (bDj == 1 && bLud == 2 && com.bytedance.sdk.component.lt.ycx.zb.ycx.sya()) {
                this.lud.ycx(ycxVar);
                return;
            }
            if (bDj == 1 && bLud == 3 && com.bytedance.sdk.component.lt.ycx.zb.ycx.dj()) {
                this.f23876lt.ycx(ycxVar);
            } else if (bDj == 2 && bLud == 3 && com.bytedance.sdk.component.lt.ycx.zb.ycx.lt()) {
                this.f23879ul.ycx(ycxVar);
            }
        } catch (Throwable unused) {
        }
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public void ycx(int i5, List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        if (list == null || list.size() == 0 || list.get(0) == null) {
            return;
        }
        com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar = list.get(0);
        byte bLud = ycxVar.lud();
        byte bDj = ycxVar.dj();
        if (bDj == 0 && bLud == 1 && com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx()) {
            this.f23880zb.ycx(i5, list);
            return;
        }
        if (bDj == 3 && bLud == 2 && com.bytedance.sdk.component.lt.ycx.zb.ycx.lud()) {
            this.f23872dj.ycx(i5, list);
            return;
        }
        if (bDj == 0 && bLud == 2 && com.bytedance.sdk.component.lt.ycx.zb.ycx.zb()) {
            this.sya.ycx(i5, list);
            return;
        }
        if (bDj == 1 && bLud == 2 && com.bytedance.sdk.component.lt.ycx.zb.ycx.sya()) {
            this.lud.ycx(i5, list);
            return;
        }
        if (bDj == 1 && bLud == 3 && com.bytedance.sdk.component.lt.ycx.zb.ycx.dj()) {
            this.f23876lt.ycx(i5, list);
        } else if (bDj == 2 && bLud == 3 && com.bytedance.sdk.component.lt.ycx.zb.ycx.lt()) {
            this.f23879ul.ycx(i5, list);
        }
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public List<com.bytedance.sdk.component.lt.ycx.dj.ycx> ycx(int i5, int i11, List<String> list) {
        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx;
        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx2;
        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx3;
        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx4;
        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx5;
        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx6;
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx() && this.f23880zb.zb(i5, i11) && (listYcx6 = this.f23880zb.ycx(i5, i11)) != null && listYcx6.size() != 0) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.pmi(), 1);
            return listYcx6;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lud() && this.f23872dj.zb(i5, i11) && (listYcx5 = this.f23872dj.ycx(i5, i11)) != null && listYcx5.size() != 0) {
            return listYcx5;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.zb() && this.sya.zb(i5, i11) && (listYcx4 = this.sya.ycx(i5, i11)) != null && listYcx4.size() != 0) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.uh(), 1);
            return listYcx4;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.sya() && this.lud.zb(i5, i11) && (listYcx3 = this.lud.ycx(i5, i11)) != null && listYcx3.size() != 0) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.htf(), 1);
            return listYcx3;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.dj() && this.f23876lt.zb(i5, i11) && (listYcx2 = this.f23876lt.ycx(i5, i11)) != null && listYcx2.size() != 0) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.thx(), 1);
            return listYcx2;
        }
        if (!com.bytedance.sdk.component.lt.ycx.zb.ycx.lt() || !this.f23879ul.zb(i5, i11) || (listYcx = this.f23879ul.ycx(i5, i11)) == null || listYcx.size() == 0) {
            return null;
        }
        return listYcx;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public boolean ycx(int i5, boolean z11) {
        com.bytedance.sdk.component.lt.ycx.ycx.zb.lt ltVar;
        com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar;
        com.bytedance.sdk.component.lt.ycx.ycx.zb.sya syaVar;
        com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar2;
        ul ulVar;
        com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar3;
        com.bytedance.sdk.component.lt.ycx.ycx.zb.ycx ycxVar4;
        com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar5;
        com.bytedance.sdk.component.lt.ycx.ycx.zb.zb zbVar;
        com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar6;
        com.bytedance.sdk.component.lt.ycx.ycx.zb.lud ludVar;
        com.bytedance.sdk.component.lt.ycx.dj.zb.ycx ycxVar7;
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx() && (ludVar = this.f23880zb) != null && (ycxVar7 = this.fby) != null && ludVar.zb(i5, ycxVar7.ycx())) {
            return true;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lud() && (zbVar = this.f23872dj) != null && (ycxVar6 = this.f23874jc) != null && zbVar.zb(i5, ycxVar6.ycx())) {
            return true;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.zb() && (ycxVar4 = this.sya) != null && (ycxVar5 = this.f23875jw) != null && ycxVar4.zb(i5, ycxVar5.ycx())) {
            return true;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.sya() && (ulVar = this.lud) != null && (ycxVar3 = this.f23873ea) != null && ulVar.zb(i5, ycxVar3.ycx())) {
            return true;
        }
        if (!com.bytedance.sdk.component.lt.ycx.zb.ycx.dj() || (syaVar = this.f23876lt) == null || (ycxVar2 = this.f23877ok) == null || !syaVar.zb(i5, ycxVar2.ycx())) {
            return com.bytedance.sdk.component.lt.ycx.zb.ycx.lt() && (ltVar = this.f23879ul) != null && (ycxVar = this.f23878ry) != null && ltVar.zb(i5, ycxVar.ycx());
        }
        return true;
    }
}
