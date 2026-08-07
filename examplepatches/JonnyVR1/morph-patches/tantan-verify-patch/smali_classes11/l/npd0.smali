.class public final Ll/npd0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/aqd0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final h:[I

.field public static final i:[I


# instance fields
.field public final a:Ll/zpd0;

.field public final b:Z

.field public final c:I

.field public d:Ll/qfj0;

.field public e:J

.field public f:J

.field public g:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Ll/npd0;->h:[I

    .line 9
    .line 10
    new-array v0, v0, [I

    .line 11
    .line 12
    fill-array-data v0, :array_1

    .line 13
    .line 14
    .line 15
    sput-object v0, Ll/npd0;->i:[I

    .line 16
    .line 17
    return-void

    .line 18
    nop

    :array_0
    .array-data 4
        0xd
        0xe
        0x10
        0x12
        0x14
        0x15
        0x1b
        0x20
        0x6
        0x7
        0x6
        0x6
        0x1
        0x1
        0x1
        0x1
    .end array-data

    :array_1
    .array-data 4
        0x12
        0x18
        0x21
        0x25
        0x29
        0x2f
        0x33
        0x3b
        0x3d
        0x6
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data
.end method

.method public constructor <init>(Ll/zpd0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/npd0;->a:Ll/zpd0;

    .line 5
    .line 6
    iget-object v0, p1, Ll/zpd0;->c:Lcom/google/android/exoplayer2/k;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/google/android/exoplayer2/k;->l:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "audio/amr-wb"

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput-boolean v0, p0, Ll/npd0;->b:Z

    .line 21
    .line 22
    iget p1, p1, Ll/zpd0;->b:I

    .line 23
    .line 24
    iput p1, p0, Ll/npd0;->c:I

    .line 25
    .line 26
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    iput-wide v0, p0, Ll/npd0;->e:J

    .line 32
    .line 33
    const/4 p1, -0x1

    .line 34
    iput p1, p0, Ll/npd0;->g:I

    .line 35
    .line 36
    const-wide/16 v0, 0x0

    .line 37
    .line 38
    iput-wide v0, p0, Ll/npd0;->f:J

    .line 39
    .line 40
    return-void
.end method

.method public static e(IZ)I
    .locals 3

    .line 1
    if-ltz p0, :cond_0

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    if-le p0, v0, :cond_1

    .line 6
    .line 7
    :cond_0
    const/16 v0, 0xf

    .line 8
    .line 9
    if-ne p0, v0, :cond_2

    .line 10
    .line 11
    :cond_1
    const/4 v0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_2
    const/4 v0, 0x0

    .line 14
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "Illegal AMR "

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    if-eqz p1, :cond_3

    .line 22
    .line 23
    const-string v2, "WB"

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_3
    const-string v2, "NB"

    .line 27
    .line 28
    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v2, " frame type "

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v0, v1}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    if-eqz p1, :cond_4

    .line 47
    .line 48
    sget-object p1, Ll/npd0;->i:[I

    .line 49
    .line 50
    aget p0, p1, p0

    .line 51
    .line 52
    return p0

    .line 53
    :cond_4
    sget-object p1, Ll/npd0;->h:[I

    .line 54
    .line 55
    aget p0, p1, p0

    .line 56
    .line 57
    return p0
.end method


# virtual methods
.method public a(JJ)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/npd0;->e:J

    .line 2
    .line 3
    iput-wide p3, p0, Ll/npd0;->f:J

    .line 4
    .line 5
    return-void
.end method

.method public b(Ll/ig60;JIZ)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p4

    .line 6
    .line 7
    iget-object v3, v0, Ll/npd0;->d:Ll/qfj0;

    .line 8
    .line 9
    invoke-static {v3}, Ll/w11;->i(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget v3, v0, Ll/npd0;->g:I

    .line 13
    .line 14
    const/4 v4, -0x1

    .line 15
    if-eq v3, v4, :cond_0

    .line 16
    .line 17
    invoke-static {v3}, Ll/wpd0;->b(I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eq v2, v3, :cond_0

    .line 22
    .line 23
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    const-string v4, "Received RTP packet with unexpected sequence number. Expected: %d; received: %d."

    .line 36
    .line 37
    invoke-static {v4, v3}, Ll/bmk0;->D(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const-string v4, "RtpAmrReader"

    .line 42
    .line 43
    invoke-static {v4, v3}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    const/4 v3, 0x1

    .line 47
    invoke-virtual {v1, v3}, Ll/ig60;->V(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ll/ig60;->j()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    shr-int/lit8 v4, v4, 0x3

    .line 55
    .line 56
    and-int/lit8 v4, v4, 0xf

    .line 57
    .line 58
    iget-boolean v5, v0, Ll/npd0;->b:Z

    .line 59
    .line 60
    invoke-static {v4, v5}, Ll/npd0;->e(IZ)I

    .line 61
    .line 62
    .line 63
    move-result v4

    .line 64
    invoke-virtual {v1}, Ll/ig60;->a()I

    .line 65
    .line 66
    .line 67
    move-result v9

    .line 68
    if-ne v9, v4, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    const/4 v3, 0x0

    .line 72
    :goto_0
    const-string v4, "compound payload not supported currently"

    .line 73
    .line 74
    invoke-static {v3, v4}, Ll/w11;->b(ZLjava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    iget-object v3, v0, Ll/npd0;->d:Ll/qfj0;

    .line 78
    .line 79
    invoke-interface {v3, v1, v9}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 80
    .line 81
    .line 82
    iget-wide v10, v0, Ll/npd0;->f:J

    .line 83
    .line 84
    iget-wide v14, v0, Ll/npd0;->e:J

    .line 85
    .line 86
    iget v1, v0, Ll/npd0;->c:I

    .line 87
    .line 88
    move-wide/from16 v12, p2

    .line 89
    .line 90
    move/from16 v16, v1

    .line 91
    .line 92
    invoke-static/range {v10 .. v16}, Ll/cqd0;->a(JJJI)J

    .line 93
    .line 94
    .line 95
    move-result-wide v6

    .line 96
    iget-object v5, v0, Ll/npd0;->d:Ll/qfj0;

    .line 97
    .line 98
    const/4 v10, 0x0

    .line 99
    const/4 v11, 0x0

    .line 100
    const/4 v8, 0x1

    .line 101
    invoke-interface/range {v5 .. v11}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 102
    .line 103
    .line 104
    iput v2, v0, Ll/npd0;->g:I

    .line 105
    .line 106
    return-void
.end method

.method public c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/npd0;->e:J

    .line 2
    .line 3
    return-void
.end method

.method public d(Ll/bsf;I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-interface {p1, p2, v0}, Ll/bsf;->b(II)Ll/qfj0;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iput-object p1, p0, Ll/npd0;->d:Ll/qfj0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/npd0;->a:Ll/zpd0;

    .line 9
    .line 10
    iget-object p0, p0, Ll/zpd0;->c:Lcom/google/android/exoplayer2/k;

    .line 11
    .line 12
    invoke-interface {p1, p0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
