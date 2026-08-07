.class public Ll/thl;
.super Ll/jic0;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Ll/rft$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
        ">;",
        "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;",
        "Ll/rft$b;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ll/uhl;

.field public final f:Ll/rft;

.field public g:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;


# direct methods
.method public constructor <init>(Ll/uhl;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/thl;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/thl;->d:Ljava/util/List;

    .line 17
    .line 18
    iput-object p1, p0, Ll/thl;->e:Ll/uhl;

    .line 19
    .line 20
    new-instance v0, Ll/rft;

    .line 21
    .line 22
    invoke-interface {p1}, Ll/uhl;->C()Lcom/p1/mobile/android/app/Frag;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v1, Ll/shl;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/shl;-><init>(Ll/thl;)V

    .line 29
    .line 30
    .line 31
    const/high16 v2, 0x3f000000    # 0.5f

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    invoke-direct {v0, v3, p1, v1, v2}, Ll/rft;-><init>(ZLl/ner;Ll/pcj;F)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/thl;->f:Ll/rft;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Ll/rft;->s(Ll/rft$b;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic E(Ll/thl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/thl;->K()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic F(Ll/thl;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/thl;->L(Ljava/lang/Integer;)V

    return-void
.end method

.method private J(I)Z
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


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/thl;->G(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/thl;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x2

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
    sget p2, Ll/yec0;->f2:I

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
    sget p2, Ll/yec0;->e2:I

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
    sget p2, Ll/yec0;->k2:I

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

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;II)V
    .locals 0

    .line 1
    const/4 p4, 0x1

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourHeadersView;

    .line 5
    .line 6
    iget-object p2, p0, Ll/thl;->c:Ljava/util/List;

    .line 7
    .line 8
    iget-object p3, p0, Ll/thl;->e:Ll/uhl;

    .line 9
    .line 10
    iget-object p0, p0, Ll/thl;->g:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 11
    .line 12
    invoke-virtual {p1, p2, p3, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourHeadersView;->i0(Ljava/util/List;Ll/uhl;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 p4, 0x3

    .line 17
    if-eq p3, p4, :cond_1

    .line 18
    .line 19
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;

    .line 20
    .line 21
    iget-object p3, p0, Ll/thl;->e:Ll/uhl;

    .line 22
    .line 23
    iget-object p0, p0, Ll/thl;->g:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 24
    .line 25
    invoke-virtual {p1, p2, p3, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/leaderboard/hourleaderboard/intl/HourBoardListItem;->u0(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Ll/uhl;Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/thl;->J(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/thl;->I(I)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/thl;->d:Ljava/util/List;

    .line 15
    .line 16
    add-int/lit8 p1, p1, -0x1

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public final I(I)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/thl;->C()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    sub-int/2addr p0, v0

    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    return v0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public final synthetic K()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/thl;->c:Ljava/util/List;

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

.method public final synthetic L(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0, v0}, Ll/thl;->J(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Ll/thl;->c:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/thl;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-virtual {p0, v0}, Ll/thl;->I(I)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    invoke-virtual {p0, p1}, Ll/thl;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Ll/thl;->Q(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public M()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/thl;->f:Ll/rft;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rft;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public N(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/thl;->f:Ll/rft;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/rft;->u()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public O(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/thl;->g:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 2
    .line 3
    return-void
.end method

.method public P(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x3

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-interface {p1, v1, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/thl;->c:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Ll/thl;->d:Ljava/util/List;

    .line 26
    .line 27
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final Q(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/kfd0$a;->r(Ljava/lang/String;)Ll/kfd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/kfd0$a;->g(Ljava/lang/String;)Ll/kfd0$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveState:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ll/kfd0$a;->u(Ljava/lang/String;)Ll/kfd0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "e_hoursboard"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 34
    .line 35
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/kfd0$a;->m(Ljava/lang/String;)Ll/kfd0$a;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-static {p1}, Ll/icr;->e(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {v0, p1}, Ll/kfd0$a;->t(Ljava/lang/String;)Ll/kfd0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iget-object p0, p0, Ll/thl;->e:Ll/uhl;

    .line 56
    .line 57
    invoke-interface {p0}, Ll/uhl;->D()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p1, p0}, Ll/afu;->j(Ll/kfd0;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/thl;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/thl;->J(I)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0, p1}, Ll/thl;->I(I)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    return p0

    .line 17
    :cond_1
    const/4 p0, 0x2

    .line 18
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
    new-instance p2, Ll/rhl;

    .line 2
    .line 3
    invoke-direct {p2, p0}, Ll/rhl;-><init>(Ll/thl;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 7
    .line 8
    .line 9
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
    iget-object v0, p0, Ll/thl;->f:Ll/rft;

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
    iget-object v0, p0, Ll/thl;->f:Ll/rft;

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
    iget-object p0, p0, Ll/thl;->f:Ll/rft;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/rft;->v()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
