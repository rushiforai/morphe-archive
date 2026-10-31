package m;

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
import java.lang.ref.WeakReference;

/* loaded from: classes2.dex */
public final class i {
    public final int A;
    public final int B;
    public final int C;
    public final int D;
    public final boolean E;
    public final h F;

    /* renamed from: a, reason: collision with root package name */
    public final Context f75269a;

    /* renamed from: b, reason: collision with root package name */
    public final k f75270b;

    /* renamed from: c, reason: collision with root package name */
    public final Window f75271c;

    /* renamed from: d, reason: collision with root package name */
    public CharSequence f75272d;

    /* renamed from: e, reason: collision with root package name */
    public CharSequence f75273e;

    /* renamed from: f, reason: collision with root package name */
    public AlertController$RecycleListView f75274f;

    /* renamed from: g, reason: collision with root package name */
    public View f75275g;

    /* renamed from: i, reason: collision with root package name */
    public Button f75277i;

    /* renamed from: j, reason: collision with root package name */
    public CharSequence f75278j;

    /* renamed from: k, reason: collision with root package name */
    public Message f75279k;

    /* renamed from: l, reason: collision with root package name */
    public Button f75280l;

    /* renamed from: m, reason: collision with root package name */
    public CharSequence f75281m;
    public Message n;
    public Button o;

    /* renamed from: p, reason: collision with root package name */
    public CharSequence f75282p;

    /* renamed from: q, reason: collision with root package name */
    public Message f75283q;

    /* renamed from: r, reason: collision with root package name */
    public NestedScrollView f75284r;

    /* renamed from: s, reason: collision with root package name */
    public Drawable f75285s;

    /* renamed from: t, reason: collision with root package name */
    public ImageView f75286t;

    /* renamed from: u, reason: collision with root package name */
    public TextView f75287u;

    /* renamed from: v, reason: collision with root package name */
    public TextView f75288v;

    /* renamed from: w, reason: collision with root package name */
    public View f75289w;

    /* renamed from: x, reason: collision with root package name */
    public ListAdapter f75290x;

    /* renamed from: z, reason: collision with root package name */
    public final int f75292z;

    /* renamed from: h, reason: collision with root package name */
    public boolean f75276h = false;

    /* renamed from: y, reason: collision with root package name */
    public int f75291y = -1;
    public final com.google.android.material.datepicker.n G = new com.google.android.material.datepicker.n(this, 4);

    public i(Context context, k kVar, Window window) {
        this.f75269a = context;
        this.f75270b = kVar;
        this.f75271c = window;
        h hVar = new h();
        hVar.f75266b = new WeakReference(kVar);
        this.F = hVar;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(null, l.a.f72892e, 2130968652, 0);
        this.f75292z = typedArrayObtainStyledAttributes.getResourceId(0, 0);
        typedArrayObtainStyledAttributes.getResourceId(2, 0);
        this.A = typedArrayObtainStyledAttributes.getResourceId(4, 0);
        this.B = typedArrayObtainStyledAttributes.getResourceId(5, 0);
        this.C = typedArrayObtainStyledAttributes.getResourceId(7, 0);
        this.D = typedArrayObtainStyledAttributes.getResourceId(3, 0);
        this.E = typedArrayObtainStyledAttributes.getBoolean(6, true);
        typedArrayObtainStyledAttributes.getDimensionPixelSize(1, 0);
        typedArrayObtainStyledAttributes.recycle();
        kVar.c().w(1);
    }

    public static boolean a(View view) {
        if (view.onCheckIsTextEditor()) {
            return true;
        }
        if (!(view instanceof ViewGroup)) {
            return false;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        while (childCount > 0) {
            childCount--;
            if (a(viewGroup.getChildAt(childCount))) {
                return true;
            }
        }
        return false;
    }

    public static ViewGroup b(View view, View view2) {
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

    public final void c(int i5, CharSequence charSequence, DialogInterface.OnClickListener onClickListener) {
        Message messageObtainMessage = onClickListener != null ? this.F.obtainMessage(i5, onClickListener) : null;
        if (i5 == -3) {
            this.f75282p = charSequence;
            this.f75283q = messageObtainMessage;
        } else if (i5 == -2) {
            this.f75281m = charSequence;
            this.n = messageObtainMessage;
        } else {
            if (i5 != -1) {
                throw new IllegalArgumentException("Button does not exist");
            }
            this.f75278j = charSequence;
            this.f75279k = messageObtainMessage;
        }
    }
}
