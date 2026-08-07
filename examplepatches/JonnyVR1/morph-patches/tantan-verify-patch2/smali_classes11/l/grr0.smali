.class public final Ll/grr0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:J

.field public b:J

.field public c:Ljava/lang/CharSequence;

.field public d:I

.field public e:F

.field public f:I

.field public g:I

.field public h:F

.field public i:I

.field public j:F

.field public k:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/grr0;->a:J

    .line 7
    .line 8
    iput-wide v0, p0, Ll/grr0;->b:J

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    iput v0, p0, Ll/grr0;->d:I

    .line 12
    .line 13
    const v0, -0x800001

    .line 14
    .line 15
    .line 16
    iput v0, p0, Ll/grr0;->e:F

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    iput v1, p0, Ll/grr0;->f:I

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput v1, p0, Ll/grr0;->g:I

    .line 23
    .line 24
    iput v0, p0, Ll/grr0;->h:F

    .line 25
    .line 26
    const/high16 v0, -0x80000000

    .line 27
    .line 28
    iput v0, p0, Ll/grr0;->i:I

    .line 29
    .line 30
    const/high16 v1, 0x3f800000    # 1.0f

    .line 31
    .line 32
    iput v1, p0, Ll/grr0;->j:F

    .line 33
    .line 34
    iput v0, p0, Ll/grr0;->k:I

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public final a()Ll/j2v0;
    .locals 14

    .line 1
    iget v0, p0, Ll/grr0;->h:F

    .line 2
    .line 3
    const v1, -0x800001

    .line 4
    .line 5
    .line 6
    cmpl-float v2, v0, v1

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    const/high16 v4, 0x3f000000    # 0.5f

    .line 10
    .line 11
    const/4 v5, 0x5

    .line 12
    const/4 v6, 0x4

    .line 13
    const/high16 v7, 0x3f800000    # 1.0f

    .line 14
    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget v0, p0, Ll/grr0;->d:I

    .line 19
    .line 20
    if-eq v0, v6, :cond_2

    .line 21
    .line 22
    if-eq v0, v5, :cond_1

    .line 23
    .line 24
    move v0, v4

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v7

    .line 27
    goto :goto_0

    .line 28
    :cond_2
    move v0, v3

    .line 29
    :goto_0
    iget v2, p0, Ll/grr0;->i:I

    .line 30
    .line 31
    const/high16 v8, -0x80000000

    .line 32
    .line 33
    const/4 v9, 0x3

    .line 34
    const/4 v10, 0x2

    .line 35
    const/4 v11, 0x1

    .line 36
    if-eq v2, v8, :cond_3

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_3
    iget v2, p0, Ll/grr0;->d:I

    .line 40
    .line 41
    if-eq v2, v11, :cond_5

    .line 42
    .line 43
    if-eq v2, v9, :cond_4

    .line 44
    .line 45
    if-eq v2, v6, :cond_5

    .line 46
    .line 47
    if-eq v2, v5, :cond_4

    .line 48
    .line 49
    move v2, v11

    .line 50
    goto :goto_1

    .line 51
    :cond_4
    move v2, v10

    .line 52
    goto :goto_1

    .line 53
    :cond_5
    const/4 v2, 0x0

    .line 54
    :goto_1
    new-instance v8, Ll/j2v0;

    .line 55
    .line 56
    invoke-direct {v8}, Ll/j2v0;-><init>()V

    .line 57
    .line 58
    .line 59
    iget v12, p0, Ll/grr0;->d:I

    .line 60
    .line 61
    const/4 v13, 0x0

    .line 62
    if-eq v12, v11, :cond_8

    .line 63
    .line 64
    if-eq v12, v10, :cond_7

    .line 65
    .line 66
    if-eq v12, v9, :cond_6

    .line 67
    .line 68
    if-eq v12, v6, :cond_8

    .line 69
    .line 70
    if-eq v12, v5, :cond_6

    .line 71
    .line 72
    new-instance v5, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v6, "Unknown textAlignment: "

    .line 75
    .line 76
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    const-string v6, "WebvttCueParser"

    .line 87
    .line 88
    invoke-static {v6, v5}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    move-object v5, v13

    .line 92
    goto :goto_2

    .line 93
    :cond_6
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_7
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_8
    sget-object v5, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 100
    .line 101
    :goto_2
    invoke-virtual {v8, v5}, Ll/j2v0;->m(Landroid/text/Layout$Alignment;)Ll/j2v0;

    .line 102
    .line 103
    .line 104
    iget v5, p0, Ll/grr0;->e:F

    .line 105
    .line 106
    iget v6, p0, Ll/grr0;->f:I

    .line 107
    .line 108
    cmpl-float v9, v5, v1

    .line 109
    .line 110
    if-eqz v9, :cond_a

    .line 111
    .line 112
    if-nez v6, :cond_a

    .line 113
    .line 114
    cmpg-float v3, v5, v3

    .line 115
    .line 116
    if-ltz v3, :cond_9

    .line 117
    .line 118
    cmpl-float v3, v5, v7

    .line 119
    .line 120
    if-lez v3, :cond_a

    .line 121
    .line 122
    :cond_9
    :goto_3
    move v1, v7

    .line 123
    goto :goto_4

    .line 124
    :cond_a
    if-nez v9, :cond_b

    .line 125
    .line 126
    if-nez v6, :cond_c

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_b
    move v1, v5

    .line 130
    :cond_c
    :goto_4
    invoke-virtual {v8, v1, v6}, Ll/j2v0;->e(FI)Ll/j2v0;

    .line 131
    .line 132
    .line 133
    iget v1, p0, Ll/grr0;->g:I

    .line 134
    .line 135
    invoke-virtual {v8, v1}, Ll/j2v0;->f(I)Ll/j2v0;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v8, v0}, Ll/j2v0;->h(F)Ll/j2v0;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v8, v2}, Ll/j2v0;->i(I)Ll/j2v0;

    .line 142
    .line 143
    .line 144
    iget v1, p0, Ll/grr0;->j:F

    .line 145
    .line 146
    if-eqz v2, :cond_10

    .line 147
    .line 148
    if-eq v2, v11, :cond_e

    .line 149
    .line 150
    if-ne v2, v10, :cond_d

    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_d
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-object v13

    .line 161
    :cond_e
    cmpg-float v2, v0, v4

    .line 162
    .line 163
    if-gtz v2, :cond_f

    .line 164
    .line 165
    add-float/2addr v0, v0

    .line 166
    goto :goto_5

    .line 167
    :cond_f
    sub-float/2addr v7, v0

    .line 168
    add-float v0, v7, v7

    .line 169
    .line 170
    goto :goto_5

    .line 171
    :cond_10
    sub-float v0, v7, v0

    .line 172
    .line 173
    :goto_5
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    invoke-virtual {v8, v0}, Ll/j2v0;->k(F)Ll/j2v0;

    .line 178
    .line 179
    .line 180
    iget v0, p0, Ll/grr0;->k:I

    .line 181
    .line 182
    invoke-virtual {v8, v0}, Ll/j2v0;->o(I)Ll/j2v0;

    .line 183
    .line 184
    .line 185
    iget-object p0, p0, Ll/grr0;->c:Ljava/lang/CharSequence;

    .line 186
    .line 187
    if-eqz p0, :cond_11

    .line 188
    .line 189
    invoke-virtual {v8, p0}, Ll/j2v0;->l(Ljava/lang/CharSequence;)Ll/j2v0;

    .line 190
    .line 191
    .line 192
    :cond_11
    return-object v8
.end method
