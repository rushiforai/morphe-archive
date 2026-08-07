.class public Ll/g510$b;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/g510;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field protected final a:I

.field public b:Z

.field final synthetic c:Ll/g510;


# direct methods
.method public constructor <init>(Ll/g510;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g510$b;->c:Ll/g510;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/16 p1, 0x64

    .line 7
    .line 8
    iput p1, p0, Ll/g510$b;->a:I

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Ll/g510$b;->b:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/g510$b;->b:Z

    .line 3
    .line 4
    const-wide/16 v0, 0xbb8

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/Thread;->join(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catch_0
    move-exception p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/g510$b;->b:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public run()V
    .locals 5
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x11
    .end annotation

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "RenderThread start ######################"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0, v1, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 33
    .line 34
    iget-object v0, v0, Ll/g510;->b:Ll/g510$a;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/g510$a;->p()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object v1, p0, Ll/g510$b;->c:Ll/g510;

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    invoke-static {v1}, Ll/g510;->a(Ll/g510;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    monitor-enter v0

    .line 50
    :try_start_0
    iget-object v1, p0, Ll/g510$b;->c:Ll/g510;

    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/g510;->b(Ll/g510;Z)Z

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Ll/g510$b;->c:Ll/g510;

    .line 56
    .line 57
    invoke-static {p0}, Ll/g510;->a(Ll/g510;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 62
    .line 63
    .line 64
    monitor-exit v0

    .line 65
    return-void

    .line 66
    :catchall_0
    move-exception p0

    .line 67
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 68
    throw p0

    .line 69
    :cond_0
    invoke-static {v1}, Ll/g510;->a(Ll/g510;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    monitor-enter v0

    .line 74
    :try_start_1
    iget-object v1, p0, Ll/g510$b;->c:Ll/g510;

    .line 75
    .line 76
    invoke-static {v1, v2}, Ll/g510;->b(Ll/g510;Z)Z

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Ll/g510$b;->c:Ll/g510;

    .line 80
    .line 81
    invoke-static {v1}, Ll/g510;->a(Ll/g510;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 86
    .line 87
    .line 88
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 89
    :cond_1
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 90
    .line 91
    invoke-static {v0}, Ll/g510;->c(Ll/g510;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 98
    .line 99
    invoke-static {v0}, Ll/g510;->d(Ll/g510;)V

    .line 100
    .line 101
    .line 102
    :cond_2
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 103
    .line 104
    invoke-static {v0}, Ll/g510;->e(Ll/g510;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-eqz v0, :cond_3

    .line 109
    .line 110
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 111
    .line 112
    invoke-virtual {v0}, Ll/g510;->r()V

    .line 113
    .line 114
    .line 115
    :cond_3
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 116
    .line 117
    iget-boolean v1, v0, Ll/g510;->m:Z

    .line 118
    .line 119
    if-eqz v1, :cond_4

    .line 120
    .line 121
    invoke-virtual {v0}, Ll/g510;->p()V

    .line 122
    .line 123
    .line 124
    :cond_4
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Ll/u6y;->Q()V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 132
    .line 133
    iget-object v1, v0, Ll/g510;->i:Ljava/lang/Object;

    .line 134
    .line 135
    monitor-enter v1

    .line 136
    :try_start_2
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 137
    .line 138
    iget-object v0, v0, Ll/g510;->k:Ljava/lang/Boolean;

    .line 139
    .line 140
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 141
    .line 142
    .line 143
    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 144
    if-nez v0, :cond_5

    .line 145
    .line 146
    :try_start_3
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 147
    .line 148
    iget-object v0, v0, Ll/g510;->i:Ljava/lang/Object;

    .line 149
    .line 150
    const-wide/16 v2, 0x64

    .line 151
    .line 152
    invoke-virtual {v0, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 153
    .line 154
    .line 155
    goto :goto_0

    .line 156
    :catchall_1
    move-exception p0

    .line 157
    goto :goto_3

    .line 158
    :catch_0
    move-exception v0

    .line 159
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 160
    .line 161
    .line 162
    :cond_5
    :goto_0
    sget-boolean v0, Ll/im80;->a:Z

    .line 163
    .line 164
    if-eqz v0, :cond_6

    .line 165
    .line 166
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 167
    .line 168
    iget-object v0, v0, Ll/g510;->q:Ljava/lang/String;

    .line 169
    .line 170
    const-string v2, "TextureInput"

    .line 171
    .line 172
    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_6

    .line 177
    .line 178
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 183
    .line 184
    new-instance v3, Ljava/lang/StringBuilder;

    .line 185
    .line 186
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 187
    .line 188
    .line 189
    const-string v4, ">>>>>>>>>>"

    .line 190
    .line 191
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    iget-object v4, p0, Ll/g510$b;->c:Ll/g510;

    .line 195
    .line 196
    iget-object v4, v4, Ll/g510;->k:Ljava/lang/Boolean;

    .line 197
    .line 198
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    invoke-virtual {v0, v2, v3}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    :cond_6
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 209
    .line 210
    iget-object v0, v0, Ll/g510;->k:Ljava/lang/Boolean;

    .line 211
    .line 212
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-nez v0, :cond_7

    .line 217
    .line 218
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {v0}, Ll/u6y;->R()V

    .line 223
    .line 224
    .line 225
    monitor-exit v1

    .line 226
    goto :goto_2

    .line 227
    :cond_7
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 228
    .line 229
    iget-object v2, v0, Ll/g510;->d:Ll/wje;

    .line 230
    .line 231
    if-nez v2, :cond_8

    .line 232
    .line 233
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 234
    .line 235
    iput-object v2, v0, Ll/g510;->k:Ljava/lang/Boolean;

    .line 236
    .line 237
    goto :goto_1

    .line 238
    :cond_8
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 239
    .line 240
    iput-object v2, v0, Ll/g510;->k:Ljava/lang/Boolean;

    .line 241
    .line 242
    :goto_1
    invoke-virtual {v0}, Ll/g510;->s()V

    .line 243
    .line 244
    .line 245
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 246
    :goto_2
    iget-boolean v0, p0, Ll/g510$b;->b:Z

    .line 247
    .line 248
    if-eqz v0, :cond_1

    .line 249
    .line 250
    iget-object v0, p0, Ll/g510$b;->c:Ll/g510;

    .line 251
    .line 252
    invoke-static {v0}, Ll/g510;->f(Ll/g510;)V

    .line 253
    .line 254
    .line 255
    iget-object p0, p0, Ll/g510$b;->c:Ll/g510;

    .line 256
    .line 257
    invoke-static {p0}, Ll/g510;->g(Ll/g510;)V

    .line 258
    .line 259
    .line 260
    return-void

    .line 261
    :goto_3
    :try_start_5
    monitor-exit v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 262
    throw p0

    .line 263
    :catchall_2
    move-exception p0

    .line 264
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 265
    throw p0
.end method
