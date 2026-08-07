.class public final Ll/ezf0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:D

.field public b:D

.field public c:Z

.field public d:D

.field public e:D

.field public f:D

.field public g:D

.field public h:D

.field public i:D

.field public final j:Ll/bge$p;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide v0, 0x4097700000000000L    # 1500.0

    .line 41
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    iput-wide v0, p0, Ll/ezf0;->a:D

    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    .line 42
    iput-wide v0, p0, Ll/ezf0;->b:D

    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, Ll/ezf0;->c:Z

    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 44
    iput-wide v0, p0, Ll/ezf0;->i:D

    .line 45
    new-instance v0, Ll/bge$p;

    invoke-direct {v0}, Ll/bge$p;-><init>()V

    iput-object v0, p0, Ll/ezf0;->j:Ll/bge$p;

    return-void
.end method

.method public constructor <init>(F)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide v0, 0x4097700000000000L    # 1500.0

    .line 5
    .line 6
    .line 7
    .line 8
    .line 9
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iput-wide v0, p0, Ll/ezf0;->a:D

    .line 14
    .line 15
    const-wide/high16 v0, 0x3fe0000000000000L    # 0.5

    .line 16
    .line 17
    iput-wide v0, p0, Ll/ezf0;->b:D

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-boolean v0, p0, Ll/ezf0;->c:Z

    .line 21
    .line 22
    const-wide v0, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    iput-wide v0, p0, Ll/ezf0;->i:D

    .line 28
    .line 29
    new-instance v0, Ll/bge$p;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/bge$p;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/ezf0;->j:Ll/bge$p;

    .line 35
    .line 36
    float-to-double v0, p1

    .line 37
    iput-wide v0, p0, Ll/ezf0;->i:D

    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public a()F
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/ezf0;->i:D

    .line 2
    .line 3
    double-to-float p0, v0

    .line 4
    return p0
.end method

.method public final b()V
    .locals 8

    .line 1
    iget-boolean v0, p0, Ll/ezf0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-wide v0, p0, Ll/ezf0;->i:D

    .line 7
    .line 8
    const-wide v2, 0x7fefffffffffffffL    # Double.MAX_VALUE

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    cmpl-double v0, v0, v2

    .line 14
    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    iget-wide v0, p0, Ll/ezf0;->b:D

    .line 18
    .line 19
    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    .line 20
    .line 21
    cmpl-double v4, v0, v2

    .line 22
    .line 23
    if-lez v4, :cond_1

    .line 24
    .line 25
    neg-double v4, v0

    .line 26
    iget-wide v6, p0, Ll/ezf0;->a:D

    .line 27
    .line 28
    mul-double/2addr v4, v6

    .line 29
    mul-double/2addr v0, v0

    .line 30
    sub-double/2addr v0, v2

    .line 31
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    mul-double/2addr v6, v0

    .line 36
    add-double/2addr v4, v6

    .line 37
    iput-wide v4, p0, Ll/ezf0;->f:D

    .line 38
    .line 39
    iget-wide v0, p0, Ll/ezf0;->b:D

    .line 40
    .line 41
    neg-double v4, v0

    .line 42
    iget-wide v6, p0, Ll/ezf0;->a:D

    .line 43
    .line 44
    mul-double/2addr v4, v6

    .line 45
    mul-double/2addr v0, v0

    .line 46
    sub-double/2addr v0, v2

    .line 47
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    mul-double/2addr v6, v0

    .line 52
    sub-double/2addr v4, v6

    .line 53
    iput-wide v4, p0, Ll/ezf0;->g:D

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    const-wide/16 v4, 0x0

    .line 57
    .line 58
    cmpl-double v4, v0, v4

    .line 59
    .line 60
    if-ltz v4, :cond_2

    .line 61
    .line 62
    cmpg-double v4, v0, v2

    .line 63
    .line 64
    if-gez v4, :cond_2

    .line 65
    .line 66
    iget-wide v4, p0, Ll/ezf0;->a:D

    .line 67
    .line 68
    mul-double/2addr v0, v0

    .line 69
    sub-double/2addr v2, v0

    .line 70
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 71
    .line 72
    .line 73
    move-result-wide v0

    .line 74
    mul-double/2addr v4, v0

    .line 75
    iput-wide v4, p0, Ll/ezf0;->h:D

    .line 76
    .line 77
    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 78
    iput-boolean v0, p0, Ll/ezf0;->c:Z

    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    const-string p0, "Error: Final position of the spring must be set before the animation starts"

    .line 82
    .line 83
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public c(FF)Z
    .locals 4
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    float-to-double v0, p2

    .line 6
    iget-wide v2, p0, Ll/ezf0;->e:D

    .line 7
    .line 8
    cmpg-double p2, v0, v2

    .line 9
    .line 10
    if-gez p2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ezf0;->a()F

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    sub-float/2addr p1, p2

    .line 17
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    float-to-double p1, p1

    .line 22
    iget-wide v0, p0, Ll/ezf0;->d:D

    .line 23
    .line 24
    cmpg-double p0, p1, v0

    .line 25
    .line 26
    if-gez p0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method public d(F)Ll/ezf0;
    .locals 2
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-ltz v0, :cond_0

    .line 5
    .line 6
    float-to-double v0, p1

    .line 7
    iput-wide v0, p0, Ll/ezf0;->b:D

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Ll/ezf0;->c:Z

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const-string p0, "Damping ratio must be non-negative"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public e(F)Ll/ezf0;
    .locals 2

    .line 1
    float-to-double v0, p1

    .line 2
    iput-wide v0, p0, Ll/ezf0;->i:D

    .line 3
    .line 4
    return-object p0
