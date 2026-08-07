.class Lcom/idv/identity/face/photinus/VideoWriter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/idv/identity/face/photinus/VideoWriter$c;,
        Lcom/idv/identity/face/photinus/VideoWriter$d;,
        Lcom/idv/identity/face/photinus/VideoWriter$RequestType;
    }
.end annotation


# instance fields
.field private a:Ljava/io/File;

.field private b:Landroid/media/MediaCodec;

.field private c:Landroid/media/MediaMuxer;

.field private d:I

.field private e:Z

.field private f:I

.field private g:I

.field private h:J

.field private i:I

.field private j:Z

.field private k:Z

.field private l:I

.field private m:Lcom/idv/identity/face/photinus/VideoWriter$c;

.field private n:Ljava/lang/Thread;

.field private final o:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/idv/identity/face/photinus/VideoWriter$d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/idv/identity/face/photinus/VideoWriter$c;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->a:Ljava/io/File;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->j:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->k:Z

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->o:Ljava/util/ArrayList;

    .line 18
    .line 19
    iput-object p1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->m:Lcom/idv/identity/face/photinus/VideoWriter$c;

    .line 20
    .line 21
    new-instance p1, Lcom/idv/identity/face/photinus/VideoWriter$a;

    .line 22
    .line 23
    invoke-direct {p1, p0, p0}, Lcom/idv/identity/face/photinus/VideoWriter$a;-><init>(Lcom/idv/identity/face/photinus/VideoWriter;Lcom/idv/identity/face/photinus/VideoWriter;)V

    .line 24
    .line 25
    .line 26
    new-instance v0, Ljava/lang/Thread;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->n:Ljava/lang/Thread;

    .line 32
    .line 33
    return-void
.end method

