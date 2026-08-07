.class public Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/ProxyTantanListView;
.super Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;
.source "SourceFile"

# interfaces
.implements Ll/iwl;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    invoke-static {}, Ll/fsq;->a()Ll/fsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-virtual {v0, v1}, Ll/fsq;->f(I)Ll/fsq;

    .line 7
    .line 8
    .line 9
    const-wide/16 v1, 0x12c

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Ll/fsq;->d(J)Ll/fsq;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v1, v2}, Ll/fsq;->e(Z)Ll/fsq;

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->z0(Ll/fsq;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public B(Ll/pn50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->z(Ll/pn50;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public C(I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->J(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d()V
    .locals 4

    .line 1
    invoke-static {}, Ll/fsq;->a()Ll/fsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/fsq;->f(I)Ll/fsq;

    .line 7
    .line 8
    .line 9
    const/16 v1, 0x7d0

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/fsq;->h(I)Ll/fsq;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-wide/16 v2, 0x2bc

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3}, Ll/fsq;->d(J)Ll/fsq;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->z0(Ll/fsq;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    invoke-static {}, Ll/fsq;->a()Ll/fsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-virtual {v0, v1}, Ll/fsq;->f(I)Ll/fsq;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->z0(Ll/fsq;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getCountHook()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->a:Ll/s900;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->a:Ll/s900;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/s900;->m()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public getFirstVisiblePositionHook()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->I()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->E()Ll/orc0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget p0, p0, Ll/orc0;->f:I

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public getHeaderViewsCountHook()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->a:Ll/s900;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/s900;->D()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLastVisiblePositionHook()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->I()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->F()Ll/orc0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget p0, p0, Ll/orc0;->f:I

    .line 24
    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public getListRenderHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/idi0;->F0()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getRealView()Landroid/view/ViewGroup;
    .locals 0

    return-object p0
.end method

.method public j(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->i(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->e0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public n(Ll/pn50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->g(Ll/pn50;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p(I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/fsq;->a()Ll/fsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/fsq;->f(I)Ll/fsq;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/fsq;->h(I)Ll/fsq;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, v1}, Ll/fsq;->c(Z)Ll/fsq;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1, v1}, Ll/fsq;->b(Z)Ll/fsq;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->z0(Ll/fsq;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public s()V
    .locals 4

    .line 1
    invoke-static {}, Ll/fsq;->a()Ll/fsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x2

    .line 6
    invoke-virtual {v0, v1}, Ll/fsq;->f(I)Ll/fsq;

    .line 7
    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Ll/fsq;->c(Z)Ll/fsq;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v2, v1}, Ll/fsq;->b(Z)Ll/fsq;

    .line 15
    .line 16
    .line 17
    const-wide/16 v2, 0x12c

    .line 18
    .line 19
    invoke-virtual {v0, v2, v3}, Ll/fsq;->d(J)Ll/fsq;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, v1}, Ll/fsq;->e(Z)Ll/fsq;

    .line 24
    .line 25
    .line 26
    const/16 v1, -0x190

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/fsq;->g(I)Ll/fsq;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->z0(Ll/fsq;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public setMessageAdapterHook(Ll/l900;)V
    .locals 2

    .line 1
    new-instance v0, Ll/s900;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/s900;-><init>(Ll/l900;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->a:Ll/s900;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/a;->a0(Ll/dxi0;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->a:Ll/s900;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ll/l900;->b(Ll/kzl;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setSelectionHook(I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/fsq;->a()Ll/fsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/fsq;->f(I)Ll/fsq;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/fsq;->h(I)Ll/fsq;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, v1}, Ll/fsq;->c(Z)Ll/fsq;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1, v1}, Ll/fsq;->b(Z)Ll/fsq;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->z0(Ll/fsq;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public u()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->D()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v()V
    .locals 4

    .line 1
    invoke-static {}, Ll/fsq;->a()Ll/fsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Ll/fsq;->f(I)Ll/fsq;

    .line 7
    .line 8
    .line 9
    const/16 v1, -0x7d0

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/fsq;->h(I)Ll/fsq;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const-wide/16 v2, 0x2bc

    .line 16
    .line 17
    invoke-virtual {v1, v2, v3}, Ll/fsq;->d(J)Ll/fsq;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->z0(Ll/fsq;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public x(I)V
    .locals 2

    .line 1
    invoke-static {}, Ll/fsq;->a()Ll/fsq;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {v0, v1}, Ll/fsq;->f(I)Ll/fsq;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/fsq;->h(I)Ll/fsq;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v1}, Ll/fsq;->c(Z)Ll/fsq;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1, v1}, Ll/fsq;->b(Z)Ll/fsq;

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->b:Ll/idi0;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/b;->z0(Ll/fsq;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
