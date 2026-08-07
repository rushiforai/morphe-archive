.class Lcom/tencent/liteav/videoencoder/a$8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/videoencoder/a;->pushVideoFrameAsync(IIIJ)J
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:J

.field final synthetic c:Lcom/tencent/liteav/videoencoder/a;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/videoencoder/a;IJ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/videoencoder/a$8;->a:I

    .line 4
    .line 5
    iput-wide p3, p0, Lcom/tencent/liteav/videoencoder/a$8;->b:J

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
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/a;->b(Lcom/tencent/liteav/videoencoder/a;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_c

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/a;->c(Lcom/tencent/liteav/videoencoder/a;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    goto/16 :goto_6

    .line 19
    .line 20
    :cond_0
    iget v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->a:I

    .line 21
    .line 22
    iget-wide v2, p0, Lcom/tencent/liteav/videoencoder/a$8;->b:J

    .line 23
    .line 24
    iget-object v4, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 25
    .line 26
    invoke-static {v4, v2, v3}, Lcom/tencent/liteav/videoencoder/a;->a(Lcom/tencent/liteav/videoencoder/a;J)V

    .line 27
    .line 28
    .line 29
    iget-object v4, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 30
    .line 31
    iget v5, v4, Lcom/tencent/liteav/videoencoder/c;->mRotation:I

    .line 32
    .line 33
    rsub-int v5, v5, 0x2d0

    .line 34
    .line 35
    rem-int/lit16 v9, v5, 0x168

    .line 36
    .line 37
    const/16 v5, 0x10e

    .line 38
    .line 39
    const/16 v6, 0x5a

    .line 40
    .line 41
    if-eq v9, v6, :cond_2

    .line 42
    .line 43
    if-ne v9, v5, :cond_1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget v7, v4, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    :goto_0
    iget v7, v4, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 50
    .line 51
    :goto_1
    if-eq v9, v6, :cond_4

    .line 52
    .line 53
    if-ne v9, v5, :cond_3

    .line 54
    .line 55
    goto :goto_2

    .line 56
    :cond_3
    iget v5, v4, Lcom/tencent/liteav/videoencoder/c;->mOutputHeight:I

    .line 57
    .line 58
    goto :goto_3

    .line 59
    :cond_4
    :goto_2
    iget v5, v4, Lcom/tencent/liteav/videoencoder/c;->mOutputWidth:I

    .line 60
    .line 61
    :goto_3
    iget-object v6, v4, Lcom/tencent/liteav/videoencoder/c;->mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 62
    .line 63
    move v8, v7

    .line 64
    iget v7, v4, Lcom/tencent/liteav/videoencoder/c;->mInputWidth:I

    .line 65
    .line 66
    move v10, v8

    .line 67
    iget v8, v4, Lcom/tencent/liteav/videoencoder/c;->mInputHeight:I

    .line 68
    .line 69
    int-to-float v10, v10

    .line 70
    int-to-float v5, v5

    .line 71
    div-float v11, v10, v5

    .line 72
    .line 73
    iget-boolean v12, v4, Lcom/tencent/liteav/videoencoder/c;->mEnableXMirror:Z

    .line 74
    .line 75
    const/4 v13, 0x1

    .line 76
    const/4 v10, 0x0

    .line 77
    invoke-virtual/range {v6 .. v13}, Lcom/tencent/liteav/basic/c/h;->a(III[FFZZ)V

    .line 78
    .line 79
    .line 80
    iget-object v4, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 81
    .line 82
    iget-object v4, v4, Lcom/tencent/liteav/videoencoder/c;->mEncodeFilter:Lcom/tencent/liteav/basic/c/h;

    .line 83
    .line 84
    invoke-virtual {v4, v0}, Lcom/tencent/liteav/basic/c/h;->a(I)I

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 88
    .line 89
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/a;->c(Lcom/tencent/liteav/videoencoder/a;)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    instance-of v0, v0, Lcom/tencent/liteav/basic/c/c;

    .line 94
    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 98
    .line 99
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/a;->c(Lcom/tencent/liteav/videoencoder/a;)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lcom/tencent/liteav/basic/c/c;

    .line 104
    .line 105
    const-wide/32 v4, 0xf4240

    .line 106
    .line 107
    .line 108
    mul-long/2addr v2, v4

    .line 109
    invoke-virtual {v0, v2, v3}, Lcom/tencent/liteav/basic/c/c;->a(J)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 113
    .line 114
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/a;->c(Lcom/tencent/liteav/videoencoder/a;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    check-cast v0, Lcom/tencent/liteav/basic/c/c;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/c;->d()Z

    .line 121
    .line 122
    .line 123
    :cond_5
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 124
    .line 125
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/a;->c(Lcom/tencent/liteav/videoencoder/a;)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    instance-of v0, v0, Lcom/tencent/liteav/basic/c/b;

    .line 130
    .line 131
    if-eqz v0, :cond_6

    .line 132
    .line 133
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 134
    .line 135
    invoke-static {v0}, Lcom/tencent/liteav/videoencoder/a;->c(Lcom/tencent/liteav/videoencoder/a;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Lcom/tencent/liteav/basic/c/b;

    .line 140
    .line 141
    invoke-virtual {v0}, Lcom/tencent/liteav/basic/c/b;->a()Z

    .line 142
    .line 143
    .line 144
    :cond_6
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 145
    .line 146
    iget-object v2, v0, Lcom/tencent/liteav/videoencoder/c;->mListener:Lcom/tencent/liteav/videoencoder/d;

    .line 147
    .line 148
    if-eqz v2, :cond_7

    .line 149
    .line 150
    iget v0, v0, Lcom/tencent/liteav/videoencoder/c;->mStreamType:I

    .line 151
    .line 152
    invoke-interface {v2, v0}, Lcom/tencent/liteav/videoencoder/d;->l(I)V

    .line 153
    .line 154
    .line 155
    :cond_7
    :goto_4
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 156
    .line 157
    invoke-static {v0, v1}, Lcom/tencent/liteav/videoencoder/a;->c(Lcom/tencent/liteav/videoencoder/a;I)I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-lez v0, :cond_8

    .line 162
    .line 163
    goto :goto_4

    .line 164
    :cond_8
    const/4 v2, -0x1

    .line 165
    if-eq v0, v2, :cond_a

    .line 166
    .line 167
    const/4 v3, -0x2

    .line 168
    if-ne v0, v3, :cond_9

    .line 169
    .line 170
    goto :goto_5

    .line 171
    :cond_9
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 172
    .line 173
    invoke-static {p0}, Lcom/tencent/liteav/videoencoder/a;->d(Lcom/tencent/liteav/videoencoder/a;)I

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :cond_a
    :goto_5
    if-ne v0, v2, :cond_b

    .line 178
    .line 179
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 180
    .line 181
    const v2, 0x989685

    .line 182
    .line 183
    .line 184
    invoke-virtual {v0, v2}, Lcom/tencent/liteav/videoencoder/c;->callDelegate(I)V

    .line 185
    .line 186
    .line 187
    :cond_b
    iget-object v0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 188
    .line 189
    invoke-static {v0, v1}, Lcom/tencent/liteav/videoencoder/a;->a(Lcom/tencent/liteav/videoencoder/a;Z)Z

    .line 190
    .line 191
    .line 192
    iget-object p0, p0, Lcom/tencent/liteav/videoencoder/a$8;->c:Lcom/tencent/liteav/videoencoder/a;

    .line 193
    .line 194
    invoke-static {p0}, Lcom/tencent/liteav/videoencoder/a;->a(Lcom/tencent/liteav/videoencoder/a;)V

    .line 195
    .line 196
    .line 197
    :cond_c
    :goto_6
    return-void
.end method
