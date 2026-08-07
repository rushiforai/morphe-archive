.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->w2(JZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Z

.field final synthetic c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;JZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->a:J

    .line 4
    .line 5
    iput-boolean p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->b:Z

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 4
    .line 5
    iget v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 6
    .line 7
    if-ge v1, v3, :cond_1

    .line 8
    .line 9
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->a:J

    .line 10
    .line 11
    iget-object v5, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->t:[J

    .line 12
    .line 13
    aget-wide v6, v5, v1

    .line 14
    .line 15
    cmp-long v3, v3, v6

    .line 16
    .line 17
    if-nez v3, :cond_0

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    move v1, v0

    .line 24
    :goto_1
    if-nez v1, :cond_2

    .line 25
    .line 26
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    if-eqz v2, :cond_6

    .line 31
    .line 32
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->b:Z

    .line 33
    .line 34
    if-eqz v2, :cond_6

    .line 35
    .line 36
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 37
    .line 38
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-static {v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 46
    .line 47
    invoke-static {v2, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-nez v2, :cond_3

    .line 56
    .line 57
    if-eqz v1, :cond_6

    .line 58
    .line 59
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->b:Z

    .line 60
    .line 61
    if-eqz v2, :cond_6

    .line 62
    .line 63
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 64
    .line 65
    invoke-static {v2, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 69
    .line 70
    invoke-static {v2, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_3
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 75
    .line 76
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    if-ne v2, v1, :cond_5

    .line 81
    .line 82
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->b:Z

    .line 83
    .line 84
    if-eqz v2, :cond_4

    .line 85
    .line 86
    goto :goto_2

    .line 87
    :cond_4
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 88
    .line 89
    invoke-static {v2, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)V

    .line 90
    .line 91
    .line 92
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 93
    .line 94
    invoke-static {v2, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 95
    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_5
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 99
    .line 100
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    invoke-static {v2, v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)V

    .line 105
    .line 106
    .line 107
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 108
    .line 109
    invoke-static {v2, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 110
    .line 111
    .line 112
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 113
    .line 114
    invoke-static {v2, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->b2(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)V

    .line 115
    .line 116
    .line 117
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 118
    .line 119
    invoke-static {v2, v1}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->Y1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;I)I

    .line 120
    .line 121
    .line 122
    :cond_6
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    const-string v3, "full screen:"

    .line 125
    .line 126
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->a:J

    .line 130
    .line 131
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v3, ",fsi="

    .line 135
    .line 136
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 140
    .line 141
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 142
    .line 143
    .line 144
    move-result v3

    .line 145
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    const-string v3, ",svn="

    .line 149
    .line 150
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 154
    .line 155
    iget v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 156
    .line 157
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string v3, ", s0Pos["

    .line 161
    .line 162
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 166
    .line 167
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 168
    .line 169
    aget v3, v3, v0

    .line 170
    .line 171
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    const-string v3, ","

    .line 175
    .line 176
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 180
    .line 181
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 182
    .line 183
    aget v4, v4, v0

    .line 184
    .line 185
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    iget-object v4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 192
    .line 193
    iget-object v4, v4, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 194
    .line 195
    aget v4, v4, v0

    .line 196
    .line 197
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$5;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 204
    .line 205
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 206
    .line 207
    aget p0, p0, v0

    .line 208
    .line 209
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string p0, "], ind="

    .line 213
    .line 214
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    const-string v0, "mergeFilter"

    .line 225
    .line 226
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    .line 228
    .line 229
    return-void
.end method
