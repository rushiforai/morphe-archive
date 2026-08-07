.class public Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$a;,
        Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;,
        Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;
    }
.end annotation


# instance fields
.field public a:Ll/byd0;

.field public b:Ll/pxd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pxd0<",
            "Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;",
            ">;"
        }
    .end annotation
.end field

.field public c:Ll/pxd0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pxd0<",
            "Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ll/vxd0;

.field public e:Ll/wyd0;

.field public f:Ll/byd0;

.field public g:J

.field public h:Ljava/lang/String;

.field public i:Ll/jxd0;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pzi0;->n()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->g:J

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public synthetic constructor <init>(Ll/wdv;)V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;-><init>()V

    return-void
.end method

.method public static synthetic a(Ljava/lang/Long;)Ljava/lang/Long;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    add-long/2addr v0, p0

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    add-long/2addr v0, p0

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/Long;Ljava/lang/Long;)Ljava/lang/Long;
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    add-long/2addr v0, p0

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;
    .locals 17

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string v1, "LiveWatchCounter_unknownUserID"

    .line 16
    .line 17
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$a;->a()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    iget-object v3, v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_1

    .line 28
    .line 29
    new-instance v4, Ll/pxd0;

    .line 30
    .line 31
    const-string v3, "live_watch_counter_"

    .line 32
    .line 33
    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    new-instance v7, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;

    .line 38
    .line 39
    new-instance v3, Ljava/util/TreeMap;

    .line 40
    .line 41
    invoke-direct {v3}, Ljava/util/TreeMap;-><init>()V

    .line 42
    .line 43
    .line 44
    const/4 v10, 0x0

    .line 45
    invoke-direct {v7, v3, v10}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;-><init>(Ljava/util/TreeMap;Ll/wdv;)V

    .line 46
    .line 47
    .line 48
    const/4 v8, 0x1

    .line 49
    const-string v9, "preferences"

    .line 50
    .line 51
    const-class v5, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;

    .line 52
    .line 53
    invoke-direct/range {v4 .. v9}, Ll/pxd0;-><init>(Ljava/lang/Class;Ljava/lang/String;Ll/pxd0$a;ZLjava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iput-object v4, v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->b:Ll/pxd0;

    .line 57
    .line 58
    new-instance v3, Ll/byd0;

    .line 59
    .line 60
    const-string v4, "live_watch_counter_last_watch_time"

    .line 61
    .line 62
    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v4

    .line 66
    const/4 v5, 0x1

    .line 67
    invoke-direct {v3, v4, v0, v5}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;Z)V

    .line 68
    .line 69
    .line 70
    iput-object v3, v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->a:Ll/byd0;

    .line 71
    .line 72
    new-instance v3, Ll/byd0;

    .line 73
    .line 74
    const-string v4, "live_watch_total_time"

    .line 75
    .line 76
    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-direct {v3, v4, v0}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 81
    .line 82
    .line 83
    iput-object v3, v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->f:Ll/byd0;

    .line 84
    .line 85
    new-instance v0, Ll/vxd0;

    .line 86
    .line 87
    const-string v3, "live_watch_total_count"

    .line 88
    .line 89
    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    const/4 v4, 0x0

    .line 94
    invoke-direct {v0, v3, v4}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 95
    .line 96
    .line 97
    iput-object v0, v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->d:Ll/vxd0;

    .line 98
    .line 99
    new-instance v0, Ll/wyd0;

    .line 100
    .line 101
    const-string v3, "live_watch_total_each_day_count_new"

    .line 102
    .line 103
    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    const-string v4, ""

    .line 108
    .line 109
    invoke-direct {v0, v3, v4}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iput-object v0, v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->e:Ll/wyd0;

    .line 113
    .line 114
    new-instance v11, Ll/pxd0;

    .line 115
    .line 116
    const-string v0, "live_watch_duration"

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v13

    .line 122
    new-instance v14, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;

    .line 123
    .line 124
    new-instance v0, Ljava/util/TreeMap;

    .line 125
    .line 126
    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-direct {v14, v0, v10}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;-><init>(Ljava/util/TreeMap;Ll/wdv;)V

    .line 130
    .line 131
    .line 132
    const/4 v15, 0x1

    .line 133
    const-string v16, "preferences"

    .line 134
    .line 135
    const-class v12, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;

    .line 136
    .line 137
    invoke-direct/range {v11 .. v16}, Ll/pxd0;-><init>(Ljava/lang/Class;Ljava/lang/String;Ll/pxd0$a;ZLjava/lang/String;)V

    .line 138
    .line 139
    .line 140
    iput-object v11, v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->c:Ll/pxd0;

    .line 141
    .line 142
    new-instance v0, Ll/jxd0;

    .line 143
    .line 144
    const-string v3, "live_new_user"

    .line 145
    .line 146
    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 151
    .line 152
    invoke-direct {v0, v3, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 153
    .line 154
    .line 155
    iput-object v0, v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->i:Ll/jxd0;

    .line 156
    .line 157
    iput-object v1, v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h:Ljava/lang/String;

    .line 158
    .line 159
    :cond_1
    return-object v2
.end method


# virtual methods
.method public e(JJ)V
    .locals 9

    .line 1
    cmp-long v0, p1, p3

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->e(JJ)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    sub-long v0, p3, p1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->f:Ll/byd0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ljava/lang/Long;

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->f:Ll/byd0;

    .line 24
    .line 25
    add-long/2addr v2, v0

    .line 26
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v4, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->c:Ll/pxd0;

    .line 34
    .line 35
    invoke-virtual {v2}, Ll/pxd0;->a()Ll/pxd0$a;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;

    .line 40
    .line 41
    invoke-static {v2}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;)Ljava/util/TreeMap;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-static {}, Ll/yau;->m()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-static {}, Ll/pzi0;->n()J

    .line 50
    .line 51
    .line 52
    move-result-wide v5

    .line 53
    cmp-long v7, p1, v5

    .line 54
    .line 55
    if-ltz v7, :cond_1

    .line 56
    .line 57
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance p2, Ll/sdv;

    .line 62
    .line 63
    invoke-direct {p2}, Ll/sdv;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v3, v4, p1, p2}, Ll/d3t;->b(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;Ll/rcj;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->c:Ll/pxd0;

    .line 70
    .line 71
    invoke-virtual {p0, v2}, Ll/pxd0;->b(Ll/pxd0$a;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    sub-long/2addr p3, v5

    .line 76
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    new-instance p4, Ll/tdv;

    .line 81
    .line 82
    invoke-direct {p4}, Ll/tdv;-><init>()V

    .line 83
    .line 84
    .line 85
    invoke-static {v3, v4, p3, p4}, Ll/d3t;->b(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;Ll/rcj;)V

    .line 86
    .line 87
    .line 88
    const/4 p3, 0x1

    .line 89
    :goto_0
    sub-long v0, v5, p1

    .line 90
    .line 91
    const-wide/32 v7, 0x5265c00

    .line 92
    .line 93
    .line 94
    cmp-long p4, v0, v7

    .line 95
    .line 96
    if-ltz p4, :cond_2

    .line 97
    .line 98
    invoke-static {p3}, Ll/yau;->l(I)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p4

    .line 102
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v3, p4, v0}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    sub-long/2addr v5, v7

    .line 110
    add-int/lit8 p3, p3, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_2
    invoke-static {p3}, Ll/yau;->l(I)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    new-instance p3, Ll/udv;

    .line 122
    .line 123
    invoke-direct {p3}, Ll/udv;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-static {v3, p1, p2, p3}, Ll/d3t;->b(Ljava/util/Map;Ljava/lang/Object;Ljava/lang/Object;Ll/rcj;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->c:Ll/pxd0;

    .line 130
    .line 131
    invoke-virtual {p0, v2}, Ll/pxd0;->b(Ll/pxd0$a;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public f(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->d:Ll/vxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->d:Ll/vxd0;

    .line 14
    .line 15
    add-int/2addr v0, p1

    .line 16
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public g(I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->e:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->n()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    :try_start_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    const-string v4, "dayTimeMillis"

    .line 18
    .line 19
    const-string v5, "dayCount"

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    :try_start_1
    new-instance v0, Lorg/json/JSONObject;

    .line 24
    .line 25
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    new-instance v3, Lorg/json/JSONObject;

    .line 36
    .line 37
    invoke-direct {v3, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    .line 41
    .line 42
    .line 43
    move-result-wide v6

    .line 44
    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    cmp-long v6, v6, v1

    .line 49
    .line 50
    if-eqz v6, :cond_1

    .line 51
    .line 52
    invoke-virtual {v3, v4, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3, v5, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    add-int/2addr v0, p1

    .line 60
    invoke-virtual {v3, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 61
    .line 62
    .line 63
    :goto_0
    move-object v0, v3

    .line 64
    :goto_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->e:Ll/wyd0;

    .line 65
    .line 66
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :catch_0
    move-exception p0

    .line 75
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public i()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->e:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    const-string p0, "dayCount"

    .line 15
    .line 16
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 20
    return p0

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public j(I)I
    .locals 1

    .line 1
    if-gtz p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->b:Ll/pxd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pxd0;->a()Ll/pxd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;

    .line 12
    .line 13
    invoke-static {}, Ll/yau;->m()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;)Ljava/util/TreeMap;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    add-int/lit8 p1, p1, -0x1

    .line 22
    .line 23
    invoke-static {p1}, Ll/yau;->l(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p0, p1, v0}, Ll/d3t;->c(Ljava/util/TreeMap;Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/util/TreeMap;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p1, Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/SortedMap;->values()Ljava/util/Collection;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ljava/util/HashSet;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-virtual {p1}, Ljava/util/HashSet;->size()I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    return p0
.end method

.method public k(I)J
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->c:Ll/pxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/pxd0;->a()Ll/pxd0$a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$WatchedDurationData;)Ljava/util/TreeMap;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    add-int/lit8 p1, p1, -0x1

    .line 14
    .line 15
    invoke-static {p1}, Ll/yau;->l(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {}, Ll/yau;->m()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p0, p1, v0}, Ll/d3t;->c(Ljava/util/TreeMap;Ljava/lang/Comparable;Ljava/lang/Comparable;)Ljava/util/TreeMap;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p1, Ll/vdv;

    .line 32
    .line 33
    invoke-direct {p1}, Ll/vdv;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {p0, p1}, Ll/jyb;->j0(Ljava/lang/Iterable;Ll/qcj;)J

    .line 37
    .line 38
    .line 39
    move-result-wide p0

    .line 40
    return-wide p0
.end method

.method public l()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const p0, 0x7fffffff

    .line 8
    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->a:Ll/byd0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v2

    .line 27
    sub-long/2addr v0, v2

    .line 28
    const-wide/32 v2, 0x5265c00

    .line 29
    .line 30
    .line 31
    div-long/2addr v0, v2

    .line 32
    long-to-int p0, v0

    .line 33
    return p0
.end method

.method public m()Z
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->a:Ll/byd0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Long;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long p0, v0, v2

    .line 18
    .line 19
    if-lez p0, :cond_0

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

.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->i:Ll/jxd0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public o()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->i:Ll/jxd0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public p(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/yau;->m()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->b:Ll/pxd0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/pxd0;->a()Ll/pxd0$a;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;)Ljava/util/TreeMap;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2, v0}, Ljava/util/TreeMap;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;)Ljava/util/TreeMap;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2, v0}, Ljava/util/TreeMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Ljava/util/HashSet;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-instance v2, Ljava/util/HashSet;

    .line 35
    .line 36
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 37
    .line 38
    .line 39
    :goto_0
    invoke-virtual {v2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;->a(Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter$ValidWatchedAnchorData;)Ljava/util/TreeMap;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1, v0, v2}, Ljava/util/TreeMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->b:Ll/pxd0;

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Ll/pxd0;->b(Ll/pxd0$a;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->a:Ll/byd0;

    .line 55
    .line 56
    invoke-static {}, Ll/pzi0;->o()J

    .line 57
    .line 58
    .line 59
    move-result-wide v0

    .line 60
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    return-void
.end method
