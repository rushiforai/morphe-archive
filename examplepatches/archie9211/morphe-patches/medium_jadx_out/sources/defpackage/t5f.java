package defpackage;

import android.view.View;
import com.medium.reader.R;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class t5f {
    public static final f78 a;

    static {
        long[] jArr = hqb.a;
        a = new f78();
    }

    public static final l22 a(View view) {
        Object tag = view.getTag(R.id.androidx_compose_ui_view_composition_context);
        if (tag instanceof l22) {
            return (l22) tag;
        }
        return null;
    }
}
