.class public Ll/fwp0;
.super Ll/jic0;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Ll/rft$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/nsv<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
        ">;>;",
        "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;",
        "Ll/rft$b;"
    }
.end annotation


# instance fields
.field public final c:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ll/rft;

.field public final g:Ljava/lang/Runnable;

.field public final h:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Lcom/p1/mobile/android/app/Act;

.field public j:Ljava/lang/String;

.field public k:Ll/cm0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 4
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
    iput-object v0, p0, Ll/fwp0;->c:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/fwp0;->d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 17
    .line 18
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/LivingUsers;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/fwp0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 24
    .line 25
    new-instance v0, Ll/dwp0;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/dwp0;-><init>(Ll/fwp0;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/fwp0;->g:Ljava/lang/Runnable;

    .line 31
    .line 32
    const-string v0, "currentWeek"

    .line 33
    .line 34
    iput-object v0, p0, Ll/fwp0;->j:Ljava/lang/String;

    .line 35
    .line 36
    iput-object p1, p0, Ll/fwp0;->i:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    new-instance v0, Ll/rft;

    .line 39
    .line 40
    new-instance v1, Ll/ewp0;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/ewp0;-><init>(Ll/fwp0;)V

    .line 43
    .line 44
    .line 45
    const/high16 v2, 0x3f000000    # 0.5f

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    invoke-direct {v0, v3, p1, v1, v2}, Ll/rft;-><init>(ZLl/ner;Ll/pcj;F)V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Ll/fwp0;->f:Ll/rft;

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ll/rft;->s(Ll/rft$b;)V

    .line 54
    .line 55
    .line 56
    iput-object p2, p0, Ll/fwp0;->h:Ll/y20;

    .line 57
    .line 58
    return-void
.end method

.method public static synthetic E(Ll/fwp0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fwp0;->N()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F(Ll/fwp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fwp0;->M()V

    return-void
.end method

.method private synthetic M()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/fwp0;->J()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/fwp0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {p0, v1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/nsv;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fwp0;->G(Landroid/view/View;Ll/nsv;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fwp0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/AbstractCollection;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    const/4 p0, 0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    if-ne p2, p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget p2, Ll/yec0;->g2:I

    .line 14
    .line 15
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x3

    .line 21
    if-ne p2, p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    sget p2, Ll/yec0;->M3:I

    .line 32
    .line 33
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0

    .line 38
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget p2, Ll/yec0;->N3:I

    .line 47
    .line 48
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public G(Landroid/view/View;Ll/nsv;II)V
    .locals 7
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
    const/4 p4, 0x1

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardHeaderView;

    .line 5
    .line 6
    iget-object p2, p0, Ll/fwp0;->d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 7
    .line 8
    iget-object p3, p0, Ll/fwp0;->h:Ll/y20;

    .line 9
    .line 10
    iget-object p0, p0, Ll/fwp0;->j:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p1, p2, p3, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/mainland/HourBoardHeaderView;->q0(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/y20;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 v0, 0x2

    .line 17
    if-ne p3, v0, :cond_1

    .line 18
    .line 19
    move-object v1, p1

    .line 20
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;

    .line 21
    .line 22
    iget-object v2, p0, Ll/fwp0;->h:Ll/y20;

    .line 23
    .line 24
    iget-object v4, p0, Ll/fwp0;->k:Ll/cm0;

    .line 25
    .line 26
    iget-object v5, p0, Ll/fwp0;->j:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v6, 0x0

    .line 29
    move-object v3, p2

    .line 30
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberItem;->p(Ll/y20;Ll/nsv;Ll/cm0;Ljava/lang/String;Z)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    const/4 p0, 0x3

    .line 35
    if-ne p3, p0, :cond_2

    .line 36
    .line 37
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;

    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
    invoke-virtual {p1, p0, p4}, Lcom/p1/mobile/putong/live/livingroom/common/member/LiveMemberFooterDescView;->d(IZ)V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method

.method public H()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fwp0;->g:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/fwp0;->c:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/fwp0;->d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/fwp0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->clear()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public I(I)Ll/nsv;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/fwp0;->L(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object p0, p0, Ll/fwp0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    add-int/lit8 p1, p1, -0x1

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ll/nsv;

    .line 18
    .line 19
    return-object p0
.end method

.method public final J()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fwp0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    iget-object v1, p0, Ll/fwp0;->c:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x1

    .line 13
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isFooter:Z

    .line 14
    .line 15
    invoke-static {v0}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Ll/fwp0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/fwp0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 25
    .line 26
    iget-object p0, p0, Ll/fwp0;->d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final K()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fwp0;->c:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x3

    .line 8
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object v1, p0, Ll/fwp0;->d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 13
    .line 14
    iget-object p0, p0, Ll/fwp0;->c:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-virtual {p0, v2, v0}, Ljava/util/AbstractList;->subList(II)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v1, p0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final L(I)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

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

.method public final synthetic N()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fwp0;->d:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public O(Lcom/p1/mobile/putong/live/base/bean/LivingUsers;Ll/cm0;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/bean/LivingUsers<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;",
            "Ll/cm0;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/fwp0;->k:Ll/cm0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/fwp0;->j:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p2, p0, Ll/fwp0;->c:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/util/AbstractCollection;->clear()V

    .line 8
    .line 9
    .line 10
    iget-object p2, p0, Ll/fwp0;->c:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/fwp0;->K()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object p1, p0, Ll/fwp0;->g:Ljava/lang/Runnable;

    .line 29
    .line 30
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/fwp0;->i:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    iget-object p0, p0, Ll/fwp0;->g:Ljava/lang/Runnable;

    .line 36
    .line 37
    const-wide/16 p2, 0x3e8

    .line 38
    .line 39
    invoke-static {p1, p0, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwp0;->I(I)Ll/nsv;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/fwp0;->L(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object p0, p0, Ll/fwp0;->e:Lcom/p1/mobile/putong/live/base/bean/LivingUsers;

    .line 10
    .line 11
    sub-int/2addr p1, v1

    .line 12
    invoke-virtual {p0, p1}, Ljava/util/AbstractList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/nsv;

    .line 17
    .line 18
    iget-object p0, p0, Ll/nsv;->a:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 21
    .line 22
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isFooter:Z

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x3

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, 0x2

    .line 29
    return p0
.end method

.method public m(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/fwp0;->f:Ll/rft;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/rft;->k(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1
    .param p1    # Landroidx/recyclerview/widget/RecyclerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/fwp0;->f:Ll/rft;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/rft;->w()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p1, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onGlobalLayout()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fwp0;->f:Ll/rft;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rft;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
