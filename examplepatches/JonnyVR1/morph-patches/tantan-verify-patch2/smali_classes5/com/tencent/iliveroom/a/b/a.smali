.class public Lcom/tencent/iliveroom/a/b/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/iliveroom/a/b/a$a;
    }
.end annotation


# instance fields
.field private a:J

.field private b:Ljava/util/concurrent/atomic/AtomicInteger;

.field private c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private final d:Ljava/lang/Object;

.field private e:Ljava/util/concurrent/atomic/AtomicLong;

.field private f:J

.field private g:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/b/a;->a:J

    .line 7
    .line 8
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    .line 9
    .line 10
    invoke-direct {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 11
    .line 12
    .line 13
    iput-object v2, p0, Lcom/tencent/iliveroom/a/b/a;->e:Ljava/util/concurrent/atomic/AtomicLong;

    .line 14
    .line 15
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    const/4 v1, 0x2

    .line 18
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/tencent/iliveroom/a/b/a;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 22
    .line 23
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    .line 24
    .line 25
    new-instance v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;

    .line 26
    .line 27
    invoke-direct {v1}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/tencent/iliveroom/a/b/a;->g:Ljava/util/concurrent/atomic/AtomicReference;

    .line 34
    .line 35
    new-instance v0, Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/tencent/iliveroom/a/b/a;->c:Ljava/util/Map;

    .line 41
    .line 42
    new-instance v0, Ljava/lang/Object;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/tencent/iliveroom/a/b/a;->d:Ljava/lang/Object;

    .line 48
    .line 49
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tencent/iliveroom/a/b/a$1;)V
    .locals 0

    .line 50
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/b/a;-><init>()V

    return-void
.end method

.method public static a()Lcom/tencent/iliveroom/a/b/a;
    .locals 1

    .line 23
    sget-object v0, Lcom/tencent/iliveroom/a/b/a$a;->a:Lcom/tencent/iliveroom/a/b/a;

    return-object v0
.end method

