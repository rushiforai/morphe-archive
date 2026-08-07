.class public Ll/r4k;
.super Ll/nwl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/nwl;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Ll/mwl;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLive;->new_()Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;->getGoData()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 19
    .line 20
    const-string v1, "pullFlv"

    .line 21
    .line 22
    invoke-static {p2, v1}, Ll/mwl;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlv:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 29
    .line 30
    const-string v1, "pullFlvIpv6"

    .line 31
    .line 32
    invoke-static {p2, v1}, Ll/mwl;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->pullFlvIpv6:Ljava/lang/String;

    .line 37
    .line 38
    const-string v0, "callback"

    .line 39
    .line 40
    invoke-static {p2, v0}, Ll/mwl;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->callback:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 51
    .line 52
    const-string v1, "provider"

    .line 53
    .line 54
    invoke-static {p2, v1}, Ll/mwl;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-static {v1}, Ll/mwl;->o(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->provider:I

    .line 63
    .line 64
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 65
    .line 66
    const-string v1, "businessType"

    .line 67
    .line 68
    invoke-static {p2, v1}, Ll/mwl;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-static {v1}, Ll/mwl;->o(Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->businessType:I

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->room:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 83
    .line 84
    const-string v1, "roomId"

    .line 85
    .line 86
    invoke-static {p2, v1}, Ll/mwl;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 91
    .line 92
    const-string v0, "liveMode"

    .line 93
    .line 94
    invoke-static {p2, v0}, Ll/mwl;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ljava/lang/String;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 99
    .line 100
    const-string v0, "source"

    .line 101
    .line 102
    invoke-static {p2, v0}, Ll/mwl;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    const-string v1, "category"

    .line 107
    .line 108
    invoke-static {p2, v1}, Ll/mwl;->m(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;Ljava/lang/String;)Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p2

    .line 112
    sget-object v1, Ll/tbs;->f:Ll/j6t;

    .line 113
    .line 114
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {v1, p1, p0}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ll/mwl;->h(Lcom/p1/mobile/android/app/Act;)Z

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const-string p2, "liveSquare"

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, p2, v0}, Ll/mwl;->b(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string p0, "liveId"

    .line 18
    .line 19
    invoke-static {p3, p0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_1
    const-string p2, "source"

    .line 31
    .line 32
    invoke-static {p3, p2}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    const-string v0, "category"

    .line 37
    .line 38
    invoke-static {p3, v0}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "liveMode"

    .line 43
    .line 44
    invoke-static {p3, v1}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const-string v2, "liveSchema"

    .line 49
    .line 50
    invoke-static {p3, v2}, Ll/v5k0;->j(Ll/abe0;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p3

    .line 54
    invoke-static {p3}, Ll/q5k0;->O(Ljava/lang/String;)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {v2, p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->E(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->F(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 79
    .line 80
    .line 81
    sget-object p2, Ll/tbs;->f:Ll/j6t;

    .line 82
    .line 83
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p2, p1, p0}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public j(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x3

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    return p0

    .line 6
    :cond_0
    const/4 p0, 0x0

    .line 7
    return p0
.end method

.method public l(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "liveRoom"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/nwl;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
