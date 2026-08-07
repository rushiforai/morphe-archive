.class public Ll/n9r;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/sunshine/engine/base/a;)V
    .locals 5

    .line 1
    if-eqz p0, :cond_4

    .line 2
    .line 3
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/drf0;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 16
    .line 17
    iget-object v0, v0, Ll/drf0;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_4

    .line 26
    .line 27
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 28
    .line 29
    iget v1, v0, Ll/fz0;->f:I

    .line 30
    .line 31
    if-eqz v1, :cond_4

    .line 32
    .line 33
    iget v0, v0, Ll/fz0;->g:I

    .line 34
    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    goto/16 :goto_1

    .line 38
    .line 39
    :cond_0
    sget-object v0, Lcom/sunshine/engine/base/LayoutType;->match_height:Lcom/sunshine/engine/base/LayoutType;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/sunshine/engine/base/LayoutType;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v2, p0, Lcom/sunshine/engine/base/a;->k:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Lcom/sunshine/engine/base/LayoutType;->resize(Lcom/sunshine/engine/base/a;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 58
    .line 59
    iget v0, v0, Ll/fz0;->f:I

    .line 60
    .line 61
    int-to-float v0, v0

    .line 62
    const/high16 v1, 0x3f800000    # 1.0f

    .line 63
    .line 64
    mul-float/2addr v0, v1

    .line 65
    iget-object v2, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 66
    .line 67
    iget-object v2, v2, Ll/drf0;->a:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast v2, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    int-to-float v2, v2

    .line 76
    div-float/2addr v0, v2

    .line 77
    iget-object v2, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 78
    .line 79
    iget-object v2, v2, Ll/drf0;->b:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v2, Ljava/lang/Integer;

    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    int-to-float v2, v2

    .line 88
    mul-float/2addr v2, v0

    .line 89
    iget-object v3, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 90
    .line 91
    iget v3, v3, Ll/fz0;->g:I

    .line 92
    .line 93
    int-to-float v4, v3

    .line 94
    cmpl-float v2, v2, v4

    .line 95
    .line 96
    iget-object v4, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 97
    .line 98
    if-lez v2, :cond_2

    .line 99
    .line 100
    int-to-float v0, v3

    .line 101
    mul-float/2addr v0, v1

    .line 102
    iget-object v1, v4, Ll/drf0;->b:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast v1, Ljava/lang/Integer;

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    int-to-float v1, v1

    .line 111
    div-float/2addr v0, v1

    .line 112
    goto :goto_0

    .line 113
    :cond_2
    int-to-float v2, v3

    .line 114
    mul-float/2addr v2, v1

    .line 115
    iget-object v1, v4, Ll/drf0;->b:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast v1, Ljava/lang/Integer;

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    int-to-float v1, v1

    .line 124
    div-float/2addr v2, v1

    .line 125
    iget-object v1, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 126
    .line 127
    iget-object v1, v1, Ll/drf0;->a:Ljava/lang/Object;

    .line 128
    .line 129
    check-cast v1, Ljava/lang/Integer;

    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    int-to-float v1, v1

    .line 136
    mul-float/2addr v1, v2

    .line 137
    iget-object v3, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 138
    .line 139
    iget v3, v3, Ll/fz0;->f:I

    .line 140
    .line 141
    int-to-float v3, v3

    .line 142
    cmpl-float v1, v1, v3

    .line 143
    .line 144
    if-lez v1, :cond_3

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_3
    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    :goto_0
    iput v0, p0, Lcom/sunshine/engine/base/a;->g:F

    .line 152
    .line 153
    iget-object v1, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 154
    .line 155
    iget-object v2, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 156
    .line 157
    iget-object v2, v2, Ll/drf0;->a:Ljava/lang/Object;

    .line 158
    .line 159
    check-cast v2, Ljava/lang/Integer;

    .line 160
    .line 161
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    int-to-float v2, v2

    .line 166
    mul-float/2addr v0, v2

    .line 167
    float-to-int v0, v0

    .line 168
    iput v0, v1, Ll/fz0;->f:I

    .line 169
    .line 170
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 171
    .line 172
    iget v1, p0, Lcom/sunshine/engine/base/a;->g:F

    .line 173
    .line 174
    iget-object v2, p0, Lcom/sunshine/engine/base/a;->h:Ll/drf0;

    .line 175
    .line 176
    iget-object v2, v2, Ll/drf0;->b:Ljava/lang/Object;

    .line 177
    .line 178
    check-cast v2, Ljava/lang/Integer;

    .line 179
    .line 180
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 181
    .line 182
    .line 183
    move-result v2

    .line 184
    int-to-float v2, v2

    .line 185
    mul-float/2addr v1, v2

    .line 186
    float-to-int v1, v1

    .line 187
    iput v1, v0, Ll/fz0;->g:I

    .line 188
    .line 189
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->j:Ll/fz0;

    .line 190
    .line 191
    iget-object v1, p0, Lcom/sunshine/engine/base/a;->i:Ll/fz0;

    .line 192
    .line 193
    iget v2, v1, Ll/fz0;->f:I

    .line 194
    .line 195
    iget v3, v0, Ll/fz0;->f:I

    .line 196
    .line 197
    sub-int/2addr v2, v3

    .line 198
    div-int/lit8 v2, v2, 0x2

    .line 199
    .line 200
    iget v1, v1, Ll/fz0;->b:I

    .line 201
    .line 202
    add-int/2addr v2, v1

    .line 203
    iput v2, v0, Ll/fz0;->b:I

    .line 204
    .line 205
    :try_start_0
    iget-object v0, p0, Lcom/sunshine/engine/base/a;->k:Ljava/lang/String;

    .line 206
    .line 207
    invoke-static {v0}, Lcom/sunshine/engine/base/LayoutType;->valueOf(Ljava/lang/String;)Lcom/sunshine/engine/base/LayoutType;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {v0, p0}, Lcom/sunshine/engine/base/LayoutType;->resize(Lcom/sunshine/engine/base/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 212
    .line 213
    .line 214
    return-void

    .line 215
    :catch_0
    sget-object v0, Lcom/sunshine/engine/base/LayoutType;->center:Lcom/sunshine/engine/base/LayoutType;

    .line 216
    .line 217
    invoke-virtual {v0, p0}, Lcom/sunshine/engine/base/LayoutType;->resize(Lcom/sunshine/engine/base/a;)V

    .line 218
    .line 219
    .line 220
    :cond_4
    :goto_1
    return-void
.end method
