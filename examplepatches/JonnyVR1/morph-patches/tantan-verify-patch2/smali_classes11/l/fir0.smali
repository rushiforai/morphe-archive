.class public final Ll/fir0;
.super Ll/jir0;
.source "SourceFile"


# static fields
.field public static final e:[I


# instance fields
.field public b:Z

.field public c:Z

.field public d:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    const/16 v0, 0x5622

    .line 2
    .line 3
    const v1, 0xac44

    .line 4
    .line 5
    .line 6
    const/16 v2, 0x1588

    .line 7
    .line 8
    const/16 v3, 0x2b11

    .line 9
    .line 10
    filled-new-array {v2, v3, v0, v1}, [I

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Ll/fir0;->e:[I

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Ll/sgr0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/jir0;-><init>(Ll/sgr0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ll/bgw0;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzaff;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/fir0;->b:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_5

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    shr-int/lit8 v0, p1, 0x4

    .line 11
    .line 12
    iput v0, p0, Ll/fir0;->d:I

    .line 13
    .line 14
    const/4 v2, 0x2

    .line 15
    if-ne v0, v2, :cond_0

    .line 16
    .line 17
    shr-int/2addr p1, v2

    .line 18
    sget-object v0, Ll/fir0;->e:[I

    .line 19
    .line 20
    and-int/lit8 p1, p1, 0x3

    .line 21
    .line 22
    aget p1, v0, p1

    .line 23
    .line 24
    new-instance v0, Ll/znr0;

    .line 25
    .line 26
    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v2, "audio/mpeg"

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/znr0;->k0(I)Ll/znr0;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/znr0;->x(I)Ll/znr0;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Ll/jir0;->a:Ll/sgr0;

    .line 45
    .line 46
    invoke-interface {v0, p1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 47
    .line 48
    .line 49
    iput-boolean v1, p0, Ll/fir0;->c:Z

    .line 50
    .line 51
    goto :goto_2

    .line 52
    :cond_0
    const/4 p1, 0x7

    .line 53
    if-eq v0, p1, :cond_3

    .line 54
    .line 55
    const/16 v2, 0x8

    .line 56
    .line 57
    if-ne v0, v2, :cond_1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const/16 p1, 0xa

    .line 61
    .line 62
    if-ne v0, p1, :cond_2

    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/zzaff;

    .line 66
    .line 67
    new-instance p1, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    const-string v1, "Audio format not supported: "

    .line 70
    .line 71
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ads/zzaff;-><init>(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    throw p0

    .line 85
    :cond_3
    :goto_0
    new-instance v2, Ll/znr0;

    .line 86
    .line 87
    invoke-direct {v2}, Ll/znr0;-><init>()V

    .line 88
    .line 89
    .line 90
    if-ne v0, p1, :cond_4

    .line 91
    .line 92
    const-string p1, "audio/g711-alaw"

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    const-string p1, "audio/g711-mlaw"

    .line 96
    .line 97
    :goto_1
    invoke-virtual {v2, p1}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v2, v1}, Ll/znr0;->k0(I)Ll/znr0;

    .line 101
    .line 102
    .line 103
    const/16 p1, 0x1f40

    .line 104
    .line 105
    invoke-virtual {v2, p1}, Ll/znr0;->x(I)Ll/znr0;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2}, Ll/znr0;->D()Ll/sqr0;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iget-object v0, p0, Ll/jir0;->a:Ll/sgr0;

    .line 113
    .line 114
    invoke-interface {v0, p1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 115
    .line 116
    .line 117
    iput-boolean v1, p0, Ll/fir0;->c:Z

    .line 118
    .line 119
    :goto_2
    iput-boolean v1, p0, Ll/fir0;->b:Z

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_5
    invoke-virtual {p1, v1}, Ll/bgw0;->l(I)V

    .line 123
    .line 124
    .line 125
    :goto_3
    return v1
.end method

.method public final b(Ll/bgw0;J)Z
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget v2, v0, Ll/fir0;->d:I

    .line 6
    .line 7
    const/4 v3, 0x2

    .line 8
    const/4 v4, 0x1

    .line 9
    if-ne v2, v3, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 12
    .line 13
    .line 14
    move-result v9

    .line 15
    iget-object v2, v0, Ll/jir0;->a:Ll/sgr0;

    .line 16
    .line 17
    invoke-interface {v2, v1, v9}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 18
    .line 19
    .line 20
    iget-object v5, v0, Ll/jir0;->a:Ll/sgr0;

    .line 21
    .line 22
    const/4 v10, 0x0

    .line 23
    const/4 v11, 0x0

    .line 24
    const/4 v8, 0x1

    .line 25
    move-wide/from16 v6, p2

    .line 26
    .line 27
    invoke-interface/range {v5 .. v11}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 28
    .line 29
    .line 30
    return v4

    .line 31
    :cond_0
    invoke-virtual {v1}, Ll/bgw0;->B()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/4 v3, 0x0

    .line 36
    if-nez v2, :cond_2

    .line 37
    .line 38
    iget-boolean v5, v0, Ll/fir0;->c:Z

    .line 39
    .line 40
    if-eqz v5, :cond_1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    new-array v5, v2, [B

    .line 48
    .line 49
    invoke-virtual {v1, v5, v3, v2}, Ll/bgw0;->g([BII)V

    .line 50
    .line 51
    .line 52
    invoke-static {v5}, Ll/cdr0;->a([B)Ll/bdr0;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Ll/znr0;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/znr0;-><init>()V

    .line 59
    .line 60
    .line 61
    const-string v6, "audio/mp4a-latm"

    .line 62
    .line 63
    invoke-virtual {v2, v6}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 64
    .line 65
    .line 66
    iget-object v6, v1, Ll/bdr0;->c:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v2, v6}, Ll/znr0;->l0(Ljava/lang/String;)Ll/znr0;

    .line 69
    .line 70
    .line 71
    iget v6, v1, Ll/bdr0;->b:I

    .line 72
    .line 73
    invoke-virtual {v2, v6}, Ll/znr0;->k0(I)Ll/znr0;

    .line 74
    .line 75
    .line 76
    iget v1, v1, Ll/bdr0;->a:I

    .line 77
    .line 78
    invoke-virtual {v2, v1}, Ll/znr0;->x(I)Ll/znr0;

    .line 79
    .line 80
    .line 81
    invoke-static {v5}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v2, v1}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v2}, Ll/znr0;->D()Ll/sqr0;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    iget-object v2, v0, Ll/jir0;->a:Ll/sgr0;

    .line 93
    .line 94
    invoke-interface {v2, v1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 95
    .line 96
    .line 97
    iput-boolean v4, v0, Ll/fir0;->c:Z

    .line 98
    .line 99
    return v3

    .line 100
    :cond_2
    :goto_0
    iget v5, v0, Ll/fir0;->d:I

    .line 101
    .line 102
    const/16 v6, 0xa

    .line 103
    .line 104
    if-ne v5, v6, :cond_4

    .line 105
    .line 106
    if-ne v2, v4, :cond_3

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    return v3

    .line 110
    :cond_4
    :goto_1
    invoke-virtual {v1}, Ll/bgw0;->q()I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    iget-object v3, v0, Ll/jir0;->a:Ll/sgr0;

    .line 115
    .line 116
    invoke-interface {v3, v1, v2}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 117
    .line 118
    .line 119
    iget-object v12, v0, Ll/jir0;->a:Ll/sgr0;

    .line 120
    .line 121
    const/16 v17, 0x0

    .line 122
    .line 123
    const/16 v18, 0x0

    .line 124
    .line 125
    const/4 v15, 0x1

    .line 126
    move-wide/from16 v13, p2

    .line 127
    .line 128
    move/from16 v16, v2

    .line 129
    .line 130
    invoke-interface/range {v12 .. v18}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 131
    .line 132
    .line 133
    return v4
.end method
