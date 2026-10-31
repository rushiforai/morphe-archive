package com.bytedance.sdk.component.lt.ycx.ycx;

import android.content.Context;
import android.text.TextUtils;
import com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ul;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes2.dex */
public class sya implements dj {

    /* renamed from: dj, reason: collision with root package name */
    private ul f23881dj;

    /* renamed from: ea, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23882ea;
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx fby;

    /* renamed from: jc, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23883jc;

    /* renamed from: jw, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23884jw;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.lud f23885lt;
    private com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.lt lud;

    /* renamed from: ok, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23886ok;
    private com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.zb sya;

    /* renamed from: ul, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.dj.zb.ycx f23887ul;
    private com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.dj ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ycx f23888zb;

    public sya() {
        Context contextLud = com.bytedance.sdk.component.lt.ycx.ul.lt().lud();
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx()) {
            this.f23887ul = com.bytedance.sdk.component.lt.ycx.ul.lt().ea();
            this.ycx = new com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.dj(contextLud, this.f23887ul);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lud()) {
            if (com.bytedance.sdk.component.lt.ycx.ul.lt().jw() != null) {
                this.f23884jw = com.bytedance.sdk.component.lt.ycx.ul.lt().jw();
            } else {
                this.f23884jw = com.bytedance.sdk.component.lt.ycx.ul.lt().ok();
            }
            this.sya = new com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.zb(contextLud, this.f23884jw);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.zb()) {
            this.fby = com.bytedance.sdk.component.lt.ycx.ul.lt().ok();
            this.f23888zb = new com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ycx(contextLud, this.fby);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.sya()) {
            this.f23883jc = com.bytedance.sdk.component.lt.ycx.ul.lt().ok();
            this.f23881dj = new ul(contextLud, this.f23883jc);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.dj()) {
            this.f23882ea = com.bytedance.sdk.component.lt.ycx.ul.lt().ry();
            this.lud = new com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.lt(contextLud, this.f23882ea);
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lt()) {
            this.f23886ok = com.bytedance.sdk.component.lt.ycx.ul.lt().xkz();
            this.f23885lt = new com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.lud(contextLud, this.f23886ok);
        }
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public void ycx(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, int i5) {
        if (ycxVar == null) {
            return;
        }
        try {
            ycxVar.zb(System.currentTimeMillis());
            if (ycxVar.dj() == 0 && ycxVar.lud() == 1) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx()) {
                    this.ycx.ycx(ycxVar);
                    return;
                }
                return;
            }
            if (ycxVar.dj() == 3 && ycxVar.lud() == 2) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lud()) {
                    this.sya.ycx(ycxVar);
                    return;
                }
                return;
            }
            if (ycxVar.dj() == 0 && ycxVar.lud() == 2) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.zb()) {
                    this.f23888zb.ycx(ycxVar);
                    return;
                }
                return;
            }
            if (ycxVar.dj() == 1 && ycxVar.lud() == 2) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.sya()) {
                    this.f23881dj.ycx(ycxVar);
                }
            } else if (ycxVar.dj() == 1 && ycxVar.lud() == 3) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.dj()) {
                    this.lud.ycx(ycxVar);
                }
            } else if (ycxVar.dj() == 2 && ycxVar.lud() == 3 && com.bytedance.sdk.component.lt.ycx.zb.ycx.lt()) {
                this.f23885lt.ycx(ycxVar);
            }
        } catch (Throwable unused) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.rmy(), 1);
        }
    }

    public List<com.bytedance.sdk.component.lt.ycx.dj.ycx> zb(com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar, int i5) {
        if (ycxVar.dj() == 0 && ycxVar.lud() == 1 && com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx()) {
            if (this.f23887ul.zb() <= i5) {
                return null;
            }
            List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx = this.ycx.ycx(this.f23887ul.zb() - i5, "_id");
            if (listYcx != null && listYcx.size() != 0) {
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.tru(), 1);
            }
            return listYcx;
        }
        if (ycxVar.dj() == 3 && ycxVar.lud() == 2 && com.bytedance.sdk.component.lt.ycx.zb.ycx.lud()) {
            if (this.f23884jw.zb() > i5) {
                return this.sya.ycx(this.f23884jw.zb() - i5, "_id");
            }
        } else if (ycxVar.dj() == 0 && ycxVar.lud() == 2 && com.bytedance.sdk.component.lt.ycx.zb.ycx.zb()) {
            if (this.fby.zb() > i5) {
                List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx2 = this.f23888zb.ycx(this.fby.zb() - i5, "_id");
                if (listYcx2 != null && listYcx2.size() != 0) {
                    com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.bhi(), 1);
                }
                return listYcx2;
            }
        } else if (ycxVar.dj() == 1 && ycxVar.lud() == 2 && com.bytedance.sdk.component.lt.ycx.zb.ycx.sya()) {
            if (this.f23883jc.zb() > i5) {
                List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx3 = this.f23881dj.ycx(this.f23883jc.zb() - i5, "_id");
                if (listYcx3 != null && listYcx3.size() != 0) {
                    com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.av(), 1);
                }
                return listYcx3;
            }
        } else if (ycxVar.dj() == 1 && ycxVar.lud() == 3 && com.bytedance.sdk.component.lt.ycx.zb.ycx.dj()) {
            if (this.f23882ea.zb() > i5) {
                List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx4 = this.lud.ycx(this.f23882ea.zb() - i5, "_id");
                if (listYcx4 != null && listYcx4.size() != 0) {
                    com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.rmf(), 1);
                }
                return listYcx4;
            }
        } else if (ycxVar.dj() == 2 && ycxVar.lud() == 3 && com.bytedance.sdk.component.lt.ycx.zb.ycx.lt() && this.f23886ok.zb() > i5) {
            return this.f23885lt.ycx(this.f23886ok.zb() - i5, "_id");
        }
        return null;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public void ycx(int i5, List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list) {
        if (list == null || list.size() == 0 || list.get(0) == null) {
            return;
        }
        com.bytedance.sdk.component.lt.ycx.dj.ycx ycxVar = list.get(0);
        if (i5 == 200 || i5 == -1) {
            com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx ycxVar2 = com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj;
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar2.uz(), list.size());
            if (i5 != 200) {
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(ycxVar2.ui(), list.size());
            }
            if (ycxVar.dj() == 0 && ycxVar.lud() == 1) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx()) {
                    this.ycx.zb(list);
                    return;
                }
                return;
            }
            if (ycxVar.dj() == 3 && ycxVar.lud() == 2) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lud()) {
                    this.sya.zb(list);
                    return;
                }
                return;
            }
            if (ycxVar.dj() == 0 && ycxVar.lud() == 2) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.zb()) {
                    this.f23888zb.zb(list);
                    return;
                }
                return;
            }
            if (ycxVar.dj() == 1 && ycxVar.lud() == 2) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.sya()) {
                    this.f23881dj.zb(list);
                }
            } else if (ycxVar.dj() == 1 && ycxVar.lud() == 3) {
                if (com.bytedance.sdk.component.lt.ycx.zb.ycx.dj()) {
                    this.lud.zb(list);
                }
            } else if (ycxVar.dj() == 2 && ycxVar.lud() == 3 && com.bytedance.sdk.component.lt.ycx.zb.ycx.lt()) {
                this.f23885lt.zb(list);
            }
        }
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public List<com.bytedance.sdk.component.lt.ycx.dj.ycx> ycx(int i5, int i11, List<String> list) {
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx()) {
            List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx = this.ycx.ycx("_id");
            if (ycx(listYcx, list)) {
                listYcx.size();
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.tn(), 1);
                return listYcx;
            }
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lud()) {
            List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx2 = this.sya.ycx("_id");
            if (ycx(listYcx2, list)) {
                listYcx2.size();
                return listYcx2;
            }
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.zb()) {
            List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listYcx3 = this.f23888zb.ycx("_id");
            if (ycx(listYcx3, list)) {
                listYcx3.size();
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.dv(), 1);
                return listYcx3;
            }
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.sya()) {
            List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listZb = this.f23881dj.zb("_id");
            if (ycx(listZb, list)) {
                listZb.size();
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.oty(), 1);
                return listZb;
            }
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.dj()) {
            List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listZb2 = this.lud.zb("_id");
            if (ycx(listZb2, list)) {
                listZb2.size();
                com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.hf(), 1);
                return listZb2;
            }
        }
        if (!com.bytedance.sdk.component.lt.ycx.zb.ycx.lt()) {
            return null;
        }
        List<com.bytedance.sdk.component.lt.ycx.dj.ycx> listZb3 = this.f23885lt.zb("_id");
        if (!ycx(listZb3, list)) {
            return null;
        }
        listZb3.size();
        return listZb3;
    }

    private boolean ycx(List<com.bytedance.sdk.component.lt.ycx.dj.ycx> list, List<String> list2) {
        if (list != null && !list.isEmpty() && list2 != null && !list2.isEmpty()) {
            try {
                Iterator<com.bytedance.sdk.component.lt.ycx.dj.ycx> it = list.iterator();
                while (it.hasNext()) {
                    com.bytedance.sdk.component.lt.ycx.dj.ycx next = it.next();
                    if (next != null) {
                        String strSya = next.sya();
                        if (!TextUtils.isEmpty(strSya) && list2.contains(strSya)) {
                            it.remove();
                        }
                    }
                }
            } catch (Throwable th2) {
                th2.getMessage();
            }
        }
        return (list == null || list.isEmpty()) ? false : true;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public boolean ycx(int i5, boolean z11) {
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.lud ludVar;
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.lt ltVar;
        ul ulVar;
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ycx ycxVar;
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.zb zbVar;
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.dj djVar;
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.ycx() && (djVar = this.ycx) != null && djVar.ycx(i5)) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.xkz(), 1);
            return true;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.lud() && (zbVar = this.sya) != null && zbVar.ycx(i5)) {
            return true;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.zb() && (ycxVar = this.f23888zb) != null && ycxVar.ycx(i5)) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.syc(), 1);
            return true;
        }
        if (com.bytedance.sdk.component.lt.ycx.zb.ycx.sya() && (ulVar = this.f23881dj) != null && ulVar.ycx(i5)) {
            com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.dy(), 1);
            return true;
        }
        if (!com.bytedance.sdk.component.lt.ycx.zb.ycx.dj() || (ltVar = this.lud) == null || !ltVar.ycx(i5)) {
            return com.bytedance.sdk.component.lt.ycx.zb.ycx.lt() && (ludVar = this.f23885lt) != null && ludVar.ycx(i5);
        }
        com.bytedance.sdk.component.lt.ycx.sya.zb.ycx(com.bytedance.sdk.component.lt.ycx.zb.dj.f23908dj.wie(), 1);
        return true;
    }

    @Override // com.bytedance.sdk.component.lt.ycx.ycx.dj
    public void ycx(int i5, long j11) {
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.dj djVar = this.ycx;
        if (djVar != null) {
            djVar.ycx(i5, j11);
        }
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.zb zbVar = this.sya;
        if (zbVar != null) {
            zbVar.ycx(i5, j11);
        }
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.ycx ycxVar = this.f23888zb;
        if (ycxVar != null) {
            ycxVar.ycx(i5, j11);
        }
        ul ulVar = this.f23881dj;
        if (ulVar != null) {
            ulVar.ycx(i5, j11);
        }
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.lt ltVar = this.lud;
        if (ltVar != null) {
            ltVar.ycx(i5, j11);
        }
        com.bytedance.sdk.component.lt.ycx.ycx.ycx.ycx.lud ludVar = this.f23885lt;
        if (ludVar != null) {
            ludVar.ycx(i5, j11);
        }
    }
}
