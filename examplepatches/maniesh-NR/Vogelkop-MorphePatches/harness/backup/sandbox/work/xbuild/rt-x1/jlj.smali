.class public abstract Ljlj;
.super Lqkj;
.source "SourceFile"


# instance fields
.field public final g:Llxh;


# direct methods
.method public constructor <init>(Lvql;Lwwd;Lrxh;Lrxh;Llxh;I)V
    .registers 13

    and-int/lit8 p6, p6, 0x8

    if-eqz p6, :cond_b

    new-instance p4, Lqxh;

    const-string p6, ""

    invoke-direct {p4, p6}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :cond_b
    move-object v4, p4

    const v5, 0x7f15028f

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v5}, Lb63;-><init>(Lvql;Lwwd;Lpxh;Lpxh;I)V

    iput-object p5, v0, Ljlj;->g:Llxh;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljlj;->c(Z)V

    return-void
.end method

.method public final b(Z)V
    .registers 8

    iget-object v0, p0, Lb63;->f:Lpt1;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/DialogTitle;

    invoke-virtual {v0}, Landroid/widget/TextView;->getCompoundDrawables()[Landroid/graphics/drawable/Drawable;

    move-result-object v0

    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    :goto_11
    if-ge v4, v2, :cond_1c

    aget-object v5, v0, v4

    if-eqz v5, :cond_19

    const/4 v3, 0x1

    goto :goto_1c

    :cond_19
    add-int/lit8 v4, v4, 0x1

    goto :goto_11

    :cond_1c
    :goto_1c
    if-eq p1, v3, :cond_31

    iget-object v0, p0, Lb63;->f:Lpt1;

    if-eqz v0, :cond_23

    move-object v1, v0

    :cond_23
    iget-object v0, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v1, Lgh2;

    const/16 v2, 0xb

    invoke-direct {v1, v2, p0, p1}, Lgh2;-><init>(BLjava/lang/Object;Z)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_31
    return-void
.end method

.method public final c(Z)V
    .registers 6

    iget-object v0, p0, Lb63;->f:Lpt1;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    move-object v2, v0

    goto :goto_8

    :cond_7
    move-object v2, v1

    :goto_8
    iget-object v2, v2, Lpt1;->b:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/DialogTitle;

    if-eqz p1, :cond_11

    iget-object p0, p0, Ljlj;->g:Llxh;

    goto :goto_12

    :cond_11
    move-object p0, v1

    :goto_12
    if-eqz p0, :cond_30

    if-nez v0, :cond_17

    move-object v0, v1

    :cond_17
    iget-object p1, v0, Lpt1;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/DialogTitle;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb8h;->f(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    const/4 v3, 0x0

    invoke-virtual {p0, v3, v3, p1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    goto :goto_31

    :cond_30
    move-object p0, v1

    :goto_31
    invoke-virtual {v2, v1, p0, v1, v1}, Lyq1;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
