.class public Ll/cvq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final a:J

.field private b:J

.field private c:J

.field private d:J

.field private e:J

.field private f:J

.field private g:J

.field private h:J

.field private final i:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/32 v0, 0xf4240

    .line 5
    .line 6
    .line 7
    mul-long/2addr p1, v0

    .line 8
    iput-wide p1, p0, Ll/cvq0;->i:J

    .line 9
    .line 10
    iput-wide p3, p0, Ll/cvq0;->a:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/cvq0;->c:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public b(Ljava/util/concurrent/Callable;)Ljava/lang/Object;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 1
    iget-wide v0, p0, Ll/cvq0;->b:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/cvq0;->i:J

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    const-wide/16 v5, 0x0

    .line 8
    .line 9
    if-lez v4, :cond_0

    .line 10
    .line 11
    div-long/2addr v0, v2

    .line 12
    iget-wide v2, p0, Ll/cvq0;->a:J

    .line 13
    .line 14
    mul-long/2addr v0, v2

    .line 15
    iput-wide v5, p0, Ll/cvq0;->b:J

    .line 16
    .line 17
    cmp-long v2, v0, v5

    .line 18
    .line 19
    if-lez v2, :cond_0

    .line 20
    .line 21
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :catch_0
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    iget-wide v2, p0, Ll/cvq0;->g:J

    .line 29
    .line 30
    cmp-long v2, v2, v5

    .line 31
    .line 32
    if-gtz v2, :cond_1

    .line 33
    .line 34
    iput-wide v0, p0, Ll/cvq0;->g:J

    .line 35
    .line 36
    :cond_1
    :try_start_1
    invoke-interface {p1}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 40
    goto :goto_0

    .line 41
    :catch_1
    move-exception p1

    .line 42
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    const/4 p1, 0x0

    .line 46
    :goto_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 47
    .line 48
    .line 49
    move-result-wide v2

    .line 50
    sub-long/2addr v2, v0

    .line 51
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    iput-wide v0, p0, Ll/cvq0;->h:J

    .line 56
    .line 57
    iget-wide v0, p0, Ll/cvq0;->e:J

    .line 58
    .line 59
    const-wide/16 v7, 0x1

    .line 60
    .line 61
    add-long/2addr v0, v7

    .line 62
    iput-wide v0, p0, Ll/cvq0;->e:J

    .line 63
    .line 64
    iget-wide v0, p0, Ll/cvq0;->c:J

    .line 65
    .line 66
    cmp-long v0, v0, v2

    .line 67
    .line 68
    if-gez v0, :cond_2

    .line 69
    .line 70
    iput-wide v2, p0, Ll/cvq0;->c:J

    .line 71
    .line 72
    :cond_2
    cmp-long v0, v2, v5

    .line 73
    .line 74
    if-lez v0, :cond_4

    .line 75
    .line 76
    iget-wide v0, p0, Ll/cvq0;->f:J

    .line 77
    .line 78
    add-long/2addr v0, v2

    .line 79
    iput-wide v0, p0, Ll/cvq0;->f:J

    .line 80
    .line 81
    iget-wide v0, p0, Ll/cvq0;->d:J

    .line 82
    .line 83
    cmp-long v4, v0, v5

    .line 84
    .line 85
    if-eqz v4, :cond_3

    .line 86
    .line 87
    cmp-long v0, v0, v2

    .line 88
    .line 89
    if-lez v0, :cond_4

    .line 90
    .line 91
    :cond_3
    iput-wide v2, p0, Ll/cvq0;->d:J

    .line 92
    .line 93
    :cond_4
    iget-wide v0, p0, Ll/cvq0;->b:J

    .line 94
    .line 95
    invoke-static {v2, v3, v5, v6}, Ljava/lang/Math;->max(JJ)J

    .line 96
    .line 97
    .line 98
    move-result-wide v2

    .line 99
    add-long/2addr v0, v2

    .line 100
    iput-wide v0, p0, Ll/cvq0;->b:J

    .line 101
    .line 102
    return-object p1
.end method

.method public c()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/cvq0;->d:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public d()J
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/cvq0;->f:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-lez v4, :cond_0

    .line 8
    .line 9
    iget-wide v4, p0, Ll/cvq0;->e:J

    .line 10
    .line 11
    cmp-long p0, v4, v2

    .line 12
    .line 13
    if-lez p0, :cond_0

    .line 14
    .line 15
    div-long/2addr v0, v4

    .line 16
    return-wide v0

    .line 17
    :cond_0
    return-wide v2
.end method

.method public e()J
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/cvq0;->h:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/cvq0;->g:J

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method
