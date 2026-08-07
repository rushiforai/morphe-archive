.class public final Ll/cnr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;
.implements Ll/bgr0;


# static fields
.field public static final A:Ll/ifr0;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# instance fields
.field public final a:Ll/vor0;

.field public final b:I

.field public final c:Ll/bgw0;

.field public final d:Ll/bgw0;

.field public final e:Ll/bgw0;

.field public final f:Ll/bgw0;

.field public final g:Ljava/util/ArrayDeque;

.field public final h:Ll/fnr0;

.field public final i:Ljava/util/List;

.field public j:I

.field public k:I

.field public l:J

.field public m:I

.field public n:Ll/bgw0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:Z

.field public t:Ll/ser0;

.field public u:[Ll/bnr0;

.field public v:[[J

.field public w:I

.field public x:J

.field public y:I

.field public z:Lcom/google/android/gms/internal/ads/zzahe;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Ll/anr0;->b:Ll/anr0;

    .line 2
    .line 3
    sput-object v0, Ll/cnr0;->A:Ll/ifr0;

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 83
    sget-object v0, Ll/vor0;->a:Ll/vor0;

    const/16 v1, 0x10

    invoke-direct {p0, v0, v1}, Ll/cnr0;-><init>(Ll/vor0;I)V

    return-void
.end method

.method public constructor <init>(Ll/vor0;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cnr0;->a:Ll/vor0;

    .line 5
    .line 6
    iput p2, p0, Ll/cnr0;->b:I

    .line 7
    .line 8
    const/4 p1, 0x4

    .line 9
    and-int/2addr p2, p1

    .line 10
    const/4 v0, 0x0

    .line 11
    if-eqz p2, :cond_0

    .line 12
    .line 13
    const/4 p2, 0x3

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move p2, v0

    .line 16
    :goto_0
    iput p2, p0, Ll/cnr0;->j:I

    .line 17
    .line 18
    new-instance p2, Ll/fnr0;

    .line 19
    .line 20
    invoke-direct {p2}, Ll/fnr0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Ll/cnr0;->h:Ll/fnr0;

    .line 24
    .line 25
    new-instance p2, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object p2, p0, Ll/cnr0;->i:Ljava/util/List;

    .line 31
    .line 32
    new-instance p2, Ll/bgw0;

    .line 33
    .line 34
    const/16 v1, 0x10

    .line 35
    .line 36
    invoke-direct {p2, v1}, Ll/bgw0;-><init>(I)V

    .line 37
    .line 38
    .line 39
    iput-object p2, p0, Ll/cnr0;->f:Ll/bgw0;

    .line 40
    .line 41
    new-instance p2, Ljava/util/ArrayDeque;

    .line 42
    .line 43
    invoke-direct {p2}, Ljava/util/ArrayDeque;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p2, p0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 47
    .line 48
    new-instance p2, Ll/bgw0;

    .line 49
    .line 50
    sget-object v1, Ll/w3x0;->a:[B

    .line 51
    .line 52
    invoke-direct {p2, v1}, Ll/bgw0;-><init>([B)V

    .line 53
    .line 54
    .line 55
    iput-object p2, p0, Ll/cnr0;->c:Ll/bgw0;

    .line 56
    .line 57
    new-instance p2, Ll/bgw0;

    .line 58
    .line 59
    invoke-direct {p2, p1}, Ll/bgw0;-><init>(I)V

    .line 60
    .line 61
    .line 62
    iput-object p2, p0, Ll/cnr0;->d:Ll/bgw0;

    .line 63
    .line 64
    new-instance p1, Ll/bgw0;

    .line 65
    .line 66
    invoke-direct {p1}, Ll/bgw0;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object p1, p0, Ll/cnr0;->e:Ll/bgw0;

    .line 70
    .line 71
    const/4 p1, -0x1

    .line 72
    iput p1, p0, Ll/cnr0;->o:I

    .line 73
    .line 74
    sget-object p1, Ll/ser0;->v0:Ll/ser0;

    .line 75
    .line 76
    iput-object p1, p0, Ll/cnr0;->t:Ll/ser0;

    .line 77
    .line 78
    new-array p1, v0, [Ll/bnr0;

    .line 79
    .line 80
    iput-object p1, p0, Ll/cnr0;->u:[Ll/bnr0;

    .line 81
    .line 82
    return-void
.end method

.method public static g(I)I
    .locals 1

    .line 1
    const v0, 0x68656963

    .line 2
    .line 3
    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const v0, 0x71742020

    .line 7
    .line 8
    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    const/4 p0, 0x2

    .line 16
    return p0
.end method

.method public static h(Ll/knr0;J)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/knr0;->a(J)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/knr0;->b(J)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    return v0
.end method

.method public static i(Ll/knr0;JJ)J
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/cnr0;->h(Ll/knr0;J)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, -0x1

    .line 6
    if-ne p1, p2, :cond_0

    .line 7
    .line 8
    return-wide p3

    .line 9
    :cond_0
    iget-object p0, p0, Ll/knr0;->c:[J

    .line 10
    .line 11
    aget-wide p1, p0, p1

    .line 12
    .line 13
    invoke-static {p1, p2, p3, p4}, Ljava/lang/Math;->min(JJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide p0

    .line 17
    return-wide p0
.end method


# virtual methods
.method public final a(J)Ll/zfr0;
    .locals 12

    .line 1
    iget-object v0, p0, Ll/cnr0;->u:[Ll/bnr0;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    if-nez v1, :cond_0

    .line 5
    .line 6
    new-instance p0, Ll/zfr0;

    .line 7
    .line 8
    sget-object p1, Ll/cgr0;->c:Ll/cgr0;

    .line 9
    .line 10
    invoke-direct {p0, p1, p1}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget v1, p0, Ll/cnr0;->w:I

    .line 15
    .line 16
    const/4 v2, -0x1

    .line 17
    const-wide/16 v3, -0x1

    .line 18
    .line 19
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    if-eq v1, v2, :cond_3

    .line 25
    .line 26
    aget-object v0, v0, v1

    .line 27
    .line 28
    iget-object v0, v0, Ll/bnr0;->b:Ll/knr0;

    .line 29
    .line 30
    invoke-static {v0, p1, p2}, Ll/cnr0;->h(Ll/knr0;J)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-ne v1, v2, :cond_1

    .line 35
    .line 36
    new-instance p0, Ll/zfr0;

    .line 37
    .line 38
    sget-object p1, Ll/cgr0;->c:Ll/cgr0;

    .line 39
    .line 40
    invoke-direct {p0, p1, p1}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 41
    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_1
    iget-object v7, v0, Ll/knr0;->f:[J

    .line 45
    .line 46
    aget-wide v8, v7, v1

    .line 47
    .line 48
    iget-object v7, v0, Ll/knr0;->c:[J

    .line 49
    .line 50
    aget-wide v10, v7, v1

    .line 51
    .line 52
    cmp-long v7, v8, p1

    .line 53
    .line 54
    if-gez v7, :cond_2

    .line 55
    .line 56
    iget v7, v0, Ll/knr0;->b:I

    .line 57
    .line 58
    add-int/2addr v7, v2

    .line 59
    if-ge v1, v7, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0, p1, p2}, Ll/knr0;->b(J)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eq p1, v2, :cond_2

    .line 66
    .line 67
    if-eq p1, v1, :cond_2

    .line 68
    .line 69
    iget-object p2, v0, Ll/knr0;->f:[J

    .line 70
    .line 71
    aget-wide v1, p2, p1

    .line 72
    .line 73
    iget-object p2, v0, Ll/knr0;->c:[J

    .line 74
    .line 75
    aget-wide v3, p2, p1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_2
    move-wide v1, v5

    .line 79
    :goto_0
    move-wide p1, v8

    .line 80
    goto :goto_1

    .line 81
    :cond_3
    const-wide v10, 0x7fffffffffffffffL

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    move-wide v1, v5

    .line 87
    :goto_1
    const/4 v0, 0x0

    .line 88
    :goto_2
    iget-object v7, p0, Ll/cnr0;->u:[Ll/bnr0;

    .line 89
    .line 90
    array-length v8, v7

    .line 91
    if-ge v0, v8, :cond_6

    .line 92
    .line 93
    iget v8, p0, Ll/cnr0;->w:I

    .line 94
    .line 95
    if-eq v0, v8, :cond_5

    .line 96
    .line 97
    aget-object v7, v7, v0

    .line 98
    .line 99
    iget-object v7, v7, Ll/bnr0;->b:Ll/knr0;

    .line 100
    .line 101
    invoke-static {v7, p1, p2, v10, v11}, Ll/cnr0;->i(Ll/knr0;JJ)J

    .line 102
    .line 103
    .line 104
    move-result-wide v8

    .line 105
    cmp-long v10, v1, v5

    .line 106
    .line 107
    if-eqz v10, :cond_4

    .line 108
    .line 109
    invoke-static {v7, v1, v2, v3, v4}, Ll/cnr0;->i(Ll/knr0;JJ)J

    .line 110
    .line 111
    .line 112
    move-result-wide v3

    .line 113
    :cond_4
    move-wide v10, v8

    .line 114
    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_6
    new-instance p0, Ll/cgr0;

    .line 118
    .line 119
    invoke-direct {p0, p1, p2, v10, v11}, Ll/cgr0;-><init>(JJ)V

    .line 120
    .line 121
    .line 122
    cmp-long p1, v1, v5

    .line 123
    .line 124
    if-nez p1, :cond_7

    .line 125
    .line 126
    new-instance p1, Ll/zfr0;

    .line 127
    .line 128
    invoke-direct {p1, p0, p0}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 129
    .line 130
    .line 131
    return-object p1

    .line 132
    :cond_7
    new-instance p1, Ll/cgr0;

    .line 133
    .line 134
    invoke-direct {p1, v1, v2, v3, v4}, Ll/cgr0;-><init>(JJ)V

    .line 135
    .line 136
    .line 137
    new-instance p2, Ll/zfr0;

    .line 138
    .line 139
    invoke-direct {p2, p0, p1}, Ll/zfr0;-><init>(Ll/cgr0;Ll/cgr0;)V

    .line 140
    .line 141
    .line 142
    return-object p2
.end method

.method public final c(JJ)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Ll/cnr0;->m:I

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    iput v1, p0, Ll/cnr0;->o:I

    .line 11
    .line 12
    iput v0, p0, Ll/cnr0;->p:I

    .line 13
    .line 14
    iput v0, p0, Ll/cnr0;->q:I

    .line 15
    .line 16
    iput v0, p0, Ll/cnr0;->r:I

    .line 17
    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    cmp-long p1, p1, v2

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    iget p1, p0, Ll/cnr0;->j:I

    .line 25
    .line 26
    const/4 p2, 0x3

    .line 27
    if-eq p1, p2, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/cnr0;->j()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p1, p0, Ll/cnr0;->h:Ll/fnr0;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/fnr0;->b()V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/cnr0;->i:Ljava/util/List;

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_1
    iget-object p0, p0, Ll/cnr0;->u:[Ll/bnr0;

    .line 45
    .line 46
    array-length p1, p0

    .line 47
    :goto_0
    if-ge v0, p1, :cond_4

    .line 48
    .line 49
    aget-object p2, p0, v0

    .line 50
    .line 51
    iget-object v2, p2, Ll/bnr0;->b:Ll/knr0;

    .line 52
    .line 53
    invoke-virtual {v2, p3, p4}, Ll/knr0;->a(J)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    if-ne v3, v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {v2, p3, p4}, Ll/knr0;->b(J)I

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    :cond_2
    iput v3, p2, Ll/bnr0;->e:I

    .line 64
    .line 65
    iget-object p2, p2, Ll/bnr0;->d:Ll/tgr0;

    .line 66
    .line 67
    if-eqz p2, :cond_3

    .line 68
    .line 69
    invoke-virtual {p2}, Ll/tgr0;->b()V

    .line 70
    .line 71
    .line 72
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_4
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
    iget p0, p0, Ll/cnr0;->b:I

    .line 2
    .line 3
    and-int/lit8 p0, p0, 0x2

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p1, p0}, Ll/gnr0;->b(Ll/qer0;Z)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public final e(Ll/ser0;)V
    .locals 2

    .line 1
    iget v0, p0, Ll/cnr0;->b:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x10

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/cnr0;->a:Ll/vor0;

    .line 8
    .line 9
    new-instance v1, Ll/yor0;

    .line 10
    .line 11
    invoke-direct {v1, p1, v0}, Ll/yor0;-><init>(Ll/ser0;Ll/vor0;)V

    .line 12
    .line 13
    .line 14
    move-object p1, v1

    .line 15
    :cond_0
    iput-object p1, p0, Ll/cnr0;->t:Ll/ser0;

    .line 16
    .line 17
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 35
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    :cond_0
    :goto_0
    iget v3, v0, Ll/cnr0;->j:I

    .line 8
    .line 9
    const v4, 0x66747970

    .line 10
    .line 11
    .line 12
    const/4 v6, 0x4

    .line 13
    const-wide/16 v7, 0x0

    .line 14
    .line 15
    const/4 v9, 0x2

    .line 16
    const/4 v10, -0x1

    .line 17
    const/16 v11, 0x8

    .line 18
    .line 19
    const/4 v12, 0x1

    .line 20
    if-eqz v3, :cond_24

    .line 21
    .line 22
    if-eq v3, v12, :cond_1b

    .line 23
    .line 24
    if-eq v3, v9, :cond_2

    .line 25
    .line 26
    iget-object v3, v0, Ll/cnr0;->h:Ll/fnr0;

    .line 27
    .line 28
    iget-object v4, v0, Ll/cnr0;->i:Ljava/util/List;

    .line 29
    .line 30
    invoke-virtual {v3, v1, v2, v4}, Ll/fnr0;->a(Ll/qer0;Ll/yfr0;Ljava/util/List;)I

    .line 31
    .line 32
    .line 33
    iget-wide v1, v2, Ll/yfr0;->a:J

    .line 34
    .line 35
    cmp-long v1, v1, v7

    .line 36
    .line 37
    if-nez v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/cnr0;->j()V

    .line 40
    .line 41
    .line 42
    :cond_1
    return v12

    .line 43
    :cond_2
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 44
    .line 45
    .line 46
    move-result-wide v3

    .line 47
    iget v11, v0, Ll/cnr0;->o:I

    .line 48
    .line 49
    if-ne v11, v10, :cond_c

    .line 50
    .line 51
    const-wide v16, 0x7fffffffffffffffL

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    move/from16 v25, v10

    .line 57
    .line 58
    move/from16 v26, v25

    .line 59
    .line 60
    move/from16 v20, v12

    .line 61
    .line 62
    move/from16 v27, v20

    .line 63
    .line 64
    move-wide/from16 v18, v16

    .line 65
    .line 66
    move-wide/from16 v21, v18

    .line 67
    .line 68
    move-wide/from16 v23, v21

    .line 69
    .line 70
    const/4 v11, 0x0

    .line 71
    const-wide/32 v28, 0x40000

    .line 72
    .line 73
    .line 74
    :goto_1
    iget-object v14, v0, Ll/cnr0;->u:[Ll/bnr0;

    .line 75
    .line 76
    array-length v15, v14

    .line 77
    if-ge v11, v15, :cond_a

    .line 78
    .line 79
    aget-object v14, v14, v11

    .line 80
    .line 81
    iget v15, v14, Ll/bnr0;->e:I

    .line 82
    .line 83
    iget-object v14, v14, Ll/bnr0;->b:Ll/knr0;

    .line 84
    .line 85
    move-wide/from16 v30, v7

    .line 86
    .line 87
    iget v7, v14, Ll/knr0;->b:I

    .line 88
    .line 89
    if-ne v15, v7, :cond_3

    .line 90
    .line 91
    goto :goto_5

    .line 92
    :cond_3
    iget-object v7, v14, Ll/knr0;->c:[J

    .line 93
    .line 94
    aget-wide v32, v7, v15

    .line 95
    .line 96
    iget-object v7, v0, Ll/cnr0;->v:[[J

    .line 97
    .line 98
    sget v8, Ll/mpw0;->a:I

    .line 99
    .line 100
    aget-object v7, v7, v11

    .line 101
    .line 102
    aget-wide v14, v7, v15

    .line 103
    .line 104
    sub-long v32, v32, v3

    .line 105
    .line 106
    cmp-long v7, v32, v30

    .line 107
    .line 108
    if-ltz v7, :cond_4

    .line 109
    .line 110
    cmp-long v7, v32, v28

    .line 111
    .line 112
    if-ltz v7, :cond_5

    .line 113
    .line 114
    :cond_4
    move v7, v12

    .line 115
    goto :goto_2

    .line 116
    :cond_5
    const/4 v7, 0x0

    .line 117
    :goto_2
    if-nez v7, :cond_6

    .line 118
    .line 119
    if-nez v27, :cond_7

    .line 120
    .line 121
    const/4 v8, 0x0

    .line 122
    goto :goto_3

    .line 123
    :cond_6
    move/from16 v8, v27

    .line 124
    .line 125
    :goto_3
    if-ne v7, v8, :cond_8

    .line 126
    .line 127
    cmp-long v27, v32, v23

    .line 128
    .line 129
    if-gez v27, :cond_8

    .line 130
    .line 131
    :cond_7
    move/from16 v27, v7

    .line 132
    .line 133
    move/from16 v26, v11

    .line 134
    .line 135
    move-wide/from16 v21, v14

    .line 136
    .line 137
    move-wide/from16 v23, v32

    .line 138
    .line 139
    goto :goto_4

    .line 140
    :cond_8
    move/from16 v27, v8

    .line 141
    .line 142
    :goto_4
    cmp-long v8, v14, v18

    .line 143
    .line 144
    if-gez v8, :cond_9

    .line 145
    .line 146
    move/from16 v20, v7

    .line 147
    .line 148
    move/from16 v25, v11

    .line 149
    .line 150
    move-wide/from16 v18, v14

    .line 151
    .line 152
    :cond_9
    :goto_5
    add-int/lit8 v11, v11, 0x1

    .line 153
    .line 154
    move-wide/from16 v7, v30

    .line 155
    .line 156
    goto :goto_1

    .line 157
    :cond_a
    move-wide/from16 v30, v7

    .line 158
    .line 159
    cmp-long v7, v18, v16

    .line 160
    .line 161
    if-eqz v7, :cond_b

    .line 162
    .line 163
    if-eqz v20, :cond_b

    .line 164
    .line 165
    const-wide/32 v7, 0xa00000

    .line 166
    .line 167
    .line 168
    add-long v18, v18, v7

    .line 169
    .line 170
    cmp-long v7, v21, v18

    .line 171
    .line 172
    if-ltz v7, :cond_b

    .line 173
    .line 174
    move/from16 v11, v25

    .line 175
    .line 176
    goto :goto_6

    .line 177
    :cond_b
    move/from16 v11, v26

    .line 178
    .line 179
    :goto_6
    iput v11, v0, Ll/cnr0;->o:I

    .line 180
    .line 181
    if-ne v11, v10, :cond_d

    .line 182
    .line 183
    return v10

    .line 184
    :cond_c
    move-wide/from16 v30, v7

    .line 185
    .line 186
    const-wide/32 v28, 0x40000

    .line 187
    .line 188
    .line 189
    :cond_d
    iget-object v7, v0, Ll/cnr0;->u:[Ll/bnr0;

    .line 190
    .line 191
    aget-object v7, v7, v11

    .line 192
    .line 193
    iget-object v14, v7, Ll/bnr0;->c:Ll/sgr0;

    .line 194
    .line 195
    iget v8, v7, Ll/bnr0;->e:I

    .line 196
    .line 197
    iget-object v11, v7, Ll/bnr0;->b:Ll/knr0;

    .line 198
    .line 199
    iget-object v15, v11, Ll/knr0;->c:[J

    .line 200
    .line 201
    move/from16 v16, v9

    .line 202
    .line 203
    aget-wide v9, v15, v8

    .line 204
    .line 205
    iget-object v11, v11, Ll/knr0;->d:[I

    .line 206
    .line 207
    aget v11, v11, v8

    .line 208
    .line 209
    iget-object v15, v7, Ll/bnr0;->d:Ll/tgr0;

    .line 210
    .line 211
    sub-long v3, v9, v3

    .line 212
    .line 213
    iget v5, v0, Ll/cnr0;->p:I

    .line 214
    .line 215
    move-object/from16 v17, v14

    .line 216
    .line 217
    const/16 v24, 0x0

    .line 218
    .line 219
    int-to-long v13, v5

    .line 220
    add-long/2addr v3, v13

    .line 221
    cmp-long v5, v3, v30

    .line 222
    .line 223
    if-ltz v5, :cond_1a

    .line 224
    .line 225
    cmp-long v5, v3, v28

    .line 226
    .line 227
    if-ltz v5, :cond_e

    .line 228
    .line 229
    goto/16 :goto_b

    .line 230
    .line 231
    :cond_e
    iget-object v2, v7, Ll/bnr0;->a:Ll/hnr0;

    .line 232
    .line 233
    iget v2, v2, Ll/hnr0;->g:I

    .line 234
    .line 235
    if-ne v2, v12, :cond_f

    .line 236
    .line 237
    const-wide/16 v9, 0x8

    .line 238
    .line 239
    add-long/2addr v3, v9

    .line 240
    add-int/lit8 v11, v11, -0x8

    .line 241
    .line 242
    :cond_f
    long-to-int v2, v3

    .line 243
    invoke-interface {v1, v2}, Ll/qer0;->d(I)V

    .line 244
    .line 245
    .line 246
    iget-object v2, v7, Ll/bnr0;->a:Ll/hnr0;

    .line 247
    .line 248
    iget v3, v2, Ll/hnr0;->j:I

    .line 249
    .line 250
    if-eqz v3, :cond_14

    .line 251
    .line 252
    iget-object v2, v0, Ll/cnr0;->d:Ll/bgw0;

    .line 253
    .line 254
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    aput-byte v24, v2, v24

    .line 259
    .line 260
    aput-byte v24, v2, v12

    .line 261
    .line 262
    aput-byte v24, v2, v16

    .line 263
    .line 264
    rsub-int/lit8 v4, v3, 0x4

    .line 265
    .line 266
    :goto_7
    iget v5, v0, Ll/cnr0;->q:I

    .line 267
    .line 268
    if-ge v5, v11, :cond_12

    .line 269
    .line 270
    iget v5, v0, Ll/cnr0;->r:I

    .line 271
    .line 272
    if-nez v5, :cond_11

    .line 273
    .line 274
    invoke-interface {v1, v2, v4, v3}, Ll/qer0;->h([BII)V

    .line 275
    .line 276
    .line 277
    iget v5, v0, Ll/cnr0;->p:I

    .line 278
    .line 279
    add-int/2addr v5, v3

    .line 280
    iput v5, v0, Ll/cnr0;->p:I

    .line 281
    .line 282
    iget-object v5, v0, Ll/cnr0;->d:Ll/bgw0;

    .line 283
    .line 284
    move/from16 v9, v24

    .line 285
    .line 286
    invoke-virtual {v5, v9}, Ll/bgw0;->k(I)V

    .line 287
    .line 288
    .line 289
    iget-object v5, v0, Ll/cnr0;->d:Ll/bgw0;

    .line 290
    .line 291
    invoke-virtual {v5}, Ll/bgw0;->v()I

    .line 292
    .line 293
    .line 294
    move-result v5

    .line 295
    if-ltz v5, :cond_10

    .line 296
    .line 297
    iput v5, v0, Ll/cnr0;->r:I

    .line 298
    .line 299
    iget-object v5, v0, Ll/cnr0;->c:Ll/bgw0;

    .line 300
    .line 301
    invoke-virtual {v5, v9}, Ll/bgw0;->k(I)V

    .line 302
    .line 303
    .line 304
    iget-object v5, v0, Ll/cnr0;->c:Ll/bgw0;

    .line 305
    .line 306
    move-object/from16 v14, v17

    .line 307
    .line 308
    invoke-interface {v14, v5, v6}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 309
    .line 310
    .line 311
    iget v5, v0, Ll/cnr0;->q:I

    .line 312
    .line 313
    add-int/2addr v5, v6

    .line 314
    iput v5, v0, Ll/cnr0;->q:I

    .line 315
    .line 316
    add-int/2addr v11, v4

    .line 317
    move/from16 v24, v9

    .line 318
    .line 319
    goto :goto_7

    .line 320
    :cond_10
    const-string v0, "Invalid NAL length"

    .line 321
    .line 322
    const/4 v1, 0x0

    .line 323
    invoke-static {v0, v1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    throw v0

    .line 328
    :cond_11
    move-object/from16 v14, v17

    .line 329
    .line 330
    move/from16 v9, v24

    .line 331
    .line 332
    invoke-interface {v14, v1, v5, v9}, Ll/sgr0;->e(Ll/nyy0;IZ)I

    .line 333
    .line 334
    .line 335
    move-result v5

    .line 336
    iget v9, v0, Ll/cnr0;->p:I

    .line 337
    .line 338
    add-int/2addr v9, v5

    .line 339
    iput v9, v0, Ll/cnr0;->p:I

    .line 340
    .line 341
    iget v9, v0, Ll/cnr0;->q:I

    .line 342
    .line 343
    add-int/2addr v9, v5

    .line 344
    iput v9, v0, Ll/cnr0;->q:I

    .line 345
    .line 346
    iget v9, v0, Ll/cnr0;->r:I

    .line 347
    .line 348
    sub-int/2addr v9, v5

    .line 349
    iput v9, v0, Ll/cnr0;->r:I

    .line 350
    .line 351
    const/16 v24, 0x0

    .line 352
    .line 353
    goto :goto_7

    .line 354
    :cond_12
    move-object/from16 v14, v17

    .line 355
    .line 356
    :cond_13
    move/from16 v18, v11

    .line 357
    .line 358
    goto :goto_9

    .line 359
    :cond_14
    move-object/from16 v14, v17

    .line 360
    .line 361
    iget-object v2, v2, Ll/hnr0;->f:Ll/sqr0;

    .line 362
    .line 363
    const-string v3, "audio/ac4"

    .line 364
    .line 365
    iget-object v2, v2, Ll/sqr0;->l:Ljava/lang/String;

    .line 366
    .line 367
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    move-result v2

    .line 371
    if-eqz v2, :cond_16

    .line 372
    .line 373
    iget v2, v0, Ll/cnr0;->q:I

    .line 374
    .line 375
    if-nez v2, :cond_15

    .line 376
    .line 377
    iget-object v2, v0, Ll/cnr0;->e:Ll/bgw0;

    .line 378
    .line 379
    invoke-static {v11, v2}, Ll/idr0;->b(ILl/bgw0;)V

    .line 380
    .line 381
    .line 382
    iget-object v2, v0, Ll/cnr0;->e:Ll/bgw0;

    .line 383
    .line 384
    const/4 v3, 0x7

    .line 385
    invoke-interface {v14, v2, v3}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 386
    .line 387
    .line 388
    iget v2, v0, Ll/cnr0;->q:I

    .line 389
    .line 390
    add-int/2addr v2, v3

    .line 391
    iput v2, v0, Ll/cnr0;->q:I

    .line 392
    .line 393
    :cond_15
    add-int/lit8 v11, v11, 0x7

    .line 394
    .line 395
    goto :goto_8

    .line 396
    :cond_16
    if-eqz v15, :cond_17

    .line 397
    .line 398
    invoke-virtual {v15, v1}, Ll/tgr0;->d(Ll/qer0;)V

    .line 399
    .line 400
    .line 401
    :cond_17
    :goto_8
    iget v2, v0, Ll/cnr0;->q:I

    .line 402
    .line 403
    if-ge v2, v11, :cond_13

    .line 404
    .line 405
    sub-int v2, v11, v2

    .line 406
    .line 407
    const/4 v9, 0x0

    .line 408
    invoke-interface {v14, v1, v2, v9}, Ll/sgr0;->e(Ll/nyy0;IZ)I

    .line 409
    .line 410
    .line 411
    move-result v2

    .line 412
    iget v3, v0, Ll/cnr0;->p:I

    .line 413
    .line 414
    add-int/2addr v3, v2

    .line 415
    iput v3, v0, Ll/cnr0;->p:I

    .line 416
    .line 417
    iget v3, v0, Ll/cnr0;->q:I

    .line 418
    .line 419
    add-int/2addr v3, v2

    .line 420
    iput v3, v0, Ll/cnr0;->q:I

    .line 421
    .line 422
    iget v3, v0, Ll/cnr0;->r:I

    .line 423
    .line 424
    sub-int/2addr v3, v2

    .line 425
    iput v3, v0, Ll/cnr0;->r:I

    .line 426
    .line 427
    goto :goto_8

    .line 428
    :goto_9
    iget-object v1, v7, Ll/bnr0;->b:Ll/knr0;

    .line 429
    .line 430
    iget-object v2, v1, Ll/knr0;->f:[J

    .line 431
    .line 432
    aget-wide v16, v2, v8

    .line 433
    .line 434
    iget-object v1, v1, Ll/knr0;->g:[I

    .line 435
    .line 436
    aget v1, v1, v8

    .line 437
    .line 438
    if-eqz v15, :cond_18

    .line 439
    .line 440
    const/16 v20, 0x0

    .line 441
    .line 442
    const/16 v21, 0x0

    .line 443
    .line 444
    move-object/from16 v19, v15

    .line 445
    .line 446
    move-object v15, v14

    .line 447
    move-object/from16 v14, v19

    .line 448
    .line 449
    move/from16 v19, v18

    .line 450
    .line 451
    move/from16 v18, v1

    .line 452
    .line 453
    invoke-virtual/range {v14 .. v21}, Ll/tgr0;->c(Ll/sgr0;JIIILl/ggr0;)V

    .line 454
    .line 455
    .line 456
    move-object v1, v14

    .line 457
    move-object v14, v15

    .line 458
    add-int/2addr v8, v12

    .line 459
    iget-object v2, v7, Ll/bnr0;->b:Ll/knr0;

    .line 460
    .line 461
    iget v2, v2, Ll/knr0;->b:I

    .line 462
    .line 463
    if-ne v8, v2, :cond_19

    .line 464
    .line 465
    const/4 v2, 0x0

    .line 466
    invoke-virtual {v1, v14, v2}, Ll/tgr0;->a(Ll/sgr0;Ll/ggr0;)V

    .line 467
    .line 468
    .line 469
    goto :goto_a

    .line 470
    :cond_18
    move-wide/from16 v15, v16

    .line 471
    .line 472
    move/from16 v17, v1

    .line 473
    .line 474
    const/16 v19, 0x0

    .line 475
    .line 476
    const/16 v20, 0x0

    .line 477
    .line 478
    invoke-interface/range {v14 .. v20}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 479
    .line 480
    .line 481
    :cond_19
    :goto_a
    iget v1, v7, Ll/bnr0;->e:I

    .line 482
    .line 483
    add-int/2addr v1, v12

    .line 484
    iput v1, v7, Ll/bnr0;->e:I

    .line 485
    .line 486
    const/4 v1, -0x1

    .line 487
    iput v1, v0, Ll/cnr0;->o:I

    .line 488
    .line 489
    const/4 v9, 0x0

    .line 490
    iput v9, v0, Ll/cnr0;->p:I

    .line 491
    .line 492
    iput v9, v0, Ll/cnr0;->q:I

    .line 493
    .line 494
    iput v9, v0, Ll/cnr0;->r:I

    .line 495
    .line 496
    return v9

    .line 497
    :cond_1a
    :goto_b
    iput-wide v9, v2, Ll/yfr0;->a:J

    .line 498
    .line 499
    return v12

    .line 500
    :cond_1b
    move/from16 v16, v9

    .line 501
    .line 502
    const-wide/32 v28, 0x40000

    .line 503
    .line 504
    .line 505
    iget-wide v7, v0, Ll/cnr0;->l:J

    .line 506
    .line 507
    iget v3, v0, Ll/cnr0;->m:I

    .line 508
    .line 509
    int-to-long v9, v3

    .line 510
    sub-long/2addr v7, v9

    .line 511
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 512
    .line 513
    .line 514
    move-result-wide v9

    .line 515
    add-long/2addr v9, v7

    .line 516
    iget-object v3, v0, Ll/cnr0;->n:Ll/bgw0;

    .line 517
    .line 518
    if-eqz v3, :cond_21

    .line 519
    .line 520
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 521
    .line 522
    .line 523
    move-result-object v5

    .line 524
    iget v13, v0, Ll/cnr0;->m:I

    .line 525
    .line 526
    long-to-int v7, v7

    .line 527
    invoke-interface {v1, v5, v13, v7}, Ll/qer0;->h([BII)V

    .line 528
    .line 529
    .line 530
    iget v5, v0, Ll/cnr0;->k:I

    .line 531
    .line 532
    if-ne v5, v4, :cond_20

    .line 533
    .line 534
    iput-boolean v12, v0, Ll/cnr0;->s:Z

    .line 535
    .line 536
    invoke-virtual {v3, v11}, Ll/bgw0;->k(I)V

    .line 537
    .line 538
    .line 539
    invoke-virtual {v3}, Ll/bgw0;->v()I

    .line 540
    .line 541
    .line 542
    move-result v4

    .line 543
    invoke-static {v4}, Ll/cnr0;->g(I)I

    .line 544
    .line 545
    .line 546
    move-result v4

    .line 547
    if-eqz v4, :cond_1c

    .line 548
    .line 549
    goto :goto_c

    .line 550
    :cond_1c
    invoke-virtual {v3, v6}, Ll/bgw0;->l(I)V

    .line 551
    .line 552
    .line 553
    :cond_1d
    invoke-virtual {v3}, Ll/bgw0;->q()I

    .line 554
    .line 555
    .line 556
    move-result v4

    .line 557
    if-lez v4, :cond_1e

    .line 558
    .line 559
    invoke-virtual {v3}, Ll/bgw0;->v()I

    .line 560
    .line 561
    .line 562
    move-result v4

    .line 563
    invoke-static {v4}, Ll/cnr0;->g(I)I

    .line 564
    .line 565
    .line 566
    move-result v4

    .line 567
    if-eqz v4, :cond_1d

    .line 568
    .line 569
    goto :goto_c

    .line 570
    :cond_1e
    const/4 v4, 0x0

    .line 571
    :goto_c
    iput v4, v0, Ll/cnr0;->y:I

    .line 572
    .line 573
    :cond_1f
    :goto_d
    const/4 v13, 0x0

    .line 574
    goto :goto_e

    .line 575
    :cond_20
    iget-object v4, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 576
    .line 577
    invoke-virtual {v4}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 578
    .line 579
    .line 580
    move-result v4

    .line 581
    if-nez v4, :cond_1f

    .line 582
    .line 583
    iget-object v4, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 584
    .line 585
    invoke-virtual {v4}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 586
    .line 587
    .line 588
    move-result-object v4

    .line 589
    check-cast v4, Ll/xlr0;

    .line 590
    .line 591
    new-instance v5, Ll/ylr0;

    .line 592
    .line 593
    iget v6, v0, Ll/cnr0;->k:I

    .line 594
    .line 595
    invoke-direct {v5, v6, v3}, Ll/ylr0;-><init>(ILl/bgw0;)V

    .line 596
    .line 597
    .line 598
    invoke-virtual {v4, v5}, Ll/xlr0;->f(Ll/ylr0;)V

    .line 599
    .line 600
    .line 601
    goto :goto_d

    .line 602
    :cond_21
    iget-boolean v3, v0, Ll/cnr0;->s:Z

    .line 603
    .line 604
    if-nez v3, :cond_22

    .line 605
    .line 606
    iget v3, v0, Ll/cnr0;->k:I

    .line 607
    .line 608
    const v4, 0x6d646174

    .line 609
    .line 610
    .line 611
    if-ne v3, v4, :cond_22

    .line 612
    .line 613
    iput v12, v0, Ll/cnr0;->y:I

    .line 614
    .line 615
    :cond_22
    cmp-long v3, v7, v28

    .line 616
    .line 617
    if-gez v3, :cond_23

    .line 618
    .line 619
    long-to-int v3, v7

    .line 620
    invoke-interface {v1, v3}, Ll/qer0;->d(I)V

    .line 621
    .line 622
    .line 623
    goto :goto_d

    .line 624
    :cond_23
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 625
    .line 626
    .line 627
    move-result-wide v3

    .line 628
    add-long/2addr v3, v7

    .line 629
    iput-wide v3, v2, Ll/yfr0;->a:J

    .line 630
    .line 631
    move v13, v12

    .line 632
    :goto_e
    invoke-virtual {v0, v9, v10}, Ll/cnr0;->k(J)V

    .line 633
    .line 634
    .line 635
    if-eqz v13, :cond_0

    .line 636
    .line 637
    iget v3, v0, Ll/cnr0;->j:I

    .line 638
    .line 639
    move/from16 v5, v16

    .line 640
    .line 641
    if-eq v3, v5, :cond_0

    .line 642
    .line 643
    return v12

    .line 644
    :cond_24
    move-wide/from16 v30, v7

    .line 645
    .line 646
    move v5, v9

    .line 647
    iget v3, v0, Ll/cnr0;->m:I

    .line 648
    .line 649
    if-nez v3, :cond_28

    .line 650
    .line 651
    iget-object v3, v0, Ll/cnr0;->f:Ll/bgw0;

    .line 652
    .line 653
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 654
    .line 655
    .line 656
    move-result-object v3

    .line 657
    const/4 v9, 0x0

    .line 658
    invoke-interface {v1, v3, v9, v11, v12}, Ll/qer0;->b([BIIZ)Z

    .line 659
    .line 660
    .line 661
    move-result v3

    .line 662
    if-nez v3, :cond_27

    .line 663
    .line 664
    iget v1, v0, Ll/cnr0;->y:I

    .line 665
    .line 666
    if-ne v1, v5, :cond_26

    .line 667
    .line 668
    iget v1, v0, Ll/cnr0;->b:I

    .line 669
    .line 670
    and-int/2addr v1, v5

    .line 671
    if-eqz v1, :cond_26

    .line 672
    .line 673
    iget-object v1, v0, Ll/cnr0;->t:Ll/ser0;

    .line 674
    .line 675
    invoke-interface {v1, v9, v6}, Ll/ser0;->i(II)Ll/sgr0;

    .line 676
    .line 677
    .line 678
    move-result-object v1

    .line 679
    iget-object v2, v0, Ll/cnr0;->z:Lcom/google/android/gms/internal/ads/zzahe;

    .line 680
    .line 681
    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    if-nez v2, :cond_25

    .line 687
    .line 688
    const/4 v5, 0x0

    .line 689
    goto :goto_f

    .line 690
    :cond_25
    new-instance v5, Lcom/google/android/gms/internal/ads/zzby;

    .line 691
    .line 692
    new-array v6, v12, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 693
    .line 694
    aput-object v2, v6, v9

    .line 695
    .line 696
    invoke-direct {v5, v3, v4, v6}, Lcom/google/android/gms/internal/ads/zzby;-><init>(J[Lcom/google/android/gms/internal/ads/zzbx;)V

    .line 697
    .line 698
    .line 699
    :goto_f
    new-instance v2, Ll/znr0;

    .line 700
    .line 701
    invoke-direct {v2}, Ll/znr0;-><init>()V

    .line 702
    .line 703
    .line 704
    invoke-virtual {v2, v5}, Ll/znr0;->p(Lcom/google/android/gms/internal/ads/zzby;)Ll/znr0;

    .line 705
    .line 706
    .line 707
    invoke-virtual {v2}, Ll/znr0;->D()Ll/sqr0;

    .line 708
    .line 709
    .line 710
    move-result-object v2

    .line 711
    invoke-interface {v1, v2}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 712
    .line 713
    .line 714
    iget-object v1, v0, Ll/cnr0;->t:Ll/ser0;

    .line 715
    .line 716
    invoke-interface {v1}, Ll/ser0;->c()V

    .line 717
    .line 718
    .line 719
    iget-object v0, v0, Ll/cnr0;->t:Ll/ser0;

    .line 720
    .line 721
    new-instance v1, Ll/agr0;

    .line 722
    .line 723
    move-wide/from16 v5, v30

    .line 724
    .line 725
    invoke-direct {v1, v3, v4, v5, v6}, Ll/agr0;-><init>(JJ)V

    .line 726
    .line 727
    .line 728
    invoke-interface {v0, v1}, Ll/ser0;->j(Ll/bgr0;)V

    .line 729
    .line 730
    .line 731
    :cond_26
    const/16 v22, -0x1

    .line 732
    .line 733
    return v22

    .line 734
    :cond_27
    iput v11, v0, Ll/cnr0;->m:I

    .line 735
    .line 736
    iget-object v3, v0, Ll/cnr0;->f:Ll/bgw0;

    .line 737
    .line 738
    const/4 v9, 0x0

    .line 739
    invoke-virtual {v3, v9}, Ll/bgw0;->k(I)V

    .line 740
    .line 741
    .line 742
    iget-object v3, v0, Ll/cnr0;->f:Ll/bgw0;

    .line 743
    .line 744
    invoke-virtual {v3}, Ll/bgw0;->J()J

    .line 745
    .line 746
    .line 747
    move-result-wide v5

    .line 748
    iput-wide v5, v0, Ll/cnr0;->l:J

    .line 749
    .line 750
    iget-object v3, v0, Ll/cnr0;->f:Ll/bgw0;

    .line 751
    .line 752
    invoke-virtual {v3}, Ll/bgw0;->v()I

    .line 753
    .line 754
    .line 755
    move-result v3

    .line 756
    iput v3, v0, Ll/cnr0;->k:I

    .line 757
    .line 758
    :cond_28
    iget-wide v5, v0, Ll/cnr0;->l:J

    .line 759
    .line 760
    const-wide/16 v7, 0x1

    .line 761
    .line 762
    cmp-long v3, v5, v7

    .line 763
    .line 764
    if-nez v3, :cond_29

    .line 765
    .line 766
    iget-object v3, v0, Ll/cnr0;->f:Ll/bgw0;

    .line 767
    .line 768
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 769
    .line 770
    .line 771
    move-result-object v3

    .line 772
    invoke-interface {v1, v3, v11, v11}, Ll/qer0;->h([BII)V

    .line 773
    .line 774
    .line 775
    iget v3, v0, Ll/cnr0;->m:I

    .line 776
    .line 777
    add-int/2addr v3, v11

    .line 778
    iput v3, v0, Ll/cnr0;->m:I

    .line 779
    .line 780
    iget-object v3, v0, Ll/cnr0;->f:Ll/bgw0;

    .line 781
    .line 782
    invoke-virtual {v3}, Ll/bgw0;->K()J

    .line 783
    .line 784
    .line 785
    move-result-wide v5

    .line 786
    iput-wide v5, v0, Ll/cnr0;->l:J

    .line 787
    .line 788
    goto :goto_11

    .line 789
    :cond_29
    const-wide/16 v30, 0x0

    .line 790
    .line 791
    cmp-long v3, v5, v30

    .line 792
    .line 793
    if-nez v3, :cond_2c

    .line 794
    .line 795
    invoke-interface {v1}, Ll/qer0;->zzd()J

    .line 796
    .line 797
    .line 798
    move-result-wide v5

    .line 799
    const-wide/16 v7, -0x1

    .line 800
    .line 801
    cmp-long v3, v5, v7

    .line 802
    .line 803
    if-nez v3, :cond_2b

    .line 804
    .line 805
    iget-object v3, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 806
    .line 807
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 808
    .line 809
    .line 810
    move-result-object v3

    .line 811
    check-cast v3, Ll/xlr0;

    .line 812
    .line 813
    if-eqz v3, :cond_2a

    .line 814
    .line 815
    iget-wide v5, v3, Ll/xlr0;->b:J

    .line 816
    .line 817
    goto :goto_10

    .line 818
    :cond_2a
    move-wide v5, v7

    .line 819
    :cond_2b
    :goto_10
    cmp-long v3, v5, v7

    .line 820
    .line 821
    if-eqz v3, :cond_2c

    .line 822
    .line 823
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 824
    .line 825
    .line 826
    move-result-wide v7

    .line 827
    sub-long/2addr v5, v7

    .line 828
    iget v3, v0, Ll/cnr0;->m:I

    .line 829
    .line 830
    int-to-long v7, v3

    .line 831
    add-long/2addr v5, v7

    .line 832
    iput-wide v5, v0, Ll/cnr0;->l:J

    .line 833
    .line 834
    :cond_2c
    :goto_11
    iget-wide v5, v0, Ll/cnr0;->l:J

    .line 835
    .line 836
    iget v3, v0, Ll/cnr0;->m:I

    .line 837
    .line 838
    int-to-long v7, v3

    .line 839
    cmp-long v5, v5, v7

    .line 840
    .line 841
    if-ltz v5, :cond_36

    .line 842
    .line 843
    iget v5, v0, Ll/cnr0;->k:I

    .line 844
    .line 845
    const v6, 0x6d6f6f76

    .line 846
    .line 847
    .line 848
    const v7, 0x6d657461

    .line 849
    .line 850
    .line 851
    if-eq v5, v6, :cond_33

    .line 852
    .line 853
    const v6, 0x7472616b

    .line 854
    .line 855
    .line 856
    if-eq v5, v6, :cond_33

    .line 857
    .line 858
    const v6, 0x6d646961

    .line 859
    .line 860
    .line 861
    if-eq v5, v6, :cond_33

    .line 862
    .line 863
    const v6, 0x6d696e66

    .line 864
    .line 865
    .line 866
    if-eq v5, v6, :cond_33

    .line 867
    .line 868
    const v6, 0x7374626c

    .line 869
    .line 870
    .line 871
    if-eq v5, v6, :cond_33

    .line 872
    .line 873
    const v6, 0x65647473

    .line 874
    .line 875
    .line 876
    if-eq v5, v6, :cond_33

    .line 877
    .line 878
    if-ne v5, v7, :cond_2d

    .line 879
    .line 880
    goto/16 :goto_15

    .line 881
    .line 882
    :cond_2d
    const v6, 0x6d646864

    .line 883
    .line 884
    .line 885
    if-eq v5, v6, :cond_30

    .line 886
    .line 887
    const v6, 0x6d766864

    .line 888
    .line 889
    .line 890
    if-eq v5, v6, :cond_30

    .line 891
    .line 892
    const v6, 0x68646c72    # 4.3148E24f

    .line 893
    .line 894
    .line 895
    if-eq v5, v6, :cond_30

    .line 896
    .line 897
    const v6, 0x73747364

    .line 898
    .line 899
    .line 900
    if-eq v5, v6, :cond_30

    .line 901
    .line 902
    const v6, 0x73747473

    .line 903
    .line 904
    .line 905
    if-eq v5, v6, :cond_30

    .line 906
    .line 907
    const v6, 0x73747373

    .line 908
    .line 909
    .line 910
    if-eq v5, v6, :cond_30

    .line 911
    .line 912
    const v6, 0x63747473

    .line 913
    .line 914
    .line 915
    if-eq v5, v6, :cond_30

    .line 916
    .line 917
    const v6, 0x656c7374

    .line 918
    .line 919
    .line 920
    if-eq v5, v6, :cond_30

    .line 921
    .line 922
    const v6, 0x73747363

    .line 923
    .line 924
    .line 925
    if-eq v5, v6, :cond_30

    .line 926
    .line 927
    const v6, 0x7374737a

    .line 928
    .line 929
    .line 930
    if-eq v5, v6, :cond_30

    .line 931
    .line 932
    const v6, 0x73747a32

    .line 933
    .line 934
    .line 935
    if-eq v5, v6, :cond_30

    .line 936
    .line 937
    const v6, 0x7374636f

    .line 938
    .line 939
    .line 940
    if-eq v5, v6, :cond_30

    .line 941
    .line 942
    const v6, 0x636f3634

    .line 943
    .line 944
    .line 945
    if-eq v5, v6, :cond_30

    .line 946
    .line 947
    const v6, 0x746b6864

    .line 948
    .line 949
    .line 950
    if-eq v5, v6, :cond_30

    .line 951
    .line 952
    if-eq v5, v4, :cond_30

    .line 953
    .line 954
    const v4, 0x75647461

    .line 955
    .line 956
    .line 957
    if-eq v5, v4, :cond_30

    .line 958
    .line 959
    const v4, 0x6b657973

    .line 960
    .line 961
    .line 962
    if-eq v5, v4, :cond_30

    .line 963
    .line 964
    const v4, 0x696c7374

    .line 965
    .line 966
    .line 967
    if-ne v5, v4, :cond_2e

    .line 968
    .line 969
    goto :goto_12

    .line 970
    :cond_2e
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 971
    .line 972
    .line 973
    move-result-wide v3

    .line 974
    iget v5, v0, Ll/cnr0;->m:I

    .line 975
    .line 976
    int-to-long v5, v5

    .line 977
    sub-long v27, v3, v5

    .line 978
    .line 979
    iget v3, v0, Ll/cnr0;->k:I

    .line 980
    .line 981
    const v4, 0x6d707664

    .line 982
    .line 983
    .line 984
    if-ne v3, v4, :cond_2f

    .line 985
    .line 986
    add-long v31, v27, v5

    .line 987
    .line 988
    new-instance v24, Lcom/google/android/gms/internal/ads/zzahe;

    .line 989
    .line 990
    iget-wide v3, v0, Ll/cnr0;->l:J

    .line 991
    .line 992
    sub-long v33, v3, v5

    .line 993
    .line 994
    const-wide/16 v25, 0x0

    .line 995
    .line 996
    const-wide v29, -0x7fffffffffffffffL    # -4.9E-324

    .line 997
    .line 998
    .line 999
    .line 1000
    .line 1001
    invoke-direct/range {v24 .. v34}, Lcom/google/android/gms/internal/ads/zzahe;-><init>(JJJJJ)V

    .line 1002
    .line 1003
    .line 1004
    move-object/from16 v3, v24

    .line 1005
    .line 1006
    iput-object v3, v0, Ll/cnr0;->z:Lcom/google/android/gms/internal/ads/zzahe;

    .line 1007
    .line 1008
    :cond_2f
    const/4 v3, 0x0

    .line 1009
    iput-object v3, v0, Ll/cnr0;->n:Ll/bgw0;

    .line 1010
    .line 1011
    iput v12, v0, Ll/cnr0;->j:I

    .line 1012
    .line 1013
    goto/16 :goto_0

    .line 1014
    .line 1015
    :cond_30
    :goto_12
    if-ne v3, v11, :cond_31

    .line 1016
    .line 1017
    move v3, v12

    .line 1018
    goto :goto_13

    .line 1019
    :cond_31
    const/4 v3, 0x0

    .line 1020
    :goto_13
    invoke-static {v3}, Ll/lev0;->f(Z)V

    .line 1021
    .line 1022
    .line 1023
    iget-wide v3, v0, Ll/cnr0;->l:J

    .line 1024
    .line 1025
    const-wide/32 v5, 0x7fffffff

    .line 1026
    .line 1027
    .line 1028
    cmp-long v3, v3, v5

    .line 1029
    .line 1030
    if-gtz v3, :cond_32

    .line 1031
    .line 1032
    move v3, v12

    .line 1033
    goto :goto_14

    .line 1034
    :cond_32
    const/4 v3, 0x0

    .line 1035
    :goto_14
    invoke-static {v3}, Ll/lev0;->f(Z)V

    .line 1036
    .line 1037
    .line 1038
    new-instance v3, Ll/bgw0;

    .line 1039
    .line 1040
    iget-wide v4, v0, Ll/cnr0;->l:J

    .line 1041
    .line 1042
    long-to-int v4, v4

    .line 1043
    invoke-direct {v3, v4}, Ll/bgw0;-><init>(I)V

    .line 1044
    .line 1045
    .line 1046
    iget-object v4, v0, Ll/cnr0;->f:Ll/bgw0;

    .line 1047
    .line 1048
    invoke-virtual {v4}, Ll/bgw0;->m()[B

    .line 1049
    .line 1050
    .line 1051
    move-result-object v4

    .line 1052
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 1053
    .line 1054
    .line 1055
    move-result-object v5

    .line 1056
    const/4 v9, 0x0

    .line 1057
    invoke-static {v4, v9, v5, v9, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1058
    .line 1059
    .line 1060
    iput-object v3, v0, Ll/cnr0;->n:Ll/bgw0;

    .line 1061
    .line 1062
    iput v12, v0, Ll/cnr0;->j:I

    .line 1063
    .line 1064
    goto/16 :goto_0

    .line 1065
    .line 1066
    :cond_33
    :goto_15
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 1067
    .line 1068
    .line 1069
    move-result-wide v3

    .line 1070
    iget-wide v5, v0, Ll/cnr0;->l:J

    .line 1071
    .line 1072
    add-long/2addr v3, v5

    .line 1073
    iget v8, v0, Ll/cnr0;->m:I

    .line 1074
    .line 1075
    int-to-long v8, v8

    .line 1076
    cmp-long v5, v5, v8

    .line 1077
    .line 1078
    if-eqz v5, :cond_34

    .line 1079
    .line 1080
    iget v5, v0, Ll/cnr0;->k:I

    .line 1081
    .line 1082
    if-ne v5, v7, :cond_34

    .line 1083
    .line 1084
    iget-object v5, v0, Ll/cnr0;->e:Ll/bgw0;

    .line 1085
    .line 1086
    invoke-virtual {v5, v11}, Ll/bgw0;->h(I)V

    .line 1087
    .line 1088
    .line 1089
    iget-object v5, v0, Ll/cnr0;->e:Ll/bgw0;

    .line 1090
    .line 1091
    invoke-virtual {v5}, Ll/bgw0;->m()[B

    .line 1092
    .line 1093
    .line 1094
    move-result-object v5

    .line 1095
    const/4 v6, 0x0

    .line 1096
    invoke-interface {v1, v5, v6, v11}, Ll/qer0;->i([BII)V

    .line 1097
    .line 1098
    .line 1099
    iget-object v5, v0, Ll/cnr0;->e:Ll/bgw0;

    .line 1100
    .line 1101
    invoke-static {v5}, Ll/hmr0;->e(Ll/bgw0;)V

    .line 1102
    .line 1103
    .line 1104
    iget-object v5, v0, Ll/cnr0;->e:Ll/bgw0;

    .line 1105
    .line 1106
    invoke-virtual {v5}, Ll/bgw0;->s()I

    .line 1107
    .line 1108
    .line 1109
    move-result v5

    .line 1110
    invoke-interface {v1, v5}, Ll/qer0;->d(I)V

    .line 1111
    .line 1112
    .line 1113
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 1114
    .line 1115
    .line 1116
    :cond_34
    sub-long/2addr v3, v8

    .line 1117
    iget-object v5, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 1118
    .line 1119
    new-instance v6, Ll/xlr0;

    .line 1120
    .line 1121
    iget v7, v0, Ll/cnr0;->k:I

    .line 1122
    .line 1123
    invoke-direct {v6, v7, v3, v4}, Ll/xlr0;-><init>(IJ)V

    .line 1124
    .line 1125
    .line 1126
    invoke-virtual {v5, v6}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    .line 1127
    .line 1128
    .line 1129
    iget-wide v5, v0, Ll/cnr0;->l:J

    .line 1130
    .line 1131
    iget v7, v0, Ll/cnr0;->m:I

    .line 1132
    .line 1133
    int-to-long v7, v7

    .line 1134
    cmp-long v5, v5, v7

    .line 1135
    .line 1136
    if-nez v5, :cond_35

    .line 1137
    .line 1138
    invoke-virtual {v0, v3, v4}, Ll/cnr0;->k(J)V

    .line 1139
    .line 1140
    .line 1141
    goto/16 :goto_0

    .line 1142
    .line 1143
    :cond_35
    invoke-virtual {v0}, Ll/cnr0;->j()V

    .line 1144
    .line 1145
    .line 1146
    goto/16 :goto_0

    .line 1147
    .line 1148
    :cond_36
    const-string v0, "Atom size less than header length (unsupported)."

    .line 1149
    .line 1150
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzcc;->zzc(Ljava/lang/String;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 1151
    .line 1152
    .line 1153
    move-result-object v0

    .line 1154
    throw v0
.end method

.method public final j()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/cnr0;->j:I

    .line 3
    .line 4
    iput v0, p0, Ll/cnr0;->m:I

    .line 5
    .line 6
    return-void
.end method

.method public final k(J)V
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    :cond_0
    :goto_0
    iget-object v1, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1c

    .line 10
    .line 11
    iget-object v1, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Ll/xlr0;

    .line 18
    .line 19
    iget-wide v3, v1, Ll/xlr0;->b:J

    .line 20
    .line 21
    cmp-long v1, v3, p1

    .line 22
    .line 23
    if-nez v1, :cond_1c

    .line 24
    .line 25
    iget-object v1, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->pop()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    move-object v3, v1

    .line 32
    check-cast v3, Ll/xlr0;

    .line 33
    .line 34
    iget v1, v3, Ll/zlr0;->a:I

    .line 35
    .line 36
    const v4, 0x6d6f6f76

    .line 37
    .line 38
    .line 39
    if-ne v1, v4, :cond_1b

    .line 40
    .line 41
    new-instance v1, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    iget v4, v0, Ll/cnr0;->y:I

    .line 47
    .line 48
    new-instance v5, Ll/rfr0;

    .line 49
    .line 50
    invoke-direct {v5}, Ll/rfr0;-><init>()V

    .line 51
    .line 52
    .line 53
    const v6, 0x75647461

    .line 54
    .line 55
    .line 56
    invoke-virtual {v3, v6}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 57
    .line 58
    .line 59
    move-result-object v6

    .line 60
    if-eqz v6, :cond_1

    .line 61
    .line 62
    invoke-static {v6}, Ll/hmr0;->b(Ll/ylr0;)Lcom/google/android/gms/internal/ads/zzby;

    .line 63
    .line 64
    .line 65
    move-result-object v6

    .line 66
    invoke-virtual {v5, v6}, Ll/rfr0;->b(Lcom/google/android/gms/internal/ads/zzby;)Z

    .line 67
    .line 68
    .line 69
    move-object v12, v6

    .line 70
    goto :goto_1

    .line 71
    :cond_1
    const/4 v12, 0x0

    .line 72
    :goto_1
    const v6, 0x6d657461

    .line 73
    .line 74
    .line 75
    invoke-virtual {v3, v6}, Ll/xlr0;->c(I)Ll/xlr0;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    if-eqz v6, :cond_2

    .line 80
    .line 81
    invoke-static {v6}, Ll/hmr0;->a(Ll/xlr0;)Lcom/google/android/gms/internal/ads/zzby;

    .line 82
    .line 83
    .line 84
    move-result-object v6

    .line 85
    move-object v13, v6

    .line 86
    goto :goto_2

    .line 87
    :cond_2
    const/4 v13, 0x0

    .line 88
    :goto_2
    new-instance v14, Lcom/google/android/gms/internal/ads/zzby;

    .line 89
    .line 90
    const v6, 0x6d766864

    .line 91
    .line 92
    .line 93
    invoke-virtual {v3, v6}, Ll/xlr0;->d(I)Ll/ylr0;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    const/4 v15, 0x0

    .line 101
    const/4 v7, 0x1

    .line 102
    if-ne v4, v7, :cond_3

    .line 103
    .line 104
    move v9, v7

    .line 105
    goto :goto_3

    .line 106
    :cond_3
    move v9, v15

    .line 107
    :goto_3
    iget-object v4, v6, Ll/ylr0;->b:Ll/bgw0;

    .line 108
    .line 109
    invoke-static {v4}, Ll/hmr0;->c(Ll/bgw0;)Lcom/google/android/gms/internal/ads/zzgi;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    new-array v6, v7, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 114
    .line 115
    aput-object v4, v6, v15

    .line 116
    .line 117
    move-object/from16 v16, v12

    .line 118
    .line 119
    const-wide v11, -0x7fffffffffffffffL    # -4.9E-324

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    invoke-direct {v14, v11, v12, v6}, Lcom/google/android/gms/internal/ads/zzby;-><init>(J[Lcom/google/android/gms/internal/ads/zzbx;)V

    .line 125
    .line 126
    .line 127
    iget v4, v0, Ll/cnr0;->b:I

    .line 128
    .line 129
    and-int/2addr v4, v7

    .line 130
    if-eq v7, v4, :cond_4

    .line 131
    .line 132
    move v4, v7

    .line 133
    move v8, v15

    .line 134
    goto :goto_4

    .line 135
    :cond_4
    move v4, v7

    .line 136
    move v8, v4

    .line 137
    :goto_4
    const/4 v7, 0x0

    .line 138
    sget-object v10, Ll/zmr0;->a:Ll/zmr0;

    .line 139
    .line 140
    move/from16 v17, v4

    .line 141
    .line 142
    move-object v4, v5

    .line 143
    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    move-wide/from16 v18, v11

    .line 149
    .line 150
    move/from16 v11, v17

    .line 151
    .line 152
    invoke-static/range {v3 .. v10}, Ll/hmr0;->d(Ll/xlr0;Ll/rfr0;JLcom/google/android/gms/internal/ads/zzae;ZZLl/eow0;)Ljava/util/List;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    move v7, v15

    .line 161
    move-wide/from16 v9, v18

    .line 162
    .line 163
    const/4 v8, -0x1

    .line 164
    :goto_5
    const-wide/16 v20, 0x0

    .line 165
    .line 166
    if-ge v7, v5, :cond_15

    .line 167
    .line 168
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v12

    .line 172
    check-cast v12, Ll/knr0;

    .line 173
    .line 174
    iget v15, v12, Ll/knr0;->b:I

    .line 175
    .line 176
    if-nez v15, :cond_5

    .line 177
    .line 178
    move-object/from16 v22, v3

    .line 179
    .line 180
    move/from16 v24, v5

    .line 181
    .line 182
    move/from16 v25, v7

    .line 183
    .line 184
    const/4 v7, -0x1

    .line 185
    goto/16 :goto_f

    .line 186
    .line 187
    :cond_5
    iget-object v15, v12, Ll/knr0;->a:Ll/hnr0;

    .line 188
    .line 189
    move-object/from16 v22, v3

    .line 190
    .line 191
    iget-wide v2, v15, Ll/hnr0;->e:J

    .line 192
    .line 193
    cmp-long v23, v2, v18

    .line 194
    .line 195
    if-eqz v23, :cond_6

    .line 196
    .line 197
    goto :goto_6

    .line 198
    :cond_6
    iget-wide v2, v12, Ll/knr0;->h:J

    .line 199
    .line 200
    :goto_6
    invoke-static {v9, v10, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 201
    .line 202
    .line 203
    move-result-wide v9

    .line 204
    new-instance v11, Ll/bnr0;

    .line 205
    .line 206
    iget-object v6, v0, Ll/cnr0;->t:Ll/ser0;

    .line 207
    .line 208
    move/from16 v24, v5

    .line 209
    .line 210
    iget v5, v15, Ll/hnr0;->b:I

    .line 211
    .line 212
    invoke-interface {v6, v7, v5}, Ll/ser0;->i(II)Ll/sgr0;

    .line 213
    .line 214
    .line 215
    move-result-object v5

    .line 216
    invoke-direct {v11, v15, v12, v5}, Ll/bnr0;-><init>(Ll/hnr0;Ll/knr0;Ll/sgr0;)V

    .line 217
    .line 218
    .line 219
    iget-object v5, v15, Ll/hnr0;->f:Ll/sqr0;

    .line 220
    .line 221
    const-string v6, "audio/true-hd"

    .line 222
    .line 223
    iget-object v5, v5, Ll/sqr0;->l:Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {v6, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result v5

    .line 229
    iget v6, v12, Ll/knr0;->e:I

    .line 230
    .line 231
    if-eqz v5, :cond_7

    .line 232
    .line 233
    mul-int/lit8 v6, v6, 0x10

    .line 234
    .line 235
    goto :goto_7

    .line 236
    :cond_7
    add-int/lit8 v6, v6, 0x1e

    .line 237
    .line 238
    :goto_7
    iget-object v5, v15, Ll/hnr0;->f:Ll/sqr0;

    .line 239
    .line 240
    invoke-virtual {v5}, Ll/sqr0;->b()Ll/znr0;

    .line 241
    .line 242
    .line 243
    move-result-object v5

    .line 244
    invoke-virtual {v5, v6}, Ll/znr0;->o(I)Ll/znr0;

    .line 245
    .line 246
    .line 247
    iget v6, v15, Ll/hnr0;->b:I

    .line 248
    .line 249
    move/from16 v25, v7

    .line 250
    .line 251
    const/4 v7, 0x2

    .line 252
    if-ne v6, v7, :cond_a

    .line 253
    .line 254
    iget v6, v0, Ll/cnr0;->b:I

    .line 255
    .line 256
    and-int/lit8 v6, v6, 0x8

    .line 257
    .line 258
    if-eqz v6, :cond_9

    .line 259
    .line 260
    iget-object v6, v15, Ll/hnr0;->f:Ll/sqr0;

    .line 261
    .line 262
    const/4 v7, -0x1

    .line 263
    if-ne v8, v7, :cond_8

    .line 264
    .line 265
    const/4 v7, 0x1

    .line 266
    goto :goto_8

    .line 267
    :cond_8
    const/4 v7, 0x2

    .line 268
    :goto_8
    iget v6, v6, Ll/sqr0;->e:I

    .line 269
    .line 270
    or-int/2addr v6, v7

    .line 271
    invoke-virtual {v5, v6}, Ll/znr0;->u(I)Ll/znr0;

    .line 272
    .line 273
    .line 274
    :cond_9
    cmp-long v6, v2, v20

    .line 275
    .line 276
    if-lez v6, :cond_a

    .line 277
    .line 278
    iget v6, v12, Ll/knr0;->b:I

    .line 279
    .line 280
    const/4 v7, 0x1

    .line 281
    if-le v6, v7, :cond_a

    .line 282
    .line 283
    long-to-float v2, v2

    .line 284
    int-to-float v3, v6

    .line 285
    const v6, 0x49742400    # 1000000.0f

    .line 286
    .line 287
    .line 288
    div-float/2addr v2, v6

    .line 289
    div-float/2addr v3, v2

    .line 290
    invoke-virtual {v5, v3}, Ll/znr0;->h(F)Ll/znr0;

    .line 291
    .line 292
    .line 293
    :cond_a
    iget v2, v15, Ll/hnr0;->b:I

    .line 294
    .line 295
    sget-object v3, Ll/ymr0;->a:[Ljava/lang/String;

    .line 296
    .line 297
    const/4 v7, 0x1

    .line 298
    if-ne v2, v7, :cond_b

    .line 299
    .line 300
    invoke-virtual {v4}, Ll/rfr0;->a()Z

    .line 301
    .line 302
    .line 303
    move-result v2

    .line 304
    if-eqz v2, :cond_b

    .line 305
    .line 306
    iget v2, v4, Ll/rfr0;->a:I

    .line 307
    .line 308
    invoke-virtual {v5, v2}, Ll/znr0;->f(I)Ll/znr0;

    .line 309
    .line 310
    .line 311
    iget v2, v4, Ll/rfr0;->b:I

    .line 312
    .line 313
    invoke-virtual {v5, v2}, Ll/znr0;->g(I)Ll/znr0;

    .line 314
    .line 315
    .line 316
    :cond_b
    iget v2, v15, Ll/hnr0;->b:I

    .line 317
    .line 318
    iget-object v3, v0, Ll/cnr0;->i:Ljava/util/List;

    .line 319
    .line 320
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 321
    .line 322
    .line 323
    move-result v3

    .line 324
    if-eqz v3, :cond_c

    .line 325
    .line 326
    const/4 v6, 0x0

    .line 327
    :goto_9
    move-object/from16 v3, v16

    .line 328
    .line 329
    goto :goto_a

    .line 330
    :cond_c
    iget-object v3, v0, Ll/cnr0;->i:Ljava/util/List;

    .line 331
    .line 332
    new-instance v6, Lcom/google/android/gms/internal/ads/zzby;

    .line 333
    .line 334
    invoke-direct {v6, v3}, Lcom/google/android/gms/internal/ads/zzby;-><init>(Ljava/util/List;)V

    .line 335
    .line 336
    .line 337
    goto :goto_9

    .line 338
    :goto_a
    filled-new-array {v6, v3, v14}, [Lcom/google/android/gms/internal/ads/zzby;

    .line 339
    .line 340
    .line 341
    move-result-object v6

    .line 342
    new-instance v7, Lcom/google/android/gms/internal/ads/zzby;

    .line 343
    .line 344
    move-object/from16 v16, v3

    .line 345
    .line 346
    const/4 v12, 0x0

    .line 347
    new-array v3, v12, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 348
    .line 349
    move-wide/from16 v26, v9

    .line 350
    .line 351
    move-wide/from16 v9, v18

    .line 352
    .line 353
    invoke-direct {v7, v9, v10, v3}, Lcom/google/android/gms/internal/ads/zzby;-><init>(J[Lcom/google/android/gms/internal/ads/zzbx;)V

    .line 354
    .line 355
    .line 356
    if-eqz v13, :cond_10

    .line 357
    .line 358
    const/4 v3, 0x0

    .line 359
    :goto_b
    invoke-virtual {v13}, Lcom/google/android/gms/internal/ads/zzby;->a()I

    .line 360
    .line 361
    .line 362
    move-result v12

    .line 363
    if-ge v3, v12, :cond_10

    .line 364
    .line 365
    invoke-virtual {v13, v3}, Lcom/google/android/gms/internal/ads/zzby;->b(I)Lcom/google/android/gms/internal/ads/zzbx;

    .line 366
    .line 367
    .line 368
    move-result-object v12

    .line 369
    instance-of v9, v12, Lcom/google/android/gms/internal/ads/zzgc;

    .line 370
    .line 371
    if-eqz v9, :cond_f

    .line 372
    .line 373
    check-cast v12, Lcom/google/android/gms/internal/ads/zzgc;

    .line 374
    .line 375
    iget-object v9, v12, Lcom/google/android/gms/internal/ads/zzgc;->zza:Ljava/lang/String;

    .line 376
    .line 377
    const-string v10, "com.android.capture.fps"

    .line 378
    .line 379
    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    move-result v9

    .line 383
    if-eqz v9, :cond_e

    .line 384
    .line 385
    const/4 v9, 0x2

    .line 386
    if-ne v2, v9, :cond_d

    .line 387
    .line 388
    const/4 v9, 0x1

    .line 389
    new-array v10, v9, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 390
    .line 391
    const/16 v17, 0x0

    .line 392
    .line 393
    aput-object v12, v10, v17

    .line 394
    .line 395
    invoke-virtual {v7, v10}, Lcom/google/android/gms/internal/ads/zzby;->c([Lcom/google/android/gms/internal/ads/zzbx;)Lcom/google/android/gms/internal/ads/zzby;

    .line 396
    .line 397
    .line 398
    move-result-object v7

    .line 399
    goto :goto_c

    .line 400
    :cond_d
    const/16 v17, 0x0

    .line 401
    .line 402
    goto :goto_c

    .line 403
    :cond_e
    const/4 v9, 0x1

    .line 404
    const/16 v17, 0x0

    .line 405
    .line 406
    new-array v10, v9, [Lcom/google/android/gms/internal/ads/zzbx;

    .line 407
    .line 408
    aput-object v12, v10, v17

    .line 409
    .line 410
    invoke-virtual {v7, v10}, Lcom/google/android/gms/internal/ads/zzby;->c([Lcom/google/android/gms/internal/ads/zzbx;)Lcom/google/android/gms/internal/ads/zzby;

    .line 411
    .line 412
    .line 413
    move-result-object v7

    .line 414
    :cond_f
    :goto_c
    add-int/lit8 v3, v3, 0x1

    .line 415
    .line 416
    const-wide v9, -0x7fffffffffffffffL    # -4.9E-324

    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    goto :goto_b

    .line 422
    :cond_10
    const/4 v2, 0x0

    .line 423
    :goto_d
    const/4 v3, 0x3

    .line 424
    if-ge v2, v3, :cond_11

    .line 425
    .line 426
    aget-object v3, v6, v2

    .line 427
    .line 428
    invoke-virtual {v7, v3}, Lcom/google/android/gms/internal/ads/zzby;->d(Lcom/google/android/gms/internal/ads/zzby;)Lcom/google/android/gms/internal/ads/zzby;

    .line 429
    .line 430
    .line 431
    move-result-object v7

    .line 432
    add-int/lit8 v2, v2, 0x1

    .line 433
    .line 434
    goto :goto_d

    .line 435
    :cond_11
    invoke-virtual {v7}, Lcom/google/android/gms/internal/ads/zzby;->a()I

    .line 436
    .line 437
    .line 438
    move-result v2

    .line 439
    if-lez v2, :cond_12

    .line 440
    .line 441
    invoke-virtual {v5, v7}, Ll/znr0;->p(Lcom/google/android/gms/internal/ads/zzby;)Ll/znr0;

    .line 442
    .line 443
    .line 444
    :cond_12
    iget-object v2, v11, Ll/bnr0;->c:Ll/sgr0;

    .line 445
    .line 446
    invoke-virtual {v5}, Ll/znr0;->D()Ll/sqr0;

    .line 447
    .line 448
    .line 449
    move-result-object v3

    .line 450
    invoke-interface {v2, v3}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 451
    .line 452
    .line 453
    iget v2, v15, Ll/hnr0;->b:I

    .line 454
    .line 455
    const/4 v7, 0x2

    .line 456
    if-ne v2, v7, :cond_13

    .line 457
    .line 458
    const/4 v7, -0x1

    .line 459
    if-ne v8, v7, :cond_14

    .line 460
    .line 461
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 462
    .line 463
    .line 464
    move-result v8

    .line 465
    goto :goto_e

    .line 466
    :cond_13
    const/4 v7, -0x1

    .line 467
    :cond_14
    :goto_e
    invoke-interface {v1, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 468
    .line 469
    .line 470
    move-wide/from16 v9, v26

    .line 471
    .line 472
    :goto_f
    add-int/lit8 v2, v25, 0x1

    .line 473
    .line 474
    move v7, v2

    .line 475
    move-object/from16 v3, v22

    .line 476
    .line 477
    move/from16 v5, v24

    .line 478
    .line 479
    const/4 v11, 0x1

    .line 480
    const/4 v15, 0x0

    .line 481
    const-wide v18, -0x7fffffffffffffffL    # -4.9E-324

    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    goto/16 :goto_5

    .line 487
    .line 488
    :cond_15
    const/4 v7, -0x1

    .line 489
    iput v8, v0, Ll/cnr0;->w:I

    .line 490
    .line 491
    iput-wide v9, v0, Ll/cnr0;->x:J

    .line 492
    .line 493
    const/4 v12, 0x0

    .line 494
    new-array v2, v12, [Ll/bnr0;

    .line 495
    .line 496
    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 497
    .line 498
    .line 499
    move-result-object v1

    .line 500
    check-cast v1, [Ll/bnr0;

    .line 501
    .line 502
    iput-object v1, v0, Ll/cnr0;->u:[Ll/bnr0;

    .line 503
    .line 504
    array-length v2, v1

    .line 505
    new-array v3, v2, [[J

    .line 506
    .line 507
    new-array v4, v2, [I

    .line 508
    .line 509
    new-array v5, v2, [J

    .line 510
    .line 511
    new-array v2, v2, [Z

    .line 512
    .line 513
    const/4 v12, 0x0

    .line 514
    :goto_10
    array-length v6, v1

    .line 515
    if-ge v12, v6, :cond_16

    .line 516
    .line 517
    aget-object v6, v1, v12

    .line 518
    .line 519
    iget-object v6, v6, Ll/bnr0;->b:Ll/knr0;

    .line 520
    .line 521
    iget v6, v6, Ll/knr0;->b:I

    .line 522
    .line 523
    new-array v6, v6, [J

    .line 524
    .line 525
    aput-object v6, v3, v12

    .line 526
    .line 527
    aget-object v6, v1, v12

    .line 528
    .line 529
    iget-object v6, v6, Ll/bnr0;->b:Ll/knr0;

    .line 530
    .line 531
    iget-object v6, v6, Ll/knr0;->f:[J

    .line 532
    .line 533
    const/16 v17, 0x0

    .line 534
    .line 535
    aget-wide v8, v6, v17

    .line 536
    .line 537
    aput-wide v8, v5, v12

    .line 538
    .line 539
    add-int/lit8 v12, v12, 0x1

    .line 540
    .line 541
    goto :goto_10

    .line 542
    :cond_16
    const/16 v17, 0x0

    .line 543
    .line 544
    move/from16 v12, v17

    .line 545
    .line 546
    :goto_11
    array-length v6, v1

    .line 547
    if-ge v12, v6, :cond_1a

    .line 548
    .line 549
    const-wide v8, 0x7fffffffffffffffL

    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    move v6, v7

    .line 555
    move/from16 v10, v17

    .line 556
    .line 557
    :goto_12
    array-length v11, v1

    .line 558
    if-ge v10, v11, :cond_18

    .line 559
    .line 560
    aget-boolean v11, v2, v10

    .line 561
    .line 562
    if-nez v11, :cond_17

    .line 563
    .line 564
    aget-wide v13, v5, v10

    .line 565
    .line 566
    cmp-long v11, v13, v8

    .line 567
    .line 568
    if-gtz v11, :cond_17

    .line 569
    .line 570
    move v6, v10

    .line 571
    move-wide v8, v13

    .line 572
    :cond_17
    add-int/lit8 v10, v10, 0x1

    .line 573
    .line 574
    goto :goto_12

    .line 575
    :cond_18
    aget v8, v4, v6

    .line 576
    .line 577
    aget-object v9, v3, v6

    .line 578
    .line 579
    aput-wide v20, v9, v8

    .line 580
    .line 581
    aget-object v10, v1, v6

    .line 582
    .line 583
    iget-object v10, v10, Ll/bnr0;->b:Ll/knr0;

    .line 584
    .line 585
    iget-object v11, v10, Ll/knr0;->d:[I

    .line 586
    .line 587
    aget v11, v11, v8

    .line 588
    .line 589
    int-to-long v13, v11

    .line 590
    add-long v20, v20, v13

    .line 591
    .line 592
    const/16 v23, 0x1

    .line 593
    .line 594
    add-int/lit8 v8, v8, 0x1

    .line 595
    .line 596
    aput v8, v4, v6

    .line 597
    .line 598
    array-length v9, v9

    .line 599
    if-ge v8, v9, :cond_19

    .line 600
    .line 601
    iget-object v9, v10, Ll/knr0;->f:[J

    .line 602
    .line 603
    aget-wide v8, v9, v8

    .line 604
    .line 605
    aput-wide v8, v5, v6

    .line 606
    .line 607
    goto :goto_11

    .line 608
    :cond_19
    aput-boolean v23, v2, v6

    .line 609
    .line 610
    add-int/lit8 v12, v12, 0x1

    .line 611
    .line 612
    goto :goto_11

    .line 613
    :cond_1a
    iput-object v3, v0, Ll/cnr0;->v:[[J

    .line 614
    .line 615
    iget-object v1, v0, Ll/cnr0;->t:Ll/ser0;

    .line 616
    .line 617
    invoke-interface {v1}, Ll/ser0;->c()V

    .line 618
    .line 619
    .line 620
    iget-object v1, v0, Ll/cnr0;->t:Ll/ser0;

    .line 621
    .line 622
    invoke-interface {v1, v0}, Ll/ser0;->j(Ll/bgr0;)V

    .line 623
    .line 624
    .line 625
    iget-object v1, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 626
    .line 627
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->clear()V

    .line 628
    .line 629
    .line 630
    const/4 v7, 0x2

    .line 631
    iput v7, v0, Ll/cnr0;->j:I

    .line 632
    .line 633
    goto/16 :goto_0

    .line 634
    .line 635
    :cond_1b
    iget-object v1, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 636
    .line 637
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 638
    .line 639
    .line 640
    move-result v1

    .line 641
    if-nez v1, :cond_0

    .line 642
    .line 643
    iget-object v1, v0, Ll/cnr0;->g:Ljava/util/ArrayDeque;

    .line 644
    .line 645
    invoke-virtual {v1}, Ljava/util/ArrayDeque;->peek()Ljava/lang/Object;

    .line 646
    .line 647
    .line 648
    move-result-object v1

    .line 649
    check-cast v1, Ll/xlr0;

    .line 650
    .line 651
    invoke-virtual {v1, v3}, Ll/xlr0;->e(Ll/xlr0;)V

    .line 652
    .line 653
    .line 654
    goto/16 :goto_0

    .line 655
    .line 656
    :cond_1c
    iget v1, v0, Ll/cnr0;->j:I

    .line 657
    .line 658
    const/4 v7, 0x2

    .line 659
    if-eq v1, v7, :cond_1d

    .line 660
    .line 661
    invoke-virtual {v0}, Ll/cnr0;->j()V

    .line 662
    .line 663
    .line 664
    :cond_1d
    return-void
.end method

.method public final zza()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/cnr0;->x:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final zzh()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
