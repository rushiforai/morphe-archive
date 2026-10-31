package com.bytedance.sdk.openadsdk.core.syc.sya;

import com.bytedance.sdk.component.utils.ul;
import java.io.File;
import java.util.List;

/* loaded from: classes2.dex */
public class sya extends com.bytedance.sdk.openadsdk.zb.sya {
    public sya(int i5, int i11) {
        super(i5, i11);
    }

    @Override // com.bytedance.sdk.openadsdk.zb.sya, com.bytedance.sdk.openadsdk.zb.zb
    public void ycx(List<File> list) {
        int size = list.size();
        if (ycx(0L, size)) {
            return;
        }
        for (File file : list) {
            ul.sya(file);
            size--;
            if (ycx(file, 0L, size)) {
                return;
            }
        }
    }

    public sya(int i5, int i11, boolean z11) {
        super(i5, i11);
        this.ycx = z11;
    }
}
