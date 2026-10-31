package com.bytedance.adsdk.ugeno.yoga;

/* loaded from: classes2.dex */
public class ok extends YogaNodeJNIBase {
    public void finalize() throws Throwable {
        try {
            ry();
        } finally {
            super.finalize();
        }
    }

    public void ry() {
        long j11 = this.ycx;
        if (j11 != 0) {
            this.ycx = 0L;
            YogaNative.jni_YGNodeFinalizeJNI(j11);
        }
    }
}
