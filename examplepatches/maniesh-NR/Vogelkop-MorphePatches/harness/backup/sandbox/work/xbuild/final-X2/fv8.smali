.class public final Lfv8;
.super Liph;
.source "SourceFile"


# instance fields
.field public final a:Lzi4;

.field public final b:Lxu8;

.field public final c:Lyu8;

.field public final d:Llaj;

.field public final e:I

.field public final f:I

.field public g:Llv8;

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lpde;Ltsd;Lzi4;Lxu8;Lyu8;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Lfv8;->a:Lzi4;

    iput-object p5, p0, Lfv8;->b:Lxu8;

    iput-object p6, p0, Lfv8;->c:Lyu8;

    sget-object p5, Lmaj;->a:Lmaj;

    invoke-static {p1, p5}, Lu0h;->g(Landroid/content/Context;Lmaj;)Llaj;

    move-result-object p5

    iput-object p5, p0, Lfv8;->d:Llaj;

    const p6, 0x7f0600b2

    invoke-virtual {p1, p6}, Landroid/content/Context;->getColor(I)I

    move-result p6

    iput p6, p0, Lfv8;->e:I

    const v0, 0x7f06108f

    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result p1

    iput p1, p0, Lfv8;->f:I

    new-instance v0, Llv8;

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lw6k;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_3b

    if-ne v1, v3, :cond_37

    move p6, p1

    goto :goto_3b

    :cond_37
    invoke-static {}, Lh9o;->p()V

    throw v2

    :cond_3b
    :goto_3b
    invoke-direct {v0, p6}, Llv8;-><init>(I)V

    iput-object v0, p0, Lfv8;->g:Llv8;

    invoke-virtual {p3}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lw6k;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_52

    if-eq p1, v3, :cond_53

    invoke-static {}, Lh9o;->p()V

    throw v2

    :cond_52
    move-object p5, v2

    :cond_53
    invoke-virtual {p4, p5}, Lzi4;->Y(Llaj;)Z

    new-instance p1, Lcl4;

    const/16 p4, 0x12

    invoke-direct {p1, p0, p4}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p2, p1}, La26;->S(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 7

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object p3

    invoke-static {p2}, Landroidx/recyclerview/widget/RecyclerView;->S(Landroid/view/View;)I

    move-result p4

    iget v0, p1, Landroid/graphics/Rect;->top:I

    iget-object v1, p0, Lfv8;->b:Lxu8;

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {v1, p4}, Lxu8;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lmv8;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-interface {p4}, Lmv8;->b()Lkv8;

    move-result-object p4

    iget-object p4, p4, Lkv8;->a:Ly7h;

    invoke-virtual {p4, p2}, Ly7h;->k(Landroid/content/Context;)I

    move-result p2

    add-int/2addr p2, v0

    iput p2, p1, Landroid/graphics/Rect;->top:I

    instance-of p2, p3, Lev8;

    if-nez p2, :cond_37

    iget p2, p1, Landroid/graphics/Rect;->left:I

    iget p0, p0, Lfv8;->h:I

    add-int/2addr p2, p0

    iput p2, p1, Landroid/graphics/Rect;->left:I

    iget p2, p1, Landroid/graphics/Rect;->right:I

    add-int/2addr p2, p0

    iput p2, p1, Landroid/graphics/Rect;->right:I

    :cond_37
    return-void
.end method

.method public final onDrawOver(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Lvph;)V
    .registers 5

    new-instance p3, Lry7;

    const/16 v0, 0x9

    invoke-direct {p3, p2, p0, v0}, Lry7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, p0, Lfv8;->a:Lzi4;

    invoke-virtual {p0}, Lzi4;->F()Z

    move-result p2

    if-nez p2, :cond_15

    invoke-virtual {p1}, Landroid/graphics/Canvas;->isHardwareAccelerated()Z

    move-result p2

    if-eqz p2, :cond_18

    :cond_15
    invoke-virtual {p0, p1, p3}, Lzi4;->k(Landroid/graphics/Canvas;Lkotlin/jvm/functions/Function1;)V

    :cond_18
    invoke-virtual {p3, p1}, Lry7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
