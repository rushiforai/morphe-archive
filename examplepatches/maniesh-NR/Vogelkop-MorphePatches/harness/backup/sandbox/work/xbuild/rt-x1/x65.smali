.class public final Lx65;
.super Lryl;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;
.implements Lcll;


# static fields
.field public static final F:J


# instance fields
.field public A:Ljava/lang/Runnable;

.field public B:Z

.field public C:Z

.field public D:Lyim;

.field public E:Z

.field public final c:Lumi;

.field public final d:Lr65;

.field public final e:Ldll;

.field public final f:Lkotlin/jvm/functions/Function1;

.field public final g:Lkotlin/jvm/functions/Function0;

.field public final h:Z

.field public i:Lp10;

.field public final j:Z

.field public final k:Z

.field public final l:Z

.field public final m:Z

.field public final n:Z

.field public final o:Lpde;

.field public final p:Lz61;

.field public final q:Lay;

.field public final r:Lq65;

.field public final s:Landroid/os/Handler;

.field public t:Landroid/widget/FrameLayout;

.field public u:Li3j;

.field public v:Lcom/usercentrics/sdk/UsercentricsBanner;

.field public w:Landroid/view/View;

.field public x:Z

.field public y:Z

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0xf

    sget-object v1, Lun7;->e:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lx65;->F:J

    return-void
.end method

.method public constructor <init>(Lumi;Lr65;Ldll;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;ZLp10;ZZZZZ)V
    .registers 13

    invoke-direct {p0}, Lryl;-><init>()V

    iput-object p1, p0, Lx65;->c:Lumi;

    iput-object p2, p0, Lx65;->d:Lr65;

    iput-object p3, p0, Lx65;->e:Ldll;

    iput-object p4, p0, Lx65;->f:Lkotlin/jvm/functions/Function1;

    iput-object p5, p0, Lx65;->g:Lkotlin/jvm/functions/Function0;

    iput-boolean p6, p0, Lx65;->h:Z

    iput-object p7, p0, Lx65;->i:Lp10;

    iput-boolean p8, p0, Lx65;->j:Z

    iput-boolean p9, p0, Lx65;->k:Z

    iput-boolean p10, p0, Lx65;->l:Z

    iput-boolean p11, p0, Lx65;->m:Z

    iput-boolean p12, p0, Lx65;->n:Z

    new-instance p1, Lpde;

    const/4 p3, 0x0

    invoke-direct {p1, p3}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lx65;->o:Lpde;

    new-instance p1, Lz61;

    const/4 p3, 0x4

    invoke-direct {p1, p0, p3}, Lz61;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lx65;->p:Lz61;

    new-instance p1, Lay;

    const/4 p3, 0x3

    invoke-direct {p1, p0, p3}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lx65;->q:Lay;

    new-instance p1, Lq65;

    const/4 p3, 0x1

    invoke-direct {p1, p0, p3}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lx65;->r:Lq65;

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p4

    invoke-direct {p1, p4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object p1, p0, Lx65;->s:Landroid/os/Handler;

    sget-object p1, Lyim;->a:Lyim;

    iput-object p1, p0, Lx65;->D:Lyim;

    iget-object p1, p0, Lx65;->i:Lp10;

    const/4 p4, 0x0

    if-eqz p1, :cond_51

    move p1, p3

    goto :goto_52

    :cond_51
    move p1, p4

    :goto_52
    iput-boolean p1, p0, Lx65;->E:Z

    new-instance p1, Ls65;

    invoke-direct {p1, p0, p4}, Ls65;-><init>(Lx65;B)V

    invoke-virtual {p2, p10}, Lr65;->l(Z)Z

    move-result p0

    if-nez p0, :cond_65

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p1, p0}, Ls65;->run(Ljava/lang/Object;)V

    return-void

    :cond_65
    iget-object p0, p2, Lr65;->r:Lrn9;

    if-eqz p0, :cond_6c

    invoke-virtual {p0, p4}, Lrn9;->r(Z)V

    :cond_6c
    new-instance p0, Lrn9;

    invoke-direct {p0, p2, p10, p1}, Lrn9;-><init>(Lr65;ZLs65;)V

    iput-object p0, p2, Lr65;->r:Lrn9;

    invoke-virtual {p2}, Lr65;->c()Z

    move-result p0

    if-eqz p0, :cond_80

    iget-object p0, p2, Lr65;->r:Lrn9;

    if-eqz p0, :cond_80

    invoke-virtual {p0, p3}, Lrn9;->r(Z)V

    :cond_80
    return-void
.end method


# virtual methods
.method public final K()V
    .registers 2

    iget-object v0, p0, Lx65;->v:Lcom/usercentrics/sdk/UsercentricsBanner;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Lcom/usercentrics/sdk/UsercentricsBanner;->dismiss()V

    const/4 v0, 0x0

    iput-object v0, p0, Lx65;->v:Lcom/usercentrics/sdk/UsercentricsBanner;

    invoke-virtual {p0}, Lx65;->m0()V

    :cond_d
    return-void
.end method

