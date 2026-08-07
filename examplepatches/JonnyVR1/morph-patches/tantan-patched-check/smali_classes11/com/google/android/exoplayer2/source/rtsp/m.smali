.class public final Lcom/google/android/exoplayer2/source/rtsp/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/rtsp/a$a;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/google/android/exoplayer2/source/rtsp/m;->a:J

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a()Lcom/google/android/exoplayer2/source/rtsp/a$a;
    .locals 3

    .line 1
    new-instance v0, Lcom/google/android/exoplayer2/source/rtsp/k;

    .line 2
    .line 3
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/rtsp/m;->a:J

    .line 4
    .line 5
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/source/rtsp/k;-><init>(J)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public b(I)Lcom/google/android/exoplayer2/source/rtsp/a;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p1, Lcom/google/android/exoplayer2/source/rtsp/l;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/google/android/exoplayer2/source/rtsp/m;->a:J

    .line 4
    .line 5
    invoke-direct {p1, v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/l;-><init>(J)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Lcom/google/android/exoplayer2/source/rtsp/l;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/google/android/exoplayer2/source/rtsp/m;->a:J

    .line 11
    .line 12
    invoke-direct {v0, v1, v2}, Lcom/google/android/exoplayer2/source/rtsp/l;-><init>(J)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    :try_start_0
    invoke-static {p0}, Ll/dqd0;->a(I)Lcom/google/android/exoplayer2/upstream/a;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer2/source/rtsp/l;->n(Lcom/google/android/exoplayer2/upstream/a;)J

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/rtsp/l;->getLocalPort()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    rem-int/lit8 v2, v1, 0x2

    .line 28
    .line 29
    const/4 v3, 0x1

    .line 30
    if-nez v2, :cond_0

    .line 31
    .line 32
    move p0, v3

    .line 33
    :cond_0
    if-eqz p0, :cond_1

    .line 34
    .line 35
    add-int/2addr v1, v3

    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sub-int/2addr v1, v3

    .line 38
    :goto_0
    invoke-static {v1}, Ll/dqd0;->a(I)Lcom/google/android/exoplayer2/upstream/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/l;->n(Lcom/google/android/exoplayer2/upstream/a;)J

    .line 43
    .line 44
    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/source/rtsp/l;->j(Lcom/google/android/exoplayer2/source/rtsp/l;)V

    .line 48
    .line 49
    .line 50
    return-object p1

    .line 51
    :catch_0
    move-exception p0

    .line 52
    goto :goto_1

    .line 53
    :cond_2
    invoke-virtual {v0, p1}, Lcom/google/android/exoplayer2/source/rtsp/l;->j(Lcom/google/android/exoplayer2/source/rtsp/l;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    return-object v0

    .line 57
    :goto_1
    invoke-static {p1}, Ll/m6c;->a(Ll/g6c;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0}, Ll/m6c;->a(Ll/g6c;)V

    .line 61
    .line 62
    .line 63
    throw p0
.end method
