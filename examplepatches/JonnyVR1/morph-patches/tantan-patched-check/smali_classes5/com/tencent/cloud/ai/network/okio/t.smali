.class public final Lcom/tencent/cloud/ai/network/okio/t;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Lcom/tencent/cloud/ai/network/okio/s;

.field public static b:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Lcom/tencent/cloud/ai/network/okio/s;
    .locals 6

    .line 56
    const-class v0, Lcom/tencent/cloud/ai/network/okio/t;

    monitor-enter v0

    .line 57
    :try_start_0
    sget-object v1, Lcom/tencent/cloud/ai/network/okio/t;->a:Lcom/tencent/cloud/ai/network/okio/s;

    if-eqz v1, :cond_0

    .line 58
    iget-object v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    sput-object v2, Lcom/tencent/cloud/ai/network/okio/t;->a:Lcom/tencent/cloud/ai/network/okio/s;

    const/4 v2, 0x0

    .line 59
    iput-object v2, v1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 60
    sget-wide v2, Lcom/tencent/cloud/ai/network/okio/t;->b:J

    const-wide/16 v4, 0x2000

    sub-long/2addr v2, v4

    sput-wide v2, Lcom/tencent/cloud/ai/network/okio/t;->b:J

    .line 61
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    goto :goto_0

    .line 62
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    new-instance v0, Lcom/tencent/cloud/ai/network/okio/s;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okio/s;-><init>()V

    return-object v0

    .line 64
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okio/s;)V
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->g:Lcom/tencent/cloud/ai/network/okio/s;

    .line 6
    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okio/s;->d:Z

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-class v0, Lcom/tencent/cloud/ai/network/okio/t;

    .line 15
    .line 16
    monitor-enter v0

    .line 17
    :try_start_0
    sget-wide v1, Lcom/tencent/cloud/ai/network/okio/t;->b:J

    .line 18
    .line 19
    const-wide/16 v3, 0x2000

    .line 20
    .line 21
    add-long v5, v1, v3

    .line 22
    .line 23
    const-wide/32 v7, 0x10000

    .line 24
    .line 25
    .line 26
    cmp-long v5, v5, v7

    .line 27
    .line 28
    if-lez v5, :cond_1

    .line 29
    .line 30
    monitor-exit v0

    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_0

    .line 34
    :cond_1
    add-long/2addr v1, v3

    .line 35
    sput-wide v1, Lcom/tencent/cloud/ai/network/okio/t;->b:J

    .line 36
    .line 37
    sget-object v1, Lcom/tencent/cloud/ai/network/okio/t;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 38
    .line 39
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    iput v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    .line 43
    .line 44
    iput v1, p0, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    .line 45
    .line 46
    sput-object p0, Lcom/tencent/cloud/ai/network/okio/t;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 47
    .line 48
    monitor-exit v0

    .line 49
    return-void

    .line 50
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    throw p0

    .line 52
    :cond_2
    invoke-static {}, Ll/fig0;->a()V

    .line 53
    .line 54
    .line 55
    return-void
.end method
