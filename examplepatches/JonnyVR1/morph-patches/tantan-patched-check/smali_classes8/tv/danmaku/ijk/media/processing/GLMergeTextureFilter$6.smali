.class Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x2(JZ)V
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
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 2
    .line 3
    iput-wide p2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->a:J

    .line 4
    .line 5
    iput-boolean p4, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->b:Z

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
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 4
    .line 5
    iget v3, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 6
    .line 7
    if-ge v1, v3, :cond_2

    .line 8
    .line 9
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->a:J

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
    if-nez v3, :cond_1

    .line 18
    .line 19
    iget-boolean v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->b:Z

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    invoke-static {v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-ne v2, v1, :cond_0

    .line 28
    .line 29
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 30
    .line 31
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->a:J

    .line 32
    .line 33
    invoke-virtual {v2, v3, v4, v0}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->w2(JZ)V

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 37
    .line 38
    iget-object v2, v2, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 39
    .line 40
    iget-boolean v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->b:Z

    .line 41
    .line 42
    xor-int/lit8 v3, v3, 0x1

    .line 43
    .line 44
    aput-boolean v3, v2, v1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string v3, "hide: "

    .line 53
    .line 54
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-wide v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->a:J

    .line 58
    .line 59
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v3, ", "

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    iget-boolean v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->b:Z

    .line 68
    .line 69
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v3, "; fsi:"

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 78
    .line 79
    invoke-static {v3}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->X1(Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v3, ",svn"

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 92
    .line 93
    iget v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->x:I

    .line 94
    .line 95
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v3, ", viewShow["

    .line 99
    .line 100
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v3, "]="

    .line 107
    .line 108
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 112
    .line 113
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->o:[Z

    .line 114
    .line 115
    aget-boolean v1, v3, v1

    .line 116
    .line 117
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string v1, ", s0Pos["

    .line 121
    .line 122
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 126
    .line 127
    iget-object v1, v1, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->d:[I

    .line 128
    .line 129
    aget v1, v1, v0

    .line 130
    .line 131
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    const-string v1, ","

    .line 135
    .line 136
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 140
    .line 141
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->e:[I

    .line 142
    .line 143
    aget v3, v3, v0

    .line 144
    .line 145
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    iget-object v3, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 152
    .line 153
    iget-object v3, v3, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->f:[I

    .line 154
    .line 155
    aget v3, v3, v0

    .line 156
    .line 157
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter$6;->c:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 164
    .line 165
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->g:[I

    .line 166
    .line 167
    aget p0, p0, v0

    .line 168
    .line 169
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string p0, "]"

    .line 173
    .line 174
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    const-string v0, "mergeFilter"

    .line 182
    .line 183
    invoke-static {v0, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    return-void
.end method
