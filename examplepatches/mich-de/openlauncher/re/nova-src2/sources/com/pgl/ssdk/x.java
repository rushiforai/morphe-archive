package com.pgl.ssdk;

import android.content.Context;
import android.hardware.camera2.CameraManager;

/* loaded from: classes4.dex */
public class x {

    /* renamed from: a, reason: collision with root package name */
    public static int f42391a = -1;

    public static int a(Context context) {
        int i5 = f42391a;
        if (i5 != -1) {
            return i5;
        }
        CameraManager cameraManager = (CameraManager) context.getSystemService("camera");
        if (cameraManager != null) {
            try {
                f42391a = cameraManager.getCameraIdList().length;
            } catch (Throwable unused) {
                f42391a = -1;
            }
        } else {
            f42391a = -2;
        }
        return f42391a;
    }
}
