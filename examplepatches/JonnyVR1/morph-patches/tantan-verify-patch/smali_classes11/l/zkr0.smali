.class public final Ll/zkr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final c0:Ll/ifr0;

.field public static final d0:[B

.field public static final e0:[B

.field public static final f0:[B

.field public static final g0:[B

.field public static final h0:Ljava/util/UUID;

.field public static final i0:Ljava/util/Map;


# instance fields
.field public A:J

.field public B:J

.field public C:Ll/z5w0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public D:Ll/z5w0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public E:Z

.field public F:Z

.field public G:I

.field public H:J

.field public I:J

.field public J:I

.field public K:I

.field public L:[I

.field public M:I

.field public N:I

.field public O:I

.field public P:I

.field public Q:Z

.field public R:J

.field public S:I

.field public T:I

.field public U:I

.field public V:Z

.field public W:Z

.field public X:Z

.field public Y:I

.field public Z:B

.field public final a:Ll/ukr0;

.field public a0:Z

.field public final b:Ll/llr0;

.field public b0:Ll/ser0;

.field public final c:Landroid/util/SparseArray;

.field public final d:Z

.field public final e:Ll/bgw0;

.field public final f:Ll/bgw0;

.field public final g:Ll/bgw0;

.field public final h:Ll/bgw0;

.field public final i:Ll/bgw0;

.field public final j:Ll/bgw0;

.field public final k:Ll/bgw0;

.field public final l:Ll/bgw0;

.field public final m:Ll/bgw0;

.field public final n:Ll/bgw0;

.field public o:Ljava/nio/ByteBuffer;

.field public p:J

.field public q:J

.field public r:J

.field public s:J

.field public t:J

.field public u:Ll/ykr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public v:Z

.field public w:I

.field public x:J

.field public y:Z

.field public z:J


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    sget-object v0, Ll/vkr0;->b:Ll/vkr0;

    .line 2
    .line 3
    sput-object v0, Ll/zkr0;->c0:Ll/ifr0;

    .line 4
    .line 5
    const/16 v0, 0x20

    .line 6
    .line 7
    new-array v1, v0, [B

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    sput-object v1, Ll/zkr0;->d0:[B

    .line 13
    .line 14
    sget v1, Ll/mpw0;->a:I

    .line 15
    .line 16
    const-string v1, "Format: Start, End, ReadOrder, Layer, Style, Name, MarginL, MarginR, MarginV, Effect, Text"

    .line 17
    .line 18
    sget-object v2, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sput-object v1, Ll/zkr0;->e0:[B

    .line 25
    .line 26
    new-array v0, v0, [B

    .line 27
    .line 28
    fill-array-data v0, :array_1

    .line 29
    .line 30
    .line 31
    sput-object v0, Ll/zkr0;->f0:[B

    .line 32
    .line 33
    const/16 v0, 0x26

    .line 34
    .line 35
    new-array v0, v0, [B

    .line 36
    .line 37
    fill-array-data v0, :array_2

    .line 38
    .line 39
    .line 40
    sput-object v0, Ll/zkr0;->g0:[B

    .line 41
    .line 42
    new-instance v0, Ljava/util/UUID;

    .line 43
    .line 44
    const-wide v1, 0x100000000001000L

    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    const-wide v3, -0x7fffff55ffc7648fL    # -3.607411173533E-312

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    invoke-direct {v0, v1, v2, v3, v4}, Ljava/util/UUID;-><init>(JJ)V

    .line 55
    .line 56
    .line 57
    sput-object v0, Ll/zkr0;->h0:Ljava/util/UUID;

    .line 58
    .line 59
    new-instance v0, Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 62
    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-string v2, "htc_video_rotA-000"

    .line 70
    .line 71
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    const/16 v1, 0x5a

    .line 75
    .line 76
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const-string v2, "htc_video_rotA-090"

    .line 81
    .line 82
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    const/16 v1, 0xb4

    .line 86
    .line 87
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "htc_video_rotA-180"

    .line 92
    .line 93
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    const/16 v1, 0x10e

    .line 97
    .line 98
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    const-string v2, "htc_video_rotA-270"

    .line 103
    .line 104
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    sput-object v0, Ll/zkr0;->i0:Ljava/util/Map;

    .line 112
    .line 113
    return-void

    .line 114
    nop

    .line 115
    :array_0
    .array-data 1
        0x31t
        0xat
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x2ct
        0x30t
        0x30t
        0x30t
        0x20t
        0x2dt
        0x2dt
        0x3et
        0x20t
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x2ct
        0x30t
        0x30t
        0x30t
        0xat
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    :array_1
    .array-data 1
        0x44t
        0x69t
        0x61t
        0x6ct
        0x6ft
        0x67t
        0x75t
        0x65t
        0x3at
        0x20t
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x2ct
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x2ct
    .end array-data

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    :array_2
    .array-data 1
        0x57t
        0x45t
        0x42t
        0x56t
        0x54t
        0x54t
        0xat
        0xat
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x2et
        0x30t
        0x30t
        0x30t
        0x20t
        0x2dt
        0x2dt
        0x3et
        0x20t
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x3at
        0x30t
        0x30t
        0x2et
        0x30t
        0x30t
        0x30t
        0xat
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 151
    invoke-direct {p0, v0}, Ll/zkr0;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 4

    .line 1
    new-instance p1, Ll/skr0;

    .line 2
    .line 3
    invoke-direct {p1}, Ll/skr0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, -0x1

    .line 10
    .line 11
    iput-wide v0, p0, Ll/zkr0;->q:J

    .line 12
    .line 13
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    iput-wide v2, p0, Ll/zkr0;->r:J

    .line 19
    .line 20
    iput-wide v2, p0, Ll/zkr0;->s:J

    .line 21
    .line 22
    iput-wide v2, p0, Ll/zkr0;->t:J

    .line 23
    .line 24
    iput-wide v0, p0, Ll/zkr0;->z:J

    .line 25
    .line 26
    iput-wide v0, p0, Ll/zkr0;->A:J

    .line 27
    .line 28
    iput-wide v2, p0, Ll/zkr0;->B:J

    .line 29
    .line 30
    iput-object p1, p0, Ll/zkr0;->a:Ll/ukr0;

    .line 31
    .line 32
    new-instance v0, Ll/xkr0;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-direct {v0, p0, v1}, Ll/xkr0;-><init>(Ll/zkr0;Ll/wkr0;)V

    .line 36
    .line 37
    .line 38
    invoke-interface {p1, v0}, Ll/ukr0;->b(Ll/tkr0;)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Ll/zkr0;->d:Z

    .line 43
    .line 44
    new-instance v0, Ll/llr0;

    .line 45
    .line 46
    invoke-direct {v0}, Ll/llr0;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Ll/zkr0;->b:Ll/llr0;

    .line 50
    .line 51
    new-instance v0, Landroid/util/SparseArray;

    .line 52
    .line 53
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 57
    .line 58
    new-instance v0, Ll/bgw0;

    .line 59
    .line 60
    const/4 v1, 0x4

    .line 61
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 65
    .line 66
    new-instance v0, Ll/bgw0;

    .line 67
    .line 68
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    const/4 v3, -0x1

    .line 73
    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-direct {v0, v2}, Ll/bgw0;-><init>([B)V

    .line 82
    .line 83
    .line 84
    iput-object v0, p0, Ll/zkr0;->h:Ll/bgw0;

    .line 85
    .line 86
    new-instance v0, Ll/bgw0;

    .line 87
    .line 88
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Ll/zkr0;->i:Ll/bgw0;

    .line 92
    .line 93
    new-instance v0, Ll/bgw0;

    .line 94
    .line 95
    sget-object v2, Ll/w3x0;->a:[B

    .line 96
    .line 97
    invoke-direct {v0, v2}, Ll/bgw0;-><init>([B)V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Ll/zkr0;->e:Ll/bgw0;

    .line 101
    .line 102
    new-instance v0, Ll/bgw0;

    .line 103
    .line 104
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 105
    .line 106
    .line 107
    iput-object v0, p0, Ll/zkr0;->f:Ll/bgw0;

    .line 108
    .line 109
    new-instance v0, Ll/bgw0;

    .line 110
    .line 111
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object v0, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 115
    .line 116
    new-instance v0, Ll/bgw0;

    .line 117
    .line 118
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object v0, p0, Ll/zkr0;->k:Ll/bgw0;

    .line 122
    .line 123
    new-instance v0, Ll/bgw0;

    .line 124
    .line 125
    const/16 v1, 0x8

    .line 126
    .line 127
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 128
    .line 129
    .line 130
    iput-object v0, p0, Ll/zkr0;->l:Ll/bgw0;

    .line 131
    .line 132
    new-instance v0, Ll/bgw0;

    .line 133
    .line 134
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 135
    .line 136
    .line 137
    iput-object v0, p0, Ll/zkr0;->m:Ll/bgw0;

    .line 138
    .line 139
    new-instance v0, Ll/bgw0;

    .line 140
    .line 141
    invoke-direct {v0}, Ll/bgw0;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v0, p0, Ll/zkr0;->n:Ll/bgw0;

    .line 145
    .line 146
    new-array p1, p1, [I

    .line 147
    .line 148
    iput-object p1, p0, Ll/zkr0;->L:[I

    .line 149
    .line 150
    return-void
.end method

.method public static bridge synthetic a()Ljava/util/Map;
    .locals 1

    .line 1
    sget-object v0, Ll/zkr0;->i0:Ljava/util/Map;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic b()Ljava/util/UUID;
    .locals 1

    .line 1
    sget-object v0, Ll/zkr0;->h0:Ljava/util/UUID;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic m()[B
    .locals 1

    .line 1
    sget-object v0, Ll/zkr0;->e0:[B

    .line 2
    .line 3
    return-object v0
.end method

.method public static w(JLjava/lang/String;J)[B
    .locals 9

    .line 1
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    cmp-long v0, p0, v0

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 14
    .line 15
    .line 16
    const-wide v0, 0xd693a400L

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    div-long v2, p0, v0

    .line 22
    .line 23
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 24
    .line 25
    long-to-int v2, v2

    .line 26
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    int-to-long v5, v2

    .line 31
    mul-long/2addr v5, v0

    .line 32
    sub-long/2addr p0, v5

    .line 33
    const-wide/32 v0, 0x3938700

    .line 34
    .line 35
    .line 36
    div-long v5, p0, v0

    .line 37
    .line 38
    long-to-int v2, v5

    .line 39
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    int-to-long v6, v2

    .line 44
    mul-long/2addr v6, v0

    .line 45
    sub-long/2addr p0, v6

    .line 46
    const-wide/32 v0, 0xf4240

    .line 47
    .line 48
    .line 49
    div-long v6, p0, v0

    .line 50
    .line 51
    long-to-int v2, v6

    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v6

    .line 56
    int-to-long v7, v2

    .line 57
    mul-long/2addr v7, v0

    .line 58
    sub-long/2addr p0, v7

    .line 59
    div-long/2addr p0, p3

    .line 60
    long-to-int p0, p0

    .line 61
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    filled-new-array {v3, v5, v6, p0}, [Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-static {v4, p2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    sget p1, Ll/mpw0;->a:I

    .line 74
    .line 75
    sget-object p1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method public static x([II)[I
    .locals 1
    .param p0    # [I
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    new-array p0, p1, [I

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    array-length v0, p0

    .line 7
    if-lt v0, p1, :cond_1

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_1
    add-int/2addr v0, v0

    .line 11
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    new-array p0, p0, [I

    .line 16
    .line 17
    return-object p0
.end method


# virtual methods
.method public final c(JJ)V
    .locals 0
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 2
    .line 3
    .line 4
    .line 5
    .line 6
    iput-wide p1, p0, Ll/zkr0;->B:J

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Ll/zkr0;->G:I

    .line 10
    .line 11
    iget-object p2, p0, Ll/zkr0;->a:Ll/ukr0;

    .line 12
    .line 13
    invoke-interface {p2}, Ll/ukr0;->zzb()V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Ll/zkr0;->b:Ll/llr0;

    .line 17
    .line 18
    invoke-virtual {p2}, Ll/llr0;->e()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/zkr0;->u()V

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object p2, p0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/util/SparseArray;->size()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    if-ge p1, p2, :cond_1

    .line 31
    .line 32
    iget-object p2, p0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 33
    .line 34
    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    check-cast p2, Ll/ykr0;

    .line 39
    .line 40
    iget-object p2, p2, Ll/ykr0;->U:Ll/tgr0;

    .line 41
    .line 42
    if-eqz p2, :cond_0

    .line 43
    .line 44
    invoke-virtual {p2}, Ll/tgr0;->b()V

    .line 45
    .line 46
    .line 47
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Ll/alr0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/alr0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/alr0;->a(Ll/qer0;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final e(Ll/ser0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zkr0;->b0:Ll/ser0;

    .line 2
    .line 3
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/zkr0;->F:Z

    .line 3
    .line 4
    :cond_0
    iget-boolean v1, p0, Ll/zkr0;->F:Z

    .line 5
    .line 6
    if-nez v1, :cond_5

    .line 7
    .line 8
    iget-object v1, p0, Ll/zkr0;->a:Ll/ukr0;

    .line 9
    .line 10
    invoke-interface {v1, p1}, Ll/ukr0;->a(Ll/qer0;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 17
    .line 18
    .line 19
    move-result-wide v1

    .line 20
    iget-boolean v3, p0, Ll/zkr0;->y:Z

    .line 21
    .line 22
    if-eqz v3, :cond_1

    .line 23
    .line 24
    iput-wide v1, p0, Ll/zkr0;->A:J

    .line 25
    .line 26
    iget-wide v1, p0, Ll/zkr0;->z:J

    .line 27
    .line 28
    iput-wide v1, p2, Ll/yfr0;->a:J

    .line 29
    .line 30
    iput-boolean v0, p0, Ll/zkr0;->y:Z

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-boolean v1, p0, Ll/zkr0;->v:Z

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    iget-wide v1, p0, Ll/zkr0;->A:J

    .line 38
    .line 39
    const-wide/16 v3, -0x1

    .line 40
    .line 41
    cmp-long v5, v1, v3

    .line 42
    .line 43
    if-eqz v5, :cond_0

    .line 44
    .line 45
    iput-wide v1, p2, Ll/yfr0;->a:J

    .line 46
    .line 47
    iput-wide v3, p0, Ll/zkr0;->A:J

    .line 48
    .line 49
    :goto_0
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_2
    :goto_1
    iget-object p1, p0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-ge v0, p1, :cond_4

    .line 58
    .line 59
    iget-object p1, p0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ll/ykr0;

    .line 66
    .line 67
    invoke-static {p1}, Ll/ykr0;->d(Ll/ykr0;)V

    .line 68
    .line 69
    .line 70
    iget-object p2, p1, Ll/ykr0;->U:Ll/tgr0;

    .line 71
    .line 72
    if-eqz p2, :cond_3

    .line 73
    .line 74
    iget-object v1, p1, Ll/ykr0;->Y:Ll/sgr0;

    .line 75
    .line 76
    iget-object p1, p1, Ll/ykr0;->j:Ll/ggr0;

    .line 77
    .line 78
    invoke-virtual {p2, v1, p1}, Ll/tgr0;->a(Ll/sgr0;Ll/ggr0;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    const/4 p0, -0x1

    .line 85
    return p0

    .line 86
    :cond_5
    return v0
.end method

.method public final g(IILl/qer0;)V
    .locals 24
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    move-object/from16 v7, p3

    .line 8
    .line 9
    const/16 v3, 0xa1

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    const/4 v5, 0x4

    .line 13
    const/16 v6, 0xa3

    .line 14
    .line 15
    const/4 v8, 0x2

    .line 16
    const/4 v9, 0x1

    .line 17
    const/4 v10, 0x0

    .line 18
    if-eq v1, v3, :cond_b

    .line 19
    .line 20
    if-eq v1, v6, :cond_b

    .line 21
    .line 22
    const/16 v3, 0xa5

    .line 23
    .line 24
    if-eq v1, v3, :cond_8

    .line 25
    .line 26
    const/16 v3, 0x41ed

    .line 27
    .line 28
    if-eq v1, v3, :cond_5

    .line 29
    .line 30
    const/16 v3, 0x4255

    .line 31
    .line 32
    if-eq v1, v3, :cond_4

    .line 33
    .line 34
    const/16 v3, 0x47e2

    .line 35
    .line 36
    if-eq v1, v3, :cond_3

    .line 37
    .line 38
    const/16 v3, 0x53ab

    .line 39
    .line 40
    if-eq v1, v3, :cond_2

    .line 41
    .line 42
    const/16 v3, 0x63a2

    .line 43
    .line 44
    if-eq v1, v3, :cond_1

    .line 45
    .line 46
    const/16 v3, 0x7672

    .line 47
    .line 48
    if-ne v1, v3, :cond_0

    .line 49
    .line 50
    invoke-virtual/range {p0 .. p1}, Ll/zkr0;->r(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 54
    .line 55
    new-array v1, v2, [B

    .line 56
    .line 57
    iput-object v1, v0, Ll/ykr0;->w:[B

    .line 58
    .line 59
    move-object v0, v7

    .line 60
    check-cast v0, Ll/fer0;

    .line 61
    .line 62
    invoke-virtual {v0, v1, v10, v2, v10}, Ll/fer0;->b([BIIZ)Z

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 67
    .line 68
    const-string v2, "Unexpected id: "

    .line 69
    .line 70
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-static {v0, v4}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    throw v0

    .line 85
    :cond_1
    invoke-virtual/range {p0 .. p1}, Ll/zkr0;->r(I)V

    .line 86
    .line 87
    .line 88
    iget-object v0, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 89
    .line 90
    new-array v1, v2, [B

    .line 91
    .line 92
    iput-object v1, v0, Ll/ykr0;->k:[B

    .line 93
    .line 94
    move-object v0, v7

    .line 95
    check-cast v0, Ll/fer0;

    .line 96
    .line 97
    invoke-virtual {v0, v1, v10, v2, v10}, Ll/fer0;->b([BIIZ)Z

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_2
    iget-object v1, v0, Ll/zkr0;->i:Ll/bgw0;

    .line 102
    .line 103
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-static {v1, v10}, Ljava/util/Arrays;->fill([BB)V

    .line 108
    .line 109
    .line 110
    iget-object v1, v0, Ll/zkr0;->i:Ll/bgw0;

    .line 111
    .line 112
    rsub-int/lit8 v3, v2, 0x4

    .line 113
    .line 114
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    move-object v4, v7

    .line 119
    check-cast v4, Ll/fer0;

    .line 120
    .line 121
    invoke-virtual {v4, v1, v3, v2, v10}, Ll/fer0;->b([BIIZ)Z

    .line 122
    .line 123
    .line 124
    iget-object v1, v0, Ll/zkr0;->i:Ll/bgw0;

    .line 125
    .line 126
    invoke-virtual {v1, v10}, Ll/bgw0;->k(I)V

    .line 127
    .line 128
    .line 129
    iget-object v1, v0, Ll/zkr0;->i:Ll/bgw0;

    .line 130
    .line 131
    invoke-virtual {v1}, Ll/bgw0;->J()J

    .line 132
    .line 133
    .line 134
    move-result-wide v1

    .line 135
    long-to-int v1, v1

    .line 136
    iput v1, v0, Ll/zkr0;->w:I

    .line 137
    .line 138
    return-void

    .line 139
    :cond_3
    new-array v3, v2, [B

    .line 140
    .line 141
    move-object v4, v7

    .line 142
    check-cast v4, Ll/fer0;

    .line 143
    .line 144
    invoke-virtual {v4, v3, v10, v2, v10}, Ll/fer0;->b([BIIZ)Z

    .line 145
    .line 146
    .line 147
    invoke-virtual/range {p0 .. p1}, Ll/zkr0;->r(I)V

    .line 148
    .line 149
    .line 150
    iget-object v0, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 151
    .line 152
    new-instance v1, Ll/ggr0;

    .line 153
    .line 154
    invoke-direct {v1, v9, v3, v10, v10}, Ll/ggr0;-><init>(I[BII)V

    .line 155
    .line 156
    .line 157
    iput-object v1, v0, Ll/ykr0;->j:Ll/ggr0;

    .line 158
    .line 159
    return-void

    .line 160
    :cond_4
    invoke-virtual/range {p0 .. p1}, Ll/zkr0;->r(I)V

    .line 161
    .line 162
    .line 163
    iget-object v0, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 164
    .line 165
    new-array v1, v2, [B

    .line 166
    .line 167
    iput-object v1, v0, Ll/ykr0;->i:[B

    .line 168
    .line 169
    move-object v0, v7

    .line 170
    check-cast v0, Ll/fer0;

    .line 171
    .line 172
    invoke-virtual {v0, v1, v10, v2, v10}, Ll/fer0;->b([BIIZ)Z

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :cond_5
    invoke-virtual/range {p0 .. p1}, Ll/zkr0;->r(I)V

    .line 177
    .line 178
    .line 179
    iget-object v0, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 180
    .line 181
    invoke-static {v0}, Ll/ykr0;->a(Ll/ykr0;)I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    const v3, 0x64767643

    .line 186
    .line 187
    .line 188
    if-eq v1, v3, :cond_7

    .line 189
    .line 190
    invoke-static {v0}, Ll/ykr0;->a(Ll/ykr0;)I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    const v3, 0x64766343

    .line 195
    .line 196
    .line 197
    if-ne v1, v3, :cond_6

    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_6
    move-object v0, v7

    .line 201
    check-cast v0, Ll/fer0;

    .line 202
    .line 203
    invoke-virtual {v0, v2, v10}, Ll/fer0;->k(IZ)Z

    .line 204
    .line 205
    .line 206
    return-void

    .line 207
    :cond_7
    :goto_0
    new-array v1, v2, [B

    .line 208
    .line 209
    iput-object v1, v0, Ll/ykr0;->O:[B

    .line 210
    .line 211
    move-object v0, v7

    .line 212
    check-cast v0, Ll/fer0;

    .line 213
    .line 214
    invoke-virtual {v0, v1, v10, v2, v10}, Ll/fer0;->b([BIIZ)Z

    .line 215
    .line 216
    .line 217
    return-void

    .line 218
    :cond_8
    iget v1, v0, Ll/zkr0;->G:I

    .line 219
    .line 220
    if-eq v1, v8, :cond_9

    .line 221
    .line 222
    goto/16 :goto_f

    .line 223
    .line 224
    :cond_9
    iget-object v1, v0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 225
    .line 226
    iget v3, v0, Ll/zkr0;->M:I

    .line 227
    .line 228
    invoke-virtual {v1, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v1

    .line 232
    check-cast v1, Ll/ykr0;

    .line 233
    .line 234
    iget v3, v0, Ll/zkr0;->P:I

    .line 235
    .line 236
    if-ne v3, v5, :cond_a

    .line 237
    .line 238
    iget-object v1, v1, Ll/ykr0;->b:Ljava/lang/String;

    .line 239
    .line 240
    const-string v3, "V_VP9"

    .line 241
    .line 242
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-eqz v1, :cond_a

    .line 247
    .line 248
    iget-object v1, v0, Ll/zkr0;->n:Ll/bgw0;

    .line 249
    .line 250
    invoke-virtual {v1, v2}, Ll/bgw0;->h(I)V

    .line 251
    .line 252
    .line 253
    iget-object v0, v0, Ll/zkr0;->n:Ll/bgw0;

    .line 254
    .line 255
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    move-object v1, v7

    .line 260
    check-cast v1, Ll/fer0;

    .line 261
    .line 262
    invoke-virtual {v1, v0, v10, v2, v10}, Ll/fer0;->b([BIIZ)Z

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :cond_a
    move-object v0, v7

    .line 267
    check-cast v0, Ll/fer0;

    .line 268
    .line 269
    invoke-virtual {v0, v2, v10}, Ll/fer0;->k(IZ)Z

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_b
    iget v3, v0, Ll/zkr0;->G:I

    .line 274
    .line 275
    const/16 v11, 0x8

    .line 276
    .line 277
    if-nez v3, :cond_c

    .line 278
    .line 279
    iget-object v3, v0, Ll/zkr0;->b:Ll/llr0;

    .line 280
    .line 281
    invoke-virtual {v3, v7, v10, v9, v11}, Ll/llr0;->d(Ll/qer0;ZZI)J

    .line 282
    .line 283
    .line 284
    move-result-wide v12

    .line 285
    long-to-int v3, v12

    .line 286
    iput v3, v0, Ll/zkr0;->M:I

    .line 287
    .line 288
    iget-object v3, v0, Ll/zkr0;->b:Ll/llr0;

    .line 289
    .line 290
    invoke-virtual {v3}, Ll/llr0;->a()I

    .line 291
    .line 292
    .line 293
    move-result v3

    .line 294
    iput v3, v0, Ll/zkr0;->N:I

    .line 295
    .line 296
    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    iput-wide v12, v0, Ll/zkr0;->I:J

    .line 302
    .line 303
    iput v9, v0, Ll/zkr0;->G:I

    .line 304
    .line 305
    iget-object v3, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 306
    .line 307
    invoke-virtual {v3, v10}, Ll/bgw0;->h(I)V

    .line 308
    .line 309
    .line 310
    :cond_c
    iget-object v3, v0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 311
    .line 312
    iget v12, v0, Ll/zkr0;->M:I

    .line 313
    .line 314
    invoke-virtual {v3, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v3

    .line 318
    check-cast v3, Ll/ykr0;

    .line 319
    .line 320
    if-nez v3, :cond_d

    .line 321
    .line 322
    iget v1, v0, Ll/zkr0;->N:I

    .line 323
    .line 324
    sub-int v1, v2, v1

    .line 325
    .line 326
    move-object v2, v7

    .line 327
    check-cast v2, Ll/fer0;

    .line 328
    .line 329
    invoke-virtual {v2, v1, v10}, Ll/fer0;->k(IZ)Z

    .line 330
    .line 331
    .line 332
    iput v10, v0, Ll/zkr0;->G:I

    .line 333
    .line 334
    return-void

    .line 335
    :cond_d
    invoke-static {v3}, Ll/ykr0;->d(Ll/ykr0;)V

    .line 336
    .line 337
    .line 338
    iget v12, v0, Ll/zkr0;->G:I

    .line 339
    .line 340
    if-ne v12, v9, :cond_1f

    .line 341
    .line 342
    const/4 v12, 0x3

    .line 343
    invoke-virtual {v0, v7, v12}, Ll/zkr0;->t(Ll/qer0;I)V

    .line 344
    .line 345
    .line 346
    iget-object v13, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 347
    .line 348
    invoke-virtual {v13}, Ll/bgw0;->m()[B

    .line 349
    .line 350
    .line 351
    move-result-object v13

    .line 352
    aget-byte v13, v13, v8

    .line 353
    .line 354
    and-int/lit8 v13, v13, 0x6

    .line 355
    .line 356
    shr-int/2addr v13, v9

    .line 357
    const/16 v14, 0xff

    .line 358
    .line 359
    if-nez v13, :cond_e

    .line 360
    .line 361
    iput v9, v0, Ll/zkr0;->K:I

    .line 362
    .line 363
    iget-object v4, v0, Ll/zkr0;->L:[I

    .line 364
    .line 365
    invoke-static {v4, v9}, Ll/zkr0;->x([II)[I

    .line 366
    .line 367
    .line 368
    move-result-object v4

    .line 369
    iput-object v4, v0, Ll/zkr0;->L:[I

    .line 370
    .line 371
    iget v5, v0, Ll/zkr0;->N:I

    .line 372
    .line 373
    sub-int/2addr v2, v5

    .line 374
    add-int/lit8 v2, v2, -0x3

    .line 375
    .line 376
    aput v2, v4, v10

    .line 377
    .line 378
    :goto_1
    move/from16 v16, v9

    .line 379
    .line 380
    move/from16 v17, v10

    .line 381
    .line 382
    move/from16 v18, v11

    .line 383
    .line 384
    goto/16 :goto_9

    .line 385
    .line 386
    :cond_e
    invoke-virtual {v0, v7, v5}, Ll/zkr0;->t(Ll/qer0;I)V

    .line 387
    .line 388
    .line 389
    iget-object v15, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 390
    .line 391
    invoke-virtual {v15}, Ll/bgw0;->m()[B

    .line 392
    .line 393
    .line 394
    move-result-object v15

    .line 395
    aget-byte v15, v15, v12

    .line 396
    .line 397
    and-int/2addr v15, v14

    .line 398
    add-int/2addr v15, v9

    .line 399
    iput v15, v0, Ll/zkr0;->K:I

    .line 400
    .line 401
    iget-object v5, v0, Ll/zkr0;->L:[I

    .line 402
    .line 403
    invoke-static {v5, v15}, Ll/zkr0;->x([II)[I

    .line 404
    .line 405
    .line 406
    move-result-object v5

    .line 407
    iput-object v5, v0, Ll/zkr0;->L:[I

    .line 408
    .line 409
    if-ne v13, v8, :cond_f

    .line 410
    .line 411
    iget v4, v0, Ll/zkr0;->N:I

    .line 412
    .line 413
    sub-int/2addr v2, v4

    .line 414
    add-int/lit8 v2, v2, -0x4

    .line 415
    .line 416
    iget v4, v0, Ll/zkr0;->K:I

    .line 417
    .line 418
    div-int/2addr v2, v4

    .line 419
    invoke-static {v5, v10, v4, v2}, Ljava/util/Arrays;->fill([IIII)V

    .line 420
    .line 421
    .line 422
    goto :goto_1

    .line 423
    :cond_f
    if-ne v13, v9, :cond_12

    .line 424
    .line 425
    move v4, v10

    .line 426
    move v12, v4

    .line 427
    const/4 v5, 0x4

    .line 428
    :goto_2
    iget v13, v0, Ll/zkr0;->K:I

    .line 429
    .line 430
    add-int/lit8 v13, v13, -0x1

    .line 431
    .line 432
    iget-object v15, v0, Ll/zkr0;->L:[I

    .line 433
    .line 434
    if-ge v4, v13, :cond_11

    .line 435
    .line 436
    aput v10, v15, v4

    .line 437
    .line 438
    :goto_3
    add-int/lit8 v13, v5, 0x1

    .line 439
    .line 440
    invoke-virtual {v0, v7, v13}, Ll/zkr0;->t(Ll/qer0;I)V

    .line 441
    .line 442
    .line 443
    iget-object v15, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 444
    .line 445
    invoke-virtual {v15}, Ll/bgw0;->m()[B

    .line 446
    .line 447
    .line 448
    move-result-object v15

    .line 449
    aget-byte v5, v15, v5

    .line 450
    .line 451
    and-int/2addr v5, v14

    .line 452
    iget-object v15, v0, Ll/zkr0;->L:[I

    .line 453
    .line 454
    aget v16, v15, v4

    .line 455
    .line 456
    add-int v16, v16, v5

    .line 457
    .line 458
    aput v16, v15, v4

    .line 459
    .line 460
    if-eq v5, v14, :cond_10

    .line 461
    .line 462
    add-int v12, v12, v16

    .line 463
    .line 464
    add-int/lit8 v4, v4, 0x1

    .line 465
    .line 466
    move v5, v13

    .line 467
    goto :goto_2

    .line 468
    :cond_10
    move v5, v13

    .line 469
    goto :goto_3

    .line 470
    :cond_11
    iget v4, v0, Ll/zkr0;->N:I

    .line 471
    .line 472
    sub-int/2addr v2, v4

    .line 473
    sub-int/2addr v2, v5

    .line 474
    sub-int/2addr v2, v12

    .line 475
    aput v2, v15, v13

    .line 476
    .line 477
    goto :goto_1

    .line 478
    :cond_12
    if-ne v13, v12, :cond_1e

    .line 479
    .line 480
    move v12, v10

    .line 481
    move v13, v12

    .line 482
    const/4 v5, 0x4

    .line 483
    :goto_4
    iget v15, v0, Ll/zkr0;->K:I

    .line 484
    .line 485
    add-int/lit8 v15, v15, -0x1

    .line 486
    .line 487
    move/from16 v16, v9

    .line 488
    .line 489
    iget-object v9, v0, Ll/zkr0;->L:[I

    .line 490
    .line 491
    if-ge v12, v15, :cond_1a

    .line 492
    .line 493
    aput v10, v9, v12

    .line 494
    .line 495
    add-int/lit8 v9, v5, 0x1

    .line 496
    .line 497
    invoke-virtual {v0, v7, v9}, Ll/zkr0;->t(Ll/qer0;I)V

    .line 498
    .line 499
    .line 500
    iget-object v15, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 501
    .line 502
    invoke-virtual {v15}, Ll/bgw0;->m()[B

    .line 503
    .line 504
    .line 505
    move-result-object v15

    .line 506
    aget-byte v15, v15, v5

    .line 507
    .line 508
    if-eqz v15, :cond_19

    .line 509
    .line 510
    move v15, v10

    .line 511
    :goto_5
    if-ge v15, v11, :cond_16

    .line 512
    .line 513
    rsub-int/lit8 v17, v15, 0x7

    .line 514
    .line 515
    move/from16 v18, v11

    .line 516
    .line 517
    shl-int v11, v16, v17

    .line 518
    .line 519
    move/from16 v17, v10

    .line 520
    .line 521
    iget-object v10, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 522
    .line 523
    invoke-virtual {v10}, Ll/bgw0;->m()[B

    .line 524
    .line 525
    .line 526
    move-result-object v10

    .line 527
    aget-byte v10, v10, v5

    .line 528
    .line 529
    and-int/2addr v10, v11

    .line 530
    if-eqz v10, :cond_15

    .line 531
    .line 532
    add-int/2addr v9, v15

    .line 533
    invoke-virtual {v0, v7, v9}, Ll/zkr0;->t(Ll/qer0;I)V

    .line 534
    .line 535
    .line 536
    iget-object v10, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 537
    .line 538
    add-int/lit8 v19, v5, 0x1

    .line 539
    .line 540
    invoke-virtual {v10}, Ll/bgw0;->m()[B

    .line 541
    .line 542
    .line 543
    move-result-object v10

    .line 544
    aget-byte v5, v10, v5

    .line 545
    .line 546
    and-int/2addr v5, v14

    .line 547
    not-int v10, v11

    .line 548
    and-int/2addr v5, v10

    .line 549
    int-to-long v10, v5

    .line 550
    move/from16 v5, v19

    .line 551
    .line 552
    :goto_6
    if-ge v5, v9, :cond_13

    .line 553
    .line 554
    shl-long v10, v10, v18

    .line 555
    .line 556
    iget-object v6, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 557
    .line 558
    add-int/lit8 v20, v5, 0x1

    .line 559
    .line 560
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 561
    .line 562
    .line 563
    move-result-object v6

    .line 564
    aget-byte v5, v6, v5

    .line 565
    .line 566
    and-int/2addr v5, v14

    .line 567
    int-to-long v5, v5

    .line 568
    or-long/2addr v10, v5

    .line 569
    move/from16 v5, v20

    .line 570
    .line 571
    const/16 v6, 0xa3

    .line 572
    .line 573
    goto :goto_6

    .line 574
    :cond_13
    if-lez v12, :cond_14

    .line 575
    .line 576
    mul-int/lit8 v15, v15, 0x7

    .line 577
    .line 578
    add-int/lit8 v15, v15, 0x6

    .line 579
    .line 580
    const-wide/16 v5, 0x1

    .line 581
    .line 582
    shl-long/2addr v5, v15

    .line 583
    const-wide/16 v20, -0x1

    .line 584
    .line 585
    add-long v5, v5, v20

    .line 586
    .line 587
    sub-long/2addr v10, v5

    .line 588
    :cond_14
    :goto_7
    move v5, v9

    .line 589
    goto :goto_8

    .line 590
    :cond_15
    add-int/lit8 v15, v15, 0x1

    .line 591
    .line 592
    move/from16 v10, v17

    .line 593
    .line 594
    move/from16 v11, v18

    .line 595
    .line 596
    const/16 v6, 0xa3

    .line 597
    .line 598
    goto :goto_5

    .line 599
    :cond_16
    move/from16 v17, v10

    .line 600
    .line 601
    move/from16 v18, v11

    .line 602
    .line 603
    const-wide/16 v10, 0x0

    .line 604
    .line 605
    goto :goto_7

    .line 606
    :goto_8
    const-wide/32 v20, -0x80000000

    .line 607
    .line 608
    .line 609
    cmp-long v6, v10, v20

    .line 610
    .line 611
    if-ltz v6, :cond_18

    .line 612
    .line 613
    const-wide/32 v20, 0x7fffffff

    .line 614
    .line 615
    .line 616
    cmp-long v6, v10, v20

    .line 617
    .line 618
    if-gtz v6, :cond_18

    .line 619
    .line 620
    iget-object v6, v0, Ll/zkr0;->L:[I

    .line 621
    .line 622
    long-to-int v9, v10

    .line 623
    if-eqz v12, :cond_17

    .line 624
    .line 625
    add-int/lit8 v10, v12, -0x1

    .line 626
    .line 627
    aget v10, v6, v10

    .line 628
    .line 629
    add-int/2addr v9, v10

    .line 630
    :cond_17
    aput v9, v6, v12

    .line 631
    .line 632
    add-int/2addr v13, v9

    .line 633
    add-int/lit8 v12, v12, 0x1

    .line 634
    .line 635
    move/from16 v9, v16

    .line 636
    .line 637
    move/from16 v10, v17

    .line 638
    .line 639
    move/from16 v11, v18

    .line 640
    .line 641
    const/16 v6, 0xa3

    .line 642
    .line 643
    goto/16 :goto_4

    .line 644
    .line 645
    :cond_18
    const-string v0, "EBML lacing sample size out of range."

    .line 646
    .line 647
    invoke-static {v0, v4}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 648
    .line 649
    .line 650
    move-result-object v0

    .line 651
    throw v0

    .line 652
    :cond_19
    const-string v0, "No valid varint length mask found"

    .line 653
    .line 654
    invoke-static {v0, v4}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 655
    .line 656
    .line 657
    move-result-object v0

    .line 658
    throw v0

    .line 659
    :cond_1a
    move/from16 v17, v10

    .line 660
    .line 661
    move/from16 v18, v11

    .line 662
    .line 663
    iget v4, v0, Ll/zkr0;->N:I

    .line 664
    .line 665
    sub-int/2addr v2, v4

    .line 666
    sub-int/2addr v2, v5

    .line 667
    sub-int/2addr v2, v13

    .line 668
    aput v2, v9, v15

    .line 669
    .line 670
    :goto_9
    iget-object v2, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 671
    .line 672
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 673
    .line 674
    .line 675
    move-result-object v2

    .line 676
    aget-byte v2, v2, v17

    .line 677
    .line 678
    shl-int/lit8 v2, v2, 0x8

    .line 679
    .line 680
    iget-object v4, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 681
    .line 682
    invoke-virtual {v4}, Ll/bgw0;->m()[B

    .line 683
    .line 684
    .line 685
    move-result-object v4

    .line 686
    aget-byte v4, v4, v16

    .line 687
    .line 688
    and-int/2addr v4, v14

    .line 689
    iget-wide v5, v0, Ll/zkr0;->B:J

    .line 690
    .line 691
    or-int/2addr v2, v4

    .line 692
    int-to-long v9, v2

    .line 693
    invoke-virtual {v0, v9, v10}, Ll/zkr0;->p(J)J

    .line 694
    .line 695
    .line 696
    move-result-wide v9

    .line 697
    add-long/2addr v5, v9

    .line 698
    iput-wide v5, v0, Ll/zkr0;->H:J

    .line 699
    .line 700
    iget v2, v3, Ll/ykr0;->d:I

    .line 701
    .line 702
    if-eq v2, v8, :cond_1d

    .line 703
    .line 704
    const/16 v2, 0xa3

    .line 705
    .line 706
    if-ne v1, v2, :cond_1c

    .line 707
    .line 708
    iget-object v1, v0, Ll/zkr0;->g:Ll/bgw0;

    .line 709
    .line 710
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 711
    .line 712
    .line 713
    move-result-object v1

    .line 714
    aget-byte v1, v1, v8

    .line 715
    .line 716
    const/16 v2, 0x80

    .line 717
    .line 718
    and-int/2addr v1, v2

    .line 719
    if-ne v1, v2, :cond_1b

    .line 720
    .line 721
    move/from16 v2, v16

    .line 722
    .line 723
    :goto_a
    const/16 v1, 0xa3

    .line 724
    .line 725
    goto :goto_b

    .line 726
    :cond_1b
    move/from16 v2, v17

    .line 727
    .line 728
    goto :goto_a

    .line 729
    :cond_1c
    move/from16 v2, v17

    .line 730
    .line 731
    goto :goto_b

    .line 732
    :cond_1d
    move/from16 v2, v16

    .line 733
    .line 734
    :goto_b
    iput v2, v0, Ll/zkr0;->O:I

    .line 735
    .line 736
    iput v8, v0, Ll/zkr0;->G:I

    .line 737
    .line 738
    move/from16 v2, v17

    .line 739
    .line 740
    iput v2, v0, Ll/zkr0;->J:I

    .line 741
    .line 742
    const/16 v2, 0xa3

    .line 743
    .line 744
    goto :goto_c

    .line 745
    :cond_1e
    const-string v0, "Unexpected lacing value: 2"

    .line 746
    .line 747
    invoke-static {v0, v4}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 748
    .line 749
    .line 750
    move-result-object v0

    .line 751
    throw v0

    .line 752
    :cond_1f
    move/from16 v16, v9

    .line 753
    .line 754
    move v2, v6

    .line 755
    :goto_c
    if-ne v1, v2, :cond_21

    .line 756
    .line 757
    :goto_d
    iget v1, v0, Ll/zkr0;->J:I

    .line 758
    .line 759
    iget v2, v0, Ll/zkr0;->K:I

    .line 760
    .line 761
    if-ge v1, v2, :cond_20

    .line 762
    .line 763
    iget-object v2, v0, Ll/zkr0;->L:[I

    .line 764
    .line 765
    aget v1, v2, v1

    .line 766
    .line 767
    const/4 v2, 0x0

    .line 768
    invoke-virtual {v0, v7, v3, v1, v2}, Ll/zkr0;->n(Ll/qer0;Ll/ykr0;IZ)I

    .line 769
    .line 770
    .line 771
    move-result v5

    .line 772
    iget-wide v1, v0, Ll/zkr0;->H:J

    .line 773
    .line 774
    iget v4, v0, Ll/zkr0;->J:I

    .line 775
    .line 776
    iget v6, v3, Ll/ykr0;->e:I

    .line 777
    .line 778
    mul-int/2addr v4, v6

    .line 779
    div-int/lit16 v4, v4, 0x3e8

    .line 780
    .line 781
    int-to-long v8, v4

    .line 782
    add-long/2addr v1, v8

    .line 783
    iget v4, v0, Ll/zkr0;->O:I

    .line 784
    .line 785
    const/4 v6, 0x0

    .line 786
    move-wide/from16 v22, v1

    .line 787
    .line 788
    move-object v1, v3

    .line 789
    move-wide/from16 v2, v22

    .line 790
    .line 791
    invoke-virtual/range {v0 .. v6}, Ll/zkr0;->s(Ll/ykr0;JIII)V

    .line 792
    .line 793
    .line 794
    iget v2, v0, Ll/zkr0;->J:I

    .line 795
    .line 796
    add-int/lit8 v2, v2, 0x1

    .line 797
    .line 798
    iput v2, v0, Ll/zkr0;->J:I

    .line 799
    .line 800
    move-object v3, v1

    .line 801
    goto :goto_d

    .line 802
    :cond_20
    const/4 v2, 0x0

    .line 803
    iput v2, v0, Ll/zkr0;->G:I

    .line 804
    .line 805
    return-void

    .line 806
    :cond_21
    move-object v1, v3

    .line 807
    :goto_e
    iget v2, v0, Ll/zkr0;->J:I

    .line 808
    .line 809
    iget v3, v0, Ll/zkr0;->K:I

    .line 810
    .line 811
    if-ge v2, v3, :cond_22

    .line 812
    .line 813
    iget-object v3, v0, Ll/zkr0;->L:[I

    .line 814
    .line 815
    aget v4, v3, v2

    .line 816
    .line 817
    move/from16 v5, v16

    .line 818
    .line 819
    invoke-virtual {v0, v7, v1, v4, v5}, Ll/zkr0;->n(Ll/qer0;Ll/ykr0;IZ)I

    .line 820
    .line 821
    .line 822
    move-result v4

    .line 823
    aput v4, v3, v2

    .line 824
    .line 825
    iget v2, v0, Ll/zkr0;->J:I

    .line 826
    .line 827
    add-int/2addr v2, v5

    .line 828
    iput v2, v0, Ll/zkr0;->J:I

    .line 829
    .line 830
    goto :goto_e

    .line 831
    :cond_22
    :goto_f
    return-void
.end method

.method public final h(I)V
    .locals 22
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/zkr0;->b0:Ll/ser0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    const/16 v2, 0xa0

    .line 11
    .line 12
    const-string v3, "A_OPUS"

    .line 13
    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    if-eq v1, v2, :cond_14

    .line 17
    .line 18
    const/16 v2, 0xae

    .line 19
    .line 20
    if-eq v1, v2, :cond_11

    .line 21
    .line 22
    const/16 v2, 0x4dbb

    .line 23
    .line 24
    const/4 v3, -0x1

    .line 25
    const-wide/16 v9, -0x1

    .line 26
    .line 27
    const v11, 0x1c53bb6b

    .line 28
    .line 29
    .line 30
    if-eq v1, v2, :cond_f

    .line 31
    .line 32
    const/16 v2, 0x6240

    .line 33
    .line 34
    if-eq v1, v2, :cond_d

    .line 35
    .line 36
    const/16 v2, 0x6d80

    .line 37
    .line 38
    if-eq v1, v2, :cond_b

    .line 39
    .line 40
    const v2, 0x1549a966

    .line 41
    .line 42
    .line 43
    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    if-eq v1, v2, :cond_9

    .line 49
    .line 50
    const v2, 0x1654ae6b

    .line 51
    .line 52
    .line 53
    if-eq v1, v2, :cond_7

    .line 54
    .line 55
    if-eq v1, v11, :cond_0

    .line 56
    .line 57
    goto/16 :goto_9

    .line 58
    .line 59
    :cond_0
    iget-boolean v1, v0, Ll/zkr0;->v:Z

    .line 60
    .line 61
    if-nez v1, :cond_6

    .line 62
    .line 63
    iget-object v1, v0, Ll/zkr0;->b0:Ll/ser0;

    .line 64
    .line 65
    iget-object v2, v0, Ll/zkr0;->C:Ll/z5w0;

    .line 66
    .line 67
    iget-object v11, v0, Ll/zkr0;->D:Ll/z5w0;

    .line 68
    .line 69
    iget-wide v14, v0, Ll/zkr0;->q:J

    .line 70
    .line 71
    cmp-long v9, v14, v9

    .line 72
    .line 73
    if-eqz v9, :cond_5

    .line 74
    .line 75
    iget-wide v9, v0, Ll/zkr0;->t:J

    .line 76
    .line 77
    cmp-long v9, v9, v12

    .line 78
    .line 79
    if-eqz v9, :cond_5

    .line 80
    .line 81
    if-eqz v2, :cond_5

    .line 82
    .line 83
    invoke-virtual {v2}, Ll/z5w0;->a()I

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    if-eqz v9, :cond_5

    .line 88
    .line 89
    if-eqz v11, :cond_5

    .line 90
    .line 91
    invoke-virtual {v11}, Ll/z5w0;->a()I

    .line 92
    .line 93
    .line 94
    move-result v9

    .line 95
    invoke-virtual {v2}, Ll/z5w0;->a()I

    .line 96
    .line 97
    .line 98
    move-result v10

    .line 99
    if-eq v9, v10, :cond_1

    .line 100
    .line 101
    goto/16 :goto_2

    .line 102
    .line 103
    :cond_1
    invoke-virtual {v2}, Ll/z5w0;->a()I

    .line 104
    .line 105
    .line 106
    move-result v9

    .line 107
    new-array v10, v9, [I

    .line 108
    .line 109
    new-array v12, v9, [J

    .line 110
    .line 111
    new-array v13, v9, [J

    .line 112
    .line 113
    new-array v14, v9, [J

    .line 114
    .line 115
    const/4 v15, 0x0

    .line 116
    :goto_0
    if-ge v15, v9, :cond_2

    .line 117
    .line 118
    invoke-virtual {v2, v15}, Ll/z5w0;->b(I)J

    .line 119
    .line 120
    .line 121
    move-result-wide v16

    .line 122
    aput-wide v16, v14, v15

    .line 123
    .line 124
    move/from16 p1, v9

    .line 125
    .line 126
    iget-wide v8, v0, Ll/zkr0;->q:J

    .line 127
    .line 128
    invoke-virtual {v11, v15}, Ll/z5w0;->b(I)J

    .line 129
    .line 130
    .line 131
    move-result-wide v17

    .line 132
    add-long v8, v8, v17

    .line 133
    .line 134
    aput-wide v8, v12, v15

    .line 135
    .line 136
    add-int/lit8 v15, v15, 0x1

    .line 137
    .line 138
    move/from16 v9, p1

    .line 139
    .line 140
    goto :goto_0

    .line 141
    :cond_2
    move/from16 p1, v9

    .line 142
    .line 143
    const/4 v8, 0x0

    .line 144
    :goto_1
    add-int/lit8 v9, p1, -0x1

    .line 145
    .line 146
    if-ge v8, v9, :cond_3

    .line 147
    .line 148
    add-int/lit8 v2, v8, 0x1

    .line 149
    .line 150
    aget-wide v15, v12, v2

    .line 151
    .line 152
    aget-wide v17, v12, v8

    .line 153
    .line 154
    sub-long v6, v15, v17

    .line 155
    .line 156
    long-to-int v6, v6

    .line 157
    aput v6, v10, v8

    .line 158
    .line 159
    aget-wide v6, v14, v2

    .line 160
    .line 161
    aget-wide v15, v14, v8

    .line 162
    .line 163
    sub-long/2addr v6, v15

    .line 164
    aput-wide v6, v13, v8

    .line 165
    .line 166
    move v8, v2

    .line 167
    goto :goto_1

    .line 168
    :cond_3
    iget-wide v2, v0, Ll/zkr0;->q:J

    .line 169
    .line 170
    iget-wide v6, v0, Ll/zkr0;->p:J

    .line 171
    .line 172
    add-long/2addr v2, v6

    .line 173
    aget-wide v6, v12, v9

    .line 174
    .line 175
    sub-long/2addr v2, v6

    .line 176
    long-to-int v2, v2

    .line 177
    aput v2, v10, v9

    .line 178
    .line 179
    iget-wide v2, v0, Ll/zkr0;->t:J

    .line 180
    .line 181
    aget-wide v6, v14, v9

    .line 182
    .line 183
    sub-long/2addr v2, v6

    .line 184
    aput-wide v2, v13, v9

    .line 185
    .line 186
    cmp-long v4, v2, v4

    .line 187
    .line 188
    if-gtz v4, :cond_4

    .line 189
    .line 190
    new-instance v4, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    const-string v5, "Discarding last cue point with unexpected duration: "

    .line 193
    .line 194
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    const-string v3, "MatroskaExtractor"

    .line 205
    .line 206
    invoke-static {v3, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-static {v10, v9}, Ljava/util/Arrays;->copyOf([II)[I

    .line 210
    .line 211
    .line 212
    move-result-object v10

    .line 213
    invoke-static {v12, v9}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 214
    .line 215
    .line 216
    move-result-object v12

    .line 217
    invoke-static {v13, v9}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 218
    .line 219
    .line 220
    move-result-object v13

    .line 221
    invoke-static {v14, v9}, Ljava/util/Arrays;->copyOf([JI)[J

    .line 222
    .line 223
    .line 224
    move-result-object v14

    .line 225
    :cond_4
    new-instance v2, Ll/der0;

    .line 226
    .line 227
    invoke-direct {v2, v10, v12, v13, v14}, Ll/der0;-><init>([I[J[J[J)V

    .line 228
    .line 229
    .line 230
    goto :goto_3

    .line 231
    :cond_5
    :goto_2
    new-instance v2, Ll/agr0;

    .line 232
    .line 233
    iget-wide v6, v0, Ll/zkr0;->t:J

    .line 234
    .line 235
    invoke-direct {v2, v6, v7, v4, v5}, Ll/agr0;-><init>(JJ)V

    .line 236
    .line 237
    .line 238
    :goto_3
    invoke-interface {v1, v2}, Ll/ser0;->j(Ll/bgr0;)V

    .line 239
    .line 240
    .line 241
    const/4 v1, 0x1

    .line 242
    iput-boolean v1, v0, Ll/zkr0;->v:Z

    .line 243
    .line 244
    :cond_6
    const/4 v1, 0x0

    .line 245
    iput-object v1, v0, Ll/zkr0;->C:Ll/z5w0;

    .line 246
    .line 247
    iput-object v1, v0, Ll/zkr0;->D:Ll/z5w0;

    .line 248
    .line 249
    return-void

    .line 250
    :cond_7
    const/4 v1, 0x0

    .line 251
    iget-object v2, v0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 252
    .line 253
    invoke-virtual {v2}, Landroid/util/SparseArray;->size()I

    .line 254
    .line 255
    .line 256
    move-result v2

    .line 257
    if-eqz v2, :cond_8

    .line 258
    .line 259
    iget-object v0, v0, Ll/zkr0;->b0:Ll/ser0;

    .line 260
    .line 261
    invoke-interface {v0}, Ll/ser0;->c()V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_8
    const-string v0, "No valid tracks were found"

    .line 266
    .line 267
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    throw v0

    .line 272
    :cond_9
    iget-wide v1, v0, Ll/zkr0;->r:J

    .line 273
    .line 274
    cmp-long v1, v1, v12

    .line 275
    .line 276
    if-nez v1, :cond_a

    .line 277
    .line 278
    const-wide/32 v1, 0xf4240

    .line 279
    .line 280
    .line 281
    iput-wide v1, v0, Ll/zkr0;->r:J

    .line 282
    .line 283
    :cond_a
    iget-wide v1, v0, Ll/zkr0;->s:J

    .line 284
    .line 285
    cmp-long v3, v1, v12

    .line 286
    .line 287
    if-eqz v3, :cond_1a

    .line 288
    .line 289
    invoke-virtual {v0, v1, v2}, Ll/zkr0;->p(J)J

    .line 290
    .line 291
    .line 292
    move-result-wide v1

    .line 293
    iput-wide v1, v0, Ll/zkr0;->t:J

    .line 294
    .line 295
    return-void

    .line 296
    :cond_b
    invoke-virtual/range {p0 .. p1}, Ll/zkr0;->r(I)V

    .line 297
    .line 298
    .line 299
    iget-object v0, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 300
    .line 301
    iget-boolean v1, v0, Ll/ykr0;->h:Z

    .line 302
    .line 303
    if-eqz v1, :cond_1a

    .line 304
    .line 305
    iget-object v0, v0, Ll/ykr0;->i:[B

    .line 306
    .line 307
    if-nez v0, :cond_c

    .line 308
    .line 309
    goto/16 :goto_9

    .line 310
    .line 311
    :cond_c
    const-string v0, "Combining encryption and compression is not supported"

    .line 312
    .line 313
    const/4 v1, 0x0

    .line 314
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    throw v0

    .line 319
    :cond_d
    invoke-virtual/range {p0 .. p1}, Ll/zkr0;->r(I)V

    .line 320
    .line 321
    .line 322
    iget-object v1, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 323
    .line 324
    iget-boolean v2, v1, Ll/ykr0;->h:Z

    .line 325
    .line 326
    if-eqz v2, :cond_1a

    .line 327
    .line 328
    iget-object v2, v1, Ll/ykr0;->j:Ll/ggr0;

    .line 329
    .line 330
    if-eqz v2, :cond_e

    .line 331
    .line 332
    new-instance v2, Lcom/google/android/gms/internal/ads/zzae;

    .line 333
    .line 334
    new-instance v3, Lcom/google/android/gms/internal/ads/zzad;

    .line 335
    .line 336
    sget-object v4, Ll/cly0;->a:Ljava/util/UUID;

    .line 337
    .line 338
    iget-object v0, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 339
    .line 340
    iget-object v0, v0, Ll/ykr0;->j:Ll/ggr0;

    .line 341
    .line 342
    iget-object v0, v0, Ll/ggr0;->b:[B

    .line 343
    .line 344
    const-string v5, "video/webm"

    .line 345
    .line 346
    const/4 v6, 0x0

    .line 347
    invoke-direct {v3, v4, v6, v5, v0}, Lcom/google/android/gms/internal/ads/zzad;-><init>(Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;[B)V

    .line 348
    .line 349
    .line 350
    filled-new-array {v3}, [Lcom/google/android/gms/internal/ads/zzad;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    invoke-direct {v2, v6, v0}, Lcom/google/android/gms/internal/ads/zzae;-><init>(Ljava/lang/String;[Lcom/google/android/gms/internal/ads/zzad;)V

    .line 355
    .line 356
    .line 357
    iput-object v2, v1, Ll/ykr0;->l:Lcom/google/android/gms/internal/ads/zzae;

    .line 358
    .line 359
    return-void

    .line 360
    :cond_e
    const/4 v6, 0x0

    .line 361
    const-string v0, "Encrypted Track found but ContentEncKeyID was not found"

    .line 362
    .line 363
    invoke-static {v0, v6}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 364
    .line 365
    .line 366
    move-result-object v0

    .line 367
    throw v0

    .line 368
    :cond_f
    iget v1, v0, Ll/zkr0;->w:I

    .line 369
    .line 370
    if-eq v1, v3, :cond_10

    .line 371
    .line 372
    iget-wide v2, v0, Ll/zkr0;->x:J

    .line 373
    .line 374
    cmp-long v4, v2, v9

    .line 375
    .line 376
    if-eqz v4, :cond_10

    .line 377
    .line 378
    if-ne v1, v11, :cond_1a

    .line 379
    .line 380
    iput-wide v2, v0, Ll/zkr0;->z:J

    .line 381
    .line 382
    return-void

    .line 383
    :cond_10
    const-string v0, "Mandatory element SeekID or SeekPosition not found"

    .line 384
    .line 385
    const/4 v1, 0x0

    .line 386
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    throw v0

    .line 391
    :cond_11
    iget-object v1, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 392
    .line 393
    invoke-static {v1}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    iget-object v2, v1, Ll/ykr0;->b:Ljava/lang/String;

    .line 397
    .line 398
    if-eqz v2, :cond_13

    .line 399
    .line 400
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 401
    .line 402
    .line 403
    move-result v4

    .line 404
    sparse-switch v4, :sswitch_data_0

    .line 405
    .line 406
    .line 407
    goto/16 :goto_5

    .line 408
    .line 409
    :sswitch_0
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result v2

    .line 413
    if-eqz v2, :cond_12

    .line 414
    .line 415
    goto/16 :goto_4

    .line 416
    .line 417
    :sswitch_1
    const-string v3, "A_FLAC"

    .line 418
    .line 419
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 420
    .line 421
    .line 422
    move-result v2

    .line 423
    if-eqz v2, :cond_12

    .line 424
    .line 425
    goto/16 :goto_4

    .line 426
    .line 427
    :sswitch_2
    const-string v3, "A_EAC3"

    .line 428
    .line 429
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 430
    .line 431
    .line 432
    move-result v2

    .line 433
    if-eqz v2, :cond_12

    .line 434
    .line 435
    goto/16 :goto_4

    .line 436
    .line 437
    :sswitch_3
    const-string v3, "V_MPEG2"

    .line 438
    .line 439
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 440
    .line 441
    .line 442
    move-result v2

    .line 443
    if-eqz v2, :cond_12

    .line 444
    .line 445
    goto/16 :goto_4

    .line 446
    .line 447
    :sswitch_4
    const-string v3, "S_TEXT/UTF8"

    .line 448
    .line 449
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 450
    .line 451
    .line 452
    move-result v2

    .line 453
    if-eqz v2, :cond_12

    .line 454
    .line 455
    goto/16 :goto_4

    .line 456
    .line 457
    :sswitch_5
    const-string v3, "S_TEXT/WEBVTT"

    .line 458
    .line 459
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 460
    .line 461
    .line 462
    move-result v2

    .line 463
    if-eqz v2, :cond_12

    .line 464
    .line 465
    goto/16 :goto_4

    .line 466
    .line 467
    :sswitch_6
    const-string v3, "V_MPEGH/ISO/HEVC"

    .line 468
    .line 469
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 470
    .line 471
    .line 472
    move-result v2

    .line 473
    if-eqz v2, :cond_12

    .line 474
    .line 475
    goto/16 :goto_4

    .line 476
    .line 477
    :sswitch_7
    const-string v3, "S_TEXT/ASS"

    .line 478
    .line 479
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 480
    .line 481
    .line 482
    move-result v2

    .line 483
    if-eqz v2, :cond_12

    .line 484
    .line 485
    goto/16 :goto_4

    .line 486
    .line 487
    :sswitch_8
    const-string v3, "A_PCM/INT/LIT"

    .line 488
    .line 489
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 490
    .line 491
    .line 492
    move-result v2

    .line 493
    if-eqz v2, :cond_12

    .line 494
    .line 495
    goto/16 :goto_4

    .line 496
    .line 497
    :sswitch_9
    const-string v3, "A_PCM/INT/BIG"

    .line 498
    .line 499
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 500
    .line 501
    .line 502
    move-result v2

    .line 503
    if-eqz v2, :cond_12

    .line 504
    .line 505
    goto/16 :goto_4

    .line 506
    .line 507
    :sswitch_a
    const-string v3, "A_PCM/FLOAT/IEEE"

    .line 508
    .line 509
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 510
    .line 511
    .line 512
    move-result v2

    .line 513
    if-eqz v2, :cond_12

    .line 514
    .line 515
    goto/16 :goto_4

    .line 516
    .line 517
    :sswitch_b
    const-string v3, "A_DTS/EXPRESS"

    .line 518
    .line 519
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 520
    .line 521
    .line 522
    move-result v2

    .line 523
    if-eqz v2, :cond_12

    .line 524
    .line 525
    goto/16 :goto_4

    .line 526
    .line 527
    :sswitch_c
    const-string v3, "V_THEORA"

    .line 528
    .line 529
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 530
    .line 531
    .line 532
    move-result v2

    .line 533
    if-eqz v2, :cond_12

    .line 534
    .line 535
    goto/16 :goto_4

    .line 536
    .line 537
    :sswitch_d
    const-string v3, "S_HDMV/PGS"

    .line 538
    .line 539
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 540
    .line 541
    .line 542
    move-result v2

    .line 543
    if-eqz v2, :cond_12

    .line 544
    .line 545
    goto/16 :goto_4

    .line 546
    .line 547
    :sswitch_e
    const-string v3, "V_VP9"

    .line 548
    .line 549
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 550
    .line 551
    .line 552
    move-result v2

    .line 553
    if-eqz v2, :cond_12

    .line 554
    .line 555
    goto/16 :goto_4

    .line 556
    .line 557
    :sswitch_f
    const-string v3, "V_VP8"

    .line 558
    .line 559
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 560
    .line 561
    .line 562
    move-result v2

    .line 563
    if-eqz v2, :cond_12

    .line 564
    .line 565
    goto/16 :goto_4

    .line 566
    .line 567
    :sswitch_10
    const-string v3, "V_AV1"

    .line 568
    .line 569
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 570
    .line 571
    .line 572
    move-result v2

    .line 573
    if-eqz v2, :cond_12

    .line 574
    .line 575
    goto/16 :goto_4

    .line 576
    .line 577
    :sswitch_11
    const-string v3, "A_DTS"

    .line 578
    .line 579
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 580
    .line 581
    .line 582
    move-result v2

    .line 583
    if-eqz v2, :cond_12

    .line 584
    .line 585
    goto/16 :goto_4

    .line 586
    .line 587
    :sswitch_12
    const-string v3, "A_AC3"

    .line 588
    .line 589
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 590
    .line 591
    .line 592
    move-result v2

    .line 593
    if-eqz v2, :cond_12

    .line 594
    .line 595
    goto/16 :goto_4

    .line 596
    .line 597
    :sswitch_13
    const-string v3, "A_AAC"

    .line 598
    .line 599
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 600
    .line 601
    .line 602
    move-result v2

    .line 603
    if-eqz v2, :cond_12

    .line 604
    .line 605
    goto/16 :goto_4

    .line 606
    .line 607
    :sswitch_14
    const-string v3, "A_DTS/LOSSLESS"

    .line 608
    .line 609
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 610
    .line 611
    .line 612
    move-result v2

    .line 613
    if-eqz v2, :cond_12

    .line 614
    .line 615
    goto/16 :goto_4

    .line 616
    .line 617
    :sswitch_15
    const-string v3, "S_VOBSUB"

    .line 618
    .line 619
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 620
    .line 621
    .line 622
    move-result v2

    .line 623
    if-eqz v2, :cond_12

    .line 624
    .line 625
    goto/16 :goto_4

    .line 626
    .line 627
    :sswitch_16
    const-string v3, "V_MPEG4/ISO/AVC"

    .line 628
    .line 629
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 630
    .line 631
    .line 632
    move-result v2

    .line 633
    if-eqz v2, :cond_12

    .line 634
    .line 635
    goto :goto_4

    .line 636
    :sswitch_17
    const-string v3, "V_MPEG4/ISO/ASP"

    .line 637
    .line 638
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 639
    .line 640
    .line 641
    move-result v2

    .line 642
    if-eqz v2, :cond_12

    .line 643
    .line 644
    goto :goto_4

    .line 645
    :sswitch_18
    const-string v3, "S_DVBSUB"

    .line 646
    .line 647
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 648
    .line 649
    .line 650
    move-result v2

    .line 651
    if-eqz v2, :cond_12

    .line 652
    .line 653
    goto :goto_4

    .line 654
    :sswitch_19
    const-string v3, "V_MS/VFW/FOURCC"

    .line 655
    .line 656
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 657
    .line 658
    .line 659
    move-result v2

    .line 660
    if-eqz v2, :cond_12

    .line 661
    .line 662
    goto :goto_4

    .line 663
    :sswitch_1a
    const-string v3, "A_MPEG/L3"

    .line 664
    .line 665
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 666
    .line 667
    .line 668
    move-result v2

    .line 669
    if-eqz v2, :cond_12

    .line 670
    .line 671
    goto :goto_4

    .line 672
    :sswitch_1b
    const-string v3, "A_MPEG/L2"

    .line 673
    .line 674
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 675
    .line 676
    .line 677
    move-result v2

    .line 678
    if-eqz v2, :cond_12

    .line 679
    .line 680
    goto :goto_4

    .line 681
    :sswitch_1c
    const-string v3, "A_VORBIS"

    .line 682
    .line 683
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 684
    .line 685
    .line 686
    move-result v2

    .line 687
    if-eqz v2, :cond_12

    .line 688
    .line 689
    goto :goto_4

    .line 690
    :sswitch_1d
    const-string v3, "A_TRUEHD"

    .line 691
    .line 692
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 693
    .line 694
    .line 695
    move-result v2

    .line 696
    if-eqz v2, :cond_12

    .line 697
    .line 698
    goto :goto_4

    .line 699
    :sswitch_1e
    const-string v3, "A_MS/ACM"

    .line 700
    .line 701
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 702
    .line 703
    .line 704
    move-result v2

    .line 705
    if-eqz v2, :cond_12

    .line 706
    .line 707
    goto :goto_4

    .line 708
    :sswitch_1f
    const-string v3, "V_MPEG4/ISO/SP"

    .line 709
    .line 710
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 711
    .line 712
    .line 713
    move-result v2

    .line 714
    if-eqz v2, :cond_12

    .line 715
    .line 716
    goto :goto_4

    .line 717
    :sswitch_20
    const-string v3, "V_MPEG4/ISO/AP"

    .line 718
    .line 719
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 720
    .line 721
    .line 722
    move-result v2

    .line 723
    if-eqz v2, :cond_12

    .line 724
    .line 725
    :goto_4
    iget-object v2, v0, Ll/zkr0;->b0:Ll/ser0;

    .line 726
    .line 727
    iget v3, v1, Ll/ykr0;->c:I

    .line 728
    .line 729
    invoke-virtual {v1, v2, v3}, Ll/ykr0;->e(Ll/ser0;I)V

    .line 730
    .line 731
    .line 732
    iget-object v2, v0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 733
    .line 734
    iget v3, v1, Ll/ykr0;->c:I

    .line 735
    .line 736
    invoke-virtual {v2, v3, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 737
    .line 738
    .line 739
    :cond_12
    :goto_5
    const/4 v1, 0x0

    .line 740
    iput-object v1, v0, Ll/zkr0;->u:Ll/ykr0;

    .line 741
    .line 742
    return-void

    .line 743
    :cond_13
    const/4 v1, 0x0

    .line 744
    const-string v0, "CodecId is missing in TrackEntry element"

    .line 745
    .line 746
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 747
    .line 748
    .line 749
    move-result-object v0

    .line 750
    throw v0

    .line 751
    :cond_14
    iget v1, v0, Ll/zkr0;->G:I

    .line 752
    .line 753
    const/4 v2, 0x2

    .line 754
    if-ne v1, v2, :cond_1a

    .line 755
    .line 756
    iget-object v1, v0, Ll/zkr0;->c:Landroid/util/SparseArray;

    .line 757
    .line 758
    iget v2, v0, Ll/zkr0;->M:I

    .line 759
    .line 760
    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 761
    .line 762
    .line 763
    move-result-object v1

    .line 764
    check-cast v1, Ll/ykr0;

    .line 765
    .line 766
    invoke-static {v1}, Ll/ykr0;->d(Ll/ykr0;)V

    .line 767
    .line 768
    .line 769
    iget-wide v6, v0, Ll/zkr0;->R:J

    .line 770
    .line 771
    cmp-long v2, v6, v4

    .line 772
    .line 773
    if-lez v2, :cond_15

    .line 774
    .line 775
    iget-object v2, v1, Ll/ykr0;->b:Ljava/lang/String;

    .line 776
    .line 777
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 778
    .line 779
    .line 780
    move-result v2

    .line 781
    if-eqz v2, :cond_15

    .line 782
    .line 783
    iget-object v2, v0, Ll/zkr0;->n:Ll/bgw0;

    .line 784
    .line 785
    const/16 v3, 0x8

    .line 786
    .line 787
    invoke-static {v3}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 788
    .line 789
    .line 790
    move-result-object v3

    .line 791
    sget-object v4, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 792
    .line 793
    invoke-virtual {v3, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 794
    .line 795
    .line 796
    move-result-object v3

    .line 797
    iget-wide v4, v0, Ll/zkr0;->R:J

    .line 798
    .line 799
    invoke-virtual {v3, v4, v5}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    .line 800
    .line 801
    .line 802
    move-result-object v3

    .line 803
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 804
    .line 805
    .line 806
    move-result-object v3

    .line 807
    array-length v4, v3

    .line 808
    invoke-virtual {v2, v3, v4}, Ll/bgw0;->i([BI)V

    .line 809
    .line 810
    .line 811
    :cond_15
    const/4 v2, 0x0

    .line 812
    const/4 v3, 0x0

    .line 813
    :goto_6
    iget v4, v0, Ll/zkr0;->K:I

    .line 814
    .line 815
    if-ge v2, v4, :cond_16

    .line 816
    .line 817
    iget-object v4, v0, Ll/zkr0;->L:[I

    .line 818
    .line 819
    aget v4, v4, v2

    .line 820
    .line 821
    add-int/2addr v3, v4

    .line 822
    add-int/lit8 v2, v2, 0x1

    .line 823
    .line 824
    goto :goto_6

    .line 825
    :cond_16
    const/4 v2, 0x0

    .line 826
    :goto_7
    iget v4, v0, Ll/zkr0;->K:I

    .line 827
    .line 828
    if-ge v2, v4, :cond_19

    .line 829
    .line 830
    iget-wide v4, v0, Ll/zkr0;->H:J

    .line 831
    .line 832
    iget v6, v1, Ll/ykr0;->e:I

    .line 833
    .line 834
    mul-int/2addr v6, v2

    .line 835
    div-int/lit16 v6, v6, 0x3e8

    .line 836
    .line 837
    int-to-long v6, v6

    .line 838
    add-long/2addr v4, v6

    .line 839
    iget v6, v0, Ll/zkr0;->O:I

    .line 840
    .line 841
    if-nez v2, :cond_18

    .line 842
    .line 843
    iget-boolean v2, v0, Ll/zkr0;->Q:Z

    .line 844
    .line 845
    if-nez v2, :cond_17

    .line 846
    .line 847
    or-int/lit8 v6, v6, 0x1

    .line 848
    .line 849
    :cond_17
    const/4 v7, 0x0

    .line 850
    goto :goto_8

    .line 851
    :cond_18
    move v7, v2

    .line 852
    :goto_8
    iget-object v2, v0, Ll/zkr0;->L:[I

    .line 853
    .line 854
    aget v2, v2, v7

    .line 855
    .line 856
    sub-int/2addr v3, v2

    .line 857
    move-wide/from16 v20, v4

    .line 858
    .line 859
    move v5, v2

    .line 860
    move v4, v6

    .line 861
    move v6, v3

    .line 862
    move-wide/from16 v2, v20

    .line 863
    .line 864
    invoke-virtual/range {v0 .. v6}, Ll/zkr0;->s(Ll/ykr0;JIII)V

    .line 865
    .line 866
    .line 867
    const/16 v19, 0x1

    .line 868
    .line 869
    add-int/lit8 v2, v7, 0x1

    .line 870
    .line 871
    move v3, v6

    .line 872
    goto :goto_7

    .line 873
    :cond_19
    const/4 v2, 0x0

    .line 874
    iput v2, v0, Ll/zkr0;->G:I

    .line 875
    .line 876
    :cond_1a
    :goto_9
    return-void

    .line 877
    :sswitch_data_0
    .sparse-switch
        -0x7ce7f5de -> :sswitch_20
        -0x7ce7f3b0 -> :sswitch_1f
        -0x76567dc0 -> :sswitch_1e
        -0x6a615338 -> :sswitch_1d
        -0x672350af -> :sswitch_1c
        -0x585f4fce -> :sswitch_1b
        -0x585f4fcd -> :sswitch_1a
        -0x51dc40b2 -> :sswitch_19
        -0x37a9c464 -> :sswitch_18
        -0x2016c535 -> :sswitch_17
        -0x2016c4e5 -> :sswitch_16
        -0x19552dbd -> :sswitch_15
        -0x1538b2ba -> :sswitch_14
        0x3c02325 -> :sswitch_13
        0x3c02353 -> :sswitch_12
        0x3c030c5 -> :sswitch_11
        0x4e81333 -> :sswitch_10
        0x4e86155 -> :sswitch_f
        0x4e86156 -> :sswitch_e
        0x5e8da3e -> :sswitch_d
        0x1a8350d6 -> :sswitch_c
        0x2056f406 -> :sswitch_b
        0x25e26ee2 -> :sswitch_a
        0x2b45174d -> :sswitch_9
        0x2b453ce4 -> :sswitch_8
        0x2c0618eb -> :sswitch_7
        0x32fdf009 -> :sswitch_6
        0x3e4ca2d8 -> :sswitch_5
        0x54c61e47 -> :sswitch_4
        0x6bd6c624 -> :sswitch_3
        0x7446132a -> :sswitch_2
        0x7446b0a6 -> :sswitch_1
        0x744ad97d -> :sswitch_0
    .end sparse-switch
.end method

.method public final i(ID)V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    const/16 v0, 0xb5

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x4489

    .line 6
    .line 7
    if-eq p1, v0, :cond_0

    .line 8
    .line 9
    packed-switch p1, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    packed-switch p1, :pswitch_data_1

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :pswitch_0
    double-to-float p2, p2

    .line 17
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 21
    .line 22
    iput p2, p0, Ll/ykr0;->v:F

    .line 23
    .line 24
    return-void

    .line 25
    :pswitch_1
    double-to-float p2, p2

    .line 26
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 30
    .line 31
    iput p2, p0, Ll/ykr0;->u:F

    .line 32
    .line 33
    return-void

    .line 34
    :pswitch_2
    double-to-float p2, p2

    .line 35
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 39
    .line 40
    iput p2, p0, Ll/ykr0;->t:F

    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_3
    double-to-float p2, p2

    .line 44
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 48
    .line 49
    iput p2, p0, Ll/ykr0;->N:F

    .line 50
    .line 51
    return-void

    .line 52
    :pswitch_4
    double-to-float p2, p2

    .line 53
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 57
    .line 58
    iput p2, p0, Ll/ykr0;->M:F

    .line 59
    .line 60
    return-void

    .line 61
    :pswitch_5
    double-to-float p2, p2

    .line 62
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 63
    .line 64
    .line 65
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 66
    .line 67
    iput p2, p0, Ll/ykr0;->L:F

    .line 68
    .line 69
    return-void

    .line 70
    :pswitch_6
    double-to-float p2, p2

    .line 71
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 75
    .line 76
    iput p2, p0, Ll/ykr0;->K:F

    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_7
    double-to-float p2, p2

    .line 80
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 81
    .line 82
    .line 83
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 84
    .line 85
    iput p2, p0, Ll/ykr0;->J:F

    .line 86
    .line 87
    return-void

    .line 88
    :pswitch_8
    double-to-float p2, p2

    .line 89
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 93
    .line 94
    iput p2, p0, Ll/ykr0;->I:F

    .line 95
    .line 96
    return-void

    .line 97
    :pswitch_9
    double-to-float p2, p2

    .line 98
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 102
    .line 103
    iput p2, p0, Ll/ykr0;->H:F

    .line 104
    .line 105
    return-void

    .line 106
    :pswitch_a
    double-to-float p2, p2

    .line 107
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 111
    .line 112
    iput p2, p0, Ll/ykr0;->G:F

    .line 113
    .line 114
    return-void

    .line 115
    :pswitch_b
    double-to-float p2, p2

    .line 116
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 117
    .line 118
    .line 119
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 120
    .line 121
    iput p2, p0, Ll/ykr0;->F:F

    .line 122
    .line 123
    return-void

    .line 124
    :pswitch_c
    double-to-float p2, p2

    .line 125
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 129
    .line 130
    iput p2, p0, Ll/ykr0;->E:F

    .line 131
    .line 132
    return-void

    .line 133
    :cond_0
    double-to-long p1, p2

    .line 134
    iput-wide p1, p0, Ll/zkr0;->s:J

    .line 135
    .line 136
    return-void

    .line 137
    :cond_1
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 138
    .line 139
    .line 140
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 141
    .line 142
    double-to-int p1, p2

    .line 143
    iput p1, p0, Ll/ykr0;->R:I

    .line 144
    .line 145
    return-void

    .line 146
    nop

    .line 147
    :pswitch_data_0
    .packed-switch 0x55d1
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    :pswitch_data_1
    .packed-switch 0x7673
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final j(IJ)V
    .locals 8
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    const/16 v0, 0x5031

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, " not supported"

    .line 5
    .line 6
    if-eq p1, v0, :cond_13

    .line 7
    .line 8
    const/16 v0, 0x5032

    .line 9
    .line 10
    const-wide/16 v3, 0x1

    .line 11
    .line 12
    if-eq p1, v0, :cond_11

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    const/4 v5, 0x3

    .line 16
    const/4 v6, 0x2

    .line 17
    const/4 v7, 0x1

    .line 18
    sparse-switch p1, :sswitch_data_0

    .line 19
    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    packed-switch p1, :pswitch_data_0

    .line 23
    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :pswitch_0
    long-to-int p2, p2

    .line 28
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 32
    .line 33
    iput p2, p0, Ll/ykr0;->D:I

    .line 34
    .line 35
    return-void

    .line 36
    :pswitch_1
    long-to-int p2, p2

    .line 37
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 41
    .line 42
    iput p2, p0, Ll/ykr0;->C:I

    .line 43
    .line 44
    return-void

    .line 45
    :pswitch_2
    long-to-int p2, p2

    .line 46
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 50
    .line 51
    iput-boolean v7, p1, Ll/ykr0;->y:Z

    .line 52
    .line 53
    invoke-static {p2}, Ll/wwy0;->a(I)I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eq p1, v0, :cond_14

    .line 58
    .line 59
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 60
    .line 61
    iput p1, p0, Ll/ykr0;->z:I

    .line 62
    .line 63
    return-void

    .line 64
    :pswitch_3
    long-to-int p2, p2

    .line 65
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 66
    .line 67
    .line 68
    invoke-static {p2}, Ll/wwy0;->b(I)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eq p1, v0, :cond_14

    .line 73
    .line 74
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 75
    .line 76
    iput p1, p0, Ll/ykr0;->A:I

    .line 77
    .line 78
    return-void

    .line 79
    :pswitch_4
    long-to-int p2, p2

    .line 80
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 81
    .line 82
    .line 83
    if-eq p2, v7, :cond_1

    .line 84
    .line 85
    if-eq p2, v6, :cond_0

    .line 86
    .line 87
    goto/16 :goto_0

    .line 88
    .line 89
    :cond_0
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 90
    .line 91
    iput v7, p0, Ll/ykr0;->B:I

    .line 92
    .line 93
    return-void

    .line 94
    :cond_1
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 95
    .line 96
    iput v6, p0, Ll/ykr0;->B:I

    .line 97
    .line 98
    return-void

    .line 99
    :sswitch_0
    iput-wide p2, p0, Ll/zkr0;->r:J

    .line 100
    .line 101
    return-void

    .line 102
    :sswitch_1
    long-to-int p2, p2

    .line 103
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 107
    .line 108
    iput p2, p0, Ll/ykr0;->e:I

    .line 109
    .line 110
    return-void

    .line 111
    :sswitch_2
    long-to-int p2, p2

    .line 112
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 113
    .line 114
    .line 115
    if-eqz p2, :cond_5

    .line 116
    .line 117
    if-eq p2, v7, :cond_4

    .line 118
    .line 119
    if-eq p2, v6, :cond_3

    .line 120
    .line 121
    if-eq p2, v5, :cond_2

    .line 122
    .line 123
    goto/16 :goto_0

    .line 124
    .line 125
    :cond_2
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 126
    .line 127
    iput v5, p0, Ll/ykr0;->s:I

    .line 128
    .line 129
    return-void

    .line 130
    :cond_3
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 131
    .line 132
    iput v6, p0, Ll/ykr0;->s:I

    .line 133
    .line 134
    return-void

    .line 135
    :cond_4
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 136
    .line 137
    iput v7, p0, Ll/ykr0;->s:I

    .line 138
    .line 139
    return-void

    .line 140
    :cond_5
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 141
    .line 142
    iput v0, p0, Ll/ykr0;->s:I

    .line 143
    .line 144
    return-void

    .line 145
    :sswitch_3
    iput-wide p2, p0, Ll/zkr0;->R:J

    .line 146
    .line 147
    return-void

    .line 148
    :sswitch_4
    long-to-int p2, p2

    .line 149
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 153
    .line 154
    iput p2, p0, Ll/ykr0;->Q:I

    .line 155
    .line 156
    return-void

    .line 157
    :sswitch_5
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 158
    .line 159
    .line 160
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 161
    .line 162
    iput-wide p2, p0, Ll/ykr0;->T:J

    .line 163
    .line 164
    return-void

    .line 165
    :sswitch_6
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 169
    .line 170
    iput-wide p2, p0, Ll/ykr0;->S:J

    .line 171
    .line 172
    return-void

    .line 173
    :sswitch_7
    long-to-int p2, p2

    .line 174
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 178
    .line 179
    iput p2, p0, Ll/ykr0;->f:I

    .line 180
    .line 181
    return-void

    .line 182
    :sswitch_8
    long-to-int p2, p2

    .line 183
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 187
    .line 188
    iput-boolean v7, p0, Ll/ykr0;->y:Z

    .line 189
    .line 190
    iput p2, p0, Ll/ykr0;->o:I

    .line 191
    .line 192
    return-void

    .line 193
    :sswitch_9
    cmp-long p2, p2, v3

    .line 194
    .line 195
    if-nez p2, :cond_6

    .line 196
    .line 197
    move v0, v7

    .line 198
    :cond_6
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 199
    .line 200
    .line 201
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 202
    .line 203
    iput-boolean v0, p0, Ll/ykr0;->V:Z

    .line 204
    .line 205
    return-void

    .line 206
    :sswitch_a
    long-to-int p2, p2

    .line 207
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 208
    .line 209
    .line 210
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 211
    .line 212
    iput p2, p0, Ll/ykr0;->q:I

    .line 213
    .line 214
    return-void

    .line 215
    :sswitch_b
    long-to-int p2, p2

    .line 216
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 217
    .line 218
    .line 219
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 220
    .line 221
    iput p2, p0, Ll/ykr0;->r:I

    .line 222
    .line 223
    return-void

    .line 224
    :sswitch_c
    long-to-int p2, p2

    .line 225
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 226
    .line 227
    .line 228
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 229
    .line 230
    iput p2, p0, Ll/ykr0;->p:I

    .line 231
    .line 232
    return-void

    .line 233
    :sswitch_d
    long-to-int p2, p2

    .line 234
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 235
    .line 236
    .line 237
    if-eqz p2, :cond_a

    .line 238
    .line 239
    if-eq p2, v7, :cond_9

    .line 240
    .line 241
    if-eq p2, v5, :cond_8

    .line 242
    .line 243
    const/16 p1, 0xf

    .line 244
    .line 245
    if-eq p2, p1, :cond_7

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :cond_7
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 250
    .line 251
    iput v5, p0, Ll/ykr0;->x:I

    .line 252
    .line 253
    return-void

    .line 254
    :cond_8
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 255
    .line 256
    iput v7, p0, Ll/ykr0;->x:I

    .line 257
    .line 258
    return-void

    .line 259
    :cond_9
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 260
    .line 261
    iput v6, p0, Ll/ykr0;->x:I

    .line 262
    .line 263
    return-void

    .line 264
    :cond_a
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 265
    .line 266
    iput v0, p0, Ll/ykr0;->x:I

    .line 267
    .line 268
    return-void

    .line 269
    :sswitch_e
    iget-wide v0, p0, Ll/zkr0;->q:J

    .line 270
    .line 271
    add-long/2addr p2, v0

    .line 272
    iput-wide p2, p0, Ll/zkr0;->x:J

    .line 273
    .line 274
    return-void

    .line 275
    :sswitch_f
    cmp-long p0, p2, v3

    .line 276
    .line 277
    if-nez p0, :cond_b

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :cond_b
    new-instance p0, Ljava/lang/StringBuilder;

    .line 282
    .line 283
    const-string p1, "AESSettingsCipherMode "

    .line 284
    .line 285
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    .line 293
    .line 294
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    throw p0

    .line 303
    :sswitch_10
    const-wide/16 p0, 0x5

    .line 304
    .line 305
    cmp-long p0, p2, p0

    .line 306
    .line 307
    if-nez p0, :cond_c

    .line 308
    .line 309
    goto/16 :goto_0

    .line 310
    .line 311
    :cond_c
    new-instance p0, Ljava/lang/StringBuilder;

    .line 312
    .line 313
    const-string p1, "ContentEncAlgo "

    .line 314
    .line 315
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    throw p0

    .line 333
    :sswitch_11
    cmp-long p0, p2, v3

    .line 334
    .line 335
    if-nez p0, :cond_d

    .line 336
    .line 337
    goto/16 :goto_0

    .line 338
    .line 339
    :cond_d
    new-instance p0, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    const-string p1, "EBMLReadVersion "

    .line 342
    .line 343
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 357
    .line 358
    .line 359
    move-result-object p0

    .line 360
    throw p0

    .line 361
    :sswitch_12
    cmp-long p0, p2, v3

    .line 362
    .line 363
    if-ltz p0, :cond_e

    .line 364
    .line 365
    const-wide/16 p0, 0x2

    .line 366
    .line 367
    cmp-long p0, p2, p0

    .line 368
    .line 369
    if-gtz p0, :cond_e

    .line 370
    .line 371
    goto/16 :goto_0

    .line 372
    .line 373
    :cond_e
    new-instance p0, Ljava/lang/StringBuilder;

    .line 374
    .line 375
    const-string p1, "DocTypeReadVersion "

    .line 376
    .line 377
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 378
    .line 379
    .line 380
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 391
    .line 392
    .line 393
    move-result-object p0

    .line 394
    throw p0

    .line 395
    :sswitch_13
    const-wide/16 p0, 0x3

    .line 396
    .line 397
    cmp-long p0, p2, p0

    .line 398
    .line 399
    if-nez p0, :cond_f

    .line 400
    .line 401
    goto/16 :goto_0

    .line 402
    .line 403
    :cond_f
    new-instance p0, Ljava/lang/StringBuilder;

    .line 404
    .line 405
    const-string p1, "ContentCompAlgo "

    .line 406
    .line 407
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 408
    .line 409
    .line 410
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 411
    .line 412
    .line 413
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 421
    .line 422
    .line 423
    move-result-object p0

    .line 424
    throw p0

    .line 425
    :sswitch_14
    long-to-int p2, p2

    .line 426
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 427
    .line 428
    .line 429
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 430
    .line 431
    invoke-static {p0, p2}, Ll/ykr0;->b(Ll/ykr0;I)V

    .line 432
    .line 433
    .line 434
    return-void

    .line 435
    :sswitch_15
    iput-boolean v7, p0, Ll/zkr0;->Q:Z

    .line 436
    .line 437
    return-void

    .line 438
    :sswitch_16
    iget-boolean v0, p0, Ll/zkr0;->E:Z

    .line 439
    .line 440
    if-nez v0, :cond_14

    .line 441
    .line 442
    invoke-virtual {p0, p1}, Ll/zkr0;->q(I)V

    .line 443
    .line 444
    .line 445
    iget-object p1, p0, Ll/zkr0;->D:Ll/z5w0;

    .line 446
    .line 447
    invoke-virtual {p1, p2, p3}, Ll/z5w0;->c(J)V

    .line 448
    .line 449
    .line 450
    iput-boolean v7, p0, Ll/zkr0;->E:Z

    .line 451
    .line 452
    return-void

    .line 453
    :sswitch_17
    long-to-int p1, p2

    .line 454
    iput p1, p0, Ll/zkr0;->P:I

    .line 455
    .line 456
    return-void

    .line 457
    :sswitch_18
    invoke-virtual {p0, p2, p3}, Ll/zkr0;->p(J)J

    .line 458
    .line 459
    .line 460
    move-result-wide p1

    .line 461
    iput-wide p1, p0, Ll/zkr0;->B:J

    .line 462
    .line 463
    return-void

    .line 464
    :sswitch_19
    long-to-int p2, p2

    .line 465
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 466
    .line 467
    .line 468
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 469
    .line 470
    iput p2, p0, Ll/ykr0;->c:I

    .line 471
    .line 472
    return-void

    .line 473
    :sswitch_1a
    long-to-int p2, p2

    .line 474
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 475
    .line 476
    .line 477
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 478
    .line 479
    iput p2, p0, Ll/ykr0;->n:I

    .line 480
    .line 481
    return-void

    .line 482
    :sswitch_1b
    invoke-virtual {p0, p1}, Ll/zkr0;->q(I)V

    .line 483
    .line 484
    .line 485
    iget-object p1, p0, Ll/zkr0;->C:Ll/z5w0;

    .line 486
    .line 487
    invoke-virtual {p0, p2, p3}, Ll/zkr0;->p(J)J

    .line 488
    .line 489
    .line 490
    move-result-wide p2

    .line 491
    invoke-virtual {p1, p2, p3}, Ll/z5w0;->c(J)V

    .line 492
    .line 493
    .line 494
    return-void

    .line 495
    :sswitch_1c
    long-to-int p2, p2

    .line 496
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 497
    .line 498
    .line 499
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 500
    .line 501
    iput p2, p0, Ll/ykr0;->m:I

    .line 502
    .line 503
    return-void

    .line 504
    :sswitch_1d
    long-to-int p2, p2

    .line 505
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 506
    .line 507
    .line 508
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 509
    .line 510
    iput p2, p0, Ll/ykr0;->P:I

    .line 511
    .line 512
    return-void

    .line 513
    :sswitch_1e
    invoke-virtual {p0, p2, p3}, Ll/zkr0;->p(J)J

    .line 514
    .line 515
    .line 516
    move-result-wide p1

    .line 517
    iput-wide p1, p0, Ll/zkr0;->I:J

    .line 518
    .line 519
    return-void

    .line 520
    :sswitch_1f
    cmp-long p2, p2, v3

    .line 521
    .line 522
    if-nez p2, :cond_10

    .line 523
    .line 524
    move v0, v7

    .line 525
    :cond_10
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 526
    .line 527
    .line 528
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 529
    .line 530
    iput-boolean v0, p0, Ll/ykr0;->W:Z

    .line 531
    .line 532
    return-void

    .line 533
    :sswitch_20
    long-to-int p2, p2

    .line 534
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 535
    .line 536
    .line 537
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 538
    .line 539
    iput p2, p0, Ll/ykr0;->d:I

    .line 540
    .line 541
    return-void

    .line 542
    :cond_11
    cmp-long p0, p2, v3

    .line 543
    .line 544
    if-nez p0, :cond_12

    .line 545
    .line 546
    goto :goto_0

    .line 547
    :cond_12
    new-instance p0, Ljava/lang/StringBuilder;

    .line 548
    .line 549
    const-string p1, "ContentEncodingScope "

    .line 550
    .line 551
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 552
    .line 553
    .line 554
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 555
    .line 556
    .line 557
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 558
    .line 559
    .line 560
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 561
    .line 562
    .line 563
    move-result-object p0

    .line 564
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 565
    .line 566
    .line 567
    move-result-object p0

    .line 568
    throw p0

    .line 569
    :cond_13
    const-wide/16 p0, 0x0

    .line 570
    .line 571
    cmp-long p0, p2, p0

    .line 572
    .line 573
    if-nez p0, :cond_15

    .line 574
    .line 575
    :cond_14
    :goto_0
    return-void

    .line 576
    :cond_15
    new-instance p0, Ljava/lang/StringBuilder;

    .line 577
    .line 578
    const-string p1, "ContentEncodingOrder "

    .line 579
    .line 580
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 581
    .line 582
    .line 583
    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 584
    .line 585
    .line 586
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 587
    .line 588
    .line 589
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 590
    .line 591
    .line 592
    move-result-object p0

    .line 593
    invoke-static {p0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 594
    .line 595
    .line 596
    move-result-object p0

    .line 597
    throw p0

    .line 598
    nop

    .line 599
    :sswitch_data_0
    .sparse-switch
        0x83 -> :sswitch_20
        0x88 -> :sswitch_1f
        0x9b -> :sswitch_1e
        0x9f -> :sswitch_1d
        0xb0 -> :sswitch_1c
        0xb3 -> :sswitch_1b
        0xba -> :sswitch_1a
        0xd7 -> :sswitch_19
        0xe7 -> :sswitch_18
        0xee -> :sswitch_17
        0xf1 -> :sswitch_16
        0xfb -> :sswitch_15
        0x41e7 -> :sswitch_14
        0x4254 -> :sswitch_13
        0x4285 -> :sswitch_12
        0x42f7 -> :sswitch_11
        0x47e1 -> :sswitch_10
        0x47e8 -> :sswitch_f
        0x53ac -> :sswitch_e
        0x53b8 -> :sswitch_d
        0x54b0 -> :sswitch_c
        0x54b2 -> :sswitch_b
        0x54ba -> :sswitch_a
        0x55aa -> :sswitch_9
        0x55b2 -> :sswitch_8
        0x55ee -> :sswitch_7
        0x56aa -> :sswitch_6
        0x56bb -> :sswitch_5
        0x6264 -> :sswitch_4
        0x75a2 -> :sswitch_3
        0x7671 -> :sswitch_2
        0x23e383 -> :sswitch_1
        0x2ad7b1 -> :sswitch_0
    .end sparse-switch

    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    .line 716
    .line 717
    .line 718
    .line 719
    .line 720
    .line 721
    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    :pswitch_data_0
    .packed-switch 0x55b9
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final k(IJJ)V
    .locals 6
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zkr0;->b0:Ll/ser0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    const/16 v0, 0xa0

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const-wide/16 v2, 0x0

    .line 10
    .line 11
    if-eq p1, v0, :cond_c

    .line 12
    .line 13
    const/16 v0, 0xae

    .line 14
    .line 15
    if-eq p1, v0, :cond_b

    .line 16
    .line 17
    const/16 v0, 0xbb

    .line 18
    .line 19
    if-eq p1, v0, :cond_a

    .line 20
    .line 21
    const/16 v0, 0x4dbb

    .line 22
    .line 23
    const-wide/16 v4, -0x1

    .line 24
    .line 25
    if-eq p1, v0, :cond_9

    .line 26
    .line 27
    const/16 v0, 0x5035

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    if-eq p1, v0, :cond_8

    .line 31
    .line 32
    const/16 v0, 0x55d0

    .line 33
    .line 34
    if-eq p1, v0, :cond_7

    .line 35
    .line 36
    const v0, 0x18538067

    .line 37
    .line 38
    .line 39
    if-eq p1, v0, :cond_4

    .line 40
    .line 41
    const p2, 0x1c53bb6b

    .line 42
    .line 43
    .line 44
    if-eq p1, p2, :cond_3

    .line 45
    .line 46
    const p2, 0x1f43b675

    .line 47
    .line 48
    .line 49
    if-eq p1, p2, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    iget-boolean p1, p0, Ll/zkr0;->v:Z

    .line 53
    .line 54
    if-nez p1, :cond_2

    .line 55
    .line 56
    iget-boolean p1, p0, Ll/zkr0;->d:Z

    .line 57
    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    iget-wide p1, p0, Ll/zkr0;->z:J

    .line 61
    .line 62
    cmp-long p1, p1, v4

    .line 63
    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    iput-boolean v1, p0, Ll/zkr0;->y:Z

    .line 67
    .line 68
    return-void

    .line 69
    :cond_1
    iget-object p1, p0, Ll/zkr0;->b0:Ll/ser0;

    .line 70
    .line 71
    new-instance p2, Ll/agr0;

    .line 72
    .line 73
    iget-wide p3, p0, Ll/zkr0;->t:J

    .line 74
    .line 75
    invoke-direct {p2, p3, p4, v2, v3}, Ll/agr0;-><init>(JJ)V

    .line 76
    .line 77
    .line 78
    invoke-interface {p1, p2}, Ll/ser0;->j(Ll/bgr0;)V

    .line 79
    .line 80
    .line 81
    iput-boolean v1, p0, Ll/zkr0;->v:Z

    .line 82
    .line 83
    :cond_2
    :goto_0
    return-void

    .line 84
    :cond_3
    new-instance p1, Ll/z5w0;

    .line 85
    .line 86
    const/16 p2, 0x20

    .line 87
    .line 88
    invoke-direct {p1, p2}, Ll/z5w0;-><init>(I)V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Ll/zkr0;->C:Ll/z5w0;

    .line 92
    .line 93
    new-instance p1, Ll/z5w0;

    .line 94
    .line 95
    invoke-direct {p1, p2}, Ll/z5w0;-><init>(I)V

    .line 96
    .line 97
    .line 98
    iput-object p1, p0, Ll/zkr0;->D:Ll/z5w0;

    .line 99
    .line 100
    return-void

    .line 101
    :cond_4
    iget-wide v0, p0, Ll/zkr0;->q:J

    .line 102
    .line 103
    cmp-long p1, v0, v4

    .line 104
    .line 105
    if-eqz p1, :cond_6

    .line 106
    .line 107
    cmp-long p1, v0, p2

    .line 108
    .line 109
    if-nez p1, :cond_5

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_5
    const-string p0, "Multiple Segment elements not supported"

    .line 113
    .line 114
    const/4 p1, 0x0

    .line 115
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    throw p0

    .line 120
    :cond_6
    :goto_1
    iput-wide p2, p0, Ll/zkr0;->q:J

    .line 121
    .line 122
    iput-wide p4, p0, Ll/zkr0;->p:J

    .line 123
    .line 124
    return-void

    .line 125
    :cond_7
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 129
    .line 130
    iput-boolean v1, p0, Ll/ykr0;->y:Z

    .line 131
    .line 132
    return-void

    .line 133
    :cond_8
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 137
    .line 138
    iput-boolean v1, p0, Ll/ykr0;->h:Z

    .line 139
    .line 140
    return-void

    .line 141
    :cond_9
    const/4 p1, -0x1

    .line 142
    iput p1, p0, Ll/zkr0;->w:I

    .line 143
    .line 144
    iput-wide v4, p0, Ll/zkr0;->x:J

    .line 145
    .line 146
    return-void

    .line 147
    :cond_a
    iput-boolean v1, p0, Ll/zkr0;->E:Z

    .line 148
    .line 149
    return-void

    .line 150
    :cond_b
    new-instance p1, Ll/ykr0;

    .line 151
    .line 152
    invoke-direct {p1}, Ll/ykr0;-><init>()V

    .line 153
    .line 154
    .line 155
    iput-object p1, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 156
    .line 157
    return-void

    .line 158
    :cond_c
    iput-boolean v1, p0, Ll/zkr0;->Q:Z

    .line 159
    .line 160
    iput-wide v2, p0, Ll/zkr0;->R:J

    .line 161
    .line 162
    return-void
.end method

.method public final l(ILjava/lang/String;)V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    const/16 v0, 0x86

    .line 2
    .line 3
    if-eq p1, v0, :cond_5

    .line 4
    .line 5
    const/16 v0, 0x4282

    .line 6
    .line 7
    if-eq p1, v0, :cond_2

    .line 8
    .line 9
    const/16 v0, 0x536e

    .line 10
    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    const v0, 0x22b59c

    .line 14
    .line 15
    .line 16
    if-eq p1, v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 23
    .line 24
    invoke-static {p0, p2}, Ll/ykr0;->c(Ll/ykr0;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 32
    .line 33
    iput-object p2, p0, Ll/ykr0;->a:Ljava/lang/String;

    .line 34
    .line 35
    return-void

    .line 36
    :cond_2
    const-string p0, "webm"

    .line 37
    .line 38
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_4

    .line 43
    .line 44
    const-string p0, "matroska"

    .line 45
    .line 46
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-eqz p0, :cond_3

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string p1, "DocType "

    .line 56
    .line 57
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p1, " not supported"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const/4 p1, 0x0

    .line 73
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    throw p0

    .line 78
    :cond_4
    :goto_0
    return-void

    .line 79
    :cond_5
    invoke-virtual {p0, p1}, Ll/zkr0;->r(I)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 83
    .line 84
    iput-object p2, p0, Ll/ykr0;->b:Ljava/lang/String;

    .line 85
    .line 86
    return-void
.end method

.method public final n(Ll/qer0;Ll/ykr0;IZ)I
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "#2.output"
        }
    .end annotation

    .line 1
    const-string v0, "S_TEXT/UTF8"

    .line 2
    .line 3
    iget-object v1, p2, Ll/ykr0;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p2, Ll/zkr0;->d0:[B

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3}, Ll/zkr0;->v(Ll/qer0;[BI)V

    .line 14
    .line 15
    .line 16
    iget p1, p0, Ll/zkr0;->T:I

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/zkr0;->u()V

    .line 19
    .line 20
    .line 21
    return p1

    .line 22
    :cond_0
    iget-object v0, p2, Ll/ykr0;->b:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "S_TEXT/ASS"

    .line 25
    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    sget-object p2, Ll/zkr0;->f0:[B

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2, p3}, Ll/zkr0;->v(Ll/qer0;[BI)V

    .line 35
    .line 36
    .line 37
    iget p1, p0, Ll/zkr0;->T:I

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/zkr0;->u()V

    .line 40
    .line 41
    .line 42
    return p1

    .line 43
    :cond_1
    iget-object v0, p2, Ll/ykr0;->b:Ljava/lang/String;

    .line 44
    .line 45
    const-string v1, "S_TEXT/WEBVTT"

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    sget-object p2, Ll/zkr0;->g0:[B

    .line 54
    .line 55
    invoke-virtual {p0, p1, p2, p3}, Ll/zkr0;->v(Ll/qer0;[BI)V

    .line 56
    .line 57
    .line 58
    iget p1, p0, Ll/zkr0;->T:I

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/zkr0;->u()V

    .line 61
    .line 62
    .line 63
    return p1

    .line 64
    :cond_2
    iget-object v0, p2, Ll/ykr0;->Y:Ll/sgr0;

    .line 65
    .line 66
    iget-boolean v1, p0, Ll/zkr0;->V:Z

    .line 67
    .line 68
    const/4 v2, 0x2

    .line 69
    const/4 v3, 0x4

    .line 70
    const/4 v4, 0x1

    .line 71
    const/4 v5, 0x0

    .line 72
    if-nez v1, :cond_11

    .line 73
    .line 74
    iget-boolean v1, p2, Ll/ykr0;->h:Z

    .line 75
    .line 76
    if-eqz v1, :cond_d

    .line 77
    .line 78
    iget v1, p0, Ll/zkr0;->O:I

    .line 79
    .line 80
    const v6, -0x40000001    # -1.9999999f

    .line 81
    .line 82
    .line 83
    and-int/2addr v1, v6

    .line 84
    iput v1, p0, Ll/zkr0;->O:I

    .line 85
    .line 86
    iget-boolean v1, p0, Ll/zkr0;->W:Z

    .line 87
    .line 88
    const/16 v6, 0x80

    .line 89
    .line 90
    if-nez v1, :cond_4

    .line 91
    .line 92
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 93
    .line 94
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    move-object v7, p1

    .line 99
    check-cast v7, Ll/fer0;

    .line 100
    .line 101
    invoke-virtual {v7, v1, v5, v4, v5}, Ll/fer0;->b([BIIZ)Z

    .line 102
    .line 103
    .line 104
    iget v1, p0, Ll/zkr0;->S:I

    .line 105
    .line 106
    add-int/2addr v1, v4

    .line 107
    iput v1, p0, Ll/zkr0;->S:I

    .line 108
    .line 109
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 110
    .line 111
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    aget-byte v1, v1, v5

    .line 116
    .line 117
    and-int/2addr v1, v6

    .line 118
    if-eq v1, v6, :cond_3

    .line 119
    .line 120
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 121
    .line 122
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    aget-byte v1, v1, v5

    .line 127
    .line 128
    iput-byte v1, p0, Ll/zkr0;->Z:B

    .line 129
    .line 130
    iput-boolean v4, p0, Ll/zkr0;->W:Z

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_3
    const-string p0, "Extension bit is set in signal byte"

    .line 134
    .line 135
    const/4 p1, 0x0

    .line 136
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    throw p0

    .line 141
    :cond_4
    :goto_0
    iget-byte v1, p0, Ll/zkr0;->Z:B

    .line 142
    .line 143
    and-int/lit8 v7, v1, 0x1

    .line 144
    .line 145
    if-ne v7, v4, :cond_e

    .line 146
    .line 147
    and-int/2addr v1, v2

    .line 148
    iget v7, p0, Ll/zkr0;->O:I

    .line 149
    .line 150
    const/high16 v8, 0x40000000    # 2.0f

    .line 151
    .line 152
    or-int/2addr v7, v8

    .line 153
    iput v7, p0, Ll/zkr0;->O:I

    .line 154
    .line 155
    iget-boolean v7, p0, Ll/zkr0;->a0:Z

    .line 156
    .line 157
    if-nez v7, :cond_6

    .line 158
    .line 159
    iget-object v7, p0, Ll/zkr0;->l:Ll/bgw0;

    .line 160
    .line 161
    invoke-virtual {v7}, Ll/bgw0;->m()[B

    .line 162
    .line 163
    .line 164
    move-result-object v7

    .line 165
    move-object v8, p1

    .line 166
    check-cast v8, Ll/fer0;

    .line 167
    .line 168
    const/16 v9, 0x8

    .line 169
    .line 170
    invoke-virtual {v8, v7, v5, v9, v5}, Ll/fer0;->b([BIIZ)Z

    .line 171
    .line 172
    .line 173
    iget v7, p0, Ll/zkr0;->S:I

    .line 174
    .line 175
    add-int/2addr v7, v9

    .line 176
    iput v7, p0, Ll/zkr0;->S:I

    .line 177
    .line 178
    iput-boolean v4, p0, Ll/zkr0;->a0:Z

    .line 179
    .line 180
    iget-object v7, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 181
    .line 182
    if-ne v1, v2, :cond_5

    .line 183
    .line 184
    goto :goto_1

    .line 185
    :cond_5
    move v6, v5

    .line 186
    :goto_1
    or-int/2addr v6, v9

    .line 187
    invoke-virtual {v7}, Ll/bgw0;->m()[B

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    int-to-byte v6, v6

    .line 192
    aput-byte v6, v7, v5

    .line 193
    .line 194
    iget-object v6, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 195
    .line 196
    invoke-virtual {v6, v5}, Ll/bgw0;->k(I)V

    .line 197
    .line 198
    .line 199
    iget-object v6, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 200
    .line 201
    invoke-interface {v0, v6, v4, v4}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 202
    .line 203
    .line 204
    iget v6, p0, Ll/zkr0;->T:I

    .line 205
    .line 206
    add-int/2addr v6, v4

    .line 207
    iput v6, p0, Ll/zkr0;->T:I

    .line 208
    .line 209
    iget-object v6, p0, Ll/zkr0;->l:Ll/bgw0;

    .line 210
    .line 211
    invoke-virtual {v6, v5}, Ll/bgw0;->k(I)V

    .line 212
    .line 213
    .line 214
    iget-object v6, p0, Ll/zkr0;->l:Ll/bgw0;

    .line 215
    .line 216
    invoke-interface {v0, v6, v9, v4}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 217
    .line 218
    .line 219
    iget v6, p0, Ll/zkr0;->T:I

    .line 220
    .line 221
    add-int/2addr v6, v9

    .line 222
    iput v6, p0, Ll/zkr0;->T:I

    .line 223
    .line 224
    :cond_6
    if-ne v1, v2, :cond_e

    .line 225
    .line 226
    iget-boolean v1, p0, Ll/zkr0;->X:Z

    .line 227
    .line 228
    if-nez v1, :cond_7

    .line 229
    .line 230
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 231
    .line 232
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    move-object v6, p1

    .line 237
    check-cast v6, Ll/fer0;

    .line 238
    .line 239
    invoke-virtual {v6, v1, v5, v4, v5}, Ll/fer0;->b([BIIZ)Z

    .line 240
    .line 241
    .line 242
    iget v1, p0, Ll/zkr0;->S:I

    .line 243
    .line 244
    add-int/2addr v1, v4

    .line 245
    iput v1, p0, Ll/zkr0;->S:I

    .line 246
    .line 247
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 248
    .line 249
    invoke-virtual {v1, v5}, Ll/bgw0;->k(I)V

    .line 250
    .line 251
    .line 252
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 253
    .line 254
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 255
    .line 256
    .line 257
    move-result v1

    .line 258
    iput v1, p0, Ll/zkr0;->Y:I

    .line 259
    .line 260
    iput-boolean v4, p0, Ll/zkr0;->X:Z

    .line 261
    .line 262
    :cond_7
    iget v1, p0, Ll/zkr0;->Y:I

    .line 263
    .line 264
    mul-int/2addr v1, v3

    .line 265
    iget-object v6, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 266
    .line 267
    invoke-virtual {v6, v1}, Ll/bgw0;->h(I)V

    .line 268
    .line 269
    .line 270
    iget-object v6, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 271
    .line 272
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 273
    .line 274
    .line 275
    move-result-object v6

    .line 276
    move-object v7, p1

    .line 277
    check-cast v7, Ll/fer0;

    .line 278
    .line 279
    invoke-virtual {v7, v6, v5, v1, v5}, Ll/fer0;->b([BIIZ)Z

    .line 280
    .line 281
    .line 282
    iget v6, p0, Ll/zkr0;->S:I

    .line 283
    .line 284
    add-int/2addr v6, v1

    .line 285
    iput v6, p0, Ll/zkr0;->S:I

    .line 286
    .line 287
    iget v1, p0, Ll/zkr0;->Y:I

    .line 288
    .line 289
    shr-int/2addr v1, v4

    .line 290
    add-int/2addr v1, v4

    .line 291
    mul-int/lit8 v6, v1, 0x6

    .line 292
    .line 293
    add-int/2addr v6, v2

    .line 294
    iget-object v7, p0, Ll/zkr0;->o:Ljava/nio/ByteBuffer;

    .line 295
    .line 296
    if-eqz v7, :cond_8

    .line 297
    .line 298
    invoke-virtual {v7}, Ljava/nio/Buffer;->capacity()I

    .line 299
    .line 300
    .line 301
    move-result v7

    .line 302
    if-ge v7, v6, :cond_9

    .line 303
    .line 304
    :cond_8
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 305
    .line 306
    .line 307
    move-result-object v7

    .line 308
    iput-object v7, p0, Ll/zkr0;->o:Ljava/nio/ByteBuffer;

    .line 309
    .line 310
    :cond_9
    int-to-short v1, v1

    .line 311
    iget-object v7, p0, Ll/zkr0;->o:Ljava/nio/ByteBuffer;

    .line 312
    .line 313
    invoke-virtual {v7, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 314
    .line 315
    .line 316
    iget-object v7, p0, Ll/zkr0;->o:Ljava/nio/ByteBuffer;

    .line 317
    .line 318
    invoke-virtual {v7, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 319
    .line 320
    .line 321
    move v1, v5

    .line 322
    move v7, v1

    .line 323
    :goto_2
    iget v8, p0, Ll/zkr0;->Y:I

    .line 324
    .line 325
    if-ge v1, v8, :cond_b

    .line 326
    .line 327
    iget-object v8, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 328
    .line 329
    invoke-virtual {v8}, Ll/bgw0;->E()I

    .line 330
    .line 331
    .line 332
    move-result v8

    .line 333
    sub-int v7, v8, v7

    .line 334
    .line 335
    rem-int/lit8 v9, v1, 0x2

    .line 336
    .line 337
    iget-object v10, p0, Ll/zkr0;->o:Ljava/nio/ByteBuffer;

    .line 338
    .line 339
    if-nez v9, :cond_a

    .line 340
    .line 341
    int-to-short v7, v7

    .line 342
    invoke-virtual {v10, v7}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 343
    .line 344
    .line 345
    goto :goto_3

    .line 346
    :cond_a
    invoke-virtual {v10, v7}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 347
    .line 348
    .line 349
    :goto_3
    add-int/lit8 v1, v1, 0x1

    .line 350
    .line 351
    move v7, v8

    .line 352
    goto :goto_2

    .line 353
    :cond_b
    iget v1, p0, Ll/zkr0;->S:I

    .line 354
    .line 355
    sub-int v1, p3, v1

    .line 356
    .line 357
    sub-int/2addr v1, v7

    .line 358
    and-int/lit8 v7, v8, 0x1

    .line 359
    .line 360
    iget-object v8, p0, Ll/zkr0;->o:Ljava/nio/ByteBuffer;

    .line 361
    .line 362
    if-ne v7, v4, :cond_c

    .line 363
    .line 364
    invoke-virtual {v8, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 365
    .line 366
    .line 367
    goto :goto_4

    .line 368
    :cond_c
    int-to-short v1, v1

    .line 369
    invoke-virtual {v8, v1}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    .line 370
    .line 371
    .line 372
    iget-object v1, p0, Ll/zkr0;->o:Ljava/nio/ByteBuffer;

    .line 373
    .line 374
    invoke-virtual {v1, v5}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    .line 375
    .line 376
    .line 377
    :goto_4
    iget-object v1, p0, Ll/zkr0;->m:Ll/bgw0;

    .line 378
    .line 379
    iget-object v7, p0, Ll/zkr0;->o:Ljava/nio/ByteBuffer;

    .line 380
    .line 381
    invoke-virtual {v7}, Ljava/nio/ByteBuffer;->array()[B

    .line 382
    .line 383
    .line 384
    move-result-object v7

    .line 385
    invoke-virtual {v1, v7, v6}, Ll/bgw0;->i([BI)V

    .line 386
    .line 387
    .line 388
    iget-object v1, p0, Ll/zkr0;->m:Ll/bgw0;

    .line 389
    .line 390
    invoke-interface {v0, v1, v6, v4}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 391
    .line 392
    .line 393
    iget v1, p0, Ll/zkr0;->T:I

    .line 394
    .line 395
    add-int/2addr v1, v6

    .line 396
    iput v1, p0, Ll/zkr0;->T:I

    .line 397
    .line 398
    goto :goto_5

    .line 399
    :cond_d
    iget-object v1, p2, Ll/ykr0;->i:[B

    .line 400
    .line 401
    if-eqz v1, :cond_e

    .line 402
    .line 403
    iget-object v6, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 404
    .line 405
    array-length v7, v1

    .line 406
    invoke-virtual {v6, v1, v7}, Ll/bgw0;->i([BI)V

    .line 407
    .line 408
    .line 409
    :cond_e
    :goto_5
    iget-object v1, p2, Ll/ykr0;->b:Ljava/lang/String;

    .line 410
    .line 411
    const-string v6, "A_OPUS"

    .line 412
    .line 413
    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 414
    .line 415
    .line 416
    move-result v1

    .line 417
    if-eqz v1, :cond_f

    .line 418
    .line 419
    if-eqz p4, :cond_10

    .line 420
    .line 421
    goto :goto_6

    .line 422
    :cond_f
    iget p4, p2, Ll/ykr0;->f:I

    .line 423
    .line 424
    if-lez p4, :cond_10

    .line 425
    .line 426
    :goto_6
    iget p4, p0, Ll/zkr0;->O:I

    .line 427
    .line 428
    const/high16 v1, 0x10000000

    .line 429
    .line 430
    or-int/2addr p4, v1

    .line 431
    iput p4, p0, Ll/zkr0;->O:I

    .line 432
    .line 433
    iget-object p4, p0, Ll/zkr0;->n:Ll/bgw0;

    .line 434
    .line 435
    invoke-virtual {p4, v5}, Ll/bgw0;->h(I)V

    .line 436
    .line 437
    .line 438
    iget-object p4, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 439
    .line 440
    invoke-virtual {p4}, Ll/bgw0;->t()I

    .line 441
    .line 442
    .line 443
    move-result p4

    .line 444
    add-int/2addr p4, p3

    .line 445
    iget v1, p0, Ll/zkr0;->S:I

    .line 446
    .line 447
    sub-int/2addr p4, v1

    .line 448
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 449
    .line 450
    invoke-virtual {v1, v3}, Ll/bgw0;->h(I)V

    .line 451
    .line 452
    .line 453
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 454
    .line 455
    shr-int/lit8 v6, p4, 0x18

    .line 456
    .line 457
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 458
    .line 459
    .line 460
    move-result-object v1

    .line 461
    and-int/lit16 v6, v6, 0xff

    .line 462
    .line 463
    int-to-byte v6, v6

    .line 464
    aput-byte v6, v1, v5

    .line 465
    .line 466
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 467
    .line 468
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 469
    .line 470
    .line 471
    move-result-object v1

    .line 472
    shr-int/lit8 v6, p4, 0x10

    .line 473
    .line 474
    and-int/lit16 v6, v6, 0xff

    .line 475
    .line 476
    int-to-byte v6, v6

    .line 477
    aput-byte v6, v1, v4

    .line 478
    .line 479
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 480
    .line 481
    shr-int/lit8 v6, p4, 0x8

    .line 482
    .line 483
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    and-int/lit16 v6, v6, 0xff

    .line 488
    .line 489
    int-to-byte v6, v6

    .line 490
    aput-byte v6, v1, v2

    .line 491
    .line 492
    iget-object v1, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 493
    .line 494
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 495
    .line 496
    .line 497
    move-result-object v1

    .line 498
    and-int/lit16 p4, p4, 0xff

    .line 499
    .line 500
    int-to-byte p4, p4

    .line 501
    const/4 v6, 0x3

    .line 502
    aput-byte p4, v1, v6

    .line 503
    .line 504
    iget-object p4, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 505
    .line 506
    invoke-interface {v0, p4, v3, v2}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 507
    .line 508
    .line 509
    iget p4, p0, Ll/zkr0;->T:I

    .line 510
    .line 511
    add-int/2addr p4, v3

    .line 512
    iput p4, p0, Ll/zkr0;->T:I

    .line 513
    .line 514
    :cond_10
    iput-boolean v4, p0, Ll/zkr0;->V:Z

    .line 515
    .line 516
    :cond_11
    iget-object p4, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 517
    .line 518
    invoke-virtual {p4}, Ll/bgw0;->t()I

    .line 519
    .line 520
    .line 521
    move-result p4

    .line 522
    add-int/2addr p3, p4

    .line 523
    iget-object p4, p2, Ll/ykr0;->b:Ljava/lang/String;

    .line 524
    .line 525
    const-string v1, "V_MPEG4/ISO/AVC"

    .line 526
    .line 527
    invoke-virtual {v1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 528
    .line 529
    .line 530
    move-result p4

    .line 531
    if-nez p4, :cond_15

    .line 532
    .line 533
    iget-object p4, p2, Ll/ykr0;->b:Ljava/lang/String;

    .line 534
    .line 535
    const-string v1, "V_MPEGH/ISO/HEVC"

    .line 536
    .line 537
    invoke-virtual {v1, p4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 538
    .line 539
    .line 540
    move-result p4

    .line 541
    if-eqz p4, :cond_12

    .line 542
    .line 543
    goto :goto_9

    .line 544
    :cond_12
    iget-object p4, p2, Ll/ykr0;->U:Ll/tgr0;

    .line 545
    .line 546
    if-nez p4, :cond_13

    .line 547
    .line 548
    goto :goto_8

    .line 549
    :cond_13
    iget-object p4, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 550
    .line 551
    invoke-virtual {p4}, Ll/bgw0;->t()I

    .line 552
    .line 553
    .line 554
    move-result p4

    .line 555
    if-nez p4, :cond_14

    .line 556
    .line 557
    goto :goto_7

    .line 558
    :cond_14
    move v4, v5

    .line 559
    :goto_7
    invoke-static {v4}, Ll/lev0;->f(Z)V

    .line 560
    .line 561
    .line 562
    iget-object p4, p2, Ll/ykr0;->U:Ll/tgr0;

    .line 563
    .line 564
    invoke-virtual {p4, p1}, Ll/tgr0;->d(Ll/qer0;)V

    .line 565
    .line 566
    .line 567
    :goto_8
    iget p4, p0, Ll/zkr0;->S:I

    .line 568
    .line 569
    if-ge p4, p3, :cond_18

    .line 570
    .line 571
    sub-int p4, p3, p4

    .line 572
    .line 573
    invoke-virtual {p0, p1, v0, p4}, Ll/zkr0;->o(Ll/qer0;Ll/sgr0;I)I

    .line 574
    .line 575
    .line 576
    move-result p4

    .line 577
    iget v1, p0, Ll/zkr0;->S:I

    .line 578
    .line 579
    add-int/2addr v1, p4

    .line 580
    iput v1, p0, Ll/zkr0;->S:I

    .line 581
    .line 582
    iget v1, p0, Ll/zkr0;->T:I

    .line 583
    .line 584
    add-int/2addr v1, p4

    .line 585
    iput v1, p0, Ll/zkr0;->T:I

    .line 586
    .line 587
    goto :goto_8

    .line 588
    :cond_15
    :goto_9
    iget-object p4, p0, Ll/zkr0;->f:Ll/bgw0;

    .line 589
    .line 590
    invoke-virtual {p4}, Ll/bgw0;->m()[B

    .line 591
    .line 592
    .line 593
    move-result-object p4

    .line 594
    aput-byte v5, p4, v5

    .line 595
    .line 596
    aput-byte v5, p4, v4

    .line 597
    .line 598
    aput-byte v5, p4, v2

    .line 599
    .line 600
    iget v1, p2, Ll/ykr0;->Z:I

    .line 601
    .line 602
    rsub-int/lit8 v2, v1, 0x4

    .line 603
    .line 604
    :goto_a
    iget v4, p0, Ll/zkr0;->S:I

    .line 605
    .line 606
    if-ge v4, p3, :cond_18

    .line 607
    .line 608
    iget v4, p0, Ll/zkr0;->U:I

    .line 609
    .line 610
    if-nez v4, :cond_17

    .line 611
    .line 612
    iget-object v4, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 613
    .line 614
    invoke-virtual {v4}, Ll/bgw0;->q()I

    .line 615
    .line 616
    .line 617
    move-result v4

    .line 618
    invoke-static {v1, v4}, Ljava/lang/Math;->min(II)I

    .line 619
    .line 620
    .line 621
    move-result v4

    .line 622
    add-int v6, v2, v4

    .line 623
    .line 624
    sub-int v7, v1, v4

    .line 625
    .line 626
    move-object v8, p1

    .line 627
    check-cast v8, Ll/fer0;

    .line 628
    .line 629
    invoke-virtual {v8, p4, v6, v7, v5}, Ll/fer0;->b([BIIZ)Z

    .line 630
    .line 631
    .line 632
    if-lez v4, :cond_16

    .line 633
    .line 634
    iget-object v6, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 635
    .line 636
    invoke-virtual {v6, p4, v2, v4}, Ll/bgw0;->g([BII)V

    .line 637
    .line 638
    .line 639
    :cond_16
    iget v4, p0, Ll/zkr0;->S:I

    .line 640
    .line 641
    add-int/2addr v4, v1

    .line 642
    iput v4, p0, Ll/zkr0;->S:I

    .line 643
    .line 644
    iget-object v4, p0, Ll/zkr0;->f:Ll/bgw0;

    .line 645
    .line 646
    invoke-virtual {v4, v5}, Ll/bgw0;->k(I)V

    .line 647
    .line 648
    .line 649
    iget-object v4, p0, Ll/zkr0;->f:Ll/bgw0;

    .line 650
    .line 651
    invoke-virtual {v4}, Ll/bgw0;->E()I

    .line 652
    .line 653
    .line 654
    move-result v4

    .line 655
    iput v4, p0, Ll/zkr0;->U:I

    .line 656
    .line 657
    iget-object v4, p0, Ll/zkr0;->e:Ll/bgw0;

    .line 658
    .line 659
    invoke-virtual {v4, v5}, Ll/bgw0;->k(I)V

    .line 660
    .line 661
    .line 662
    iget-object v4, p0, Ll/zkr0;->e:Ll/bgw0;

    .line 663
    .line 664
    invoke-static {v0, v4, v3}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 665
    .line 666
    .line 667
    iget v4, p0, Ll/zkr0;->T:I

    .line 668
    .line 669
    add-int/2addr v4, v3

    .line 670
    iput v4, p0, Ll/zkr0;->T:I

    .line 671
    .line 672
    goto :goto_a

    .line 673
    :cond_17
    invoke-virtual {p0, p1, v0, v4}, Ll/zkr0;->o(Ll/qer0;Ll/sgr0;I)I

    .line 674
    .line 675
    .line 676
    move-result v4

    .line 677
    iget v6, p0, Ll/zkr0;->S:I

    .line 678
    .line 679
    add-int/2addr v6, v4

    .line 680
    iput v6, p0, Ll/zkr0;->S:I

    .line 681
    .line 682
    iget v6, p0, Ll/zkr0;->T:I

    .line 683
    .line 684
    add-int/2addr v6, v4

    .line 685
    iput v6, p0, Ll/zkr0;->T:I

    .line 686
    .line 687
    iget v6, p0, Ll/zkr0;->U:I

    .line 688
    .line 689
    sub-int/2addr v6, v4

    .line 690
    iput v6, p0, Ll/zkr0;->U:I

    .line 691
    .line 692
    goto :goto_a

    .line 693
    :cond_18
    iget-object p1, p2, Ll/ykr0;->b:Ljava/lang/String;

    .line 694
    .line 695
    const-string p2, "A_VORBIS"

    .line 696
    .line 697
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 698
    .line 699
    .line 700
    move-result p1

    .line 701
    if-eqz p1, :cond_19

    .line 702
    .line 703
    iget-object p1, p0, Ll/zkr0;->h:Ll/bgw0;

    .line 704
    .line 705
    invoke-virtual {p1, v5}, Ll/bgw0;->k(I)V

    .line 706
    .line 707
    .line 708
    iget-object p1, p0, Ll/zkr0;->h:Ll/bgw0;

    .line 709
    .line 710
    invoke-static {v0, p1, v3}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 711
    .line 712
    .line 713
    iget p1, p0, Ll/zkr0;->T:I

    .line 714
    .line 715
    add-int/2addr p1, v3

    .line 716
    iput p1, p0, Ll/zkr0;->T:I

    .line 717
    .line 718
    :cond_19
    iget p1, p0, Ll/zkr0;->T:I

    .line 719
    .line 720
    invoke-virtual {p0}, Ll/zkr0;->u()V

    .line 721
    .line 722
    .line 723
    return p1
.end method

.method public final o(Ll/qer0;Ll/sgr0;I)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bgw0;->q()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    iget-object p0, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 14
    .line 15
    invoke-static {p2, p0, p1}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 16
    .line 17
    .line 18
    return p1

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    invoke-static {p2, p1, p3, p0}, Ll/fgr0;->a(Ll/sgr0;Ll/nyy0;IZ)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public final p(J)J
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    iget-wide v2, p0, Ll/zkr0;->r:J

    .line 2
    .line 3
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    cmp-long p0, v2, v0

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-wide/16 v4, 0x3e8

    .line 13
    .line 14
    sget-object v6, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 15
    .line 16
    move-wide v0, p1

    .line 17
    invoke-static/range {v0 .. v6}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 18
    .line 19
    .line 20
    move-result-wide p0

    .line 21
    return-wide p0

    .line 22
    :cond_0
    const-string p0, "Can\'t scale timecode prior to timecodeScale being set."

    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0
.end method

.method public final q(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "cueTimesUs",
            "cueClusterPositions"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zkr0;->C:Ll/z5w0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/zkr0;->D:Ll/z5w0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v0, "Element "

    .line 13
    .line 14
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, " must be in a Cues"

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    throw p0
.end method

.method public final r(I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNull;
        value = {
            "currentTrack"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zkr0;->u:Ll/ykr0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v0, "Element "

    .line 9
    .line 10
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string p1, " must be in a TrackEntry"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    throw p0
.end method

.method public final s(Ll/ykr0;JIII)V
    .locals 17
    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "#1.output"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v1, Ll/ykr0;->U:Ll/tgr0;

    .line 6
    .line 7
    const/4 v9, 0x1

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    move-object v3, v2

    .line 11
    iget-object v2, v1, Ll/ykr0;->Y:Ll/sgr0;

    .line 12
    .line 13
    iget-object v8, v1, Ll/ykr0;->j:Ll/ggr0;

    .line 14
    .line 15
    move/from16 v5, p4

    .line 16
    .line 17
    move/from16 v6, p5

    .line 18
    .line 19
    move/from16 v7, p6

    .line 20
    .line 21
    move-object v1, v3

    .line 22
    move-wide/from16 v3, p2

    .line 23
    .line 24
    invoke-virtual/range {v1 .. v8}, Ll/tgr0;->c(Ll/sgr0;JIIILl/ggr0;)V

    .line 25
    .line 26
    .line 27
    goto/16 :goto_6

    .line 28
    .line 29
    :cond_0
    iget-object v2, v1, Ll/ykr0;->b:Ljava/lang/String;

    .line 30
    .line 31
    const-string v3, "S_TEXT/UTF8"

    .line 32
    .line 33
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const/4 v4, 0x0

    .line 38
    const-string v5, "S_TEXT/WEBVTT"

    .line 39
    .line 40
    const-string v6, "S_TEXT/ASS"

    .line 41
    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    iget-object v2, v1, Ll/ykr0;->b:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_1

    .line 51
    .line 52
    iget-object v2, v1, Ll/ykr0;->b:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v5, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-eqz v2, :cond_3

    .line 59
    .line 60
    :cond_1
    iget v2, v0, Ll/zkr0;->K:I

    .line 61
    .line 62
    const-string v7, "MatroskaExtractor"

    .line 63
    .line 64
    if-le v2, v9, :cond_2

    .line 65
    .line 66
    const-string v2, "Skipping subtitle sample in laced block."

    .line 67
    .line 68
    invoke-static {v7, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    iget-wide v10, v0, Ll/zkr0;->I:J

    .line 73
    .line 74
    const-wide v12, -0x7fffffffffffffffL    # -4.9E-324

    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    cmp-long v2, v10, v12

    .line 80
    .line 81
    if-nez v2, :cond_4

    .line 82
    .line 83
    const-string v2, "Skipping subtitle sample with no duration."

    .line 84
    .line 85
    invoke-static {v7, v2}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_0
    move/from16 v2, p5

    .line 89
    .line 90
    goto/16 :goto_4

    .line 91
    .line 92
    :cond_4
    iget-object v2, v1, Ll/ykr0;->b:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v7, v0, Ll/zkr0;->k:Ll/bgw0;

    .line 95
    .line 96
    invoke-virtual {v7}, Ll/bgw0;->m()[B

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    .line 101
    .line 102
    .line 103
    move-result v8

    .line 104
    const v12, 0x2c0618eb

    .line 105
    .line 106
    .line 107
    if-eq v8, v12, :cond_6

    .line 108
    .line 109
    const v6, 0x3e4ca2d8

    .line 110
    .line 111
    .line 112
    const-wide/16 v12, 0x3e8

    .line 113
    .line 114
    if-eq v8, v6, :cond_5

    .line 115
    .line 116
    const v5, 0x54c61e47

    .line 117
    .line 118
    .line 119
    if-ne v8, v5, :cond_b

    .line 120
    .line 121
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    if-eqz v2, :cond_b

    .line 126
    .line 127
    const-string v2, "%02d:%02d:%02d,%03d"

    .line 128
    .line 129
    invoke-static {v10, v11, v2, v12, v13}, Ll/zkr0;->w(JLjava/lang/String;J)[B

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    const/16 v3, 0x13

    .line 134
    .line 135
    goto :goto_1

    .line 136
    :cond_5
    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-eqz v2, :cond_b

    .line 141
    .line 142
    const-string v2, "%02d:%02d:%02d.%03d"

    .line 143
    .line 144
    invoke-static {v10, v11, v2, v12, v13}, Ll/zkr0;->w(JLjava/lang/String;J)[B

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    const/16 v3, 0x19

    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_6
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v2

    .line 155
    if-eqz v2, :cond_b

    .line 156
    .line 157
    const-string v2, "%01d:%02d:%02d:%02d"

    .line 158
    .line 159
    const-wide/16 v5, 0x2710

    .line 160
    .line 161
    invoke-static {v10, v11, v2, v5, v6}, Ll/zkr0;->w(JLjava/lang/String;J)[B

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    const/16 v3, 0x15

    .line 166
    .line 167
    :goto_1
    array-length v5, v2

    .line 168
    invoke-static {v2, v4, v7, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 169
    .line 170
    .line 171
    iget-object v2, v0, Ll/zkr0;->k:Ll/bgw0;

    .line 172
    .line 173
    invoke-virtual {v2}, Ll/bgw0;->s()I

    .line 174
    .line 175
    .line 176
    move-result v2

    .line 177
    :goto_2
    iget-object v3, v0, Ll/zkr0;->k:Ll/bgw0;

    .line 178
    .line 179
    invoke-virtual {v3}, Ll/bgw0;->t()I

    .line 180
    .line 181
    .line 182
    move-result v3

    .line 183
    if-ge v2, v3, :cond_8

    .line 184
    .line 185
    iget-object v3, v0, Ll/zkr0;->k:Ll/bgw0;

    .line 186
    .line 187
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    aget-byte v3, v3, v2

    .line 192
    .line 193
    if-nez v3, :cond_7

    .line 194
    .line 195
    iget-object v3, v0, Ll/zkr0;->k:Ll/bgw0;

    .line 196
    .line 197
    invoke-virtual {v3, v2}, Ll/bgw0;->j(I)V

    .line 198
    .line 199
    .line 200
    goto :goto_3

    .line 201
    :cond_7
    add-int/lit8 v2, v2, 0x1

    .line 202
    .line 203
    goto :goto_2

    .line 204
    :cond_8
    :goto_3
    iget-object v2, v1, Ll/ykr0;->Y:Ll/sgr0;

    .line 205
    .line 206
    iget-object v3, v0, Ll/zkr0;->k:Ll/bgw0;

    .line 207
    .line 208
    invoke-virtual {v3}, Ll/bgw0;->t()I

    .line 209
    .line 210
    .line 211
    move-result v5

    .line 212
    invoke-static {v2, v3, v5}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 213
    .line 214
    .line 215
    iget-object v2, v0, Ll/zkr0;->k:Ll/bgw0;

    .line 216
    .line 217
    invoke-virtual {v2}, Ll/bgw0;->t()I

    .line 218
    .line 219
    .line 220
    move-result v2

    .line 221
    add-int v2, p5, v2

    .line 222
    .line 223
    :goto_4
    const/high16 v3, 0x10000000

    .line 224
    .line 225
    and-int v3, p4, v3

    .line 226
    .line 227
    if-eqz v3, :cond_a

    .line 228
    .line 229
    iget v3, v0, Ll/zkr0;->K:I

    .line 230
    .line 231
    iget-object v5, v0, Ll/zkr0;->n:Ll/bgw0;

    .line 232
    .line 233
    if-le v3, v9, :cond_9

    .line 234
    .line 235
    invoke-virtual {v5, v4}, Ll/bgw0;->h(I)V

    .line 236
    .line 237
    .line 238
    goto :goto_5

    .line 239
    :cond_9
    invoke-virtual {v5}, Ll/bgw0;->t()I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    iget-object v4, v1, Ll/ykr0;->Y:Ll/sgr0;

    .line 244
    .line 245
    iget-object v5, v0, Ll/zkr0;->n:Ll/bgw0;

    .line 246
    .line 247
    const/4 v6, 0x2

    .line 248
    invoke-interface {v4, v5, v3, v6}, Ll/sgr0;->a(Ll/bgw0;II)V

    .line 249
    .line 250
    .line 251
    add-int/2addr v2, v3

    .line 252
    :cond_a
    :goto_5
    move v14, v2

    .line 253
    iget-object v10, v1, Ll/ykr0;->Y:Ll/sgr0;

    .line 254
    .line 255
    iget-object v1, v1, Ll/ykr0;->j:Ll/ggr0;

    .line 256
    .line 257
    move-wide/from16 v11, p2

    .line 258
    .line 259
    move/from16 v13, p4

    .line 260
    .line 261
    move/from16 v15, p6

    .line 262
    .line 263
    move-object/from16 v16, v1

    .line 264
    .line 265
    invoke-interface/range {v10 .. v16}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 266
    .line 267
    .line 268
    :goto_6
    iput-boolean v9, v0, Ll/zkr0;->F:Z

    .line 269
    .line 270
    return-void

    .line 271
    :cond_b
    invoke-static {}, Ll/fig0;->a()V

    .line 272
    .line 273
    .line 274
    return-void
.end method

.method public final t(Ll/qer0;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bgw0;->t()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lt v0, p2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/bgw0;->r()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-ge v0, p2, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/bgw0;->r()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v1, v1

    .line 25
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {v0, v1}, Ll/bgw0;->e(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0}, Ll/bgw0;->t()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0}, Ll/bgw0;->t()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    sub-int v0, p2, v0

    .line 47
    .line 48
    check-cast p1, Ll/fer0;

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    invoke-virtual {p1, v1, v2, v0, v3}, Ll/fer0;->b([BIIZ)Z

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Ll/zkr0;->g:Ll/bgw0;

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Ll/bgw0;->j(I)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public final u()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/zkr0;->S:I

    .line 3
    .line 4
    iput v0, p0, Ll/zkr0;->T:I

    .line 5
    .line 6
    iput v0, p0, Ll/zkr0;->U:I

    .line 7
    .line 8
    iput-boolean v0, p0, Ll/zkr0;->V:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/zkr0;->W:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Ll/zkr0;->X:Z

    .line 13
    .line 14
    iput v0, p0, Ll/zkr0;->Y:I

    .line 15
    .line 16
    iput-byte v0, p0, Ll/zkr0;->Z:B

    .line 17
    .line 18
    iput-boolean v0, p0, Ll/zkr0;->a0:Z

    .line 19
    .line 20
    iget-object p0, p0, Ll/zkr0;->j:Ll/bgw0;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/bgw0;->h(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final v(Ll/qer0;[BI)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    array-length v0, p2

    .line 2
    add-int v1, v0, p3

    .line 3
    .line 4
    iget-object v2, p0, Ll/zkr0;->k:Ll/bgw0;

    .line 5
    .line 6
    invoke-virtual {v2}, Ll/bgw0;->r()I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    iget-object v3, p0, Ll/zkr0;->k:Ll/bgw0;

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    if-ge v2, v1, :cond_0

    .line 14
    .line 15
    add-int v2, v1, p3

    .line 16
    .line 17
    invoke-static {p2, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    array-length v2, p2

    .line 22
    invoke-virtual {v3, p2, v2}, Ll/bgw0;->i([BI)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-static {p2, v4, v2, v4, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 31
    .line 32
    .line 33
    :goto_0
    iget-object p2, p0, Ll/zkr0;->k:Ll/bgw0;

    .line 34
    .line 35
    invoke-virtual {p2}, Ll/bgw0;->m()[B

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    check-cast p1, Ll/fer0;

    .line 40
    .line 41
    invoke-virtual {p1, p2, v0, p3, v4}, Ll/fer0;->b([BIIZ)Z

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/zkr0;->k:Ll/bgw0;

    .line 45
    .line 46
    invoke-virtual {p1, v4}, Ll/bgw0;->k(I)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Ll/zkr0;->k:Ll/bgw0;

    .line 50
    .line 51
    invoke-virtual {p0, v1}, Ll/bgw0;->j(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
