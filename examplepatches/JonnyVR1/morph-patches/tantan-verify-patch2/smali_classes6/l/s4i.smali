.class public Ll/s4i;
.super Ll/lb2;
.source "SourceFile"


# instance fields
.field public e:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/t4i;

.field public g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;",
            ">;"
        }
    .end annotation
.end field

.field public h:Z

.field public i:I

.field public j:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/s4i;->g:Ljava/util/Map;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/s4i;->i:I

    .line 13
    .line 14
    iput v0, p0, Ll/s4i;->j:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4i;->f:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/t4i;->c()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 p0, -0x2

    .line 2
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-ne p1, p2, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Ll/s4i;->f:Ll/t4i;

    .line 11
    .line 12
    invoke-virtual {v1, p2}, Ll/t4i;->d(I)Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->m0(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/s4i;->g:Ljava/util/Map;

    .line 20
    .line 21
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/s4i;->e:Ll/y20;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-interface {v1, v0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-boolean v1, p0, Ll/s4i;->h:Z

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget v1, p0, Ll/s4i;->i:I

    .line 40
    .line 41
    if-ne p2, v1, :cond_1

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/s4i;->r()V

    .line 44
    .line 45
    .line 46
    const/4 p2, 0x0

    .line 47
    iput-boolean p2, p0, Ll/s4i;->h:Z

    .line 48
    .line 49
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 50
    .line 51
    .line 52
    return-object v0
.end method

.method public q()Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s4i;->g:Ljava/util/Map;

    .line 2
    .line 3
    iget p0, p0, Ll/s4i;->i:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;

    .line 14
    .line 15
    return-object p0
.end method

.method public final r()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/s4i;->g:Ljava/util/Map;

    .line 2
    .line 3
    iget v1, p0, Ll/s4i;->i:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->k0()V

    .line 16
    .line 17
    .line 18
    iget v0, p0, Ll/s4i;->j:I

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    iget v2, p0, Ll/s4i;->i:I

    .line 24
    .line 25
    if-eq v2, v0, :cond_0

    .line 26
    .line 27
    iget-object v2, p0, Ll/s4i;->g:Ljava/util/Map;

    .line 28
    .line 29
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;->h0()V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget v0, p0, Ll/s4i;->i:I

    .line 43
    .line 44
    if-eq v0, v1, :cond_1

    .line 45
    .line 46
    iput v0, p0, Ll/s4i;->j:I

    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public s(Ll/t4i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s4i;->f:Ll/t4i;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Ll/t4i;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Ll/s4i;->h:Z

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s4i;->s(Ll/t4i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public u(I)V
    .locals 1

    .line 1
    iput p1, p0, Ll/s4i;->i:I

    .line 2
    .line 3
    iget-object v0, p0, Ll/s4i;->g:Ljava/util/Map;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Ll/s4i;->h:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-virtual {p0}, Ll/s4i;->r()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public v(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/feed/newui/status/display/card/FeedStateCardView;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/s4i;->e:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
