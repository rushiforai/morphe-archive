.class public Ll/zbr;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/nsv<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
        ">;>;"
    }
.end annotation


# instance fields
.field public final c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/android/app/Act;

.field public e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/cm0;

.field public g:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/zbr;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    iput-object p1, p0, Ll/zbr;->d:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-object p2, p0, Ll/zbr;->c:Ll/y20;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/nsv;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zbr;->E(Landroid/view/View;Ll/nsv;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zbr;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    sget p2, Ll/yec0;->M3:I

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    sget p2, Ll/yec0;->N3:I

    .line 8
    .line 9
    :goto_0
    iget-object p0, p0, Ll/zbr;->d:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public E(Landroid/view/View;Ll/nsv;II)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;II)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;

    .line 5
    .line 6
    iget-object p0, p0, Ll/zbr;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;->c(I)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

    .line 17
    .line 18
    iget-object p3, p0, Ll/zbr;->c:Ll/y20;

    .line 19
    .line 20
    iget-object v1, p0, Ll/zbr;->f:Ll/cm0;

    .line 21
    .line 22
    invoke-virtual {p1, p3, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->o(Ll/y20;Ll/nsv;Ll/cm0;)V

    .line 23
    .line 24
    .line 25
    if-ltz p4, :cond_1

    .line 26
    .line 27
    iget p0, p0, Ll/zbr;->g:I

    .line 28
    .line 29
    if-ne p0, p4, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->r(Z)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    const/4 p0, 0x0

    .line 36
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->r(Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final F()Ll/nsv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isFooterDesc:Z

    .line 7
    .line 8
    invoke-static {p0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public G(I)Ll/nsv;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zbr;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/nsv;

    .line 8
    .line 9
    return-object p0
.end method

.method public H(ILcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;",
            "Ll/cm0;",
            ")V"
        }
    .end annotation

    .line 1
    iput p1, p0, Ll/zbr;->g:I

    .line 2
    .line 3
    iput-object p3, p0, Ll/zbr;->f:Ll/cm0;

    .line 4
    .line 5
    iget-object p1, p0, Ll/zbr;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Ll/zbr;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/zbr;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 p2, 0x1

    .line 22
    if-lt p1, p2, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Ll/zbr;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/zbr;->F()Ll/nsv;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1, p2}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;",
            "Ll/cm0;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, v0, p1, p2}, Ll/zbr;->H(ILcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zbr;->G(I)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zbr;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/nsv;

    .line 8
    .line 9
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isFooterDesc:Z

    .line 14
    .line 15
    return p0
.end method
