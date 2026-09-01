package defpackage;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Message;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewStub;
import android.view.Window;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.ListAdapter;
import android.widget.TextView;
import androidx.appcompat.app.AlertController$RecycleListView;
import androidx.core.widget.NestedScrollView;
import com.medium.reader.R;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zc {
    public final int A;
    public final boolean B;
    public final xc C;
    public final Context a;
    public final bd b;
    public final Window c;
    public CharSequence d;
    public CharSequence e;
    public AlertController$RecycleListView f;
    public Button g;
    public CharSequence h;
    public Message i;
    public Button j;
    public CharSequence k;
    public Message l;
    public Button m;
    public CharSequence n;
    public Message o;
    public NestedScrollView p;
    public Drawable q;
    public ImageView r;
    public TextView s;
    public TextView t;
    public View u;
    public ListAdapter v;
    public final int x;
    public final int y;
    public final int z;
    public int w = -1;
    public final u5 D = new u5(1, this);

    public zc(Context context, bd bdVar, Window window) {
        this.a = context;
        this.b = bdVar;
        this.c = window;
        xc xcVar = new xc();
        xcVar.b = new WeakReference(bdVar);
        this.C = xcVar;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(null, esa.e, R.attr.alertDialogStyle, 0);
        this.x = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        typedArrayObtainStyledAttributes.getResourceId(2, 0);
        this.y = typedArrayObtainStyledAttributes.getResourceId(4, 0);
        typedArrayObtainStyledAttributes.getResourceId(5, 0);
        this.z = typedArrayObtainStyledAttributes.getResourceId(7, 0);
        this.A = typedArrayObtainStyledAttributes.getResourceId(3, 0);
        this.B = typedArrayObtainStyledAttributes.getBoolean(6, true);
        typedArrayObtainStyledAttributes.getDimensionPixelSize(1, 0);
        typedArrayObtainStyledAttributes.recycle();
        bdVar.d().g(1);
    }

    public static ViewGroup a(View view, View view2) {
        if (view == null) {
            if (view2 instanceof ViewStub) {
                view2 = ((ViewStub) view2).inflate();
            }
            return (ViewGroup) view2;
        }
        if (view2 != null) {
            ViewParent parent = view2.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(view2);
            }
        }
        if (view instanceof ViewStub) {
            view = ((ViewStub) view).inflate();
        }
        return (ViewGroup) view;
    }

    public final void b(int i, CharSequence charSequence, DialogInterface.OnClickListener onClickListener) {
        Message messageObtainMessage = onClickListener != null ? this.C.obtainMessage(i, onClickListener) : null;
        if (i == -3) {
            this.n = charSequence;
            this.o = messageObtainMessage;
        } else if (i == -2) {
            this.k = charSequence;
            this.l = messageObtainMessage;
        } else if (i != -1) {
            ay0.e("Button does not exist");
        } else {
            this.h = charSequence;
            this.i = messageObtainMessage;
        }
    }
}