.method private A(ILl/f6j;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Landroid/media/MediaCodec$BufferInfo;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 13
    .line 14
    const-wide/16 v3, 0x2710

    .line 15
    .line 16
    invoke-virtual {v2, v3, v4}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    .line 17
    .line 18
    .line 19
    move-result v6

    .line 20
    if-ltz v6, :cond_2

    .line 21
    .line 22
    invoke-static {p1}, Lcom/idv/identity/face/photinus/VideoWriter;->x(I)J

    .line 23
    .line 24
    .line 25
    move-result-wide v9

    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    iget-object v5, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 29
    .line 30
    const/4 v8, 0x0

    .line 31
    const/4 v11, 0x4

    .line 32
    const/4 v7, 0x0

    .line 33
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x1

    .line 37
    invoke-direct {p0, p1, v1}, Lcom/idv/identity/face/photinus/VideoWriter;->z(ZLandroid/media/MediaCodec$BufferInfo;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    iget-object p1, p2, Ll/f6j;->a:[B

    .line 42
    .line 43
    aget-object p2, v0, v6

    .line 44
    .line 45
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, Ljava/nio/Buffer;->position()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-virtual {p2}, Ljava/nio/Buffer;->capacity()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-ne v0, v2, :cond_1

    .line 60
    .line 61
    iget-object v5, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 62
    .line 63
    array-length v8, p1

    .line 64
    const/4 v11, 0x0

    .line 65
    const/4 v7, 0x0

    .line 66
    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 67
    .line 68
    .line 69
    const/4 p1, 0x0

    .line 70
    invoke-direct {p0, p1, v1}, Lcom/idv/identity/face/photinus/VideoWriter;->z(ZLandroid/media/MediaCodec$BufferInfo;)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string p1, "position="

    .line 77
    .line 78
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p2}, Ljava/nio/Buffer;->position()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    const-string p1, "   capacity="

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, Ljava/nio/Buffer;->capacity()I

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string p1, "limit="

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {p2}, Ljava/nio/Buffer;->limit()I

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    const-string p1, "input buffer not large enough to hold frame data>>>>"

    .line 117
    .line 118
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    const-string p2, "DTF"

    .line 123
    .line 124
    invoke-static {p2, p1}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    invoke-static {p0}, Ll/brq0;->a(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_2
    return-void
.end method

.method private D()Lcom/idv/identity/face/photinus/VideoWriter$d;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->o:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->o:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    monitor-exit v0

    .line 14
    return-object p0

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->o:Ljava/util/ArrayList;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/idv/identity/face/photinus/VideoWriter$d;

    .line 25
    .line 26
    monitor-exit v0

    .line 27
    return-object p0

    .line 28
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw p0
.end method

.method private E(Lcom/idv/identity/face/photinus/VideoWriter$d;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->o:Ljava/util/ArrayList;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->k:Z

    .line 5
    .line 6
    if-eqz v1, :cond_1

    .line 7
    .line 8
    iget-object v1, p1, Lcom/idv/identity/face/photinus/VideoWriter$d;->a:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

    .line 9
    .line 10
    sget-object v2, Lcom/idv/identity/face/photinus/VideoWriter$RequestType;->rCloseMoveFile:Lcom/idv/identity/face/photinus/VideoWriter$RequestType;

    .line 11
    .line 12
    if-ne v1, v2, :cond_0

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    iput-boolean v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->k:Z

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->o:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    :cond_1
    monitor-exit v0

    .line 26
    return-void

    .line 27
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 28
    throw p0
.end method

.method public static F([BIII)[B
    .locals 1

    .line 1
    const/16 v0, 0x10e

    .line 2
    .line 3
    if-ne p3, v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1, p2}, Lcom/idv/identity/face/photinus/VideoWriter;->I([BII)[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/16 v0, 0xb4

    .line 11
    .line 12
    if-ne p3, v0, :cond_1

    .line 13
    .line 14
    invoke-static {p0, p1, p2}, Lcom/idv/identity/face/photinus/VideoWriter;->H([BII)[B

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_1
    const/16 v0, 0x5a

    .line 20
    .line 21
    if-ne p3, v0, :cond_2

    .line 22
    .line 23
    invoke-static {p0, p1, p2}, Lcom/idv/identity/face/photinus/VideoWriter;->J([BII)[B

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_2
    invoke-static {p0, p1, p2}, Lcom/idv/identity/face/photinus/VideoWriter;->G([BII)[B

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method private static G([BII)[B
    .locals 3

    .line 1
    mul-int/2addr p1, p2

    .line 2
    mul-int/lit8 p2, p1, 0x3

    .line 3
    .line 4
    div-int/lit8 p2, p2, 0x2

    .line 5
    .line 6
    new-array v0, p2, [B

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    :goto_0
    if-ge v1, p1, :cond_0

    .line 10
    .line 11
    aget-byte v2, p0, v1

    .line 12
    .line 13
    aput-byte v2, v0, v1

    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    :goto_1
    if-ge p1, p2, :cond_1

    .line 19
    .line 20
    add-int/lit8 v1, p1, 0x1

    .line 21
    .line 22
    aget-byte v2, p0, v1

    .line 23
    .line 24
    aput-byte v2, v0, p1

    .line 25
    .line 26
    aget-byte v2, p0, p1

    .line 27
    .line 28
    aput-byte v2, v0, v1

    .line 29
    .line 30
    add-int/lit8 p1, p1, 0x2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    return-object v0
.end method

.method private static H([BII)[B
    .locals 4

    .line 1
    mul-int/2addr p1, p2

    .line 2
    mul-int/lit8 p2, p1, 0x3

    .line 3
    .line 4
    div-int/lit8 p2, p2, 0x2

    .line 5
    .line 6
    new-array v0, p2, [B

    .line 7
    .line 8
    add-int/lit8 v1, p1, -0x1

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ltz v1, :cond_0

    .line 12
    .line 13
    aget-byte v3, p0, v1

    .line 14
    .line 15
    aput-byte v3, v0, v2

    .line 16
    .line 17
    add-int/lit8 v2, v2, 0x1

    .line 18
    .line 19
    add-int/lit8 v1, v1, -0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    add-int/lit8 p2, p2, -0x1

    .line 23
    .line 24
    :goto_1
    if-lt p2, p1, :cond_1

    .line 25
    .line 26
    add-int/lit8 v1, v2, 0x1

    .line 27
    .line 28
    aget-byte v3, p0, p2

    .line 29
    .line 30
    aput-byte v3, v0, v2

    .line 31
    .line 32
    add-int/lit8 v2, v2, 0x2

    .line 33
    .line 34
    add-int/lit8 v3, p2, -0x1

    .line 35
    .line 36
    aget-byte v3, p0, v3

    .line 37
    .line 38
    aput-byte v3, v0, v1

    .line 39
    .line 40
    add-int/lit8 p2, p2, -0x2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    return-object v0
.end method

.method public static I([BII)[B
    .locals 11

    .line 1
    mul-int v0, p1, p2

    .line 2
    .line 3
    mul-int/lit8 v1, v0, 0x3

    .line 4
    .line 5
    div-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    new-array v2, v1, [B

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    if-nez p1, :cond_1

    .line 11
    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move v0, v3

    .line 16
    move v4, v0

    .line 17
    goto :goto_1

    .line 18
    :cond_1
    :goto_0
    shr-int/lit8 v4, p2, 0x1

    .line 19
    .line 20
    :goto_1
    move v5, v3

    .line 21
    move v6, v5

    .line 22
    :goto_2
    if-ge v5, p1, :cond_3

    .line 23
    .line 24
    move v7, v3

    .line 25
    move v8, v7

    .line 26
    :goto_3
    if-ge v7, p2, :cond_2

    .line 27
    .line 28
    add-int v9, v8, v5

    .line 29
    .line 30
    aget-byte v9, p0, v9

    .line 31
    .line 32
    aput-byte v9, v2, v6

    .line 33
    .line 34
    add-int/lit8 v6, v6, 0x1

    .line 35
    .line 36
    add-int/2addr v8, p1

    .line 37
    add-int/lit8 v7, v7, 0x1

    .line 38
    .line 39
    goto :goto_3

    .line 40
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 41
    .line 42
    goto :goto_2

    .line 43
    :cond_3
    move v5, v3

    .line 44
    :goto_4
    if-ge v5, p1, :cond_6

    .line 45
    .line 46
    move v8, v0

    .line 47
    move v7, v3

    .line 48
    :goto_5
    if-ge v7, v4, :cond_5

    .line 49
    .line 50
    add-int v9, v8, v5

    .line 51
    .line 52
    add-int/lit8 v10, v1, -0x2

    .line 53
    .line 54
    if-lt v9, v10, :cond_4

    .line 55
    .line 56
    goto :goto_6

    .line 57
    :cond_4
    aget-byte v10, p0, v9

    .line 58
    .line 59
    aput-byte v10, v2, v6

    .line 60
    .line 61
    add-int/lit8 v10, v6, 0x1

    .line 62
    .line 63
    add-int/lit8 v9, v9, 0x1

    .line 64
    .line 65
    aget-byte v9, p0, v9

    .line 66
    .line 67
    aput-byte v9, v2, v10

    .line 68
    .line 69
    add-int/lit8 v6, v6, 0x2

    .line 70
    .line 71
    add-int/2addr v8, p1

    .line 72
    add-int/lit8 v7, v7, 0x1

    .line 73
    .line 74
    goto :goto_5

    .line 75
    :cond_5
    :goto_6
    add-int/lit8 v5, v5, 0x2

    .line 76
    .line 77
    goto :goto_4

    .line 78
    :cond_6
    invoke-static {v2, p1, p2}, Lcom/idv/identity/face/photinus/VideoWriter;->H([BII)[B

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    return-object p0
.end method

.method private static J([BII)[B
    .locals 11

    .line 1
    mul-int v0, p1, p2

    .line 2
    .line 3
    mul-int/lit8 v1, v0, 0x3

    .line 4
    .line 5
    div-int/lit8 v1, v1, 0x2

    .line 6
    .line 7
    new-array v2, v1, [B

    .line 8
    .line 9
    add-int/lit8 v3, p2, -0x1

    .line 10
    .line 11
    mul-int v4, v3, p1

    .line 12
    .line 13
    const/4 v5, 0x0

    .line 14
    move v6, v5

    .line 15
    move v7, v6

    .line 16
    :goto_0
    if-ge v6, p1, :cond_1

    .line 17
    .line 18
    move v8, v3

    .line 19
    move v9, v4

    .line 20
    :goto_1
    if-ltz v8, :cond_0

    .line 21
    .line 22
    add-int v10, v9, v6

    .line 23
    .line 24
    aget-byte v10, p0, v10

    .line 25
    .line 26
    aput-byte v10, v2, v7

    .line 27
    .line 28
    add-int/lit8 v7, v7, 0x1

    .line 29
    .line 30
    sub-int/2addr v9, p1

    .line 31
    add-int/lit8 v8, v8, -0x1

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    add-int/lit8 v6, v6, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 38
    .line 39
    add-int/lit8 v3, p1, -0x1

    .line 40
    .line 41
    :goto_2
    if-lez v3, :cond_3

    .line 42
    .line 43
    move v6, v0

    .line 44
    move v4, v5

    .line 45
    :goto_3
    div-int/lit8 v7, p2, 0x2

    .line 46
    .line 47
    if-ge v4, v7, :cond_2

    .line 48
    .line 49
    add-int v7, v6, v3

    .line 50
    .line 51
    add-int/lit8 v8, v7, -0x1

    .line 52
    .line 53
    aget-byte v8, p0, v8

    .line 54
    .line 55
    aput-byte v8, v2, v1

    .line 56
    .line 57
    add-int/lit8 v8, v1, -0x1

    .line 58
    .line 59
    aget-byte v7, p0, v7

    .line 60
    .line 61
    aput-byte v7, v2, v8

    .line 62
    .line 63
    add-int/lit8 v1, v1, -0x2

    .line 64
    .line 65
    add-int/2addr v6, p1

    .line 66
    add-int/lit8 v4, v4, 0x1

    .line 67
    .line 68
    goto :goto_3

    .line 69
    :cond_2
    add-int/lit8 v3, v3, -0x2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_3
    return-object v2
.end method

.method private static K(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 8

    .line 1
    invoke-static {p0}, Lcom/idv/identity/face/photinus/VideoWriter;->L(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object v0

    .line 8
    :cond_0
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    move v2, v1

    .line 14
    :goto_0
    if-ge v2, v0, :cond_4

    .line 15
    .line 16
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    if-nez v4, :cond_1

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_1
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    array-length v5, v4

    .line 32
    move v6, v1

    .line 33
    :goto_1
    if-ge v6, v5, :cond_3

    .line 34
    .line 35
    aget-object v7, v4, v6

    .line 36
    .line 37
    invoke-virtual {v7, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-eqz v7, :cond_2

    .line 42
    .line 43
    return-object v3

    .line 44
    :cond_2
    add-int/lit8 v6, v6, 0x1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_4
    const/4 p0, 0x0

    .line 51
    return-object p0
.end method

.method private static L(Ljava/lang/String;)Landroid/media/MediaCodecInfo;
    .locals 9

    .line 1
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v2, v0, :cond_4

    .line 8
    .line 9
    invoke-static {v2}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    if-nez v4, :cond_0

    .line 18
    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    if-nez v4, :cond_1

    .line 25
    .line 26
    const-string v4, ""

    .line 27
    .line 28
    :cond_1
    invoke-virtual {v3}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    array-length v6, v5

    .line 33
    move v7, v1

    .line 34
    :goto_1
    if-ge v7, v6, :cond_3

    .line 35
    .line 36
    aget-object v8, v5, v7

    .line 37
    .line 38
    invoke-virtual {v8, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v8

    .line 42
    if-eqz v8, :cond_2

    .line 43
    .line 44
    const-string v8, "google"

    .line 45
    .line 46
    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    if-eqz v8, :cond_2

    .line 51
    .line 52
    return-object v3

    .line 53
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_3
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_4
    const/4 p0, 0x0

    .line 60
    return-object p0
.end method

.method public static synthetic a(Lcom/idv/identity/face/photinus/VideoWriter;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Lcom/idv/identity/face/photinus/VideoWriter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->j:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic c(Lcom/idv/identity/face/photinus/VideoWriter;)Lcom/idv/identity/face/photinus/VideoWriter$d;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/photinus/VideoWriter;->D()Lcom/idv/identity/face/photinus/VideoWriter$d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/idv/identity/face/photinus/VideoWriter;)Lcom/idv/identity/face/photinus/VideoWriter$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->m:Lcom/idv/identity/face/photinus/VideoWriter$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic e(Lcom/idv/identity/face/photinus/VideoWriter;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic f(Lcom/idv/identity/face/photinus/VideoWriter;Landroid/media/MediaCodec;)Landroid/media/MediaCodec;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic g(Lcom/idv/identity/face/photinus/VideoWriter;)Landroid/media/MediaMuxer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->c:Landroid/media/MediaMuxer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/idv/identity/face/photinus/VideoWriter;Landroid/media/MediaMuxer;)Landroid/media/MediaMuxer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->c:Landroid/media/MediaMuxer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic i(Lcom/idv/identity/face/photinus/VideoWriter;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->e:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic j(Lcom/idv/identity/face/photinus/VideoWriter;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->h:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic k(Lcom/idv/identity/face/photinus/VideoWriter;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->h:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic l(Lcom/idv/identity/face/photinus/VideoWriter;Ljava/io/File;)Ljava/io/File;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->a:Ljava/io/File;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic m(Lcom/idv/identity/face/photinus/VideoWriter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/idv/identity/face/photinus/VideoWriter;->y()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic n(Lcom/idv/identity/face/photinus/VideoWriter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic o(Lcom/idv/identity/face/photinus/VideoWriter;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->i:I

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic p(Lcom/idv/identity/face/photinus/VideoWriter;)I
    .locals 2

    .line 1
    iget v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->i:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x1

    .line 4
    .line 5
    iput v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->i:I

    .line 6
    .line 7
    return v0
.end method

.method public static synthetic q(Lcom/idv/identity/face/photinus/VideoWriter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic r(Lcom/idv/identity/face/photinus/VideoWriter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->g:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic s(Lcom/idv/identity/face/photinus/VideoWriter;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic t(Lcom/idv/identity/face/photinus/VideoWriter;ILl/f6j;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/idv/identity/face/photinus/VideoWriter;->A(ILl/f6j;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static w(I)Ljava/lang/String;
    .locals 1

    .line 1
    const/16 v0, 0x27

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const v0, 0x7f000100

    .line 6
    .line 7
    .line 8
    if-eq p0, v0, :cond_0

    .line 9
    .line 10
    packed-switch p0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    const-string p0, "Unknown color format"

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_0
    const-string p0, "COLOR_FormatYUV420SemiPlanar"

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_1
    const-string p0, "COLOR_FormatYUV420PackedPlanar"

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_2
    const-string p0, "COLOR_FormatYUV420Planar"

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_0
    const-string p0, "COLOR_TI_FormatYUV420PackedSemiPlanar"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_1
    const-string p0, "COLOR_FormatYUV420PackedSemiPlanar"

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static x(I)J
    .locals 2

    .line 1
    const v0, 0xf4240

    .line 2
    .line 3
    .line 4
    mul-int/2addr p0, v0

    .line 5
    div-int/lit8 p0, p0, 0x1e

    .line 6
    .line 7
    add-int/lit16 p0, p0, 0x84

    .line 8
    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0
.end method

.method private y()V
    .locals 6

    .line 1
    const-string v0, "video/avc"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {v0}, Lcom/idv/identity/face/photinus/VideoWriter;->K(Ljava/lang/String;)Landroid/media/MediaCodecInfo;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "DTF"

    .line 11
    .line 12
    const-string v2, "Unable to find an appropriate codec for video/avc"

    .line 13
    .line 14
    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_2

    .line 20
    :cond_0
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    const/16 v3, 0x15

    .line 24
    .line 25
    invoke-static {v3}, Lcom/idv/identity/face/photinus/VideoWriter;->w(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    iget v4, p0, Lcom/idv/identity/face/photinus/VideoWriter;->l:I

    .line 29
    .line 30
    const/16 v5, 0x5a

    .line 31
    .line 32
    if-eq v4, v5, :cond_2

    .line 33
    .line 34
    const/16 v5, 0x10e

    .line 35
    .line 36
    if-ne v4, v5, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget v4, p0, Lcom/idv/identity/face/photinus/VideoWriter;->f:I

    .line 40
    .line 41
    iget v5, p0, Lcom/idv/identity/face/photinus/VideoWriter;->g:I

    .line 42
    .line 43
    invoke-static {v0, v4, v5}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    :goto_0
    iget v4, p0, Lcom/idv/identity/face/photinus/VideoWriter;->g:I

    .line 49
    .line 50
    iget v5, p0, Lcom/idv/identity/face/photinus/VideoWriter;->f:I

    .line 51
    .line 52
    invoke-static {v0, v4, v5}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    :goto_1
    const-string v4, "color-format"

    .line 57
    .line 58
    invoke-virtual {v0, v4, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 59
    .line 60
    .line 61
    const-string v3, "bitrate"

    .line 62
    .line 63
    const v4, 0x2dc6c0

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v3, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    const-string v3, "frame-rate"

    .line 70
    .line 71
    const/16 v4, 0x1e

    .line 72
    .line 73
    invoke-virtual {v0, v3, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 74
    .line 75
    .line 76
    const-string v3, "i-frame-interval"

    .line 77
    .line 78
    const/16 v4, 0xa

    .line 79
    .line 80
    invoke-virtual {v0, v3, v4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2}, Landroid/media/MediaCodecInfo;->getName()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    invoke-static {v2}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    iput-object v2, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 95
    .line 96
    const/4 v3, 0x1

    .line 97
    const/4 v4, 0x0

    .line 98
    invoke-virtual {v2, v0, v4, v4, v3}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->a:Ljava/io/File;

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    new-instance v2, Landroid/media/MediaMuxer;

    .line 113
    .line 114
    invoke-direct {v2, v0, v1}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 115
    .line 116
    .line 117
    iput-object v2, p0, Lcom/idv/identity/face/photinus/VideoWriter;->c:Landroid/media/MediaMuxer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 118
    .line 119
    return-void

    .line 120
    :goto_2
    iget-object v2, p0, Lcom/idv/identity/face/photinus/VideoWriter;->m:Lcom/idv/identity/face/photinus/VideoWriter$c;

    .line 121
    .line 122
    if-eqz v2, :cond_3

    .line 123
    .line 124
    invoke-interface {v2, v0}, Lcom/idv/identity/face/photinus/VideoWriter$c;->onException(Ljava/lang/Throwable;)V

    .line 125
    .line 126
    .line 127
    :cond_3
    iput-boolean v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->j:Z

    .line 128
    .line 129
    iput-boolean v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->k:Z

    .line 130
    .line 131
    iget-object p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->o:Ljava/util/ArrayList;

    .line 132
    .line 133
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method private z(ZLandroid/media/MediaCodec$BufferInfo;)V
    .locals 6

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    :try_start_0
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    :cond_0
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 15
    .line 16
    const-wide/16 v2, 0x2710

    .line 17
    .line 18
    invoke-virtual {v1, p2, v2, v3}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, -0x1

    .line 23
    if-ne v1, v2, :cond_2

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_2
    const/4 v2, -0x3

    .line 30
    if-ne v1, v2, :cond_3

    .line 31
    .line 32
    iget-object v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 33
    .line 34
    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    goto :goto_0

    .line 39
    :cond_3
    const/4 v2, -0x2

    .line 40
    if-ne v1, v2, :cond_5

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->e:Z

    .line 43
    .line 44
    if-nez v1, :cond_4

    .line 45
    .line 46
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-static {v1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    iget-object v2, p0, Lcom/idv/identity/face/photinus/VideoWriter;->c:Landroid/media/MediaMuxer;

    .line 56
    .line 57
    invoke-virtual {v2, v1}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    iput v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->d:I

    .line 62
    .line 63
    iget-object v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->c:Landroid/media/MediaMuxer;

    .line 64
    .line 65
    invoke-virtual {v1}, Landroid/media/MediaMuxer;->start()V

    .line 66
    .line 67
    .line 68
    const/4 v1, 0x1

    .line 69
    iput-boolean v1, p0, Lcom/idv/identity/face/photinus/VideoWriter;->e:Z

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const-string p0, "format changed twice"

    .line 73
    .line 74
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_5
    if-gez v1, :cond_6

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_6
    aget-object v2, v0, v1

    .line 82
    .line 83
    if-eqz v2, :cond_a

    .line 84
    .line 85
    iget v3, p2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 86
    .line 87
    and-int/lit8 v3, v3, 0x2

    .line 88
    .line 89
    const/4 v4, 0x0

    .line 90
    if-eqz v3, :cond_7

    .line 91
    .line 92
    iput v4, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 93
    .line 94
    :cond_7
    iget v3, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 95
    .line 96
    if-eqz v3, :cond_9

    .line 97
    .line 98
    iget-boolean v3, p0, Lcom/idv/identity/face/photinus/VideoWriter;->e:Z

    .line 99
    .line 100
    if-eqz v3, :cond_8

    .line 101
    .line 102
    iget v3, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 103
    .line 104
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 105
    .line 106
    .line 107
    iget v3, p2, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 108
    .line 109
    iget v5, p2, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 110
    .line 111
    add-int/2addr v3, v5

    .line 112
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 113
    .line 114
    .line 115
    :try_start_1
    iget-object v3, p0, Lcom/idv/identity/face/photinus/VideoWriter;->c:Landroid/media/MediaMuxer;

    .line 116
    .line 117
    iget v5, p0, Lcom/idv/identity/face/photinus/VideoWriter;->d:I

    .line 118
    .line 119
    invoke-virtual {v3, v5, v2, p2}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 120
    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_8
    const-string p0, "muxer hasn\'t started"

    .line 124
    .line 125
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :catch_1
    :cond_9
    :goto_1
    iget-object v2, p0, Lcom/idv/identity/face/photinus/VideoWriter;->b:Landroid/media/MediaCodec;

    .line 130
    .line 131
    invoke-virtual {v2, v1, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 132
    .line 133
    .line 134
    iget v1, p2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 135
    .line 136
    and-int/lit8 v1, v1, 0x4

    .line 137
    .line 138
    if-eqz v1, :cond_1

    .line 139
    .line 140
    :goto_2
    return-void

    .line 141
    :cond_a
    const-string p0, "encoderOutputBuffer "

    .line 142
    .line 143
    const-string p1, " was null"

    .line 144
    .line 145
    invoke-static {p0, v1, p1}, Ll/z0q;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method


# virtual methods
.method public B()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public C(Landroid/net/Uri;III)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->j:Z

    .line 7
    .line 8
    iput-boolean v0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->k:Z

    .line 9
    .line 10
    iput p2, p0, Lcom/idv/identity/face/photinus/VideoWriter;->f:I

    .line 11
    .line 12
    iput p3, p0, Lcom/idv/identity/face/photinus/VideoWriter;->g:I

    .line 13
    .line 14
    iput p4, p0, Lcom/idv/identity/face/photinus/VideoWriter;->l:I

    .line 15
    .line 16
    new-instance p2, Lcom/idv/identity/face/photinus/VideoWriter$d;

    .line 17
    .line 18
    invoke-direct {p2, p1}, Lcom/idv/identity/face/photinus/VideoWriter$d;-><init>(Landroid/net/Uri;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, p2}, Lcom/idv/identity/face/photinus/VideoWriter;->E(Lcom/idv/identity/face/photinus/VideoWriter$d;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/idv/identity/face/photinus/VideoWriter;->n:Ljava/lang/Thread;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public u(Ll/f6j;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/face/photinus/VideoWriter$d;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/idv/identity/face/photinus/VideoWriter$d;-><init>(Ll/f6j;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/idv/identity/face/photinus/VideoWriter;->E(Lcom/idv/identity/face/photinus/VideoWriter$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/face/photinus/VideoWriter$d;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/idv/identity/face/photinus/VideoWriter$d;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/idv/identity/face/photinus/VideoWriter;->E(Lcom/idv/identity/face/photinus/VideoWriter$d;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
