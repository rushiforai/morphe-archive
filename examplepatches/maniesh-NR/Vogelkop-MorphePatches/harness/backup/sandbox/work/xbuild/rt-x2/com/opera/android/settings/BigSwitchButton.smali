.class public Lcom/opera/android/settings/BigSwitchButton;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# static fields
.field public static final j:Lk2d;

.field public static final k:Lk2d;

.field public static final l:Lk2d;

.field public static final m:Lk2d;

.field public static final n:Lk2d;

.field public static final o:Lk2d;

.field public static final p:Lk2d;

.field public static final q:Lk2d;


# instance fields
.field public final a:Lvs;

.field public final b:Lse3;

.field public c:B

.field public d:I

.field public e:I

.field public f:B

.field public g:B

.field public h:B

.field public i:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lk2d;

    const/16 v1, 0x27

    const/4 v2, 0x0

    invoke-direct {v0, v2, v1, v2}, Lk2d;-><init>(III)V

    sput-object v0, Lcom/opera/android/settings/BigSwitchButton;->j:Lk2d;

    new-instance v0, Lk2d;

    const/16 v1, 0x28

    const/16 v3, 0x63

    invoke-direct {v0, v1, v3, v2}, Lk2d;-><init>(III)V

    sput-object v0, Lcom/opera/android/settings/BigSwitchButton;->k:Lk2d;

    new-instance v0, Lk2d;

    const/16 v1, 0x46

    const/4 v4, -0x1

    invoke-direct {v0, v1, v3, v4}, Lk2d;-><init>(III)V

    sput-object v0, Lcom/opera/android/settings/BigSwitchButton;->l:Lk2d;

    new-instance v0, Lk2d;

    const/16 v1, 0x82

    const/16 v3, 0xa3

    invoke-direct {v0, v1, v3, v2}, Lk2d;-><init>(III)V

    sput-object v0, Lcom/opera/android/settings/BigSwitchButton;->m:Lk2d;

    new-instance v0, Lk2d;

    invoke-direct {v0, v3, v3, v2}, Lk2d;-><init>(III)V

    sput-object v0, Lcom/opera/android/settings/BigSwitchButton;->n:Lk2d;

    new-instance v0, Lk2d;

    const/16 v1, 0xa4

    const/16 v3, 0xb4

    invoke-direct {v0, v1, v3, v2}, Lk2d;-><init>(III)V

    sput-object v0, Lcom/opera/android/settings/BigSwitchButton;->o:Lk2d;

    new-instance v0, Lk2d;

    invoke-direct {v0, v3, v3, v2}, Lk2d;-><init>(III)V

    sput-object v0, Lcom/opera/android/settings/BigSwitchButton;->p:Lk2d;

    new-instance v0, Lk2d;

    invoke-direct {v0, v3, v3, v2}, Lk2d;-><init>(III)V

    sput-object v0, Lcom/opera/android/settings/BigSwitchButton;->q:Lk2d;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 19
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    move-object/from16 v1, p0

    move-object/from16 v6, p1

    const/4 v0, 0x4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x0

    move-object/from16 v0, p2

    invoke-direct {v1, v6, v0, v8}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v0, Lse3;

    invoke-direct {v0, v1, v8}, Lse3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, v1, Lcom/opera/android/settings/BigSwitchButton;->b:Lse3;

    iput-byte v8, v1, Lcom/opera/android/settings/BigSwitchButton;->c:B

    const v0, 0x7f0400d7

    iput v0, v1, Lcom/opera/android/settings/BigSwitchButton;->d:I

    const v0, 0x7f0400d9

    iput v0, v1, Lcom/opera/android/settings/BigSwitchButton;->e:I

    const/4 v9, 0x1

    invoke-virtual {v1, v9}, Landroid/widget/LinearLayout;->setOrientation(I)V

    invoke-static {v6}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v2, 0x7f0d0092

    invoke-virtual {v0, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v0, 0x7f0a0514

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    const/4 v10, 0x0

    if-eqz v2, :cond_10a

    const v0, 0x7f0a0322

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v3, :cond_10a

    const v0, 0x7f0a05e0

    invoke-static {v0, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_10a

    new-instance v0, Lvs;

    const/4 v5, 0x6

    invoke-direct/range {v0 .. v5}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, v1, Lcom/opera/android/settings/BigSwitchButton;->a:Lvs;

    sget-object v0, Lcom/opera/android/settings/BigSwitchButton;->p:Lk2d;

    invoke-virtual {v3, v0, v10}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    new-instance v0, Li3d;

    sget-object v2, Lk3d;->a:Landroid/graphics/PointF;

    const v2, 0x7f040203

    const-string v4, "ThemeColor"

    invoke-direct {v0, v2, v9, v4, v8}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v5, Li3d;

    const/4 v11, 0x2

    const-string v12, "ThemeStroke"

    invoke-direct {v5, v2, v11, v12, v8}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v2, Li3d;

    const-string v13, "DarkLightElev04Inv"

    const v14, 0x7f0400d3

    invoke-direct {v2, v14, v9, v13, v8}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v13, Li3d;

    const-string v14, "DarkLightMedium"

    const v15, 0x7f0400d4

    invoke-direct {v13, v15, v9, v14, v8}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v14, Li3d;

    const-string v10, "DarkLightMediumStroke"

    invoke-direct {v14, v15, v11, v10, v8}, Li3d;-><init>(IILjava/lang/String;Z)V

    filled-new-array {v0, v5, v2, v13, v14}, [Li3d;

    move-result-object v0

    invoke-virtual {v3, v0}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->z([Li3d;)V

    new-instance v0, Ldvb;

    const-string v2, "**"

    filled-new-array {v2, v4, v2}, [Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ldvb;-><init>([Ljava/lang/String;)V

    new-instance v4, Lre3;

    invoke-direct {v4, v1, v8}, Lre3;-><init>(Lcom/opera/android/settings/BigSwitchButton;B)V

    invoke-virtual {v3, v0, v7, v4}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    new-instance v0, Ldvb;

    filled-new-array {v2, v12, v2}, [Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ldvb;-><init>([Ljava/lang/String;)V

    new-instance v4, Lre3;

    invoke-direct {v4, v1, v9}, Lre3;-><init>(Lcom/opera/android/settings/BigSwitchButton;B)V

    invoke-virtual {v3, v0, v7, v4}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    new-instance v0, Ldvb;

    const-string v4, "GradientLight"

    filled-new-array {v2, v4, v2}, [Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Ldvb;-><init>([Ljava/lang/String;)V

    new-instance v4, Lre3;

    invoke-direct {v4, v1, v11}, Lre3;-><init>(Lcom/opera/android/settings/BigSwitchButton;B)V

    invoke-virtual {v3, v0, v7, v4}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    new-instance v0, Ldvb;

    const-string v4, "GradientDark"

    filled-new-array {v2, v4, v2}, [Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ldvb;-><init>([Ljava/lang/String;)V

    new-instance v2, Lre3;

    const/4 v4, 0x3

    invoke-direct {v2, v1, v4}, Lre3;-><init>(Lcom/opera/android/settings/BigSwitchButton;B)V

    invoke-virtual {v3, v0, v7, v2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    new-instance v0, Lu7;

    const/16 v2, 0x11

    invoke-direct {v0, v1, v2}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v2

    if-eqz v2, :cond_f0

    invoke-static {v2, v1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_f0
    invoke-virtual {v0, v1}, Lu7;->a(Landroid/view/View;)V

    const/high16 v0, 0x40800000    # 4.0f

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {v0, v2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    new-instance v2, Luf9;

    const v3, 0x7f0404b7

    const/4 v4, 0x0

    invoke-direct {v2, v6, v4, v0, v3}, Luf9;-><init>(Landroid/content/Context;Lsll;II)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :cond_10a
    move-object v4, v10

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v4
.end method


# virtual methods
.method public final a()V
    .registers 6

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f040a77

    invoke-static {v1, v0}, Lf03;->V(ILandroid/content/Context;)Z

    move-result v0

    iget-boolean v1, p0, Lcom/opera/android/settings/BigSwitchButton;->i:Z

    const/4 v2, 0x0

    const/16 v3, 0x64

    if-eqz v1, :cond_16

    if-eqz v0, :cond_16

    move v4, v3

    goto :goto_17

    :cond_16
    move v4, v2

    :goto_17
    iput-byte v4, p0, Lcom/opera/android/settings/BigSwitchButton;->f:B

    if-eqz v1, :cond_1f

    if-nez v0, :cond_1f

    move v0, v3

    goto :goto_20

    :cond_1f
    move v0, v2

    :goto_20
    iput-byte v0, p0, Lcom/opera/android/settings/BigSwitchButton;->g:B

    if-nez v1, :cond_25

    move v2, v3

    :cond_25
    iput-byte v2, p0, Lcom/opera/android/settings/BigSwitchButton;->h:B

    iget-object p0, p0, Lcom/opera/android/settings/BigSwitchButton;->a:Lvs;

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {p0}, Ln2d;->invalidate()V

    return-void
.end method

.method public final b(Lpxh;)V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    iget-object v0, p0, Lcom/opera/android/settings/BigSwitchButton;->a:Lvs;

    iget-object v0, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Ln1h;->o(Landroid/view/View;Ljava/lang/CharSequence;I)V

    return-void
.end method

.method public final c(Lpxh;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/settings/BigSwitchButton;->a:Lvs;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p1, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final d(I)V
    .registers 5

    iget-byte v0, p0, Lcom/opera/android/settings/BigSwitchButton;->c:B

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput-byte p1, p0, Lcom/opera/android/settings/BigSwitchButton;->c:B

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/opera/android/settings/BigSwitchButton;->a:Lvs;

    iget-object v2, p0, Lcom/opera/android/settings/BigSwitchButton;->b:Lse3;

    if-nez p1, :cond_1b

    invoke-virtual {v2}, Ld17;->d()V

    iget-object p1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    sget-object v1, Lcom/opera/android/settings/BigSwitchButton;->o:Lk2d;

    invoke-virtual {p1, v1, v0}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    goto :goto_4d

    :cond_1b
    invoke-virtual {v2}, Ld17;->a()V

    iget-byte p1, p0, Lcom/opera/android/settings/BigSwitchButton;->c:B

    const/4 v2, 0x1

    if-ne p1, v2, :cond_34

    iget-object p1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    new-instance v0, Lfv2;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lfv2;-><init>(Ljava/lang/Object;B)V

    sget-object v1, Lcom/opera/android/settings/BigSwitchButton;->k:Lk2d;

    invoke-virtual {p1, v1, v0}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    goto :goto_4d

    :cond_34
    const/4 v2, 0x2

    if-ne p1, v2, :cond_41

    iget-object p1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    sget-object v1, Lcom/opera/android/settings/BigSwitchButton;->q:Lk2d;

    invoke-virtual {p1, v1, v0}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    goto :goto_4d

    :cond_41
    const/4 v2, 0x3

    if-ne p1, v2, :cond_4d

    iget-object p1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    sget-object v1, Lcom/opera/android/settings/BigSwitchButton;->m:Lk2d;

    invoke-virtual {p1, v1, v0}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    :cond_4d
    :goto_4d
    invoke-virtual {p0}, Lcom/opera/android/settings/BigSwitchButton;->e()V

    return-void
.end method

.method public final e()V
    .registers 7

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/settings/BigSwitchButton;->a:Lvs;

    iget-object v2, v1, Lvs;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    iget-byte v3, p0, Lcom/opera/android/settings/BigSwitchButton;->c:B

    const/4 v4, 0x3

    if-ne v3, v4, :cond_12

    iget v3, p0, Lcom/opera/android/settings/BigSwitchButton;->d:I

    goto :goto_15

    :cond_12
    const v3, 0x7f0400d8

    :goto_15
    const v5, 0x7f0600a7

    invoke-static {v3, v0, v5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v1, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    iget-byte v2, p0, Lcom/opera/android/settings/BigSwitchButton;->c:B

    if-ne v2, v4, :cond_2a

    iget p0, p0, Lcom/opera/android/settings/BigSwitchButton;->e:I

    goto :goto_2d

    :cond_2a
    const p0, 0x7f0400da

    :goto_2d
    invoke-static {p0, v0, v5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public final getSuggestedMinimumHeight()I
    .registers 2

    const/high16 v0, 0x43200000    # 160.0f

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {v0, p0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p0

    return p0
.end method

.method public final jumpDrawablesToCurrentState()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    iget-byte v0, p0, Lcom/opera/android/settings/BigSwitchButton;->c:B

    const/4 v1, 0x0

    iget-object p0, p0, Lcom/opera/android/settings/BigSwitchButton;->a:Lvs;

    if-nez v0, :cond_14

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    sget-object v0, Lcom/opera/android/settings/BigSwitchButton;->p:Lk2d;

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    return-void

    :cond_14
    const/4 v2, 0x3

    if-ne v0, v2, :cond_20

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    sget-object v0, Lcom/opera/android/settings/BigSwitchButton;->n:Lk2d;

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/widget/LottieAnimationView;->t(Lk2d;Ljava/lang/Runnable;)V

    :cond_20
    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object p0, p0, Lcom/opera/android/settings/BigSwitchButton;->b:Lse3;

    invoke-virtual {p0}, Ld17;->a()V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 1

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    iget-object p0, p0, Lcom/opera/android/settings/BigSwitchButton;->b:Lse3;

    invoke-virtual {p0}, Ld17;->d()V

    return-void
.end method
