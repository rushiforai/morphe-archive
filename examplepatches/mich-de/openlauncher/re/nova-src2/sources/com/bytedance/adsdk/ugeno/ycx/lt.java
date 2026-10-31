package com.bytedance.adsdk.ugeno.ycx;

import android.content.Context;
import android.graphics.Canvas;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.List;

/* loaded from: classes2.dex */
public class lt {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.adsdk.ugeno.zb.sya f22531dj;
    private Context sya;
    private List<sya> ycx;

    /* renamed from: zb, reason: collision with root package name */
    private List<ycx> f22532zb;

    public lt(Context context, com.bytedance.adsdk.ugeno.zb.sya syaVar, List<sya> list) {
        this.f22531dj = syaVar;
        this.sya = context;
        this.ycx = list;
        dj();
    }

    private void dj() {
        this.f22532zb = new ArrayList();
        List<sya> list = this.ycx;
        if (list == null || list.isEmpty()) {
            return;
        }
        for (int i5 = 0; i5 < this.ycx.size(); i5++) {
            sya syaVar = this.ycx.get(i5);
            if (syaVar != null) {
                this.f22532zb.add(new ycx(this.sya, this.f22531dj, syaVar));
            }
        }
    }

    public void sya() {
        List<ycx> list = this.f22532zb;
        if (list == null || list.isEmpty()) {
            return;
        }
        for (ycx ycxVar : this.f22532zb) {
            if (ycxVar != null) {
                ycxVar.sya();
            }
        }
    }

    public void ycx() {
        List<ycx> list = this.f22532zb;
        if (list == null || list.isEmpty()) {
            return;
        }
        for (ycx ycxVar : this.f22532zb) {
            if (ycxVar != null) {
                ycxVar.dj();
            }
        }
    }

    public void zb() {
        List<ycx> list = this.f22532zb;
        if (list == null || list.isEmpty()) {
            return;
        }
        for (ycx ycxVar : this.f22532zb) {
            if (ycxVar != null) {
                ycxVar.ycx();
            }
        }
    }

    public void ycx(Canvas canvas) {
        List<ycx> list = this.f22532zb;
        if (list == null || list.isEmpty()) {
            return;
        }
        for (ycx ycxVar : this.f22532zb) {
            if (ycxVar != null) {
                ycxVar.ycx(canvas);
            }
        }
    }

    public void zb(Canvas canvas) {
        List<ycx> list = this.f22532zb;
        if (list == null || list.isEmpty()) {
            return;
        }
        for (ycx ycxVar : this.f22532zb) {
            if (ycxVar != null) {
                ycxVar.zb(canvas);
            }
        }
    }

    public void ycx(int i5, int i11) {
        List<ycx> list = this.f22532zb;
        if (list == null || list.isEmpty()) {
            return;
        }
        for (ycx ycxVar : this.f22532zb) {
            if (ycxVar != null) {
                ycxVar.ycx(i5, i11);
            }
        }
    }

    public ycx ycx(String str) {
        List<ycx> list = this.f22532zb;
        if (list != null && !list.isEmpty()) {
            for (ycx ycxVar : this.f22532zb) {
                if (ycxVar != null && TextUtils.equals(ycxVar.lud(), str)) {
                    return ycxVar;
                }
            }
        }
        return null;
    }
}
