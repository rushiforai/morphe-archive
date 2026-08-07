.class public Ll/fes;
.super Ll/hes;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fes$a;
    }
.end annotation


# instance fields
.field public b:Z


# direct methods
.method public constructor <init>(Ll/nsv;)V
    .locals 0
    .param p1    # Ll/nsv;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/w5g;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/hes;-><init>(Ll/nsv;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Ll/fes;->b:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/hes;->H(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/fes;->b:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Ll/hes;->a:Ll/nsv;

    .line 9
    .line 10
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Ll/w5g;

    .line 13
    .line 14
    iget-object p0, p0, Ll/w5g;->a:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->k()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;Ljava/util/List;)V
    .locals 1
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/hes;->I(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    instance-of v0, p2, Ll/fes$a;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    check-cast p2, Ll/fes$a;

    .line 14
    .line 15
    iget-object v0, p2, Ll/fes$a;->a:Ll/nsv;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->i(Ll/nsv;)V

    .line 18
    .line 19
    .line 20
    iget-boolean v0, p2, Ll/fes$a;->b:Z

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p2, Ll/fes$a;->a:Ll/nsv;

    .line 25
    .line 26
    iget-object v0, v0, Ll/nsv;->a:Ljava/lang/Object;

    .line 27
    .line 28
    check-cast v0, Ll/w5g;

    .line 29
    .line 30
    iget-object v0, v0, Ll/w5g;->a:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->j(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->k()V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-boolean v0, p2, Ll/fes$a;->b:Z

    .line 40
    .line 41
    iput-boolean v0, p0, Ll/fes;->b:Z

    .line 42
    .line 43
    iget-object p2, p2, Ll/fes$a;->a:Ll/nsv;

    .line 44
    .line 45
    iput-object p2, p0, Ll/hes;->a:Ll/nsv;

    .line 46
    .line 47
    iget-object p0, p0, Ll/d3q;->onItemClick:Landroid/view/View$OnClickListener;

    .line 48
    .line 49
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    :cond_1
    return-void
.end method

.method public K(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V
    .locals 1

    .line 1
    const/high16 v0, 0x41200000    # 10.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {p1, v0}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 8
    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationZ(F)V

    .line 13
    .line 14
    .line 15
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public L(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fes;->b:Z

    .line 2
    .line 3
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    invoke-super {p0, p1}, Ll/hes;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_2

    .line 24
    .line 25
    return v1

    .line 26
    :cond_2
    check-cast p1, Ll/fes;

    .line 27
    .line 28
    iget-boolean p0, p0, Ll/fes;->b:Z

    .line 29
    .line 30
    iget-boolean p1, p1, Ll/fes;->b:Z

    .line 31
    .line 32
    if-ne p0, p1, :cond_3

    .line 33
    .line 34
    return v0

    .line 35
    :cond_3
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 1
    invoke-super {p0}, Ll/hes;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean p0, p0, Ll/fes;->b:Z

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fes;->K(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n()Ljava/lang/Object;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance v0, Ll/fes$a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hes;->a:Ll/nsv;

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/fes;->b:Z

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Ll/fes$a;-><init>(Ll/nsv;Z)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public r()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fes;->H(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic v(Landroid/view/View;Ljava/util/List;)V
    .locals 0
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/fes;->I(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
