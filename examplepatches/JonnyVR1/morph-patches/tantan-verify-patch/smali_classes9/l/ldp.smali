.class public Ll/ldp;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 5
    .line 6
    const-string v1, "live_side_default_open"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;-><init>(Ljava/lang/String;Z)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ldp;->a:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ldp;->a:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final b()Z
    .locals 0

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/vwt;->s7()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->n()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public c(Ljava/lang/String;)Z
    .locals 6

    .line 1
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/vwt;->o5()Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, p1}, Ll/vwt;->E4(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    const-string v3, "square-suggested"

    .line 25
    .line 26
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_3

    .line 31
    .line 32
    const-string v3, "square-nearby"

    .line 33
    .line 34
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-nez v3, :cond_3

    .line 39
    .line 40
    const-string v3, "start-push-match"

    .line 41
    .line 42
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-nez v3, :cond_3

    .line 47
    .line 48
    const-string v3, "start-push-superlike"

    .line 49
    .line 50
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-nez v3, :cond_3

    .line 55
    .line 56
    const-string v3, "start-push-like"

    .line 57
    .line 58
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    if-nez v3, :cond_3

    .line 63
    .line 64
    const-string v3, "start-push-none"

    .line 65
    .line 66
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-nez v3, :cond_3

    .line 71
    .line 72
    const-string v3, "start-push-follow"

    .line 73
    .line 74
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    if-nez v3, :cond_3

    .line 79
    .line 80
    const-string v3, "start-push-match-not-follow"

    .line 81
    .line 82
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    if-nez v3, :cond_3

    .line 87
    .line 88
    const-string v3, "live-push-in-app"

    .line 89
    .line 90
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_2

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_2
    invoke-virtual {p0}, Ll/ldp;->b()Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    return p0

    .line 102
    :cond_3
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->l()I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 111
    .line 112
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->conditions:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenConditions;

    .line 113
    .line 114
    iget v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenConditions;->continousUnwatchDays:I

    .line 115
    .line 116
    const/4 v4, 0x1

    .line 117
    if-lt p1, v3, :cond_4

    .line 118
    .line 119
    move p1, v4

    .line 120
    goto :goto_1

    .line 121
    :cond_4
    move p1, v1

    .line 122
    :goto_1
    iget-object v3, p0, Ll/ldp;->a:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 123
    .line 124
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->c()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    iget-object p0, p0, Ll/ldp;->a:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 129
    .line 130
    iget-object v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->defaultOpenParas:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    .line 131
    .line 132
    iget-object v5, v5, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 133
    .line 134
    iget v5, v5, Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;->n:I

    .line 135
    .line 136
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->b(I)I

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->defaultOpenParas:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    .line 141
    .line 142
    iget v5, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerDay:I

    .line 143
    .line 144
    if-ge v3, v5, :cond_5

    .line 145
    .line 146
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 147
    .line 148
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;->max:I

    .line 149
    .line 150
    if-ge p0, v0, :cond_5

    .line 151
    .line 152
    move p0, v4

    .line 153
    goto :goto_2

    .line 154
    :cond_5
    move p0, v1

    .line 155
    :goto_2
    iget-boolean v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->on:Z

    .line 156
    .line 157
    if-eqz v0, :cond_6

    .line 158
    .line 159
    iget-object v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 160
    .line 161
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->on:Z

    .line 162
    .line 163
    if-eqz v0, :cond_6

    .line 164
    .line 165
    if-eqz p1, :cond_6

    .line 166
    .line 167
    if-eqz p0, :cond_6

    .line 168
    .line 169
    return v4

    .line 170
    :cond_6
    return v1
.end method
