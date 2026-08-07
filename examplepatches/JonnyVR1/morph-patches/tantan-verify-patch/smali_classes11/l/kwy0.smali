.class public abstract Ll/kwy0;
.super Ll/qwx0;
.source "SourceFile"


# static fields
.field public static final Z0:[B


# instance fields
.field public final A:Ll/qty0;

.field public B:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public C:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public D:Landroid/media/MediaCrypto;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public E:Z

.field public E0:Z

.field public F:J

.field public F0:Z

.field public G:F

.field public G0:Z

.field public H:Ll/bwy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public H0:Z

.field public I:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public I0:I

.field public J:Landroid/media/MediaFormat;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public J0:I

.field public K:Z

.field public K0:I

.field public L:F

.field public L0:Z

.field public M:Ljava/util/ArrayDeque;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public M0:Z

.field public N:Lcom/google/android/gms/internal/ads/zzsx;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public N0:Z

.field public O:Ll/hwy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public O0:J

.field public P:I

.field public P0:J

.field public Q:Z

.field public Q0:Z

.field public R:Z

.field public R0:Z

.field public S:Z

.field public S0:Z

.field public T:Z

.field public T0:Ll/vwx0;

.field public U:Z

.field public U0:Ll/jwy0;

.field public V:Z

.field public V0:J

.field public W:J

.field public W0:Z

.field public X:I

.field public X0:Ll/juy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public Y:I

.field public Y0:Ll/juy0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public Z:Ljava/nio/ByteBuffer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public k0:Z

.field public p0:Z

.field public final r:Ll/zvy0;

.field public final s:Ll/dxy0;

.field public final t:F

.field public final u:Ll/evx0;

.field public final v:Ll/evx0;

.field public final w:Ll/evx0;

.field public final x:Ll/tvy0;

.field public final y:Landroid/media/MediaCodec$BufferInfo;

.field public final z:Ljava/util/ArrayDeque;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x26

    .line 2
    .line 3
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/kwy0;->Z0:[B

    .line 9
    .line 10
    return-void

    .line 11
    :array_0
    .array-data 1
        0x0t
        0x0t
        0x1t
        0x67t
        0x42t
        -0x40t
        0xbt
        -0x26t
        0x25t
        -0x70t
        0x0t
        0x0t
        0x1t
        0x68t
        -0x32t
        0xft
        0x13t
        0x20t
        0x0t
        0x0t
        0x1t
        0x65t
        -0x78t
        -0x7ct
        0xdt
        -0x32t
        0x71t
        0x18t
        -0x60t
        0x0t
        0x2ft
        -0x41t
        0x1ct
        0x31t
        -0x3dt
        0x27t
        0x5dt
        0x78t
    .end array-data
.end method

.method public constructor <init>(ILl/zvy0;Ll/dxy0;ZF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qwx0;-><init>(I)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/kwy0;->r:Ll/zvy0;

    .line 5
    .line 6
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    iput-object p3, p0, Ll/kwy0;->s:Ll/dxy0;

    .line 10
    .line 11
    iput p5, p0, Ll/kwy0;->t:F

    .line 12
    .line 13
    new-instance p1, Ll/evx0;

    .line 14
    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-direct {p1, p2, p2}, Ll/evx0;-><init>(II)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/kwy0;->u:Ll/evx0;

    .line 20
    .line 21
    new-instance p1, Ll/evx0;

    .line 22
    .line 23
    invoke-direct {p1, p2, p2}, Ll/evx0;-><init>(II)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Ll/kwy0;->v:Ll/evx0;

    .line 27
    .line 28
    new-instance p1, Ll/evx0;

    .line 29
    .line 30
    const/4 p3, 0x2

    .line 31
    invoke-direct {p1, p3, p2}, Ll/evx0;-><init>(II)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/kwy0;->w:Ll/evx0;

    .line 35
    .line 36
    new-instance p1, Ll/tvy0;

    .line 37
    .line 38
    invoke-direct {p1}, Ll/tvy0;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Ll/kwy0;->x:Ll/tvy0;

    .line 42
    .line 43
    new-instance p3, Landroid/media/MediaCodec$BufferInfo;

    .line 44
    .line 45
    invoke-direct {p3}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p3, p0, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 49
    .line 50
    const/high16 p3, 0x3f800000    # 1.0f

    .line 51
    .line 52
    iput p3, p0, Ll/kwy0;->G:F

    .line 53
    .line 54
    const-wide p3, -0x7fffffffffffffffL    # -4.9E-324

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    iput-wide p3, p0, Ll/kwy0;->F:J

    .line 60
    .line 61
    new-instance p5, Ljava/util/ArrayDeque;

    .line 62
    .line 63
    invoke-direct {p5}, Ljava/util/ArrayDeque;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p5, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 67
    .line 68
    sget-object p5, Ll/jwy0;->e:Ll/jwy0;

    .line 69
    .line 70
    iput-object p5, p0, Ll/kwy0;->U0:Ll/jwy0;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Ll/evx0;->i(I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p1, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 76
    .line 77
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    .line 78
    .line 79
    .line 80
    move-result-object p5

    .line 81
    invoke-virtual {p1, p5}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 82
    .line 83
    .line 84
    new-instance p1, Ll/qty0;

    .line 85
    .line 86
    invoke-direct {p1}, Ll/qty0;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object p1, p0, Ll/kwy0;->A:Ll/qty0;

    .line 90
    .line 91
    const/high16 p1, -0x40800000    # -1.0f

    .line 92
    .line 93
    iput p1, p0, Ll/kwy0;->L:F

    .line 94
    .line 95
    iput p2, p0, Ll/kwy0;->P:I

    .line 96
    .line 97
    iput p2, p0, Ll/kwy0;->I0:I

    .line 98
    .line 99
    const/4 p1, -0x1

    .line 100
    iput p1, p0, Ll/kwy0;->X:I

    .line 101
    .line 102
    iput p1, p0, Ll/kwy0;->Y:I

    .line 103
    .line 104
    iput-wide p3, p0, Ll/kwy0;->W:J

    .line 105
    .line 106
    iput-wide p3, p0, Ll/kwy0;->O0:J

    .line 107
    .line 108
    iput-wide p3, p0, Ll/kwy0;->P0:J

    .line 109
    .line 110
    iput-wide p3, p0, Ll/kwy0;->V0:J

    .line 111
    .line 112
    iput p2, p0, Ll/kwy0;->J0:I

    .line 113
    .line 114
    iput p2, p0, Ll/kwy0;->K0:I

    .line 115
    .line 116
    new-instance p1, Ll/vwx0;

    .line 117
    .line 118
    invoke-direct {p1}, Ll/vwx0;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 122
    .line 123
    return-void
.end method

.method public static e0(Ll/sqr0;)Z
    .locals 0

    .line 1
    iget p0, p0, Ll/sqr0;->F:I

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x1

    .line 8
    return p0
.end method

.method private final h0()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/kwy0;->Y:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/kwy0;->Z:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    return-void
.end method

.method private final j0()V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        value = 0x17
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kwy0;->Y0:Ll/juy0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/kwy0;->X0:Ll/juy0;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/kwy0;->J0:I

    .line 10
    .line 11
    iput v0, p0, Ll/kwy0;->K0:I

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public A()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Ll/kwy0;->t0()V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/kwy0;->W()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/kwy0;->Y0:Ll/juy0;

    .line 9
    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception v1

    .line 12
    iput-object v0, p0, Ll/kwy0;->Y0:Ll/juy0;

    .line 13
    .line 14
    throw v1
.end method

.method public abstract A0(Ljava/lang/String;Ll/xvy0;JJ)V
.end method

.method public abstract B0(Ljava/lang/String;)V
.end method

.method public abstract C0(Ll/sqr0;Landroid/media/MediaFormat;)V
    .param p2    # Landroid/media/MediaFormat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation
.end method

.method public final D([Ll/sqr0;JJLl/kzy0;)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/kwy0;->U0:Ll/jwy0;

    .line 2
    .line 3
    iget-wide v0, p1, Ll/jwy0;->c:J

    .line 4
    .line 5
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long p1, v0, v2

    .line 11
    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    new-instance v4, Ll/jwy0;

    .line 15
    .line 16
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    move-wide v7, p2

    .line 22
    move-wide/from16 v9, p4

    .line 23
    .line 24
    invoke-direct/range {v4 .. v10}, Ll/jwy0;-><init>(JJJ)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, v4}, Ll/kwy0;->i0(Ll/jwy0;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p1, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    iget-wide v0, p0, Ll/kwy0;->O0:J

    .line 40
    .line 41
    cmp-long p1, v0, v2

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iget-wide v4, p0, Ll/kwy0;->V0:J

    .line 46
    .line 47
    cmp-long p1, v4, v2

    .line 48
    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    cmp-long p1, v4, v0

    .line 52
    .line 53
    if-ltz p1, :cond_3

    .line 54
    .line 55
    :cond_1
    new-instance v5, Ll/jwy0;

    .line 56
    .line 57
    const-wide v6, -0x7fffffffffffffffL    # -4.9E-324

    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    move-wide v8, p2

    .line 63
    move-wide/from16 v10, p4

    .line 64
    .line 65
    invoke-direct/range {v5 .. v11}, Ll/jwy0;-><init>(JJJ)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v5}, Ll/kwy0;->i0(Ll/jwy0;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ll/kwy0;->U0:Ll/jwy0;

    .line 72
    .line 73
    iget-wide p1, p1, Ll/jwy0;->c:J

    .line 74
    .line 75
    cmp-long p1, p1, v2

    .line 76
    .line 77
    if-eqz p1, :cond_2

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/kwy0;->E0()V

    .line 80
    .line 81
    .line 82
    :cond_2
    return-void

    .line 83
    :cond_3
    iget-object p1, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 84
    .line 85
    new-instance v5, Ll/jwy0;

    .line 86
    .line 87
    iget-wide v6, p0, Ll/kwy0;->O0:J

    .line 88
    .line 89
    move-wide v8, p2

    .line 90
    move-wide/from16 v10, p4

    .line 91
    .line 92
    invoke-direct/range {v5 .. v11}, Ll/jwy0;-><init>(JJJ)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v5}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final D0(Ll/hwy0;Landroid/media/MediaCrypto;)V
    .locals 20
    .param p2    # Landroid/media/MediaCrypto;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "createCodec:"

    .line 6
    .line 7
    iget-object v3, v0, Ll/kwy0;->B:Ll/sqr0;

    .line 8
    .line 9
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    .line 11
    .line 12
    iget-object v4, v1, Ll/hwy0;->a:Ljava/lang/String;

    .line 13
    .line 14
    sget v5, Ll/mpw0;->a:I

    .line 15
    .line 16
    const/16 v7, 0x17

    .line 17
    .line 18
    if-ge v5, v7, :cond_0

    .line 19
    .line 20
    const/high16 v8, -0x40800000    # -1.0f

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget v8, v0, Ll/kwy0;->G:F

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/qwx0;->F()[Ll/sqr0;

    .line 26
    .line 27
    .line 28
    move-result-object v9

    .line 29
    invoke-virtual {v0, v8, v3, v9}, Ll/kwy0;->T(FLl/sqr0;[Ll/sqr0;)F

    .line 30
    .line 31
    .line 32
    move-result v8

    .line 33
    :goto_0
    iget v9, v0, Ll/kwy0;->t:F

    .line 34
    .line 35
    cmpg-float v9, v8, v9

    .line 36
    .line 37
    if-gtz v9, :cond_1

    .line 38
    .line 39
    const/high16 v8, -0x40800000    # -1.0f

    .line 40
    .line 41
    :cond_1
    invoke-virtual {v0, v3}, Ll/kwy0;->V(Ll/sqr0;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ll/qwx0;->L()Ll/mfv0;

    .line 45
    .line 46
    .line 47
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 48
    .line 49
    .line 50
    move-result-wide v9

    .line 51
    const/4 v11, 0x0

    .line 52
    invoke-virtual {v0, v1, v3, v11, v8}, Ll/kwy0;->v0(Ll/hwy0;Ll/sqr0;Landroid/media/MediaCrypto;F)Ll/xvy0;

    .line 53
    .line 54
    .line 55
    move-result-object v12

    .line 56
    const/16 v13, 0x1f

    .line 57
    .line 58
    if-lt v5, v13, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/qwx0;->O()Ll/voy0;

    .line 61
    .line 62
    .line 63
    move-result-object v14

    .line 64
    invoke-static {v12, v14}, Ll/iwy0;->a(Ll/xvy0;Ll/voy0;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    :try_start_0
    new-instance v14, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v14, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v14

    .line 79
    invoke-static {v14}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const/4 v14, 0x0

    .line 83
    const/4 v15, 0x1

    .line 84
    if-lt v5, v7, :cond_3

    .line 85
    .line 86
    if-lt v5, v13, :cond_3

    .line 87
    .line 88
    iget-object v2, v12, Ll/xvy0;->c:Ll/sqr0;

    .line 89
    .line 90
    iget-object v2, v2, Ll/sqr0;->l:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v2}, Ll/a8t0;->b(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    invoke-static {v2}, Ll/mpw0;->b(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    const-string v11, "Creating an asynchronous MediaCodec adapter for track type "

    .line 101
    .line 102
    invoke-virtual {v11, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    const-string v11, "DMCodecAdapterFactory"

    .line 107
    .line 108
    invoke-static {v11, v5}, Ll/y4w0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    new-instance v5, Ll/fvy0;

    .line 112
    .line 113
    invoke-direct {v5, v2}, Ll/fvy0;-><init>(I)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v5, v15}, Ll/fvy0;->d(Z)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {v5, v12}, Ll/fvy0;->c(Ll/xvy0;)Ll/ivy0;

    .line 120
    .line 121
    .line 122
    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    goto :goto_1

    .line 124
    :cond_3
    :try_start_1
    iget-object v5, v12, Ll/xvy0;->a:Ll/hwy0;

    .line 125
    .line 126
    iget-object v5, v5, Ll/hwy0;->a:Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v2, v5}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    invoke-static {v2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v5}, Landroid/media/MediaCodec;->createByCodecName(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 140
    .line 141
    .line 142
    :try_start_2
    const-string v5, "configureCodec"

    .line 143
    .line 144
    invoke-static {v5}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    iget-object v5, v12, Ll/xvy0;->b:Landroid/media/MediaFormat;

    .line 148
    .line 149
    iget-object v13, v12, Ll/xvy0;->d:Landroid/view/Surface;

    .line 150
    .line 151
    invoke-virtual {v2, v5, v13, v11, v14}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 152
    .line 153
    .line 154
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 155
    .line 156
    .line 157
    const-string v5, "startCodec"

    .line 158
    .line 159
    invoke-static {v5}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {v2}, Landroid/media/MediaCodec;->start()V

    .line 163
    .line 164
    .line 165
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 166
    .line 167
    .line 168
    new-instance v5, Ll/qxy0;

    .line 169
    .line 170
    invoke-direct {v5, v2, v11}, Ll/qxy0;-><init>(Landroid/media/MediaCodec;Ll/pxy0;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 171
    .line 172
    .line 173
    move-object v2, v5

    .line 174
    :goto_1
    :try_start_3
    iput-object v2, v0, Ll/kwy0;->H:Ll/bwy0;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 175
    .line 176
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 177
    .line 178
    .line 179
    invoke-virtual {v0}, Ll/qwx0;->L()Ll/mfv0;

    .line 180
    .line 181
    .line 182
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 183
    .line 184
    .line 185
    move-result-wide v16

    .line 186
    invoke-virtual {v1, v3}, Ll/hwy0;->e(Ll/sqr0;)Z

    .line 187
    .line 188
    .line 189
    move-result v2

    .line 190
    if-nez v2, :cond_29

    .line 191
    .line 192
    new-instance v2, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .line 196
    .line 197
    const-string v11, "id="

    .line 198
    .line 199
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    .line 201
    .line 202
    iget-object v11, v3, Ll/sqr0;->a:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    const-string v11, ", mimeType="

    .line 208
    .line 209
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    iget-object v11, v3, Ll/sqr0;->l:Ljava/lang/String;

    .line 213
    .line 214
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    iget-object v11, v3, Ll/sqr0;->k:Ljava/lang/String;

    .line 218
    .line 219
    if-eqz v11, :cond_4

    .line 220
    .line 221
    const-string v11, ", container="

    .line 222
    .line 223
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    iget-object v11, v3, Ll/sqr0;->k:Ljava/lang/String;

    .line 227
    .line 228
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    :cond_4
    iget v11, v3, Ll/sqr0;->h:I

    .line 232
    .line 233
    const/4 v13, -0x1

    .line 234
    if-eq v11, v13, :cond_5

    .line 235
    .line 236
    const-string v11, ", bitrate="

    .line 237
    .line 238
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 239
    .line 240
    .line 241
    iget v11, v3, Ll/sqr0;->h:I

    .line 242
    .line 243
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    :cond_5
    iget-object v11, v3, Ll/sqr0;->i:Ljava/lang/String;

    .line 247
    .line 248
    if-eqz v11, :cond_6

    .line 249
    .line 250
    const-string v11, ", codecs="

    .line 251
    .line 252
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    iget-object v11, v3, Ll/sqr0;->i:Ljava/lang/String;

    .line 256
    .line 257
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    :cond_6
    iget-object v11, v3, Ll/sqr0;->o:Lcom/google/android/gms/internal/ads/zzae;

    .line 261
    .line 262
    const/high16 p2, -0x40800000    # -1.0f

    .line 263
    .line 264
    const-string v6, ","

    .line 265
    .line 266
    if-eqz v11, :cond_d

    .line 267
    .line 268
    new-instance v11, Ljava/util/LinkedHashSet;

    .line 269
    .line 270
    invoke-direct {v11}, Ljava/util/LinkedHashSet;-><init>()V

    .line 271
    .line 272
    .line 273
    move/from16 v18, v15

    .line 274
    .line 275
    :goto_2
    iget-object v15, v3, Ll/sqr0;->o:Lcom/google/android/gms/internal/ads/zzae;

    .line 276
    .line 277
    const/16 v19, 0x2

    .line 278
    .line 279
    iget v5, v15, Lcom/google/android/gms/internal/ads/zzae;->zzb:I

    .line 280
    .line 281
    if-ge v14, v5, :cond_c

    .line 282
    .line 283
    invoke-virtual {v15, v14}, Lcom/google/android/gms/internal/ads/zzae;->a(I)Lcom/google/android/gms/internal/ads/zzad;

    .line 284
    .line 285
    .line 286
    move-result-object v5

    .line 287
    iget-object v5, v5, Lcom/google/android/gms/internal/ads/zzad;->zza:Ljava/util/UUID;

    .line 288
    .line 289
    sget-object v15, Ll/cly0;->b:Ljava/util/UUID;

    .line 290
    .line 291
    invoke-virtual {v5, v15}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result v15

    .line 295
    if-eqz v15, :cond_7

    .line 296
    .line 297
    const-string v5, "cenc"

    .line 298
    .line 299
    invoke-interface {v11, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    goto :goto_3

    .line 303
    :cond_7
    sget-object v15, Ll/cly0;->c:Ljava/util/UUID;

    .line 304
    .line 305
    invoke-virtual {v5, v15}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v15

    .line 309
    if-eqz v15, :cond_8

    .line 310
    .line 311
    const-string v5, "clearkey"

    .line 312
    .line 313
    invoke-interface {v11, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    goto :goto_3

    .line 317
    :cond_8
    sget-object v15, Ll/cly0;->e:Ljava/util/UUID;

    .line 318
    .line 319
    invoke-virtual {v5, v15}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result v15

    .line 323
    if-eqz v15, :cond_9

    .line 324
    .line 325
    const-string v5, "playready"

    .line 326
    .line 327
    invoke-interface {v11, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    goto :goto_3

    .line 331
    :cond_9
    sget-object v15, Ll/cly0;->d:Ljava/util/UUID;

    .line 332
    .line 333
    invoke-virtual {v5, v15}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result v15

    .line 337
    if-eqz v15, :cond_a

    .line 338
    .line 339
    const-string v5, "widevine"

    .line 340
    .line 341
    invoke-interface {v11, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 342
    .line 343
    .line 344
    goto :goto_3

    .line 345
    :cond_a
    sget-object v15, Ll/cly0;->a:Ljava/util/UUID;

    .line 346
    .line 347
    invoke-virtual {v5, v15}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result v15

    .line 351
    if-eqz v15, :cond_b

    .line 352
    .line 353
    const-string v5, "universal"

    .line 354
    .line 355
    invoke-interface {v11, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 356
    .line 357
    .line 358
    goto :goto_3

    .line 359
    :cond_b
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v5

    .line 363
    new-instance v15, Ljava/lang/StringBuilder;

    .line 364
    .line 365
    const-string v7, "unknown ("

    .line 366
    .line 367
    invoke-direct {v15, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 368
    .line 369
    .line 370
    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    const-string v5, ")"

    .line 374
    .line 375
    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object v5

    .line 382
    invoke-interface {v11, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    :goto_3
    add-int/lit8 v14, v14, 0x1

    .line 386
    .line 387
    const/16 v7, 0x17

    .line 388
    .line 389
    goto :goto_2

    .line 390
    :cond_c
    const-string v5, ", drm=["

    .line 391
    .line 392
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    .line 394
    .line 395
    invoke-static {v2, v11, v6}, Ll/fow0;->b(Ljava/lang/StringBuilder;Ljava/lang/Iterable;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    const/16 v5, 0x5d

    .line 399
    .line 400
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 401
    .line 402
    .line 403
    goto :goto_4

    .line 404
    :cond_d
    move/from16 v18, v15

    .line 405
    .line 406
    const/16 v19, 0x2

    .line 407
    .line 408
    :goto_4
    iget v5, v3, Ll/sqr0;->q:I

    .line 409
    .line 410
    if-eq v5, v13, :cond_e

    .line 411
    .line 412
    iget v5, v3, Ll/sqr0;->r:I

    .line 413
    .line 414
    if-eq v5, v13, :cond_e

    .line 415
    .line 416
    const-string v5, ", res="

    .line 417
    .line 418
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 419
    .line 420
    .line 421
    iget v5, v3, Ll/sqr0;->q:I

    .line 422
    .line 423
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 424
    .line 425
    .line 426
    const-string v5, "x"

    .line 427
    .line 428
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 429
    .line 430
    .line 431
    iget v5, v3, Ll/sqr0;->r:I

    .line 432
    .line 433
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 434
    .line 435
    .line 436
    :cond_e
    iget-object v5, v3, Ll/sqr0;->x:Ll/wwy0;

    .line 437
    .line 438
    if-eqz v5, :cond_10

    .line 439
    .line 440
    invoke-virtual {v5}, Ll/wwy0;->e()Z

    .line 441
    .line 442
    .line 443
    move-result v7

    .line 444
    if-nez v7, :cond_f

    .line 445
    .line 446
    invoke-virtual {v5}, Ll/wwy0;->f()Z

    .line 447
    .line 448
    .line 449
    move-result v5

    .line 450
    if-eqz v5, :cond_10

    .line 451
    .line 452
    :cond_f
    const-string v5, ", color="

    .line 453
    .line 454
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    .line 456
    .line 457
    iget-object v5, v3, Ll/sqr0;->x:Ll/wwy0;

    .line 458
    .line 459
    invoke-virtual {v5}, Ll/wwy0;->d()Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object v5

    .line 463
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    .line 465
    .line 466
    :cond_10
    iget v5, v3, Ll/sqr0;->s:F

    .line 467
    .line 468
    cmpl-float v5, v5, p2

    .line 469
    .line 470
    if-eqz v5, :cond_11

    .line 471
    .line 472
    const-string v5, ", fps="

    .line 473
    .line 474
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 475
    .line 476
    .line 477
    iget v5, v3, Ll/sqr0;->s:F

    .line 478
    .line 479
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 480
    .line 481
    .line 482
    :cond_11
    iget v5, v3, Ll/sqr0;->y:I

    .line 483
    .line 484
    if-eq v5, v13, :cond_12

    .line 485
    .line 486
    const-string v5, ", channels="

    .line 487
    .line 488
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 489
    .line 490
    .line 491
    iget v5, v3, Ll/sqr0;->y:I

    .line 492
    .line 493
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 494
    .line 495
    .line 496
    :cond_12
    iget v5, v3, Ll/sqr0;->z:I

    .line 497
    .line 498
    if-eq v5, v13, :cond_13

    .line 499
    .line 500
    const-string v5, ", sample_rate="

    .line 501
    .line 502
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 503
    .line 504
    .line 505
    iget v5, v3, Ll/sqr0;->z:I

    .line 506
    .line 507
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 508
    .line 509
    .line 510
    :cond_13
    iget-object v5, v3, Ll/sqr0;->c:Ljava/lang/String;

    .line 511
    .line 512
    if-eqz v5, :cond_14

    .line 513
    .line 514
    const-string v5, ", language="

    .line 515
    .line 516
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 517
    .line 518
    .line 519
    iget-object v5, v3, Ll/sqr0;->c:Ljava/lang/String;

    .line 520
    .line 521
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 522
    .line 523
    .line 524
    :cond_14
    iget-object v5, v3, Ll/sqr0;->b:Ljava/lang/String;

    .line 525
    .line 526
    if-eqz v5, :cond_15

    .line 527
    .line 528
    const-string v5, ", label="

    .line 529
    .line 530
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 531
    .line 532
    .line 533
    iget-object v5, v3, Ll/sqr0;->b:Ljava/lang/String;

    .line 534
    .line 535
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 536
    .line 537
    .line 538
    :cond_15
    iget v5, v3, Ll/sqr0;->d:I

    .line 539
    .line 540
    const-string v7, "]"

    .line 541
    .line 542
    if-eqz v5, :cond_18

    .line 543
    .line 544
    const-string v5, ", selectionFlags=["

    .line 545
    .line 546
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 547
    .line 548
    .line 549
    iget v5, v3, Ll/sqr0;->d:I

    .line 550
    .line 551
    new-instance v11, Ljava/util/ArrayList;

    .line 552
    .line 553
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 554
    .line 555
    .line 556
    and-int/lit8 v13, v5, 0x1

    .line 557
    .line 558
    if-eqz v13, :cond_16

    .line 559
    .line 560
    const-string v13, "default"

    .line 561
    .line 562
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 563
    .line 564
    .line 565
    :cond_16
    and-int/lit8 v5, v5, 0x2

    .line 566
    .line 567
    if-eqz v5, :cond_17

    .line 568
    .line 569
    const-string v5, "forced"

    .line 570
    .line 571
    invoke-interface {v11, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 572
    .line 573
    .line 574
    :cond_17
    invoke-static {v2, v11, v6}, Ll/fow0;->b(Ljava/lang/StringBuilder;Ljava/lang/Iterable;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    .line 576
    .line 577
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 578
    .line 579
    .line 580
    :cond_18
    iget v5, v3, Ll/sqr0;->e:I

    .line 581
    .line 582
    if-eqz v5, :cond_28

    .line 583
    .line 584
    const-string v5, ", roleFlags=["

    .line 585
    .line 586
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    .line 588
    .line 589
    iget v5, v3, Ll/sqr0;->e:I

    .line 590
    .line 591
    new-instance v11, Ljava/util/ArrayList;

    .line 592
    .line 593
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 594
    .line 595
    .line 596
    and-int/lit8 v13, v5, 0x1

    .line 597
    .line 598
    if-eqz v13, :cond_19

    .line 599
    .line 600
    const-string v13, "main"

    .line 601
    .line 602
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 603
    .line 604
    .line 605
    :cond_19
    and-int/lit8 v13, v5, 0x2

    .line 606
    .line 607
    if-eqz v13, :cond_1a

    .line 608
    .line 609
    const-string v13, "alt"

    .line 610
    .line 611
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 612
    .line 613
    .line 614
    :cond_1a
    and-int/lit8 v13, v5, 0x4

    .line 615
    .line 616
    if-eqz v13, :cond_1b

    .line 617
    .line 618
    const-string v13, "supplementary"

    .line 619
    .line 620
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 621
    .line 622
    .line 623
    :cond_1b
    and-int/lit8 v13, v5, 0x8

    .line 624
    .line 625
    if-eqz v13, :cond_1c

    .line 626
    .line 627
    const-string v13, "commentary"

    .line 628
    .line 629
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 630
    .line 631
    .line 632
    :cond_1c
    and-int/lit8 v13, v5, 0x10

    .line 633
    .line 634
    if-eqz v13, :cond_1d

    .line 635
    .line 636
    const-string v13, "dub"

    .line 637
    .line 638
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 639
    .line 640
    .line 641
    :cond_1d
    and-int/lit8 v13, v5, 0x20

    .line 642
    .line 643
    if-eqz v13, :cond_1e

    .line 644
    .line 645
    const-string v13, "emergency"

    .line 646
    .line 647
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 648
    .line 649
    .line 650
    :cond_1e
    and-int/lit8 v13, v5, 0x40

    .line 651
    .line 652
    if-eqz v13, :cond_1f

    .line 653
    .line 654
    const-string v13, "caption"

    .line 655
    .line 656
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 657
    .line 658
    .line 659
    :cond_1f
    and-int/lit16 v13, v5, 0x80

    .line 660
    .line 661
    if-eqz v13, :cond_20

    .line 662
    .line 663
    const-string v13, "subtitle"

    .line 664
    .line 665
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 666
    .line 667
    .line 668
    :cond_20
    and-int/lit16 v13, v5, 0x100

    .line 669
    .line 670
    if-eqz v13, :cond_21

    .line 671
    .line 672
    const-string v13, "sign"

    .line 673
    .line 674
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 675
    .line 676
    .line 677
    :cond_21
    and-int/lit16 v13, v5, 0x200

    .line 678
    .line 679
    if-eqz v13, :cond_22

    .line 680
    .line 681
    const-string v13, "describes-video"

    .line 682
    .line 683
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 684
    .line 685
    .line 686
    :cond_22
    and-int/lit16 v13, v5, 0x400

    .line 687
    .line 688
    if-eqz v13, :cond_23

    .line 689
    .line 690
    const-string v13, "describes-music"

    .line 691
    .line 692
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 693
    .line 694
    .line 695
    :cond_23
    and-int/lit16 v13, v5, 0x800

    .line 696
    .line 697
    if-eqz v13, :cond_24

    .line 698
    .line 699
    const-string v13, "enhanced-intelligibility"

    .line 700
    .line 701
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 702
    .line 703
    .line 704
    :cond_24
    and-int/lit16 v13, v5, 0x1000

    .line 705
    .line 706
    if-eqz v13, :cond_25

    .line 707
    .line 708
    const-string v13, "transcribes-dialog"

    .line 709
    .line 710
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 711
    .line 712
    .line 713
    :cond_25
    and-int/lit16 v13, v5, 0x2000

    .line 714
    .line 715
    if-eqz v13, :cond_26

    .line 716
    .line 717
    const-string v13, "easy-read"

    .line 718
    .line 719
    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 720
    .line 721
    .line 722
    :cond_26
    and-int/lit16 v5, v5, 0x4000

    .line 723
    .line 724
    if-eqz v5, :cond_27

    .line 725
    .line 726
    const-string v5, "trick-play"

    .line 727
    .line 728
    invoke-interface {v11, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 729
    .line 730
    .line 731
    :cond_27
    invoke-static {v2, v11, v6}, Ll/fow0;->b(Ljava/lang/StringBuilder;Ljava/lang/Iterable;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 732
    .line 733
    .line 734
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 735
    .line 736
    .line 737
    :cond_28
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 738
    .line 739
    .line 740
    move-result-object v2

    .line 741
    filled-new-array {v2, v4}, [Ljava/lang/Object;

    .line 742
    .line 743
    .line 744
    move-result-object v2

    .line 745
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 746
    .line 747
    const-string v6, "Format exceeds selected codec\'s capabilities [%s, %s]"

    .line 748
    .line 749
    invoke-static {v5, v6, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 750
    .line 751
    .line 752
    move-result-object v2

    .line 753
    const-string v5, "MediaCodecRenderer"

    .line 754
    .line 755
    invoke-static {v5, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 756
    .line 757
    .line 758
    goto :goto_5

    .line 759
    :cond_29
    move/from16 v18, v15

    .line 760
    .line 761
    const/16 v19, 0x2

    .line 762
    .line 763
    :goto_5
    iput-object v1, v0, Ll/kwy0;->O:Ll/hwy0;

    .line 764
    .line 765
    iput v8, v0, Ll/kwy0;->L:F

    .line 766
    .line 767
    iput-object v3, v0, Ll/kwy0;->I:Ll/sqr0;

    .line 768
    .line 769
    sget v2, Ll/mpw0;->a:I

    .line 770
    .line 771
    const/16 v3, 0x19

    .line 772
    .line 773
    if-gt v2, v3, :cond_2b

    .line 774
    .line 775
    const-string v5, "OMX.Exynos.avc.dec.secure"

    .line 776
    .line 777
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 778
    .line 779
    .line 780
    move-result v5

    .line 781
    if-eqz v5, :cond_2b

    .line 782
    .line 783
    sget-object v5, Ll/mpw0;->d:Ljava/lang/String;

    .line 784
    .line 785
    const-string v6, "SM-T585"

    .line 786
    .line 787
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 788
    .line 789
    .line 790
    move-result v6

    .line 791
    if-nez v6, :cond_2a

    .line 792
    .line 793
    const-string v6, "SM-A510"

    .line 794
    .line 795
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 796
    .line 797
    .line 798
    move-result v6

    .line 799
    if-nez v6, :cond_2a

    .line 800
    .line 801
    const-string v6, "SM-A520"

    .line 802
    .line 803
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 804
    .line 805
    .line 806
    move-result v6

    .line 807
    if-nez v6, :cond_2a

    .line 808
    .line 809
    const-string v6, "SM-J700"

    .line 810
    .line 811
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 812
    .line 813
    .line 814
    move-result v5

    .line 815
    if-eqz v5, :cond_2b

    .line 816
    .line 817
    :cond_2a
    move/from16 v5, v19

    .line 818
    .line 819
    goto :goto_7

    .line 820
    :cond_2b
    const/16 v5, 0x18

    .line 821
    .line 822
    if-ge v2, v5, :cond_2c

    .line 823
    .line 824
    const-string v5, "OMX.Nvidia.h264.decode"

    .line 825
    .line 826
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 827
    .line 828
    .line 829
    move-result v5

    .line 830
    if-nez v5, :cond_2d

    .line 831
    .line 832
    const-string v5, "OMX.Nvidia.h264.decode.secure"

    .line 833
    .line 834
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 835
    .line 836
    .line 837
    move-result v5

    .line 838
    if-eqz v5, :cond_2c

    .line 839
    .line 840
    goto :goto_6

    .line 841
    :cond_2c
    const/4 v5, 0x0

    .line 842
    goto :goto_7

    .line 843
    :cond_2d
    :goto_6
    sget-object v5, Ll/mpw0;->b:Ljava/lang/String;

    .line 844
    .line 845
    const-string v6, "flounder"

    .line 846
    .line 847
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 848
    .line 849
    .line 850
    move-result v6

    .line 851
    if-nez v6, :cond_2e

    .line 852
    .line 853
    const-string v6, "flounder_lte"

    .line 854
    .line 855
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 856
    .line 857
    .line 858
    move-result v6

    .line 859
    if-nez v6, :cond_2e

    .line 860
    .line 861
    const-string v6, "grouper"

    .line 862
    .line 863
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 864
    .line 865
    .line 866
    move-result v6

    .line 867
    if-nez v6, :cond_2e

    .line 868
    .line 869
    const-string v6, "tilapia"

    .line 870
    .line 871
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 872
    .line 873
    .line 874
    move-result v5

    .line 875
    if-eqz v5, :cond_2c

    .line 876
    .line 877
    :cond_2e
    move/from16 v5, v18

    .line 878
    .line 879
    :goto_7
    iput v5, v0, Ll/kwy0;->P:I

    .line 880
    .line 881
    iget-object v5, v0, Ll/kwy0;->I:Ll/sqr0;

    .line 882
    .line 883
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 884
    .line 885
    .line 886
    const/16 v5, 0x1d

    .line 887
    .line 888
    if-ne v2, v5, :cond_2f

    .line 889
    .line 890
    const-string v6, "c2.android.aac.decoder"

    .line 891
    .line 892
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 893
    .line 894
    .line 895
    move-result v6

    .line 896
    if-eqz v6, :cond_2f

    .line 897
    .line 898
    move/from16 v6, v18

    .line 899
    .line 900
    goto :goto_8

    .line 901
    :cond_2f
    const/4 v6, 0x0

    .line 902
    :goto_8
    iput-boolean v6, v0, Ll/kwy0;->Q:Z

    .line 903
    .line 904
    const/16 v6, 0x17

    .line 905
    .line 906
    if-gt v2, v6, :cond_30

    .line 907
    .line 908
    const-string v6, "OMX.google.vorbis.decoder"

    .line 909
    .line 910
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 911
    .line 912
    .line 913
    move-result v6

    .line 914
    if-nez v6, :cond_31

    .line 915
    .line 916
    :cond_30
    const/4 v6, 0x0

    .line 917
    goto :goto_9

    .line 918
    :cond_31
    move/from16 v6, v18

    .line 919
    .line 920
    :goto_9
    iput-boolean v6, v0, Ll/kwy0;->R:Z

    .line 921
    .line 922
    const/16 v6, 0x15

    .line 923
    .line 924
    if-ne v2, v6, :cond_32

    .line 925
    .line 926
    const-string v6, "OMX.google.aac.decoder"

    .line 927
    .line 928
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 929
    .line 930
    .line 931
    move-result v6

    .line 932
    if-eqz v6, :cond_32

    .line 933
    .line 934
    move/from16 v6, v18

    .line 935
    .line 936
    goto :goto_a

    .line 937
    :cond_32
    const/4 v6, 0x0

    .line 938
    :goto_a
    iput-boolean v6, v0, Ll/kwy0;->S:Z

    .line 939
    .line 940
    iget-object v6, v0, Ll/kwy0;->I:Ll/sqr0;

    .line 941
    .line 942
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 943
    .line 944
    .line 945
    iget-object v6, v1, Ll/hwy0;->a:Ljava/lang/String;

    .line 946
    .line 947
    if-gt v2, v3, :cond_34

    .line 948
    .line 949
    const-string v3, "OMX.rk.video_decoder.avc"

    .line 950
    .line 951
    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 952
    .line 953
    .line 954
    move-result v3

    .line 955
    if-nez v3, :cond_33

    .line 956
    .line 957
    goto :goto_c

    .line 958
    :cond_33
    :goto_b
    move/from16 v14, v18

    .line 959
    .line 960
    goto :goto_d

    .line 961
    :cond_34
    :goto_c
    if-gt v2, v5, :cond_35

    .line 962
    .line 963
    const-string v2, "OMX.broadcom.video_decoder.tunnel"

    .line 964
    .line 965
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 966
    .line 967
    .line 968
    move-result v2

    .line 969
    if-nez v2, :cond_33

    .line 970
    .line 971
    const-string v2, "OMX.broadcom.video_decoder.tunnel.secure"

    .line 972
    .line 973
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 974
    .line 975
    .line 976
    move-result v2

    .line 977
    if-nez v2, :cond_33

    .line 978
    .line 979
    const-string v2, "OMX.bcm.vdec.avc.tunnel"

    .line 980
    .line 981
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 982
    .line 983
    .line 984
    move-result v2

    .line 985
    if-nez v2, :cond_33

    .line 986
    .line 987
    const-string v2, "OMX.bcm.vdec.avc.tunnel.secure"

    .line 988
    .line 989
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 990
    .line 991
    .line 992
    move-result v2

    .line 993
    if-nez v2, :cond_33

    .line 994
    .line 995
    const-string v2, "OMX.bcm.vdec.hevc.tunnel"

    .line 996
    .line 997
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 998
    .line 999
    .line 1000
    move-result v2

    .line 1001
    if-nez v2, :cond_33

    .line 1002
    .line 1003
    const-string v2, "OMX.bcm.vdec.hevc.tunnel.secure"

    .line 1004
    .line 1005
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1006
    .line 1007
    .line 1008
    move-result v2

    .line 1009
    if-nez v2, :cond_33

    .line 1010
    .line 1011
    :cond_35
    const-string v2, "Amazon"

    .line 1012
    .line 1013
    sget-object v3, Ll/mpw0;->c:Ljava/lang/String;

    .line 1014
    .line 1015
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1016
    .line 1017
    .line 1018
    move-result v2

    .line 1019
    if-eqz v2, :cond_36

    .line 1020
    .line 1021
    const-string v2, "AFTS"

    .line 1022
    .line 1023
    sget-object v3, Ll/mpw0;->d:Ljava/lang/String;

    .line 1024
    .line 1025
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1026
    .line 1027
    .line 1028
    move-result v2

    .line 1029
    if-eqz v2, :cond_36

    .line 1030
    .line 1031
    iget-boolean v1, v1, Ll/hwy0;->f:Z

    .line 1032
    .line 1033
    if-eqz v1, :cond_36

    .line 1034
    .line 1035
    goto :goto_b

    .line 1036
    :cond_36
    const/4 v14, 0x0

    .line 1037
    :goto_d
    iput-boolean v14, v0, Ll/kwy0;->V:Z

    .line 1038
    .line 1039
    iget-object v1, v0, Ll/kwy0;->H:Ll/bwy0;

    .line 1040
    .line 1041
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1042
    .line 1043
    .line 1044
    invoke-virtual {v0}, Ll/qwx0;->s()I

    .line 1045
    .line 1046
    .line 1047
    move-result v1

    .line 1048
    move/from16 v2, v19

    .line 1049
    .line 1050
    if-ne v1, v2, :cond_37

    .line 1051
    .line 1052
    invoke-virtual {v0}, Ll/qwx0;->L()Ll/mfv0;

    .line 1053
    .line 1054
    .line 1055
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 1056
    .line 1057
    .line 1058
    move-result-wide v1

    .line 1059
    const-wide/16 v5, 0x3e8

    .line 1060
    .line 1061
    add-long/2addr v1, v5

    .line 1062
    iput-wide v1, v0, Ll/kwy0;->W:J

    .line 1063
    .line 1064
    :cond_37
    iget-object v1, v0, Ll/kwy0;->T0:Ll/vwx0;

    .line 1065
    .line 1066
    iget v2, v1, Ll/vwx0;->a:I

    .line 1067
    .line 1068
    add-int/lit8 v2, v2, 0x1

    .line 1069
    .line 1070
    iput v2, v1, Ll/vwx0;->a:I

    .line 1071
    .line 1072
    sub-long v5, v16, v9

    .line 1073
    .line 1074
    move-object v1, v4

    .line 1075
    move-object v2, v12

    .line 1076
    move-wide/from16 v3, v16

    .line 1077
    .line 1078
    invoke-virtual/range {v0 .. v6}, Ll/kwy0;->A0(Ljava/lang/String;Ll/xvy0;JJ)V

    .line 1079
    .line 1080
    .line 1081
    return-void

    .line 1082
    :catch_0
    move-exception v0

    .line 1083
    goto :goto_e

    .line 1084
    :catch_1
    move-exception v0

    .line 1085
    :goto_e
    move-object v11, v2

    .line 1086
    goto :goto_f

    .line 1087
    :catch_2
    move-exception v0

    .line 1088
    goto :goto_f

    .line 1089
    :catch_3
    move-exception v0

    .line 1090
    :goto_f
    if-eqz v11, :cond_38

    .line 1091
    .line 1092
    :try_start_4
    invoke-virtual {v11}, Landroid/media/MediaCodec;->release()V

    .line 1093
    .line 1094
    .line 1095
    :cond_38
    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1096
    :catchall_0
    move-exception v0

    .line 1097
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 1098
    .line 1099
    .line 1100
    throw v0
.end method

.method public abstract E0()V
.end method

.method public F0()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    return-void
.end method

.method public abstract G0(JJLl/bwy0;Ljava/nio/ByteBuffer;IIIJZZLl/sqr0;)Z
    .param p5    # Ll/bwy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation
.end method

.method public H0(Ll/sqr0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public I0(Ll/evx0;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final J0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/kwy0;->U0:Ll/jwy0;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/jwy0;->c:J

    .line 4
    .line 5
    return-wide v0
.end method

.method public final K0()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/kwy0;->U0:Ll/jwy0;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/jwy0;->b:J

    .line 4
    .line 5
    return-wide v0
.end method

.method public final L0()Ll/bwy0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public M0(Ljava/lang/Throwable;Ll/hwy0;)Lcom/google/android/gms/internal/ads/zzst;
    .locals 0
    .param p2    # Ll/hwy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance p0, Lcom/google/android/gms/internal/ads/zzst;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Lcom/google/android/gms/internal/ads/zzst;-><init>(Ljava/lang/Throwable;Ll/hwy0;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final N0()Ll/hwy0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/kwy0;->O:Ll/hwy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final O0()V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 2
    .line 3
    if-nez v0, :cond_e

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/kwy0;->E0:Z

    .line 6
    .line 7
    if-nez v0, :cond_e

    .line 8
    .line 9
    iget-object v0, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_8

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0, v0}, Ll/kwy0;->c0(Ll/sqr0;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget-object v0, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/kwy0;->t0()V

    .line 25
    .line 26
    .line 27
    iget-object v0, v0, Ll/sqr0;->l:Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, "audio/mp4a-latm"

    .line 30
    .line 31
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    const-string v2, "audio/mpeg"

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    const-string v2, "audio/opus"

    .line 46
    .line 47
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p0, Ll/kwy0;->x:Ll/tvy0;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/tvy0;->o(I)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    iget-object v0, p0, Ll/kwy0;->x:Ll/tvy0;

    .line 60
    .line 61
    const/16 v2, 0x20

    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ll/tvy0;->o(I)V

    .line 64
    .line 65
    .line 66
    :goto_0
    iput-boolean v1, p0, Ll/kwy0;->E0:Z

    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    iget-object v0, p0, Ll/kwy0;->Y0:Ll/juy0;

    .line 70
    .line 71
    iput-object v0, p0, Ll/kwy0;->X0:Ll/juy0;

    .line 72
    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    invoke-static {v1}, Ll/lev0;->f(Z)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Ll/kwy0;->X0:Ll/juy0;

    .line 79
    .line 80
    iget-object v1, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    sget-boolean v1, Ll/zuy0;->a:Z

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/juy0;->a()Lcom/google/android/gms/internal/ads/zzrq;

    .line 88
    .line 89
    .line 90
    :cond_3
    const/4 v0, 0x0

    .line 91
    :try_start_0
    iget-object v1, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 92
    .line 93
    const/4 v2, 0x0

    .line 94
    if-eqz v1, :cond_d

    .line 95
    .line 96
    iget-object v3, p0, Ll/kwy0;->M:Ljava/util/ArrayDeque;
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzsx; {:try_start_0 .. :try_end_0} :catch_0

    .line 97
    .line 98
    if-nez v3, :cond_5

    .line 99
    .line 100
    :try_start_1
    iget-object v3, p0, Ll/kwy0;->s:Ll/dxy0;

    .line 101
    .line 102
    invoke-virtual {p0, v3, v1, v0}, Ll/kwy0;->w0(Ll/dxy0;Ll/sqr0;Z)Ljava/util/List;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 107
    .line 108
    .line 109
    new-instance v4, Ljava/util/ArrayDeque;

    .line 110
    .line 111
    invoke-direct {v4}, Ljava/util/ArrayDeque;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object v4, p0, Ll/kwy0;->M:Ljava/util/ArrayDeque;

    .line 115
    .line 116
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    if-nez v4, :cond_4

    .line 121
    .line 122
    iget-object v4, p0, Ll/kwy0;->M:Ljava/util/ArrayDeque;

    .line 123
    .line 124
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    check-cast v3, Ll/hwy0;

    .line 129
    .line 130
    invoke-virtual {v4, v3}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :catch_0
    move-exception v1

    .line 135
    goto/16 :goto_7

    .line 136
    .line 137
    :catch_1
    move-exception v2

    .line 138
    goto :goto_2

    .line 139
    :cond_4
    :goto_1
    iput-object v2, p0, Ll/kwy0;->N:Lcom/google/android/gms/internal/ads/zzsx;
    :try_end_1
    .catch Lcom/google/android/gms/internal/ads/zzth; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/google/android/gms/internal/ads/zzsx; {:try_start_1 .. :try_end_1} :catch_0

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :goto_2
    :try_start_2
    new-instance v3, Lcom/google/android/gms/internal/ads/zzsx;

    .line 143
    .line 144
    const v4, -0xc34e

    .line 145
    .line 146
    .line 147
    invoke-direct {v3, v1, v2, v0, v4}, Lcom/google/android/gms/internal/ads/zzsx;-><init>(Ll/sqr0;Ljava/lang/Throwable;ZI)V

    .line 148
    .line 149
    .line 150
    throw v3

    .line 151
    :cond_5
    :goto_3
    iget-object v3, p0, Ll/kwy0;->M:Ljava/util/ArrayDeque;

    .line 152
    .line 153
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    if-nez v3, :cond_c

    .line 158
    .line 159
    iget-object v3, p0, Ll/kwy0;->M:Ljava/util/ArrayDeque;

    .line 160
    .line 161
    if-eqz v3, :cond_b

    .line 162
    .line 163
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->peekFirst()Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    check-cast v4, Ll/hwy0;

    .line 168
    .line 169
    :goto_4
    iget-object v5, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 170
    .line 171
    if-nez v5, :cond_a

    .line 172
    .line 173
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->peekFirst()Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v5

    .line 177
    check-cast v5, Ll/hwy0;

    .line 178
    .line 179
    if-eqz v5, :cond_9

    .line 180
    .line 181
    invoke-virtual {p0, v5}, Ll/kwy0;->d0(Ll/hwy0;)Z

    .line 182
    .line 183
    .line 184
    move-result v6
    :try_end_2
    .catch Lcom/google/android/gms/internal/ads/zzsx; {:try_start_2 .. :try_end_2} :catch_0

    .line 185
    if-eqz v6, :cond_e

    .line 186
    .line 187
    :try_start_3
    invoke-virtual {p0, v5, v2}, Ll/kwy0;->D0(Ll/hwy0;Landroid/media/MediaCrypto;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 188
    .line 189
    .line 190
    goto :goto_4

    .line 191
    :catch_2
    move-exception v6

    .line 192
    const-string v7, "MediaCodecRenderer"

    .line 193
    .line 194
    if-ne v5, v4, :cond_6

    .line 195
    .line 196
    :try_start_4
    const-string v6, "Preferred decoder instantiation failed. Sleeping for 50ms then retrying."

    .line 197
    .line 198
    invoke-static {v7, v6}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    const-wide/16 v8, 0x32

    .line 202
    .line 203
    invoke-static {v8, v9}, Ljava/lang/Thread;->sleep(J)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {p0, v5, v2}, Ll/kwy0;->D0(Ll/hwy0;Landroid/media/MediaCrypto;)V

    .line 207
    .line 208
    .line 209
    goto :goto_4

    .line 210
    :catch_3
    move-exception v6

    .line 211
    goto :goto_5

    .line 212
    :cond_6
    throw v6
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 213
    :goto_5
    :try_start_5
    iget-object v8, v5, Ll/hwy0;->a:Ljava/lang/String;

    .line 214
    .line 215
    const-string v9, "Failed to initialize decoder: "

    .line 216
    .line 217
    invoke-virtual {v9, v8}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v8

    .line 221
    invoke-static {v7, v8, v6}, Ll/y4w0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->removeFirst()Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    new-instance v7, Lcom/google/android/gms/internal/ads/zzsx;

    .line 228
    .line 229
    invoke-direct {v7, v1, v6, v0, v5}, Lcom/google/android/gms/internal/ads/zzsx;-><init>(Ll/sqr0;Ljava/lang/Throwable;ZLl/hwy0;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p0, v7}, Ll/kwy0;->z0(Ljava/lang/Exception;)V

    .line 233
    .line 234
    .line 235
    iget-object v5, p0, Ll/kwy0;->N:Lcom/google/android/gms/internal/ads/zzsx;

    .line 236
    .line 237
    if-nez v5, :cond_7

    .line 238
    .line 239
    iput-object v7, p0, Ll/kwy0;->N:Lcom/google/android/gms/internal/ads/zzsx;

    .line 240
    .line 241
    goto :goto_6

    .line 242
    :cond_7
    invoke-static {v5, v7}, Lcom/google/android/gms/internal/ads/zzsx;->zza(Lcom/google/android/gms/internal/ads/zzsx;Lcom/google/android/gms/internal/ads/zzsx;)Lcom/google/android/gms/internal/ads/zzsx;

    .line 243
    .line 244
    .line 245
    move-result-object v5

    .line 246
    iput-object v5, p0, Ll/kwy0;->N:Lcom/google/android/gms/internal/ads/zzsx;

    .line 247
    .line 248
    :goto_6
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 249
    .line 250
    .line 251
    move-result v5

    .line 252
    if-nez v5, :cond_8

    .line 253
    .line 254
    goto :goto_4

    .line 255
    :cond_8
    iget-object v1, p0, Ll/kwy0;->N:Lcom/google/android/gms/internal/ads/zzsx;

    .line 256
    .line 257
    throw v1

    .line 258
    :cond_9
    throw v2

    .line 259
    :cond_a
    iput-object v2, p0, Ll/kwy0;->M:Ljava/util/ArrayDeque;

    .line 260
    .line 261
    goto :goto_8

    .line 262
    :cond_b
    throw v2

    .line 263
    :cond_c
    new-instance v3, Lcom/google/android/gms/internal/ads/zzsx;

    .line 264
    .line 265
    const v4, -0xc34f

    .line 266
    .line 267
    .line 268
    invoke-direct {v3, v1, v2, v0, v4}, Lcom/google/android/gms/internal/ads/zzsx;-><init>(Ll/sqr0;Ljava/lang/Throwable;ZI)V

    .line 269
    .line 270
    .line 271
    throw v3

    .line 272
    :cond_d
    throw v2
    :try_end_5
    .catch Lcom/google/android/gms/internal/ads/zzsx; {:try_start_5 .. :try_end_5} :catch_0

    .line 273
    :goto_7
    iget-object v2, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 274
    .line 275
    const/16 v3, 0xfa1

    .line 276
    .line 277
    invoke-virtual {p0, v1, v2, v0, v3}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    throw p0

    .line 282
    :cond_e
    :goto_8
    return-void
.end method

.method public P()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 3
    .line 4
    sget-object v0, Ll/jwy0;->e:Ll/jwy0;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/kwy0;->i0(Ll/jwy0;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/kwy0;->a0()Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public P0(J)V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iput-wide p1, p0, Ll/kwy0;->V0:J

    .line 2
    .line 3
    :goto_0
    iget-object v0, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/jwy0;

    .line 18
    .line 19
    iget-wide v0, v0, Ll/jwy0;->a:J

    .line 20
    .line 21
    cmp-long v0, p1, v0

    .line 22
    .line 23
    if-ltz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/jwy0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v0}, Ll/kwy0;->i0(Ll/jwy0;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/kwy0;->E0()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    return-void
.end method

.method public Q(ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    new-instance p1, Ll/vwx0;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/vwx0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 7
    .line 8
    return-void
.end method

.method public Q0(Ll/evx0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    return-void
.end method

.method public S(JZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/kwy0;->Q0:Z

    .line 3
    .line 4
    iput-boolean p1, p0, Ll/kwy0;->R0:Z

    .line 5
    .line 6
    iget-boolean p2, p0, Ll/kwy0;->E0:Z

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    iget-object p2, p0, Ll/kwy0;->x:Ll/tvy0;

    .line 11
    .line 12
    invoke-virtual {p2}, Ll/fux0;->b()V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/kwy0;->w:Ll/evx0;

    .line 16
    .line 17
    invoke-virtual {p2}, Ll/fux0;->b()V

    .line 18
    .line 19
    .line 20
    iput-boolean p1, p0, Ll/kwy0;->F0:Z

    .line 21
    .line 22
    iget-object p1, p0, Ll/kwy0;->A:Ll/qty0;

    .line 23
    .line 24
    invoke-virtual {p1}, Ll/qty0;->b()V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-virtual {p0}, Ll/kwy0;->Z()Z

    .line 29
    .line 30
    .line 31
    :goto_0
    iget-object p1, p0, Ll/kwy0;->U0:Ll/jwy0;

    .line 32
    .line 33
    iget-object p1, p1, Ll/jwy0;->d:Ll/imw0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/imw0;->a()I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-lez p2, :cond_1

    .line 40
    .line 41
    const/4 p2, 0x1

    .line 42
    iput-boolean p2, p0, Ll/kwy0;->S0:Z

    .line 43
    .line 44
    :cond_1
    invoke-virtual {p1}, Ll/imw0;->e()V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/ArrayDeque;->clear()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public abstract T(FLl/sqr0;[Ll/sqr0;)F
.end method

.method public abstract U(Ll/dxy0;Ll/sqr0;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation
.end method

.method public V(Ll/sqr0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    return-void
.end method

.method public final W()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 3
    .line 4
    if-eqz v1, :cond_1

    .line 5
    .line 6
    invoke-interface {v1}, Ll/bwy0;->zzl()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 10
    .line 11
    iget v2, v1, Ll/vwx0;->b:I

    .line 12
    .line 13
    add-int/lit8 v2, v2, 0x1

    .line 14
    .line 15
    iput v2, v1, Ll/vwx0;->b:I

    .line 16
    .line 17
    iget-object v1, p0, Ll/kwy0;->O:Ll/hwy0;

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    iget-object v1, v1, Ll/hwy0;->a:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {p0, v1}, Ll/kwy0;->B0(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception v1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    :cond_1
    :goto_0
    iput-object v0, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 31
    .line 32
    iput-object v0, p0, Ll/kwy0;->D:Landroid/media/MediaCrypto;

    .line 33
    .line 34
    iput-object v0, p0, Ll/kwy0;->X0:Ll/juy0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/kwy0;->Y()V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :goto_1
    iput-object v0, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 41
    .line 42
    iput-object v0, p0, Ll/kwy0;->D:Landroid/media/MediaCrypto;

    .line 43
    .line 44
    iput-object v0, p0, Ll/kwy0;->X0:Ll/juy0;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/kwy0;->Y()V

    .line 47
    .line 48
    .line 49
    throw v1
.end method

.method public X()V
    .locals 3
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kwy0;->g0()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/kwy0;->h0()V

    .line 5
    .line 6
    .line 7
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    iput-wide v0, p0, Ll/kwy0;->W:J

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-boolean v2, p0, Ll/kwy0;->M0:Z

    .line 16
    .line 17
    iput-boolean v2, p0, Ll/kwy0;->L0:Z

    .line 18
    .line 19
    iput-boolean v2, p0, Ll/kwy0;->T:Z

    .line 20
    .line 21
    iput-boolean v2, p0, Ll/kwy0;->U:Z

    .line 22
    .line 23
    iput-boolean v2, p0, Ll/kwy0;->k0:Z

    .line 24
    .line 25
    iput-boolean v2, p0, Ll/kwy0;->p0:Z

    .line 26
    .line 27
    iput-wide v0, p0, Ll/kwy0;->O0:J

    .line 28
    .line 29
    iput-wide v0, p0, Ll/kwy0;->P0:J

    .line 30
    .line 31
    iput-wide v0, p0, Ll/kwy0;->V0:J

    .line 32
    .line 33
    iput v2, p0, Ll/kwy0;->J0:I

    .line 34
    .line 35
    iput v2, p0, Ll/kwy0;->K0:I

    .line 36
    .line 37
    iget-boolean v0, p0, Ll/kwy0;->H0:Z

    .line 38
    .line 39
    iput v0, p0, Ll/kwy0;->I0:I

    .line 40
    .line 41
    return-void
.end method

.method public final Y()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kwy0;->X()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/kwy0;->M:Ljava/util/ArrayDeque;

    .line 6
    .line 7
    iput-object v0, p0, Ll/kwy0;->O:Ll/hwy0;

    .line 8
    .line 9
    iput-object v0, p0, Ll/kwy0;->I:Ll/sqr0;

    .line 10
    .line 11
    iput-object v0, p0, Ll/kwy0;->J:Landroid/media/MediaFormat;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Ll/kwy0;->K:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/kwy0;->N0:Z

    .line 17
    .line 18
    const/high16 v1, -0x40800000    # -1.0f

    .line 19
    .line 20
    iput v1, p0, Ll/kwy0;->L:F

    .line 21
    .line 22
    iput v0, p0, Ll/kwy0;->P:I

    .line 23
    .line 24
    iput-boolean v0, p0, Ll/kwy0;->Q:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Ll/kwy0;->R:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Ll/kwy0;->S:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/kwy0;->V:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Ll/kwy0;->H0:Z

    .line 33
    .line 34
    iput v0, p0, Ll/kwy0;->I0:I

    .line 35
    .line 36
    iput-boolean v0, p0, Ll/kwy0;->E:Z

    .line 37
    .line 38
    return-void
.end method

.method public final Z()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/kwy0;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/kwy0;->O0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return v0
.end method

.method public final a0()Z
    .locals 5

    .line 1
    iget-object v0, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget v0, p0, Ll/kwy0;->K0:I

    .line 8
    .line 9
    const/4 v2, 0x3

    .line 10
    const/4 v3, 0x1

    .line 11
    if-eq v0, v2, :cond_5

    .line 12
    .line 13
    iget-boolean v2, p0, Ll/kwy0;->Q:Z

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iget-boolean v2, p0, Ll/kwy0;->N0:Z

    .line 18
    .line 19
    if-eqz v2, :cond_5

    .line 20
    .line 21
    :cond_1
    iget-boolean v2, p0, Ll/kwy0;->R:Z

    .line 22
    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    iget-boolean v2, p0, Ll/kwy0;->M0:Z

    .line 26
    .line 27
    if-nez v2, :cond_5

    .line 28
    .line 29
    :cond_2
    const/4 v2, 0x2

    .line 30
    if-ne v0, v2, :cond_4

    .line 31
    .line 32
    sget v0, Ll/mpw0;->a:I

    .line 33
    .line 34
    const/16 v2, 0x17

    .line 35
    .line 36
    if-lt v0, v2, :cond_3

    .line 37
    .line 38
    move v4, v3

    .line 39
    goto :goto_0

    .line 40
    :cond_3
    move v4, v1

    .line 41
    :goto_0
    invoke-static {v4}, Ll/lev0;->f(Z)V

    .line 42
    .line 43
    .line 44
    if-lt v0, v2, :cond_4

    .line 45
    .line 46
    :try_start_0
    invoke-direct {p0}, Ll/kwy0;->j0()V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zziz; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    goto :goto_1

    .line 50
    :catch_0
    move-exception v0

    .line 51
    const-string v1, "MediaCodecRenderer"

    .line 52
    .line 53
    const-string v2, "Failed to update the DRM session, releasing the codec instead."

    .line 54
    .line 55
    invoke-static {v1, v2, v0}, Ll/y4w0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/kwy0;->W()V

    .line 59
    .line 60
    .line 61
    return v3

    .line 62
    :cond_4
    :goto_1
    invoke-virtual {p0}, Ll/kwy0;->x0()V

    .line 63
    .line 64
    .line 65
    return v1

    .line 66
    :cond_5
    invoke-virtual {p0}, Ll/kwy0;->W()V

    .line 67
    .line 68
    .line 69
    return v3
.end method

.method public final b0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kwy0;->E0:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c0(Ll/sqr0;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/kwy0;->Y0:Ll/juy0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/kwy0;->H0(Ll/sqr0;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public d0(Ll/hwy0;)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public final f0()V
    .locals 3
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/kwy0;->K0:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_2

    .line 5
    .line 6
    const/4 v2, 0x2

    .line 7
    if-eq v0, v2, :cond_1

    .line 8
    .line 9
    const/4 v2, 0x3

    .line 10
    if-eq v0, v2, :cond_0

    .line 11
    .line 12
    iput-boolean v1, p0, Ll/kwy0;->R0:Z

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/kwy0;->F0()V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/kwy0;->W()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/kwy0;->O0()V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {p0}, Ll/kwy0;->x0()V

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Ll/kwy0;->j0()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_2
    invoke-virtual {p0}, Ll/kwy0;->x0()V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final g0()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/kwy0;->X:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/kwy0;->v:Ll/evx0;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 8
    .line 9
    return-void
.end method

.method public final i0(Ll/jwy0;)V
    .locals 4

    .line 1
    iput-object p1, p0, Ll/kwy0;->U0:Ll/jwy0;

    .line 2
    .line 3
    iget-wide v0, p1, Ll/jwy0;->c:J

    .line 4
    .line 5
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long p1, v0, v2

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Ll/kwy0;->W0:Z

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final k0()Z
    .locals 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x17
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/kwy0;->L0:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iput v1, p0, Ll/kwy0;->J0:I

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/kwy0;->R:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v0, 0x3

    .line 13
    iput v0, p0, Ll/kwy0;->K0:I

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 v0, 0x2

    .line 18
    iput v0, p0, Ll/kwy0;->K0:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-direct {p0}, Ll/kwy0;->j0()V

    .line 22
    .line 23
    .line 24
    :goto_0
    return v1
.end method

.method public final l(Ll/sqr0;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/kwy0;->s:Ll/dxy0;

    .line 2
    .line 3
    invoke-virtual {p0, v0, p1}, Ll/kwy0;->U(Ll/dxy0;Ll/sqr0;)I

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzth; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

    .line 8
    :catch_0
    move-exception v0

    .line 9
    const/4 v1, 0x0

    .line 10
    const/16 v2, 0xfa2

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1, v1, v2}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    throw p0
.end method

.method public final l0()Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    if-eqz v0, :cond_1a

    .line 5
    .line 6
    iget v1, p0, Ll/kwy0;->J0:I

    .line 7
    .line 8
    const/4 v8, 0x2

    .line 9
    if-eq v1, v8, :cond_1a

    .line 10
    .line 11
    iget-boolean v1, p0, Ll/kwy0;->Q0:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_6

    .line 16
    .line 17
    :cond_0
    iget v1, p0, Ll/kwy0;->X:I

    .line 18
    .line 19
    if-gez v1, :cond_2

    .line 20
    .line 21
    invoke-interface {v0}, Ll/bwy0;->zza()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, p0, Ll/kwy0;->X:I

    .line 26
    .line 27
    if-gez v1, :cond_1

    .line 28
    .line 29
    return v7

    .line 30
    :cond_1
    iget-object v2, p0, Ll/kwy0;->v:Ll/evx0;

    .line 31
    .line 32
    invoke-interface {v0, v1}, Ll/bwy0;->zzf(I)Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iput-object v1, v2, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 37
    .line 38
    iget-object v1, p0, Ll/kwy0;->v:Ll/evx0;

    .line 39
    .line 40
    invoke-virtual {v1}, Ll/fux0;->b()V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget v1, p0, Ll/kwy0;->J0:I

    .line 44
    .line 45
    const/4 v9, 0x1

    .line 46
    if-ne v1, v9, :cond_4

    .line 47
    .line 48
    iget-boolean v1, p0, Ll/kwy0;->V:Z

    .line 49
    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    iput-boolean v9, p0, Ll/kwy0;->M0:Z

    .line 53
    .line 54
    iget v1, p0, Ll/kwy0;->X:I

    .line 55
    .line 56
    const-wide/16 v4, 0x0

    .line 57
    .line 58
    const/4 v6, 0x4

    .line 59
    const/4 v2, 0x0

    .line 60
    const/4 v3, 0x0

    .line 61
    invoke-interface/range {v0 .. v6}, Ll/bwy0;->a(IIIJI)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/kwy0;->g0()V

    .line 65
    .line 66
    .line 67
    :cond_3
    iput v8, p0, Ll/kwy0;->J0:I

    .line 68
    .line 69
    return v7

    .line 70
    :cond_4
    iget-boolean v1, p0, Ll/kwy0;->T:Z

    .line 71
    .line 72
    if-eqz v1, :cond_5

    .line 73
    .line 74
    iput-boolean v7, p0, Ll/kwy0;->T:Z

    .line 75
    .line 76
    iget-object v1, p0, Ll/kwy0;->v:Ll/evx0;

    .line 77
    .line 78
    iget-object v1, v1, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    .line 82
    .line 83
    sget-object v2, Ll/kwy0;->Z0:[B

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 86
    .line 87
    .line 88
    iget v1, p0, Ll/kwy0;->X:I

    .line 89
    .line 90
    const-wide/16 v4, 0x0

    .line 91
    .line 92
    const/4 v6, 0x0

    .line 93
    const/4 v2, 0x0

    .line 94
    const/16 v3, 0x26

    .line 95
    .line 96
    invoke-interface/range {v0 .. v6}, Ll/bwy0;->a(IIIJI)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p0}, Ll/kwy0;->g0()V

    .line 100
    .line 101
    .line 102
    iput-boolean v9, p0, Ll/kwy0;->L0:Z

    .line 103
    .line 104
    return v9

    .line 105
    :cond_5
    iget v1, p0, Ll/kwy0;->I0:I

    .line 106
    .line 107
    if-ne v1, v9, :cond_7

    .line 108
    .line 109
    move v1, v7

    .line 110
    :goto_0
    iget-object v2, p0, Ll/kwy0;->I:Ll/sqr0;

    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 113
    .line 114
    .line 115
    iget-object v2, v2, Ll/sqr0;->n:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    if-ge v1, v2, :cond_6

    .line 122
    .line 123
    iget-object v2, p0, Ll/kwy0;->I:Ll/sqr0;

    .line 124
    .line 125
    iget-object v2, v2, Ll/sqr0;->n:Ljava/util/List;

    .line 126
    .line 127
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    check-cast v2, [B

    .line 132
    .line 133
    iget-object v3, p0, Ll/kwy0;->v:Ll/evx0;

    .line 134
    .line 135
    iget-object v3, v3, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 136
    .line 137
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    .line 139
    .line 140
    invoke-virtual {v3, v2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    .line 143
    add-int/lit8 v1, v1, 0x1

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_6
    iput v8, p0, Ll/kwy0;->I0:I

    .line 147
    .line 148
    :cond_7
    iget-object v1, p0, Ll/kwy0;->v:Ll/evx0;

    .line 149
    .line 150
    iget-object v1, v1, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/nio/Buffer;->position()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    invoke-virtual {p0}, Ll/qwx0;->I()Ll/l9y0;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    :try_start_0
    iget-object v3, p0, Ll/kwy0;->v:Ll/evx0;

    .line 164
    .line 165
    invoke-virtual {p0, v2, v3, v7}, Ll/qwx0;->H(Ll/l9y0;Ll/evx0;I)I

    .line 166
    .line 167
    .line 168
    move-result v3
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzig; {:try_start_0 .. :try_end_0} :catch_2

    .line 169
    const/4 v4, -0x3

    .line 170
    if-ne v3, v4, :cond_9

    .line 171
    .line 172
    invoke-virtual {p0}, Ll/qwx0;->h()Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_8

    .line 177
    .line 178
    iget-wide v0, p0, Ll/kwy0;->O0:J

    .line 179
    .line 180
    iput-wide v0, p0, Ll/kwy0;->P0:J

    .line 181
    .line 182
    :cond_8
    return v7

    .line 183
    :cond_9
    const/4 v4, -0x5

    .line 184
    if-ne v3, v4, :cond_b

    .line 185
    .line 186
    iget v0, p0, Ll/kwy0;->I0:I

    .line 187
    .line 188
    if-ne v0, v8, :cond_a

    .line 189
    .line 190
    iget-object v0, p0, Ll/kwy0;->v:Ll/evx0;

    .line 191
    .line 192
    invoke-virtual {v0}, Ll/fux0;->b()V

    .line 193
    .line 194
    .line 195
    iput v9, p0, Ll/kwy0;->I0:I

    .line 196
    .line 197
    :cond_a
    invoke-virtual {p0, v2}, Ll/kwy0;->s0(Ll/l9y0;)Ll/zwx0;

    .line 198
    .line 199
    .line 200
    return v9

    .line 201
    :cond_b
    iget-object v2, p0, Ll/kwy0;->v:Ll/evx0;

    .line 202
    .line 203
    invoke-virtual {v2}, Ll/fux0;->f()Z

    .line 204
    .line 205
    .line 206
    move-result v3

    .line 207
    if-eqz v3, :cond_f

    .line 208
    .line 209
    iget-wide v3, p0, Ll/kwy0;->O0:J

    .line 210
    .line 211
    iput-wide v3, p0, Ll/kwy0;->P0:J

    .line 212
    .line 213
    iget v1, p0, Ll/kwy0;->I0:I

    .line 214
    .line 215
    if-ne v1, v8, :cond_c

    .line 216
    .line 217
    invoke-virtual {v2}, Ll/fux0;->b()V

    .line 218
    .line 219
    .line 220
    iput v9, p0, Ll/kwy0;->I0:I

    .line 221
    .line 222
    :cond_c
    iput-boolean v9, p0, Ll/kwy0;->Q0:Z

    .line 223
    .line 224
    iget-boolean v1, p0, Ll/kwy0;->L0:Z

    .line 225
    .line 226
    if-nez v1, :cond_d

    .line 227
    .line 228
    invoke-virtual {p0}, Ll/kwy0;->f0()V

    .line 229
    .line 230
    .line 231
    return v7

    .line 232
    :cond_d
    :try_start_1
    iget-boolean v1, p0, Ll/kwy0;->V:Z

    .line 233
    .line 234
    if-nez v1, :cond_e

    .line 235
    .line 236
    iput-boolean v9, p0, Ll/kwy0;->M0:Z

    .line 237
    .line 238
    iget v1, p0, Ll/kwy0;->X:I

    .line 239
    .line 240
    const-wide/16 v4, 0x0

    .line 241
    .line 242
    const/4 v6, 0x4

    .line 243
    const/4 v2, 0x0

    .line 244
    const/4 v3, 0x0

    .line 245
    invoke-interface/range {v0 .. v6}, Ll/bwy0;->a(IIIJI)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0}, Ll/kwy0;->g0()V
    :try_end_1
    .catch Landroid/media/MediaCodec$CryptoException; {:try_start_1 .. :try_end_1} :catch_0

    .line 249
    .line 250
    .line 251
    goto :goto_1

    .line 252
    :catch_0
    move-exception v0

    .line 253
    goto :goto_2

    .line 254
    :cond_e
    :goto_1
    return v7

    .line 255
    :goto_2
    iget-object v1, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 256
    .line 257
    invoke-virtual {v0}, Landroid/media/MediaCodec$CryptoException;->getErrorCode()I

    .line 258
    .line 259
    .line 260
    move-result v2

    .line 261
    invoke-static {v2}, Ll/mpw0;->x(I)I

    .line 262
    .line 263
    .line 264
    move-result v2

    .line 265
    invoke-virtual {p0, v0, v1, v7, v2}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    throw p0

    .line 270
    :cond_f
    iget-boolean v3, p0, Ll/kwy0;->L0:Z

    .line 271
    .line 272
    if-nez v3, :cond_11

    .line 273
    .line 274
    invoke-virtual {v2}, Ll/fux0;->g()Z

    .line 275
    .line 276
    .line 277
    move-result v3

    .line 278
    if-nez v3, :cond_11

    .line 279
    .line 280
    invoke-virtual {v2}, Ll/fux0;->b()V

    .line 281
    .line 282
    .line 283
    iget v0, p0, Ll/kwy0;->I0:I

    .line 284
    .line 285
    if-ne v0, v8, :cond_10

    .line 286
    .line 287
    iput v9, p0, Ll/kwy0;->I0:I

    .line 288
    .line 289
    :cond_10
    return v9

    .line 290
    :cond_11
    invoke-virtual {v2}, Ll/evx0;->k()Z

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    if-eqz v3, :cond_12

    .line 295
    .line 296
    iget-object v2, v2, Ll/evx0;->c:Ll/tux0;

    .line 297
    .line 298
    invoke-virtual {v2, v1}, Ll/tux0;->b(I)V

    .line 299
    .line 300
    .line 301
    :cond_12
    iget-object v1, p0, Ll/kwy0;->v:Ll/evx0;

    .line 302
    .line 303
    iget-wide v4, v1, Ll/evx0;->f:J

    .line 304
    .line 305
    iget-boolean v1, p0, Ll/kwy0;->S0:Z

    .line 306
    .line 307
    if-eqz v1, :cond_14

    .line 308
    .line 309
    iget-object v1, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 310
    .line 311
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    if-nez v1, :cond_13

    .line 316
    .line 317
    iget-object v1, p0, Ll/kwy0;->z:Ljava/util/ArrayDeque;

    .line 318
    .line 319
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peekLast()Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    check-cast v1, Ll/jwy0;

    .line 324
    .line 325
    iget-object v1, v1, Ll/jwy0;->d:Ll/imw0;

    .line 326
    .line 327
    iget-object v2, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 328
    .line 329
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 330
    .line 331
    .line 332
    invoke-virtual {v1, v4, v5, v2}, Ll/imw0;->d(JLjava/lang/Object;)V

    .line 333
    .line 334
    .line 335
    goto :goto_3

    .line 336
    :cond_13
    iget-object v1, p0, Ll/kwy0;->U0:Ll/jwy0;

    .line 337
    .line 338
    iget-object v1, v1, Ll/jwy0;->d:Ll/imw0;

    .line 339
    .line 340
    iget-object v2, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 341
    .line 342
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 343
    .line 344
    .line 345
    invoke-virtual {v1, v4, v5, v2}, Ll/imw0;->d(JLjava/lang/Object;)V

    .line 346
    .line 347
    .line 348
    :goto_3
    iput-boolean v7, p0, Ll/kwy0;->S0:Z

    .line 349
    .line 350
    :cond_14
    iget-wide v1, p0, Ll/kwy0;->O0:J

    .line 351
    .line 352
    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->max(JJ)J

    .line 353
    .line 354
    .line 355
    move-result-wide v1

    .line 356
    iput-wide v1, p0, Ll/kwy0;->O0:J

    .line 357
    .line 358
    invoke-virtual {p0}, Ll/qwx0;->h()Z

    .line 359
    .line 360
    .line 361
    move-result v6

    .line 362
    if-nez v6, :cond_15

    .line 363
    .line 364
    iget-object v6, p0, Ll/kwy0;->v:Ll/evx0;

    .line 365
    .line 366
    invoke-virtual {v6}, Ll/fux0;->h()Z

    .line 367
    .line 368
    .line 369
    move-result v6

    .line 370
    if-eqz v6, :cond_16

    .line 371
    .line 372
    :cond_15
    iput-wide v1, p0, Ll/kwy0;->P0:J

    .line 373
    .line 374
    :cond_16
    iget-object v1, p0, Ll/kwy0;->v:Ll/evx0;

    .line 375
    .line 376
    invoke-virtual {v1}, Ll/evx0;->j()V

    .line 377
    .line 378
    .line 379
    iget-object v1, p0, Ll/kwy0;->v:Ll/evx0;

    .line 380
    .line 381
    invoke-virtual {v1}, Ll/fux0;->e()Z

    .line 382
    .line 383
    .line 384
    move-result v2

    .line 385
    if-eqz v2, :cond_17

    .line 386
    .line 387
    invoke-virtual {p0, v1}, Ll/kwy0;->y0(Ll/evx0;)V

    .line 388
    .line 389
    .line 390
    :cond_17
    iget-object v1, p0, Ll/kwy0;->v:Ll/evx0;

    .line 391
    .line 392
    invoke-virtual {p0, v1}, Ll/kwy0;->Q0(Ll/evx0;)V

    .line 393
    .line 394
    .line 395
    iget-object v1, p0, Ll/kwy0;->v:Ll/evx0;

    .line 396
    .line 397
    invoke-virtual {p0, v1}, Ll/kwy0;->I0(Ll/evx0;)I

    .line 398
    .line 399
    .line 400
    iget v1, p0, Ll/kwy0;->X:I

    .line 401
    .line 402
    if-eqz v3, :cond_18

    .line 403
    .line 404
    :try_start_2
    iget-object v2, p0, Ll/kwy0;->v:Ll/evx0;

    .line 405
    .line 406
    iget-object v3, v2, Ll/evx0;->c:Ll/tux0;

    .line 407
    .line 408
    const/4 v6, 0x0

    .line 409
    const/4 v2, 0x0

    .line 410
    invoke-interface/range {v0 .. v6}, Ll/bwy0;->c(IILl/tux0;JI)V

    .line 411
    .line 412
    .line 413
    goto :goto_4

    .line 414
    :catch_1
    move-exception v0

    .line 415
    goto :goto_5

    .line 416
    :cond_18
    iget-object v2, p0, Ll/kwy0;->v:Ll/evx0;

    .line 417
    .line 418
    iget-object v2, v2, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 419
    .line 420
    if-eqz v2, :cond_19

    .line 421
    .line 422
    invoke-virtual {v2}, Ljava/nio/Buffer;->limit()I

    .line 423
    .line 424
    .line 425
    move-result v3

    .line 426
    const/4 v6, 0x0

    .line 427
    const/4 v2, 0x0

    .line 428
    invoke-interface/range {v0 .. v6}, Ll/bwy0;->a(IIIJI)V
    :try_end_2
    .catch Landroid/media/MediaCodec$CryptoException; {:try_start_2 .. :try_end_2} :catch_1

    .line 429
    .line 430
    .line 431
    :goto_4
    invoke-virtual {p0}, Ll/kwy0;->g0()V

    .line 432
    .line 433
    .line 434
    iput-boolean v9, p0, Ll/kwy0;->L0:Z

    .line 435
    .line 436
    iput v7, p0, Ll/kwy0;->I0:I

    .line 437
    .line 438
    iget-object p0, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 439
    .line 440
    iget v0, p0, Ll/vwx0;->c:I

    .line 441
    .line 442
    add-int/2addr v0, v9

    .line 443
    iput v0, p0, Ll/vwx0;->c:I

    .line 444
    .line 445
    return v9

    .line 446
    :cond_19
    const/4 v0, 0x0

    .line 447
    :try_start_3
    throw v0
    :try_end_3
    .catch Landroid/media/MediaCodec$CryptoException; {:try_start_3 .. :try_end_3} :catch_1

    .line 448
    :goto_5
    iget-object v1, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 449
    .line 450
    invoke-virtual {v0}, Landroid/media/MediaCodec$CryptoException;->getErrorCode()I

    .line 451
    .line 452
    .line 453
    move-result v2

    .line 454
    invoke-static {v2}, Ll/mpw0;->x(I)I

    .line 455
    .line 456
    .line 457
    move-result v2

    .line 458
    invoke-virtual {p0, v0, v1, v7, v2}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 459
    .line 460
    .line 461
    move-result-object p0

    .line 462
    throw p0

    .line 463
    :catch_2
    move-exception v0

    .line 464
    invoke-virtual {p0, v0}, Ll/kwy0;->z0(Ljava/lang/Exception;)V

    .line 465
    .line 466
    .line 467
    invoke-virtual {p0, v7}, Ll/kwy0;->o0(I)Z

    .line 468
    .line 469
    .line 470
    invoke-virtual {p0}, Ll/kwy0;->x0()V

    .line 471
    .line 472
    .line 473
    return v9

    .line 474
    :cond_1a
    :goto_6
    return v7
.end method

.method public final m0()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/kwy0;->Y:I

    .line 2
    .line 3
    if-ltz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final n0(JJ)Z
    .locals 3

    .line 1
    cmp-long v0, p3, p1

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-gez v0, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Ll/kwy0;->C:Ll/sqr0;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/sqr0;->l:Ljava/lang/String;

    .line 12
    .line 13
    const-string v2, "audio/opus"

    .line 14
    .line 15
    invoke-static {p0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-static {p1, p2, p3, p4}, Ll/xfr0;->f(JJ)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    return v1

    .line 28
    :cond_0
    return v0

    .line 29
    :cond_1
    return v1
.end method

.method public final o0(I)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/kwy0;->u:Ll/evx0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/qwx0;->I()Ll/l9y0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0}, Ll/fux0;->b()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/kwy0;->u:Ll/evx0;

    .line 11
    .line 12
    or-int/lit8 p1, p1, 0x4

    .line 13
    .line 14
    invoke-virtual {p0, v1, v0, p1}, Ll/qwx0;->H(Ll/l9y0;Ll/evx0;I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v0, -0x5

    .line 19
    const/4 v2, 0x1

    .line 20
    if-ne p1, v0, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Ll/kwy0;->s0(Ll/l9y0;)Ll/zwx0;

    .line 23
    .line 24
    .line 25
    return v2

    .line 26
    :cond_0
    const/4 v0, -0x4

    .line 27
    if-ne p1, v0, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Ll/kwy0;->u:Ll/evx0;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/fux0;->f()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    iput-boolean v2, p0, Ll/kwy0;->Q0:Z

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/kwy0;->f0()V

    .line 40
    .line 41
    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public p(FF)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iput p2, p0, Ll/kwy0;->G:F

    .line 2
    .line 3
    iget-object p1, p0, Ll/kwy0;->I:Ll/sqr0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/kwy0;->q0(Ll/sqr0;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final p0(J)Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/kwy0;->F:J

    .line 2
    .line 3
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long v0, v0, v2

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/qwx0;->L()Ll/mfv0;

    .line 13
    .line 14
    .line 15
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    sub-long/2addr v0, p1

    .line 20
    iget-wide p0, p0, Ll/kwy0;->F:J

    .line 21
    .line 22
    cmp-long p0, v0, p0

    .line 23
    .line 24
    if-gez p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0

    .line 29
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 30
    return p0
.end method

.method public final q0(Ll/sqr0;)Z
    .locals 4
    .param p1    # Ll/sqr0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x17

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    iget-object v0, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    iget v0, p0, Ll/kwy0;->K0:I

    .line 14
    .line 15
    const/4 v1, 0x3

    .line 16
    if-eq v0, v1, :cond_3

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/qwx0;->s()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_3

    .line 23
    .line 24
    iget v0, p0, Ll/kwy0;->G:F

    .line 25
    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/qwx0;->F()[Ll/sqr0;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p0, v0, p1, v1}, Ll/kwy0;->T(FLl/sqr0;[Ll/sqr0;)F

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iget v0, p0, Ll/kwy0;->L:F

    .line 38
    .line 39
    cmpl-float v1, v0, p1

    .line 40
    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    const/high16 v1, -0x40800000    # -1.0f

    .line 44
    .line 45
    cmpl-float v3, p1, v1

    .line 46
    .line 47
    if-nez v3, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/kwy0;->u0()V

    .line 50
    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_1
    cmpl-float v0, v0, v1

    .line 55
    .line 56
    if-nez v0, :cond_2

    .line 57
    .line 58
    iget v0, p0, Ll/kwy0;->t:F

    .line 59
    .line 60
    cmpl-float v0, p1, v0

    .line 61
    .line 62
    if-lez v0, :cond_3

    .line 63
    .line 64
    :cond_2
    new-instance v0, Landroid/os/Bundle;

    .line 65
    .line 66
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v1, "operating-rate"

    .line 70
    .line 71
    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    .line 72
    .line 73
    .line 74
    iget-object v1, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    invoke-interface {v1, v0}, Ll/bwy0;->F(Landroid/os/Bundle;)V

    .line 80
    .line 81
    .line 82
    iput p1, p0, Ll/kwy0;->L:F

    .line 83
    .line 84
    :cond_3
    :goto_0
    return v2
.end method

.method public r()Z
    .locals 7

    .line 1
    iget-object v0, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qwx0;->E()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v2, 0x1

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/kwy0;->m0()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iget-wide v3, p0, Ll/kwy0;->W:J

    .line 20
    .line 21
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    cmp-long v0, v3, v5

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/qwx0;->L()Ll/mfv0;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    iget-wide v5, p0, Ll/kwy0;->W:J

    .line 38
    .line 39
    cmp-long p0, v3, v5

    .line 40
    .line 41
    if-ltz p0, :cond_0

    .line 42
    .line 43
    return v1

    .line 44
    :cond_0
    return v2

    .line 45
    :cond_1
    return v1

    .line 46
    :cond_2
    return v2

    .line 47
    :cond_3
    return v1
.end method

.method public abstract r0(Ll/hwy0;Ll/sqr0;Ll/sqr0;)Ll/zwx0;
.end method

.method public s0(Ll/l9y0;)Ll/zwx0;
    .locals 11
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/kwy0;->S0:Z

    .line 3
    .line 4
    iget-object v4, p1, Ll/l9y0;->a:Ll/sqr0;

    .line 5
    .line 6
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    iget-object v1, v4, Ll/sqr0;->l:Ljava/lang/String;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz v1, :cond_13

    .line 13
    .line 14
    iget-object p1, p1, Ll/l9y0;->b:Ll/juy0;

    .line 15
    .line 16
    iput-object p1, p0, Ll/kwy0;->Y0:Ll/juy0;

    .line 17
    .line 18
    iput-object v4, p0, Ll/kwy0;->B:Ll/sqr0;

    .line 19
    .line 20
    iget-boolean p1, p0, Ll/kwy0;->E0:Z

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    if-eqz p1, :cond_0

    .line 24
    .line 25
    iput-boolean v0, p0, Ll/kwy0;->G0:Z

    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_0
    iget-object p1, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 29
    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iput-object v1, p0, Ll/kwy0;->M:Ljava/util/ArrayDeque;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/kwy0;->O0()V

    .line 35
    .line 36
    .line 37
    return-object v1

    .line 38
    :cond_1
    iget-object v1, p0, Ll/kwy0;->O:Ll/hwy0;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    .line 42
    .line 43
    iget-object v3, p0, Ll/kwy0;->I:Ll/sqr0;

    .line 44
    .line 45
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    iget-object v5, p0, Ll/kwy0;->X0:Ll/juy0;

    .line 49
    .line 50
    iget-object v6, p0, Ll/kwy0;->Y0:Ll/juy0;

    .line 51
    .line 52
    if-ne v5, v6, :cond_12

    .line 53
    .line 54
    if-eq v6, v5, :cond_2

    .line 55
    .line 56
    move v5, v0

    .line 57
    goto :goto_0

    .line 58
    :cond_2
    move v5, v2

    .line 59
    :goto_0
    if-eqz v5, :cond_3

    .line 60
    .line 61
    sget v6, Ll/mpw0;->a:I

    .line 62
    .line 63
    const/16 v7, 0x17

    .line 64
    .line 65
    if-lt v6, v7, :cond_4

    .line 66
    .line 67
    :cond_3
    move v6, v0

    .line 68
    goto :goto_1

    .line 69
    :cond_4
    move v6, v2

    .line 70
    :goto_1
    invoke-static {v6}, Ll/lev0;->f(Z)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v1, v3, v4}, Ll/kwy0;->r0(Ll/hwy0;Ll/sqr0;Ll/sqr0;)Ll/zwx0;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    iget v7, v6, Ll/zwx0;->d:I

    .line 78
    .line 79
    const/4 v8, 0x3

    .line 80
    if-eqz v7, :cond_e

    .line 81
    .line 82
    const/16 v9, 0x10

    .line 83
    .line 84
    const/4 v10, 0x2

    .line 85
    if-eq v7, v0, :cond_a

    .line 86
    .line 87
    if-eq v7, v10, :cond_6

    .line 88
    .line 89
    invoke-virtual {p0, v4}, Ll/kwy0;->q0(Ll/sqr0;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_5

    .line 94
    .line 95
    :goto_2
    move v2, v9

    .line 96
    goto/16 :goto_5

    .line 97
    .line 98
    :cond_5
    iput-object v4, p0, Ll/kwy0;->I:Ll/sqr0;

    .line 99
    .line 100
    if-eqz v5, :cond_f

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/kwy0;->k0()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_f

    .line 107
    .line 108
    :goto_3
    move v2, v10

    .line 109
    goto :goto_5

    .line 110
    :cond_6
    invoke-virtual {p0, v4}, Ll/kwy0;->q0(Ll/sqr0;)Z

    .line 111
    .line 112
    .line 113
    move-result v7

    .line 114
    if-nez v7, :cond_7

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_7
    iput-boolean v0, p0, Ll/kwy0;->H0:Z

    .line 118
    .line 119
    iput v0, p0, Ll/kwy0;->I0:I

    .line 120
    .line 121
    iget v7, p0, Ll/kwy0;->P:I

    .line 122
    .line 123
    if-eq v7, v10, :cond_9

    .line 124
    .line 125
    if-ne v7, v0, :cond_8

    .line 126
    .line 127
    iget v7, v4, Ll/sqr0;->q:I

    .line 128
    .line 129
    iget v9, v3, Ll/sqr0;->q:I

    .line 130
    .line 131
    if-ne v7, v9, :cond_8

    .line 132
    .line 133
    iget v7, v4, Ll/sqr0;->r:I

    .line 134
    .line 135
    iget v9, v3, Ll/sqr0;->r:I

    .line 136
    .line 137
    if-ne v7, v9, :cond_8

    .line 138
    .line 139
    goto :goto_4

    .line 140
    :cond_8
    move v0, v2

    .line 141
    :cond_9
    :goto_4
    iput-boolean v0, p0, Ll/kwy0;->T:Z

    .line 142
    .line 143
    iput-object v4, p0, Ll/kwy0;->I:Ll/sqr0;

    .line 144
    .line 145
    if-eqz v5, :cond_f

    .line 146
    .line 147
    invoke-virtual {p0}, Ll/kwy0;->k0()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-nez v0, :cond_f

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_a
    invoke-virtual {p0, v4}, Ll/kwy0;->q0(Ll/sqr0;)Z

    .line 155
    .line 156
    .line 157
    move-result v7

    .line 158
    if-nez v7, :cond_b

    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_b
    iput-object v4, p0, Ll/kwy0;->I:Ll/sqr0;

    .line 162
    .line 163
    if-eqz v5, :cond_c

    .line 164
    .line 165
    invoke-virtual {p0}, Ll/kwy0;->k0()Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_f

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_c
    iget-boolean v5, p0, Ll/kwy0;->L0:Z

    .line 173
    .line 174
    if-eqz v5, :cond_f

    .line 175
    .line 176
    iput v0, p0, Ll/kwy0;->J0:I

    .line 177
    .line 178
    iget-boolean v5, p0, Ll/kwy0;->R:Z

    .line 179
    .line 180
    if-eqz v5, :cond_d

    .line 181
    .line 182
    iput v8, p0, Ll/kwy0;->K0:I

    .line 183
    .line 184
    goto :goto_3

    .line 185
    :cond_d
    iput v0, p0, Ll/kwy0;->K0:I

    .line 186
    .line 187
    goto :goto_5

    .line 188
    :cond_e
    invoke-virtual {p0}, Ll/kwy0;->u0()V

    .line 189
    .line 190
    .line 191
    :cond_f
    :goto_5
    iget v0, v6, Ll/zwx0;->d:I

    .line 192
    .line 193
    if-eqz v0, :cond_11

    .line 194
    .line 195
    iget-object v0, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 196
    .line 197
    if-ne v0, p1, :cond_10

    .line 198
    .line 199
    iget p0, p0, Ll/kwy0;->K0:I

    .line 200
    .line 201
    if-ne p0, v8, :cond_11

    .line 202
    .line 203
    :cond_10
    move v6, v2

    .line 204
    iget-object v2, v1, Ll/hwy0;->a:Ljava/lang/String;

    .line 205
    .line 206
    new-instance v1, Ll/zwx0;

    .line 207
    .line 208
    const/4 v5, 0x0

    .line 209
    invoke-direct/range {v1 .. v6}, Ll/zwx0;-><init>(Ljava/lang/String;Ll/sqr0;Ll/sqr0;II)V

    .line 210
    .line 211
    .line 212
    return-object v1

    .line 213
    :cond_11
    return-object v6

    .line 214
    :cond_12
    invoke-virtual {p0}, Ll/kwy0;->u0()V

    .line 215
    .line 216
    .line 217
    iget-object v2, v1, Ll/hwy0;->a:Ljava/lang/String;

    .line 218
    .line 219
    new-instance v1, Ll/zwx0;

    .line 220
    .line 221
    const/4 v5, 0x0

    .line 222
    const/16 v6, 0x80

    .line 223
    .line 224
    invoke-direct/range {v1 .. v6}, Ll/zwx0;-><init>(Ljava/lang/String;Ll/sqr0;Ll/sqr0;II)V

    .line 225
    .line 226
    .line 227
    return-object v1

    .line 228
    :cond_13
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 229
    .line 230
    const-string v0, "Sample MIME type is null."

    .line 231
    .line 232
    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    const/16 v0, 0xfa5

    .line 236
    .line 237
    invoke-virtual {p0, p1, v4, v2, v0}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    throw p0
.end method

.method public final t0()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/kwy0;->G0:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/kwy0;->x:Ll/tvy0;

    .line 5
    .line 6
    invoke-virtual {v1}, Ll/fux0;->b()V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/kwy0;->w:Ll/evx0;

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/fux0;->b()V

    .line 12
    .line 13
    .line 14
    iput-boolean v0, p0, Ll/kwy0;->F0:Z

    .line 15
    .line 16
    iput-boolean v0, p0, Ll/kwy0;->E0:Z

    .line 17
    .line 18
    iget-object p0, p0, Ll/kwy0;->A:Ll/qty0;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/qty0;->b()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final u0()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/kwy0;->L0:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput v0, p0, Ll/kwy0;->J0:I

    .line 7
    .line 8
    const/4 v0, 0x3

    .line 9
    iput v0, p0, Ll/kwy0;->K0:I

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/kwy0;->W()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/kwy0;->O0()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public abstract v0(Ll/hwy0;Ll/sqr0;Landroid/media/MediaCrypto;F)Ll/xvy0;
    .param p3    # Landroid/media/MediaCrypto;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public w(JJ)V
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const/4 v2, 0x1

    .line 4
    :try_start_0
    iget-boolean v0, v1, Ll/kwy0;->R0:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1}, Ll/kwy0;->F0()V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :catch_0
    move-exception v0

    .line 13
    :goto_0
    const/16 v17, 0x0

    .line 14
    .line 15
    goto/16 :goto_1f

    .line 16
    .line 17
    :cond_0
    iget-object v0, v1, Ll/kwy0;->B:Ll/sqr0;

    .line 18
    .line 19
    const/4 v4, 0x2

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {v1, v4}, Ll/kwy0;->o0(I)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_33

    .line 27
    .line 28
    :cond_1
    invoke-virtual {v1}, Ll/kwy0;->O0()V

    .line 29
    .line 30
    .line 31
    iget-boolean v0, v1, Ll/kwy0;->E0:Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    if-eqz v0, :cond_18

    .line 35
    .line 36
    :try_start_1
    const-string v0, "bypassRender"

    .line 37
    .line 38
    sget v4, Ll/mpw0;->a:I

    .line 39
    .line 40
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :goto_1
    iget-boolean v0, v1, Ll/kwy0;->R0:Z

    .line 44
    .line 45
    xor-int/2addr v0, v2

    .line 46
    invoke-static {v0}, Ll/lev0;->f(Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/tvy0;->q()Z

    .line 52
    .line 53
    .line 54
    move-result v4
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_3

    .line 55
    if-eqz v4, :cond_4

    .line 56
    .line 57
    :try_start_2
    iget-object v7, v0, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 58
    .line 59
    iget v8, v1, Ll/kwy0;->Y:I

    .line 60
    .line 61
    invoke-virtual {v0}, Ll/tvy0;->m()I

    .line 62
    .line 63
    .line 64
    move-result v10

    .line 65
    iget-wide v11, v0, Ll/evx0;->f:J

    .line 66
    .line 67
    invoke-virtual {v1}, Ll/qwx0;->K()J

    .line 68
    .line 69
    .line 70
    move-result-wide v13

    .line 71
    invoke-virtual {v0}, Ll/tvy0;->n()J

    .line 72
    .line 73
    .line 74
    move-result-wide v2

    .line 75
    invoke-virtual {v1, v13, v14, v2, v3}, Ll/kwy0;->n0(JJ)Z

    .line 76
    .line 77
    .line 78
    move-result v13

    .line 79
    iget-object v0, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 80
    .line 81
    invoke-virtual {v0}, Ll/fux0;->f()Z

    .line 82
    .line 83
    .line 84
    move-result v14

    .line 85
    iget-object v15, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 86
    .line 87
    if-eqz v15, :cond_3

    .line 88
    .line 89
    const/4 v2, 0x1

    .line 90
    const/4 v6, 0x0

    .line 91
    const/4 v3, 0x0

    .line 92
    const/4 v9, 0x0

    .line 93
    move-wide/from16 v2, p1

    .line 94
    .line 95
    move-object v0, v5

    .line 96
    move-wide/from16 v4, p3

    .line 97
    .line 98
    invoke-virtual/range {v1 .. v15}, Ll/kwy0;->G0(JJLl/bwy0;Ljava/nio/ByteBuffer;IIIJZZLl/sqr0;)Z

    .line 99
    .line 100
    .line 101
    move-result v6

    .line 102
    if-eqz v6, :cond_2

    .line 103
    .line 104
    iget-object v2, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 105
    .line 106
    invoke-virtual {v2}, Ll/tvy0;->n()J

    .line 107
    .line 108
    .line 109
    move-result-wide v2

    .line 110
    invoke-virtual {v1, v2, v3}, Ll/kwy0;->P0(J)V

    .line 111
    .line 112
    .line 113
    iget-object v2, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 114
    .line 115
    invoke-virtual {v2}, Ll/fux0;->b()V

    .line 116
    .line 117
    .line 118
    goto :goto_3

    .line 119
    :catch_1
    move-exception v0

    .line 120
    const/4 v2, 0x1

    .line 121
    goto :goto_0

    .line 122
    :cond_2
    const/4 v2, 0x1

    .line 123
    :goto_2
    const/4 v3, 0x0

    .line 124
    goto/16 :goto_e

    .line 125
    .line 126
    :cond_3
    move-object v0, v5

    .line 127
    throw v0
    :try_end_2
    .catch Ljava/lang/IllegalStateException; {:try_start_2 .. :try_end_2} :catch_1

    .line 128
    :cond_4
    move-object v0, v5

    .line 129
    :goto_3
    :try_start_3
    iget-boolean v2, v1, Ll/kwy0;->Q0:Z
    :try_end_3
    .catch Ljava/lang/IllegalStateException; {:try_start_3 .. :try_end_3} :catch_4

    .line 130
    .line 131
    if-eqz v2, :cond_5

    .line 132
    .line 133
    const/4 v2, 0x1

    .line 134
    :try_start_4
    iput-boolean v2, v1, Ll/kwy0;->R0:Z
    :try_end_4
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_0

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_5
    const/4 v2, 0x1

    .line 138
    :try_start_5
    iget-boolean v3, v1, Ll/kwy0;->F0:Z

    .line 139
    .line 140
    if-eqz v3, :cond_6

    .line 141
    .line 142
    iget-object v3, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 143
    .line 144
    iget-object v4, v1, Ll/kwy0;->w:Ll/evx0;

    .line 145
    .line 146
    invoke-virtual {v3, v4}, Ll/tvy0;->p(Ll/evx0;)Z

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    invoke-static {v3}, Ll/lev0;->f(Z)V
    :try_end_5
    .catch Ljava/lang/IllegalStateException; {:try_start_5 .. :try_end_5} :catch_3

    .line 151
    .line 152
    .line 153
    const/4 v3, 0x0

    .line 154
    :try_start_6
    iput-boolean v3, v1, Ll/kwy0;->F0:Z

    .line 155
    .line 156
    goto :goto_6

    .line 157
    :catch_2
    move-exception v0

    .line 158
    :goto_4
    move/from16 v17, v3

    .line 159
    .line 160
    goto/16 :goto_1f

    .line 161
    .line 162
    :catch_3
    move-exception v0

    .line 163
    :goto_5
    const/4 v3, 0x0

    .line 164
    goto :goto_4

    .line 165
    :cond_6
    const/4 v3, 0x0

    .line 166
    :goto_6
    iget-boolean v4, v1, Ll/kwy0;->G0:Z

    .line 167
    .line 168
    if-eqz v4, :cond_8

    .line 169
    .line 170
    iget-object v4, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 171
    .line 172
    invoke-virtual {v4}, Ll/tvy0;->q()Z

    .line 173
    .line 174
    .line 175
    move-result v4

    .line 176
    if-nez v4, :cond_7

    .line 177
    .line 178
    invoke-virtual {v1}, Ll/kwy0;->t0()V

    .line 179
    .line 180
    .line 181
    iput-boolean v3, v1, Ll/kwy0;->G0:Z

    .line 182
    .line 183
    invoke-virtual {v1}, Ll/kwy0;->O0()V

    .line 184
    .line 185
    .line 186
    iget-boolean v4, v1, Ll/kwy0;->E0:Z

    .line 187
    .line 188
    if-eqz v4, :cond_17

    .line 189
    .line 190
    goto :goto_8

    .line 191
    :cond_7
    :goto_7
    move-object v5, v0

    .line 192
    goto/16 :goto_1

    .line 193
    .line 194
    :cond_8
    :goto_8
    iget-boolean v4, v1, Ll/kwy0;->Q0:Z

    .line 195
    .line 196
    xor-int/2addr v4, v2

    .line 197
    invoke-static {v4}, Ll/lev0;->f(Z)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1}, Ll/qwx0;->I()Ll/l9y0;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    iget-object v5, v1, Ll/kwy0;->w:Ll/evx0;

    .line 205
    .line 206
    invoke-virtual {v5}, Ll/fux0;->b()V

    .line 207
    .line 208
    .line 209
    :cond_9
    iget-object v5, v1, Ll/kwy0;->w:Ll/evx0;

    .line 210
    .line 211
    invoke-virtual {v5}, Ll/fux0;->b()V

    .line 212
    .line 213
    .line 214
    iget-object v5, v1, Ll/kwy0;->w:Ll/evx0;

    .line 215
    .line 216
    invoke-virtual {v1, v4, v5, v3}, Ll/qwx0;->H(Ll/l9y0;Ll/evx0;I)I

    .line 217
    .line 218
    .line 219
    move-result v5

    .line 220
    const/4 v6, -0x5

    .line 221
    if-eq v5, v6, :cond_15

    .line 222
    .line 223
    const/4 v6, -0x4

    .line 224
    if-eq v5, v6, :cond_a

    .line 225
    .line 226
    goto/16 :goto_d

    .line 227
    .line 228
    :cond_a
    iget-object v5, v1, Ll/kwy0;->w:Ll/evx0;

    .line 229
    .line 230
    invoke-virtual {v5}, Ll/fux0;->f()Z

    .line 231
    .line 232
    .line 233
    move-result v5

    .line 234
    if-eqz v5, :cond_b

    .line 235
    .line 236
    iput-boolean v2, v1, Ll/kwy0;->Q0:Z

    .line 237
    .line 238
    goto/16 :goto_d

    .line 239
    .line 240
    :cond_b
    iget-boolean v5, v1, Ll/kwy0;->S0:Z
    :try_end_6
    .catch Ljava/lang/IllegalStateException; {:try_start_6 .. :try_end_6} :catch_2

    .line 241
    .line 242
    const-string v6, "audio/opus"

    .line 243
    .line 244
    if-eqz v5, :cond_f

    .line 245
    .line 246
    :try_start_7
    iget-object v5, v1, Ll/kwy0;->B:Ll/sqr0;

    .line 247
    .line 248
    if-eqz v5, :cond_e

    .line 249
    .line 250
    iput-object v5, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 251
    .line 252
    iget-object v5, v5, Ll/sqr0;->l:Ljava/lang/String;

    .line 253
    .line 254
    invoke-static {v5, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 255
    .line 256
    .line 257
    move-result v5

    .line 258
    if-eqz v5, :cond_d

    .line 259
    .line 260
    iget-object v5, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 261
    .line 262
    iget-object v5, v5, Ll/sqr0;->n:Ljava/util/List;

    .line 263
    .line 264
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 265
    .line 266
    .line 267
    move-result v5

    .line 268
    if-nez v5, :cond_d

    .line 269
    .line 270
    iget-object v5, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 271
    .line 272
    iget-object v5, v5, Ll/sqr0;->n:Ljava/util/List;

    .line 273
    .line 274
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 275
    .line 276
    .line 277
    move-result-object v5

    .line 278
    check-cast v5, [B

    .line 279
    .line 280
    invoke-static {v5}, Ll/xfr0;->a([B)I

    .line 281
    .line 282
    .line 283
    move-result v5

    .line 284
    iget-object v7, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 285
    .line 286
    if-eqz v7, :cond_c

    .line 287
    .line 288
    invoke-virtual {v7}, Ll/sqr0;->b()Ll/znr0;

    .line 289
    .line 290
    .line 291
    move-result-object v7

    .line 292
    invoke-virtual {v7, v5}, Ll/znr0;->f(I)Ll/znr0;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v7}, Ll/znr0;->D()Ll/sqr0;

    .line 296
    .line 297
    .line 298
    move-result-object v5

    .line 299
    iput-object v5, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 300
    .line 301
    goto :goto_9

    .line 302
    :cond_c
    throw v0

    .line 303
    :cond_d
    :goto_9
    iget-object v5, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 304
    .line 305
    invoke-virtual {v1, v5, v0}, Ll/kwy0;->C0(Ll/sqr0;Landroid/media/MediaFormat;)V

    .line 306
    .line 307
    .line 308
    iput-boolean v3, v1, Ll/kwy0;->S0:Z

    .line 309
    .line 310
    goto :goto_a

    .line 311
    :cond_e
    throw v0

    .line 312
    :cond_f
    :goto_a
    iget-object v5, v1, Ll/kwy0;->w:Ll/evx0;

    .line 313
    .line 314
    invoke-virtual {v5}, Ll/evx0;->j()V

    .line 315
    .line 316
    .line 317
    iget-object v5, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 318
    .line 319
    if-eqz v5, :cond_12

    .line 320
    .line 321
    iget-object v5, v5, Ll/sqr0;->l:Ljava/lang/String;

    .line 322
    .line 323
    invoke-static {v5, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v5

    .line 327
    if-eqz v5, :cond_12

    .line 328
    .line 329
    iget-object v5, v1, Ll/kwy0;->w:Ll/evx0;

    .line 330
    .line 331
    invoke-virtual {v5}, Ll/fux0;->e()Z

    .line 332
    .line 333
    .line 334
    move-result v6

    .line 335
    if-eqz v6, :cond_10

    .line 336
    .line 337
    iget-object v6, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 338
    .line 339
    iput-object v6, v5, Ll/evx0;->b:Ll/sqr0;

    .line 340
    .line 341
    invoke-virtual {v1, v5}, Ll/kwy0;->y0(Ll/evx0;)V

    .line 342
    .line 343
    .line 344
    :cond_10
    invoke-virtual {v1}, Ll/qwx0;->K()J

    .line 345
    .line 346
    .line 347
    move-result-wide v5

    .line 348
    iget-object v7, v1, Ll/kwy0;->w:Ll/evx0;

    .line 349
    .line 350
    iget-wide v8, v7, Ll/evx0;->f:J

    .line 351
    .line 352
    invoke-static {v5, v6, v8, v9}, Ll/xfr0;->f(JJ)Z

    .line 353
    .line 354
    .line 355
    move-result v5

    .line 356
    if-eqz v5, :cond_12

    .line 357
    .line 358
    iget-object v5, v1, Ll/kwy0;->A:Ll/qty0;

    .line 359
    .line 360
    iget-object v6, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 361
    .line 362
    if-eqz v6, :cond_11

    .line 363
    .line 364
    iget-object v6, v6, Ll/sqr0;->n:Ljava/util/List;

    .line 365
    .line 366
    invoke-virtual {v5, v7, v6}, Ll/qty0;->a(Ll/evx0;Ljava/util/List;)V

    .line 367
    .line 368
    .line 369
    goto :goto_b

    .line 370
    :cond_11
    throw v0

    .line 371
    :cond_12
    :goto_b
    iget-object v5, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 372
    .line 373
    invoke-virtual {v5}, Ll/tvy0;->q()Z

    .line 374
    .line 375
    .line 376
    move-result v6

    .line 377
    if-nez v6, :cond_13

    .line 378
    .line 379
    goto :goto_c

    .line 380
    :cond_13
    invoke-virtual {v1}, Ll/qwx0;->K()J

    .line 381
    .line 382
    .line 383
    move-result-wide v6

    .line 384
    invoke-virtual {v5}, Ll/tvy0;->n()J

    .line 385
    .line 386
    .line 387
    move-result-wide v8

    .line 388
    invoke-virtual {v1, v6, v7, v8, v9}, Ll/kwy0;->n0(JJ)Z

    .line 389
    .line 390
    .line 391
    move-result v5

    .line 392
    iget-object v8, v1, Ll/kwy0;->w:Ll/evx0;

    .line 393
    .line 394
    iget-wide v8, v8, Ll/evx0;->f:J

    .line 395
    .line 396
    invoke-virtual {v1, v6, v7, v8, v9}, Ll/kwy0;->n0(JJ)Z

    .line 397
    .line 398
    .line 399
    move-result v6

    .line 400
    if-ne v5, v6, :cond_14

    .line 401
    .line 402
    :goto_c
    iget-object v5, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 403
    .line 404
    iget-object v6, v1, Ll/kwy0;->w:Ll/evx0;

    .line 405
    .line 406
    invoke-virtual {v5, v6}, Ll/tvy0;->p(Ll/evx0;)Z

    .line 407
    .line 408
    .line 409
    move-result v5

    .line 410
    if-nez v5, :cond_9

    .line 411
    .line 412
    :cond_14
    iput-boolean v2, v1, Ll/kwy0;->F0:Z

    .line 413
    .line 414
    goto :goto_d

    .line 415
    :cond_15
    invoke-virtual {v1, v4}, Ll/kwy0;->s0(Ll/l9y0;)Ll/zwx0;

    .line 416
    .line 417
    .line 418
    :goto_d
    iget-object v4, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 419
    .line 420
    invoke-virtual {v4}, Ll/tvy0;->q()Z

    .line 421
    .line 422
    .line 423
    move-result v5

    .line 424
    if-eqz v5, :cond_16

    .line 425
    .line 426
    invoke-virtual {v4}, Ll/evx0;->j()V

    .line 427
    .line 428
    .line 429
    :cond_16
    iget-object v4, v1, Ll/kwy0;->x:Ll/tvy0;

    .line 430
    .line 431
    invoke-virtual {v4}, Ll/tvy0;->q()Z

    .line 432
    .line 433
    .line 434
    move-result v4

    .line 435
    if-nez v4, :cond_7

    .line 436
    .line 437
    iget-boolean v4, v1, Ll/kwy0;->Q0:Z

    .line 438
    .line 439
    if-nez v4, :cond_7

    .line 440
    .line 441
    iget-boolean v4, v1, Ll/kwy0;->G0:Z

    .line 442
    .line 443
    if-eqz v4, :cond_17

    .line 444
    .line 445
    goto/16 :goto_7

    .line 446
    .line 447
    :cond_17
    :goto_e
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 448
    .line 449
    .line 450
    move/from16 v17, v3

    .line 451
    .line 452
    goto/16 :goto_1e

    .line 453
    .line 454
    :catch_4
    move-exception v0

    .line 455
    const/4 v2, 0x1

    .line 456
    goto/16 :goto_5

    .line 457
    .line 458
    :cond_18
    move-object v0, v5

    .line 459
    const/4 v3, 0x0

    .line 460
    iget-object v5, v1, Ll/kwy0;->H:Ll/bwy0;
    :try_end_7
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_2

    .line 461
    .line 462
    if-eqz v5, :cond_32

    .line 463
    .line 464
    :try_start_8
    invoke-virtual {v1}, Ll/qwx0;->L()Ll/mfv0;

    .line 465
    .line 466
    .line 467
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 468
    .line 469
    .line 470
    move-result-wide v5

    .line 471
    const-string v7, "drainAndFeed"

    .line 472
    .line 473
    sget v8, Ll/mpw0;->a:I

    .line 474
    .line 475
    invoke-static {v7}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 476
    .line 477
    .line 478
    move-wide v7, v5

    .line 479
    :goto_f
    iget-object v6, v1, Ll/kwy0;->H:Ll/bwy0;

    .line 480
    .line 481
    if-eqz v6, :cond_31

    .line 482
    .line 483
    invoke-virtual {v1}, Ll/kwy0;->m0()Z

    .line 484
    .line 485
    .line 486
    move-result v5
    :try_end_8
    .catch Ljava/lang/IllegalStateException; {:try_start_8 .. :try_end_8} :catch_e

    .line 487
    if-nez v5, :cond_28

    .line 488
    .line 489
    :try_start_9
    iget-boolean v5, v1, Ll/kwy0;->S:Z

    .line 490
    .line 491
    if-eqz v5, :cond_1a

    .line 492
    .line 493
    iget-boolean v5, v1, Ll/kwy0;->M0:Z
    :try_end_9
    .catch Ljava/lang/IllegalStateException; {:try_start_9 .. :try_end_9} :catch_2

    .line 494
    .line 495
    if-eqz v5, :cond_1a

    .line 496
    .line 497
    :try_start_a
    iget-object v5, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 498
    .line 499
    invoke-interface {v6, v5}, Ll/bwy0;->f(Landroid/media/MediaCodec$BufferInfo;)I

    .line 500
    .line 501
    .line 502
    move-result v5
    :try_end_a
    .catch Ljava/lang/IllegalStateException; {:try_start_a .. :try_end_a} :catch_5

    .line 503
    goto :goto_11

    .line 504
    :catch_5
    :try_start_b
    invoke-virtual {v1}, Ll/kwy0;->f0()V

    .line 505
    .line 506
    .line 507
    iget-boolean v0, v1, Ll/kwy0;->R0:Z

    .line 508
    .line 509
    if-eqz v0, :cond_19

    .line 510
    .line 511
    invoke-virtual {v1}, Ll/kwy0;->W()V

    .line 512
    .line 513
    .line 514
    :cond_19
    :goto_10
    move/from16 v17, v3

    .line 515
    .line 516
    move-wide v14, v7

    .line 517
    goto/16 :goto_1d

    .line 518
    .line 519
    :cond_1a
    iget-object v5, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 520
    .line 521
    invoke-interface {v6, v5}, Ll/bwy0;->f(Landroid/media/MediaCodec$BufferInfo;)I

    .line 522
    .line 523
    .line 524
    move-result v5

    .line 525
    :goto_11
    if-gez v5, :cond_1f

    .line 526
    .line 527
    const/4 v6, -0x2

    .line 528
    if-ne v5, v6, :cond_1d

    .line 529
    .line 530
    iput-boolean v2, v1, Ll/kwy0;->N0:Z

    .line 531
    .line 532
    iget-object v5, v1, Ll/kwy0;->H:Ll/bwy0;

    .line 533
    .line 534
    if-eqz v5, :cond_1c

    .line 535
    .line 536
    invoke-interface {v5}, Ll/bwy0;->zzc()Landroid/media/MediaFormat;

    .line 537
    .line 538
    .line 539
    move-result-object v5

    .line 540
    iget v6, v1, Ll/kwy0;->P:I

    .line 541
    .line 542
    if-eqz v6, :cond_1b

    .line 543
    .line 544
    const-string v6, "width"

    .line 545
    .line 546
    invoke-virtual {v5, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 547
    .line 548
    .line 549
    move-result v6

    .line 550
    const/16 v9, 0x20

    .line 551
    .line 552
    if-ne v6, v9, :cond_1b

    .line 553
    .line 554
    const-string v6, "height"

    .line 555
    .line 556
    invoke-virtual {v5, v6}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 557
    .line 558
    .line 559
    move-result v6

    .line 560
    if-ne v6, v9, :cond_1b

    .line 561
    .line 562
    iput-boolean v2, v1, Ll/kwy0;->U:Z

    .line 563
    .line 564
    :goto_12
    move/from16 v17, v3

    .line 565
    .line 566
    move/from16 v16, v4

    .line 567
    .line 568
    move-wide v14, v7

    .line 569
    goto/16 :goto_1c

    .line 570
    .line 571
    :cond_1b
    iput-object v5, v1, Ll/kwy0;->J:Landroid/media/MediaFormat;

    .line 572
    .line 573
    iput-boolean v2, v1, Ll/kwy0;->K:Z

    .line 574
    .line 575
    goto :goto_12

    .line 576
    :cond_1c
    throw v0

    .line 577
    :cond_1d
    iget-boolean v0, v1, Ll/kwy0;->V:Z

    .line 578
    .line 579
    if-eqz v0, :cond_19

    .line 580
    .line 581
    iget-boolean v0, v1, Ll/kwy0;->Q0:Z

    .line 582
    .line 583
    if-nez v0, :cond_1e

    .line 584
    .line 585
    iget v0, v1, Ll/kwy0;->J0:I

    .line 586
    .line 587
    if-ne v0, v4, :cond_19

    .line 588
    .line 589
    :cond_1e
    invoke-virtual {v1}, Ll/kwy0;->f0()V

    .line 590
    .line 591
    .line 592
    goto :goto_10

    .line 593
    :cond_1f
    iget-boolean v9, v1, Ll/kwy0;->U:Z

    .line 594
    .line 595
    if-eqz v9, :cond_20

    .line 596
    .line 597
    iput-boolean v3, v1, Ll/kwy0;->U:Z

    .line 598
    .line 599
    invoke-interface {v6, v5, v3}, Ll/bwy0;->e(IZ)V

    .line 600
    .line 601
    .line 602
    goto :goto_12

    .line 603
    :cond_20
    iget-object v9, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 604
    .line 605
    iget v10, v9, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 606
    .line 607
    if-nez v10, :cond_21

    .line 608
    .line 609
    iget v9, v9, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 610
    .line 611
    and-int/lit8 v9, v9, 0x4

    .line 612
    .line 613
    if-eqz v9, :cond_21

    .line 614
    .line 615
    invoke-virtual {v1}, Ll/kwy0;->f0()V

    .line 616
    .line 617
    .line 618
    goto :goto_10

    .line 619
    :cond_21
    iput v5, v1, Ll/kwy0;->Y:I

    .line 620
    .line 621
    invoke-interface {v6, v5}, Ll/bwy0;->zzg(I)Ljava/nio/ByteBuffer;

    .line 622
    .line 623
    .line 624
    move-result-object v5

    .line 625
    iput-object v5, v1, Ll/kwy0;->Z:Ljava/nio/ByteBuffer;

    .line 626
    .line 627
    if-eqz v5, :cond_22

    .line 628
    .line 629
    iget-object v9, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 630
    .line 631
    iget v9, v9, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 632
    .line 633
    invoke-virtual {v5, v9}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 634
    .line 635
    .line 636
    iget-object v5, v1, Ll/kwy0;->Z:Ljava/nio/ByteBuffer;

    .line 637
    .line 638
    iget-object v9, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 639
    .line 640
    iget v10, v9, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 641
    .line 642
    iget v9, v9, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 643
    .line 644
    add-int/2addr v10, v9

    .line 645
    invoke-virtual {v5, v10}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 646
    .line 647
    .line 648
    :cond_22
    iget-object v5, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 649
    .line 650
    iget-wide v9, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 651
    .line 652
    invoke-virtual {v1}, Ll/qwx0;->K()J

    .line 653
    .line 654
    .line 655
    move-result-wide v11

    .line 656
    cmp-long v5, v9, v11

    .line 657
    .line 658
    if-gez v5, :cond_23

    .line 659
    .line 660
    move v5, v2

    .line 661
    goto :goto_13

    .line 662
    :cond_23
    move v5, v3

    .line 663
    :goto_13
    iput-boolean v5, v1, Ll/kwy0;->k0:Z

    .line 664
    .line 665
    iget-wide v9, v1, Ll/kwy0;->P0:J

    .line 666
    .line 667
    const-wide v11, -0x7fffffffffffffffL    # -4.9E-324

    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    cmp-long v5, v9, v11

    .line 673
    .line 674
    if-eqz v5, :cond_24

    .line 675
    .line 676
    iget-object v5, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 677
    .line 678
    iget-wide v11, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 679
    .line 680
    cmp-long v5, v9, v11

    .line 681
    .line 682
    if-gtz v5, :cond_24

    .line 683
    .line 684
    move v5, v2

    .line 685
    goto :goto_14

    .line 686
    :cond_24
    move v5, v3

    .line 687
    :goto_14
    iput-boolean v5, v1, Ll/kwy0;->p0:Z

    .line 688
    .line 689
    iget-object v5, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 690
    .line 691
    iget-wide v9, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 692
    .line 693
    iget-object v5, v1, Ll/kwy0;->U0:Ll/jwy0;

    .line 694
    .line 695
    iget-object v5, v5, Ll/jwy0;->d:Ll/imw0;

    .line 696
    .line 697
    invoke-virtual {v5, v9, v10}, Ll/imw0;->c(J)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    move-result-object v5

    .line 701
    check-cast v5, Ll/sqr0;

    .line 702
    .line 703
    if-nez v5, :cond_25

    .line 704
    .line 705
    iget-boolean v9, v1, Ll/kwy0;->W0:Z

    .line 706
    .line 707
    if-eqz v9, :cond_25

    .line 708
    .line 709
    iget-object v9, v1, Ll/kwy0;->J:Landroid/media/MediaFormat;

    .line 710
    .line 711
    if-eqz v9, :cond_25

    .line 712
    .line 713
    iget-object v5, v1, Ll/kwy0;->U0:Ll/jwy0;

    .line 714
    .line 715
    iget-object v5, v5, Ll/jwy0;->d:Ll/imw0;

    .line 716
    .line 717
    invoke-virtual {v5}, Ll/imw0;->b()Ljava/lang/Object;

    .line 718
    .line 719
    .line 720
    move-result-object v5

    .line 721
    check-cast v5, Ll/sqr0;

    .line 722
    .line 723
    :cond_25
    if-eqz v5, :cond_26

    .line 724
    .line 725
    iput-object v5, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 726
    .line 727
    goto :goto_15

    .line 728
    :cond_26
    iget-boolean v5, v1, Ll/kwy0;->K:Z

    .line 729
    .line 730
    if-eqz v5, :cond_28

    .line 731
    .line 732
    iget-object v5, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 733
    .line 734
    if-eqz v5, :cond_28

    .line 735
    .line 736
    :goto_15
    iget-object v5, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 737
    .line 738
    if-eqz v5, :cond_27

    .line 739
    .line 740
    iget-object v9, v1, Ll/kwy0;->J:Landroid/media/MediaFormat;

    .line 741
    .line 742
    invoke-virtual {v1, v5, v9}, Ll/kwy0;->C0(Ll/sqr0;Landroid/media/MediaFormat;)V

    .line 743
    .line 744
    .line 745
    iput-boolean v3, v1, Ll/kwy0;->K:Z

    .line 746
    .line 747
    iput-boolean v3, v1, Ll/kwy0;->W0:Z

    .line 748
    .line 749
    goto :goto_16

    .line 750
    :cond_27
    throw v0
    :try_end_b
    .catch Ljava/lang/IllegalStateException; {:try_start_b .. :try_end_b} :catch_2

    .line 751
    :cond_28
    :goto_16
    :try_start_c
    iget-boolean v5, v1, Ll/kwy0;->S:Z

    .line 752
    .line 753
    if-eqz v5, :cond_2b

    .line 754
    .line 755
    iget-boolean v5, v1, Ll/kwy0;->M0:Z
    :try_end_c
    .catch Ljava/lang/IllegalStateException; {:try_start_c .. :try_end_c} :catch_e

    .line 756
    .line 757
    if-eqz v5, :cond_2b

    .line 758
    .line 759
    move-wide v8, v7

    .line 760
    :try_start_d
    iget-object v7, v1, Ll/kwy0;->Z:Ljava/nio/ByteBuffer;
    :try_end_d
    .catch Ljava/lang/IllegalStateException; {:try_start_d .. :try_end_d} :catch_b

    .line 761
    .line 762
    move-wide v9, v8

    .line 763
    :try_start_e
    iget v8, v1, Ll/kwy0;->Y:I

    .line 764
    .line 765
    iget-object v5, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;
    :try_end_e
    .catch Ljava/lang/IllegalStateException; {:try_start_e .. :try_end_e} :catch_a

    .line 766
    .line 767
    move-wide v10, v9

    .line 768
    :try_start_f
    iget v9, v5, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 769
    .line 770
    iget-wide v12, v5, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J
    :try_end_f
    .catch Ljava/lang/IllegalStateException; {:try_start_f .. :try_end_f} :catch_9

    .line 771
    .line 772
    move-wide v14, v10

    .line 773
    move-wide v11, v12

    .line 774
    :try_start_10
    iget-boolean v13, v1, Ll/kwy0;->k0:Z
    :try_end_10
    .catch Ljava/lang/IllegalStateException; {:try_start_10 .. :try_end_10} :catch_8

    .line 775
    .line 776
    move-wide v15, v14

    .line 777
    :try_start_11
    iget-boolean v14, v1, Ll/kwy0;->p0:Z
    :try_end_11
    .catch Ljava/lang/IllegalStateException; {:try_start_11 .. :try_end_11} :catch_7

    .line 778
    .line 779
    move-wide/from16 v16, v15

    .line 780
    .line 781
    :try_start_12
    iget-object v15, v1, Ll/kwy0;->C:Ll/sqr0;
    :try_end_12
    .catch Ljava/lang/IllegalStateException; {:try_start_12 .. :try_end_12} :catch_6

    .line 782
    .line 783
    if-eqz v15, :cond_29

    .line 784
    .line 785
    const/4 v10, 0x1

    .line 786
    move-wide/from16 v18, v16

    .line 787
    .line 788
    move/from16 v17, v3

    .line 789
    .line 790
    move/from16 v16, v4

    .line 791
    .line 792
    move-wide/from16 v2, p1

    .line 793
    .line 794
    move-wide/from16 v4, p3

    .line 795
    .line 796
    :try_start_13
    invoke-virtual/range {v1 .. v15}, Ll/kwy0;->G0(JJLl/bwy0;Ljava/nio/ByteBuffer;IIIJZZLl/sqr0;)Z

    .line 797
    .line 798
    .line 799
    move-result v6

    .line 800
    goto/16 :goto_1b

    .line 801
    .line 802
    :cond_29
    move-wide/from16 v18, v16

    .line 803
    .line 804
    move/from16 v17, v3

    .line 805
    .line 806
    throw v0
    :try_end_13
    .catch Ljava/lang/IllegalStateException; {:try_start_13 .. :try_end_13} :catch_c

    .line 807
    :catch_6
    move-wide/from16 v18, v16

    .line 808
    .line 809
    move/from16 v17, v3

    .line 810
    .line 811
    goto :goto_17

    .line 812
    :catch_7
    move/from16 v17, v3

    .line 813
    .line 814
    move-wide/from16 v18, v15

    .line 815
    .line 816
    goto :goto_17

    .line 817
    :catch_8
    move/from16 v17, v3

    .line 818
    .line 819
    move-wide/from16 v18, v14

    .line 820
    .line 821
    goto :goto_17

    .line 822
    :catch_9
    move/from16 v17, v3

    .line 823
    .line 824
    move-wide/from16 v18, v10

    .line 825
    .line 826
    goto :goto_17

    .line 827
    :catch_a
    move/from16 v17, v3

    .line 828
    .line 829
    move-wide/from16 v18, v9

    .line 830
    .line 831
    goto :goto_17

    .line 832
    :catch_b
    move/from16 v17, v3

    .line 833
    .line 834
    move-wide/from16 v18, v8

    .line 835
    .line 836
    :catch_c
    :goto_17
    :try_start_14
    invoke-virtual {v1}, Ll/kwy0;->f0()V

    .line 837
    .line 838
    .line 839
    iget-boolean v0, v1, Ll/kwy0;->R0:Z

    .line 840
    .line 841
    if-eqz v0, :cond_2a

    .line 842
    .line 843
    invoke-virtual {v1}, Ll/kwy0;->W()V

    .line 844
    .line 845
    .line 846
    :cond_2a
    :goto_18
    move-wide/from16 v14, v18

    .line 847
    .line 848
    goto :goto_1d

    .line 849
    :catch_d
    move-exception v0

    .line 850
    :goto_19
    const/4 v2, 0x1

    .line 851
    goto/16 :goto_1f

    .line 852
    .line 853
    :cond_2b
    move/from16 v17, v3

    .line 854
    .line 855
    move/from16 v16, v4

    .line 856
    .line 857
    move-wide/from16 v18, v7

    .line 858
    .line 859
    goto :goto_1a

    .line 860
    :catch_e
    move-exception v0

    .line 861
    move/from16 v17, v3

    .line 862
    .line 863
    goto :goto_19

    .line 864
    :goto_1a
    iget-object v7, v1, Ll/kwy0;->Z:Ljava/nio/ByteBuffer;

    .line 865
    .line 866
    iget v8, v1, Ll/kwy0;->Y:I

    .line 867
    .line 868
    iget-object v2, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 869
    .line 870
    iget v9, v2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 871
    .line 872
    iget-wide v11, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 873
    .line 874
    iget-boolean v13, v1, Ll/kwy0;->k0:Z

    .line 875
    .line 876
    iget-boolean v14, v1, Ll/kwy0;->p0:Z

    .line 877
    .line 878
    iget-object v15, v1, Ll/kwy0;->C:Ll/sqr0;

    .line 879
    .line 880
    if-eqz v15, :cond_30

    .line 881
    .line 882
    const/4 v10, 0x1

    .line 883
    move-wide/from16 v2, p1

    .line 884
    .line 885
    move-wide/from16 v4, p3

    .line 886
    .line 887
    invoke-virtual/range {v1 .. v15}, Ll/kwy0;->G0(JJLl/bwy0;Ljava/nio/ByteBuffer;IIIJZZLl/sqr0;)Z

    .line 888
    .line 889
    .line 890
    move-result v6

    .line 891
    :goto_1b
    if-eqz v6, :cond_2a

    .line 892
    .line 893
    iget-object v2, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 894
    .line 895
    iget-wide v2, v2, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 896
    .line 897
    invoke-virtual {v1, v2, v3}, Ll/kwy0;->P0(J)V

    .line 898
    .line 899
    .line 900
    iget-object v2, v1, Ll/kwy0;->y:Landroid/media/MediaCodec$BufferInfo;

    .line 901
    .line 902
    iget v2, v2, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 903
    .line 904
    and-int/lit8 v2, v2, 0x4

    .line 905
    .line 906
    invoke-direct {v1}, Ll/kwy0;->h0()V

    .line 907
    .line 908
    .line 909
    if-eqz v2, :cond_2c

    .line 910
    .line 911
    invoke-virtual {v1}, Ll/kwy0;->f0()V

    .line 912
    .line 913
    .line 914
    goto :goto_18

    .line 915
    :cond_2c
    move-wide/from16 v14, v18

    .line 916
    .line 917
    :goto_1c
    invoke-virtual {v1, v14, v15}, Ll/kwy0;->p0(J)Z

    .line 918
    .line 919
    .line 920
    move-result v2

    .line 921
    if-nez v2, :cond_2d

    .line 922
    .line 923
    goto :goto_1d

    .line 924
    :cond_2d
    move-wide v7, v14

    .line 925
    move/from16 v4, v16

    .line 926
    .line 927
    move/from16 v3, v17

    .line 928
    .line 929
    const/4 v2, 0x1

    .line 930
    goto/16 :goto_f

    .line 931
    .line 932
    :cond_2e
    :goto_1d
    invoke-virtual {v1}, Ll/kwy0;->l0()Z

    .line 933
    .line 934
    .line 935
    move-result v0

    .line 936
    if-eqz v0, :cond_2f

    .line 937
    .line 938
    invoke-virtual {v1, v14, v15}, Ll/kwy0;->p0(J)Z

    .line 939
    .line 940
    .line 941
    move-result v0

    .line 942
    if-nez v0, :cond_2e

    .line 943
    .line 944
    :cond_2f
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 945
    .line 946
    .line 947
    const/4 v2, 0x1

    .line 948
    goto :goto_1e

    .line 949
    :cond_30
    throw v0

    .line 950
    :cond_31
    move/from16 v17, v3

    .line 951
    .line 952
    throw v0

    .line 953
    :cond_32
    move/from16 v17, v3

    .line 954
    .line 955
    iget-object v0, v1, Ll/kwy0;->T0:Ll/vwx0;

    .line 956
    .line 957
    iget v2, v0, Ll/vwx0;->d:I

    .line 958
    .line 959
    invoke-virtual/range {p0 .. p2}, Ll/qwx0;->J(J)I

    .line 960
    .line 961
    .line 962
    move-result v3

    .line 963
    add-int/2addr v2, v3

    .line 964
    iput v2, v0, Ll/vwx0;->d:I
    :try_end_14
    .catch Ljava/lang/IllegalStateException; {:try_start_14 .. :try_end_14} :catch_d

    .line 965
    .line 966
    const/4 v2, 0x1

    .line 967
    :try_start_15
    invoke-virtual {v1, v2}, Ll/kwy0;->o0(I)Z

    .line 968
    .line 969
    .line 970
    :goto_1e
    iget-object v0, v1, Ll/kwy0;->T0:Ll/vwx0;

    .line 971
    .line 972
    invoke-virtual {v0}, Ll/vwx0;->a()V
    :try_end_15
    .catch Ljava/lang/IllegalStateException; {:try_start_15 .. :try_end_15} :catch_f

    .line 973
    .line 974
    .line 975
    :cond_33
    return-void

    .line 976
    :catch_f
    move-exception v0

    .line 977
    :goto_1f
    sget v3, Ll/mpw0;->a:I

    .line 978
    .line 979
    instance-of v3, v0, Landroid/media/MediaCodec$CodecException;

    .line 980
    .line 981
    if-eqz v3, :cond_34

    .line 982
    .line 983
    goto :goto_20

    .line 984
    :cond_34
    invoke-virtual {v0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 985
    .line 986
    .line 987
    move-result-object v4

    .line 988
    array-length v5, v4

    .line 989
    if-lez v5, :cond_37

    .line 990
    .line 991
    aget-object v4, v4, v17

    .line 992
    .line 993
    invoke-virtual {v4}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 994
    .line 995
    .line 996
    move-result-object v4

    .line 997
    const-string v5, "android.media.MediaCodec"

    .line 998
    .line 999
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1000
    .line 1001
    .line 1002
    move-result v4

    .line 1003
    if-eqz v4, :cond_37

    .line 1004
    .line 1005
    :goto_20
    invoke-virtual {v1, v0}, Ll/kwy0;->z0(Ljava/lang/Exception;)V

    .line 1006
    .line 1007
    .line 1008
    if-eqz v3, :cond_35

    .line 1009
    .line 1010
    move-object v3, v0

    .line 1011
    check-cast v3, Landroid/media/MediaCodec$CodecException;

    .line 1012
    .line 1013
    invoke-virtual {v3}, Landroid/media/MediaCodec$CodecException;->isRecoverable()Z

    .line 1014
    .line 1015
    .line 1016
    move-result v3

    .line 1017
    if-eqz v3, :cond_35

    .line 1018
    .line 1019
    goto :goto_21

    .line 1020
    :cond_35
    move/from16 v2, v17

    .line 1021
    .line 1022
    :goto_21
    if-eqz v2, :cond_36

    .line 1023
    .line 1024
    invoke-virtual {v1}, Ll/kwy0;->W()V

    .line 1025
    .line 1026
    .line 1027
    :cond_36
    iget-object v3, v1, Ll/kwy0;->O:Ll/hwy0;

    .line 1028
    .line 1029
    invoke-virtual {v1, v0, v3}, Ll/kwy0;->M0(Ljava/lang/Throwable;Ll/hwy0;)Lcom/google/android/gms/internal/ads/zzst;

    .line 1030
    .line 1031
    .line 1032
    move-result-object v0

    .line 1033
    iget-object v3, v1, Ll/kwy0;->B:Ll/sqr0;

    .line 1034
    .line 1035
    const/16 v4, 0xfa3

    .line 1036
    .line 1037
    invoke-virtual {v1, v0, v3, v2, v4}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 1038
    .line 1039
    .line 1040
    move-result-object v0

    .line 1041
    throw v0

    .line 1042
    :cond_37
    throw v0
.end method

.method public abstract w0(Ll/dxy0;Ll/sqr0;Z)Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation
.end method

.method public final x0()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/kwy0;->H:Ll/bwy0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    invoke-interface {v0}, Ll/bwy0;->zzi()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/kwy0;->X()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    invoke-virtual {p0}, Ll/kwy0;->X()V

    .line 15
    .line 16
    .line 17
    throw v0
.end method

.method public abstract y0(Ll/evx0;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation
.end method

.method public abstract z0(Ljava/lang/Exception;)V
.end method

.method public zzV()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/kwy0;->R0:Z

    .line 2
    .line 3
    return p0
.end method

.method public final zze()I
    .locals 0

    .line 1
    const/16 p0, 0x8

    .line 2
    .line 3
    return p0
.end method
