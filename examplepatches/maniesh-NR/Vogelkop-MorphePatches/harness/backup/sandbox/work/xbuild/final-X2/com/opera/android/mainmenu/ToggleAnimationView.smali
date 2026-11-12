.class public final Lcom/opera/android/mainmenu/ToggleAnimationView;
.super Lcom/opera/android/widget/ThemeableLottieAnimationView;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/mainmenu/ToggleAnimationView;",
        "Lcom/opera/android/widget/ThemeableLottieAnimationView;",
        "prl",
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
.field public static final L:Ljava/util/List;

.field public static final M:Ljava/util/List;


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:I

.field public F:I

.field public G:I

.field public H:I

.field public I:I

.field public J:Z

.field public final K:Ljava/util/ArrayList;

.field public y:Z

.field public z:Z


# direct methods
.method static constructor <clinit>()V
    .registers 4

    const-string v0, "Night mode/On primary"

    const-string v1, "OnPrimary"

    const-string v2, "Ad blocking/On primary"

    const-string v3, "Data savings/On primary"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/opera/android/mainmenu/ToggleAnimationView;->L:Ljava/util/List;

    const-string v0, "VPN_Background_OFF"

    const-string v1, "VPN_Background_ON"

    const-string v2, "Background"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    sput-object v0, Lcom/opera/android/mainmenu/ToggleAnimationView;->M:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/widget/ThemeableLottieAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->K:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final A(III)V
    .registers 13

    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->A:I

    iput p2, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->B:I

    iput p3, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->C:I

    const-string p1, "Center Transformation"

    invoke-static {p1}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p1

    sget-object p2, Lk3d;->b:Landroid/graphics/PointF;

    new-instance p3, Lorl;

    const/4 v6, 0x0

    invoke-direct {p3, p0, v6}, Lorl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;B)V

    invoke-virtual {p0, p1, p2, p3}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    sget-object p1, Lcom/opera/android/mainmenu/ToggleAnimationView;->M:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2c
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_6a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    new-instance p3, Lprl;

    new-instance v6, Landroid/graphics/PointF;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-direct {v6, v7, v8}, Landroid/graphics/PointF;-><init>(FF)V

    const/16 v7, 0x15

    invoke-direct {p3, v7}, Lua7;-><init>(B)V

    iput-object v6, p3, Lprl;->e:Landroid/graphics/PointF;

    iput-object v6, p3, Lua7;->d:Ljava/lang/Object;

    iget-object v6, p3, Lua7;->c:Ljava/lang/Object;

    check-cast v6, La73;

    if-eqz v6, :cond_5b

    invoke-virtual {v6}, La73;->h()V

    :cond_5b
    iget-object v6, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->K:Ljava/util/ArrayList;

    invoke-virtual {v6, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p2}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p2

    sget-object v6, Lk3d;->g:Landroid/graphics/PointF;

    invoke-virtual {p0, p2, v6, p3}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->a(Ldvb;Ljava/lang/Object;Lua7;)V

    goto :goto_2c

    :cond_6a
    invoke-virtual {p0}, Lcom/opera/android/mainmenu/ToggleAnimationView;->C()V

    const-string p1, "Background"

    invoke-static {p1}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p1

    sget-object p2, Lk3d;->a:Landroid/graphics/PointF;

    new-instance p2, Lorl;

    invoke-direct {p2, p0, v4}, Lorl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;B)V

    invoke-virtual {p0, p1, v5, p2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    const-string p1, "Surface/Surface container"

    invoke-static {p1}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p1

    new-instance p2, Lorl;

    invoke-direct {p2, p0, v0}, Lorl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;B)V

    invoke-virtual {p0, p1, v5, p2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    const-string p1, "VPN/Primary"

    invoke-static {p1}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p2

    new-instance p3, Lorl;

    const/4 v6, 0x3

    invoke-direct {p3, p0, v6}, Lorl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;B)V

    invoke-virtual {p0, p2, v5, p3}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    new-instance p2, Li3d;

    const p3, 0x7f0402c8

    const-string v6, "Surface/On surface variant"

    invoke-direct {p2, p3, v4, v6, v4}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v7, Li3d;

    invoke-direct {v7, p3, v0, v6, v4}, Li3d;-><init>(IILjava/lang/String;Z)V

    filled-new-array {p2, v7}, [Li3d;

    move-result-object p2

    invoke-virtual {p0, p2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->z([Li3d;)V

    sget-object p2, Lcom/opera/android/mainmenu/ToggleAnimationView;->L:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_b6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_e9

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    sget-object v0, Lk3d;->a:Landroid/graphics/PointF;

    filled-new-array {v5, v1}, [Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_b6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-static {p3}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object v6

    new-instance v7, Lorl;

    invoke-direct {v7, p0, v2}, Lorl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;B)V

    invoke-virtual {p0, v6, v4, v7}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    goto :goto_d0

    :cond_e9
    invoke-static {p1}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p1

    sget-object p2, Lk3d;->a:Landroid/graphics/PointF;

    new-instance p2, Lorl;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p3}, Lorl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;B)V

    invoke-virtual {p0, p1, v3, p2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    const-string p1, "GradientLight"

    invoke-static {p1}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p1

    new-instance p2, Lorl;

    const/4 p3, 0x6

    invoke-direct {p2, p0, p3}, Lorl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;B)V

    invoke-virtual {p0, p1, v3, p2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    const-string p1, "GradientDark"

    invoke-static {p1}, Li3d;->a(Ljava/lang/String;)Ldvb;

    move-result-object p1

    new-instance p2, Lorl;

    const/4 p3, 0x7

    invoke-direct {p2, p0, p3}, Lorl;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;B)V

    invoke-virtual {p0, p1, v3, p2}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    return-void
.end method

.method public final B(Ljava/lang/Integer;)I
    .registers 4

    if-eqz p1, :cond_35

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    add-int/lit16 v0, v0, -0xee

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_35

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v0

    add-int/lit16 v0, v0, -0xed

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    if-gt v0, v1, :cond_35

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    add-int/lit16 p1, p1, -0xdb

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    if-gt p1, v1, :cond_35

    iget-boolean p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->J:Z

    if-eqz p1, :cond_32

    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->I:I

    return p0

    :cond_32
    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->G:I

    return p0

    :cond_35
    iget-boolean p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->J:Z

    if-eqz p1, :cond_3c

    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->H:I

    return p0

    :cond_3c
    iget p0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->F:I

    return p0
.end method

.method public final C()V
    .registers 6

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f040a77

    invoke-static {v1, v0}, Lf03;->V(ILandroid/content/Context;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->z:Z

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->B:I

    const v2, 0x7f06063b

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->D:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->C:I

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->E:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->A:I

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->F:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402f0

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iput v0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->G:I

    iget v0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->F:I

    iget v1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->D:I

    const v3, 0x3da3d70a    # 0.08f

    invoke-static {v3, v1}, Lp37;->a0(FI)I

    move-result v1

    invoke-static {v0, v1}, Lp37;->r(II)I

    move-result v0

    iput v0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->H:I

    iget v0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->G:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v4, 0x7f0402c8

    invoke-static {v4, v1, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {v3, v1}, Lp37;->a0(FI)I

    move-result v1

    invoke-static {v0, v1}, Lp37;->r(II)I

    move-result v0

    iput v0, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->I:I

    invoke-virtual {p0}, Ln2d;->invalidate()V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 8

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    iget-object p1, p0, Lcom/opera/android/mainmenu/ToggleAnimationView;->K:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x0

    :cond_a
    :goto_a
    if-ge v0, p2, :cond_39

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    check-cast v1, Lprl;

    new-instance v2, Landroid/graphics/PointF;

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-direct {v2, v3, v4}, Landroid/graphics/PointF;-><init>(FF)V

    iget-object v3, v1, Lprl;->e:Landroid/graphics/PointF;

    invoke-static {v3, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    iput-object v2, v1, Lprl;->e:Landroid/graphics/PointF;

    iput-object v2, v1, Lua7;->d:Ljava/lang/Object;

    iget-object v1, v1, Lua7;->c:Ljava/lang/Object;

    check-cast v1, La73;

    if-eqz v1, :cond_a

    invoke-virtual {v1}, La73;->h()V

    goto :goto_a

    :cond_39
    return-void
.end method

.method public final y()V
    .registers 1

    invoke-virtual {p0}, Lcom/opera/android/mainmenu/ToggleAnimationView;->C()V

    invoke-super {p0}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->y()V

    return-void
.end method
