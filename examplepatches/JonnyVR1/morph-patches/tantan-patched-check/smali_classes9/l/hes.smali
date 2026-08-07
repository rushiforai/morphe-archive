.class public Ll/hes;
.super Ll/d3q;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d3q<",
        "Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Ll/w5g;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/w5g;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/d3q;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hes;->a:Ll/nsv;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public H(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hes;->a:Ll/nsv;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->i(Ll/nsv;)V

    .line 7
    .line 8
    .line 9
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
    invoke-super {p0, p1, p2}, Ll/d3q;->v(Landroid/view/View;Ljava/util/List;)V

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
    instance-of v0, p2, Ll/nsv;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p2, Ll/nsv;

    .line 14
    .line 15
    iput-object p2, p0, Ll/hes;->a:Ll/nsv;

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;->i(Ll/nsv;)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/d3q;->onItemClick:Landroid/view/View$OnClickListener;

    .line 21
    .line 22
    invoke-static {p1, p0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->w(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    if-ne p0, p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    if-eqz p1, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    check-cast p1, Ll/hes;

    .line 19
    .line 20
    iget-object p0, p0, Ll/hes;->a:Ll/nsv;

    .line 21
    .line 22
    iget-object p1, p1, Ll/hes;->a:Ll/nsv;

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/k950;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0

    .line 29
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public hashCode()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hes;->a:Ll/nsv;

    .line 2
    .line 3
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/k950;->b([Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public n()Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hes;->a:Ll/nsv;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->U0:I

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic u(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hes;->H(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V

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
    invoke-virtual {p0, p1, p2}, Ll/hes;->I(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic w(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hes;->J(Lcom/p1/mobile/putong/live/livingroom/common/fans/LiveFansItem;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
