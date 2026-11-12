.class public final Ltz3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lbp3;

.field public final b:Ljava/util/List;

.field public final c:I

.field public final d:I

.field public final e:Z

.field public final f:Luz3;

.field public final g:Ljava/util/List;

.field public final synthetic h:Lzg;


# direct methods
.method public constructor <init>(Lzg;Lbp3;Ljava/util/List;II)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ltz3;->h:Lzg;

    iput-object p2, p0, Ltz3;->a:Lbp3;

    iput-object p3, p0, Ltz3;->b:Ljava/util/List;

    iput p4, p0, Ltz3;->c:I

    iput p5, p0, Ltz3;->d:I

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p1

    const/4 p2, 0x0

    const/4 p4, 0x1

    if-gt p1, p4, :cond_17

    move p1, p4

    goto :goto_18

    :cond_17
    move p1, p2

    :goto_18
    iput-boolean p1, p0, Ltz3;->e:Z

    invoke-static {p2, p3}, Lkotlin/collections/CollectionsKt;->M(ILjava/util/List;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Luz3;

    iput-object p2, p0, Ltz3;->f:Luz3;

    if-eqz p1, :cond_27

    sget-object p1, Ll08;->a:Ll08;

    goto :goto_2f

    :cond_27
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p1

    invoke-interface {p3, p4, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p1

    :goto_2f
    iput-object p1, p0, Ltz3;->g:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 7

    iget-object v0, p0, Ltz3;->a:Lbp3;

    iget-object v1, v0, Lbp3;->h:Ljava/lang/Object;

    check-cast v1, Ld4l;

    invoke-virtual {v1}, Ld4l;->invoke()Ljava/lang/Object;

    const/4 v1, 0x0

    if-nez p1, :cond_34

    iget-object p0, v0, Lbp3;->c:Ljava/lang/Object;

    check-cast p0, Lr9l;

    iget-object p0, p0, Lr9l;->q:Lebl;

    iget-object p0, p0, Lebl;->d:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p1, Lmu5;

    new-instance v2, Lcv2;

    const/16 v3, 0xc

    invoke-direct {v2, p0, v0, v3}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v3, Llr2;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Llr2;-><init>(B)V

    invoke-direct {p1, p0, v3, v2, v1}, Lmu5;-><init>(Landroid/view/View;Lx1p;Lkotlin/jvm/functions/Function1;B)V

    iput-boolean v4, v0, Lbp3;->b:Z

    iget-object p0, v0, Lbp3;->d:Ljava/lang/Object;

    check-cast p0, Lc9l;

    iget-object p0, p0, Lc9l;->b:Lr9l;

    iget-object p0, p0, Lr9l;->p:Li03;

    invoke-virtual {p1, p0}, Ltjf;->j(Landroid/view/ViewGroup;)V

    return-void

    :cond_34
    iget-object p0, p0, Ltz3;->h:Lzg;

    iput v1, p0, Lzg;->a:I

    const/4 p1, 0x0

    iput-object p1, p0, Lzg;->d:Ljava/lang/Object;

    return-void
.end method

.method public final b(Z)V
    .registers 10

    iget-boolean v0, p0, Ltz3;->e:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_b

    if-nez p1, :cond_b

    invoke-virtual {p0, v1}, Ltz3;->a(Z)V

    return-void

    :cond_b
    new-instance v2, Ltz3;

    if-eqz p1, :cond_13

    iget-object v0, p0, Ltz3;->b:Ljava/util/List;

    :goto_11
    move-object v5, v0

    goto :goto_16

    :cond_13
    iget-object v0, p0, Ltz3;->g:Ljava/util/List;

    goto :goto_11

    :goto_16
    iget v0, p0, Ltz3;->c:I

    xor-int/2addr p1, v1

    add-int v6, v0, p1

    iget v7, p0, Ltz3;->d:I

    iget-object v3, p0, Ltz3;->h:Lzg;

    iget-object v4, p0, Ltz3;->a:Lbp3;

    invoke-direct/range {v2 .. v7}, Ltz3;-><init>(Lzg;Lbp3;Ljava/util/List;II)V

    new-instance p0, Loc2;

    const/16 p1, 0x1b

    invoke-direct {p0, v2, p1}, Loc2;-><init>(Ljava/lang/Object;B)V

    iget-object p1, v4, Lbp3;->d:Ljava/lang/Object;

    check-cast p1, Lc9l;

    iget-object p1, p1, Lc9l;->b:Lr9l;

    iget-object p1, p1, Lr9l;->p:Li03;

    new-instance v0, Lfv2;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c()V
    .registers 8

    iget-object v0, p0, Ltz3;->f:Luz3;

    if-eqz v0, :cond_56

    new-instance v1, Lf9;

    const/16 v2, 0x10

    iget-object v3, p0, Ltz3;->h:Lzg;

    invoke-direct {v1, v3, p0, v0, v2}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v2, p0, Ltz3;->a:Lbp3;

    iget-object v3, v2, Lbp3;->c:Ljava/lang/Object;

    check-cast v3, Lr9l;

    invoke-virtual {v3, v0}, Lr9l;->e(Luz3;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_50

    new-instance v4, Lqz3;

    invoke-static {v3}, Lcs5;->W(Landroid/view/View;)Z

    move-result v5

    iget v6, p0, Ltz3;->c:I

    iget p0, p0, Ltz3;->d:I

    invoke-direct {v4, v0, v6, p0, v5}, Lqz3;-><init>(Luz3;IIZ)V

    new-instance p0, Lf9;

    const/16 v5, 0x11

    invoke-direct {p0, v0, v3, v1, v5}, Lf9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v1, Lrz3;

    new-instance v5, Lcv2;

    const/16 v6, 0xb

    invoke-direct {v5, v2, p0, v6}, Lcv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Luz3;->h:Luz3;

    if-ne v0, p0, :cond_3d

    sget-object p0, Lk11;->b:Lk11;

    goto :goto_3f

    :cond_3d
    sget-object p0, Lk11;->a:Lk11;

    :goto_3f
    invoke-direct {v1, v4, v3, v5, p0}, Lrz3;-><init>(Lqz3;Landroid/view/View;Lcv2;Lk11;)V

    iget-object p0, v2, Lbp3;->d:Ljava/lang/Object;

    check-cast p0, Lc9l;

    iget-object p0, p0, Lc9l;->b:Lr9l;

    iget-object p0, p0, Lr9l;->p:Li03;

    invoke-virtual {v1, p0}, Ltjf;->j(Landroid/view/ViewGroup;)V

    iput-object v1, v2, Lbp3;->i:Ljava/lang/Object;

    return-void

    :cond_50
    sget-object p0, Lvz3;->e:Lvz3;

    invoke-virtual {v1, p0}, Lf9;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_56
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ltz3;->a(Z)V

    return-void
.end method