.method private e()Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;
    .locals 7

    .line 1
    new-instance v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/iliveroom/a/b/a;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x1

    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-static {v1}, Lcom/tencent/iliveroom/a/b/b;->a(I)J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    iput-wide v3, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;->audioCapTotalBytes:J

    .line 21
    .line 22
    invoke-static {v2}, Lcom/tencent/iliveroom/a/b/b;->a(I)J

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    iput-wide v1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;->audioEncTotalBytes:J

    .line 27
    .line 28
    const/4 v1, 0x2

    .line 29
    invoke-static {v1}, Lcom/tencent/iliveroom/a/b/b;->a(I)J

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    iput-wide v1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;->videoEncTotalBytes:J

    .line 34
    .line 35
    iget-object v1, p0, Lcom/tencent/iliveroom/a/b/a;->e:Ljava/util/concurrent/atomic/AtomicLong;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    iput-wide v1, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;->videoEncFrameTotalCount:J

    .line 42
    .line 43
    new-instance v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;

    .line 44
    .line 45
    invoke-direct {v1}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;-><init>()V

    .line 46
    .line 47
    .line 48
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/b/a;->a:J

    .line 49
    .line 50
    iput-wide v2, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;->userId:J

    .line 51
    .line 52
    const-string v2, "18446744073709551615"

    .line 53
    .line 54
    const/16 v3, 0x2ee7

    .line 55
    .line 56
    invoke-static {v2, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 57
    .line 58
    .line 59
    move-result-wide v2

    .line 60
    iput-wide v2, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;->videoTotalBytes:J

    .line 61
    .line 62
    const-string v2, "18446744073709551615"

    .line 63
    .line 64
    const/16 v3, 0x2ee6

    .line 65
    .line 66
    invoke-static {v2, v3}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;I)J

    .line 67
    .line 68
    .line 69
    move-result-wide v2

    .line 70
    iput-wide v2, v1, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;->audioTotalBytes:J

    .line 71
    .line 72
    iget-object v2, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;->userAVStatistics:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    :cond_0
    iget-object v1, p0, Lcom/tencent/iliveroom/a/b/a;->d:Ljava/lang/Object;

    .line 78
    .line 79
    monitor-enter v1

    .line 80
    :try_start_0
    iget-object v2, p0, Lcom/tencent/iliveroom/a/b/a;->c:Ljava/util/Map;

    .line 81
    .line 82
    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    if-eqz v3, :cond_1

    .line 95
    .line 96
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    check-cast v3, Ljava/lang/Long;

    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 103
    .line 104
    .line 105
    move-result-wide v4

    .line 106
    new-instance v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;

    .line 107
    .line 108
    invoke-direct {v6}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;-><init>()V

    .line 109
    .line 110
    .line 111
    iput-wide v4, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;->userId:J

    .line 112
    .line 113
    new-instance v4, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 116
    .line 117
    .line 118
    iget-object v5, p0, Lcom/tencent/iliveroom/a/b/a;->c:Ljava/util/Map;

    .line 119
    .line 120
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v5

    .line 124
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    const-string v5, ""

    .line 128
    .line 129
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    const/16 v5, 0x3e86

    .line 137
    .line 138
    invoke-static {v4, v5}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 139
    .line 140
    .line 141
    move-result v4

    .line 142
    int-to-long v4, v4

    .line 143
    iput-wide v4, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;->audioTotalBytes:J

    .line 144
    .line 145
    new-instance v4, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    iget-object v5, p0, Lcom/tencent/iliveroom/a/b/a;->c:Ljava/util/Map;

    .line 151
    .line 152
    invoke-interface {v5, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    const-string v3, ""

    .line 160
    .line 161
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v3

    .line 168
    const/16 v4, 0x3e85

    .line 169
    .line 170
    invoke-static {v3, v4}, Lcom/tencent/liteav/basic/module/TXCStatus;->c(Ljava/lang/String;I)I

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    int-to-long v3, v3

    .line 175
    iput-wide v3, v6, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;->videoTotalBytes:J

    .line 176
    .line 177
    iget-object v3, v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;->userAVStatistics:Ljava/util/List;

    .line 178
    .line 179
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    goto :goto_0

    .line 183
    :catchall_0
    move-exception p0

    .line 184
    goto :goto_1

    .line 185
    :cond_1
    monitor-exit v1

    .line 186
    return-object v0

    .line 187
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    throw p0
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 24
    iget-object p0, p0, Lcom/tencent/iliveroom/a/b/a;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p0, p1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method

.method public a(J)V
    .locals 0

    .line 22
    iput-wide p1, p0, Lcom/tencent/iliveroom/a/b/a;->a:J

    return-void
.end method

.method public a(JJ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/b/a;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/b/a;->c:Ljava/util/Map;

    .line 5
    .line 6
    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0
.end method

.method public b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/b/a;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tencent/iliveroom/a/b/a;->c:Ljava/util/Map;

    .line 5
    .line 6
    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 7
    .line 8
    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    iget-object v0, p0, Lcom/tencent/iliveroom/a/b/a;->e:Ljava/util/concurrent/atomic/AtomicLong;

    .line 11
    .line 12
    const-wide/16 v1, 0x0

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/tencent/iliveroom/a/b/a;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    const/16 v1, 0x8

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/tencent/iliveroom/a/b/a;->g:Ljava/util/concurrent/atomic/AtomicReference;

    .line 25
    .line 26
    new-instance v0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;

    .line 27
    .line 28
    invoke-direct {v0}, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p0
.end method

.method public b(JJ)V
    .locals 0

    .line 38
    iget-object p3, p0, Lcom/tencent/iliveroom/a/b/a;->d:Ljava/lang/Object;

    monitor-enter p3

    .line 39
    :try_start_0
    iget-object p0, p0, Lcom/tencent/iliveroom/a/b/a;->c:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    monitor-exit p3

    return-void

    :catchall_0
    move-exception p0

    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public c()Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;
    .locals 6

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/tencent/iliveroom/a/b/a;->f:J

    .line 6
    .line 7
    sub-long v2, v0, v2

    .line 8
    .line 9
    const-wide/16 v4, 0x3e8

    .line 10
    .line 11
    cmp-long v2, v2, v4

    .line 12
    .line 13
    if-gez v2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/tencent/iliveroom/a/b/a;->g:Ljava/util/concurrent/atomic/AtomicReference;

    .line 16
    .line 17
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    iput-wide v0, p0, Lcom/tencent/iliveroom/a/b/a;->f:J

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/tencent/iliveroom/a/b/a;->e()Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Lcom/tencent/iliveroom/a/b/a;->g:Ljava/util/concurrent/atomic/AtomicReference;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/iliveroom/a/b/a;->e:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 4
    .line 5
    .line 6
    return-void
.end method
