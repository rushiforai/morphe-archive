package defpackage;

import android.content.Context;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hta extends vz6 {
    public final int q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hta(Context context) {
        super(context);
        context.getClass();
        this.q = context.getResources().getDimensionPixelSize(R.dimen.common_padding_small) + context.getResources().getDimensionPixelSize(R.dimen.post_page_bottom_action_bar_height);
    }

    @Override // defpackage.vz6
    public final int a(int i, int i2, int i3, int i4, int i5) {
        return this.q - i;
    }
}
