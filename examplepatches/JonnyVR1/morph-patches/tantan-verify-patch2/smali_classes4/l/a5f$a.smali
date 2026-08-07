.class public Ll/a5f$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/a5f;->h(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Ljava/lang/Runnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

.field public final synthetic b:Ll/a5f;


# direct methods
.method public constructor <init>(Ll/a5f;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/a5f$a;->b:Ll/a5f;

    .line 2
    .line 3
    iput-object p2, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->isCache()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "crash"

    .line 8
    .line 9
    const-string v2, "[beatles]"

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Ll/a5f$a;->b:Ll/a5f;

    .line 14
    .line 15
    iget-object v3, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 16
    .line 17
    invoke-static {v0, v3}, Ll/a5f;->a(Ll/a5f;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 21
    .line 22
    invoke-virtual {v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventType()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v3, "[upload]processEvent done:"

    .line 35
    .line 36
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object v3, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 40
    .line 41
    invoke-virtual {v3}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v2, v0}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_0
    :try_start_0
    iget-object v0, p0, Ll/a5f$a;->b:Ll/a5f;

    .line 56
    .line 57
    iget-object v3, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 58
    .line 59
    invoke-static {v0, v3}, Ll/a5f;->b(Ll/a5f;Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :catch_0
    move-exception v0

    .line 64
    new-instance v3, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v4, "[upload] saveEvent2DiskCache exception:"

    .line 67
    .line 68
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static {v2, v0}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :goto_0
    iget-object v0, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventType()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_1

    .line 96
    .line 97
    new-instance v0, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v3, "[upload] saveEvent2DiskCache done:"

    .line 100
    .line 101
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    iget-object v3, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 105
    .line 106
    invoke-virtual {v3}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventId()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-static {v2, v0}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_1
    iget-object v0, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 121
    .line 122
    invoke-static {v0}, Ll/w2f;->a(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)Ll/m4f;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget-object v3, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 127
    .line 128
    invoke-virtual {v3}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventType()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-eqz v1, :cond_2

    .line 137
    .line 138
    invoke-virtual {v0}, Ll/m4f;->a()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    if-eqz v1, :cond_2

    .line 147
    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    const-string v3, "[upload] envelope jsonData is empty,  SubEventType:"

    .line 151
    .line 152
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object v3, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 156
    .line 157
    invoke-virtual {v3}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getSubEventType()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    invoke-static {v2, v1}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 172
    .line 173
    invoke-virtual {v1}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getSubEventType()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    const-string v3, "java"

    .line 178
    .line 179
    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_2

    .line 184
    .line 185
    new-instance v1, Lcom/google/gson/Gson;

    .line 186
    .line 187
    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    .line 188
    .line 189
    .line 190
    iget-object v3, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 191
    .line 192
    invoke-virtual {v1, v3}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    new-instance v3, Ljava/lang/StringBuilder;

    .line 197
    .line 198
    const-string v4, "[upload] envelope jsonData is empty, event:"

    .line 199
    .line 200
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 204
    .line 205
    .line 206
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    invoke-static {v2, v1}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    :cond_2
    iget-object v1, p0, Ll/a5f$a;->b:Ll/a5f;

    .line 214
    .line 215
    invoke-static {v1, v0}, Ll/a5f;->c(Ll/a5f;Ll/m4f;)Lcom/tantanapp/beatles/v2/upload/UploadStatus;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    sget-object v1, Lcom/tantanapp/beatles/v2/upload/UploadStatus;->SUCCESS:Lcom/tantanapp/beatles/v2/upload/UploadStatus;

    .line 220
    .line 221
    if-eq v1, v0, :cond_4

    .line 222
    .line 223
    sget-object v1, Lcom/tantanapp/beatles/v2/upload/UploadStatus;->DISCARD:Lcom/tantanapp/beatles/v2/upload/UploadStatus;

    .line 224
    .line 225
    if-ne v1, v0, :cond_3

    .line 226
    .line 227
    goto :goto_1

    .line 228
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 229
    .line 230
    const-string v1, "[upload]event upload failed id:"

    .line 231
    .line 232
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    iget-object p0, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 236
    .line 237
    invoke-virtual {p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventId()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    invoke-static {v2, p0}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    goto :goto_2

    .line 252
    :cond_4
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    const-string v2, "event upload success id:"

    .line 255
    .line 256
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 257
    .line 258
    .line 259
    iget-object v2, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 260
    .line 261
    invoke-virtual {v2}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getEventId()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v2

    .line 265
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    const-string v2, "status:"

    .line 269
    .line 270
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 274
    .line 275
    .line 276
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    const/4 v1, 0x0

    .line 281
    new-array v1, v1, [Ljava/lang/Object;

    .line 282
    .line 283
    invoke-static {v0, v1}, Ll/f610;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 284
    .line 285
    .line 286
    invoke-static {}, Ll/du2;->u()Z

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    if-nez v0, :cond_5

    .line 291
    .line 292
    iget-object p0, p0, Ll/a5f$a;->a:Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 293
    .line 294
    invoke-virtual {p0}, Lcom/tantanapp/beatles/v2/data/MonitorEvent;->getCacheDir()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    invoke-static {p0}, Ll/nki;->g(Ljava/lang/String;)Z

    .line 299
    .line 300
    .line 301
    :cond_5
    :goto_2
    return-void
.end method
