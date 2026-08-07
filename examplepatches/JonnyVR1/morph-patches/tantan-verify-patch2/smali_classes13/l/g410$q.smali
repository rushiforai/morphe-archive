.class Ll/g410$q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;->x0(Ljava/lang/Object;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g410$q;->a:Ll/g410;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/g410$q;->a:Ll/g410;

    .line 2
    .line 3
    iget-object v0, v0, Ll/g410;->c:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/g410$q;->a:Ll/g410;

    .line 7
    .line 8
    iget-object v1, v1, Ll/g410;->i:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_3

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 25
    .line 26
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    new-instance v4, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v5, "startRender isCameraCodec()"

    .line 36
    .line 37
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->r1()Z

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v5, ",isCameraCodec"

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget-object v5, p0, Ll/g410$q;->a:Ll/g410;

    .line 53
    .line 54
    iget-object v5, v5, Ll/g410;->h:Ll/uow;

    .line 55
    .line 56
    iget-boolean v5, v5, Ll/uow;->G0:Z

    .line 57
    .line 58
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v5, "codec:"

    .line 62
    .line 63
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v3, v4}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Ll/g410$q;->a:Ll/g410;

    .line 81
    .line 82
    iget-object v4, v3, Ll/g410;->g:Ll/rsy;

    .line 83
    .line 84
    if-nez v4, :cond_0

    .line 85
    .line 86
    invoke-static {v3}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Ll/bfj;->a()Ll/gfj;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    invoke-virtual {v3, v4}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 99
    .line 100
    .line 101
    iget-object v3, p0, Ll/g410$q;->a:Ll/g410;

    .line 102
    .line 103
    invoke-static {v3}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 104
    .line 105
    .line 106
    move-result-object v3

    .line 107
    invoke-virtual {v3}, Ll/bfj;->a()Ll/gfj;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v3, v4}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 116
    .line 117
    .line 118
    goto :goto_2

    .line 119
    :catchall_0
    move-exception p0

    .line 120
    goto/16 :goto_3

    .line 121
    .line 122
    :cond_0
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->r1()Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-nez v3, :cond_2

    .line 127
    .line 128
    iget-object v3, p0, Ll/g410$q;->a:Ll/g410;

    .line 129
    .line 130
    iget-object v4, v3, Ll/g410;->h:Ll/uow;

    .line 131
    .line 132
    iget-boolean v4, v4, Ll/uow;->G0:Z

    .line 133
    .line 134
    if-eqz v4, :cond_1

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_1
    iget-object v3, v3, Ll/g410;->g:Ll/rsy;

    .line 138
    .line 139
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-virtual {v3, v4}, Ll/rsy;->removeTarget(Ll/dfj;)V

    .line 144
    .line 145
    .line 146
    iget-object v3, p0, Ll/g410$q;->a:Ll/g410;

    .line 147
    .line 148
    iget-object v3, v3, Ll/g410;->g:Ll/rsy;

    .line 149
    .line 150
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 151
    .line 152
    .line 153
    move-result-object v4

    .line 154
    invoke-virtual {v3, v4}, Ll/rsy;->addTarget(Ll/dfj;)V

    .line 155
    .line 156
    .line 157
    goto :goto_2

    .line 158
    :cond_2
    :goto_1
    iget-object v3, p0, Ll/g410$q;->a:Ll/g410;

    .line 159
    .line 160
    iget-object v3, v3, Ll/g410;->g:Ll/rsy;

    .line 161
    .line 162
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    invoke-virtual {v3, v4}, Ll/rsy;->removeTarget(Ll/dfj;)V

    .line 167
    .line 168
    .line 169
    iget-object v3, p0, Ll/g410$q;->a:Ll/g410;

    .line 170
    .line 171
    iget-object v3, v3, Ll/g410;->g:Ll/rsy;

    .line 172
    .line 173
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    invoke-virtual {v3, v4}, Ll/rsy;->Q1(Ll/dfj;)V

    .line 178
    .line 179
    .line 180
    :goto_2
    iget-object v3, p0, Ll/g410$q;->a:Ll/g410;

    .line 181
    .line 182
    iget-object v4, v3, Ll/g410;->b:Ll/o410;

    .line 183
    .line 184
    invoke-static {v3}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual {v3}, Ll/bfj;->a()Ll/gfj;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    invoke-virtual {v4, v3}, Ll/o410;->I(Ll/wej;)Ll/g510;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-virtual {v3, v2}, Ll/g510;->h(Lcom/momo/pipline/MomoInterface/MomoCodec;)V

    .line 197
    .line 198
    .line 199
    iget-object v2, p0, Ll/g410$q;->a:Ll/g410;

    .line 200
    .line 201
    iget-object v3, v2, Ll/g410;->b:Ll/o410;

    .line 202
    .line 203
    invoke-static {v2}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v2}, Ll/bfj;->a()Ll/gfj;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-virtual {v3, v2}, Ll/o410;->I(Ll/wej;)Ll/g510;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    invoke-virtual {v2}, Ll/g510;->L()V

    .line 216
    .line 217
    .line 218
    iget-object v2, p0, Ll/g410$q;->a:Ll/g410;

    .line 219
    .line 220
    iget-object v3, v2, Ll/g410;->b:Ll/o410;

    .line 221
    .line 222
    invoke-static {v2}, Ll/g410;->m(Ll/g410;)Ll/bfj;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    invoke-virtual {v2}, Ll/bfj;->a()Ll/gfj;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-virtual {v3, v2}, Ll/o410;->I(Ll/wej;)Ll/g510;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    iget-object v3, p0, Ll/g410$q;->a:Ll/g410;

    .line 235
    .line 236
    iget-object v3, v3, Ll/g410;->h:Ll/uow;

    .line 237
    .line 238
    iget v3, v3, Ll/uow;->E0:I

    .line 239
    .line 240
    invoke-virtual {v2, v3}, Ll/g510;->I(I)V

    .line 241
    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :cond_3
    monitor-exit v0

    .line 246
    return-void

    .line 247
    :goto_3
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 248
    throw p0
.end method
