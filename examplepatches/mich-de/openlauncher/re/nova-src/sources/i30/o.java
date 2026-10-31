package i30;

import android.opengl.GLSurfaceView;
import androidx.compose.ui.node.LayoutNode;
import javax.microedition.khronos.egl.EGL10;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.egl.EGLDisplay;

/* loaded from: classes4.dex */
public final class o implements GLSurfaceView.EGLConfigChooser {

    /* renamed from: b, reason: collision with root package name */
    public static final int[] f61325b = {12324, 12323, 12322, 12321, 12325, 12326, 12328, 12327};

    /* renamed from: c, reason: collision with root package name */
    public static final String[] f61326c = {"R", "G", "B", "A", "D", "S", "ID", "CAVEAT"};

    /* renamed from: a, reason: collision with root package name */
    public final int[] f61327a = {12324, 5, 12323, 6, 12322, 5, 12321, 0, 12344};

    @Override // android.opengl.GLSurfaceView.EGLConfigChooser
    public final EGLConfig chooseConfig(EGL10 egl10, EGLDisplay eGLDisplay) {
        int[] iArr = new int[1];
        if (!egl10.eglChooseConfig(eGLDisplay, this.f61327a, null, 0, iArr)) {
            throw new RuntimeException("eglChooseConfig failed");
        }
        int i5 = iArr[0];
        if (i5 <= 0) {
            throw new RuntimeException("No configs match configSpec");
        }
        EGLConfig[] eGLConfigArr = new EGLConfig[i5];
        if (!egl10.eglChooseConfig(eGLDisplay, this.f61327a, eGLConfigArr, i5, iArr)) {
            throw new RuntimeException();
        }
        int[] iArr2 = new int[1];
        EGLConfig eGLConfig = null;
        int i11 = LayoutNode.NotPlacedPlaceOrder;
        for (int i12 = 0; i12 < i5; i12++) {
            if (!egl10.eglGetConfigAttrib(eGLDisplay, eGLConfigArr[i12], 12324, iArr2) || iArr2[0] != 8) {
                if (!egl10.eglGetConfigAttrib(eGLDisplay, eGLConfigArr[i12], 12326, iArr2)) {
                    throw new RuntimeException("eglGetConfigAttrib error: " + egl10.eglGetError());
                }
                int i13 = iArr2[0];
                if (i13 != 0 && i13 < i11) {
                    eGLConfig = eGLConfigArr[i12];
                    i11 = i13;
                }
            }
        }
        if (eGLConfig == null) {
            eGLConfig = eGLConfigArr[0];
        }
        egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, 12326, iArr2);
        int[] iArr3 = new int[1];
        StringBuilder sb2 = new StringBuilder();
        for (int i14 = 0; i14 < 8; i14++) {
            egl10.eglGetConfigAttrib(eGLDisplay, eGLConfig, f61325b[i14], iArr3);
            sb2.append(f61326c[i14] + iArr3[0] + " ");
        }
        mc0.d.f76206a.h("Config chosen: %s", sb2.toString());
        return eGLConfig;
    }
}
