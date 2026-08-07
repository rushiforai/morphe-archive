.class Lcom/tencent/iliveroom/a/a$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/iliveroom/a/a;->sendCustomVideoTexture(IIIIIZLjava/lang/Object;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:Lcom/tencent/iliveroom/a/a;


# direct methods
.method public constructor <init>(Lcom/tencent/iliveroom/a/a;III)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/iliveroom/a/a$2;->a:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/iliveroom/a/a$2;->b:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/iliveroom/a/a$2;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .line 1
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->x(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/c/d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/tencent/iliveroom/a/c/d;->a()V

    .line 8
    .line 9
    .line 10
    iget v0, p0, Lcom/tencent/iliveroom/a/a$2;->a:I

    .line 11
    .line 12
    iget v1, p0, Lcom/tencent/iliveroom/a/a$2;->b:I

    .line 13
    .line 14
    iget v2, p0, Lcom/tencent/iliveroom/a/a$2;->c:I

    .line 15
    .line 16
    iget-object v3, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 17
    .line 18
    iget-object v4, v3, Lcom/tencent/iliveroom/a/a;->j:Lcom/tencent/iliveroom/a/a/d;

    .line 19
    .line 20
    invoke-static {v3}, Lcom/tencent/iliveroom/a/a;->y(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    iget-object v5, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 25
    .line 26
    invoke-static {v5}, Lcom/tencent/iliveroom/a/a;->w(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a/e;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    const/4 v6, 0x0

    .line 31
    if-eqz v5, :cond_2

    .line 32
    .line 33
    iget-object v5, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 34
    .line 35
    iget-wide v7, v5, Lcom/tencent/iliveroom/a/a;->i:J

    .line 36
    .line 37
    const-wide/16 v9, -0x1

    .line 38
    .line 39
    cmp-long v5, v7, v9

    .line 40
    .line 41
    if-eqz v5, :cond_2

    .line 42
    .line 43
    if-eqz v4, :cond_2

    .line 44
    .line 45
    if-eqz v3, :cond_2

    .line 46
    .line 47
    iget-boolean v5, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->onlyMixAudio:Z

    .line 48
    .line 49
    if-nez v5, :cond_2

    .line 50
    .line 51
    iget-object v5, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->mixUsers:Ljava/util/List;

    .line 52
    .line 53
    if-eqz v5, :cond_2

    .line 54
    .line 55
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    const/4 v7, 0x2

    .line 60
    if-ne v5, v7, :cond_2

    .line 61
    .line 62
    new-array v0, v7, [Lcom/tencent/iliveroom/a/a/a;

    .line 63
    .line 64
    iget-object v1, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->mixUsers:Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    move v2, v6

    .line 71
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-eqz v5, :cond_1

    .line 76
    .line 77
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    check-cast v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixUser;

    .line 82
    .line 83
    new-instance v7, Lcom/tencent/iliveroom/a/a/a;

    .line 84
    .line 85
    invoke-direct {v7}, Lcom/tencent/iliveroom/a/a/a;-><init>()V

    .line 86
    .line 87
    .line 88
    iget v8, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixUser;->height:I

    .line 89
    .line 90
    iput v8, v7, Lcom/tencent/iliveroom/a/a/a;->f:I

    .line 91
    .line 92
    iget v9, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixUser;->width:I

    .line 93
    .line 94
    iput v9, v7, Lcom/tencent/iliveroom/a/a/a;->e:I

    .line 95
    .line 96
    iget v10, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixUser;->x:I

    .line 97
    .line 98
    iput v10, v7, Lcom/tencent/iliveroom/a/a/a;->g:I

    .line 99
    .line 100
    iget v10, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixUser;->y:I

    .line 101
    .line 102
    iput v10, v7, Lcom/tencent/iliveroom/a/a/a;->h:I

    .line 103
    .line 104
    iget-wide v10, v5, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixUser;->userId:J

    .line 105
    .line 106
    iget-object v5, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 107
    .line 108
    iget-wide v12, v5, Lcom/tencent/iliveroom/a/a;->i:J

    .line 109
    .line 110
    cmp-long v5, v10, v12

    .line 111
    .line 112
    if-nez v5, :cond_0

    .line 113
    .line 114
    iget-object v5, v4, Lcom/tencent/iliveroom/a/a/d;->a:Ljava/nio/ByteBuffer;

    .line 115
    .line 116
    iput-object v5, v7, Lcom/tencent/iliveroom/a/a/a;->b:Ljava/nio/ByteBuffer;

    .line 117
    .line 118
    iget v5, v4, Lcom/tencent/iliveroom/a/a/d;->b:I

    .line 119
    .line 120
    iput v5, v7, Lcom/tencent/iliveroom/a/a/a;->c:I

    .line 121
    .line 122
    iget v5, v4, Lcom/tencent/iliveroom/a/a/d;->c:I

    .line 123
    .line 124
    iput v5, v7, Lcom/tencent/iliveroom/a/a/a;->d:I

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_0
    iget v5, p0, Lcom/tencent/iliveroom/a/a$2;->a:I

    .line 128
    .line 129
    iput v5, v7, Lcom/tencent/iliveroom/a/a/a;->a:I

    .line 130
    .line 131
    iput v9, v7, Lcom/tencent/iliveroom/a/a/a;->c:I

    .line 132
    .line 133
    iput v8, v7, Lcom/tencent/iliveroom/a/a/a;->d:I

    .line 134
    .line 135
    :goto_1
    add-int/lit8 v5, v2, 0x1

    .line 136
    .line 137
    aput-object v7, v0, v2

    .line 138
    .line 139
    move v2, v5

    .line 140
    goto :goto_0

    .line 141
    :cond_1
    iget v1, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->videoWidth:I

    .line 142
    .line 143
    iget v2, v3, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomLocalMixConfig;->videoHeight:I

    .line 144
    .line 145
    iget-object v3, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 146
    .line 147
    invoke-static {v3}, Lcom/tencent/iliveroom/a/a;->w(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/iliveroom/a/a/e;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-virtual {v3, v0, v1, v2}, Lcom/tencent/iliveroom/a/a/e;->a([Lcom/tencent/iliveroom/a/a/a;II)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    :cond_2
    move v8, v0

    .line 156
    move v9, v1

    .line 157
    move v10, v2

    .line 158
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 159
    .line 160
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->z(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-virtual {v0}, Lcom/tencent/liteav/d;->c()Lcom/tencent/liteav/g;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    if-eqz v0, :cond_4

    .line 169
    .line 170
    if-gt v9, v10, :cond_3

    .line 171
    .line 172
    const/4 v1, 0x1

    .line 173
    iput v1, v0, Lcom/tencent/liteav/g;->l:I

    .line 174
    .line 175
    iput v9, v0, Lcom/tencent/liteav/g;->a:I

    .line 176
    .line 177
    iput v10, v0, Lcom/tencent/liteav/g;->b:I

    .line 178
    .line 179
    goto :goto_2

    .line 180
    :cond_3
    iput v6, v0, Lcom/tencent/liteav/g;->l:I

    .line 181
    .line 182
    iput v10, v0, Lcom/tencent/liteav/g;->a:I

    .line 183
    .line 184
    iput v9, v0, Lcom/tencent/liteav/g;->b:I

    .line 185
    .line 186
    :cond_4
    :goto_2
    iget-object v0, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 187
    .line 188
    invoke-static {v0}, Lcom/tencent/iliveroom/a/a;->B(Lcom/tencent/iliveroom/a/a;)Lcom/tencent/liteav/d;

    .line 189
    .line 190
    .line 191
    move-result-object v7

    .line 192
    iget-object p0, p0, Lcom/tencent/iliveroom/a/a$2;->d:Lcom/tencent/iliveroom/a/a;

    .line 193
    .line 194
    invoke-static {p0}, Lcom/tencent/iliveroom/a/a;->A(Lcom/tencent/iliveroom/a/a;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v11

    .line 198
    const-wide/16 v12, 0x0

    .line 199
    .line 200
    invoke-virtual/range {v7 .. v13}, Lcom/tencent/liteav/d;->a(IIILjava/lang/Object;J)I

    .line 201
    .line 202
    .line 203
    return-void
.end method
