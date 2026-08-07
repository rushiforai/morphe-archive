.class public final synthetic Ll/x3z0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g5z0;


# instance fields
.field public final synthetic a:Ll/h4z0;

.field public final synthetic b:[I


# direct methods
.method public synthetic constructor <init>(Ll/h4z0;[I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/x3z0;->a:Ll/h4z0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/x3z0;->b:[I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(ILl/t2u0;[I)Ljava/util/List;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v2, p2

    .line 4
    .line 5
    sget-object v1, Ll/l5z0;->k:Lcom/google/android/gms/internal/ads/c3;

    .line 6
    .line 7
    iget-object v4, v0, Ll/x3z0;->a:Ll/h4z0;

    .line 8
    .line 9
    iget-object v0, v0, Ll/x3z0;->b:[I

    .line 10
    .line 11
    aget v6, v0, p1

    .line 12
    .line 13
    iget v0, v4, Ll/scu0;->i:I

    .line 14
    .line 15
    iget v1, v4, Ll/scu0;->j:I

    .line 16
    .line 17
    iget-boolean v3, v4, Ll/scu0;->k:Z

    .line 18
    .line 19
    const/4 v10, 0x0

    .line 20
    const v11, 0x7fffffff

    .line 21
    .line 22
    .line 23
    if-eq v0, v11, :cond_8

    .line 24
    .line 25
    if-ne v1, v11, :cond_0

    .line 26
    .line 27
    move v8, v11

    .line 28
    const/16 v16, -0x1

    .line 29
    .line 30
    goto/16 :goto_6

    .line 31
    .line 32
    :cond_0
    move v5, v10

    .line 33
    move v7, v11

    .line 34
    :goto_0
    iget v12, v2, Ll/t2u0;->a:I

    .line 35
    .line 36
    if-gtz v5, :cond_7

    .line 37
    .line 38
    invoke-virtual {v2, v10}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    iget v12, v5, Ll/sqr0;->q:I

    .line 43
    .line 44
    if-lez v12, :cond_5

    .line 45
    .line 46
    iget v13, v5, Ll/sqr0;->r:I

    .line 47
    .line 48
    if-lez v13, :cond_5

    .line 49
    .line 50
    if-eqz v3, :cond_3

    .line 51
    .line 52
    if-gt v12, v13, :cond_1

    .line 53
    .line 54
    move v14, v10

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    const/4 v14, 0x1

    .line 57
    :goto_1
    if-gt v0, v1, :cond_2

    .line 58
    .line 59
    move v15, v10

    .line 60
    goto :goto_2

    .line 61
    :cond_2
    const/4 v15, 0x1

    .line 62
    :goto_2
    if-eq v14, v15, :cond_3

    .line 63
    .line 64
    move v14, v0

    .line 65
    move v15, v1

    .line 66
    goto :goto_3

    .line 67
    :cond_3
    move v15, v0

    .line 68
    move v14, v1

    .line 69
    :goto_3
    mul-int v9, v12, v14

    .line 70
    .line 71
    const/16 v16, -0x1

    .line 72
    .line 73
    mul-int v8, v13, v15

    .line 74
    .line 75
    if-lt v9, v8, :cond_4

    .line 76
    .line 77
    new-instance v9, Landroid/graphics/Point;

    .line 78
    .line 79
    sget v13, Ll/mpw0;->a:I

    .line 80
    .line 81
    add-int/2addr v8, v12

    .line 82
    add-int/lit8 v8, v8, -0x1

    .line 83
    .line 84
    div-int/2addr v8, v12

    .line 85
    invoke-direct {v9, v15, v8}, Landroid/graphics/Point;-><init>(II)V

    .line 86
    .line 87
    .line 88
    goto :goto_4

    .line 89
    :cond_4
    new-instance v8, Landroid/graphics/Point;

    .line 90
    .line 91
    sget v12, Ll/mpw0;->a:I

    .line 92
    .line 93
    add-int/2addr v9, v13

    .line 94
    add-int/lit8 v9, v9, -0x1

    .line 95
    .line 96
    div-int/2addr v9, v13

    .line 97
    invoke-direct {v8, v9, v14}, Landroid/graphics/Point;-><init>(II)V

    .line 98
    .line 99
    .line 100
    move-object v9, v8

    .line 101
    :goto_4
    iget v8, v5, Ll/sqr0;->q:I

    .line 102
    .line 103
    iget v5, v5, Ll/sqr0;->r:I

    .line 104
    .line 105
    mul-int v12, v8, v5

    .line 106
    .line 107
    iget v13, v9, Landroid/graphics/Point;->x:I

    .line 108
    .line 109
    int-to-float v13, v13

    .line 110
    const v14, 0x3f7ae148    # 0.98f

    .line 111
    .line 112
    .line 113
    mul-float/2addr v13, v14

    .line 114
    float-to-int v13, v13

    .line 115
    if-lt v8, v13, :cond_6

    .line 116
    .line 117
    iget v8, v9, Landroid/graphics/Point;->y:I

    .line 118
    .line 119
    int-to-float v8, v8

    .line 120
    mul-float/2addr v8, v14

    .line 121
    float-to-int v8, v8

    .line 122
    if-lt v5, v8, :cond_6

    .line 123
    .line 124
    if-ge v12, v7, :cond_6

    .line 125
    .line 126
    move v7, v12

    .line 127
    goto :goto_5

    .line 128
    :cond_5
    const/16 v16, -0x1

    .line 129
    .line 130
    :cond_6
    :goto_5
    const/4 v5, 0x1

    .line 131
    goto :goto_0

    .line 132
    :cond_7
    const/16 v16, -0x1

    .line 133
    .line 134
    move v8, v7

    .line 135
    goto :goto_6

    .line 136
    :cond_8
    const/16 v16, -0x1

    .line 137
    .line 138
    move v8, v11

    .line 139
    :goto_6
    new-instance v9, Ll/mqw0;

    .line 140
    .line 141
    invoke-direct {v9}, Ll/mqw0;-><init>()V

    .line 142
    .line 143
    .line 144
    move v0, v10

    .line 145
    :goto_7
    iget v1, v2, Ll/t2u0;->a:I

    .line 146
    .line 147
    if-gtz v0, :cond_b

    .line 148
    .line 149
    invoke-virtual {v2, v10}, Ll/t2u0;->b(I)Ll/sqr0;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {v0}, Ll/sqr0;->a()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-eq v8, v11, :cond_a

    .line 158
    .line 159
    move/from16 v12, v16

    .line 160
    .line 161
    if-eq v0, v12, :cond_9

    .line 162
    .line 163
    if-gt v0, v8, :cond_9

    .line 164
    .line 165
    :goto_8
    const/4 v7, 0x1

    .line 166
    goto :goto_9

    .line 167
    :cond_9
    move v7, v10

    .line 168
    goto :goto_9

    .line 169
    :cond_a
    move/from16 v12, v16

    .line 170
    .line 171
    goto :goto_8

    .line 172
    :goto_9
    new-instance v0, Ll/k5z0;

    .line 173
    .line 174
    const/4 v3, 0x0

    .line 175
    aget v5, p3, v10

    .line 176
    .line 177
    move/from16 v1, p1

    .line 178
    .line 179
    invoke-direct/range {v0 .. v7}, Ll/k5z0;-><init>(ILl/t2u0;ILl/h4z0;IIZ)V

    .line 180
    .line 181
    .line 182
    invoke-virtual {v9, v0}, Ll/mqw0;->g(Ljava/lang/Object;)Ll/mqw0;

    .line 183
    .line 184
    .line 185
    move-object/from16 v2, p2

    .line 186
    .line 187
    move/from16 v16, v12

    .line 188
    .line 189
    const/4 v0, 0x1

    .line 190
    goto :goto_7

    .line 191
    :cond_b
    invoke-virtual {v9}, Ll/mqw0;->j()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    return-object v0
.end method
