.class public Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;
.super Ll/h80;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/h80<",
        "Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic i:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;->i:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/h80;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic s(Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->i:Ll/byd0;

    .line 2
    .line 3
    invoke-static {}, Ll/pzi0;->o()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public f(Landroid/view/ViewGroup;Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;->i:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/newui/messages/DiscoveryPager;

    .line 4
    .line 5
    invoke-virtual {p2, v0, p1}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->a0(Ljava/lang/Class;Landroid/view/View;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/core/newui/messages/DiscoveryPager;

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p2, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a$a;

    .line 15
    .line 16
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a$a;-><init>(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public bridge synthetic j(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;->t(Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic m(Ljava/lang/Object;IJLandroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;->u(Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;IJLandroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;I)V
    .locals 12

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->e:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;->momentState:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 4
    .line 5
    const-string v1, "owner_id"

    .line 6
    .line 7
    const-string v2, "state_id"

    .line 8
    .line 9
    const-string v3, "e_state_type"

    .line 10
    .line 11
    const-string v4, "e_state"

    .line 12
    .line 13
    const-string v5, "p_state_explore"

    .line 14
    .line 15
    if-ne p2, v0, :cond_0

    .line 16
    .line 17
    const-string p2, "state"

    .line 18
    .line 19
    invoke-static {v3, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    iget-object v0, p1, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/BubbleInfo;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iget-object v6, p1, Ll/uf3;->a:Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 32
    .line 33
    iget-object v6, v6, Lcom/p1/mobile/putong/data/BubbleInfo;->owner:Lcom/p1/mobile/putong/data/Owner;

    .line 34
    .line 35
    iget-object v6, v6, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1, v6}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    filled-new-array {p2, v0, v6}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-static {v4, v5, p2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->e:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 49
    .line 50
    sget-object v0, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;->momentChatRoom:Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper$Type;

    .line 51
    .line 52
    if-ne p2, v0, :cond_1

    .line 53
    .line 54
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 55
    .line 56
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 57
    .line 58
    const-string v0, "anchorId"

    .line 59
    .line 60
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 65
    .line 66
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 67
    .line 68
    const-string v0, "liveId"

    .line 69
    .line 70
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    const-string p2, "audio_card_type"

    .line 75
    .line 76
    const-string v0, "state_explore_bubble"

    .line 77
    .line 78
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    iget-object p2, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 83
    .line 84
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Emotion;->topicId:Ljava/lang/String;

    .line 85
    .line 86
    const-string v0, "topic_id"

    .line 87
    .line 88
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 89
    .line 90
    .line 91
    move-result-object v9

    .line 92
    const-string p2, "audio_room_label"

    .line 93
    .line 94
    const-string v0, ""

    .line 95
    .line 96
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object v10

    .line 100
    const-string p2, "voice_template"

    .line 101
    .line 102
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v11

    .line 106
    filled-new-array/range {v6 .. v11}, [Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p2

    .line 110
    const-string v6, "e_live_audio_room_enter"

    .line 111
    .line 112
    invoke-static {v6, v5, p2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 113
    .line 114
    .line 115
    const-string p2, "audio_room"

    .line 116
    .line 117
    invoke-static {v3, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;->i:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 122
    .line 123
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->Y(Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const-string v3, "refer_source"

    .line 128
    .line 129
    invoke-static {v3, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;->i:Lcom/p1/mobile/putong/data/Emotion;

    .line 138
    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v1, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    filled-new-array {p2, p0, v0, p1}, [Ll/pf60;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    invoke-static {v4, v5, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 150
    .line 151
    .line 152
    :cond_1
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/core/ui/onlinematch/SquareDataWrapper;IJLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->cd()Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Gc()Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-nez p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$p;->f()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;->i:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-interface {p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->fc()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;->Z(I)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_0

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView$a;->i:Lcom/p1/mobile/putong/core/ui/statussquare/CoreStateSquareRecycleView;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    new-instance p2, Ll/dza;

    .line 68
    .line 69
    invoke-direct {p2}, Ll/dza;-><init>()V

    .line 70
    .line 71
    .line 72
    invoke-interface {p1, p0, p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->hk(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    return-void
.end method
