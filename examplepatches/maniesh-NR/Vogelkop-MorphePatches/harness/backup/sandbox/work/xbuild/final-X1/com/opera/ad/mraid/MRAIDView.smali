.class public Lcom/opera/ad/mraid/MRAIDView;
.super Laoo;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation


# static fields
.field public static final synthetic e0:I


# instance fields
.field public final A:Landroid/app/Activity;

.field public final B:Landroid/view/GestureDetector;

.field public C:B

.field public D:Z

.field public E:Z

.field public final F:Lyg8;

.field public final G:Lsa2;

.field public H:Landroid/util/DisplayMetrics;

.field public I:I

.field public J:Landroid/graphics/Rect;

.field public K:Landroid/graphics/Rect;

.field public final L:Lfr;

.field public final M:Lfr;

.field public N:Z

.field public O:Z

.field public P:Z

.field public Q:Z

.field public R:Z

.field public S:Z

.field public T:Landroid/view/View;

.field public U:Z

.field public V:Z

.field public W:I

.field public a0:Z

.field public final b0:I

.field public final c0:Landroid/os/Handler;

.field public d0:J

.field public u:Lb5d;

.field public v:Lb5d;

.field public w:Lb5d;

.field public x:Landroid/widget/RelativeLayout;

.field public y:Landroid/widget/ImageButton;

