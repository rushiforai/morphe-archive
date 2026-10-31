package com.bytedance.adsdk.zb.ycx.zb;

import android.graphics.Path;
import com.bytedance.adsdk.zb.ycx.ycx.uh;
import java.util.List;

/* loaded from: classes2.dex */
public class ry extends ycx<com.bytedance.adsdk.zb.sya.zb.xkz, Path> {

    /* renamed from: dj, reason: collision with root package name */
    private final com.bytedance.adsdk.zb.sya.zb.xkz f23256dj;

    /* renamed from: lt, reason: collision with root package name */
    private List<uh> f23257lt;
    private final Path lud;

    public ry(List<com.bytedance.adsdk.zb.ul.ycx<com.bytedance.adsdk.zb.sya.zb.xkz>> list) {
        super(list);
        this.f23256dj = new com.bytedance.adsdk.zb.sya.zb.xkz();
        this.lud = new Path();
    }

    @Override // com.bytedance.adsdk.zb.ycx.zb.ycx
    /* renamed from: zb, reason: merged with bridge method [inline-methods] */
    public Path ycx(com.bytedance.adsdk.zb.ul.ycx<com.bytedance.adsdk.zb.sya.zb.xkz> ycxVar, float f11) {
        this.f23256dj.ycx(ycxVar.ycx, ycxVar.f23138zb, f11);
        com.bytedance.adsdk.zb.sya.zb.xkz xkzVarYcx = this.f23256dj;
        List<uh> list = this.f23257lt;
        if (list != null) {
            for (int size = list.size() - 1; size >= 0; size--) {
                xkzVarYcx = this.f23257lt.get(size).ycx(xkzVarYcx);
            }
        }
        com.bytedance.adsdk.zb.lt.lud.ycx(xkzVarYcx, this.lud);
        return this.lud;
    }

    public void ycx(List<uh> list) {
        this.f23257lt = list;
    }
}
