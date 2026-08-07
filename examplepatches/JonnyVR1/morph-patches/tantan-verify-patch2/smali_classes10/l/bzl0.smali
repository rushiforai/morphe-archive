.class public Ll/bzl0;
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


# static fields
.field public static f:I = 0x1

.field public static g:I = 0x2

.field public static h:I = 0x3


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

.field public e:Ll/osn0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
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
    iput-object v0, p0, Ll/bzl0;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/bzl0;->d:Ljava/util/List;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/bzl0;->E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bzl0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/bzl0;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/2addr v0, v1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    const/4 p0, 0x2

    .line 17
    return p0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/bzl0;->d:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    add-int/lit8 p0, p0, 0x1

    .line 25
    .line 26
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    sget p0, Ll/bzl0;->f:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-ne p2, p0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/yec0;->K6:I

    .line 15
    .line 16
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0

    .line 21
    :cond_0
    sget p0, Ll/bzl0;->h:I

    .line 22
    .line 23
    if-ne p2, p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    sget p2, Ll/yec0;->c9:I

    .line 34
    .line 35
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget p2, Ll/yec0;->L6:I

    .line 49
    .line 50
    invoke-virtual {p0, p2, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    return-object p0
.end method

.method public E(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;II)V
    .locals 0

    .line 1
    sget p4, Ll/bzl0;->f:I

    .line 2
    .line 3
    if-ne p3, p4, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansHeaderItemView;

    .line 6
    .line 7
    iget-object p2, p0, Ll/bzl0;->c:Ljava/util/List;

    .line 8
    .line 9
    iget-object p0, p0, Ll/bzl0;->e:Ll/osn0;

    .line 10
    .line 11
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansHeaderItemView;->n0(Ljava/util/List;Ll/osn0;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    sget p4, Ll/bzl0;->g:I

    .line 16
    .line 17
    if-ne p3, p4, :cond_1

    .line 18
    .line 19
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;

    .line 20
    .line 21
    iget-object p0, p0, Ll/bzl0;->e:Ll/osn0;

    .line 22
    .line 23
    invoke-virtual {p1, p2, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/VirtualFansNormalItemView;->j0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;Ll/osn0;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public F(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bzl0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/bzl0;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/2addr v0, v1

    .line 14
    if-lez v0, :cond_0

    .line 15
    .line 16
    if-lez p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/bzl0;->d:Ljava/util/List;

    .line 19
    .line 20
    add-int/lit8 p1, p1, -0x1

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public G(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bzl0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/bzl0;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-ge v0, v1, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    if-gt v0, v1, :cond_0

    .line 26
    .line 27
    iget-object v1, p0, Ll/bzl0;->c:Ljava/util/List;

    .line 28
    .line 29
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 34
    .line 35
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    iget-object v1, p0, Ll/bzl0;->d:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 46
    .line 47
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public H(Ll/osn0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bzl0;->e:Ll/osn0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bzl0;->F(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

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
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget p0, Ll/bzl0;->f:I

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    iget-object v0, p0, Ll/bzl0;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iget-object p0, p0, Ll/bzl0;->c:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    add-int/2addr v0, p0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    if-ne p1, p0, :cond_1

    .line 23
    .line 24
    sget p0, Ll/bzl0;->h:I

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    sget p0, Ll/bzl0;->g:I

    .line 28
    .line 29
    return p0
.end method
