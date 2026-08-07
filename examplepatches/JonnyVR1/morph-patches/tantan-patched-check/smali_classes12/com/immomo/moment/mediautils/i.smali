.class public Lcom/immomo/moment/mediautils/i;
.super Lcom/immomo/moment/mediautils/m;
.source "SourceFile"


# instance fields
.field private final K:Ljava/lang/String;

.field private L:Lcom/immomo/moment/mediautils/f;

.field private M:Lcom/immomo/moment/mediautils/f;

.field private N:Lcom/immomo/moment/mediautils/h;

.field private O:Lcom/immomo/moment/mediautils/h;

.field private P:Ljava/lang/String;

.field private Q:Ljava/lang/Boolean;

.field private R:Ljava/lang/Object;

.field private S:Z

.field private T:Z

.field private U:Z

.field private V:Z

.field private W:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/media/MediaFormat;",
            ">;"
        }
    .end annotation
.end field

.field private X:Lcom/immomo/moment/mediautils/AudioResampleUtils;

.field private Y:J

.field private Z:Ljava/nio/ByteBuffer;

.field private a0:Z

.field private b0:Z

.field private c0:J

.field private d0:J

.field private e0:J

.field private f0:Ljava/lang/Thread;

.field private g0:Z

.field private h0:Z

.field private i0:J

.field private j0:J

.field k0:Z

.field l0:Z

.field private m0:I

.field private n0:J

.field private o0:Z

.field p0:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/m;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "MediaDecoderWrapper"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->K:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 18
    .line 19
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 20
    .line 21
    iput-object v1, p0, Lcom/immomo/moment/mediautils/i;->Q:Ljava/lang/Boolean;

    .line 22
    .line 23
    new-instance v1, Ljava/lang/Object;

    .line 24
    .line 25
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/immomo/moment/mediautils/i;->R:Ljava/lang/Object;

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->S:Z

    .line 32
    .line 33
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->T:Z

    .line 34
    .line 35
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->U:Z

    .line 36
    .line 37
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->V:Z

    .line 38
    .line 39
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->W:Ljava/util/List;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->X:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 42
    .line 43
    const-wide/16 v2, 0x0

    .line 44
    .line 45
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->Y:J

    .line 46
    .line 47
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->Z:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->a0:Z

    .line 50
    .line 51
    const/4 v4, 0x1

    .line 52
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->b0:Z

    .line 53
    .line 54
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->c0:J

    .line 55
    .line 56
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->d0:J

    .line 57
    .line 58
    const-wide/16 v2, -0x1

    .line 59
    .line 60
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->e0:J

    .line 61
    .line 62
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->f0:Ljava/lang/Thread;

    .line 63
    .line 64
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->g0:Z

    .line 65
    .line 66
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->h0:Z

    .line 67
    .line 68
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->i0:J

    .line 69
    .line 70
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->j0:J

    .line 71
    .line 72
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->k0:Z

    .line 73
    .line 74
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->l0:Z

    .line 75
    .line 76
    const v0, 0xc350

    .line 77
    .line 78
    .line 79
    iput v0, p0, Lcom/immomo/moment/mediautils/i;->m0:I

    .line 80
    .line 81
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->n0:J

    .line 82
    .line 83
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->o0:Z

    .line 84
    .line 85
    new-instance v0, Lcom/immomo/moment/mediautils/i$h;

    .line 86
    .line 87
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/i$h;-><init>(Lcom/immomo/moment/mediautils/i;)V

    .line 88
    .line 89
    .line 90
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->p0:Ljava/lang/Runnable;

    .line 91
    .line 92
    return-void
.end method

