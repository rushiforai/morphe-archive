.class public Ll/m7f0;
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
    iput-object v0, p0, Ll/m7f0;->a:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m7f0;->a:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ljava/lang/String;)Z
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
    move-result-object p1

    .line 21
    if-nez p1, :cond_1

    .line 22
    .line 23
    return v1

    .line 24
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->l()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 37
    .line 38
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->conditions:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenConditions;

    .line 39
    .line 40
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenConditions;->onlyOneWatchContinousDays:I

    .line 41
    .line 42
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->j(I)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 47
    .line 48
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->conditions:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenConditions;

    .line 49
    .line 50
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenConditions;->continousUnwatchDays:I

    .line 51
    .line 52
    const/4 v5, 0x1

    .line 53
    if-ge v2, v4, :cond_3

    .line 54
    .line 55
    if-gt v3, v5, :cond_2

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    move v2, v1

    .line 59
    goto :goto_1

    .line 60
    :cond_3
    :goto_0
    move v2, v5

    .line 61
    :goto_1
    iget-object v3, p0, Ll/m7f0;->a:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 62
    .line 63
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->c()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    iget-object p0, p0, Ll/m7f0;->a:Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;

    .line 68
    .line 69
    iget-object v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->defaultOpenParas:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    .line 70
    .line 71
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 72
    .line 73
    iget v4, v4, Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;->n:I

    .line 74
    .line 75
    invoke-virtual {p0, v4}, Lcom/p1/mobile/putong/live/livingroom/util/pref/NDayCountedValue;->b(I)I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveInRoomSideBarEntrance;->defaultOpenParas:Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    .line 80
    .line 81
    iget v4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerDay:I

    .line 82
    .line 83
    if-ge v3, v4, :cond_4

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 86
    .line 87
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;->max:I

    .line 88
    .line 89
    if-ge p0, v0, :cond_4

    .line 90
    .line 91
    move p0, v5

    .line 92
    goto :goto_2

    .line 93
    :cond_4
    move p0, v1

    .line 94
    :goto_2
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->on:Z

    .line 95
    .line 96
    if-eqz v0, :cond_5

    .line 97
    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 99
    .line 100
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->on:Z

    .line 101
    .line 102
    if-eqz p1, :cond_5

    .line 103
    .line 104
    if-eqz v2, :cond_5

    .line 105
    .line 106
    if-eqz p0, :cond_5

    .line 107
    .line 108
    return v5

    .line 109
    :cond_5
    return v1
.end method
