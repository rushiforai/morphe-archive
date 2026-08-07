.class public Ll/ojd0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/android/app/Act;

.field public final b:Ll/ogd0;

.field public final c:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

.field public d:Ll/pol;

.field public final e:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

.field public f:Ll/oo2;

.field public g:Ll/x5;

.field public final h:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/x5;",
            ">;>;"
        }
    .end annotation
.end field

.field public final i:Ll/ajt;

.field public final j:Ll/bjt;


# direct methods
.method public constructor <init>(Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;Ll/ajt;Ll/bjt;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ojd0;->h:Ljava/util/HashMap;

    .line 10
    .line 11
    iput-object p1, p0, Ll/ojd0;->b:Ll/ogd0;

    .line 12
    .line 13
    iput-object p2, p0, Ll/ojd0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 14
    .line 15
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/ojd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    iput-object p3, p0, Ll/ojd0;->c:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 22
    .line 23
    iput-object p4, p0, Ll/ojd0;->i:Ll/ajt;

    .line 24
    .line 25
    iput-object p5, p0, Ll/ojd0;->j:Ll/bjt;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Ll/ojd0;Ll/x5;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojd0;->l(Ll/x5;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Ll/ojd0;Ll/x5;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojd0;->k(Ll/x5;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public c(Ll/x5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ojd0;->g:Ll/x5;

    .line 2
    .line 3
    return-void
.end method

.method public final d()Ll/ljd0;
    .locals 7

    .line 1
    new-instance v0, Ll/ow40;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ojd0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ojd0;->d:Ll/pol;

    .line 6
    .line 7
    iget-object v3, p0, Ll/ojd0;->f:Ll/oo2;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    new-instance v3, Ll/ou40;

    .line 12
    .line 13
    new-instance v4, Ll/ew40;

    .line 14
    .line 15
    invoke-direct {v4}, Ll/ew40;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v5, p0, Ll/ojd0;->i:Ll/ajt;

    .line 19
    .line 20
    iget-object v6, p0, Ll/ojd0;->j:Ll/bjt;

    .line 21
    .line 22
    invoke-direct {v3, v4, v5, v6}, Ll/ou40;-><init>(Ll/ew40;Ll/ajt;Ll/bjt;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    check-cast v3, Ll/ou40;

    .line 27
    .line 28
    :goto_0
    new-instance v4, Lcom/tantan/live/eventbus/LiveEventBus;

    .line 29
    .line 30
    invoke-direct {v4}, Lcom/tantan/live/eventbus/LiveEventBus;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-direct {v0, v1, v2, v3, v4}, Ll/ow40;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/pol;Ll/ou40;Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, v0, Ll/dum;->h:Ll/oo2;

    .line 37
    .line 38
    check-cast v1, Ll/ou40;

    .line 39
    .line 40
    iget-object v2, p0, Ll/ojd0;->c:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ll/ou40;->Q2(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V

    .line 43
    .line 44
    .line 45
    sget-object v1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 46
    .line 47
    const-string v2, "live_room_view_inflate"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v3, p0, Ll/ojd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    sget v4, Ll/yec0;->l5:I

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;

    .line 62
    .line 63
    const-string v4, "inflate"

    .line 64
    .line 65
    invoke-virtual {v1, v2, v4}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 69
    .line 70
    invoke-virtual {v1}, Ll/wrv;->R()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-eqz v1, :cond_1

    .line 75
    .line 76
    new-instance v1, Ll/upi0;

    .line 77
    .line 78
    iget-object v2, p0, Ll/ojd0;->b:Ll/ogd0;

    .line 79
    .line 80
    invoke-direct {v1, v0, v2, v3}, Ll/upi0;-><init>(Ll/ow40;Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V

    .line 81
    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_1
    new-instance v1, Ll/ljd0;

    .line 85
    .line 86
    iget-object v2, p0, Ll/ojd0;->b:Ll/ogd0;

    .line 87
    .line 88
    invoke-direct {v1, v0, v2, v3}, Ll/ljd0;-><init>(Ll/ow40;Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/base/room/RoomView;)V

    .line 89
    .line 90
    .line 91
    :goto_1
    invoke-virtual {v1}, Ll/ljd0;->init()V

    .line 92
    .line 93
    .line 94
    iput-object v5, p0, Ll/ojd0;->f:Ll/oo2;

    .line 95
    .line 96
    return-object v1
.end method

.method public final e()Ll/ef50;
    .locals 7

    .line 1
    new-instance v0, Ll/ad50;

    .line 2
    .line 3
    iget-object v1, p0, Ll/ojd0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ojd0;->d:Ll/pol;

    .line 6
    .line 7
    iget-object v3, p0, Ll/ojd0;->f:Ll/oo2;

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    new-instance v3, Ll/mc50;

    .line 12
    .line 13
    new-instance v4, Ll/ew40;

    .line 14
    .line 15
    invoke-direct {v4}, Ll/ew40;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v5, p0, Ll/ojd0;->i:Ll/ajt;

    .line 19
    .line 20
    iget-object v6, p0, Ll/ojd0;->j:Ll/bjt;

    .line 21
    .line 22
    invoke-direct {v3, v4, v5, v6}, Ll/mc50;-><init>(Ll/ew40;Ll/ajt;Ll/bjt;)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    check-cast v3, Ll/mc50;

    .line 27
    .line 28
    :goto_0
    new-instance v4, Lcom/tantan/live/eventbus/LiveEventBus;

    .line 29
    .line 30
    invoke-direct {v4}, Lcom/tantan/live/eventbus/LiveEventBus;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-direct {v0, v1, v2, v3, v4}, Ll/ad50;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/pol;Ll/mc50;Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 34
    .line 35
    .line 36
    iget-object v1, v0, Ll/dum;->h:Ll/oo2;

    .line 37
    .line 38
    check-cast v1, Ll/mc50;

    .line 39
    .line 40
    iget-object v2, p0, Ll/ojd0;->c:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ll/ou40;->Q2(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V

    .line 43
    .line 44
    .line 45
    sget-object v1, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 46
    .line 47
    const-string v2, "live_room_view_inflate"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object v3, p0, Ll/ojd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 53
    .line 54
    sget v4, Ll/yec0;->F4:I

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    invoke-static {v3, v4, v5}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;

    .line 62
    .line 63
    const-string v4, "inflate"

    .line 64
    .line 65
    invoke-virtual {v1, v2, v4}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Ll/ef50;

    .line 69
    .line 70
    iget-object v2, p0, Ll/ojd0;->b:Ll/ogd0;

    .line 71
    .line 72
    invoke-direct {v1, v0, v2, v3}, Ll/ef50;-><init>(Ll/ad50;Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/officialshow/OfficialShowView;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ll/ef50;->init()V

    .line 76
    .line 77
    .line 78
    iput-object v5, p0, Ll/ojd0;->f:Ll/oo2;

    .line 79
    .line 80
    return-object v1
.end method

.method public final f()Ll/x5;
    .locals 7

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->T5()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    new-instance v1, Ll/noo0;

    .line 10
    .line 11
    iget-object v2, p0, Ll/ojd0;->e:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 12
    .line 13
    iget-object v3, p0, Ll/ojd0;->d:Ll/pol;

    .line 14
    .line 15
    iget-object v4, p0, Ll/ojd0;->f:Ll/oo2;

    .line 16
    .line 17
    if-eqz v4, :cond_1

    .line 18
    .line 19
    instance-of v5, v4, Ll/jqm0;

    .line 20
    .line 21
    if-nez v5, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    check-cast v4, Ll/jqm0;

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :cond_1
    :goto_0
    new-instance v4, Ll/jqm0;

    .line 28
    .line 29
    new-instance v5, Ll/szn0;

    .line 30
    .line 31
    invoke-direct {v5}, Ll/szn0;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v6, p0, Ll/ojd0;->i:Ll/ajt;

    .line 35
    .line 36
    invoke-direct {v4, v5, v6}, Ll/jqm0;-><init>(Ll/szn0;Ll/ajt;)V

    .line 37
    .line 38
    .line 39
    :goto_1
    new-instance v5, Lcom/tantan/live/eventbus/LiveEventBus;

    .line 40
    .line 41
    invoke-direct {v5}, Lcom/tantan/live/eventbus/LiveEventBus;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-direct {v1, v2, v3, v4, v5}, Ll/noo0;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;Ll/pol;Ll/jqm0;Lcom/tantan/live/eventbus/LiveEventBus;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, v1, Ll/dum;->h:Ll/oo2;

    .line 48
    .line 49
    check-cast v2, Ll/jqm0;

    .line 50
    .line 51
    iget-object v3, p0, Ll/ojd0;->c:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ll/jqm0;->g4(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)V

    .line 54
    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    if-nez v0, :cond_2

    .line 58
    .line 59
    sget-object v0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 60
    .line 61
    const-string v3, "voice_room_view_inflate"

    .line 62
    .line 63
    invoke-virtual {v0, v3}, Ll/lej0;->d(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v4, p0, Ll/ojd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    sget v5, Ll/yec0;->L7:I

    .line 69
    .line 70
    invoke-static {v4, v5, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;

    .line 75
    .line 76
    const-string v4, "voice inflate"

    .line 77
    .line 78
    invoke-virtual {v0, v3, v4}, Ll/lej0;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    new-instance v0, Ll/tqo0;

    .line 82
    .line 83
    iget-object p0, p0, Ll/ojd0;->b:Ll/ogd0;

    .line 84
    .line 85
    invoke-direct {v0, v1, p0, v2}, Ll/tqo0;-><init>(Ll/noo0;Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/voice/intl/root/VoiceRoomView;)V

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_2
    iget-object v0, v1, Ll/dum;->h:Ll/oo2;

    .line 90
    .line 91
    check-cast v0, Ll/jqm0;

    .line 92
    .line 93
    iget-object v3, p0, Ll/ojd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    iget-object v4, p0, Ll/ojd0;->c:Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 96
    .line 97
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 98
    .line 99
    invoke-virtual {v0, v3, v4}, Ll/jqm0;->e4(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Ll/ojd0;->a:Lcom/p1/mobile/android/app/Act;

    .line 103
    .line 104
    sget v3, Ll/yec0;->hb:I

    .line 105
    .line 106
    invoke-static {v0, v3, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 111
    .line 112
    new-instance v2, Ll/ojp0;

    .line 113
    .line 114
    iget-object p0, p0, Ll/ojd0;->b:Ll/ogd0;

    .line 115
    .line 116
    invoke-direct {v2, v1, p0, v0}, Ll/ojp0;-><init>(Ll/noo0;Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;)V

    .line 117
    .line 118
    .line 119
    move-object v0, v2

    .line 120
    :goto_2
    invoke-virtual {v0}, Ll/x5;->init()V

    .line 121
    .line 122
    .line 123
    return-object v0
.end method

.method public g()Ll/x5;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojd0;->g:Ll/x5;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/x5;
    .locals 4

    .line 1
    invoke-static {p1}, Ll/u9t;->d(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "officialShow"

    .line 6
    .line 7
    const-string v2, "voice-live"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    move-object v3, v1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :goto_0
    move-object v3, v2

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    instance-of v0, p1, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 20
    .line 21
    const-string v3, "live"

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_3

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_3
    :goto_1
    iget-object p1, p0, Ll/ojd0;->h:Ljava/util/HashMap;

    .line 34
    .line 35
    invoke-virtual {p1, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Ljava/util/List;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Ll/ojd0;->h:Ljava/util/HashMap;

    .line 49
    .line 50
    invoke-virtual {v0, v3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    :cond_4
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_6

    .line 58
    .line 59
    new-instance v0, Ll/mjd0;

    .line 60
    .line 61
    invoke-direct {v0, p0}, Ll/mjd0;-><init>(Ll/ojd0;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_5

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_5
    new-instance v0, Ll/njd0;

    .line 76
    .line 77
    invoke-direct {v0, p0}, Ll/njd0;-><init>(Ll/ojd0;)V

    .line 78
    .line 79
    .line 80
    invoke-static {p1, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    const/4 p1, 0x0

    .line 85
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    check-cast p0, Ll/x5;

    .line 90
    .line 91
    return-object p0

    .line 92
    :cond_6
    :goto_2
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-nez v0, :cond_8

    .line 97
    .line 98
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_7

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/ojd0;->d()Ll/ljd0;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    goto :goto_3

    .line 109
    :cond_7
    invoke-virtual {p0}, Ll/ojd0;->e()Ll/ef50;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    goto :goto_3

    .line 114
    :cond_8
    invoke-virtual {p0}, Ll/ojd0;->f()Ll/x5;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :goto_3
    iget-object p0, p0, Ll/ojd0;->i:Ll/ajt;

    .line 119
    .line 120
    invoke-virtual {p0, v3}, Ll/ajt;->o(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    return-object v0
.end method

.method public i(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)Ll/x5;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojd0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->a(Ll/x5;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;)Ll/x5;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojd0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/x5;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/frag/LiveScrollViewContainer;->a(Ll/x5;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/ojd0;->c(Ll/x5;)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method

.method public final synthetic k(Ll/x5;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojd0;->g:Ll/x5;

    .line 2
    .line 3
    if-eq p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final synthetic l(Ll/x5;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojd0;->g:Ll/x5;

    .line 2
    .line 3
    if-eq p1, p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public m(Ll/oo2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ojd0;->f:Ll/oo2;

    .line 2
    .line 3
    return-void
.end method

.method public n(Ll/pol;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ojd0;->d:Ll/pol;

    .line 2
    .line 3
    return-void
.end method