.method public static synthetic D(Lcom/immomo/moment/mediautils/i;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic E(Lcom/immomo/moment/mediautils/i;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/i;->a0(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic F(Lcom/immomo/moment/mediautils/i;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/i;->T:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic G(Lcom/immomo/moment/mediautils/i;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/i;->T:Z

    .line 2
    .line 3
    return p1
.end method

.method public static synthetic H(Lcom/immomo/moment/mediautils/i;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/i;->a0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic I(Lcom/immomo/moment/mediautils/i;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/i;->g0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic J(Lcom/immomo/moment/mediautils/i;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/i;->h0:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic K(Lcom/immomo/moment/mediautils/i;Landroid/media/MediaFormat;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/moment/mediautils/i;->b0(Landroid/media/MediaFormat;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(Lcom/immomo/moment/mediautils/i;)Lcom/immomo/moment/mediautils/AudioResampleUtils;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->X:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic M(Lcom/immomo/moment/mediautils/i;Lcom/immomo/moment/mediautils/AudioResampleUtils;)Lcom/immomo/moment/mediautils/AudioResampleUtils;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i;->X:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic N(Lcom/immomo/moment/mediautils/i;J)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/i;->Y(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic O(Lcom/immomo/moment/mediautils/i;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/i;->e0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic P(Lcom/immomo/moment/mediautils/i;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/i;->e0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic Q(Lcom/immomo/moment/mediautils/i;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->Z:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic R(Lcom/immomo/moment/mediautils/i;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i;->Z:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic S(Lcom/immomo/moment/mediautils/i;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/i;->Y:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic T(Lcom/immomo/moment/mediautils/i;F)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/i;->Y:J

    .line 2
    .line 3
    long-to-float v0, v0

    .line 4
    add-float/2addr v0, p1

    .line 5
    float-to-long v0, v0

    .line 6
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/i;->Y:J

    .line 7
    .line 8
    return-wide v0
.end method

.method public static synthetic U(Lcom/immomo/moment/mediautils/i;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/i;->d0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic V(Lcom/immomo/moment/mediautils/i;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/i;->d0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic W(Lcom/immomo/moment/mediautils/i;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/i;->c0:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic X(Lcom/immomo/moment/mediautils/i;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/i;->c0:J

    .line 2
    .line 3
    return-wide p1
.end method

.method private Y(J)Z
    .locals 8

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    const/4 v5, 0x1

    .line 8
    if-ltz v4, :cond_1

    .line 9
    .line 10
    iget-wide v6, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 11
    .line 12
    cmp-long v2, v6, v2

    .line 13
    .line 14
    if-lez v2, :cond_1

    .line 15
    .line 16
    cmp-long v0, v6, v0

    .line 17
    .line 18
    if-lez v0, :cond_1

    .line 19
    .line 20
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 21
    .line 22
    cmp-long p0, p1, v0

    .line 23
    .line 24
    if-ltz p0, :cond_0

    .line 25
    .line 26
    cmp-long p0, p1, v6

    .line 27
    .line 28
    if-gtz p0, :cond_0

    .line 29
    .line 30
    return v5

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0

    .line 33
    :cond_1
    return v5
.end method

.method private Z()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/h;->w()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/h;->w()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method private a0(I)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m;->x:Lcom/immomo/moment/mediautils/m$c;

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    iget-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->U:Z

    .line 9
    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    invoke-interface {p1}, Lcom/immomo/moment/mediautils/m$c;->c()V

    .line 13
    .line 14
    .line 15
    const-string p1, "MediaDecoder"

    .line 16
    .line 17
    const-string v1, "audio Finished"

    .line 18
    .line 19
    invoke-static {p1, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/i;->U:Z

    .line 23
    .line 24
    iget-boolean p1, p0, Lcom/immomo/moment/mediautils/i;->V:Z

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 29
    .line 30
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    const/16 v1, 0x10

    .line 34
    .line 35
    if-ne p1, v1, :cond_1

    .line 36
    .line 37
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m;->y:Lcom/immomo/moment/mediautils/m$e;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-boolean p1, p0, Lcom/immomo/moment/mediautils/i;->V:Z

    .line 42
    .line 43
    if-nez p1, :cond_1

    .line 44
    .line 45
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/i;->V:Z

    .line 46
    .line 47
    iget-boolean p1, p0, Lcom/immomo/moment/mediautils/i;->U:Z

    .line 48
    .line 49
    if-eqz p1, :cond_1

    .line 50
    .line 51
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 52
    .line 53
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method private b0(Landroid/media/MediaFormat;)V
    .locals 2

    .line 1
    const-string v0, "MediaDecoder"

    .line 2
    .line 3
    const-string v1, "MediaDecoderWrapper init audio info !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const-string v0, "channel-count"

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->e:I

    .line 21
    .line 22
    iget v1, p0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 23
    .line 24
    if-gtz v1, :cond_0

    .line 25
    .line 26
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->h:I

    .line 27
    .line 28
    :cond_0
    const-string v0, "sample-rate"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->c:I

    .line 41
    .line 42
    iget v1, p0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 43
    .line 44
    if-gtz v1, :cond_1

    .line 45
    .line 46
    iput v0, p0, Lcom/immomo/moment/mediautils/m;->f:I

    .line 47
    .line 48
    :cond_1
    const-string v0, "bit-width"

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    iput p1, p0, Lcom/immomo/moment/mediautils/m;->d:I

    .line 61
    .line 62
    iget v0, p0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 63
    .line 64
    if-gtz v0, :cond_2

    .line 65
    .line 66
    iput p1, p0, Lcom/immomo/moment/mediautils/m;->g:I

    .line 67
    .line 68
    :cond_2
    return-void
.end method

.method private f0(Ljava/lang/String;I)Z
    .locals 7

    .line 1
    const-string v0, "Video demuxer getMediaFormatList failed! sourcePath:"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i;->R:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    const/4 v2, 0x0

    .line 7
    :try_start_0
    new-instance v3, Landroid/media/MediaMetadataRetriever;

    .line 8
    .line 9
    invoke-direct {v3}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 10
    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v3, p1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception p0

    .line 19
    goto/16 :goto_7

    .line 20
    .line 21
    :catch_0
    move-exception v3

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    const/16 v4, 0x18

    .line 24
    .line 25
    invoke-virtual {v3, v4}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-lez v5, :cond_1

    .line 36
    .line 37
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    iput v4, p0, Lcom/immomo/moment/mediautils/m;->l:I

    .line 46
    .line 47
    :cond_1
    invoke-virtual {v3}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :goto_1
    :try_start_1
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 52
    .line 53
    .line 54
    iput v2, p0, Lcom/immomo/moment/mediautils/m;->l:I

    .line 55
    .line 56
    :goto_2
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 57
    .line 58
    and-int/lit8 p1, p2, 0x1

    .line 59
    .line 60
    if-eqz p1, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    new-instance p1, Lcom/immomo/moment/mediautils/j;

    .line 67
    .line 68
    invoke-direct {p1}, Lcom/immomo/moment/mediautils/j;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 72
    .line 73
    new-instance v3, Lcom/immomo/moment/mediautils/i$a;

    .line 74
    .line 75
    invoke-direct {v3, p0}, Lcom/immomo/moment/mediautils/i$a;-><init>(Lcom/immomo/moment/mediautils/i;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, v3}, Lcom/immomo/moment/mediautils/f;->h(Lcom/immomo/moment/mediautils/f$a;)V

    .line 79
    .line 80
    .line 81
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 82
    .line 83
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p1, v3}, Lcom/immomo/moment/mediautils/f;->c(Ljava/lang/String;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_2

    .line 90
    .line 91
    const-string p0, "MediaDecoder"

    .line 92
    .line 93
    const-string p1, "media demuxer create error !"

    .line 94
    .line 95
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    monitor-exit v1

    .line 99
    return v2

    .line 100
    :cond_2
    and-int/lit8 p1, p2, 0x10

    .line 101
    .line 102
    if-eqz p1, :cond_3

    .line 103
    .line 104
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 105
    .line 106
    if-nez p1, :cond_3

    .line 107
    .line 108
    new-instance p1, Lcom/immomo/moment/mediautils/j;

    .line 109
    .line 110
    invoke-direct {p1}, Lcom/immomo/moment/mediautils/j;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 114
    .line 115
    new-instance p2, Lcom/immomo/moment/mediautils/i$b;

    .line 116
    .line 117
    invoke-direct {p2, p0}, Lcom/immomo/moment/mediautils/i$b;-><init>(Lcom/immomo/moment/mediautils/i;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, p2}, Lcom/immomo/moment/mediautils/f;->h(Lcom/immomo/moment/mediautils/f$a;)V

    .line 121
    .line 122
    .line 123
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 124
    .line 125
    iget-object p2, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p1, p2}, Lcom/immomo/moment/mediautils/f;->c(Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    if-nez p1, :cond_3

    .line 132
    .line 133
    const-string p0, "MediaDecoder"

    .line 134
    .line 135
    const-string p1, "media demuxer create error !"

    .line 136
    .line 137
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    monitor-exit v1

    .line 141
    return v2

    .line 142
    :cond_3
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 143
    .line 144
    if-eqz p1, :cond_4

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/f;->b()Ljava/util/List;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i;->W:Ljava/util/List;

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_4
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 154
    .line 155
    if-eqz p1, :cond_19

    .line 156
    .line 157
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/f;->b()Ljava/util/List;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iput-object p1, p0, Lcom/immomo/moment/mediautils/i;->W:Ljava/util/List;

    .line 162
    .line 163
    :goto_3
    iget-object p1, p0, Lcom/immomo/moment/mediautils/i;->W:Ljava/util/List;

    .line 164
    .line 165
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    :cond_5
    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 170
    .line 171
    .line 172
    move-result p2

    .line 173
    const/4 v0, 0x1

    .line 174
    if-eqz p2, :cond_18

    .line 175
    .line 176
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    check-cast p2, Landroid/media/MediaFormat;

    .line 181
    .line 182
    const-string v3, "mime"

    .line 183
    .line 184
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    const-string v4, "audio"

    .line 189
    .line 190
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 191
    .line 192
    .line 193
    move-result v3

    .line 194
    if-eqz v3, :cond_c

    .line 195
    .line 196
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 197
    .line 198
    if-eqz v3, :cond_c

    .line 199
    .line 200
    invoke-direct {p0, p2}, Lcom/immomo/moment/mediautils/i;->b0(Landroid/media/MediaFormat;)V

    .line 201
    .line 202
    .line 203
    const-string v3, "durationUs"

    .line 204
    .line 205
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    if-eqz v3, :cond_7

    .line 210
    .line 211
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 212
    .line 213
    const-string v5, "durationUs"

    .line 214
    .line 215
    invoke-virtual {p2, v5}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 216
    .line 217
    .line 218
    move-result-wide v5

    .line 219
    cmp-long v3, v3, v5

    .line 220
    .line 221
    if-gez v3, :cond_6

    .line 222
    .line 223
    const-string v3, "durationUs"

    .line 224
    .line 225
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 226
    .line 227
    .line 228
    move-result-wide v3

    .line 229
    goto :goto_5

    .line 230
    :cond_6
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 231
    .line 232
    :goto_5
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 233
    .line 234
    :cond_7
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 235
    .line 236
    invoke-virtual {v3, p2}, Lcom/immomo/moment/mediautils/f;->g(Landroid/media/MediaFormat;)Z

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    if-nez v3, :cond_9

    .line 241
    .line 242
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m;->z:Ll/spw;

    .line 243
    .line 244
    if-eqz p1, :cond_8

    .line 245
    .line 246
    new-instance p2, Ljava/lang/StringBuilder;

    .line 247
    .line 248
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 249
    .line 250
    .line 251
    const-string v0, "demuxer select audio failed! sourcePath:"

    .line 252
    .line 253
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 257
    .line 258
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    const/16 p2, 0x2330

    .line 266
    .line 267
    invoke-interface {p1, p2, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 268
    .line 269
    .line 270
    :cond_8
    monitor-exit v1

    .line 271
    return v2

    .line 272
    :cond_9
    new-instance v3, Lcom/immomo/moment/mediautils/h;

    .line 273
    .line 274
    const-string v4, "audio"

    .line 275
    .line 276
    invoke-direct {v3, v4}, Lcom/immomo/moment/mediautils/h;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    iput-object v3, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 280
    .line 281
    invoke-virtual {v3, p2, v0}, Lcom/immomo/moment/mediautils/h;->u(Landroid/media/MediaFormat;I)Z

    .line 282
    .line 283
    .line 284
    move-result p2

    .line 285
    if-nez p2, :cond_b

    .line 286
    .line 287
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m;->z:Ll/spw;

    .line 288
    .line 289
    if-eqz p1, :cond_a

    .line 290
    .line 291
    new-instance p2, Ljava/lang/StringBuilder;

    .line 292
    .line 293
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 294
    .line 295
    .line 296
    const-string v0, "Create audio media codec error ! sourcePath:"

    .line 297
    .line 298
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 302
    .line 303
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    const/16 p2, 0x232b

    .line 311
    .line 312
    invoke-interface {p1, p2, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 313
    .line 314
    .line 315
    :cond_a
    const-string p0, "MediaDecoder"

    .line 316
    .line 317
    const-string p1, "Create audio media codec error !"

    .line 318
    .line 319
    invoke-static {p0, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    monitor-exit v1

    .line 323
    return v2

    .line 324
    :cond_b
    iget-object p2, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 325
    .line 326
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 327
    .line 328
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/f;->a()I

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    invoke-virtual {p2, v0}, Lcom/immomo/moment/mediautils/h;->H(I)V

    .line 333
    .line 334
    .line 335
    iget-object p2, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 336
    .line 337
    new-instance v0, Lcom/immomo/moment/mediautils/i$c;

    .line 338
    .line 339
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/i$c;-><init>(Lcom/immomo/moment/mediautils/i;)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {p2, v0}, Lcom/immomo/moment/mediautils/h;->J(Lcom/immomo/moment/mediautils/h$d;)V

    .line 343
    .line 344
    .line 345
    iget-object p2, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 346
    .line 347
    new-instance v0, Lcom/immomo/moment/mediautils/i$d;

    .line 348
    .line 349
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/i$d;-><init>(Lcom/immomo/moment/mediautils/i;)V

    .line 350
    .line 351
    .line 352
    invoke-virtual {p2, v0}, Lcom/immomo/moment/mediautils/h;->I(Lcom/immomo/moment/mediautils/h$b;)V

    .line 353
    .line 354
    .line 355
    goto/16 :goto_4

    .line 356
    .line 357
    :cond_c
    const-string v3, "mime"

    .line 358
    .line 359
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    const-string v4, "video"

    .line 364
    .line 365
    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 366
    .line 367
    .line 368
    move-result v3

    .line 369
    if-eqz v3, :cond_5

    .line 370
    .line 371
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 372
    .line 373
    if-eqz v3, :cond_5

    .line 374
    .line 375
    invoke-virtual {v3, p2}, Lcom/immomo/moment/mediautils/f;->g(Landroid/media/MediaFormat;)Z

    .line 376
    .line 377
    .line 378
    move-result v3

    .line 379
    if-nez v3, :cond_e

    .line 380
    .line 381
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m;->z:Ll/spw;

    .line 382
    .line 383
    if-eqz p1, :cond_d

    .line 384
    .line 385
    new-instance p2, Ljava/lang/StringBuilder;

    .line 386
    .line 387
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 388
    .line 389
    .line 390
    const-string v0, "demuxer select video failed! sourcePath:"

    .line 391
    .line 392
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 396
    .line 397
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 398
    .line 399
    .line 400
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object p0

    .line 404
    const/16 p2, 0x2331

    .line 405
    .line 406
    invoke-interface {p1, p2, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 407
    .line 408
    .line 409
    :cond_d
    monitor-exit v1

    .line 410
    return v2

    .line 411
    :cond_e
    const-string v3, "width"

    .line 412
    .line 413
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 414
    .line 415
    .line 416
    move-result v3

    .line 417
    if-eqz v3, :cond_f

    .line 418
    .line 419
    const-string v3, "width"

    .line 420
    .line 421
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 422
    .line 423
    .line 424
    move-result v3

    .line 425
    iput v3, p0, Lcom/immomo/moment/mediautils/m;->a:I

    .line 426
    .line 427
    :cond_f
    const-string v3, "height"

    .line 428
    .line 429
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 430
    .line 431
    .line 432
    move-result v3

    .line 433
    if-eqz v3, :cond_10

    .line 434
    .line 435
    const-string v3, "height"

    .line 436
    .line 437
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 438
    .line 439
    .line 440
    move-result v3

    .line 441
    iput v3, p0, Lcom/immomo/moment/mediautils/m;->b:I

    .line 442
    .line 443
    :cond_10
    const-string v3, "stride"

    .line 444
    .line 445
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 446
    .line 447
    .line 448
    move-result v3

    .line 449
    if-eqz v3, :cond_11

    .line 450
    .line 451
    const-string v3, "stride"

    .line 452
    .line 453
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 454
    .line 455
    .line 456
    move-result v3

    .line 457
    iput v3, p0, Lcom/immomo/moment/mediautils/m;->i:I

    .line 458
    .line 459
    :cond_11
    const-string v3, "rotation-degrees"

    .line 460
    .line 461
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 462
    .line 463
    .line 464
    move-result v3

    .line 465
    if-eqz v3, :cond_12

    .line 466
    .line 467
    const-string v3, "rotation-degrees"

    .line 468
    .line 469
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 470
    .line 471
    .line 472
    move-result v3

    .line 473
    iput v3, p0, Lcom/immomo/moment/mediautils/m;->k:I

    .line 474
    .line 475
    :cond_12
    const-string v3, "durationUs"

    .line 476
    .line 477
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 478
    .line 479
    .line 480
    move-result v3

    .line 481
    if-eqz v3, :cond_14

    .line 482
    .line 483
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 484
    .line 485
    const-string v5, "durationUs"

    .line 486
    .line 487
    invoke-virtual {p2, v5}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 488
    .line 489
    .line 490
    move-result-wide v5

    .line 491
    cmp-long v3, v3, v5

    .line 492
    .line 493
    if-gez v3, :cond_13

    .line 494
    .line 495
    const-string v3, "durationUs"

    .line 496
    .line 497
    invoke-virtual {p2, v3}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 498
    .line 499
    .line 500
    move-result-wide v3

    .line 501
    goto :goto_6

    .line 502
    :cond_13
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 503
    .line 504
    :goto_6
    iput-wide v3, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 505
    .line 506
    :cond_14
    new-instance v3, Lcom/immomo/moment/mediautils/h;

    .line 507
    .line 508
    const-string v4, "video"

    .line 509
    .line 510
    invoke-direct {v3, v0, v4}, Lcom/immomo/moment/mediautils/h;-><init>(ILjava/lang/String;)V

    .line 511
    .line 512
    .line 513
    iput-object v3, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 514
    .line 515
    iget-object v4, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 516
    .line 517
    invoke-virtual {v4}, Lcom/immomo/moment/mediautils/f;->a()I

    .line 518
    .line 519
    .line 520
    move-result v4

    .line 521
    invoke-virtual {v3, v4}, Lcom/immomo/moment/mediautils/h;->H(I)V

    .line 522
    .line 523
    .line 524
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 525
    .line 526
    iget-object v4, p0, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 527
    .line 528
    invoke-virtual {v3, v4}, Lcom/immomo/moment/mediautils/h;->F(Landroid/view/Surface;)V

    .line 529
    .line 530
    .line 531
    iget-object v3, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 532
    .line 533
    invoke-virtual {v3, p2, v0}, Lcom/immomo/moment/mediautils/h;->u(Landroid/media/MediaFormat;I)Z

    .line 534
    .line 535
    .line 536
    move-result p2

    .line 537
    if-nez p2, :cond_16

    .line 538
    .line 539
    const-string p1, "MediaDecoder"

    .line 540
    .line 541
    const-string p2, "Create video media codec erorr !"

    .line 542
    .line 543
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m;->z:Ll/spw;

    .line 547
    .line 548
    if-eqz p1, :cond_15

    .line 549
    .line 550
    new-instance p2, Ljava/lang/StringBuilder;

    .line 551
    .line 552
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 553
    .line 554
    .line 555
    const-string v0, "Create video media codec erorr ! sourcePath:"

    .line 556
    .line 557
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 558
    .line 559
    .line 560
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 561
    .line 562
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 563
    .line 564
    .line 565
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object p0

    .line 569
    const/16 p2, 0x232c

    .line 570
    .line 571
    invoke-interface {p1, p2, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 572
    .line 573
    .line 574
    :cond_15
    monitor-exit v1

    .line 575
    return v2

    .line 576
    :cond_16
    iget-object p2, p0, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 577
    .line 578
    if-eqz p2, :cond_17

    .line 579
    .line 580
    iget-object p2, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 581
    .line 582
    new-instance v0, Lcom/immomo/moment/mediautils/i$e;

    .line 583
    .line 584
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/i$e;-><init>(Lcom/immomo/moment/mediautils/i;)V

    .line 585
    .line 586
    .line 587
    invoke-virtual {p2, v0}, Lcom/immomo/moment/mediautils/h;->G(Lcom/immomo/moment/mediautils/h$a;)V

    .line 588
    .line 589
    .line 590
    :cond_17
    iget-object p2, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 591
    .line 592
    new-instance v0, Lcom/immomo/moment/mediautils/i$f;

    .line 593
    .line 594
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/i$f;-><init>(Lcom/immomo/moment/mediautils/i;)V

    .line 595
    .line 596
    .line 597
    invoke-virtual {p2, v0}, Lcom/immomo/moment/mediautils/h;->J(Lcom/immomo/moment/mediautils/h$d;)V

    .line 598
    .line 599
    .line 600
    iget-object p2, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 601
    .line 602
    new-instance v0, Lcom/immomo/moment/mediautils/i$g;

    .line 603
    .line 604
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/i$g;-><init>(Lcom/immomo/moment/mediautils/i;)V

    .line 605
    .line 606
    .line 607
    invoke-virtual {p2, v0}, Lcom/immomo/moment/mediautils/h;->I(Lcom/immomo/moment/mediautils/h$b;)V

    .line 608
    .line 609
    .line 610
    goto/16 :goto_4

    .line 611
    .line 612
    :cond_18
    monitor-exit v1

    .line 613
    return v0

    .line 614
    :cond_19
    iget-object p1, p0, Lcom/immomo/moment/mediautils/m;->z:Ll/spw;

    .line 615
    .line 616
    if-eqz p1, :cond_1a

    .line 617
    .line 618
    new-instance p2, Ljava/lang/StringBuilder;

    .line 619
    .line 620
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 621
    .line 622
    .line 623
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->P:Ljava/lang/String;

    .line 624
    .line 625
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 626
    .line 627
    .line 628
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 629
    .line 630
    .line 631
    move-result-object p0

    .line 632
    const/16 p2, 0x232f

    .line 633
    .line 634
    invoke-interface {p1, p2, p0}, Ll/spw;->onFail(ILjava/lang/String;)V

    .line 635
    .line 636
    .line 637
    :cond_1a
    monitor-exit v1

    .line 638
    return v2

    .line 639
    :goto_7
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 640
    throw p0
.end method

.method private g0(J)Z
    .locals 6

    .line 1
    const-string v0, "InsertMuteAudioData"

    .line 2
    .line 3
    const-string v1, "MediaDecoder"

    .line 4
    .line 5
    const-string v2, "MediaDecoderWrapper startDecoding !!!"

    .line 6
    .line 7
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i;->R:Ljava/lang/Object;

    .line 11
    .line 12
    monitor-enter v1

    .line 13
    :try_start_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i;->Q:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const/4 v3, 0x1

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, p1, p2}, Lcom/immomo/moment/mediautils/i;->e0(J)V

    .line 23
    .line 24
    .line 25
    monitor-exit v1

    .line 26
    return v3

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 30
    .line 31
    if-eqz v2, :cond_1

    .line 32
    .line 33
    invoke-virtual {v2, v3}, Lcom/immomo/moment/mediautils/h;->L(Z)V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 37
    .line 38
    if-eqz v2, :cond_2

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Lcom/immomo/moment/mediautils/h;->L(Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget v2, p0, Lcom/immomo/moment/mediautils/m;->r:I

    .line 44
    .line 45
    and-int/2addr v2, v3

    .line 46
    if-eqz v2, :cond_3

    .line 47
    .line 48
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 49
    .line 50
    if-nez v2, :cond_3

    .line 51
    .line 52
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/i;->b0:Z

    .line 53
    .line 54
    if-eqz v2, :cond_3

    .line 55
    .line 56
    const/4 v2, 0x0

    .line 57
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/i;->a0:Z

    .line 58
    .line 59
    new-instance v2, Ljava/lang/Thread;

    .line 60
    .line 61
    iget-object v4, p0, Lcom/immomo/moment/mediautils/i;->p0:Ljava/lang/Runnable;

    .line 62
    .line 63
    new-instance v5, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-direct {v2, v4, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iput-object v2, p0, Lcom/immomo/moment/mediautils/i;->f0:Ljava/lang/Thread;

    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 85
    .line 86
    .line 87
    :cond_3
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 88
    .line 89
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 90
    .line 91
    iput-object v0, p0, Lcom/immomo/moment/mediautils/i;->Q:Ljava/lang/Boolean;

    .line 92
    .line 93
    const-wide/16 v4, 0x0

    .line 94
    .line 95
    cmp-long v0, p1, v4

    .line 96
    .line 97
    if-lez v0, :cond_4

    .line 98
    .line 99
    invoke-virtual {p0, p1, p2}, Lcom/immomo/moment/mediautils/i;->e0(J)V

    .line 100
    .line 101
    .line 102
    :cond_4
    monitor-exit v1

    .line 103
    return v3

    .line 104
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 105
    throw p0
.end method

.method private h0()V
    .locals 3

    .line 1
    const-string v0, "MediaDecoder"

    .line 2
    .line 3
    const-string v1, "MediaDecoderWrapper stopDecoding !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->R:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/immomo/moment/mediautils/i;->Q:Ljava/lang/Boolean;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/i;->a0:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/h;->C()V

    .line 24
    .line 25
    .line 26
    iput-object v2, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p0

    .line 30
    goto :goto_2

    .line 31
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/h;->B()V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/h;->C()V

    .line 41
    .line 42
    .line 43
    iput-object v2, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 44
    .line 45
    :cond_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/f;->e()V

    .line 50
    .line 51
    .line 52
    iput-object v2, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 53
    .line 54
    :cond_2
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 55
    .line 56
    if-eqz v1, :cond_3

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/f;->e()V

    .line 59
    .line 60
    .line 61
    iput-object v2, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 62
    .line 63
    :cond_3
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->f0:Ljava/lang/Thread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    .line 65
    if-eqz p0, :cond_4

    .line 66
    .line 67
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    .line 69
    .line 70
    goto :goto_1

    .line 71
    :catch_0
    move-exception p0

    .line 72
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 73
    .line 74
    .line 75
    :cond_4
    :goto_1
    monitor-exit v0

    .line 76
    return-void

    .line 77
    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    throw p0
.end method


# virtual methods
.method public B()Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/i;->g0(J)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public C(J)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/i;->g0(J)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public c0(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Lcom/immomo/moment/mediautils/f;->d(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, -0x1

    .line 11
    return p0
.end method

.method public d0(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eqz v0, :cond_5

    .line 5
    .line 6
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, p1, p2}, Lcom/immomo/moment/mediautils/f;->d(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 16
    .line 17
    const-wide/16 v4, -0x1

    .line 18
    .line 19
    cmp-long v0, v2, v4

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 24
    .line 25
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 26
    .line 27
    :cond_1
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 28
    .line 29
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 30
    .line 31
    cmp-long v0, v2, v4

    .line 32
    .line 33
    if-lez v0, :cond_2

    .line 34
    .line 35
    iput-wide v4, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 36
    .line 37
    :cond_2
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 38
    .line 39
    const-wide/16 v4, 0x0

    .line 40
    .line 41
    cmp-long v0, v2, v4

    .line 42
    .line 43
    if-gez v0, :cond_3

    .line 44
    .line 45
    return v1

    .line 46
    :cond_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 47
    .line 48
    invoke-virtual {v0, v2, v3}, Lcom/immomo/moment/mediautils/f;->f(J)V

    .line 49
    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 56
    .line 57
    invoke-virtual {v0, p1, p2}, Lcom/immomo/moment/mediautils/f;->d(Ljava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-ne v0, v1, :cond_4

    .line 62
    .line 63
    new-instance v2, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    const-string v3, "invalid seekTime:"

    .line 66
    .line 67
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 71
    .line 72
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    const-string v3, "MediaDecoder"

    .line 80
    .line 81
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_4
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 85
    .line 86
    iget v4, p0, Lcom/immomo/moment/mediautils/i;->m0:I

    .line 87
    .line 88
    int-to-long v4, v4

    .line 89
    sub-long/2addr v2, v4

    .line 90
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 91
    .line 92
    iget-wide v2, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 93
    .line 94
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/i;->n0:J

    .line 95
    .line 96
    cmp-long v4, v2, v4

    .line 97
    .line 98
    if-eqz v4, :cond_2

    .line 99
    .line 100
    if-eq v0, v1, :cond_2

    .line 101
    .line 102
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->n0:J

    .line 103
    .line 104
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 105
    .line 106
    iget-wide p0, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 107
    .line 108
    add-long/2addr v4, p0

    .line 109
    sub-long/2addr v4, v2

    .line 110
    iput-wide v4, p2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 111
    .line 112
    return v0

    .line 113
    :cond_5
    return v1
.end method

.method public e0(J)V
    .locals 10

    .line 1
    const-string v0, "InsertMuteAudioData"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/moment/mediautils/i;->R:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/immomo/moment/mediautils/i;->Q:Ljava/lang/Boolean;

    .line 7
    .line 8
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-eqz v2, :cond_7

    .line 13
    .line 14
    const-wide/16 v2, 0x0

    .line 15
    .line 16
    cmp-long v4, p1, v2

    .line 17
    .line 18
    if-ltz v4, :cond_7

    .line 19
    .line 20
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/m;->m:J

    .line 21
    .line 22
    cmp-long v6, p1, v4

    .line 23
    .line 24
    if-lez v6, :cond_0

    .line 25
    .line 26
    cmp-long v4, v4, v2

    .line 27
    .line 28
    if-lez v4, :cond_0

    .line 29
    .line 30
    goto/16 :goto_3

    .line 31
    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/i;->o()V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/i;->Z()V

    .line 36
    .line 37
    .line 38
    const/4 v4, 0x0

    .line 39
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->S:Z

    .line 40
    .line 41
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->T:Z

    .line 42
    .line 43
    const/4 v5, 0x1

    .line 44
    iput-boolean v5, p0, Lcom/immomo/moment/mediautils/i;->l0:Z

    .line 45
    .line 46
    iput-boolean v5, p0, Lcom/immomo/moment/mediautils/i;->k0:Z

    .line 47
    .line 48
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->U:Z

    .line 49
    .line 50
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->V:Z

    .line 51
    .line 52
    const-wide/16 v6, -0x1

    .line 53
    .line 54
    iput-wide v6, p0, Lcom/immomo/moment/mediautils/i;->j0:J

    .line 55
    .line 56
    iput-wide v6, p0, Lcom/immomo/moment/mediautils/i;->i0:J

    .line 57
    .line 58
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->Y:J

    .line 59
    .line 60
    iget-object v8, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 61
    .line 62
    if-eqz v8, :cond_1

    .line 63
    .line 64
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->L:Lcom/immomo/moment/mediautils/f;

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    invoke-virtual {v0, p1, p2}, Lcom/immomo/moment/mediautils/f;->f(J)V

    .line 69
    .line 70
    .line 71
    goto :goto_1

    .line 72
    :catchall_0
    move-exception p0

    .line 73
    goto :goto_4

    .line 74
    :cond_1
    iget v9, p0, Lcom/immomo/moment/mediautils/m;->r:I

    .line 75
    .line 76
    and-int/2addr v9, v5

    .line 77
    if-eqz v9, :cond_3

    .line 78
    .line 79
    if-nez v8, :cond_3

    .line 80
    .line 81
    iget-boolean v8, p0, Lcom/immomo/moment/mediautils/i;->b0:Z

    .line 82
    .line 83
    if-eqz v8, :cond_3

    .line 84
    .line 85
    iput-boolean v5, p0, Lcom/immomo/moment/mediautils/i;->a0:Z

    .line 86
    .line 87
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->h0:Z

    .line 88
    .line 89
    iget-object v8, p0, Lcom/immomo/moment/mediautils/i;->f0:Ljava/lang/Thread;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 90
    .line 91
    if-eqz v8, :cond_2

    .line 92
    .line 93
    :try_start_1
    invoke-virtual {v8}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :catch_0
    move-exception v8

    .line 98
    :try_start_2
    invoke-virtual {v8}, Ljava/lang/Throwable;->printStackTrace()V

    .line 99
    .line 100
    .line 101
    :cond_2
    :goto_0
    iput-boolean v4, p0, Lcom/immomo/moment/mediautils/i;->a0:Z

    .line 102
    .line 103
    iput-boolean v5, p0, Lcom/immomo/moment/mediautils/i;->h0:Z

    .line 104
    .line 105
    new-instance v4, Ljava/lang/Thread;

    .line 106
    .line 107
    iget-object v5, p0, Lcom/immomo/moment/mediautils/i;->p0:Ljava/lang/Runnable;

    .line 108
    .line 109
    new-instance v8, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    invoke-static {}, Ll/g8g0;->b()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-direct {v4, v5, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    iput-object v4, p0, Lcom/immomo/moment/mediautils/i;->f0:Ljava/lang/Thread;

    .line 129
    .line 130
    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    .line 131
    .line 132
    .line 133
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 134
    .line 135
    if-eqz v0, :cond_6

    .line 136
    .line 137
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/h;->B()V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->M:Lcom/immomo/moment/mediautils/f;

    .line 141
    .line 142
    if-eqz v0, :cond_6

    .line 143
    .line 144
    iget-boolean v4, p0, Lcom/immomo/moment/mediautils/m;->I:Z

    .line 145
    .line 146
    if-eqz v4, :cond_5

    .line 147
    .line 148
    iget-wide v4, p0, Lcom/immomo/moment/mediautils/m;->o:J

    .line 149
    .line 150
    iget-wide v8, p0, Lcom/immomo/moment/mediautils/m;->q:J

    .line 151
    .line 152
    add-long/2addr v4, v8

    .line 153
    sub-long/2addr v4, p1

    .line 154
    iput-wide v4, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 155
    .line 156
    cmp-long v0, v4, v2

    .line 157
    .line 158
    if-nez v0, :cond_4

    .line 159
    .line 160
    iput-wide v6, p0, Lcom/immomo/moment/mediautils/m;->J:J

    .line 161
    .line 162
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 163
    .line 164
    goto :goto_2

    .line 165
    :cond_4
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_5
    invoke-virtual {v0, p1, p2}, Lcom/immomo/moment/mediautils/f;->f(J)V

    .line 169
    .line 170
    .line 171
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/m;->p:J

    .line 172
    .line 173
    :cond_6
    :goto_2
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->d0:J

    .line 174
    .line 175
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/i;->c0:J

    .line 176
    .line 177
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/i;->s()V

    .line 178
    .line 179
    .line 180
    monitor-exit v1

    .line 181
    return-void

    .line 182
    :cond_7
    :goto_3
    monitor-exit v1

    .line 183
    return-void

    .line 184
    :goto_4
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 185
    throw p0
.end method

.method public o()V
    .locals 2

    .line 1
    const-string v0, "MediaDecoder"

    .line 2
    .line 3
    const-string v1, "MediaDecoderWrapper pause !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/h;->A()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/i;->g0:Z

    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/h;->A()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method

.method public p(Ljava/lang/String;I)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MediaDecoderWrapper prepare path = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " sourceType = "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "MediaDecoder"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    return v0

    .line 32
    :cond_0
    iput p2, p0, Lcom/immomo/moment/mediautils/m;->r:I

    .line 33
    .line 34
    iget p2, p0, Lcom/immomo/moment/mediautils/m;->n:I

    .line 35
    .line 36
    const/16 v1, 0x10

    .line 37
    .line 38
    if-ne p2, v1, :cond_1

    .line 39
    .line 40
    iget-object p2, p0, Lcom/immomo/moment/mediautils/m;->v:Landroid/view/Surface;

    .line 41
    .line 42
    if-nez p2, :cond_1

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/m;->d()Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-nez p2, :cond_1

    .line 49
    .line 50
    return v0

    .line 51
    :cond_1
    iget p2, p0, Lcom/immomo/moment/mediautils/m;->r:I

    .line 52
    .line 53
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/i;->f0(Ljava/lang/String;I)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method public q()V
    .locals 2

    .line 1
    const-string v0, "MediaDecoder"

    .line 2
    .line 3
    const-string v1, "MediaDecoderWrapper release !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->R:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/i;->h0()V

    .line 12
    .line 13
    .line 14
    invoke-super {p0}, Lcom/immomo/moment/mediautils/m;->q()V

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

.method public r(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/immomo/moment/mediautils/h;->D(Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public s()V
    .locals 2

    .line 1
    const-string v0, "MediaDecoder"

    .line 2
    .line 3
    const-string v1, "MediaDecoderWrapper resume !!!"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/immomo/moment/mediautils/i;->N:Lcom/immomo/moment/mediautils/h;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/h;->E()V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/i;->g0:Z

    .line 18
    .line 19
    :goto_0
    iget-object p0, p0, Lcom/immomo/moment/mediautils/i;->O:Lcom/immomo/moment/mediautils/h;

    .line 20
    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/immomo/moment/mediautils/h;->E()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-void
.end method
