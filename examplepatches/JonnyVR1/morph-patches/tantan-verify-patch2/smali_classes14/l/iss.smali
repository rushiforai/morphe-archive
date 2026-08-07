.class public Ll/iss;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
        ">;"
    }
.end annotation


# instance fields
.field public final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
            ">;"
        }
    .end annotation
.end field

.field public d:Landroid/view/View;

.field public final e:Ll/h80;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/h80<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
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
    iput-object v0, p0, Ll/iss;->c:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ll/iss$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/iss$a;-><init>(Ll/iss;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/iss;->e:Ll/h80;

    .line 17
    .line 18
    iput-object p1, p0, Ll/iss;->f:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    iput-object p2, p0, Ll/iss;->d:Landroid/view/View;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic E(Ll/iss;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/iss;->I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/iss;->F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iss;->c:Ljava/util/List;

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
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x2

    .line 10
    if-ne p2, v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Ll/iss;->d:Landroid/view/View;

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_0
    sget p0, Ll/xec0;->q:I

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-virtual {v0, p0, p1, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;II)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p3, v0, :cond_0

    .line 3
    .line 4
    iget-object p3, p0, Ll/iss;->e:Ll/h80;

    .line 5
    .line 6
    sub-int/2addr p4, v0

    .line 7
    invoke-virtual {p3, p1, p2, p4}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 8
    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/popularroom/group/LiveGroupChatItemView;->o0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 13
    .line 14
    .line 15
    new-instance p3, Ll/hss;

    .line 16
    .line 17
    invoke-direct {p3, p0, p2}, Ll/hss;-><init>(Ll/iss;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1, p3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final G(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Landroid/view/View;",
            ")TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p2

    .line 8
    :cond_0
    instance-of v0, p2, Landroid/view/ViewGroup;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_4

    .line 12
    .line 13
    check-cast p2, Landroid/view/ViewGroup;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x0

    .line 20
    :goto_0
    if-ge v2, v0, :cond_4

    .line 21
    .line 22
    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p1, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-eqz v4, :cond_1

    .line 31
    .line 32
    move-object v1, v3

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    instance-of v4, v3, Landroid/view/ViewGroup;

    .line 35
    .line 36
    if-eqz v4, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0, p1, v3}, Ll/iss;->G(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    :cond_2
    :goto_1
    if-eqz v1, :cond_3

    .line 43
    .line 44
    return-object v1

    .line 45
    :cond_3
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_4
    return-object v1
.end method

.method public H(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    iget-object v1, p0, Ll/iss;->c:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_1

    .line 12
    .line 13
    return-object v0

    .line 14
    :cond_1
    iget-object p0, p0, Ll/iss;->c:Ljava/util/List;

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
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 23
    .line 24
    return-object p0
.end method

.method public final synthetic I(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->isCreateRoomType()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/iss;->J(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/iss;->f:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 14
    .line 15
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->sourceName:Ljava/lang/String;

    .line 16
    .line 17
    const-string v0, "simplechat"

    .line 18
    .line 19
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    const-string v0, "swipe-page"

    .line 24
    .line 25
    invoke-static {p0, p1, v0, p2}, Ll/iqn0;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Ljava/lang/String;Z)V

    .line 26
    .line 27
    .line 28
    :goto_0
    const-string p0, "circle_detail_tab"

    .line 29
    .line 30
    const-string p2, "group"

    .line 31
    .line 32
    invoke-static {p0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p2, "groupchat_id"

    .line 37
    .line 38
    const-string v0, ""

    .line 39
    .line 40
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    const-string v1, "group_name"

    .line 45
    .line 46
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "audio_id"

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    filled-new-array {p0, p2, v0, p1}, [Ll/pf60;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "e_start_audio_room_entrance"

    .line 63
    .line 64
    const-string p2, "p_circle_detail"

    .line 65
    .line 66
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "feedCreateLive"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->sourceName:Ljava/lang/String;

    .line 14
    .line 15
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->index:I

    .line 16
    .line 17
    invoke-static {v1, v2}, Ll/evo0;->a(Ljava/lang/String;I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->t(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Ll/iss;->f:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    invoke-static {v1, v0}, Ll/iqn0;->e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 38
    .line 39
    .line 40
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->index:I

    .line 41
    .line 42
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->sourceName:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/evo0;->b(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->sourceName:Ljava/lang/String;

    .line 52
    .line 53
    const-string v0, "recommend"

    .line 54
    .line 55
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_0

    .line 60
    .line 61
    const-string p1, "createVoiceRoomCard.click"

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ll/iss;->L(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public K(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/iss;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/iss;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public L(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "reportCreateVoiceCard:"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "[live][square]"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Lcom/p1/mobile/putong/live/external/internal/api/LiveVoiceApi;->reportCreateVoiceInfo(Ljava/lang/String;)Lrx/c;

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/iss;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

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
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
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
    iget-object v0, p0, Ll/iss;->e:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$e0;->getLayoutPosition()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p0, v0}, Ll/iss;->getItemViewType(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x2

    .line 18
    if-ne p0, v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    instance-of p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    check-cast p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->i(Z)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/iss;->e:Ll/h80;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 7
    .line 8
    .line 9
    return-void
.end method
