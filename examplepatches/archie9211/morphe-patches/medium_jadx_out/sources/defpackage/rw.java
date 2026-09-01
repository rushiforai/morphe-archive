package defpackage;

import android.content.Context;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.Choreographer;
import androidx.profileinstaller.ProfileInstallerInitializer;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import java.util.Random;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class rw implements Choreographer.FrameCallback {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ rw(ProfileInstallerInitializer profileInstallerInitializer, Context context) {
        this.a = 1;
        this.b = context;
    }

    @Override // android.view.Choreographer.FrameCallback
    public final void doFrame(long j) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                ((v0) obj).run();
                break;
            case 1:
                (Build.VERSION.SDK_INT >= 28 ? uy.g(Looper.getMainLooper()) : new Handler(Looper.getMainLooper())).postDelayed(new p10((Context) obj, 1), new Random().nextInt(Math.max(PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE, 1)) + 5000);
                break;
            default:
                ((Runnable) obj).run();
                break;
        }
    }

    public /* synthetic */ rw(int i, Runnable runnable) {
        this.a = i;
        this.b = runnable;
    }
}
