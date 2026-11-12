.class public final synthetic Lcto;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Leuo;


# direct methods
.method public synthetic constructor <init>(Leuo;B)V
    .registers 3

    iput-byte p2, p0, Lcto;->a:B

    iput-object p1, p0, Lcto;->b:Leuo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 10

    iget-byte p1, p0, Lcto;->a:B

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lcto;->b:Leuo;

    packed-switch p1, :pswitch_data_182

    invoke-virtual {p0}, Leuo;->i()Z

    move-result p1

    if-nez p1, :cond_df

    iget-object p1, p0, Leuo;->f:Landroid/widget/FrameLayout;

    iget-object v0, p0, Leuo;->c:Landroid/content/Context;

    iget-byte v3, p0, Leuo;->b:B

    const/16 v4, 0xb

    if-eq v3, v4, :cond_d8

    invoke-static {v0}, Lsjo;->a(Landroid/content/Context;)Lfp1;

    move-result-object v3

    const/16 v5, 0x400

    if-eqz v3, :cond_3b

    invoke-virtual {v3}, Lfp1;->getSupportActionBar()Lgc;

    move-result-object v3

    if-eqz v3, :cond_2e

    invoke-virtual {v3, v1}, Lgc;->q(Z)V

    invoke-virtual {v3}, Lgc;->f()V

    :cond_2e
    invoke-static {v0}, Lsjo;->p(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v3

    if-eqz v3, :cond_3b

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3, v5, v5}, Landroid/view/Window;->setFlags(II)V

    :cond_3b
    invoke-static {p0}, Lupj;->e(Landroid/view/View;)Landroid/app/Activity;

    move-result-object v3

    const/4 v6, 0x2

    if-eqz v3, :cond_63

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v7

    iget v7, v7, Landroid/content/res/Configuration;->orientation:I

    iput v7, p0, Leuo;->A:I

    if-eq v7, v6, :cond_53

    invoke-virtual {v3, v1}, Landroid/app/Activity;->setRequestedOrientation(I)V

    :cond_53
    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v7

    invoke-virtual {v7, v5}, Landroid/view/Window;->addFlags(I)V

    invoke-virtual {v3}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    const/16 v5, 0x800

    invoke-virtual {v3, v5}, Landroid/view/Window;->clearFlags(I)V

    :cond_63
    invoke-static {p1}, Lupj;->j(Landroid/view/View;)V

    iget-object v3, p0, Leuo;->p:Landroid/widget/ImageButton;

    invoke-static {v3}, Lupj;->j(Landroid/view/View;)V

    invoke-static {v0, p0}, Lupj;->f(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_7c

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v5, v7, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v3, p1, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_7c
    iget-object v3, p0, Leuo;->n:Landroid/widget/ImageButton;

    if-nez v3, :cond_a4

    new-instance v3, Landroid/widget/ImageButton;

    invoke-direct {v3, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v3, p0, Leuo;->n:Landroid/widget/ImageButton;

    invoke-virtual {v3, v1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v1, p0, Leuo;->n:Landroid/widget/ImageButton;

    new-instance v3, Lcto;

    invoke-direct {v3, p0, v6}, Lcto;-><init>(Leuo;B)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Leuo;->n:Landroid/widget/ImageButton;

    invoke-static {v0}, Lbbp;->g(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Leuo;->n:Landroid/widget/ImageButton;

    sget-object v1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_a4
    iget-object v0, p0, Leuo;->n:Landroid/widget/ImageButton;

    invoke-static {v0}, Lupj;->j(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/high16 v1, 0x42480000    # 50.0f

    invoke-static {v2, v1, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const v0, 0x800035

    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    iget-object v0, p0, Leuo;->n:Landroid/widget/ImageButton;

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Landroid/view/View;->hasFocus()Z

    move-result p1

    if-nez p1, :cond_d6

    invoke-virtual {p0, v2}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {p0, v2}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    :cond_d6
    iput-byte v4, p0, Leuo;->b:B

    :cond_d8
    iget-object p0, p0, Leuo;->l:Lwtm;

    const/16 p1, 0x17

    invoke-virtual {p0, p1}, Lwtm;->a(I)V

    :cond_df
    return-void

    :pswitch_e0
    invoke-virtual {p0}, Leuo;->i()Z

    move-result p1

    if-eqz p1, :cond_e9

    invoke-virtual {p0}, Leuo;->h()V

    :cond_e9
    return-void

    :pswitch_ea
    iget-object p1, p0, Leuo;->c:Landroid/content/Context;

    iget v3, p0, Leuo;->a:I

    if-ne v3, v0, :cond_101

    invoke-virtual {p0}, Leuo;->a()V

    iput-boolean v2, p0, Leuo;->B:Z

    iget-object p0, p0, Leuo;->q:Landroid/widget/ImageButton;

    sget-object v0, Lbbp;->m:Lbbp;

    :goto_f9
    invoke-virtual {v0, p1}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_115

    :cond_101
    const/4 v0, 0x4

    if-ne v3, v0, :cond_115

    invoke-virtual {p0}, Leuo;->b()V

    iput-boolean v1, p0, Leuo;->B:Z

    iget-object v0, p0, Leuo;->l:Lwtm;

    const/16 v1, 0x16

    invoke-virtual {v0, v1}, Lwtm;->a(I)V

    iget-object p0, p0, Leuo;->q:Landroid/widget/ImageButton;

    sget-object v0, Lbbp;->n:Lbbp;

    goto :goto_f9

    :cond_115
    :goto_115
    return-void

    :pswitch_116
    iget-object p1, p0, Leuo;->c:Landroid/content/Context;

    iget-boolean v3, p0, Leuo;->t:Z

    iget-object v4, p0, Leuo;->o:Landroid/widget/ImageButton;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eqz v3, :cond_169

    iget-object v2, p0, Leuo;->o:Landroid/widget/ImageButton;

    const v3, 0x7f080a0e

    invoke-static {v3, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Leuo;->d:Landroid/media/AudioManager;

    if-eqz p1, :cond_137

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result p1

    goto :goto_138

    :cond_137
    move p1, v1

    :goto_138
    iget-object v2, p0, Leuo;->d:Landroid/media/AudioManager;

    if-eqz v2, :cond_141

    invoke-virtual {v2, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v2

    goto :goto_142

    :cond_141
    move v2, v1

    :goto_142
    sub-int/2addr p1, v2

    int-to-double v2, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->log(D)D

    move-result-wide v2

    iget-object p1, p0, Leuo;->d:Landroid/media/AudioManager;

    if-eqz p1, :cond_151

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result p1

    goto :goto_152

    :cond_151
    move p1, v1

    :goto_152
    int-to-double v4, p1

    invoke-static {v4, v5}, Ljava/lang/Math;->log(D)D

    move-result-wide v4

    div-double/2addr v2, v4

    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    sub-double/2addr v4, v2

    double-to-float p1, v4

    invoke-virtual {p0, p1}, Leuo;->e(F)V

    iput-boolean v1, p0, Leuo;->t:Z

    iget-object p0, p0, Leuo;->l:Lwtm;

    const/16 p1, 0x12

    :goto_165
    invoke-virtual {p0, p1}, Lwtm;->a(I)V

    goto :goto_180

    :cond_169
    iget-object v0, p0, Leuo;->o:Landroid/widget/ImageButton;

    const v1, 0x7f0808e2

    invoke-static {v1, p1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Leuo;->e(F)V

    iput-boolean v2, p0, Leuo;->t:Z

    iget-object p0, p0, Leuo;->l:Lwtm;

    const/16 p1, 0x11

    goto :goto_165

    :goto_180
    return-void

    nop

    :pswitch_data_182
    .packed-switch 0x0
        :pswitch_116
        :pswitch_ea
        :pswitch_e0
    .end packed-switch
.end method
