.class public Ll/lbf0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public d:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/lbf0;->E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lbf0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;->tasks:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object p0, p0, Ll/lbf0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;->tasks:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    if-eq p2, p0, :cond_2

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    if-eq p2, p0, :cond_1

    .line 7
    .line 8
    const/4 p0, 0x3

    .line 9
    if-ne p2, p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget p1, Ll/yec0;->A5:I

    .line 16
    .line 17
    invoke-static {p0, p1, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    const-string p0, "Unknown view type: "

    .line 23
    .line 24
    invoke-static {p0, p2}, Ll/o4c;->a(Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x0

    .line 28
    return-object p0

    .line 29
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p1, Ll/yec0;->B5:I

    .line 34
    .line 35
    invoke-static {p0, p1, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    sget p1, Ll/yec0;->z5:I

    .line 45
    .line 46
    invoke-static {p0, p1, v0}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;II)V
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    if-eq p3, p4, :cond_2

    .line 3
    .line 4
    const/4 p4, 0x2

    .line 5
    if-eq p3, p4, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x3

    .line 8
    if-eq p3, p0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleFurtherView;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleFurtherView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;

    .line 18
    .line 19
    iget-object p3, p0, Ll/lbf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 20
    .line 21
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleSignView;->c(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/lbf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 25
    .line 26
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->taskId:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->w4(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleFinishView;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleFinishView;->b(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public F(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lbf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lbf0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;->tasks:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    .line 10
    .line 11
    return-object p0
.end method

.method public H(Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lbf0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/lbf0;->G(I)Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Ll/lbf0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;->tasks:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    .line 10
    .line 11
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->finished:Z

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    const/4 v0, 0x2

    .line 18
    if-nez p1, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Ll/lbf0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 21
    .line 22
    iget-boolean v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;->todaySignInStatus:Z

    .line 23
    .line 24
    if-nez v2, :cond_1

    .line 25
    .line 26
    return v0

    .line 27
    :cond_1
    iget-object v2, p0, Ll/lbf0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;->tasks:Ljava/util/List;

    .line 30
    .line 31
    sub-int/2addr p1, v1

    .line 32
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    .line 37
    .line 38
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->finished:Z

    .line 39
    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    iget-object p0, p0, Ll/lbf0;->d:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 43
    .line 44
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;->todaySignInStatus:Z

    .line 45
    .line 46
    if-nez p0, :cond_2

    .line 47
    .line 48
    return v0

    .line 49
    :cond_2
    const/4 p0, 0x3

    .line 50
    return p0
.end method
