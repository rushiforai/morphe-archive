.class public Ll/kuk;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Landroidx/recyclerview/widget/RecyclerView$e0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Ll/ats;

.field public b:Ll/lsw;

.field public final c:Z


# direct methods
.method public constructor <init>(Ll/ats;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/kuk;->a:Ll/ats;

    .line 5
    .line 6
    iput-boolean p2, p0, Ll/kuk;->c:Z

    .line 7
    .line 8
    return-void
.end method

.method private z(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1
    .param p2    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method


# virtual methods
.method public A(Ll/lsw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kuk;->b:Ll/lsw;

    .line 2
    .line 3
    return-void
.end method

.method public getItemCount()I
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kuk;->c:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x3

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x2

    .line 8
    return p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    return p1
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 2
    .line 3
    instance-of p2, p1, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;

    .line 4
    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;

    .line 8
    .line 9
    iget-object p2, p0, Ll/kuk;->a:Ll/ats;

    .line 10
    .line 11
    iget-object p0, p0, Ll/kuk;->b:Ll/lsw;

    .line 12
    .line 13
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/maindialog/LiveGuardPrivilegeView;->k0(Ll/ats;Ll/lsw;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$e0;
    .locals 1
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/kuk$a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/kuk;->y(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p0, p1}, Ll/kuk$a;-><init>(Ll/kuk;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 5
    .line 6
    instance-of v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;

    .line 11
    .line 12
    iget-object p0, p0, Ll/kuk;->a:Ll/ats;

    .line 13
    .line 14
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/AnchorGuardView;->y0(Ll/ats;)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;

    .line 23
    .line 24
    iget-object v0, p0, Ll/kuk;->a:Ll/ats;

    .line 25
    .line 26
    iget-object p0, p0, Ll/kuk;->b:Ll/lsw;

    .line 27
    .line 28
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/knight/view/leaderboard/LiveGuardLeadBoardView;->k0(Ll/ats;Ll/lsw;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public y(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    sget p2, Ll/yec0;->a2:I

    .line 4
    .line 5
    invoke-direct {p0, p1, p2}, Ll/kuk;->z(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-boolean v0, p0, Ll/kuk;->c:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-ne p2, v0, :cond_1

    .line 16
    .line 17
    sget p2, Ll/yec0;->f:I

    .line 18
    .line 19
    invoke-direct {p0, p1, p2}, Ll/kuk;->z(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_1
    sget p2, Ll/yec0;->V1:I

    .line 25
    .line 26
    invoke-direct {p0, p1, p2}, Ll/kuk;->z(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method
