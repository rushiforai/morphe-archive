.class public final Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;",
        "Landroidx/constraintlayout/widget/ConstraintLayout;",
        "lld",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic v:I


# instance fields
.field public final p:Lp7j;

.field public q:Llld;

.field public final r:Lgjf;

.field public final s:Lei;

.field public final t:Ljava/util/List;

.field public u:Ljava/util/List;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 15
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    sget-object v1, Lp7j;->d:Lp7j;

    iput-object v1, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->p:Lp7j;

    invoke-static {p1}, Lgjf;->a(Landroid/content/Context;)Lgjf;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->r:Lgjf;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d03b1

    invoke-virtual {v1, v2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const v1, 0x7f0a0a2c

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_da

    const v1, 0x7f0a0a2d

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_da

    const v1, 0x7f0a0a2e

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_da

    const v1, 0x7f0a0a2f

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_da

    const v1, 0x7f0a0a30

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_da

    const v1, 0x7f0a0a31

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    if-eqz v7, :cond_da

    const v1, 0x7f0a0a32

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v10, v8

    check-cast v10, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v10, :cond_da

    const v1, 0x7f0a0a33

    invoke-static {v1, p0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v11, v8

    check-cast v11, Landroid/widget/TextView;

    if-eqz v11, :cond_da

    move-object v8, v6

    move-object v6, v4

    move-object v4, v2

    new-instance v2, Lei;

    move-object v9, v7

    move-object v7, v5

    move-object v5, v3

    move-object v3, p0

    invoke-direct/range {v2 .. v11}, Lei;-><init>(Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroidx/constraintlayout/widget/ConstraintLayout;Landroid/widget/TextView;)V

    move-object v3, v5

    move-object v5, v7

    move-object v7, v9

    iput-object v2, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->s:Lei;

    move-object v2, v4

    move-object v4, v6

    move-object v6, v8

    filled-new-array/range {v2 .. v7}, [Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->t:Ljava/util/List;

    sget-object v1, Ll08;->a:Ll08;

    iput-object v1, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->u:Ljava/util/List;

    sget-object v1, Lkhh;->H:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, -0x1

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    if-ltz p2, :cond_ab

    sget-object v0, Lxzj;->a:Lh58;

    invoke-virtual {v0, p2}, Lh58;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lp7j;

    iget-object v0, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->p:Lp7j;

    if-eq v0, p2, :cond_ab

    iput-object p2, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->p:Lp7j;

    iget p2, p2, Lp7j;->a:I

    invoke-virtual {v11, p2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p0}, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->r()V

    :cond_ab
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    iget-object p1, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->p:Lp7j;

    iget p1, p1, Lp7j;->a:I

    invoke-virtual {v11, p1}, Landroid/widget/TextView;->setText(I)V

    new-instance p1, Lkkf;

    const/16 p2, 0x13

    invoke-direct {p1, p0, p2}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_c5

    invoke-static {p2, p0, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_c5
    invoke-virtual {p1, p0}, Lkkf;->a(Landroid/view/View;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setFocusable(Z)V

    new-instance p1, Lh4i;

    const/16 p2, 0xc

    invoke-direct {p1, p0, p2}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_da
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final r()V
    .registers 10

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0408b5

    invoke-static {v1, v0}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v0

    :goto_11
    move v5, v0

    goto :goto_1f

    :cond_13
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0408b4

    invoke-static {v1, v0}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v0

    goto :goto_11

    :goto_1f
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0408b3

    invoke-static {v1, v0}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v0

    :goto_30
    move v6, v0

    goto :goto_3e

    :cond_32
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0408b2

    invoke-static {v1, v0}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v0

    goto :goto_30

    :goto_3e
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Lz7h;->h(Landroid/content/Context;F)I

    move-result v0

    int-to-float v4, v0

    iget-object v0, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->t:Ljava/util/List;

    check-cast v0, Ljava/lang/Iterable;

    new-instance v7, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v0, v1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroid/view/View;

    new-instance v1, Lpbj;

    iget-object v2, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->p:Lp7j;

    iget-byte v3, v2, Lp7j;->b:B

    iget-object v2, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->r:Lgjf;

    invoke-direct/range {v1 .. v6}, Lpbj;-><init>(Lgjf;IFII)V

    invoke-virtual {v8, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v7, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5c

    :cond_7b
    iput-object v7, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->u:Ljava/util/List;

    return-void
.end method

.method public final setSelected(Z)V
    .registers 7

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v0

    invoke-super {p0, p1}, Landroid/view/View;->setSelected(Z)V

    iget-object v1, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->s:Lei;

    iget-object v1, v1, Lei;->b:Landroid/view/ViewGroup;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1, p1}, Landroid/view/View;->setSelected(Z)V

    if-eq v0, p1, :cond_af

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0408b5

    invoke-static {v1, v0}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v0

    goto :goto_2f

    :cond_24
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0408b4

    invoke-static {v1, v0}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v0

    :goto_2f
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v1

    if-eqz v1, :cond_41

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0408b3

    invoke-static {v2, v1}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v1

    goto :goto_4c

    :cond_41
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0408b2

    invoke-static {v2, v1}, Lj7h;->k(ILandroid/content/Context;)I

    move-result v1

    :goto_4c
    iget-object v2, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->u:Ljava/util/List;

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_54
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_71

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpbj;

    iget-object v4, v3, Lpbj;->d:Landroid/graphics/Paint;

    invoke-virtual {v4, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    iget-object v4, v3, Lpbj;->e:Landroid/graphics/Paint;

    invoke-virtual {v4, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    goto :goto_54

    :cond_71
    if-eqz p1, :cond_af

    iget-object p1, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->q:Llld;

    if-eqz p1, :cond_af

    iget-object p1, p1, Llld;->b:Ljava/lang/Object;

    check-cast p1, Lszj;

    sget-object v0, Lszj;->w:[Lxtb;

    invoke-virtual {p1}, Lszj;->I0()Lwzj;

    move-result-object v0

    iget-object v0, v0, Lwzj;->e:Lw6j;

    iget-object v0, v0, Lw6j;->c:Ljava/lang/Object;

    check-cast v0, Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lekc;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luzj;

    if-eqz v0, :cond_af

    iget-object v0, v0, Luzj;->b:Lp7j;

    if-eqz v0, :cond_af

    iget-object p0, p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->p:Lp7j;

    if-eq p0, v0, :cond_af

    invoke-virtual {p1}, Lszj;->I0()Lwzj;

    move-result-object p1

    iget-object p1, p1, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "speed_dial.shape"

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    invoke-virtual {p1, p0, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_af
    return-void
.end method
