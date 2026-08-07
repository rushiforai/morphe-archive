.class public final Ll/jdr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/List;

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:I

.field public final j:F

.field public final k:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;IIIIIIIIFLjava/lang/String;)V
    .locals 0
    .param p11    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jdr0;->a:Ljava/util/List;

    .line 5
    .line 6
    iput p2, p0, Ll/jdr0;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/jdr0;->c:I

    .line 9
    .line 10
    iput p4, p0, Ll/jdr0;->d:I

    .line 11
    .line 12
    iput p5, p0, Ll/jdr0;->e:I

    .line 13
    .line 14
    iput p6, p0, Ll/jdr0;->f:I

    .line 15
    .line 16
    iput p7, p0, Ll/jdr0;->g:I

    .line 17
    .line 18
    iput p8, p0, Ll/jdr0;->h:I

    .line 19
    .line 20
    iput p9, p0, Ll/jdr0;->i:I

    .line 21
    .line 22
    iput p10, p0, Ll/jdr0;->j:F

    .line 23
    .line 24
    iput-object p11, p0, Ll/jdr0;->k:Ljava/lang/String;

    .line 25
    .line 26
    return-void
.end method

.method public static a(Ll/bgw0;)Ll/jdr0;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    const/4 v0, 0x4

    .line 2
    :try_start_0
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x3

    .line 10
    and-int/2addr v0, v1

    .line 11
    add-int/lit8 v4, v0, 0x1

    .line 12
    .line 13
    if-eq v4, v1, :cond_3

    .line 14
    .line 15
    new-instance v3, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    and-int/lit8 v1, v1, 0x1f

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    move v5, v2

    .line 28
    :goto_0
    if-ge v5, v1, :cond_0

    .line 29
    .line 30
    invoke-static {p0}, Ll/jdr0;->b(Ll/bgw0;)[B

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    add-int/lit8 v5, v5, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/bgw0;->B()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    move v6, v2

    .line 45
    :goto_1
    if-ge v6, v5, :cond_1

    .line 46
    .line 47
    invoke-static {p0}, Ll/jdr0;->b(Ll/bgw0;)[B

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    add-int/lit8 v6, v6, 0x1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    if-lez v1, :cond_2

    .line 58
    .line 59
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, [B

    .line 64
    .line 65
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, [B

    .line 70
    .line 71
    array-length p0, p0

    .line 72
    add-int/lit8 v0, v0, 0x2

    .line 73
    .line 74
    invoke-static {v1, v0, p0}, Ll/w3x0;->e([BII)Ll/p2x0;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    iget v0, p0, Ll/p2x0;->e:I

    .line 79
    .line 80
    iget v1, p0, Ll/p2x0;->f:I

    .line 81
    .line 82
    iget v2, p0, Ll/p2x0;->h:I

    .line 83
    .line 84
    add-int/lit8 v2, v2, 0x8

    .line 85
    .line 86
    iget v5, p0, Ll/p2x0;->i:I

    .line 87
    .line 88
    add-int/lit8 v5, v5, 0x8

    .line 89
    .line 90
    iget v6, p0, Ll/p2x0;->j:I

    .line 91
    .line 92
    iget v7, p0, Ll/p2x0;->k:I

    .line 93
    .line 94
    iget v8, p0, Ll/p2x0;->l:I

    .line 95
    .line 96
    iget v9, p0, Ll/p2x0;->g:F

    .line 97
    .line 98
    iget v10, p0, Ll/p2x0;->a:I

    .line 99
    .line 100
    iget v11, p0, Ll/p2x0;->b:I

    .line 101
    .line 102
    iget p0, p0, Ll/p2x0;->c:I

    .line 103
    .line 104
    invoke-static {v10, v11, p0}, Ll/rgv0;->a(III)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    move v10, v7

    .line 109
    move v11, v8

    .line 110
    move v12, v9

    .line 111
    move v7, v2

    .line 112
    move v8, v5

    .line 113
    move v9, v6

    .line 114
    move v5, v0

    .line 115
    move v6, v1

    .line 116
    :goto_2
    move-object v13, p0

    .line 117
    goto :goto_3

    .line 118
    :cond_2
    const/4 v0, -0x1

    .line 119
    const/4 p0, 0x0

    .line 120
    const/high16 v9, 0x3f800000    # 1.0f

    .line 121
    .line 122
    move v5, v0

    .line 123
    move v6, v5

    .line 124
    move v7, v6

    .line 125
    move v8, v7

    .line 126
    move v10, v8

    .line 127
    move v11, v10

    .line 128
    move v12, v9

    .line 129
    move v9, v11

    .line 130
    goto :goto_2

    .line 131
    :goto_3
    new-instance v2, Ll/jdr0;

    .line 132
    .line 133
    invoke-direct/range {v2 .. v13}, Ll/jdr0;-><init>(Ljava/util/List;IIIIIIIIFLjava/lang/String;)V

    .line 134
    .line 135
    .line 136
    return-object v2

    .line 137
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 138
    .line 139
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 140
    .line 141
    .line 142
    throw p0
    :try_end_0
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    :catch_0
    move-exception v0

    .line 144
    move-object p0, v0

    .line 145
    const-string v0, "Error parsing AVC config"

    .line 146
    .line 147
    invoke-static {v0, p0}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    throw p0
.end method

.method public static b(Ll/bgw0;)[B
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/bgw0;->F()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/bgw0;->s()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0}, Ll/bgw0;->l(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/bgw0;->m()[B

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0, v1, v0}, Ll/rgv0;->c([BII)[B

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method