.end method

.method public f(F)Ll/ezf0;
    .locals 2
    .param p1    # F
        .annotation build Landroidx/annotation/FloatRange;
            from = 0.0
            fromInclusive = false
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    if-lez v0, :cond_0

    .line 5
    .line 6
    float-to-double v0, p1

    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iput-wide v0, p0, Ll/ezf0;->a:D

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Ll/ezf0;->c:Z

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_0
    const-string p0, "Spring stiffness constant must be positive."

    .line 18
    .line 19
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public g(D)V
    .locals 2

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Math;->abs(D)D

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iput-wide p1, p0, Ll/ezf0;->d:D

    .line 6
    .line 7
    const-wide v0, 0x404f400000000000L    # 62.5

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    mul-double/2addr p1, v0

    .line 13
    iput-wide p1, p0, Ll/ezf0;->e:D

    .line 14
    .line 15
    return-void
.end method

.method public h(DDJ)Ll/bge$p;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ezf0;->b()V

    .line 4
    .line 5
    .line 6
    move-wide/from16 v1, p5

    .line 7
    .line 8
    long-to-double v1, v1

    .line 9
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    div-double/2addr v1, v3

    .line 15
    iget-wide v3, v0, Ll/ezf0;->i:D

    .line 16
    .line 17
    sub-double v3, p1, v3

    .line 18
    .line 19
    iget-wide v5, v0, Ll/ezf0;->b:D

    .line 20
    .line 21
    const-wide/high16 v7, 0x3ff0000000000000L    # 1.0

    .line 22
    .line 23
    cmpl-double v9, v5, v7

    .line 24
    .line 25
    const-wide v10, 0x4005bf0a8b145769L    # Math.E

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    if-lez v9, :cond_0

    .line 31
    .line 32
    iget-wide v5, v0, Ll/ezf0;->g:D

    .line 33
    .line 34
    mul-double v7, v5, v3

    .line 35
    .line 36
    sub-double v7, v7, p3

    .line 37
    .line 38
    iget-wide v12, v0, Ll/ezf0;->f:D

    .line 39
    .line 40
    sub-double v14, v5, v12

    .line 41
    .line 42
    div-double/2addr v7, v14

    .line 43
    sub-double v7, v3, v7

    .line 44
    .line 45
    mul-double/2addr v3, v5

    .line 46
    sub-double v3, v3, p3

    .line 47
    .line 48
    sub-double v12, v5, v12

    .line 49
    .line 50
    div-double/2addr v3, v12

    .line 51
    mul-double/2addr v5, v1

    .line 52
    invoke-static {v10, v11, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 53
    .line 54
    .line 55
    move-result-wide v5

    .line 56
    mul-double/2addr v5, v7

    .line 57
    iget-wide v12, v0, Ll/ezf0;->f:D

    .line 58
    .line 59
    mul-double/2addr v12, v1

    .line 60
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    .line 61
    .line 62
    .line 63
    move-result-wide v12

    .line 64
    mul-double/2addr v12, v3

    .line 65
    add-double/2addr v5, v12

    .line 66
    iget-wide v12, v0, Ll/ezf0;->g:D

    .line 67
    .line 68
    mul-double/2addr v7, v12

    .line 69
    mul-double/2addr v12, v1

    .line 70
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    .line 71
    .line 72
    .line 73
    move-result-wide v12

    .line 74
    mul-double/2addr v7, v12

    .line 75
    iget-wide v12, v0, Ll/ezf0;->f:D

    .line 76
    .line 77
    mul-double/2addr v3, v12

    .line 78
    mul-double/2addr v12, v1

    .line 79
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    .line 80
    .line 81
    .line 82
    move-result-wide v1

    .line 83
    mul-double/2addr v3, v1

    .line 84
    add-double/2addr v7, v3

    .line 85
    goto/16 :goto_0

    .line 86
    .line 87
    :cond_0
    cmpl-double v9, v5, v7

    .line 88
    .line 89
    if-nez v9, :cond_1

    .line 90
    .line 91
    iget-wide v5, v0, Ll/ezf0;->a:D

    .line 92
    .line 93
    mul-double v7, v5, v3

    .line 94
    .line 95
    add-double v7, p3, v7

    .line 96
    .line 97
    mul-double v12, v7, v1

    .line 98
    .line 99
    add-double/2addr v3, v12

    .line 100
    neg-double v5, v5

    .line 101
    mul-double/2addr v5, v1

    .line 102
    invoke-static {v10, v11, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 103
    .line 104
    .line 105
    move-result-wide v5

    .line 106
    mul-double/2addr v5, v3

    .line 107
    iget-wide v12, v0, Ll/ezf0;->a:D

    .line 108
    .line 109
    neg-double v12, v12

    .line 110
    mul-double/2addr v12, v1

    .line 111
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    .line 112
    .line 113
    .line 114
    move-result-wide v12

    .line 115
    mul-double/2addr v3, v12

    .line 116
    iget-wide v12, v0, Ll/ezf0;->a:D

    .line 117
    .line 118
    neg-double v14, v12

    .line 119
    mul-double/2addr v3, v14

    .line 120
    neg-double v12, v12

    .line 121
    mul-double/2addr v12, v1

    .line 122
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    .line 123
    .line 124
    .line 125
    move-result-wide v1

    .line 126
    mul-double/2addr v7, v1

    .line 127
    add-double/2addr v7, v3

    .line 128
    goto :goto_0

    .line 129
    :cond_1
    iget-wide v12, v0, Ll/ezf0;->h:D

    .line 130
    .line 131
    div-double/2addr v7, v12

    .line 132
    iget-wide v12, v0, Ll/ezf0;->a:D

    .line 133
    .line 134
    mul-double v14, v5, v12

    .line 135
    .line 136
    mul-double/2addr v14, v3

    .line 137
    add-double v14, v14, p3

    .line 138
    .line 139
    mul-double/2addr v7, v14

    .line 140
    neg-double v5, v5

    .line 141
    mul-double/2addr v5, v12

    .line 142
    mul-double/2addr v5, v1

    .line 143
    invoke-static {v10, v11, v5, v6}, Ljava/lang/Math;->pow(DD)D

    .line 144
    .line 145
    .line 146
    move-result-wide v5

    .line 147
    iget-wide v12, v0, Ll/ezf0;->h:D

    .line 148
    .line 149
    mul-double/2addr v12, v1

    .line 150
    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    .line 151
    .line 152
    .line 153
    move-result-wide v12

    .line 154
    mul-double/2addr v12, v3

    .line 155
    iget-wide v14, v0, Ll/ezf0;->h:D

    .line 156
    .line 157
    mul-double/2addr v14, v1

    .line 158
    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    .line 159
    .line 160
    .line 161
    move-result-wide v14

    .line 162
    mul-double/2addr v14, v7

    .line 163
    add-double/2addr v12, v14

    .line 164
    mul-double/2addr v5, v12

    .line 165
    iget-wide v12, v0, Ll/ezf0;->a:D

    .line 166
    .line 167
    neg-double v14, v12

    .line 168
    mul-double/2addr v14, v5

    .line 169
    iget-wide v10, v0, Ll/ezf0;->b:D

    .line 170
    .line 171
    mul-double/2addr v14, v10

    .line 172
    neg-double v9, v10

    .line 173
    mul-double/2addr v9, v12

    .line 174
    mul-double/2addr v9, v1

    .line 175
    const-wide v11, 0x4005bf0a8b145769L    # Math.E

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->pow(DD)D

    .line 181
    .line 182
    .line 183
    move-result-wide v9

    .line 184
    iget-wide v11, v0, Ll/ezf0;->h:D

    .line 185
    .line 186
    move-wide/from16 p5, v1

    .line 187
    .line 188
    neg-double v1, v11

    .line 189
    mul-double/2addr v1, v3

    .line 190
    mul-double v11, v11, p5

    .line 191
    .line 192
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 193
    .line 194
    .line 195
    move-result-wide v3

    .line 196
    mul-double/2addr v1, v3

    .line 197
    iget-wide v3, v0, Ll/ezf0;->h:D

    .line 198
    .line 199
    mul-double/2addr v7, v3

    .line 200
    mul-double v3, v3, p5

    .line 201
    .line 202
    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    .line 203
    .line 204
    .line 205
    move-result-wide v3

    .line 206
    mul-double/2addr v7, v3

    .line 207
    add-double/2addr v1, v7

    .line 208
    mul-double/2addr v9, v1

    .line 209
    add-double v7, v14, v9

    .line 210
    .line 211
    :goto_0
    iget-object v1, v0, Ll/ezf0;->j:Ll/bge$p;

    .line 212
    .line 213
    iget-wide v2, v0, Ll/ezf0;->i:D

    .line 214
    .line 215
    add-double/2addr v5, v2

    .line 216
    double-to-float v0, v5

    .line 217
    iput v0, v1, Ll/bge$p;->a:F

    .line 218
    .line 219
    double-to-float v0, v7

    .line 220
    iput v0, v1, Ll/bge$p;->b:F

    .line 221
    .line 222
    return-object v1
.end method
