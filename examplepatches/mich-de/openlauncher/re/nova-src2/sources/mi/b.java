package mi;

import ab.e0;
import ads_mobile_sdk.db0;
import ads_mobile_sdk.el;
import ads_mobile_sdk.gu0;
import ads_mobile_sdk.ju;
import ads_mobile_sdk.mu0;
import ads_mobile_sdk.vw2;
import android.app.Activity;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.ProgressBar;
import b.b4;
import b.d0;
import com.google.android.libraries.ads.mobile.sdk.common.AdActivity;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;
import t70.m0;
import v70.m;
import ww.t;

/* loaded from: classes3.dex */
public final class b extends FrameLayout {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f76410d = 0;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f76411a;

    /* renamed from: b, reason: collision with root package name */
    public Object f76412b;

    /* renamed from: c, reason: collision with root package name */
    public Object f76413c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b(Context context, int i5) {
        super(context);
        this.f76411a = i5;
    }

    public void a() {
        m mVar = (m) this.f76413c;
        if (mVar != null) {
            b4.f15783a.getClass();
            m0.t((j0) ((db0) gu0.a()).f2348u.get(), null, null, new a60.a(mVar, null, 19), 3);
        }
    }

    public void b(el elVar, Activity activity) {
        removeAllViews();
        this.f76412b = elVar;
        a aVarL = elVar.b().l();
        if (((el) this.f76412b) == null && aVarL != null) {
            Context context = getContext();
            Intrinsics.f(context, "getContext(...)");
            setMinimumHeight((int) d0.a(context, aVarL.f76405b));
            Context context2 = getContext();
            Intrinsics.f(context2, "getContext(...)");
            setMinimumWidth((int) d0.a(context2, aVarL.f76404a));
        } else {
            setMinimumHeight(0);
            setMinimumWidth(0);
        }
        requestLayout();
        vw2 view = activity == null ? elVar.f2904c : elVar.getView(activity);
        ViewParent parent = view.getParent();
        if (parent instanceof ViewGroup) {
            String adapterClassName = elVar.a().getResponseInfo().getAdapterClassName();
            cz.b bVar = mu0.f7335a;
            mu0.c("Banner view provided from " + adapterClassName + " already has a parent view. Removing its old parent.", null);
            ((ViewGroup) parent).removeView(view);
        }
        addView(view);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() throws Resources.NotFoundException {
        switch (this.f76411a) {
            case 3:
                super.onAttachedToWindow();
                int dimensionPixelSize = getContext().getResources().getDimensionPixelSize(2131166450);
                ViewGroup.LayoutParams layoutParams = getLayoutParams();
                if (layoutParams == null) {
                    throw new NullPointerException("null cannot be cast to non-null type android.view.ViewGroup.LayoutParams");
                }
                layoutParams.width = dimensionPixelSize;
                layoutParams.height = dimensionPixelSize;
                setLayoutParams(layoutParams);
                return;
            default:
                super.onAttachedToWindow();
                return;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(Activity context) {
        super(context);
        this.f76411a = 0;
        Intrinsics.g(context, "context");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0040  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x004b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public b(AdActivity adActivity, String closeButtonAsset, ju juVar) throws Resources.NotFoundException {
        Drawable drawable;
        super(adActivity);
        this.f76411a = 1;
        Intrinsics.g(closeButtonAsset, "closeButtonAsset");
        int i5 = juVar.f5396c;
        int i11 = juVar.f5395b;
        int i12 = juVar.f5394a;
        this.f76413c = new ImageButton(adActivity);
        Resources resources = adActivity.getResources();
        Drawable drawable2 = null;
        if (closeButtonAsset.equals("white")) {
            drawable = resources.getDrawable(2131231041, null);
        } else {
            drawable = closeButtonAsset.equals("black") ? resources.getDrawable(2131231040, null) : drawable;
            if (drawable2 != null) {
                ((ImageButton) this.f76413c).setImageResource(17301527);
            } else {
                ((ImageButton) this.f76413c).setImageDrawable(drawable2);
                ((ImageButton) this.f76413c).setScaleType(ImageView.ScaleType.CENTER);
            }
            ((ImageButton) this.f76413c).setBackgroundColor(0);
            ((ImageButton) this.f76413c).setPadding(d0.b(adActivity, i12), d0.b(adActivity, 0), d0.b(adActivity, i11), d0.b(adActivity, i5));
            ((ImageButton) this.f76413c).setContentDescription("Fullscreen ad close button");
            final int i13 = 0;
            setOnClickListener(new View.OnClickListener(this) { // from class: b.m4

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ mi.b f15948b;

                {
                    this.f15948b = this;
                }

                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    switch (i13) {
                        case 0:
                            c3.c1 c1Var = (c3.c1) this.f15948b.f76412b;
                            if (c1Var != null) {
                                c1Var.invoke();
                                break;
                            }
                            break;
                        default:
                            c3.c1 c1Var2 = (c3.c1) this.f15948b.f76412b;
                            if (c1Var2 != null) {
                                c1Var2.invoke();
                                break;
                            }
                            break;
                    }
                }
            });
            final int i14 = 1;
            ((ImageButton) this.f76413c).setOnClickListener(new View.OnClickListener(this) { // from class: b.m4

                /* renamed from: b, reason: collision with root package name */
                public final /* synthetic */ mi.b f15948b;

                {
                    this.f15948b = this;
                }

                @Override // android.view.View.OnClickListener
                public final void onClick(View view) {
                    switch (i14) {
                        case 0:
                            c3.c1 c1Var = (c3.c1) this.f15948b.f76412b;
                            if (c1Var != null) {
                                c1Var.invoke();
                                break;
                            }
                            break;
                        default:
                            c3.c1 c1Var2 = (c3.c1) this.f15948b.f76412b;
                            if (c1Var2 != null) {
                                c1Var2.invoke();
                                break;
                            }
                            break;
                    }
                }
            });
            addView((ImageButton) this.f76413c, new FrameLayout.LayoutParams(d0.b(adActivity, i12 + 50 + i11), d0.b(adActivity, i5 + 50)));
        }
        drawable2 = drawable;
        if (drawable2 != null) {
        }
        ((ImageButton) this.f76413c).setBackgroundColor(0);
        ((ImageButton) this.f76413c).setPadding(d0.b(adActivity, i12), d0.b(adActivity, 0), d0.b(adActivity, i11), d0.b(adActivity, i5));
        ((ImageButton) this.f76413c).setContentDescription("Fullscreen ad close button");
        final int i132 = 0;
        setOnClickListener(new View.OnClickListener(this) { // from class: b.m4

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ mi.b f15948b;

            {
                this.f15948b = this;
            }

            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                switch (i132) {
                    case 0:
                        c3.c1 c1Var = (c3.c1) this.f15948b.f76412b;
                        if (c1Var != null) {
                            c1Var.invoke();
                            break;
                        }
                        break;
                    default:
                        c3.c1 c1Var2 = (c3.c1) this.f15948b.f76412b;
                        if (c1Var2 != null) {
                            c1Var2.invoke();
                            break;
                        }
                        break;
                }
            }
        });
        final int i142 = 1;
        ((ImageButton) this.f76413c).setOnClickListener(new View.OnClickListener(this) { // from class: b.m4

            /* renamed from: b, reason: collision with root package name */
            public final /* synthetic */ mi.b f15948b;

            {
                this.f15948b = this;
            }

            @Override // android.view.View.OnClickListener
            public final void onClick(View view) {
                switch (i142) {
                    case 0:
                        c3.c1 c1Var = (c3.c1) this.f15948b.f76412b;
                        if (c1Var != null) {
                            c1Var.invoke();
                            break;
                        }
                        break;
                    default:
                        c3.c1 c1Var2 = (c3.c1) this.f15948b.f76412b;
                        if (c1Var2 != null) {
                            c1Var2.invoke();
                            break;
                        }
                        break;
                }
            }
        });
        addView((ImageButton) this.f76413c, new FrameLayout.LayoutParams(d0.b(adActivity, i12 + 50 + i11), d0.b(adActivity, i5 + 50)));
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 2130970178);
        this.f76411a = 3;
        Animation animationLoadAnimation = AnimationUtils.loadAnimation(context, 2130772045);
        animationLoadAnimation.setAnimationListener(new t(this, 0));
        this.f76412b = animationLoadAnimation;
        Animation animationLoadAnimation2 = AnimationUtils.loadAnimation(context, 2130772046);
        animationLoadAnimation2.setAnimationListener(new t(this, 1));
        this.f76413c = animationLoadAnimation2;
        LayoutInflater.from(context).inflate(2131624404, this);
        if (((ProgressBar) e0.x(2131427633, this)) != null) {
            setBackgroundResource(2131232127);
            setClipToOutline(true);
            setVisibility(4);
            return;
        }
        throw new NullPointerException("Missing required view with ID: ".concat(getResources().getResourceName(2131427633)));
    }
}
