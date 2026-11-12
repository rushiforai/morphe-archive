.class public final Leuo;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# static fields
.field public static final synthetic J:I


# instance fields
.field public A:I

.field public B:Z

.field public C:Lz4k;

.field public D:Lh9o;

.field public E:Lrii;

.field public F:Luto;

.field public G:Ltvk;

.field public H:Lioj;

.field public I:I

.field public a:I

.field public b:B

.field public c:Landroid/content/Context;

.field public d:Landroid/media/AudioManager;

.field public e:Lqoo;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/view/TextureView;

.field public h:Landroid/graphics/SurfaceTexture;

.field public i:Landroid/view/Surface;

.field public j:Ljava/util/Timer;

.field public k:Lu71;

.field public l:Lwtm;

.field public m:Lt8p;

.field public n:Landroid/widget/ImageButton;

.field public o:Landroid/widget/ImageButton;

.field public p:Landroid/widget/ImageButton;

.field public q:Landroid/widget/ImageButton;

.field public r:Ljava/lang/String;

.field public s:F

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Z


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Leuo;->e:Lqoo;

    if-eqz v0, :cond_32

    iget v1, p0, Leuo;->a:I

    const/4 v2, 0x3

    const/16 v3, 0x15

    if-ne v1, v2, :cond_1b

    iget-object v0, v0, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    const/4 v0, 0x4

    iput v0, p0, Leuo;->a:I

    invoke-virtual {p0}, Leuo;->f()V

    iget-object v0, p0, Leuo;->l:Lwtm;

    invoke-virtual {v0, v3}, Lwtm;->a(I)V

    :cond_1b
    iget v0, p0, Leuo;->a:I

    const/4 v1, 0x5

    if-ne v0, v1, :cond_32

    iget-object v0, p0, Leuo;->e:Lqoo;

    iget-object v0, v0, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    const/4 v0, 0x6

    iput v0, p0, Leuo;->a:I

    invoke-virtual {p0}, Leuo;->f()V

    iget-object p0, p0, Leuo;->l:Lwtm;

    invoke-virtual {p0, v3}, Lwtm;->a(I)V

    :cond_32
    return-void
.end method

.method public final b()V
    .registers 5

    iget-object v0, p0, Leuo;->e:Lqoo;

    if-eqz v0, :cond_28

    iget-object v1, v0, Lqoo;->f:Landroid/media/MediaPlayer;

    iget v2, p0, Leuo;->a:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_15

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    const/4 v0, 0x3

    iput v0, p0, Leuo;->a:I

    invoke-virtual {p0}, Leuo;->d()V

    return-void

    :cond_15
    const/4 v3, 0x6

    if-ne v2, v3, :cond_22

    invoke-virtual {v1}, Landroid/media/MediaPlayer;->start()V

    const/4 v0, 0x5

    iput v0, p0, Leuo;->a:I

    invoke-virtual {p0}, Leuo;->d()V

    return-void

    :cond_22
    const/4 v3, 0x7

    if-eq v2, v3, :cond_29

    const/4 v3, -0x1

    if-eq v2, v3, :cond_29

    :cond_28
    return-void

    :cond_29
    :try_start_29
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->reset()V
    :try_end_2c
    .catch Ljava/lang/IllegalStateException; {:try_start_29 .. :try_end_2c} :catch_2c

    :catch_2c
    const/4 v1, 0x0

    iput-object v1, v0, Lqoo;->a:Lz4k;

    iput-object v1, v0, Lqoo;->b:Lrii;

    iput-object v1, v0, Lqoo;->c:Lh9o;

    iput-object v1, v0, Lqoo;->d:Luto;

    iput-object v1, v0, Lqoo;->e:Ltvk;

    invoke-virtual {v0}, Lqoo;->a()V

    invoke-virtual {p0}, Leuo;->j()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Leuo;->x:Z

    iput-boolean v0, p0, Leuo;->z:Z

    iput-boolean v0, p0, Leuo;->y:Z

    iput-boolean v0, p0, Leuo;->w:Z

    iput-boolean v0, p0, Leuo;->v:Z

    iput-boolean v0, p0, Leuo;->u:Z

    return-void
.end method

