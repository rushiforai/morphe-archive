package uf;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.BitmapFactory;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.os.Looper;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.CaptioningManager;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.android.exoplayer2.ExoPlaybackException;
import com.google.android.exoplayer2.ui.AspectRatioFrameLayout;
import com.google.android.exoplayer2.ui.SubtitleView;
import fe.a0;
import fe.l1;
import fe.o1;
import fe.x;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class u extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public final t f91223a;

    /* renamed from: b, reason: collision with root package name */
    public final AspectRatioFrameLayout f91224b;

    /* renamed from: c, reason: collision with root package name */
    public final View f91225c;

    /* renamed from: d, reason: collision with root package name */
    public final View f91226d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f91227e;

    /* renamed from: f, reason: collision with root package name */
    public final ImageView f91228f;

    /* renamed from: g, reason: collision with root package name */
    public final SubtitleView f91229g;

    /* renamed from: h, reason: collision with root package name */
    public final View f91230h;

    /* renamed from: i, reason: collision with root package name */
    public final TextView f91231i;

    /* renamed from: j, reason: collision with root package name */
    public final m f91232j;

    /* renamed from: k, reason: collision with root package name */
    public l1 f91233k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f91234l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f91235m;
    public final int n;
    public final int o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f91236p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f91237q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f91238r;

    /* renamed from: s, reason: collision with root package name */
    public int f91239s;

    public u(Context context) {
        CaptioningManager captioningManager;
        CaptioningManager captioningManager2;
        super(context, null, 0);
        t tVar = new t(this);
        this.f91223a = tVar;
        if (isInEditMode()) {
            this.f91224b = null;
            this.f91225c = null;
            this.f91226d = null;
            this.f91227e = false;
            this.f91228f = null;
            this.f91229g = null;
            this.f91230h = null;
            this.f91231i = null;
            this.f91232j = null;
            ImageView imageView = new ImageView(context);
            if (wf.v.f94376a >= 23) {
                Resources resources = getResources();
                imageView.setImageDrawable(resources.getDrawable(2131231282, null));
                imageView.setBackgroundColor(resources.getColor(2131099917, null));
            } else {
                Resources resources2 = getResources();
                imageView.setImageDrawable(resources2.getDrawable(2131231282));
                imageView.setBackgroundColor(resources2.getColor(2131099917));
            }
            addView(imageView);
            return;
        }
        LayoutInflater.from(context).inflate(2131624116, this);
        setDescendantFocusability(SQLiteDatabase.OPEN_PRIVATECACHE);
        AspectRatioFrameLayout aspectRatioFrameLayout = (AspectRatioFrameLayout) findViewById(2131427989);
        this.f91224b = aspectRatioFrameLayout;
        if (aspectRatioFrameLayout != null && aspectRatioFrameLayout.f31581c != 0) {
            aspectRatioFrameLayout.f31581c = 0;
            aspectRatioFrameLayout.requestLayout();
        }
        this.f91225c = findViewById(2131428022);
        if (aspectRatioFrameLayout != null) {
            ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-1, -1);
            SurfaceView surfaceView = new SurfaceView(context);
            this.f91226d = surfaceView;
            surfaceView.setLayoutParams(layoutParams);
            surfaceView.setOnClickListener(tVar);
            surfaceView.setClickable(false);
            aspectRatioFrameLayout.addView(surfaceView, 0);
        } else {
            this.f91226d = null;
        }
        this.f91227e = false;
        ImageView imageView2 = (ImageView) findViewById(2131427982);
        this.f91228f = imageView2;
        this.f91235m = imageView2 != null;
        SubtitleView subtitleView = (SubtitleView) findViewById(2131428025);
        this.f91229g = subtitleView;
        if (subtitleView != null) {
            int i5 = wf.v.f94376a;
            b bVar = b.f91093g;
            if (i5 >= 19 && !subtitleView.isInEditMode() && (captioningManager2 = (CaptioningManager) subtitleView.getContext().getSystemService("captioning")) != null && captioningManager2.isEnabled()) {
                CaptioningManager.CaptionStyle userStyle = captioningManager2.getUserStyle();
                if (i5 >= 21) {
                    bVar = new b(userStyle.hasForegroundColor() ? userStyle.foregroundColor : -1, userStyle.hasBackgroundColor() ? userStyle.backgroundColor : -16777216, userStyle.hasWindowColor() ? userStyle.windowColor : 0, userStyle.hasEdgeType() ? userStyle.edgeType : 0, userStyle.hasEdgeColor() ? userStyle.edgeColor : -1, userStyle.getTypeface());
                } else {
                    bVar = new b(userStyle.foregroundColor, userStyle.backgroundColor, 0, userStyle.edgeType, userStyle.edgeColor, userStyle.getTypeface());
                }
            }
            subtitleView.f31583b = bVar;
            subtitleView.a();
            float fontScale = 1.0f;
            if (i5 >= 19 && !subtitleView.isInEditMode() && (captioningManager = (CaptioningManager) subtitleView.getContext().getSystemService("captioning")) != null && captioningManager.isEnabled()) {
                fontScale = captioningManager.getFontScale();
            }
            subtitleView.f31584c = fontScale * 0.0533f;
            subtitleView.a();
        }
        View viewFindViewById = findViewById(2131427986);
        this.f91230h = viewFindViewById;
        if (viewFindViewById != null) {
            viewFindViewById.setVisibility(8);
        }
        this.n = 0;
        TextView textView = (TextView) findViewById(2131427994);
        this.f91231i = textView;
        if (textView != null) {
            textView.setVisibility(8);
        }
        m mVar = (m) findViewById(2131427990);
        View viewFindViewById2 = findViewById(2131427991);
        if (mVar != null) {
            this.f91232j = mVar;
        } else if (viewFindViewById2 != null) {
            m mVar2 = new m(context);
            this.f91232j = mVar2;
            mVar2.setId(2131427990);
            mVar2.setLayoutParams(viewFindViewById2.getLayoutParams());
            ViewGroup viewGroup = (ViewGroup) viewFindViewById2.getParent();
            int iIndexOfChild = viewGroup.indexOfChild(viewFindViewById2);
            viewGroup.removeView(viewFindViewById2);
            viewGroup.addView(mVar2, iIndexOfChild);
        } else {
            this.f91232j = null;
        }
        m mVar3 = this.f91232j;
        this.o = mVar3 != null ? 5000 : 0;
        this.f91238r = true;
        this.f91236p = true;
        this.f91237q = true;
        this.f91234l = mVar3 != null;
        if (mVar3 != null) {
            s sVar = mVar3.f91148a;
            int i11 = sVar.f91219z;
            if (i11 != 3 && i11 != 2) {
                sVar.e();
                sVar.h(2);
            }
            m mVar4 = this.f91232j;
            mVar4.getClass();
            mVar4.f91154d.add(tVar);
        }
        setClickable(true);
        h();
    }

    public static void a(TextureView textureView, int i5) {
        Matrix matrix = new Matrix();
        float width = textureView.getWidth();
        float height = textureView.getHeight();
        if (width != 0.0f && height != 0.0f && i5 != 0) {
            float f11 = width / 2.0f;
            float f12 = height / 2.0f;
            matrix.postRotate(i5, f11, f12);
            RectF rectF = new RectF(0.0f, 0.0f, width, height);
            RectF rectF2 = new RectF();
            matrix.mapRect(rectF2, rectF);
            matrix.postScale(width / rectF2.width(), height / rectF2.height(), f11, f12);
        }
        textureView.setTransform(matrix);
    }

    public final boolean b() {
        l1 l1Var = this.f91233k;
        return l1Var != null && ((a0) l1Var).X() && ((a0) this.f91233k).S();
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0053  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void c(boolean z11) {
        if (!(b() && this.f91237q) && j()) {
            m mVar = this.f91232j;
            boolean z12 = true;
            boolean z13 = mVar.e() && mVar.f91157e0 <= 0;
            l1 l1Var = this.f91233k;
            if (l1Var != null) {
                int iT = ((a0) l1Var).T();
                if (!this.f91236p || ((a0) this.f91233k).O().p()) {
                    z12 = false;
                } else if (iT != 1 && iT != 4) {
                    l1 l1Var2 = this.f91233k;
                    l1Var2.getClass();
                    if (((a0) l1Var2).S()) {
                    }
                }
            }
            if ((z11 || z13 || z12) && j()) {
                mVar.f91157e0 = z12 ? 0 : this.o;
                s sVar = mVar.f91148a;
                if (mVar.e()) {
                    sVar.f();
                }
                m mVar2 = sVar.f91196a;
                if (!mVar2.f()) {
                    mVar2.setVisibility(0);
                    mVar2.h();
                    View view = mVar2.o;
                    if (view != null) {
                        view.requestFocus();
                    }
                }
                sVar.j();
            }
        }
    }

    public final void d(a0 a0Var) {
        wf.a.i(Looper.myLooper() == Looper.getMainLooper());
        wf.a.e(a0Var == null || a0Var.f54700s == Looper.getMainLooper());
        l1 l1Var = this.f91233k;
        if (l1Var == a0Var) {
            return;
        }
        View view = this.f91226d;
        t tVar = this.f91223a;
        if (l1Var != null) {
            a0 a0Var2 = (a0) l1Var;
            a0Var2.d0(tVar);
            if (view instanceof TextureView) {
                TextureView textureView = (TextureView) view;
                a0Var2.s0();
                if (textureView == a0Var2.W) {
                    a0Var2.F();
                }
            } else if (view instanceof SurfaceView) {
                a0Var2.s0();
                SurfaceHolder holder = ((SurfaceView) view).getHolder();
                a0Var2.s0();
                if (holder != null && holder == a0Var2.T) {
                    a0Var2.F();
                }
            }
        }
        SubtitleView subtitleView = this.f91229g;
        if (subtitleView != null) {
            subtitleView.f31582a = Collections.EMPTY_LIST;
            subtitleView.a();
        }
        this.f91233k = a0Var;
        boolean zJ = j();
        m mVar = this.f91232j;
        if (zJ) {
            mVar.g(a0Var);
        }
        g();
        TextView textView = this.f91231i;
        if (textView != null) {
            l1 l1Var2 = this.f91233k;
            if (l1Var2 != null) {
                a0 a0Var3 = (a0) l1Var2;
                a0Var3.s0();
                ExoPlaybackException exoPlaybackException = a0Var3.f54691j0.f54769f;
            }
            textView.setVisibility(8);
        }
        i(true);
        if (a0Var == null) {
            if (mVar != null) {
                mVar.d();
                return;
            }
            return;
        }
        if (a0Var.t(27)) {
            if (view instanceof TextureView) {
                a0Var.m0((TextureView) view);
            } else if (view instanceof SurfaceView) {
                SurfaceView surfaceView = (SurfaceView) view;
                x xVar = a0Var.f54705x;
                a0Var.s0();
                if (surfaceView instanceof xf.h) {
                    a0Var.e0();
                    a0Var.l0(surfaceView);
                    a0Var.i0(surfaceView.getHolder());
                } else if (surfaceView instanceof yf.k) {
                    a0Var.e0();
                    a0Var.U = (yf.k) surfaceView;
                    o1 o1VarH = a0Var.H(a0Var.f54706y);
                    wf.a.i(!o1VarH.f54945g);
                    o1VarH.f54942d = 10000;
                    yf.k kVar = a0Var.U;
                    wf.a.i(true ^ o1VarH.f54945g);
                    o1VarH.f54943e = kVar;
                    o1VarH.c();
                    a0Var.U.f97293a.add(xVar);
                    a0Var.l0(a0Var.U.f97300h);
                    a0Var.i0(surfaceView.getHolder());
                } else {
                    SurfaceHolder holder2 = surfaceView.getHolder();
                    a0Var.s0();
                    if (holder2 == null) {
                        a0Var.F();
                    } else {
                        a0Var.e0();
                        a0Var.V = true;
                        a0Var.T = holder2;
                        holder2.addCallback(xVar);
                        Surface surface = holder2.getSurface();
                        if (surface == null || !surface.isValid()) {
                            a0Var.l0(null);
                            a0Var.a0(0, 0);
                        } else {
                            a0Var.l0(surface);
                            Rect surfaceFrame = holder2.getSurfaceFrame();
                            a0Var.a0(surfaceFrame.width(), surfaceFrame.height());
                        }
                    }
                }
            }
            f();
        }
        if (subtitleView != null && a0Var.t(28)) {
            a0Var.s0();
            List list = a0Var.f54679d0.f69522a;
            if (list == null) {
                list = Collections.EMPTY_LIST;
            }
            subtitleView.f31582a = list;
            subtitleView.a();
        }
        wf.h hVar = a0Var.f54694l;
        tVar.getClass();
        hVar.a(tVar);
        c(false);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        l1 l1Var = this.f91233k;
        if (l1Var != null && ((a0) l1Var).X()) {
            return super.dispatchKeyEvent(keyEvent);
        }
        int keyCode = keyEvent.getKeyCode();
        boolean z11 = keyCode == 19 || keyCode == 270 || keyCode == 22 || keyCode == 271 || keyCode == 20 || keyCode == 269 || keyCode == 21 || keyCode == 268 || keyCode == 23;
        m mVar = this.f91232j;
        if (z11 && j() && !mVar.e()) {
            c(true);
            return true;
        }
        if ((j() && mVar.a(keyEvent)) || super.dispatchKeyEvent(keyEvent)) {
            c(true);
            return true;
        }
        if (z11 && j()) {
            c(true);
        }
        return false;
    }

    public final void e() {
        if (!j() || this.f91233k == null) {
            return;
        }
        m mVar = this.f91232j;
        if (!mVar.e()) {
            c(true);
        } else if (this.f91238r) {
            mVar.d();
        }
    }

    public final void f() {
        xf.p pVar;
        l1 l1Var = this.f91233k;
        if (l1Var != null) {
            a0 a0Var = (a0) l1Var;
            a0Var.s0();
            pVar = a0Var.f54687h0;
        } else {
            pVar = xf.p.f95825e;
        }
        int i5 = pVar.f95826a;
        int i11 = pVar.f95827b;
        int i12 = pVar.f95828c;
        float f11 = (i11 == 0 || i5 == 0) ? 0.0f : (i5 * pVar.f95829d) / i11;
        View view = this.f91226d;
        if (view instanceof TextureView) {
            if (f11 > 0.0f && (i12 == 90 || i12 == 270)) {
                f11 = 1.0f / f11;
            }
            int i13 = this.f91239s;
            t tVar = this.f91223a;
            if (i13 != 0) {
                view.removeOnLayoutChangeListener(tVar);
            }
            this.f91239s = i12;
            if (i12 != 0) {
                view.addOnLayoutChangeListener(tVar);
            }
            a((TextureView) view, this.f91239s);
        }
        float f12 = this.f91227e ? 0.0f : f11;
        AspectRatioFrameLayout aspectRatioFrameLayout = this.f91224b;
        if (aspectRatioFrameLayout == null || aspectRatioFrameLayout.f31580b == f12) {
            return;
        }
        aspectRatioFrameLayout.f31580b = f12;
        aspectRatioFrameLayout.requestLayout();
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0024  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void g() {
        boolean z11;
        View view = this.f91230h;
        if (view != null) {
            l1 l1Var = this.f91233k;
            if (l1Var == null || ((a0) l1Var).T() != 2) {
                z11 = false;
            } else {
                z11 = true;
                int i5 = this.n;
                if (i5 != 2 && (i5 != 1 || !((a0) this.f91233k).S())) {
                }
            }
            view.setVisibility(z11 ? 0 : 8);
        }
    }

    public final void h() {
        m mVar = this.f91232j;
        if (mVar == null || !this.f91234l) {
            setContentDescription(null);
        } else if (mVar.e()) {
            setContentDescription(this.f91238r ? getResources().getString(2132017815) : null);
        } else {
            setContentDescription(getResources().getString(2132017829));
        }
    }

    public final void i(boolean z11) {
        l1 l1Var = this.f91233k;
        View view = this.f91225c;
        ImageView imageView = this.f91228f;
        boolean z12 = false;
        if (l1Var != null) {
            a0 a0Var = (a0) l1Var;
            if (!a0Var.P().f54719a.isEmpty()) {
                if (z11 && view != null) {
                    view.setVisibility(0);
                }
                if (a0Var.P().a(2)) {
                    if (imageView != null) {
                        imageView.setImageResource(17170445);
                        imageView.setVisibility(4);
                        return;
                    }
                    return;
                }
                if (view != null) {
                    view.setVisibility(0);
                }
                if (this.f91235m) {
                    wf.a.j(imageView);
                    a0Var.s0();
                    byte[] bArr = a0Var.P.f55046j;
                    if (bArr != null) {
                        BitmapDrawable bitmapDrawable = new BitmapDrawable(getResources(), BitmapFactory.decodeByteArray(bArr, 0, bArr.length));
                        boolean z13 = false;
                        int intrinsicWidth = bitmapDrawable.getIntrinsicWidth();
                        int intrinsicHeight = bitmapDrawable.getIntrinsicHeight();
                        if (intrinsicWidth > 0 && intrinsicHeight > 0) {
                            float f11 = intrinsicWidth / intrinsicHeight;
                            AspectRatioFrameLayout aspectRatioFrameLayout = this.f91224b;
                            if (aspectRatioFrameLayout != null && aspectRatioFrameLayout.f31580b != f11) {
                                aspectRatioFrameLayout.f31580b = f11;
                                aspectRatioFrameLayout.requestLayout();
                            }
                            ImageView imageView2 = this.f91228f;
                            imageView2.setImageDrawable(bitmapDrawable);
                            imageView2.setVisibility(0);
                            z13 = true;
                        }
                        z12 = z13;
                    }
                    if (z12) {
                        return;
                    }
                }
                if (imageView != null) {
                    imageView.setImageResource(17170445);
                    imageView.setVisibility(4);
                    return;
                }
                return;
            }
        }
        if (imageView != null) {
            imageView.setImageResource(17170445);
            imageView.setVisibility(4);
        }
        if (view != null) {
            view.setVisibility(0);
        }
    }

    public final boolean j() {
        if (!this.f91234l) {
            return false;
        }
        wf.a.j(this.f91232j);
        return true;
    }

    @Override // android.view.View
    public final boolean onTrackballEvent(MotionEvent motionEvent) {
        if (!j() || this.f91233k == null) {
            return false;
        }
        c(true);
        return true;
    }

    @Override // android.view.View
    public final boolean performClick() {
        e();
        return super.performClick();
    }

    @Override // android.view.View
    public final void setVisibility(int i5) {
        super.setVisibility(i5);
        View view = this.f91226d;
        if (view instanceof SurfaceView) {
            view.setVisibility(i5);
        }
    }
}
