package defpackage;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.os.Binder;
import android.os.Process;
import android.util.Base64;
import android.view.View;
import androidx.core.os.OperationCanceledException;
import java.io.ByteArrayOutputStream;
import java.lang.ref.WeakReference;
import java.util.concurrent.Callable;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wf3 implements Callable {
    public final /* synthetic */ int a;
    public final Object b;

    public wf3(View view) {
        this.a = 2;
        this.b = new WeakReference(view);
    }

    @Override // java.util.concurrent.Callable
    public final Object call() {
        switch (this.a) {
            case 0:
                synchronized (((kg3) this.b)) {
                    try {
                        kg3 kg3Var = (kg3) this.b;
                        if (kg3Var.i != null) {
                            kg3Var.g0();
                            if (((kg3) this.b).D()) {
                                ((kg3) this.b).R();
                                ((kg3) this.b).k = 0;
                            }
                        }
                    } finally {
                    }
                }
                return null;
            case 1:
                o90 o90Var = (o90) this.b;
                AtomicBoolean atomicBoolean = o90Var.c;
                o90Var.d.set(true);
                try {
                    Process.setThreadPriority(10);
                    try {
                        o90Var.e.b();
                        break;
                    } catch (OperationCanceledException e) {
                        if (!atomicBoolean.get()) {
                            throw e;
                        }
                    }
                    Binder.flushPendingCommands();
                    return null;
                } catch (Throwable th) {
                    try {
                        atomicBoolean.set(true);
                        throw th;
                    } finally {
                        o90Var.a(null);
                    }
                }
            default:
                View view = (View) ((WeakReference) this.b).get();
                if (view == null || view.getWidth() == 0 || view.getHeight() == 0) {
                    return "";
                }
                Bitmap bitmapCreateBitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.RGB_565);
                bitmapCreateBitmap.getClass();
                view.draw(new Canvas(bitmapCreateBitmap));
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                bitmapCreateBitmap.compress(Bitmap.CompressFormat.JPEG, 10, byteArrayOutputStream);
                String strEncodeToString = Base64.encodeToString(byteArrayOutputStream.toByteArray(), 2);
                strEncodeToString.getClass();
                return strEncodeToString;
        }
    }

    public /* synthetic */ wf3(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }
}