.method public final k0()V
    .registers 15

    iget-object v0, p0, Lx65;->i:Lp10;

    iget-object v1, p0, Lx65;->o:Lpde;

    if-eqz v0, :cond_1a0

    iget-object v2, p0, Lx65;->t:Landroid/widget/FrameLayout;

    if-eqz v2, :cond_d

    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_d
    iget-object v2, p0, Lx65;->t:Landroid/widget/FrameLayout;

    if-eqz v2, :cond_16

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    goto :goto_17

    :cond_16
    const/4 v2, 0x0

    :goto_17
    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    iget-object v3, p0, Lx65;->t:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    iget v4, v4, Landroid/content/res/Configuration;->orientation:I

    const/4 v5, 0x0

    const/4 v6, 0x1

    const v7, 0x7f0a0a82

    const v8, 0x7f0a086c

    const v9, 0x7f0a06c5

    const v10, 0x7f0a06b5

    const v11, 0x7f0a056f

    const v12, 0x7f0a026e

    const-string v13, "Missing required view with ID: "

    if-ne v4, v6, :cond_ad

    const v4, 0x7f0d01dd

    invoke-virtual {v2, v4, v3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_9c

    invoke-static {v11, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    if-eqz v4, :cond_8b

    invoke-static {v10, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_89

    invoke-static {v9, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_8c

    check-cast v3, Landroid/widget/ScrollView;

    invoke-static {v8, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v3, :cond_87

    invoke-static {v7, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v8, :cond_9d

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v7, Li3j;

    new-instance v9, Lz8b;

    invoke-direct {v9, v10, v4}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v7, v2, v3, v8, v9}, Li3j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_fe

    :cond_87
    move v7, v8

    goto :goto_9d

    :cond_89
    move v9, v10

    goto :goto_8c

    :cond_8b
    move v9, v11

    :cond_8c
    :goto_8c
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v9}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v13, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_9c
    move v7, v12

    :cond_9d
    :goto_9d
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v13, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_ad
    const v4, 0x7f0d01dc

    invoke-virtual {v2, v4, v3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_18f

    invoke-static {v11, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    if-eqz v4, :cond_17e

    invoke-static {v10, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_17c

    const v10, 0x7f0a0b6e

    invoke-static {v10, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    check-cast v11, Landroid/widget/ScrollView;

    if-eqz v11, :cond_17c

    invoke-static {v9, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_17f

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-static {v8, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v3, :cond_17a

    invoke-static {v7, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v8, :cond_190

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v7, Li3j;

    new-instance v9, Lz8b;

    invoke-direct {v9, v10, v4}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {v7, v2, v3, v8, v9}, Li3j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_fe
    iget-object v2, v7, Li3j;->a:Ljava/lang/Object;

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v3, v7, Li3j;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iput-object v7, p0, Lx65;->u:Li3j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v4

    iget-object v8, v7, Li3j;->d:Ljava/lang/Object;

    check-cast v8, Lz8b;

    iget-object v9, v8, Lz8b;->a:Ljava/lang/Object;

    check-cast v9, Landroid/widget/TextView;

    iget-object v8, v8, Lz8b;->b:Ljava/lang/Object;

    check-cast v8, Landroid/widget/TextView;

    iget v10, v0, Lp10;->b:I

    invoke-virtual {v4, v10}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v9, v0, Lp10;->c:I

    invoke-virtual {v4, v9}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lp10;->c()Z

    move-result v4

    if-eqz v4, :cond_132

    move v4, v5

    goto :goto_134

    :cond_132
    const/16 v4, 0x8

    :goto_134
    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v4, p0, Lx65;->B:Z

    if-eqz v4, :cond_157

    sget-object v0, Lv65;->b:Lv65;

    invoke-virtual {v1, v0}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v0, p0, Lx65;->w:Landroid/view/View;

    if-eqz v0, :cond_149

    const/4 p0, 0x4

    invoke-virtual {v2, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_149
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lx65;->D:Lyim;

    sget-object v1, Lyim;->d:Lyim;

    if-ne v0, v1, :cond_153

    move v5, v6

    :cond_153
    invoke-virtual {p0, v5}, Lx65;->q0(Z)V

    return-void

    :cond_157
    sget-object v4, Lv65;->a:Lv65;

    invoke-virtual {v1, v4}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v7, Li3j;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v2, Lt65;

    invoke-direct {v2, p0, v5}, Lt65;-><init>(Lx65;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v0}, Lp10;->c()Z

    move-result v0

    if-eqz v0, :cond_179

    new-instance v0, Lt65;

    invoke-direct {v0, p0, v6}, Lt65;-><init>(Lx65;B)V

    invoke-virtual {v3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_179
    return-void

    :cond_17a
    move v7, v8

    goto :goto_190

    :cond_17c
    move v9, v10

    goto :goto_17f

    :cond_17e
    move v9, v11

    :cond_17f
    :goto_17f
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v9}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v13, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_18f
    move v7, v12

    :cond_190
    :goto_190
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v13, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_1a0
    sget-object p0, Lv65;->b:Lv65;

    invoke-virtual {v1, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final l0()V
    .registers 6

    iget-boolean v0, p0, Lx65;->z:Z

    if-eqz v0, :cond_4d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_4d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result v0

    if-nez v0, :cond_4d

    iget-object v0, p0, Lx65;->A:Ljava/lang/Runnable;

    const/4 v1, 0x0

    if-eqz v0, :cond_1d

    iget-object v2, p0, Lx65;->i:Lp10;

    if-nez v2, :cond_48

    iget-object v2, p0, Lx65;->w:Landroid/view/View;

    if-nez v2, :cond_48

    :cond_1d
    iget-object v0, p0, Lx65;->i:Lp10;

    if-eqz v0, :cond_4d

    iget-boolean v0, p0, Lx65;->B:Z

    if-eqz v0, :cond_4d

    iget-boolean v0, p0, Lx65;->E:Z

    if-eqz v0, :cond_4d

    iget-object v0, p0, Lx65;->t:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lx65;->w:Landroid/view/View;

    iget-object v3, p0, Lx65;->u:Li3j;

    if-eqz v3, :cond_36

    iget-object v3, v3, Li3j;->a:Ljava/lang/Object;

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    goto :goto_37

    :cond_36
    move-object v3, v1

    :goto_37
    if-eqz v0, :cond_4d

    if-eqz v2, :cond_4d

    if-eqz v3, :cond_4d

    const/4 v4, 0x0

    iput-boolean v4, p0, Lx65;->E:Z

    invoke-static {v0, v3, v1, v4, v4}, Lye1;->b(Landroid/view/View;Landroid/view/View;Lx65;ZZ)Landroid/view/ViewPropertyAnimator;

    const/4 p0, 0x1

    invoke-static {v0, v2, v1, p0, v4}, Lye1;->b(Landroid/view/View;Landroid/view/View;Lx65;ZZ)Landroid/view/ViewPropertyAnimator;

    return-void

    :cond_48
    iput-object v1, p0, Lx65;->A:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_4d
    return-void
.end method

.method public final m0()V
    .registers 40

    move-object/from16 v2, p0

    iget-boolean v0, v2, Lx65;->x:Z

    if-eqz v0, :cond_288

    iget-boolean v0, v2, Lx65;->z:Z

    if-eqz v0, :cond_288

    iget-object v0, v2, Lx65;->i:Lp10;

    if-eqz v0, :cond_12

    iget-boolean v0, v2, Lx65;->B:Z

    if-eqz v0, :cond_288

    :cond_12
    new-instance v8, Lcom/usercentrics/sdk/UsercentricsBanner;

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    new-instance v3, Lh61;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Lh61;-><init>(Landroid/content/Context;Z)V

    const v5, 0x7f0402d4

    invoke-virtual {v3, v5}, Lh61;->b(I)I

    move-result v5

    new-instance v6, Lcom/usercentrics/sdk/BannerFont;

    const v7, 0x7f15026c

    invoke-static {v7, v1}, Lw23;->b(ILandroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v9

    invoke-static {v7, v1}, Lw23;->a(ILandroid/content/Context;)F

    move-result v10

    invoke-direct {v6, v1, v9, v10}, Lcom/usercentrics/sdk/BannerFont;-><init>(Landroid/content/Context;Landroid/graphics/Typeface;F)V

    const v9, 0x7f0402ed

    invoke-virtual {v3, v9}, Lh61;->b(I)I

    move-result v10

    invoke-virtual {v3, v9}, Lh61;->b(I)I

    move-result v11

    const v12, 0x7f0402d7

    invoke-virtual {v3, v12}, Lh61;->b(I)I

    move-result v13

    const v14, 0x7f040657

    invoke-static {v14, v1}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v14

    if-eqz v14, :cond_5c

    new-instance v15, Lcom/usercentrics/sdk/UsercentricsImage$ImageDrawable;

    invoke-direct {v15, v14}, Lcom/usercentrics/sdk/UsercentricsImage$ImageDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    :goto_59
    move-object/from16 v18, v15

    goto :goto_5e

    :cond_5c
    const/4 v15, 0x0

    goto :goto_59

    :goto_5e
    invoke-virtual {v3, v9}, Lh61;->b(I)I

    move-result v14

    invoke-virtual {v3, v12}, Lh61;->b(I)I

    move-result v15

    move/from16 v25, v4

    const v4, 0x7f0402c4

    invoke-virtual {v3, v4}, Lh61;->b(I)I

    move-result v16

    const v4, 0x7f0402e3

    invoke-virtual {v3, v4}, Lh61;->b(I)I

    move-result v17

    invoke-virtual {v3, v12}, Lh61;->b(I)I

    move-result v19

    const v9, 0x7f0402f2

    invoke-virtual {v3, v9}, Lh61;->b(I)I

    move-result v9

    const v7, 0x7f0402c8

    invoke-virtual {v3, v7}, Lh61;->b(I)I

    move-result v21

    const v12, 0x7f0402c6

    invoke-virtual {v3, v12}, Lh61;->b(I)I

    move-result v12

    const v7, 0x7f0402ef

    invoke-virtual {v3, v7}, Lh61;->b(I)I

    move-result v7

    new-instance v26, Lcom/usercentrics/sdk/ToggleStyleSettings;

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v27

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v28

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v29

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v30

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v31

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v32

    invoke-direct/range {v26 .. v32}, Lcom/usercentrics/sdk/ToggleStyleSettings;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    new-instance v28, Lcom/usercentrics/sdk/GeneralStyleSettings;

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    iget-boolean v5, v2, Lx65;->k:Z

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    const/16 v23, 0x1200

    const/16 v24, 0x0

    const/16 v19, 0x0

    const v11, 0x7f0402d7

    const/16 v22, 0x0

    move-object/from16 v20, v5

    move-object/from16 v17, v6

    move-object v14, v10

    move v6, v11

    move-object/from16 v16, v26

    const v5, 0x7f0402ed

    move-object v10, v7

    move-object v11, v9

    move-object/from16 v9, v28

    invoke-direct/range {v9 .. v24}, Lcom/usercentrics/sdk/GeneralStyleSettings;-><init>(Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Lcom/usercentrics/sdk/ToggleStyleSettings;Lcom/usercentrics/sdk/BannerFont;Lcom/usercentrics/sdk/UsercentricsImage;Lcom/usercentrics/sdk/LegalLinksSettings;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-virtual {v3, v5}, Lh61;->b(I)I

    move-result v5

    new-instance v14, Lcom/usercentrics/sdk/ButtonLayout$Row;

    sget-object v16, Lcom/usercentrics/sdk/ButtonType;->MORE:Lcom/usercentrics/sdk/ButtonType;

    invoke-virtual {v3, v4}, Lh61;->b(I)I

    move-result v7

    const v9, 0x7f0402bf

    invoke-virtual {v3, v9}, Lh61;->b(I)I

    move-result v10

    new-instance v15, Lcom/usercentrics/sdk/ButtonSettings;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    const/16 v23, 0x66

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v21, 0x0

    invoke-direct/range {v15 .. v24}, Lcom/usercentrics/sdk/ButtonSettings;-><init>(Lcom/usercentrics/sdk/ButtonType;Landroid/graphics/Typeface;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    sget-object v30, Lcom/usercentrics/sdk/ButtonType;->ACCEPT_ALL:Lcom/usercentrics/sdk/ButtonType;

    invoke-virtual {v3, v6}, Lh61;->b(I)I

    move-result v7

    const v10, 0x7f0402b9

    invoke-virtual {v3, v10}, Lh61;->b(I)I

    move-result v11

    new-instance v29, Lcom/usercentrics/sdk/ButtonSettings;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v34

    const/16 v37, 0x66

    const/16 v38, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    invoke-direct/range {v29 .. v38}, Lcom/usercentrics/sdk/ButtonSettings;-><init>(Lcom/usercentrics/sdk/ButtonType;Landroid/graphics/Typeface;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object/from16 v7, v29

    filled-new-array {v15, v7}, [Lcom/usercentrics/sdk/ButtonSettings;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v14, v7}, Lcom/usercentrics/sdk/ButtonLayout$Row;-><init>(Ljava/util/List;)V

    sget-object v18, Lcom/usercentrics/sdk/SectionAlignment;->START:Lcom/usercentrics/sdk/SectionAlignment;

    const v7, 0x7f15026c

    invoke-static {v7, v1}, Lw23;->b(ILandroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v16

    invoke-virtual {v3, v6}, Lh61;->b(I)I

    move-result v11

    invoke-static {v7, v1}, Lw23;->a(ILandroid/content/Context;)F

    move-result v7

    const v12, 0x7f0402c8

    invoke-virtual {v3, v12}, Lh61;->b(I)I

    move-result v12

    const v13, 0x7f040a52

    invoke-static {v13, v1}, Lf03;->V(ILandroid/content/Context;)Z

    move-result v13

    new-instance v15, Lvwd;

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v17

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    invoke-static {v13}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v21

    invoke-direct/range {v15 .. v21}, Lvwd;-><init>(Landroid/graphics/Typeface;Ljava/lang/Float;Lcom/usercentrics/sdk/SectionAlignment;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)V

    move-object/from16 v7, v18

    const v11, 0x7f15027f

    invoke-static {v11, v1}, Lw23;->b(ILandroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object v12

    invoke-static {v11, v1}, Lw23;->a(ILandroid/content/Context;)F

    move-result v1

    const v11, 0x7f0402c4

    invoke-virtual {v3, v11}, Lh61;->b(I)I

    move-result v11

    new-instance v13, Luql;

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-direct {v13, v12, v1, v7, v11}, Luql;-><init>(Landroid/graphics/Typeface;Ljava/lang/Float;Lcom/usercentrics/sdk/SectionAlignment;Ljava/lang/Integer;)V

    new-instance v29, Lcom/usercentrics/sdk/FirstLayerStyleSettings;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/16 v18, 0xc3

    const/16 v19, 0x0

    move v5, v10

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v12, v13

    move-object v13, v15

    move-object v15, v1

    move v1, v9

    move-object/from16 v9, v29

    invoke-direct/range {v9 .. v19}, Lcom/usercentrics/sdk/FirstLayerStyleSettings;-><init>(Lcom/usercentrics/sdk/UsercentricsLayout;Lcom/usercentrics/sdk/HeaderImageSettings;Luql;Lvwd;Lcom/usercentrics/sdk/ButtonLayout;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-virtual {v3, v4}, Lh61;->b(I)I

    move-result v7

    invoke-virtual {v3, v1}, Lh61;->b(I)I

    move-result v10

    sget-object v12, Lcom/usercentrics/sdk/ButtonType;->DENY_ALL:Lcom/usercentrics/sdk/ButtonType;

    new-instance v11, Lcom/usercentrics/sdk/ButtonSettings;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    const/16 v19, 0x66

    const/16 v20, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v11 .. v20}, Lcom/usercentrics/sdk/ButtonSettings;-><init>(Lcom/usercentrics/sdk/ButtonType;Landroid/graphics/Typeface;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-virtual {v3, v6}, Lh61;->b(I)I

    move-result v6

    invoke-virtual {v3, v5}, Lh61;->b(I)I

    move-result v5

    new-instance v29, Lcom/usercentrics/sdk/ButtonSettings;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v34

    invoke-direct/range {v29 .. v38}, Lcom/usercentrics/sdk/ButtonSettings;-><init>(Lcom/usercentrics/sdk/ButtonType;Landroid/graphics/Typeface;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object/from16 v5, v29

    filled-new-array {v11, v5}, [Lcom/usercentrics/sdk/ButtonSettings;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v3, v4}, Lh61;->b(I)I

    move-result v4

    invoke-virtual {v3, v1}, Lh61;->b(I)I

    move-result v1

    sget-object v11, Lcom/usercentrics/sdk/ButtonType;->SAVE:Lcom/usercentrics/sdk/ButtonType;

    new-instance v10, Lcom/usercentrics/sdk/ButtonSettings;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    const/16 v18, 0x66

    const/16 v19, 0x0

    const/4 v12, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v10 .. v19}, Lcom/usercentrics/sdk/ButtonSettings;-><init>(Lcom/usercentrics/sdk/ButtonType;Landroid/graphics/Typeface;Ljava/lang/Float;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-static {v10}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    new-instance v3, Lcom/usercentrics/sdk/SecondLayerStyleSettings;

    new-instance v4, Lcom/usercentrics/sdk/ButtonLayout$Grid;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/util/List;

    aput-object v5, v6, v25

    const/4 v5, 0x1

    aput-object v1, v6, v5

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v4, v1}, Lcom/usercentrics/sdk/ButtonLayout$Grid;-><init>(Ljava/util/List;)V

    iget-boolean v1, v2, Lx65;->j:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {v3, v4, v1}, Lcom/usercentrics/sdk/SecondLayerStyleSettings;-><init>(Lcom/usercentrics/sdk/ButtonLayout;Ljava/lang/Boolean;)V

    new-instance v27, Lcom/usercentrics/sdk/BannerSettings;

    const/16 v33, 0x18

    const/16 v34, 0x0

    move-object/from16 v30, v3

    move-object/from16 v29, v9

    invoke-direct/range {v27 .. v34}, Lcom/usercentrics/sdk/BannerSettings;-><init>(Lcom/usercentrics/sdk/GeneralStyleSettings;Lcom/usercentrics/sdk/FirstLayerStyleSettings;Lcom/usercentrics/sdk/SecondLayerStyleSettings;Ljava/lang/String;Lcom/usercentrics/sdk/BannerInitCustomization;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    move-object/from16 v1, v27

    invoke-direct {v8, v0, v1}, Lcom/usercentrics/sdk/UsercentricsBanner;-><init>(Landroid/content/Context;Lcom/usercentrics/sdk/BannerSettings;)V

    iput-object v8, v2, Lx65;->v:Lcom/usercentrics/sdk/UsercentricsBanner;

    sget-wide v0, Lx65;->F:J

    invoke-static {v0, v1}, Lpn7;->f(J)J

    move-result-wide v0

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v4, v2, Lx65;->r:Lq65;

    iget-object v5, v2, Lx65;->c:Lumi;

    invoke-virtual {v4, v5, v0, v1, v3}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    iget-boolean v0, v2, Lx65;->h:Z

    if-eqz v0, :cond_274

    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/16 v7, 0x16

    const/4 v1, 0x1

    const-class v3, Lx65;

    const-string v4, "onUserResponse"

    const-string v5, "onUserResponse(Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;)V"

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v8, v0}, Lcom/usercentrics/sdk/UsercentricsBanner;->showFirstLayer(Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_274
    new-instance v0, Lr2;

    const/4 v6, 0x0

    const/16 v7, 0x17

    const/4 v1, 0x1

    const-class v3, Lx65;

    const-string v4, "onUserResponse"

    const-string v5, "onUserResponse(Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;)V"

    move-object/from16 v2, p0

    invoke-direct/range {v0 .. v7}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v8, v0}, Lcom/usercentrics/sdk/UsercentricsBanner;->showSecondLayer(Lkotlin/jvm/functions/Function1;)V

    :cond_288
    return-void
.end method

.method public final n0(Lyim;)V
    .registers 7

    iget-object v0, p0, Lx65;->D:Lyim;

    sget-object v1, Lyim;->a:Lyim;

    if-ne v0, v1, :cond_85

    iput-object p1, p0, Lx65;->D:Lyim;

    const/4 v0, 0x0

    iput-object v0, p0, Lx65;->v:Lcom/usercentrics/sdk/UsercentricsBanner;

    iget-object v1, p0, Lx65;->e:Ldll;

    invoke-virtual {v1, p0}, Ldll;->b(Lcll;)V

    sget-object v1, Lyim;->d:Lyim;

    iget-object v2, p0, Lx65;->q:Lay;

    if-ne p1, v1, :cond_37

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lp65;

    iget-object v0, v0, Lp65;->a:Ljh;

    iget-object v2, v0, Ljh;->c:Ljava/lang/Object;

    check-cast v2, Lwv1;

    iget-object v2, v2, Lwv1;->b:Lb6h;

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorm;

    iget-boolean v3, v0, Ljh;->a:Z

    check-cast v2, Lx5f;

    sget-object v4, Lvb0;->c:Lvb0;

    invoke-virtual {v2, v4, v3}, Lx5f;->E(Lvb0;Z)V

    const/4 v2, 0x0

    iput-boolean v2, v0, Ljh;->b:Z

    goto :goto_55

    :cond_37
    sget-object v3, Lyim;->e:Lyim;

    if-ne p1, v3, :cond_55

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lp65;

    iget-object v2, v2, Lp65;->a:Ljh;

    iget-object v2, v2, Ljh;->c:Ljava/lang/Object;

    check-cast v2, Lwv1;

    iget-object v2, v2, Lwv1;->b:Lb6h;

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorm;

    const/4 v3, 0x5

    check-cast v2, Lx5f;

    invoke-virtual {v2, v3, v0}, Lx5f;->R(ILjava/lang/String;)V

    :cond_55
    :goto_55
    iget-object v0, p0, Lx65;->d:Lr65;

    iput-object p1, v0, Lr65;->t:Lyim;

    if-ne p1, v1, :cond_77

    sget-wide v1, Lr65;->x:J

    iget-object p1, v0, Lr65;->h:Lru9;

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    add-long/2addr v3, v1

    iget-object v1, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "cmp_consent_may_show_after_timestamp"

    invoke-interface {v1, v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    invoke-virtual {v0}, Lr65;->f()V

    :cond_77
    iget-object p1, p0, Lx65;->g:Lkotlin/jvm/functions/Function0;

    if-eqz p1, :cond_7e

    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_7e
    iget-boolean p1, p0, Lx65;->n:Z

    if-eqz p1, :cond_85

    invoke-virtual {p0}, Lryl;->g0()V

    :cond_85
    return-void
.end method

.method public final o0(Z)V
    .registers 5

    iget-object v0, p0, Lx65;->f:Lkotlin/jvm/functions/Function1;

    if-eqz v0, :cond_e

    if-eqz p1, :cond_9

    sget-object v1, Lu65;->d:Lu65;

    goto :goto_b

    :cond_9
    sget-object v1, Lu65;->e:Lu65;

    :goto_b
    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    iget-object v0, p0, Lx65;->o:Lpde;

    sget-object v1, Lv65;->b:Lv65;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lx65;->B:Z

    invoke-virtual {p0, p1}, Lx65;->q0(Z)V

    if-eqz p1, :cond_23

    sget-object p1, Lyim;->d:Lyim;

    invoke-virtual {p0, p1}, Lx65;->n0(Lyim;)V

    return-void

    :cond_23
    iget-object p1, p0, Lx65;->q:Lay;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lp65;

    iget-object p1, p1, Lp65;->a:Ljh;

    iget-object v0, p1, Ljh;->c:Ljava/lang/Object;

    check-cast v0, Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorm;

    iget-boolean v1, p1, Ljh;->a:Z

    check-cast v0, Lx5f;

    sget-object v2, Lvb0;->b:Lvb0;

    invoke-virtual {v0, v2, v1}, Lx5f;->E(Lvb0;Z)V

    const/4 v0, 0x0

    iput-boolean v0, p1, Ljh;->b:Z

    invoke-virtual {p0}, Lx65;->m0()V

    return-void
.end method

.method public final onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .registers 2

    iget-object p1, p0, Lx65;->w:Landroid/view/View;

    if-eqz p1, :cond_f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getTranslationX()F

    move-result p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setTranslationX(F)V

    :cond_f
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lx65;->A:Ljava/lang/Runnable;

    iget-object p1, p0, Lx65;->i:Lp10;

    if-nez p1, :cond_2e

    iget-object p1, p0, Lx65;->w:Landroid/view/View;

    if-nez p1, :cond_2e

    iget-boolean p1, p0, Lx65;->m:Z

    if-eqz p1, :cond_24

    new-instance p1, Ls59;

    iget-object v0, p0, Lx65;->d:Lr65;

    iget-object v0, v0, Lr65;->b:Lvx;

    invoke-virtual {v0}, Lvx;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld75;

    iget-boolean v0, v0, Ld75;->f:Z

    invoke-direct {p1, v0}, Ls59;-><init>(Z)V

    goto :goto_29

    :cond_24
    new-instance p1, Lb1i;

    invoke-direct {p1}, Lb1i;-><init>()V

    :goto_29
    iput-object p1, p0, Lx65;->i:Lp10;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lx65;->B:Z

    :cond_2e
    invoke-virtual {p0}, Lx65;->k0()V

    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 4

    new-instance p2, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iget-object p1, p0, Lx65;->p:Lz61;

    invoke-virtual {p2, p1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    iput-object p2, p0, Lx65;->t:Landroid/widget/FrameLayout;

    new-instance p1, Lyq4;

    const/16 p3, 0xa

    invoke-direct {p1, p3}, Lyq4;-><init>(B)V

    sget-object p3, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {p2, p1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    invoke-virtual {p0}, Lx65;->k0()V

    return-object p2
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lryl;->onDestroy()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lx65;->C:Z

    return-void
.end method

.method public final onStart()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-boolean v0, p0, Lx65;->y:Z

    if-eqz v0, :cond_13

    new-instance v0, Llb4;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Llb4;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lx65;->s:Landroid/os/Handler;

    invoke-virtual {p0, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_13
    return-void
.end method

.method public final onStop()V
    .registers 5

    iget-object v0, p0, Lx65;->i:Lp10;

    if-eqz v0, :cond_2e

    iget-boolean v0, p0, Lx65;->B:Z

    if-nez v0, :cond_2e

    iget-object v0, p0, Lx65;->q:Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lp65;

    iget-object v0, v0, Lp65;->a:Ljh;

    iget-boolean v1, v0, Ljh;->b:Z

    if-eqz v1, :cond_2e

    iget-object v1, v0, Ljh;->c:Ljava/lang/Object;

    check-cast v1, Lwv1;

    iget-object v1, v1, Lwv1;->b:Lb6h;

    invoke-interface {v1}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorm;

    iget-boolean v2, v0, Ljh;->a:Z

    check-cast v1, Lx5f;

    sget-object v3, Lvb0;->d:Lvb0;

    invoke-virtual {v1, v3, v2}, Lx5f;->E(Lvb0;Z)V

    const/4 v1, 0x0

    iput-boolean v1, v0, Ljh;->b:Z

    :cond_2e
    invoke-super {p0}, Landroidx/fragment/app/i;->onStop()V

    return-void
.end method

.method public final onWindowFocusChanged(Z)V
    .registers 3

    if-nez p1, :cond_12

    invoke-virtual {p0}, Lx65;->r0()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_12

    iget-object v0, p0, Lx65;->r:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iput-object p1, p0, Lx65;->w:Landroid/view/View;

    invoke-virtual {p0}, Lx65;->l0()V

    :cond_12
    return-void
.end method

.method public final p0(Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;)V
    .registers 21

    move-object/from16 v0, p0

    const/4 v1, 0x4

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v6, -0x1

    iget-object v7, v0, Lx65;->f:Lkotlin/jvm/functions/Function1;

    if-eqz v7, :cond_3e

    if-eqz p1, :cond_12

    invoke-virtual/range {p1 .. p1}, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->getUserInteraction()Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    move-result-object v8

    goto :goto_13

    :cond_12
    const/4 v8, 0x0

    :goto_13
    if-nez v8, :cond_17

    move v8, v6

    goto :goto_1f

    :cond_17
    sget-object v9, Lw65;->a:[I

    invoke-virtual {v8}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    aget v8, v9, v8

    :goto_1f
    if-eq v8, v6, :cond_39

    if-eq v8, v4, :cond_36

    if-eq v8, v3, :cond_33

    if-eq v8, v2, :cond_30

    if-ne v8, v1, :cond_2c

    sget-object v8, Lu65;->f:Lu65;

    goto :goto_3b

    :cond_2c
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_30
    sget-object v8, Lu65;->c:Lu65;

    goto :goto_3b

    :cond_33
    sget-object v8, Lu65;->b:Lu65;

    goto :goto_3b

    :cond_36
    sget-object v8, Lu65;->a:Lu65;

    goto :goto_3b

    :cond_39
    sget-object v8, Lu65;->f:Lu65;

    :goto_3b
    invoke-interface {v7, v8}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_3e
    iget-object v7, v0, Lx65;->d:Lr65;

    iget-object v8, v7, Lr65;->h:Lru9;

    if-eqz p1, :cond_49

    invoke-virtual/range {p1 .. p1}, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->getUserInteraction()Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    move-result-object v9

    goto :goto_4a

    :cond_49
    const/4 v9, 0x0

    :goto_4a
    sget-object v10, Lcom/usercentrics/sdk/UsercentricsUserInteraction;->NO_INTERACTION:Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    if-eq v9, v10, :cond_12d

    iget-object v9, v8, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v10, "cmp_consent_response_timestamp"

    const-wide/16 v11, -0x1

    invoke-interface {v9, v10, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v13

    cmp-long v9, v13, v11

    if-eqz v9, :cond_64

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v15

    cmp-long v9, v13, v15

    if-lez v9, :cond_66

    :cond_64
    move-wide v13, v11

    goto :goto_76

    :cond_66
    sget-object v9, Lpn7;->b:Lon7;

    sub-long v13, v15, v13

    sget-object v9, Lun7;->d:Lun7;

    invoke-static {v13, v14, v9}, Lcs5;->y0(JLun7;)J

    move-result-wide v13

    sget-object v9, Lun7;->f:Lun7;

    invoke-static {v13, v14, v9}, Lpn7;->p(JLun7;)J

    move-result-wide v13

    :goto_76
    invoke-virtual {v8}, Lru9;->b()Lnv6;

    move-result-object v8

    iget-object v9, v8, Lnv6;->a:Ljava/lang/Object;

    check-cast v9, Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Lr9h;->p()Luwm;

    move-result-object v15

    invoke-virtual {v15}, Luwm;->d()Lwvm;

    move-result-object v15

    iget-object v15, v15, Lwvm;->a:Lcom/usercentrics/sdk/v2/settings/data/UsercentricsSettings;

    iget-object v15, v15, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsSettings;->j:Ljava/lang/String;

    const-string v5, "cmp_consent_settings_id"

    invoke-interface {v9, v5, v15}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Lr9h;->p()Luwm;

    move-result-object v5

    invoke-virtual {v5}, Luwm;->d()Lwvm;

    move-result-object v5

    iget-object v5, v5, Lwvm;->a:Lcom/usercentrics/sdk/v2/settings/data/UsercentricsSettings;

    iget-object v5, v5, Lcom/usercentrics/sdk/v2/settings/data/UsercentricsSettings;->c:Ljava/lang/String;

    const-string v15, "cmp_consent_config_version"

    invoke-interface {v9, v15, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-wide/from16 v17, v11

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    invoke-interface {v9, v10, v11, v12}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    const-string v5, "startup.request_cmp_consent"

    const/4 v10, 0x0

    invoke-interface {v9, v5, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v8}, Lnv6;->w()V

    if-eqz p1, :cond_b9

    invoke-virtual/range {p1 .. p1}, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->getConsents()Ljava/util/List;

    move-result-object v5

    goto :goto_ba

    :cond_b9
    const/4 v5, 0x0

    :goto_ba
    invoke-virtual {v7, v5}, Lr65;->a(Ljava/util/List;)V

    iget-boolean v5, v0, Lx65;->l:Z

    if-nez v5, :cond_12d

    iget-object v5, v7, Lr65;->d:Lwv1;

    if-eqz p1, :cond_ca

    invoke-virtual/range {p1 .. p1}, Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;->getUserInteraction()Lcom/usercentrics/sdk/UsercentricsUserInteraction;

    move-result-object v7

    goto :goto_cb

    :cond_ca
    const/4 v7, 0x0

    :goto_cb
    if-nez v7, :cond_cf

    move v7, v6

    goto :goto_d7

    :cond_cf
    sget-object v8, La75;->a:[I

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    aget v7, v8, v7

    :goto_d7
    if-eq v7, v4, :cond_e5

    if-eq v7, v3, :cond_e2

    if-eq v7, v2, :cond_df

    const/4 v2, 0x0

    goto :goto_e7

    :cond_df
    sget-object v2, Lja0;->d:Lja0;

    goto :goto_e7

    :cond_e2
    sget-object v2, Lja0;->b:Lja0;

    goto :goto_e7

    :cond_e5
    sget-object v2, Lja0;->c:Lja0;

    :goto_e7
    if-eqz v2, :cond_12d

    iget-object v3, v5, Lwv1;->b:Lb6h;

    invoke-interface {v3}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorm;

    check-cast v3, Lx5f;

    iget-boolean v5, v3, Lx5f;->h:Z

    if-eqz v5, :cond_12d

    iget-object v5, v3, Lx5f;->d:Lzpa;

    new-instance v7, Lka0;

    const/16 v8, 0x98b

    const/4 v9, 0x7

    invoke-direct {v7, v8, v6, v9}, Ljf0;-><init>(III)V

    invoke-virtual {v7, v10, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    iget-boolean v2, v0, Lx65;->m:Z

    invoke-virtual {v7, v1, v4, v2}, Ljf0;->r(IIZ)V

    const/4 v1, 0x5

    sget-object v2, Lma0;->c:Lma0;

    invoke-virtual {v7, v1, v4, v2}, Ljf0;->q(IILjava/lang/Object;)V

    cmp-long v1, v13, v17

    if-eqz v1, :cond_117

    const/4 v1, 0x6

    invoke-virtual {v7, v1, v4, v13, v14}, Ljf0;->p(IIJ)V

    :cond_117
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, v5}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v2

    invoke-virtual {v2, v5}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v2

    invoke-virtual {v2}, Lxb0;->Q()Lhf0;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v3, v1}, Lx5f;->U0(Lx56;)V

    :cond_12d
    sget-object v1, Lyim;->b:Lyim;

    invoke-virtual {v0, v1}, Lx65;->n0(Lyim;)V

    return-void
.end method

.method public final q0(Z)V
    .registers 5

    iget-object v0, p0, Lx65;->u:Li3j;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object v0, v0, Li3j;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_c
    iget-object v0, p0, Lx65;->u:Li3j;

    if-eqz v0, :cond_17

    iget-object v0, v0, Li3j;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v0, p1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    :cond_17
    iget-object v0, p0, Lx65;->u:Li3j;

    if-eqz v0, :cond_28

    iget-object v0, v0, Li3j;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz p1, :cond_23

    const/4 v2, 0x0

    goto :goto_25

    :cond_23
    const/16 v2, 0x8

    :goto_25
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_28
    iget-object v0, p0, Lx65;->u:Li3j;

    if-eqz v0, :cond_33

    iget-object v0, v0, Li3j;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_33
    iget-object v0, p0, Lx65;->u:Li3j;

    if-eqz v0, :cond_40

    iget-object v0, v0, Li3j;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    xor-int/lit8 v1, p1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    :cond_40
    iget-object p0, p0, Lx65;->u:Li3j;

    if-eqz p0, :cond_4d

    iget-object p0, p0, Li3j;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    :cond_4d
    return-void
.end method

.method public final r0()Landroid/view/View;
    .registers 6

    iget-object v0, p0, Lx65;->v:Lcom/usercentrics/sdk/UsercentricsBanner;

    const/4 v1, 0x0

    if-eqz v0, :cond_54

    const-class v0, Lcom/usercentrics/sdk/UsercentricsBanner;

    const-string v2, "dialog"

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    if-eqz v0, :cond_54

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    iget-object v3, p0, Lx65;->v:Lcom/usercentrics/sdk/UsercentricsBanner;

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_1c

    return-object v1

    :cond_1c
    const-class v3, Lcom/usercentrics/sdk/UsercentricsDialog;

    const-string v4, "alertDialog"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbz0;

    if-eqz v0, :cond_54

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_54

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const-string v2, "ucBannerContainer"

    const-string v3, "id"

    invoke-virtual {v1, v2, v3, p0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0

    :cond_54
    return-object v1
.end method
