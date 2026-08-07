.class public Ll/ka1;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ka1$a;
    }
.end annotation


# instance fields
.field private a:Ll/ad60;

.field private b:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/bc1;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/lang/Object;

.field private d:Ll/bc1;

.field private e:Ll/ka1$a;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ka1;->c:Ljava/lang/Object;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ll/bc1;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ka1;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/ka1;->b:Ljava/util/List;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/ka1;->b:Ljava/util/List;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    if-eqz p1, :cond_1

    .line 19
    .line 20
    iget-object v1, p0, Ll/ka1;->b:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_1
    iput-object p1, p0, Ll/ka1;->d:Ll/bc1;

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-void

    .line 29
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method

.method public declared-synchronized b()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "EditProcess"

    .line 3
    .line 4
    const-string v1, "AudioController clearAllProcessor !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ka1;->c:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 12
    const/4 v1, 0x0

    .line 13
    :try_start_1
    iput-object v1, p0, Ll/ka1;->b:Ljava/util/List;

    .line 14
    .line 15
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v1

    .line 19
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 20
    :try_start_3
    throw v1

    .line 21
    :catchall_1
    move-exception v0

    .line 22
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 23
    throw v0
.end method

.method public c(Ljava/nio/ByteBuffer;IJ)V
    .locals 8

    .line 1
    if-lez p2, :cond_3

    .line 2
    .line 3
    iget-object v0, p0, Ll/ka1;->a:Ll/ad60;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/ad60;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/ad60;-><init>(Ljava/nio/ByteBuffer;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ka1;->a:Ll/ad60;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/ka1;->a:Ll/ad60;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/ad60;->e(Ljava/nio/ByteBuffer;)V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/ka1;->a:Ll/ad60;

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    const/4 v7, 0x0

    .line 23
    const/4 v3, 0x0

    .line 24
    move v2, p2

    .line 25
    move-wide v5, p3

    .line 26
    invoke-virtual/range {v1 .. v7}, Ll/ad60;->d(IIIJI)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/ka1;->a:Ll/ad60;

    .line 30
    .line 31
    iget-object p2, p0, Ll/ka1;->b:Ljava/util/List;

    .line 32
    .line 33
    if-eqz p2, :cond_2

    .line 34
    .line 35
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    :cond_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result p3

    .line 43
    if-eqz p3, :cond_2

    .line 44
    .line 45
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    check-cast p3, Ll/bc1;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 52
    .line 53
    .line 54
    move-result-object p4

    .line 55
    iget p4, p4, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 56
    .line 57
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-wide v0, v0, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 62
    .line 63
    invoke-virtual {p3, p1, p4, v0, v1}, Ll/bc1;->b(Ll/ad60;IJ)Ll/ad60;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    if-nez p1, :cond_1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    iget-object p0, p0, Ll/ka1;->e:Ll/ka1$a;

    .line 71
    .line 72
    if-eqz p0, :cond_3

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/ad60;->a()Ljava/nio/ByteBuffer;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    iget p3, p3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 83
    .line 84
    invoke-virtual {p1}, Ll/ad60;->b()Landroid/media/MediaCodec$BufferInfo;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-wide v0, p1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 89
    .line 90
    invoke-interface {p0, p2, p3, v0, v1}, Ll/ka1$a;->a(Ljava/nio/ByteBuffer;IJ)V

    .line 91
    .line 92
    .line 93
    :cond_3
    :goto_0
    return-void
.end method

.method public d(Ll/ka1$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ka1;->e:Ll/ka1$a;

    .line 2
    .line 3
    return-void
.end method

.method public e(Landroid/media/MediaFormat;)V
    .locals 3

    .line 1
    const-string v0, "sample-rate"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    const-string v0, "channel-count"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    const-string v0, "sample-rate"

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const-string v1, "channel-count"

    .line 24
    .line 25
    invoke-virtual {p1, v1}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const-string v2, "bit-width"

    .line 30
    .line 31
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    const-string v2, "bit-width"

    .line 38
    .line 39
    invoke-virtual {p1, v2}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/16 p1, 0x10

    .line 45
    .line 46
    :goto_0
    iget-object v2, p0, Ll/ka1;->c:Ljava/lang/Object;

    .line 47
    .line 48
    monitor-enter v2

    .line 49
    :try_start_0
    iget-object p0, p0, Ll/ka1;->d:Ll/bc1;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    invoke-virtual {p0, v0, p1, v1}, Ll/bc1;->d(III)V

    .line 54
    .line 55
    .line 56
    goto :goto_1

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_2

    .line 59
    :cond_1
    :goto_1
    monitor-exit v2

    .line 60
    return-void

    .line 61
    :goto_2
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    throw p0

    .line 63
    :cond_2
    return-void
.end method