.method public final c()V
    .registers 8

    iget-object v0, p0, Leuo;->c:Landroid/content/Context;

    iget-object v1, p0, Leuo;->f:Landroid/widget/FrameLayout;

    iget v2, p0, Leuo;->a:I

    if-nez v2, :cond_f8

    iget-object v2, p0, Leuo;->d:Landroid/media/AudioManager;

    const/4 v3, 0x3

    const/4 v4, 0x1

    if-nez v2, :cond_22

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v5, "audio"

    invoke-virtual {v2, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/AudioManager;

    iput-object v2, p0, Leuo;->d:Landroid/media/AudioManager;

    if-eqz v2, :cond_22

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v3, v4}, Landroid/media/AudioManager;->requestAudioFocus(Landroid/media/AudioManager$OnAudioFocusChangeListener;II)I

    :cond_22
    iget-object v2, p0, Leuo;->e:Lqoo;

    if-nez v2, :cond_32

    new-instance v2, Lqoo;

    invoke-direct {v2}, Lqoo;-><init>()V

    iput-object v2, p0, Leuo;->e:Lqoo;

    iget-object v2, v2, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setAudioStreamType(I)V

    :cond_32
    iget-object v2, p0, Leuo;->g:Landroid/view/TextureView;

    if-nez v2, :cond_40

    new-instance v2, Landroid/view/TextureView;

    invoke-direct {v2, v0}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Leuo;->g:Landroid/view/TextureView;

    invoke-virtual {v2, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    :cond_40
    iget-object v2, p0, Leuo;->g:Landroid/view/TextureView;

    invoke-static {v2}, Lupj;->j(Landroid/view/View;)V

    iget-object v2, p0, Leuo;->g:Landroid/view/TextureView;

    const/4 v3, 0x0

    if-eqz v2, :cond_57

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v5, 0x11

    const/4 v6, -0x1

    invoke-direct {v2, v6, v6, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    iget-object v5, p0, Leuo;->g:Landroid/view/TextureView;

    invoke-virtual {v1, v5, v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_57
    iget-object v2, p0, Leuo;->o:Landroid/widget/ImageButton;

    if-nez v2, :cond_82

    new-instance v2, Landroid/widget/ImageButton;

    invoke-direct {v2, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Leuo;->o:Landroid/widget/ImageButton;

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v2, p0, Leuo;->o:Landroid/widget/ImageButton;

    const v5, 0x7f0808e2

    invoke-static {v5, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p0, Leuo;->o:Landroid/widget/ImageButton;

    new-instance v5, Lcto;

    invoke-direct {v5, p0, v3}, Lcto;-><init>(Leuo;B)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, p0, Leuo;->o:Landroid/widget/ImageButton;

    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v5}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_82
    iget-object v2, p0, Leuo;->o:Landroid/widget/ImageButton;

    invoke-static {v2}, Lupj;->j(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    const/high16 v5, 0x42480000    # 50.0f

    invoke-static {v4, v5, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v2

    float-to-int v2, v2

    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const v2, 0x800055

    iput v2, v6, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v2, p0, Leuo;->o:Landroid/widget/ImageButton;

    invoke-virtual {v1, v2, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Leuo;->q:Landroid/widget/ImageButton;

    if-nez v2, :cond_cf

    new-instance v2, Landroid/widget/ImageButton;

    invoke-direct {v2, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Leuo;->q:Landroid/widget/ImageButton;

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v2, p0, Leuo;->q:Landroid/widget/ImageButton;

    sget-object v3, Lbbp;->n:Lbbp;

    invoke-virtual {v3, v0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Leuo;->q:Landroid/widget/ImageButton;

    new-instance v2, Lcto;

    invoke-direct {v2, p0, v4}, Lcto;-><init>(Leuo;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Leuo;->q:Landroid/widget/ImageButton;

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_cf
    iget-object v0, p0, Leuo;->q:Landroid/widget/ImageButton;

    invoke-static {v0}, Lupj;->j(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {v4, v5, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    new-instance v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v2, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const v0, 0x800053

    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v0, p0, Leuo;->q:Landroid/widget/ImageButton;

    invoke-virtual {v1, v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v1}, Leuo;->g(Landroid/widget/FrameLayout;)V

    iget v0, p0, Leuo;->s:F

    invoke-virtual {p0, v0}, Leuo;->e(F)V

    :cond_f8
    return-void
.end method

.method public final d()V
    .registers 9

    invoke-virtual {p0}, Leuo;->f()V

    iget-object v0, p0, Leuo;->j:Ljava/util/Timer;

    if-nez v0, :cond_e

    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Leuo;->j:Ljava/util/Timer;

    :cond_e
    iget-object v0, p0, Leuo;->k:Lu71;

    if-nez v0, :cond_1a

    new-instance v0, Lu71;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lu71;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Leuo;->k:Lu71;

    :cond_1a
    move-object v3, v0

    iget-object v2, p0, Leuo;->j:Ljava/util/Timer;

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x3e8

    invoke-virtual/range {v2 .. v7}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    return-void
.end method

.method public final e(F)V
    .registers 4

    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-gez v1, :cond_6

    move p1, v0

    :cond_6
    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v0

    if-lez v1, :cond_d

    move p1, v0

    :cond_d
    iput p1, p0, Leuo;->s:F

    iget-object p0, p0, Leuo;->e:Lqoo;

    if-eqz p0, :cond_18

    iget-object p0, p0, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {p0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    :cond_18
    return-void
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Leuo;->j:Ljava/util/Timer;

    const/4 v1, 0x0

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    iput-object v1, p0, Leuo;->j:Ljava/util/Timer;

    :cond_a
    iget-object v0, p0, Leuo;->k:Lu71;

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Ljava/util/TimerTask;->cancel()Z

    iput-object v1, p0, Leuo;->k:Lu71;

    :cond_13
    return-void
.end method

.method public final g(Landroid/widget/FrameLayout;)V
    .registers 6

    iget-object v0, p0, Leuo;->c:Landroid/content/Context;

    iget-object v1, p0, Leuo;->p:Landroid/widget/ImageButton;

    if-nez v1, :cond_2e

    new-instance v1, Landroid/widget/ImageButton;

    invoke-direct {v1, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Leuo;->p:Landroid/widget/ImageButton;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v1, p0, Leuo;->p:Landroid/widget/ImageButton;

    new-instance v2, Lcto;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Lcto;-><init>(Leuo;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Leuo;->p:Landroid/widget/ImageButton;

    sget-object v2, Lbbp;->l:Lbbp;

    invoke-virtual {v2, v0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Leuo;->p:Landroid/widget/ImageButton;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_2e
    iget-object v0, p0, Leuo;->p:Landroid/widget/ImageButton;

    invoke-static {v0}, Lupj;->j(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v1, 0x1

    const/high16 v2, 0x42480000    # 50.0f

    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const v0, 0x800033

    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object p0, p0, Leuo;->p:Landroid/widget/ImageButton;

    invoke-virtual {p1, p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final h()V
    .registers 7

    iget-object v0, p0, Leuo;->c:Landroid/content/Context;

    iget-object v1, p0, Leuo;->f:Landroid/widget/FrameLayout;

    iget-byte v2, p0, Leuo;->b:B

    const/16 v3, 0xb

    if-ne v2, v3, :cond_94

    invoke-static {v0}, Lsjo;->a(Landroid/content/Context;)Lfp1;

    move-result-object v2

    const/16 v3, 0x400

    const/4 v4, 0x0

    if-eqz v2, :cond_2c

    invoke-virtual {v2}, Lfp1;->getSupportActionBar()Lgc;

    move-result-object v2

    if-eqz v2, :cond_1f

    invoke-virtual {v2, v4}, Lgc;->q(Z)V

    invoke-virtual {v2}, Lgc;->u()V

    :cond_1f
    invoke-static {v0}, Lsjo;->p(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v2

    if-eqz v2, :cond_2c

    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/Window;->clearFlags(I)V

    :cond_2c
    invoke-static {v0, p0}, Lupj;->f(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_37

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_37
    iget-object v0, p0, Leuo;->n:Landroid/widget/ImageButton;

    invoke-static {v0}, Lupj;->j(Landroid/view/View;)V

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_45

    invoke-static {v1}, Lupj;->j(Landroid/view/View;)V

    :cond_45
    invoke-static {p0}, Lupj;->e(Landroid/view/View;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_70

    iget v2, p0, Leuo;->A:I

    invoke-virtual {v0, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    :try_start_50
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v5, "accelerometer_rotation"

    invoke-static {v2, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_60

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_60} :catch_60

    :catch_60
    :cond_60
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/Window;->clearFlags(I)V

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v2, 0x800

    invoke-virtual {v0, v2}, Landroid/view/Window;->addFlags(I)V

    :cond_70
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v0, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v1}, Leuo;->g(Landroid/widget/FrameLayout;)V

    const/16 v0, 0xa

    iput-byte v0, p0, Leuo;->b:B

    iget-object p0, p0, Leuo;->m:Lt8p;

    if-eqz p0, :cond_94

    iget-object v0, p0, Lt8p;->x:Lwtm;

    const/16 v1, 0x18

    invoke-virtual {v0, v1}, Lwtm;->a(I)V

    iget-boolean v0, p0, Lt8p;->E:Z

    if-eqz v0, :cond_94

    invoke-virtual {p0}, Lt8p;->p()V

    iput-boolean v4, p0, Lt8p;->E:Z

    :cond_94
    return-void
.end method

.method public final i()Z
    .registers 2

    iget-byte p0, p0, Leuo;->b:B

    const/16 v0, 0xb

    if-ne p0, v0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final j()V
    .registers 5

    iget-object v0, p0, Leuo;->e:Lqoo;

    if-eqz v0, :cond_6d

    iget-object v0, p0, Leuo;->f:Landroid/widget/FrameLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setKeepScreenOn(Z)V

    iget-object v0, p0, Leuo;->e:Lqoo;

    iget-object v2, p0, Leuo;->C:Lz4k;

    iput-object v2, v0, Lqoo;->a:Lz4k;

    iget-object v2, p0, Leuo;->D:Lh9o;

    iput-object v2, v0, Lqoo;->c:Lh9o;

    iget-object v2, p0, Leuo;->E:Lrii;

    iput-object v2, v0, Lqoo;->b:Lrii;

    iget-object v2, p0, Leuo;->F:Luto;

    iput-object v2, v0, Lqoo;->d:Luto;

    iget-object v2, p0, Leuo;->G:Ltvk;

    iput-object v2, v0, Lqoo;->e:Ltvk;

    :try_start_20
    iget-object v2, p0, Leuo;->c:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Leuo;->r:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    iget-object v0, v0, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v2, v3}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    iget-object v0, p0, Leuo;->i:Landroid/view/Surface;

    if-nez v0, :cond_3e

    new-instance v0, Landroid/view/Surface;

    iget-object v2, p0, Leuo;->h:Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object v0, p0, Leuo;->i:Landroid/view/Surface;

    :cond_3e
    iget-object v2, p0, Leuo;->e:Lqoo;

    iget-object v2, v2, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {v2, v0}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    iget-object v0, p0, Leuo;->e:Lqoo;

    iget-object v0, v0, Lqoo;->f:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    iput v1, p0, Leuo;->a:I
    :try_end_4e
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_4e} :catch_4f

    return-void

    :catch_4f
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    const/4 v0, 0x2

    iput v0, p0, Leuo;->I:I

    const/4 v0, -0x1

    iput v0, p0, Leuo;->a:I

    iget-object p0, p0, Leuo;->m:Lt8p;

    if-eqz p0, :cond_6d

    iget-boolean v0, p0, Lt8p;->D:Z

    if-nez v0, :cond_6d

    iget-object v0, p0, Lt8p;->x:Lwtm;

    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Lwtm;->a(I)V

    invoke-virtual {p0}, Lt8p;->y()V

    iput-boolean v1, p0, Lt8p;->D:Z

    :cond_6d
    return-void
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 v0, 0x4

    if-ne p1, v0, :cond_e

    invoke-virtual {p0}, Leuo;->i()Z

    move-result v0

    if-eqz v0, :cond_e

    invoke-virtual {p0}, Leuo;->h()V

    const/4 p0, 0x1

    return p0

    :cond_e
    invoke-super {p0, p1, p2}, Landroid/view/View;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public final onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .registers 4

    iget-object p2, p0, Leuo;->h:Landroid/graphics/SurfaceTexture;

    if-nez p2, :cond_a

    iput-object p1, p0, Leuo;->h:Landroid/graphics/SurfaceTexture;

    invoke-virtual {p0}, Leuo;->j()V

    return-void

    :cond_a
    iget-object p0, p0, Leuo;->g:Landroid/view/TextureView;

    if-eqz p0, :cond_11

    invoke-virtual {p0, p2}, Landroid/view/TextureView;->setSurfaceTexture(Landroid/graphics/SurfaceTexture;)V

    :cond_11
    return-void
.end method

.method public final onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .registers 2

    iget-object p0, p0, Leuo;->h:Landroid/graphics/SurfaceTexture;

    if-nez p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .registers 4

    return-void
.end method

.method public final onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .registers 2

    return-void
.end method
