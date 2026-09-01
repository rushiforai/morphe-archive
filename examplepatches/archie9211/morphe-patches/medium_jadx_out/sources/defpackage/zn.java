package defpackage;

import android.content.Context;
import android.view.PointerIcon;
import android.view.View;
import com.drew.metadata.photoshop.PhotoshopDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zn {
    public static final zn a = new zn();

    public final void a(View view, pb9 pb9Var) {
        Context context = view.getContext();
        PointerIcon systemIcon = pb9Var instanceof lr ? PointerIcon.getSystemIcon(context, ((lr) pb9Var).b) : PointerIcon.getSystemIcon(context, PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE);
        if (g76.L(view.getPointerIcon(), systemIcon)) {
            return;
        }
        view.setPointerIcon(systemIcon);
    }
}
