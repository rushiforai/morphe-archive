.class final Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->invoke()Landroid/os/Handler$Callback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n\u00a2\u0006\u0002\u0008\u0004"
    }
    d2 = {
        "<anonymous>",
        "",
        "it",
        "Landroid/os/Message;",
        "handleMessage"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;


# direct methods
.method public constructor <init>(Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;)V
    .locals 0

    iput-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final handleMessage(Landroid/os/Message;)Z
    .locals 3
    .param p1    # Landroid/os/Message;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget p1, p1, Landroid/os/Message;->what:I

    .line 5
    .line 6
    iget-object v0, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/immomo/molive/apm/ApmPlugin;->B()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ne p1, v0, :cond_9

    .line 15
    .line 16
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 17
    .line 18
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 19
    .line 20
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 24
    .line 25
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/immomo/molive/apm/ApmPlugin;->v()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 36
    .line 37
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->c(Lcom/immomo/molive/apm/ApmPlugin;)Lcom/immomo/molive/apm/fps/FpsTracer;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/immomo/molive/apm/fps/FpsTracer;->m()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 50
    .line 51
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 57
    .line 58
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->c(Lcom/immomo/molive/apm/ApmPlugin;)Lcom/immomo/molive/apm/fps/FpsTracer;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ll/cs2;->d()V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 68
    .line 69
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->c(Lcom/immomo/molive/apm/ApmPlugin;)Lcom/immomo/molive/apm/fps/FpsTracer;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p1}, Ll/cs2;->a()Ll/erl;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Ll/g4j;

    .line 78
    .line 79
    if-eqz p1, :cond_1

    .line 80
    .line 81
    iget-object v0, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/immomo/molive/apm/ApmPlugin;->A()Ll/hr60;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p1}, Ll/g4j;->e()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    invoke-virtual {p1}, Ll/g4j;->b()I

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    invoke-virtual {p1}, Ll/g4j;->f()I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    invoke-virtual {v0, v1, v2, p1}, Ll/hr60;->m(III)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 105
    .line 106
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 107
    .line 108
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_0
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 113
    .line 114
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 115
    .line 116
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 117
    .line 118
    .line 119
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 120
    .line 121
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/immomo/molive/apm/ApmPlugin;->u()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_2

    .line 128
    .line 129
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 130
    .line 131
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 132
    .line 133
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->b(Lcom/immomo/molive/apm/ApmPlugin;)Ll/otb;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-virtual {p1}, Ll/otb;->i()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_2

    .line 142
    .line 143
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 144
    .line 145
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 146
    .line 147
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 151
    .line 152
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 153
    .line 154
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->b(Lcom/immomo/molive/apm/ApmPlugin;)Ll/otb;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p1}, Ll/cs2;->d()V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 162
    .line 163
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 164
    .line 165
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->b(Lcom/immomo/molive/apm/ApmPlugin;)Ll/otb;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    invoke-virtual {p1}, Ll/cs2;->a()Ll/erl;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    check-cast p1, Ll/btb;

    .line 174
    .line 175
    if-eqz p1, :cond_3

    .line 176
    .line 177
    iget-object v0, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/immomo/molive/apm/ApmPlugin;->A()Ll/hr60;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-virtual {p1}, Ll/btb;->b()F

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    invoke-virtual {p1}, Ll/btb;->c()F

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    invoke-virtual {v0, v1, p1}, Ll/hr60;->l(FF)V

    .line 194
    .line 195
    .line 196
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 197
    .line 198
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 199
    .line 200
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 201
    .line 202
    .line 203
    goto :goto_1

    .line 204
    :cond_2
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 205
    .line 206
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 207
    .line 208
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 209
    .line 210
    .line 211
    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 212
    .line 213
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 214
    .line 215
    invoke-virtual {p1}, Lcom/immomo/molive/apm/ApmPlugin;->w()Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-eqz p1, :cond_4

    .line 220
    .line 221
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 222
    .line 223
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 224
    .line 225
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->f(Lcom/immomo/molive/apm/ApmPlugin;)Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    invoke-virtual {p1}, Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;->i()Z

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    if-eqz p1, :cond_4

    .line 234
    .line 235
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 236
    .line 237
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 238
    .line 239
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 240
    .line 241
    .line 242
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 243
    .line 244
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 245
    .line 246
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->f(Lcom/immomo/molive/apm/ApmPlugin;)Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-virtual {p1}, Ll/cs2;->d()V

    .line 251
    .line 252
    .line 253
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 254
    .line 255
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 256
    .line 257
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->f(Lcom/immomo/molive/apm/ApmPlugin;)Lcom/immomo/molive/debuger/performance/tracer/memory/MemTracer;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    invoke-virtual {p1}, Ll/cs2;->a()Ll/erl;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    check-cast p1, Ll/ogy;

    .line 266
    .line 267
    if-eqz p1, :cond_5

    .line 268
    .line 269
    iget-object v0, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 270
    .line 271
    iget-object v0, v0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 272
    .line 273
    invoke-virtual {v0}, Lcom/immomo/molive/apm/ApmPlugin;->A()Ll/hr60;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-virtual {p1}, Ll/ogy;->b()I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    invoke-virtual {p1}, Ll/ogy;->d()I

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    invoke-virtual {p1}, Ll/ogy;->c()I

    .line 286
    .line 287
    .line 288
    move-result p1

    .line 289
    invoke-virtual {v0, v1, v2, p1}, Ll/hr60;->r(III)V

    .line 290
    .line 291
    .line 292
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 293
    .line 294
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 295
    .line 296
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 297
    .line 298
    .line 299
    goto :goto_2

    .line 300
    :cond_4
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 301
    .line 302
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 303
    .line 304
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 305
    .line 306
    .line 307
    :cond_5
    :goto_2
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 308
    .line 309
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 310
    .line 311
    invoke-virtual {p1}, Lcom/immomo/molive/apm/ApmPlugin;->x()Z

    .line 312
    .line 313
    .line 314
    move-result p1

    .line 315
    if-eqz p1, :cond_6

    .line 316
    .line 317
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 318
    .line 319
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 320
    .line 321
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->g(Lcom/immomo/molive/apm/ApmPlugin;)Lcom/immomo/molive/apm/temp/TempTracer;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    invoke-virtual {p1}, Lcom/immomo/molive/apm/temp/TempTracer;->i()Z

    .line 326
    .line 327
    .line 328
    move-result p1

    .line 329
    if-eqz p1, :cond_6

    .line 330
    .line 331
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 332
    .line 333
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 334
    .line 335
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 336
    .line 337
    .line 338
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 339
    .line 340
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 341
    .line 342
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->g(Lcom/immomo/molive/apm/ApmPlugin;)Lcom/immomo/molive/apm/temp/TempTracer;

    .line 343
    .line 344
    .line 345
    move-result-object p1

    .line 346
    invoke-virtual {p1}, Ll/cs2;->d()V

    .line 347
    .line 348
    .line 349
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 350
    .line 351
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 352
    .line 353
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->g(Lcom/immomo/molive/apm/ApmPlugin;)Lcom/immomo/molive/apm/temp/TempTracer;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    invoke-virtual {p1}, Ll/cs2;->a()Ll/erl;

    .line 358
    .line 359
    .line 360
    move-result-object p1

    .line 361
    check-cast p1, Lcom/immomo/molive/apm/temp/TempSummary;

    .line 362
    .line 363
    if-eqz p1, :cond_7

    .line 364
    .line 365
    iget-object v0, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 366
    .line 367
    iget-object v0, v0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 368
    .line 369
    invoke-virtual {v0}, Lcom/immomo/molive/apm/ApmPlugin;->A()Ll/hr60;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    invoke-virtual {p1}, Lcom/immomo/molive/apm/temp/TempSummary;->c()Ll/vpi0;

    .line 374
    .line 375
    .line 376
    move-result-object v1

    .line 377
    invoke-virtual {v1}, Ll/vpi0;->a()I

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    invoke-virtual {p1}, Lcom/immomo/molive/apm/temp/TempSummary;->d()Ll/vpi0;

    .line 382
    .line 383
    .line 384
    move-result-object v2

    .line 385
    invoke-virtual {v2}, Ll/vpi0;->a()I

    .line 386
    .line 387
    .line 388
    move-result v2

    .line 389
    invoke-virtual {p1}, Lcom/immomo/molive/apm/temp/TempSummary;->b()Ll/vpi0;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    invoke-virtual {p1}, Ll/vpi0;->a()I

    .line 394
    .line 395
    .line 396
    move-result p1

    .line 397
    invoke-virtual {v0, v1, v2, p1}, Ll/hr60;->s(III)V

    .line 398
    .line 399
    .line 400
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 401
    .line 402
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 403
    .line 404
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 405
    .line 406
    .line 407
    goto :goto_3

    .line 408
    :cond_6
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 409
    .line 410
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 411
    .line 412
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->a(Lcom/immomo/molive/apm/ApmPlugin;)Ll/xt0;

    .line 413
    .line 414
    .line 415
    :cond_7
    :goto_3
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 416
    .line 417
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 418
    .line 419
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->h(Lcom/immomo/molive/apm/ApmPlugin;)Landroid/os/Handler;

    .line 420
    .line 421
    .line 422
    move-result-object p1

    .line 423
    if-eqz p1, :cond_8

    .line 424
    .line 425
    iget-object v0, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 426
    .line 427
    iget-object v0, v0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 428
    .line 429
    invoke-virtual {v0}, Lcom/immomo/molive/apm/ApmPlugin;->B()I

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 434
    .line 435
    .line 436
    :cond_8
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 437
    .line 438
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 439
    .line 440
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->e(Lcom/immomo/molive/apm/ApmPlugin;)Ll/zt0;

    .line 441
    .line 442
    .line 443
    move-result-object p1

    .line 444
    invoke-virtual {p1}, Ll/zt0;->b()Z

    .line 445
    .line 446
    .line 447
    move-result p1

    .line 448
    if-eqz p1, :cond_9

    .line 449
    .line 450
    iget-object p1, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 451
    .line 452
    iget-object p1, p1, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 453
    .line 454
    invoke-static {p1}, Lcom/immomo/molive/apm/ApmPlugin;->h(Lcom/immomo/molive/apm/ApmPlugin;)Landroid/os/Handler;

    .line 455
    .line 456
    .line 457
    move-result-object p1

    .line 458
    if-eqz p1, :cond_9

    .line 459
    .line 460
    iget-object v0, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 461
    .line 462
    iget-object v0, v0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 463
    .line 464
    invoke-virtual {v0}, Lcom/immomo/molive/apm/ApmPlugin;->B()I

    .line 465
    .line 466
    .line 467
    move-result v0

    .line 468
    iget-object p0, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2$a;->a:Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;

    .line 469
    .line 470
    iget-object p0, p0, Lcom/immomo/molive/apm/ApmPlugin$handlerCallback$2;->this$0:Lcom/immomo/molive/apm/ApmPlugin;

    .line 471
    .line 472
    invoke-static {p0}, Lcom/immomo/molive/apm/ApmPlugin;->e(Lcom/immomo/molive/apm/ApmPlugin;)Ll/zt0;

    .line 473
    .line 474
    .line 475
    move-result-object p0

    .line 476
    invoke-virtual {p0}, Ll/zt0;->e()J

    .line 477
    .line 478
    .line 479
    move-result-wide v1

    .line 480
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 481
    .line 482
    .line 483
    :cond_9
    const/4 p0, 0x1

    .line 484
    return p0
.end method
