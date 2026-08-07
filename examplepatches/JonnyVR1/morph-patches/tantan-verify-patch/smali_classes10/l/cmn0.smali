.class public Ll/cmn0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field

.field public final f:Ll/osn0;

.field public final g:Landroid/content/Context;

.field public final h:Ljava/lang/String;

.field public i:Z

.field public final j:Ljava/lang/String;

.field public final k:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/osn0;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

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
    iput-object v0, p0, Ll/cmn0;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/cmn0;->d:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/cmn0;->e:Ljava/util/List;

    .line 24
    .line 25
    new-instance v0, Ll/bmn0;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Ll/bmn0;-><init>(Ll/cmn0;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/cmn0;->k:Ljava/lang/Runnable;

    .line 31
    .line 32
    iput-object p1, p0, Ll/cmn0;->g:Landroid/content/Context;

    .line 33
    .line 34
    iput-object p2, p0, Ll/cmn0;->f:Ll/osn0;

    .line 35
    .line 36
    iput-object p3, p0, Ll/cmn0;->h:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p4, p0, Ll/cmn0;->j:Ljava/lang/String;

    .line 39
    .line 40
    const-string p1, "room"

    .line 41
    .line 42
    invoke-static {p3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iput-boolean p1, p0, Ll/cmn0;->i:Z

    .line 47
    .line 48
    return-void
.end method

.method public static synthetic E(Ll/cmn0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cmn0;->M()V

    return-void
.end method

.method private J()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cmn0;->e:Ljava/util/List;

    .line 2
    .line 3
    iget-object v1, p0, Ll/cmn0;->c:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cmn0;->e:Ljava/util/List;

    .line 9
    .line 10
    iget-object p0, p0, Ll/cmn0;->d:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private K()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cmn0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

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
    iget-object v1, p0, Ll/cmn0;->d:Ljava/util/List;

    .line 13
    .line 14
    iget-object p0, p0, Ll/cmn0;->c:Ljava/util/List;

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-interface {p0, v2, v0}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {v1, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private L(I)Z
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

.method private synthetic M()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/cmn0;->J()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cmn0;->e:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/List;->size()I

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
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/cmn0;->F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cmn0;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

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
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    sget p2, Ll/yec0;->r9:I

    .line 5
    .line 6
    invoke-virtual {p0, p2, p1}, Ll/cmn0;->I(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 v0, 0x3

    .line 12
    if-ne p2, v0, :cond_1

    .line 13
    .line 14
    sget p2, Ll/yec0;->j2:I

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1}, Ll/cmn0;->I(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_1
    sget p2, Ll/yec0;->d9:I

    .line 22
    .line 23
    invoke-virtual {p0, p2, p1}, Ll/cmn0;->I(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;II)V
    .locals 6

    .line 1
    const/4 p4, 0x1

    .line 2
    if-ne p3, p4, :cond_0

    .line 3
    .line 4
    move-object v0, p1

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardHeaderView;

    .line 6
    .line 7
    iget-object v1, p0, Ll/cmn0;->d:Ljava/util/List;

    .line 8
    .line 9
    iget-object v2, p0, Ll/cmn0;->f:Ll/osn0;

    .line 10
    .line 11
    iget-object v3, p0, Ll/cmn0;->h:Ljava/lang/String;

    .line 12
    .line 13
    iget-boolean v4, p0, Ll/cmn0;->i:Z

    .line 14
    .line 15
    const/4 v5, 0x1

    .line 16
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardHeaderView;->s0(Ljava/util/List;Ll/osn0;Ljava/lang/String;ZZ)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    const/4 p4, 0x2

    .line 21
    if-ne p3, p4, :cond_1

    .line 22
    .line 23
    move-object v0, p1

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardItemView;

    .line 25
    .line 26
    iget-object v2, p0, Ll/cmn0;->f:Ll/osn0;

    .line 27
    .line 28
    iget-object v3, p0, Ll/cmn0;->h:Ljava/lang/String;

    .line 29
    .line 30
    iget-boolean v4, p0, Ll/cmn0;->i:Z

    .line 31
    .line 32
    const/4 v5, 0x1

    .line 33
    move-object v1, p2

    .line 34
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/virtual/room/hourleaderboard/mainland/VoiceHourBoardItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;Ljava/lang/String;ZZ)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public G()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cmn0;->k:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cmn0;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/cmn0;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/cmn0;->e:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/cmn0;->L(I)Z

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
    iget-object p0, p0, Ll/cmn0;->e:Ljava/util/List;

    .line 10
    .line 11
    add-int/lit8 p1, p1, -0x1

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 18
    .line 19
    return-object p0
.end method

.method public final I(ILandroid/view/ViewGroup;)Landroid/view/View;
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

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
    invoke-virtual {p0, p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public N(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cmn0;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cmn0;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/cmn0;->e:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/cmn0;->c:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ll/cmn0;->K()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 25
    .line 26
    .line 27
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p1, p0, Ll/cmn0;->k:Ljava/lang/Runnable;

    .line 35
    .line 36
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/cmn0;->g:Landroid/content/Context;

    .line 40
    .line 41
    iget-object p0, p0, Ll/cmn0;->k:Ljava/lang/Runnable;

    .line 42
    .line 43
    const-wide/16 v0, 0x3e8

    .line 44
    .line 45
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/cmn0;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

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
    invoke-direct {p0, p1}, Ll/cmn0;->L(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x2

    .line 10
    return p0
.end method
