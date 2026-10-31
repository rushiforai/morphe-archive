package com.bytedance.adsdk.zb.ycx.ycx;

import android.graphics.Path;
import com.bytedance.adsdk.zb.sya.zb.uh;
import com.bytedance.adsdk.zb.ycx.zb.ycx;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class pmi implements ry, ycx.InterfaceC0028ycx {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.jw f23192dj;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f23193lt;
    private final com.bytedance.adsdk.zb.ycx.zb.ry lud;
    private final boolean sya;

    /* renamed from: zb, reason: collision with root package name */
    private final String f23195zb;
    private final Path ycx = new Path();

    /* renamed from: ul, reason: collision with root package name */
    private final zb f23194ul = new zb();

    public pmi(com.bytedance.adsdk.zb.jw jwVar, com.bytedance.adsdk.zb.sya.sya.ycx ycxVar, com.bytedance.adsdk.zb.sya.zb.wie wieVar) {
        this.f23195zb = wieVar.ycx();
        this.sya = wieVar.sya();
        this.f23192dj = jwVar;
        com.bytedance.adsdk.zb.ycx.zb.ry ryVarYcx = wieVar.zb().ycx();
        this.lud = ryVarYcx;
        ycxVar.ycx(ryVarYcx);
        ryVarYcx.ycx(this);
    }

    private void zb() {
        this.f23193lt = false;
        this.f23192dj.invalidateSelf();
    }

    @Override // com.bytedance.adsdk.zb.ycx.ycx.ry
    public Path dj() {
        if (this.f23193lt) {
            return this.ycx;
        }
        this.ycx.reset();
        if (this.sya) {
            this.f23193lt = true;
            return this.ycx;
        }
        Path pathUl = this.lud.ul();
        if (pathUl == null) {
            return this.ycx;
        }
        this.ycx.set(pathUl);
        this.ycx.setFillType(Path.FillType.EVEN_ODD);
        this.f23194ul.ycx(this.ycx);
        this.f23193lt = true;
        return this.ycx;
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx.InterfaceC0028ycx
    public void ycx() {
        zb();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0026  */
    @Override // com.bytedance.adsdk.zb.ycx.ycx.sya
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public void ycx(List<sya> list, List<sya> list2) {
        ArrayList arrayList = null;
        for (int i5 = 0; i5 < list.size(); i5++) {
            sya syaVar = list.get(i5);
            if (syaVar instanceof thx) {
                thx thxVar = (thx) syaVar;
                if (thxVar.zb() == uh.ycx.SIMULTANEOUSLY) {
                    this.f23194ul.ycx(thxVar);
                    thxVar.ycx(this);
                } else if (syaVar instanceof uh) {
                    if (arrayList == null) {
                        arrayList = new ArrayList();
                    }
                    arrayList.add((uh) syaVar);
                }
            }
        }
        this.lud.ycx((List<uh>) arrayList);
    }
}