.field public final z:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 7

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Laoo;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->z:Landroid/content/Context;

    invoke-static {p0}, Lupj;->e(Landroid/view/View;)Landroid/app/Activity;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->A:Landroid/app/Activity;

    const/4 v0, 0x0

    iput-byte v0, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    iput-boolean v0, p0, Lcom/opera/ad/mraid/MRAIDView;->D:Z

    iput-boolean v0, p0, Lcom/opera/ad/mraid/MRAIDView;->E:Z

    new-instance v1, Lyg8;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    const/4 v2, 0x1

    iput-boolean v2, v1, Lyg8;->b:Z

    const/4 v3, 0x2

    iput v3, v1, Lyg8;->a:I

    iput-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->F:Lyg8;

    new-instance v1, Lsa2;

    const/16 v4, 0x16

    invoke-direct {v1, v4, v0}, Lsa2;-><init>(BZ)V

    iput v3, v1, Lsa2;->b:I

    iput-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->G:Lsa2;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->H:Landroid/util/DisplayMetrics;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->J:Landroid/graphics/Rect;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->K:Landroid/graphics/Rect;

    new-instance v1, Lfr;

    const/16 v3, 0xc

    invoke-direct {v1, v3, v0}, Lfr;-><init>(BZ)V

    iput-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->L:Lfr;

    new-instance v1, Lfr;

    invoke-direct {v1, v3, v0}, Lfr;-><init>(BZ)V

    iput-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->M:Lfr;

    if-eqz p1, :cond_5c

    invoke-virtual {p1}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result p1

    :goto_59
    iput p1, p0, Lcom/opera/ad/mraid/MRAIDView;->b0:I

    goto :goto_5e

    :cond_5c
    const/4 p1, -0x1

    goto :goto_59

    :goto_5e
    new-instance p1, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lmz4;

    invoke-direct {v1, v2}, Lmz4;-><init>(B)V

    invoke-direct {p1, v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->B:Landroid/view/GestureDetector;

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->c0:Landroid/os/Handler;

    iget-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    iput-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->w:Lb5d;

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final A(Landroid/content/Context;)Lb5d;
    .registers 5

    new-instance v0, Lb5d;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lb5d;-><init>(Lcom/opera/ad/mraid/MRAIDView;Landroid/content/Context;)V

    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p1, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/view/View;->setScrollContainer(Z)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    const/high16 v1, 0x2000000

    invoke-virtual {v0, v1}, Landroid/view/View;->setScrollBarStyle(I)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {v0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setAllowContentAccess(Z)V

    invoke-virtual {v1, p1}, Landroid/webkit/WebSettings;->setAllowFileAccess(Z)V

    new-instance v1, La5d;

    invoke-direct {v1, p1}, La5d;-><init>(B)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    new-instance v1, Lc5d;

    invoke-direct {v1, p0, p1}, Lc5d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    return-object v0
.end method

.method public final B(Lb5d;)V
    .registers 8

    const/4 v0, 0x2

    iput-byte v0, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->A:Landroid/app/Activity;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_72

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v3

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit16 v4, v3, 0x400

    if-eqz v4, :cond_19

    move v4, v2

    goto :goto_1a

    :cond_19
    move v4, v1

    :goto_1a
    iput-boolean v4, p0, Lcom/opera/ad/mraid/MRAIDView;->U:Z

    const/16 v4, 0x800

    and-int/2addr v3, v4

    if-eqz v3, :cond_23

    move v3, v2

    goto :goto_24

    :cond_23
    move v3, v1

    :goto_24
    iput-boolean v3, p0, Lcom/opera/ad/mraid/MRAIDView;->V:Z

    const/16 v3, -0x9

    iput v3, p0, Lcom/opera/ad/mraid/MRAIDView;->W:I

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v3

    if-eqz v3, :cond_3a

    invoke-virtual {v3}, Landroid/app/ActionBar;->isShowing()Z

    move-result v5

    iput-boolean v5, p0, Lcom/opera/ad/mraid/MRAIDView;->a0:Z

    invoke-virtual {v3}, Landroid/app/ActionBar;->hide()V

    goto :goto_5d

    :cond_3a
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/opera/ad/mraid/MRAIDView;->T:Landroid/view/View;

    const v3, 0x1020016

    :try_start_40
    invoke-virtual {v0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    iput-object v3, p0, Lcom/opera/ad/mraid/MRAIDView;->T:Landroid/view/View;
    :try_end_4c
    .catch Ljava/lang/NullPointerException; {:try_start_40 .. :try_end_4c} :catch_4c

    :catch_4c
    iget-object v3, p0, Lcom/opera/ad/mraid/MRAIDView;->T:Landroid/view/View;

    if-eqz v3, :cond_5d

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    iput v3, p0, Lcom/opera/ad/mraid/MRAIDView;->W:I

    iget-object v3, p0, Lcom/opera/ad/mraid/MRAIDView;->T:Landroid/view/View;

    const/16 v5, 0x8

    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_5d
    :goto_5d
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/16 v5, 0x400

    invoke-virtual {v3, v5}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/view/Window;->clearFlags(I)V

    iget-boolean v3, p0, Lcom/opera/ad/mraid/MRAIDView;->U:Z

    xor-int/2addr v3, v2

    iput-boolean v3, p0, Lcom/opera/ad/mraid/MRAIDView;->P:Z

    :cond_72
    new-instance v3, Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/opera/ad/mraid/MRAIDView;->z:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    move-result v3

    if-nez v3, :cond_8a

    invoke-virtual {p1, v2}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {p1, v2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    :cond_8a
    iget-object v3, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    invoke-virtual {v3, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    new-instance v3, Landroid/widget/ImageButton;

    invoke-direct {v3, v4}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Lcom/opera/ad/mraid/MRAIDView;->y:Landroid/widget/ImageButton;

    invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->y:Landroid/widget/ImageButton;

    new-instance v3, Lic;

    const/4 v4, 0x7

    invoke-direct {v3, p0, v4}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    if-ne p1, v1, :cond_c2

    iget-boolean v1, p0, Lcom/opera/ad/mraid/MRAIDView;->E:Z

    if-nez v1, :cond_c2

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->y:Landroid/widget/ImageButton;

    if-eqz v1, :cond_c2

    iget-object v3, p0, Laoo;->a:Landroid/content/Context;

    invoke-static {v3}, Lbbp;->g(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->y:Landroid/widget/ImageButton;

    sget-object v3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_c2
    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->y:Landroid/widget/ImageButton;

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->H:Landroid/util/DisplayMetrics;

    const/high16 v3, 0x42480000    # 50.0f

    invoke-static {v2, v3, v1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v1

    float-to-int v1, v1

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    const/16 v4, 0xb

    const/16 v5, 0xa

    if-ne p1, v1, :cond_e6

    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_10f

    :cond_e6
    if-nez p1, :cond_10f

    iget-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->G:Lsa2;

    iget v1, p1, Lsa2;->b:I

    packed-switch v1, :pswitch_data_12a

    goto :goto_fd

    :pswitch_f0
    invoke-virtual {v3, v4}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_fd

    :pswitch_f4
    const/16 v1, 0xe

    :goto_f6
    invoke-virtual {v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_fd

    :pswitch_fa
    const/16 v1, 0x9

    goto :goto_f6

    :goto_fd
    iget p1, p1, Lsa2;->b:I

    packed-switch p1, :pswitch_data_13c

    goto :goto_10f

    :pswitch_103
    const/16 p1, 0xc

    :goto_105
    invoke-virtual {v3, p1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    goto :goto_10f

    :pswitch_109
    const/16 p1, 0xf

    goto :goto_105

    :pswitch_10c
    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    :cond_10f
    :goto_10f
    iget-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->y:Landroid/widget/ImageButton;

    invoke-virtual {p1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-static {v0, p0}, Lupj;->f(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    if-eqz p1, :cond_127

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    invoke-direct {v1, v3, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_127
    iput-boolean v2, p0, Lcom/opera/ad/mraid/MRAIDView;->Q:Z

    return-void

    :pswitch_data_12a
    .packed-switch 0x0
        :pswitch_fa
        :pswitch_f4
        :pswitch_f0
        :pswitch_f4
        :pswitch_fa
        :pswitch_f4
        :pswitch_f0
    .end packed-switch

    :pswitch_data_13c
    .packed-switch 0x0
        :pswitch_10c
        :pswitch_10c
        :pswitch_10c
        :pswitch_109
        :pswitch_103
        :pswitch_103
        :pswitch_103
    .end packed-switch
.end method

.method public final C(Z)V
    .registers 8

    const/4 v0, 0x2

    new-array v0, v0, [I

    if-eqz p1, :cond_8

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->w:Lb5d;

    goto :goto_9

    :cond_8
    move-object v1, p0

    :goto_9
    invoke-virtual {v1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v2, 0x0

    aget v2, v0, v2

    const/4 v3, 0x1

    aget v0, v0, v3

    iget v3, p0, Lcom/opera/ad/mraid/MRAIDView;->I:I

    sub-int/2addr v0, v3

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    if-eqz p1, :cond_22

    iget-object v4, p0, Lcom/opera/ad/mraid/MRAIDView;->J:Landroid/graphics/Rect;

    goto :goto_24

    :cond_22
    iget-object v4, p0, Lcom/opera/ad/mraid/MRAIDView;->K:Landroid/graphics/Rect;

    :goto_24
    iget v5, v4, Landroid/graphics/Rect;->left:I

    if-ne v2, v5, :cond_38

    iget v5, v4, Landroid/graphics/Rect;->top:I

    if-ne v0, v5, :cond_38

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v5

    if-ne v3, v5, :cond_38

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v4

    if-eq v1, v4, :cond_56

    :cond_38
    new-instance v4, Landroid/graphics/Rect;

    add-int/2addr v3, v2

    add-int/2addr v1, v0

    if-eqz p1, :cond_44

    invoke-direct {v4, v2, v0, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v4, p0, Lcom/opera/ad/mraid/MRAIDView;->J:Landroid/graphics/Rect;

    goto :goto_49

    :cond_44
    invoke-direct {v4, v2, v0, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v4, p0, Lcom/opera/ad/mraid/MRAIDView;->K:Landroid/graphics/Rect;

    :goto_49
    iget-boolean v0, p0, Lcom/opera/ad/mraid/MRAIDView;->N:Z

    if-eqz v0, :cond_56

    if-eqz p1, :cond_53

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->w()V

    return-void

    :cond_53
    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->x()V

    :cond_56
    return-void
.end method

.method public final D(Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lcom/opera/ad/mraid/MRAIDView;->w:Lb5d;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_11

    new-instance v0, Lz4d;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lz4d;-><init>(B)V

    invoke-virtual {p0, p1, v0}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    :cond_11
    return-void
.end method

.method public final E(I)I
    .registers 2

    int-to-float p1, p1

    iget-object p0, p0, Lcom/opera/ad/mraid/MRAIDView;->z:Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr p1, p0

    const/high16 p0, 0x3f000000    # 0.5f

    add-float/2addr p1, p0

    float-to-int p0, p1

    return p0
.end method

.method public final F(I)V
    .registers 3

    if-nez p1, :cond_4

    const/4 p1, 0x1

    goto :goto_5

    :cond_4
    const/4 p1, 0x0

    :goto_5
    iget-boolean v0, p0, Lcom/opera/ad/mraid/MRAIDView;->D:Z

    if-eq p1, v0, :cond_16

    iput-boolean p1, p0, Lcom/opera/ad/mraid/MRAIDView;->D:Z

    iget-boolean p1, p0, Lcom/opera/ad/mraid/MRAIDView;->N:Z

    if-eqz p1, :cond_16

    iget-boolean p1, p0, Lcom/opera/ad/mraid/MRAIDView;->O:Z

    if-eqz p1, :cond_16

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->J()V

    :cond_16
    return-void
.end method

.method public final G()V
    .registers 5

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->A:Landroid/app/Activity;

    if-eqz v0, :cond_47

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    const v2, 0x1020002

    invoke-virtual {v0, v2}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p0, Lcom/opera/ad/mraid/MRAIDView;->I:I

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->M:Lfr;

    iget v1, v1, Lfr;->c:I

    iget v2, p0, Lcom/opera/ad/mraid/MRAIDView;->I:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/opera/ad/mraid/MRAIDView;->L:Lfr;

    iget v3, v2, Lfr;->b:I

    if-ne v0, v3, :cond_3c

    iget v3, v2, Lfr;->c:I

    if-eq v1, v3, :cond_47

    :cond_3c
    iput v0, v2, Lfr;->b:I

    iput v1, v2, Lfr;->c:I

    iget-boolean v0, p0, Lcom/opera/ad/mraid/MRAIDView;->N:Z

    if-eqz v0, :cond_47

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->y()V

    :cond_47
    return-void
.end method

.method public final H()V
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->H:Landroid/util/DisplayMetrics;

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iget-object v2, p0, Lcom/opera/ad/mraid/MRAIDView;->M:Lfr;

    iget v3, v2, Lfr;->b:I

    if-ne v1, v3, :cond_1a

    iget v3, v2, Lfr;->c:I

    if-eq v0, v3, :cond_25

    :cond_1a
    iput v1, v2, Lfr;->b:I

    iput v0, v2, Lfr;->c:I

    iget-boolean v0, p0, Lcom/opera/ad/mraid/MRAIDView;->N:Z

    if-eqz v0, :cond_25

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->z()V

    :cond_25
    return-void
.end method

.method public final I()V
    .registers 6

    const-string v0, "resized"

    const-string v1, "hidden"

    const-string v2, "loading"

    const-string v3, "default"

    const-string v4, "expanded"

    filled-new-array {v2, v3, v4, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "mraid.fireStateChangeEvent(\'"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-byte v2, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    aget-object v0, v0, v2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\');"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    return-void
.end method

.method public final J()V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "mraid.fireViewableChangeEvent("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/opera/ad/mraid/MRAIDView;->D:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ");"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    return-void
.end method

.method public close()V
    .registers 3

    new-instance v0, Lx4d;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lx4d;-><init>(Lcom/opera/ad/mraid/MRAIDView;B)V

    iget-object p0, p0, Lcom/opera/ad/mraid/MRAIDView;->c0:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public expand(Ljava/lang/String;)V
    .registers 5

    iget-byte v0, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    const/4 v1, 0x3

    const/4 v2, 0x1

    if-eq v0, v2, :cond_8

    if-ne v0, v1, :cond_4c

    :cond_8
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_36

    iget-byte p1, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    if-ne p1, v2, :cond_2c

    iget-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    if-eqz p1, :cond_28

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_2e

    :cond_28
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    goto :goto_2e

    :cond_2c
    if-eq p1, v1, :cond_34

    :goto_2e
    iget-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    invoke-virtual {p0, p1}, Lcom/opera/ad/mraid/MRAIDView;->B(Lb5d;)V

    return-void

    :cond_34
    const/4 p0, 0x0

    throw p0

    :cond_36
    :try_start_36
    const-string v0, "UTF-8"

    invoke-static {p1, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_3c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_36 .. :try_end_3c} :catch_4c

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Ly4d;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p1, v2}, Ly4d;-><init>(Lcom/opera/ad/mraid/MRAIDView;Ljava/lang/String;B)V

    const-string p0, "2-part-content"

    invoke-direct {v0, v1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :catch_4c
    :cond_4c
    return-void
.end method

.method public final k()Landroid/view/View;
    .registers 2

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    if-nez v0, :cond_c

    iget-object v0, p0, Laoo;->a:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->A(Landroid/content/Context;)Lb5d;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    :cond_c
    return-object v0
.end method

.method public final o()V
    .registers 3

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    if-eqz v0, :cond_19

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    invoke-static {v0}, Lupj;->j(Landroid/view/View;)V

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    invoke-virtual {v0}, Lb5d;->destroy()V

    iput-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    :cond_19
    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->H:Landroid/util/DisplayMetrics;

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    iget-byte p2, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    iget-boolean p3, p0, Lcom/opera/ad/mraid/MRAIDView;->P:Z

    if-nez p3, :cond_5a

    const/4 p3, 0x2

    const/4 p4, 0x3

    if-eq p2, p3, :cond_f

    if-ne p2, p4, :cond_15

    :cond_f
    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->H()V

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->G()V

    :cond_15
    iget-boolean p2, p0, Lcom/opera/ad/mraid/MRAIDView;->S:Z

    const/4 p3, 0x0

    if-eqz p2, :cond_29

    iput-boolean p3, p0, Lcom/opera/ad/mraid/MRAIDView;->S:Z

    new-instance p2, Landroid/graphics/Rect;

    iget-object p3, p0, Lcom/opera/ad/mraid/MRAIDView;->K:Landroid/graphics/Rect;

    invoke-direct {p2, p3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object p2, p0, Lcom/opera/ad/mraid/MRAIDView;->J:Landroid/graphics/Rect;

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->w()V

    goto :goto_2c

    :cond_29
    invoke-virtual {p0, p3}, Lcom/opera/ad/mraid/MRAIDView;->C(Z)V

    :goto_2c
    iget-byte p2, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    if-ne p2, p4, :cond_3e

    if-eqz p1, :cond_3e

    new-instance p1, Lrl;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Lrl;-><init>(Ljava/lang/Object;B)V

    iget-object p2, p0, Lcom/opera/ad/mraid/MRAIDView;->c0:Landroid/os/Handler;

    invoke-virtual {p2, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_3e
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/ad/mraid/MRAIDView;->O:Z

    iget-byte p2, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    if-nez p2, :cond_5a

    iget-boolean p2, p0, Lcom/opera/ad/mraid/MRAIDView;->N:Z

    if-eqz p2, :cond_5a

    iput-byte p1, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->I()V

    const-string p1, "mraid.fireReadyEvent();"

    invoke-virtual {p0, p1}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    iget-boolean p1, p0, Lcom/opera/ad/mraid/MRAIDView;->D:Z

    if-eqz p1, :cond_5a

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->J()V

    :cond_5a
    return-void
.end method

.method public final onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 5

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    if-eq p1, v0, :cond_8

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->v:Lb5d;

    if-ne p1, v0, :cond_1a

    :cond_8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_11

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1a

    :cond_11
    invoke-virtual {p1}, Landroid/view/View;->hasFocus()Z

    move-result v0

    if-nez v0, :cond_1a

    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    :cond_1a
    invoke-super {p0, p1, p2}, Laoo;->onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    const/4 p0, 0x0

    return p0
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->B:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    :cond_c
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    iget-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->w:Lb5d;

    if-eqz p1, :cond_c

    iget-boolean p1, p1, Lb5d;->b:Z

    if-eqz p1, :cond_c

    return-void

    :cond_c
    invoke-virtual {p0, p2}, Lcom/opera/ad/mraid/MRAIDView;->F(I)V

    return-void
.end method

.method public final onWindowVisibilityChanged(I)V
    .registers 3

    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->w:Lb5d;

    if-eqz v0, :cond_10

    iget-boolean v0, v0, Lb5d;->b:Z

    if-eqz v0, :cond_10

    return-void

    :cond_10
    invoke-virtual {p0, p1}, Lcom/opera/ad/mraid/MRAIDView;->F(I)V

    return-void
.end method

.method public open(Ljava/lang/String;)V
    .registers 6

    iget-wide v0, p0, Lcom/opera/ad/mraid/MRAIDView;->d0:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_3c

    const-wide/16 v2, 0x7d0

    add-long/2addr v0, v2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_3c

    :try_start_13
    const-string v0, "UTF-8"

    invoke-static {p1, v0}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Laoo;->m:Ly55;

    if-eqz v0, :cond_23

    invoke-interface {v0, p1}, Lbl;->k(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2c

    :cond_23
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Laoo;->n:Lltm;

    invoke-static {v0, p1, p0, v1}, Lt2p;->b(Landroid/content/Context;Ljava/lang/String;Landroid/view/View;Lltm;)Lt2p;

    :cond_2c
    iget-byte p1, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    const/4 v0, 0x2

    if-eq p1, v0, :cond_34

    const/4 v0, 0x3

    if-ne p1, v0, :cond_3c

    :cond_34
    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->close()V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_37} :catch_38

    return-void

    :catch_38
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_3c
    return-void
.end method

.method public final p()V
    .registers 3

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    if-eqz v0, :cond_12

    iget-byte p0, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    const/4 v1, 0x2

    if-eq p0, v1, :cond_12

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    const/4 p0, 0x1

    iput-boolean p0, v0, Lb5d;->a:Z

    :cond_12
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    if-eq p1, v0, :cond_8

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->v:Lb5d;

    if-ne p1, v0, :cond_e

    :cond_8
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/opera/ad/mraid/MRAIDView;->d0:J

    :cond_e
    invoke-virtual {p0}, Laoo;->t()V

    return-void
.end method

.method public resize()V
    .registers 1

    return-void
.end method

.method public setOrientationProperties(Ljava/util/Map;)V
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "allowOrientationChange"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "forceOrientation"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->F:Lyg8;

    iget-boolean v2, v1, Lyg8;->b:Z

    const-string v3, "none"

    const-string v4, "landscape"

    const-string v5, "portrait"

    const/4 v6, 0x2

    const/4 v7, -0x1

    if-ne v2, v0, :cond_35

    iget v2, v1, Lyg8;->a:I

    filled-new-array {v5, v4, v3}, [Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    invoke-interface {v8, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v8

    if-ne v8, v7, :cond_33

    move v8, v6

    :cond_33
    if-eq v2, v8, :cond_73

    :cond_35
    iput-boolean v0, v1, Lyg8;->b:Z

    filled-new-array {v5, v4, v3}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ne p1, v7, :cond_46

    move p1, v6

    :cond_46
    iput p1, v1, Lyg8;->a:I

    iget-byte p1, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    if-ne p1, v6, :cond_73

    iget-object p1, p0, Lcom/opera/ad/mraid/MRAIDView;->A:Landroid/app/Activity;

    if-eqz p1, :cond_73

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x0

    const/4 v2, 0x1

    if-ne p0, v2, :cond_60

    move p0, v2

    goto :goto_61

    :cond_60
    move p0, v0

    :goto_61
    iget v3, v1, Lyg8;->a:I

    if-nez v3, :cond_67

    move v7, v2

    goto :goto_70

    :cond_67
    if-ne v3, v2, :cond_6b

    move v7, v0

    goto :goto_70

    :cond_6b
    iget-boolean v0, v1, Lyg8;->b:Z

    if-nez v0, :cond_70

    move v7, p0

    :cond_70
    :goto_70
    invoke-virtual {p1, v7}, Landroid/app/Activity;->setRequestedOrientation(I)V

    :cond_73
    return-void
.end method

.method public setResizeProperties(Ljava/util/Map;)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "width"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_d

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    :cond_d
    const-string v0, "height"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_1a

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    :cond_1a
    const-string v0, "offsetX"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_27

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    :cond_27
    const-string v0, "offsetY"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_34

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    :cond_34
    const-string v0, "customClosePosition"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "allowOffscreen"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/ad/mraid/MRAIDView;->G:Lsa2;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v6, "bottom-center"

    const-string v7, "bottom-right"

    const-string v1, "top-left"

    const-string v2, "top-center"

    const-string v3, "top-right"

    const-string v4, "center"

    const-string v5, "bottom-left"

    filled-new-array/range {v1 .. v7}, [Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_67

    const/4 p1, 0x2

    :cond_67
    iput p1, p0, Lsa2;->b:I

    return-void
.end method

.method public useCustomClose(Ljava/lang/String;)V
    .registers 3

    invoke-static {p1}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p1

    iget-boolean v0, p0, Lcom/opera/ad/mraid/MRAIDView;->E:Z

    if-eq v0, p1, :cond_29

    iput-boolean p1, p0, Lcom/opera/ad/mraid/MRAIDView;->E:Z

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->y:Landroid/widget/ImageButton;

    if-eqz p1, :cond_17

    if-eqz v0, :cond_29

    const p0, 0x106000d

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void

    :cond_17
    if-eqz v0, :cond_29

    iget-object p1, p0, Laoo;->a:Landroid/content/Context;

    invoke-static {p1}, Lbbp;->g(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, p0, Lcom/opera/ad/mraid/MRAIDView;->y:Landroid/widget/ImageButton;

    sget-object p1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_29
    return-void
.end method

.method public final w()V
    .registers 7

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->J:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object v3, p0, Lcom/opera/ad/mraid/MRAIDView;->J:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "mraid.setCurrentPosition("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    return-void
.end method

.method public final x()V
    .registers 7

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->K:Landroid/graphics/Rect;

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget-object v3, p0, Lcom/opera/ad/mraid/MRAIDView;->K:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "mraid.setDefaultPosition("

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v2}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v2

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    return-void
.end method

.method public final y()V
    .registers 5

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->L:Lfr;

    iget v1, v0, Lfr;->b:I

    iget v0, v0, Lfr;->c:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "mraid.setMaxSize("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    return-void
.end method

.method public final z()V
    .registers 5

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->M:Lfr;

    iget v1, v0, Lfr;->b:I

    iget v0, v0, Lfr;->c:I

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "mraid.setScreenSize("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->E(I)I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ");"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->D(Ljava/lang/String;)V

    return-void
.end method
