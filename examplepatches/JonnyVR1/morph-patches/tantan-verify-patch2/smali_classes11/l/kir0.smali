.class public final Ll/kir0;
.super Ll/jir0;
.source "SourceFile"


# instance fields
.field public final b:Ll/bgw0;

.field public final c:Ll/bgw0;

.field public d:I

.field public e:Z

.field public f:Z

.field public g:I


# direct methods
.method public constructor <init>(Ll/sgr0;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/jir0;-><init>(Ll/sgr0;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/bgw0;

    .line 5
    .line 6
    sget-object v0, Ll/w3x0;->a:[B

    .line 7
    .line 8
    invoke-direct {p1, v0}, Ll/bgw0;-><init>([B)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/kir0;->b:Ll/bgw0;

    .line 12
    .line 13
    new-instance p1, Ll/bgw0;

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    invoke-direct {p1, v0}, Ll/bgw0;-><init>(I)V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Ll/kir0;->c:Ll/bgw0;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public final a(Ll/bgw0;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzaff;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    shr-int/lit8 v0, p1, 0x4

    .line 6
    .line 7
    and-int/lit8 p1, p1, 0xf

    .line 8
    .line 9
    const/4 v1, 0x7

    .line 10
    if-ne p1, v1, :cond_1

    .line 11
    .line 12
    iput v0, p0, Ll/kir0;->g:I

    .line 13
    .line 14
    const/4 p0, 0x5

    .line 15
    if-eq v0, p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0

    .line 21
    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/ads/zzaff;

    .line 22
    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string v1, "Video format not supported: "

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ads/zzaff;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0
.end method

.method public final b(Ll/bgw0;J)Z
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzcc;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ll/bgw0;->w()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    int-to-long v1, v1

    .line 10
    const/4 v3, 0x1

    .line 11
    const/4 v4, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-boolean v0, p0, Ll/kir0;->e:Z

    .line 15
    .line 16
    if-nez v0, :cond_4

    .line 17
    .line 18
    new-instance v0, Ll/bgw0;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    new-array v1, v1, [B

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ll/bgw0;-><init>([B)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {p1, v1, v4, v2}, Ll/bgw0;->g([BII)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/jdr0;->a(Ll/bgw0;)Ll/jdr0;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget v0, p1, Ll/jdr0;->b:I

    .line 45
    .line 46
    iput v0, p0, Ll/kir0;->d:I

    .line 47
    .line 48
    new-instance v0, Ll/znr0;

    .line 49
    .line 50
    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v1, "video/avc"

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 56
    .line 57
    .line 58
    iget-object v1, p1, Ll/jdr0;->k:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ll/znr0;->l0(Ljava/lang/String;)Ll/znr0;

    .line 61
    .line 62
    .line 63
    iget v1, p1, Ll/jdr0;->c:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ll/znr0;->C(I)Ll/znr0;

    .line 66
    .line 67
    .line 68
    iget v1, p1, Ll/jdr0;->d:I

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ll/znr0;->i(I)Ll/znr0;

    .line 71
    .line 72
    .line 73
    iget v1, p1, Ll/jdr0;->j:F

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ll/znr0;->s(F)Ll/znr0;

    .line 76
    .line 77
    .line 78
    iget-object p1, p1, Ll/jdr0;->a:Ljava/util/List;

    .line 79
    .line 80
    invoke-virtual {v0, p1}, Ll/znr0;->l(Ljava/util/List;)Ll/znr0;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iget-object v0, p0, Ll/jir0;->a:Ll/sgr0;

    .line 88
    .line 89
    invoke-interface {v0, p1}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 90
    .line 91
    .line 92
    iput-boolean v3, p0, Ll/kir0;->e:Z

    .line 93
    .line 94
    return v4

    .line 95
    :cond_0
    if-ne v0, v3, :cond_4

    .line 96
    .line 97
    iget-boolean v0, p0, Ll/kir0;->e:Z

    .line 98
    .line 99
    if-eqz v0, :cond_4

    .line 100
    .line 101
    iget v0, p0, Ll/kir0;->g:I

    .line 102
    .line 103
    if-ne v0, v3, :cond_1

    .line 104
    .line 105
    move v0, v3

    .line 106
    goto :goto_0

    .line 107
    :cond_1
    move v0, v4

    .line 108
    :goto_0
    iget-boolean v5, p0, Ll/kir0;->f:Z

    .line 109
    .line 110
    if-nez v5, :cond_2

    .line 111
    .line 112
    if-eqz v0, :cond_4

    .line 113
    .line 114
    move v9, v3

    .line 115
    goto :goto_1

    .line 116
    :cond_2
    move v9, v0

    .line 117
    :goto_1
    iget-object v0, p0, Ll/kir0;->c:Ll/bgw0;

    .line 118
    .line 119
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    aput-byte v4, v0, v4

    .line 124
    .line 125
    aput-byte v4, v0, v3

    .line 126
    .line 127
    const/4 v5, 0x2

    .line 128
    aput-byte v4, v0, v5

    .line 129
    .line 130
    iget v0, p0, Ll/kir0;->d:I

    .line 131
    .line 132
    const/4 v5, 0x4

    .line 133
    rsub-int/lit8 v0, v0, 0x4

    .line 134
    .line 135
    move v10, v4

    .line 136
    :goto_2
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    if-lez v6, :cond_3

    .line 141
    .line 142
    iget-object v6, p0, Ll/kir0;->c:Ll/bgw0;

    .line 143
    .line 144
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 145
    .line 146
    .line 147
    move-result-object v6

    .line 148
    iget v7, p0, Ll/kir0;->d:I

    .line 149
    .line 150
    invoke-virtual {p1, v6, v0, v7}, Ll/bgw0;->g([BII)V

    .line 151
    .line 152
    .line 153
    iget-object v6, p0, Ll/kir0;->c:Ll/bgw0;

    .line 154
    .line 155
    invoke-virtual {v6, v4}, Ll/bgw0;->k(I)V

    .line 156
    .line 157
    .line 158
    iget-object v6, p0, Ll/kir0;->c:Ll/bgw0;

    .line 159
    .line 160
    iget-object v7, p0, Ll/kir0;->b:Ll/bgw0;

    .line 161
    .line 162
    invoke-virtual {v6}, Ll/bgw0;->E()I

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    invoke-virtual {v7, v4}, Ll/bgw0;->k(I)V

    .line 167
    .line 168
    .line 169
    iget-object v7, p0, Ll/jir0;->a:Ll/sgr0;

    .line 170
    .line 171
    iget-object v8, p0, Ll/kir0;->b:Ll/bgw0;

    .line 172
    .line 173
    invoke-interface {v7, v8, v5}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 174
    .line 175
    .line 176
    add-int/lit8 v10, v10, 0x4

    .line 177
    .line 178
    iget-object v7, p0, Ll/jir0;->a:Ll/sgr0;

    .line 179
    .line 180
    invoke-interface {v7, p1, v6}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 181
    .line 182
    .line 183
    add-int/2addr v10, v6

    .line 184
    goto :goto_2

    .line 185
    :cond_3
    const-wide/16 v4, 0x3e8

    .line 186
    .line 187
    mul-long/2addr v1, v4

    .line 188
    add-long v7, p2, v1

    .line 189
    .line 190
    iget-object v6, p0, Ll/jir0;->a:Ll/sgr0;

    .line 191
    .line 192
    const/4 v11, 0x0

    .line 193
    const/4 v12, 0x0

    .line 194
    invoke-interface/range {v6 .. v12}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 195
    .line 196
    .line 197
    iput-boolean v3, p0, Ll/kir0;->f:Z

    .line 198
    .line 199
    return v3

    .line 200
    :cond_4
    return v4
.end method
