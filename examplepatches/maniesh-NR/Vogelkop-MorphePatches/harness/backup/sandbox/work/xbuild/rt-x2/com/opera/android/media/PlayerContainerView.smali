.class public Lcom/opera/android/media/PlayerContainerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final synthetic k:I


# instance fields
.field public final a:Lwe7;

.field public b:Ltjg;

.field public c:Landroidx/media3/ui/PlayerView;

.field public d:Lcc6;

.field public e:Z

.field public f:Lp92;

.field public g:Landroid/graphics/Bitmap;

.field public h:Ll92;

.field public i:Lcom/google/android/gms/cast/framework/CastSession;

.field public final j:Lpde;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Lhig;

    invoke-direct {p2, p0}, Lhig;-><init>(Lcom/opera/android/media/PlayerContainerView;)V

    new-instance v0, Lwe7;

    const/4 v1, 0x5

    invoke-direct {v0, p0, p2, v1}, Lwe7;-><init>(Ljava/lang/Object;Leig;B)V

    iput-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->a:Lwe7;

    new-instance p2, Lpde;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lcom/opera/android/media/PlayerContainerView;->j:Lpde;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p1}, Lp92;->a(Landroid/content/res/Resources;)Lp92;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/media/PlayerContainerView;->f:Lp92;

    new-instance p1, Lkkf;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lkkf;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-nez p2, :cond_36

    return-void

    :cond_36
    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 13

    iget-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->c:Landroidx/media3/ui/PlayerView;

    if-eqz v0, :cond_8

    iget-object v0, v0, Landroidx/media3/ui/PlayerView;->l:Landroid/widget/FrameLayout;

    if-nez v0, :cond_9

    :cond_8
    return-void

    :cond_9
    iget-object v1, p0, Lcom/opera/android/media/PlayerContainerView;->a:Lwe7;

    invoke-virtual {v1}, Lhkg;->c()Lgig;

    move-result-object v2

    invoke-interface {v2}, Lgig;->g()Lqjd;

    move-result-object v2

    const/4 v3, 0x0

    sget-object v4, Lkg7;->h:Lkg7;

    const/4 v5, 0x0

    if-eqz v2, :cond_42

    iget-object v6, p0, Lcom/opera/android/media/PlayerContainerView;->b:Ltjg;

    if-eqz v6, :cond_42

    iget-object v6, v6, Ltjg;->h:Lzo4;

    if-eqz v6, :cond_42

    invoke-virtual {p0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v6, p0, Lcom/opera/android/media/PlayerContainerView;->f:Lp92;

    iget-object v7, p0, Lcom/opera/android/media/PlayerContainerView;->b:Ltjg;

    invoke-virtual {v7, v2}, Ltjg;->k(Lqjd;)Lkg7;

    move-result-object v2

    if-ne v2, v4, :cond_34

    const/4 v2, 0x4

    goto :goto_35

    :cond_34
    const/4 v2, 0x3

    :goto_35
    invoke-static {v1, v6, v2}, Llcp;->n(Landroid/content/Context;Lp92;I)Lo92;

    move-result-object v1

    new-instance v2, Liig;

    iget v4, v1, Lo92;->b:I

    invoke-direct {v2, v4}, Liig;-><init>(I)V

    goto/16 :goto_11c

    :cond_42
    iget-boolean v6, p0, Lcom/opera/android/media/PlayerContainerView;->e:Z

    if-eqz v6, :cond_4f

    const/high16 v1, -0x1000000

    invoke-virtual {p0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    move-object v1, v5

    move-object v2, v1

    goto/16 :goto_11c

    :cond_4f
    if-nez v2, :cond_69

    invoke-virtual {p0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-static {v1}, Lf03;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-direct {v2, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    move-object v1, v2

    :goto_66
    move-object v2, v5

    goto/16 :goto_11c

    :cond_69
    const v6, 0x7f0a03d3

    invoke-virtual {p0, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroidx/media3/ui/AspectRatioFrameLayout;

    iget v7, v6, Landroidx/media3/ui/AspectRatioFrameLayout;->c:F

    const/high16 v8, 0x3f800000    # 1.0f

    cmpl-float v7, v7, v8

    if-eqz v7, :cond_7f

    iput v8, v6, Landroidx/media3/ui/AspectRatioFrameLayout;->c:F

    invoke-virtual {v6}, Landroid/view/View;->requestLayout()V

    :cond_7f
    invoke-virtual {p0, v5}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v6, v1, Lhkg;->a:Lgig;

    if-eqz v6, :cond_9f

    invoke-virtual {v1}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1}, Lgig;->g()Lqjd;

    move-result-object v1

    if-eqz v1, :cond_9f

    iget-object v6, p0, Lcom/opera/android/media/PlayerContainerView;->b:Ltjg;

    iget-object v6, v6, Ltjg;->k:Lokg;

    iget-object v6, v6, Lokg;->d:Ljava/util/HashMap;

    iget-object v1, v1, Lqjd;->a:Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    goto :goto_a0

    :cond_9f
    move-object v1, v5

    :goto_a0
    const/4 v6, 0x1

    const/4 v7, 0x2

    if-eqz v1, :cond_102

    iget-object v2, p0, Lcom/opera/android/media/PlayerContainerView;->g:Landroid/graphics/Bitmap;

    if-eq v1, v2, :cond_fe

    iput-object v1, p0, Lcom/opera/android/media/PlayerContainerView;->g:Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v4, p0, Lcom/opera/android/media/PlayerContainerView;->b:Ltjg;

    iget-object v4, v4, Ltjg;->b:Lumi;

    iget-object v8, p0, Lcom/opera/android/media/PlayerContainerView;->f:Lp92;

    new-instance v9, Ln92;

    iget v10, v8, Lp92;->c:I

    iget v11, v8, Lp92;->b:F

    float-to-int v11, v11

    invoke-direct {v9, v10, v11, v2, v1}, Ln92;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    new-instance v2, Ll92;

    new-instance v10, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v1, v3, v3}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v11

    invoke-direct {v10, v11}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    new-instance v11, Lw3a;

    iget-boolean v8, v8, Lp92;->a:Z

    if-eqz v8, :cond_d2

    const/16 v8, 0x77

    goto :goto_d4

    :cond_d2
    const/16 v8, 0x11

    :goto_d4
    invoke-direct {v11, v9, v8, v3}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    new-array v7, v7, [Landroid/graphics/drawable/Drawable;

    aput-object v10, v7, v3

    aput-object v11, v7, v6

    invoke-direct {v2, v7, v3}, Ll92;-><init>([Landroid/graphics/drawable/Drawable;B)V

    new-instance v6, Lvx;

    const/16 v7, 0x9

    invoke-direct {v6, v1, v7}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v4, v6}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v1

    new-instance v6, Lbi;

    const/16 v7, 0x1b

    invoke-direct {v6, v2, v7}, Lbi;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v6}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v4

    invoke-virtual {v1, v4}, Lnml;->b(Lnml;)V

    invoke-virtual {v1, v5}, Lnml;->a(Ljava/lang/Object;)Loml;

    iput-object v2, p0, Lcom/opera/android/media/PlayerContainerView;->h:Ll92;

    :cond_fe
    iget-object v1, p0, Lcom/opera/android/media/PlayerContainerView;->h:Ll92;

    goto/16 :goto_66

    :cond_102
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v8, p0, Lcom/opera/android/media/PlayerContainerView;->f:Lp92;

    iget-object v9, p0, Lcom/opera/android/media/PlayerContainerView;->b:Ltjg;

    invoke-virtual {v9, v2}, Ltjg;->k(Lqjd;)Lkg7;

    move-result-object v2

    if-ne v2, v4, :cond_111

    move v6, v7

    :cond_111
    invoke-static {v1, v8, v6}, Llcp;->n(Landroid/content/Context;Lp92;I)Lo92;

    move-result-object v1

    new-instance v2, Liig;

    iget v4, v1, Lo92;->b:I

    invoke-direct {v2, v4}, Liig;-><init>(I)V

    :goto_11c
    iget-object v4, p0, Lcom/opera/android/media/PlayerContainerView;->j:Lpde;

    invoke-static {v4, v2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/opera/android/media/PlayerContainerView;->d:Lcc6;

    if-eqz v2, :cond_15e

    iget-object v4, p0, Lcom/opera/android/media/PlayerContainerView;->i:Lcom/google/android/gms/cast/framework/CastSession;

    iget-object v2, v2, Lcc6;->b:Landroid/widget/LinearLayout;

    if-eqz v4, :cond_159

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/opera/android/media/PlayerContainerView;->i:Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {v2}, Lcom/google/android/gms/cast/framework/CastSession;->getCastDevice()Lcom/google/android/gms/cast/CastDevice;

    move-result-object v2

    if-eqz v2, :cond_140

    invoke-virtual {v2}, Lcom/google/android/gms/cast/CastDevice;->getFriendlyName()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_142

    :cond_140
    move-object v1, v5

    goto :goto_14d

    :cond_142
    const v3, 0x7f140a20

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v3, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_14d
    iget-object p0, p0, Lcom/opera/android/media/PlayerContainerView;->d:Lcc6;

    iget-object p0, p0, Lcc6;->c:Landroid/widget/TextView;

    if-nez v1, :cond_155

    const-string v1, ""

    :cond_155
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_15f

    :cond_159
    const/16 p0, 0x8

    invoke-virtual {v2, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_15e
    move-object v5, v1

    :goto_15f
    invoke-virtual {v0, v5}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final b(Lxbf;)V
    .registers 3

    const v0, 0x7f0a0262

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-static {v0}, Lcc6;->a(Landroid/view/View;)Lcc6;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->d:Lcc6;

    :cond_f
    iget-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->a:Lwe7;

    invoke-virtual {v0, p1}, Lhkg;->a(Lxbf;)V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a0847

    invoke-static {p0, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroidx/media3/ui/PlayerView;

    iput-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->c:Landroidx/media3/ui/PlayerView;

    iget-object p1, p1, Lxbf;->b:Ljava/lang/Object;

    check-cast p1, Ltjg;

    iput-object p1, p0, Lcom/opera/android/media/PlayerContainerView;->b:Ltjg;

    invoke-virtual {p0}, Lcom/opera/android/media/PlayerContainerView;->f()V

    return-void
.end method

.method public final c(Lxbf;)V
    .registers 4

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->d:Lcc6;

    iput-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->c:Landroidx/media3/ui/PlayerView;

    iget-object v1, p0, Lcom/opera/android/media/PlayerContainerView;->a:Lwe7;

    invoke-virtual {v1, p1}, Lhkg;->b(Lxbf;)V

    iput-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->b:Ltjg;

    return-void
.end method

.method public final d()Landroid/graphics/Rect;
    .registers 5

    iget-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->c:Landroidx/media3/ui/PlayerView;

    if-eqz v0, :cond_2b

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_2b

    iget-object p0, p0, Lcom/opera/android/media/PlayerContainerView;->c:Landroidx/media3/ui/PlayerView;

    iget-object p0, p0, Landroidx/media3/ui/PlayerView;->d:Landroid/view/View;

    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    const/4 v1, 0x2

    new-array v1, v1, [I

    invoke-virtual {p0, v1}, Landroid/view/View;->getLocationInWindow([I)V

    aget p0, v1, v3

    const/4 v2, 0x1

    aget v1, v1, v2

    invoke-virtual {v0, p0, v1}, Landroid/graphics/Rect;->offset(II)V

    return-object v0

    :cond_2b
    const/4 p0, 0x0

    return-object p0
.end method

.method public final e(Lcom/google/android/gms/cast/framework/CastSession;)V
    .registers 2

    iput-object p1, p0, Lcom/opera/android/media/PlayerContainerView;->i:Lcom/google/android/gms/cast/framework/CastSession;

    invoke-virtual {p0}, Lcom/opera/android/media/PlayerContainerView;->f()V

    return-void
.end method

.method public final f()V
    .registers 5

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/media/PlayerContainerView;->e:Z

    iget-object v1, p0, Lcom/opera/android/media/PlayerContainerView;->a:Lwe7;

    invoke-virtual {v1}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1}, Lgig;->w()Lfzl;

    move-result-object v1

    iget-object v1, v1, Lfzl;->a:Lh1b;

    invoke-virtual {v1, v0}, Lh1b;->u(I)La1b;

    move-result-object v1

    :cond_13
    invoke-virtual {v1}, Lq4;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_31

    invoke-virtual {v1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lezl;

    iget v3, v2, Lezl;->a:I

    if-lez v3, :cond_13

    iget-object v2, v2, Lezl;->b:Leyl;

    iget-object v2, v2, Leyl;->d:[Loj9;

    aget-object v2, v2, v0

    iget v2, v2, Loj9;->u:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_13

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/media/PlayerContainerView;->e:Z

    :cond_31
    invoke-virtual {p0}, Lcom/opera/android/media/PlayerContainerView;->g()V

    invoke-virtual {p0}, Lcom/opera/android/media/PlayerContainerView;->a()V

    return-void
.end method

.method public final g()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/media/PlayerContainerView;->c:Landroidx/media3/ui/PlayerView;

    iget-object v0, v0, Landroidx/media3/ui/PlayerView;->d:Landroid/view/View;

    iget-boolean v1, p0, Lcom/opera/android/media/PlayerContainerView;->e:Z

    if-eqz v1, :cond_1c

    iget-object v1, p0, Lcom/opera/android/media/PlayerContainerView;->a:Lwe7;

    invoke-virtual {v1}, Lhkg;->c()Lgig;

    move-result-object v1

    invoke-interface {v1}, Lgig;->e0()Z

    move-result v1

    if-eqz v1, :cond_1c

    iget-object p0, p0, Lcom/opera/android/media/PlayerContainerView;->b:Ltjg;

    iget-object p0, p0, Ltjg;->h:Lzo4;

    if-nez p0, :cond_1c

    const/4 p0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 p0, 0x0

    :goto_1d
    invoke-virtual {v0, p0}, Landroid/view/View;->setKeepScreenOn(Z)V

    return-void
.end method
