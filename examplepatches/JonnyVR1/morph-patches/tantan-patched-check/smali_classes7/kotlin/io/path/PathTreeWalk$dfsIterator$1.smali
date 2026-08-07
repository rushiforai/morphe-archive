.class final Lkotlin/io/path/PathTreeWalk$dfsIterator$1;
.super Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/io/path/PathTreeWalk;->g()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlin/sequences/SequenceScope<",
        "-",
        "Ljava/nio/file/Path;",
        ">;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlin/sequences/SequenceScope;",
        "Ljava/nio/file/Path;"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "kotlin.io.path.PathTreeWalk$dfsIterator$1"
    f = "PathTreeWalk.kt"
    l = {
        0xbf,
        0xc5,
        0xd2,
        0xd8
    }
    m = "invokeSuspend"
    v = 0x2
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field I$0:I

.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$10:Ljava/lang/Object;

.field L$11:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field L$5:Ljava/lang/Object;

.field L$6:Ljava/lang/Object;

.field L$7:Ljava/lang/Object;

.field L$8:Ljava/lang/Object;

.field L$9:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lkotlin/io/path/PathTreeWalk;


# direct methods
.method public constructor <init>(Lkotlin/io/path/PathTreeWalk;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/io/path/PathTreeWalk;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/io/path/PathTreeWalk$dfsIterator$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;

    iget-object p0, p0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    invoke-direct {v0, p0, p2}, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;-><init>(Lkotlin/io/path/PathTreeWalk;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 2
    check-cast p1, Lkotlin/sequences/SequenceScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->invoke(Lkotlin/sequences/SequenceScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lkotlin/sequences/SequenceScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/sequences/SequenceScope<",
            "-",
            "Ljava/nio/file/Path;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lkotlin/sequences/SequenceScope;

    .line 6
    .line 7
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    iget v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x4

    .line 15
    const/4 v6, 0x3

    .line 16
    const/4 v7, 0x2

    .line 17
    const/4 v8, 0x0

    .line 18
    const/4 v9, 0x1

    .line 19
    if-eqz v3, :cond_4

    .line 20
    .line 21
    if-eq v3, v9, :cond_3

    .line 22
    .line 23
    if-eq v3, v7, :cond_2

    .line 24
    .line 25
    if-eq v3, v6, :cond_1

    .line 26
    .line 27
    if-ne v3, v5, :cond_0

    .line 28
    .line 29
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$11:Ljava/lang/Object;

    .line 30
    .line 31
    invoke-static {v3}, Ll/y2e;->a(Ljava/lang/Object;)Ljava/nio/file/Path;

    .line 32
    .line 33
    .line 34
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$10:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v3, Ll/c3e;

    .line 37
    .line 38
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$9:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast v3, Ll/bj60;

    .line 41
    .line 42
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v3, Lkotlin/sequences/SequenceScope;

    .line 45
    .line 46
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v3, Lkotlin/io/path/PathTreeWalk;

    .line 49
    .line 50
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v3, Ll/bj60;

    .line 53
    .line 54
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    .line 55
    .line 56
    check-cast v3, Ljava/util/Iterator;

    .line 57
    .line 58
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v3, Ll/bj60;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 64
    .line 65
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-object v4

    .line 69
    :cond_1
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$11:Ljava/lang/Object;

    .line 70
    .line 71
    invoke-static {v3}, Ll/y2e;->a(Ljava/lang/Object;)Ljava/nio/file/Path;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    iget-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$10:Ljava/lang/Object;

    .line 76
    .line 77
    check-cast v4, Ll/c3e;

    .line 78
    .line 79
    iget-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$9:Ljava/lang/Object;

    .line 80
    .line 81
    check-cast v7, Ll/bj60;

    .line 82
    .line 83
    iget-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v10, Lkotlin/sequences/SequenceScope;

    .line 86
    .line 87
    iget-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    .line 88
    .line 89
    check-cast v10, Lkotlin/io/path/PathTreeWalk;

    .line 90
    .line 91
    iget-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    .line 92
    .line 93
    check-cast v11, Ll/bj60;

    .line 94
    .line 95
    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    .line 96
    .line 97
    check-cast v12, Ljava/util/Iterator;

    .line 98
    .line 99
    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    .line 100
    .line 101
    check-cast v12, Ll/bj60;

    .line 102
    .line 103
    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    .line 104
    .line 105
    check-cast v12, Ll/bj60;

    .line 106
    .line 107
    iget-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast v13, Ll/c3e;

    .line 110
    .line 111
    iget-object v14, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    .line 112
    .line 113
    check-cast v14, Lkotlin/collections/ArrayDeque;

    .line 114
    .line 115
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 116
    .line 117
    .line 118
    goto/16 :goto_4

    .line 119
    .line 120
    :cond_2
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    .line 121
    .line 122
    invoke-static {v3}, Ll/y2e;->a(Ljava/lang/Object;)Ljava/nio/file/Path;

    .line 123
    .line 124
    .line 125
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast v3, Ll/c3e;

    .line 128
    .line 129
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    .line 130
    .line 131
    check-cast v3, Ll/bj60;

    .line 132
    .line 133
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    .line 134
    .line 135
    check-cast v3, Lkotlin/sequences/SequenceScope;

    .line 136
    .line 137
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    .line 138
    .line 139
    check-cast v3, Lkotlin/io/path/PathTreeWalk;

    .line 140
    .line 141
    :goto_0
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    .line 142
    .line 143
    check-cast v3, Ll/bj60;

    .line 144
    .line 145
    iget-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    .line 146
    .line 147
    check-cast v4, Ll/c3e;

    .line 148
    .line 149
    iget-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    .line 150
    .line 151
    check-cast v7, Lkotlin/collections/ArrayDeque;

    .line 152
    .line 153
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    goto/16 :goto_3

    .line 157
    .line 158
    :cond_3
    iget-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    .line 159
    .line 160
    invoke-static {v3}, Ll/y2e;->a(Ljava/lang/Object;)Ljava/nio/file/Path;

    .line 161
    .line 162
    .line 163
    move-result-object v3

    .line 164
    iget-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    .line 165
    .line 166
    check-cast v4, Ll/c3e;

    .line 167
    .line 168
    iget-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    .line 169
    .line 170
    check-cast v7, Ll/bj60;

    .line 171
    .line 172
    iget-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    .line 173
    .line 174
    check-cast v10, Lkotlin/sequences/SequenceScope;

    .line 175
    .line 176
    iget-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    .line 177
    .line 178
    check-cast v10, Lkotlin/io/path/PathTreeWalk;

    .line 179
    .line 180
    iget-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    .line 181
    .line 182
    check-cast v11, Ll/bj60;

    .line 183
    .line 184
    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    .line 185
    .line 186
    check-cast v12, Ll/c3e;

    .line 187
    .line 188
    iget-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    .line 189
    .line 190
    check-cast v13, Lkotlin/collections/ArrayDeque;

    .line 191
    .line 192
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 193
    .line 194
    .line 195
    goto/16 :goto_1

    .line 196
    .line 197
    :cond_4
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 198
    .line 199
    .line 200
    new-instance v3, Lkotlin/collections/ArrayDeque;

    .line 201
    .line 202
    invoke-direct {v3}, Lkotlin/collections/ArrayDeque;-><init>()V

    .line 203
    .line 204
    .line 205
    new-instance v10, Ll/c3e;

    .line 206
    .line 207
    iget-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    .line 208
    .line 209
    invoke-static {v11}, Lkotlin/io/path/PathTreeWalk;->b(Lkotlin/io/path/PathTreeWalk;)Z

    .line 210
    .line 211
    .line 212
    move-result v11

    .line 213
    invoke-direct {v10, v11}, Ll/c3e;-><init>(Z)V

    .line 214
    .line 215
    .line 216
    new-instance v11, Ll/bj60;

    .line 217
    .line 218
    iget-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    .line 219
    .line 220
    invoke-static {v12}, Lkotlin/io/path/PathTreeWalk;->e(Lkotlin/io/path/PathTreeWalk;)Ljava/nio/file/Path;

    .line 221
    .line 222
    .line 223
    move-result-object v12

    .line 224
    iget-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    .line 225
    .line 226
    invoke-static {v13}, Lkotlin/io/path/PathTreeWalk;->e(Lkotlin/io/path/PathTreeWalk;)Ljava/nio/file/Path;

    .line 227
    .line 228
    .line 229
    move-result-object v13

    .line 230
    iget-object v14, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    .line 231
    .line 232
    invoke-static {v14}, Lkotlin/io/path/PathTreeWalk;->d(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    .line 233
    .line 234
    .line 235
    move-result-object v14

    .line 236
    invoke-static {v13, v14}, Lkotlin/io/path/PathTreeWalkKt;->b(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v13

    .line 240
    invoke-direct {v11, v12, v13, v4}, Ll/bj60;-><init>(Ljava/nio/file/Path;Ljava/lang/Object;Ll/bj60;)V

    .line 241
    .line 242
    .line 243
    iget-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    .line 244
    .line 245
    invoke-virtual {v11}, Ll/bj60;->d()Ljava/nio/file/Path;

    .line 246
    .line 247
    .line 248
    move-result-object v12

    .line 249
    invoke-virtual {v11}, Ll/bj60;->c()Ll/bj60;

    .line 250
    .line 251
    .line 252
    move-result-object v13

    .line 253
    if-eqz v13, :cond_5

    .line 254
    .line 255
    invoke-static {v12}, Lkotlin/io/path/PathsKt__PathRecursiveFunctionsKt;->c(Ljava/nio/file/Path;)V

    .line 256
    .line 257
    .line 258
    :cond_5
    invoke-static {v4}, Lkotlin/io/path/PathTreeWalk;->d(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    .line 259
    .line 260
    .line 261
    move-result-object v13

    .line 262
    array-length v14, v13

    .line 263
    invoke-static {v13, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object v13

    .line 267
    check-cast v13, [Ljava/nio/file/LinkOption;

    .line 268
    .line 269
    array-length v14, v13

    .line 270
    invoke-static {v13, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v13

    .line 274
    check-cast v13, [Ljava/nio/file/LinkOption;

    .line 275
    .line 276
    invoke-static {v12, v13}, Ll/oj60;->a(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    .line 277
    .line 278
    .line 279
    move-result v13

    .line 280
    if-eqz v13, :cond_a

    .line 281
    .line 282
    invoke-static {v11}, Lkotlin/io/path/PathTreeWalkKt;->a(Ll/bj60;)Z

    .line 283
    .line 284
    .line 285
    move-result v7

    .line 286
    if-nez v7, :cond_9

    .line 287
    .line 288
    invoke-static {v4}, Lkotlin/io/path/PathTreeWalk;->c(Lkotlin/io/path/PathTreeWalk;)Z

    .line 289
    .line 290
    .line 291
    move-result v7

    .line 292
    if-eqz v7, :cond_7

    .line 293
    .line 294
    iput-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    .line 295
    .line 296
    iput-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    .line 297
    .line 298
    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    .line 299
    .line 300
    iput-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    .line 301
    .line 302
    iput-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    .line 303
    .line 304
    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object v7

    .line 308
    iput-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    .line 309
    .line 310
    iput-object v11, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    .line 311
    .line 312
    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    .line 313
    .line 314
    iput-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    .line 315
    .line 316
    iput v8, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->I$0:I

    .line 317
    .line 318
    iput v9, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    .line 319
    .line 320
    invoke-virtual {v1, v12, v0}, Lkotlin/sequences/SequenceScope;->c(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object v7

    .line 324
    if-ne v7, v2, :cond_6

    .line 325
    .line 326
    goto/16 :goto_6

    .line 327
    .line 328
    :cond_6
    move-object v13, v3

    .line 329
    move-object v7, v11

    .line 330
    move-object v3, v12

    .line 331
    move-object v12, v10

    .line 332
    move-object v10, v4

    .line 333
    move-object v4, v12

    .line 334
    :goto_1
    move-object/from16 v16, v13

    .line 335
    .line 336
    move-object v13, v3

    .line 337
    move-object/from16 v3, v16

    .line 338
    .line 339
    move-object/from16 v16, v10

    .line 340
    .line 341
    move-object v10, v4

    .line 342
    move-object/from16 v4, v16

    .line 343
    .line 344
    move-object/from16 v16, v11

    .line 345
    .line 346
    move-object v11, v7

    .line 347
    move-object/from16 v7, v16

    .line 348
    .line 349
    goto :goto_2

    .line 350
    :cond_7
    move-object v7, v11

    .line 351
    move-object v13, v12

    .line 352
    move-object v12, v10

    .line 353
    :goto_2
    invoke-static {v4}, Lkotlin/io/path/PathTreeWalk;->d(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    .line 354
    .line 355
    .line 356
    move-result-object v4

    .line 357
    array-length v14, v4

    .line 358
    invoke-static {v4, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v4

    .line 362
    check-cast v4, [Ljava/nio/file/LinkOption;

    .line 363
    .line 364
    array-length v14, v4

    .line 365
    invoke-static {v4, v14}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 366
    .line 367
    .line 368
    move-result-object v4

    .line 369
    check-cast v4, [Ljava/nio/file/LinkOption;

    .line 370
    .line 371
    invoke-static {v13, v4}, Ll/oj60;->a(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    .line 372
    .line 373
    .line 374
    move-result v4

    .line 375
    if-eqz v4, :cond_8

    .line 376
    .line 377
    invoke-virtual {v10, v11}, Ll/c3e;->b(Ll/bj60;)Ljava/util/List;

    .line 378
    .line 379
    .line 380
    move-result-object v4

    .line 381
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 382
    .line 383
    .line 384
    move-result-object v4

    .line 385
    invoke-virtual {v7, v4}, Ll/bj60;->e(Ljava/util/Iterator;)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {v3, v7}, Lkotlin/collections/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 389
    .line 390
    .line 391
    :cond_8
    move-object v4, v7

    .line 392
    move-object v7, v3

    .line 393
    move-object v3, v4

    .line 394
    move-object v4, v12

    .line 395
    goto :goto_3

    .line 396
    :cond_9
    invoke-static {}, Ll/rj60;->a()V

    .line 397
    .line 398
    .line 399
    invoke-virtual {v12}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    invoke-static {v0}, Ll/qj60;->a(Ljava/lang/String;)Ljava/nio/file/FileSystemLoopException;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    throw v0

    .line 408
    :cond_a
    new-array v13, v9, [Ljava/nio/file/LinkOption;

    .line 409
    .line 410
    invoke-static {}, Ll/por;->a()Ljava/nio/file/LinkOption;

    .line 411
    .line 412
    .line 413
    move-result-object v14

    .line 414
    aput-object v14, v13, v8

    .line 415
    .line 416
    invoke-static {v13, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    move-result-object v13

    .line 420
    check-cast v13, [Ljava/nio/file/LinkOption;

    .line 421
    .line 422
    invoke-static {v12, v13}, Ll/pj60;->a(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    .line 423
    .line 424
    .line 425
    move-result v13

    .line 426
    if-eqz v13, :cond_b

    .line 427
    .line 428
    iput-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    .line 429
    .line 430
    iput-object v3, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    .line 431
    .line 432
    iput-object v10, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    .line 433
    .line 434
    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 435
    .line 436
    .line 437
    move-result-object v13

    .line 438
    iput-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    .line 439
    .line 440
    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    move-result-object v4

    .line 444
    iput-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    .line 445
    .line 446
    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object v4

    .line 450
    iput-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    .line 451
    .line 452
    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    move-result-object v4

    .line 456
    iput-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    .line 457
    .line 458
    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object v4

    .line 462
    iput-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    .line 463
    .line 464
    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 465
    .line 466
    .line 467
    move-result-object v4

    .line 468
    iput-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    .line 469
    .line 470
    iput v8, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->I$0:I

    .line 471
    .line 472
    iput v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    .line 473
    .line 474
    invoke-virtual {v1, v12, v0}, Lkotlin/sequences/SequenceScope;->c(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 475
    .line 476
    .line 477
    move-result-object v4

    .line 478
    if-ne v4, v2, :cond_b

    .line 479
    .line 480
    goto/16 :goto_6

    .line 481
    .line 482
    :cond_b
    move-object v7, v3

    .line 483
    move-object v4, v10

    .line 484
    move-object v3, v11

    .line 485
    :cond_c
    :goto_3
    invoke-interface {v7}, Ljava/util/Collection;->isEmpty()Z

    .line 486
    .line 487
    .line 488
    move-result v10

    .line 489
    if-nez v10, :cond_15

    .line 490
    .line 491
    invoke-virtual {v7}, Lkotlin/collections/ArrayDeque;->last()Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object v10

    .line 495
    check-cast v10, Ll/bj60;

    .line 496
    .line 497
    invoke-virtual {v10}, Ll/bj60;->a()Ljava/util/Iterator;

    .line 498
    .line 499
    .line 500
    move-result-object v11

    .line 501
    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 502
    .line 503
    .line 504
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    .line 505
    .line 506
    .line 507
    move-result v12

    .line 508
    if-eqz v12, :cond_14

    .line 509
    .line 510
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 511
    .line 512
    .line 513
    move-result-object v12

    .line 514
    check-cast v12, Ll/bj60;

    .line 515
    .line 516
    iget-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->this$0:Lkotlin/io/path/PathTreeWalk;

    .line 517
    .line 518
    invoke-virtual {v12}, Ll/bj60;->d()Ljava/nio/file/Path;

    .line 519
    .line 520
    .line 521
    move-result-object v14

    .line 522
    invoke-virtual {v12}, Ll/bj60;->c()Ll/bj60;

    .line 523
    .line 524
    .line 525
    move-result-object v15

    .line 526
    if-eqz v15, :cond_d

    .line 527
    .line 528
    invoke-static {v14}, Lkotlin/io/path/PathsKt__PathRecursiveFunctionsKt;->c(Ljava/nio/file/Path;)V

    .line 529
    .line 530
    .line 531
    :cond_d
    invoke-static {v13}, Lkotlin/io/path/PathTreeWalk;->d(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    .line 532
    .line 533
    .line 534
    move-result-object v15

    .line 535
    array-length v5, v15

    .line 536
    invoke-static {v15, v5}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 537
    .line 538
    .line 539
    move-result-object v5

    .line 540
    check-cast v5, [Ljava/nio/file/LinkOption;

    .line 541
    .line 542
    array-length v15, v5

    .line 543
    invoke-static {v5, v15}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 544
    .line 545
    .line 546
    move-result-object v5

    .line 547
    check-cast v5, [Ljava/nio/file/LinkOption;

    .line 548
    .line 549
    invoke-static {v14, v5}, Ll/oj60;->a(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    .line 550
    .line 551
    .line 552
    move-result v5

    .line 553
    if-eqz v5, :cond_13

    .line 554
    .line 555
    invoke-static {v12}, Lkotlin/io/path/PathTreeWalkKt;->a(Ll/bj60;)Z

    .line 556
    .line 557
    .line 558
    move-result v5

    .line 559
    if-nez v5, :cond_12

    .line 560
    .line 561
    invoke-static {v13}, Lkotlin/io/path/PathTreeWalk;->c(Lkotlin/io/path/PathTreeWalk;)Z

    .line 562
    .line 563
    .line 564
    move-result v5

    .line 565
    if-eqz v5, :cond_f

    .line 566
    .line 567
    iput-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    .line 568
    .line 569
    iput-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    .line 570
    .line 571
    iput-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    .line 572
    .line 573
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 574
    .line 575
    .line 576
    move-result-object v5

    .line 577
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    .line 578
    .line 579
    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 580
    .line 581
    .line 582
    move-result-object v5

    .line 583
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    .line 584
    .line 585
    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    .line 587
    .line 588
    move-result-object v5

    .line 589
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    .line 590
    .line 591
    iput-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    .line 592
    .line 593
    iput-object v13, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    .line 594
    .line 595
    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 596
    .line 597
    .line 598
    move-result-object v5

    .line 599
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    .line 600
    .line 601
    iput-object v12, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$9:Ljava/lang/Object;

    .line 602
    .line 603
    iput-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$10:Ljava/lang/Object;

    .line 604
    .line 605
    iput-object v14, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$11:Ljava/lang/Object;

    .line 606
    .line 607
    iput v8, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->I$0:I

    .line 608
    .line 609
    iput v6, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    .line 610
    .line 611
    invoke-virtual {v1, v14, v0}, Lkotlin/sequences/SequenceScope;->c(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 612
    .line 613
    .line 614
    move-result-object v5

    .line 615
    if-ne v5, v2, :cond_e

    .line 616
    .line 617
    goto/16 :goto_6

    .line 618
    .line 619
    :cond_e
    move-object v11, v12

    .line 620
    move-object v10, v13

    .line 621
    move-object v12, v3

    .line 622
    move-object v13, v4

    .line 623
    move-object v3, v14

    .line 624
    move-object v14, v7

    .line 625
    move-object v7, v11

    .line 626
    :goto_4
    move-object/from16 v16, v14

    .line 627
    .line 628
    move-object v14, v3

    .line 629
    move-object v3, v12

    .line 630
    move-object v12, v7

    .line 631
    move-object/from16 v7, v16

    .line 632
    .line 633
    goto :goto_5

    .line 634
    :cond_f
    move-object v11, v12

    .line 635
    move-object v10, v13

    .line 636
    move-object v13, v4

    .line 637
    :goto_5
    invoke-static {v10}, Lkotlin/io/path/PathTreeWalk;->d(Lkotlin/io/path/PathTreeWalk;)[Ljava/nio/file/LinkOption;

    .line 638
    .line 639
    .line 640
    move-result-object v5

    .line 641
    array-length v10, v5

    .line 642
    invoke-static {v5, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 643
    .line 644
    .line 645
    move-result-object v5

    .line 646
    check-cast v5, [Ljava/nio/file/LinkOption;

    .line 647
    .line 648
    array-length v10, v5

    .line 649
    invoke-static {v5, v10}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 650
    .line 651
    .line 652
    move-result-object v5

    .line 653
    check-cast v5, [Ljava/nio/file/LinkOption;

    .line 654
    .line 655
    invoke-static {v14, v5}, Ll/oj60;->a(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    .line 656
    .line 657
    .line 658
    move-result v5

    .line 659
    if-eqz v5, :cond_10

    .line 660
    .line 661
    invoke-virtual {v4, v12}, Ll/c3e;->b(Ll/bj60;)Ljava/util/List;

    .line 662
    .line 663
    .line 664
    move-result-object v4

    .line 665
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 666
    .line 667
    .line 668
    move-result-object v4

    .line 669
    invoke-virtual {v11, v4}, Ll/bj60;->e(Ljava/util/Iterator;)V

    .line 670
    .line 671
    .line 672
    invoke-virtual {v7, v11}, Lkotlin/collections/ArrayDeque;->addLast(Ljava/lang/Object;)V

    .line 673
    .line 674
    .line 675
    :cond_10
    move-object v4, v13

    .line 676
    :cond_11
    const/4 v5, 0x4

    .line 677
    goto/16 :goto_3

    .line 678
    .line 679
    :cond_12
    invoke-static {}, Ll/rj60;->a()V

    .line 680
    .line 681
    .line 682
    invoke-virtual {v14}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 683
    .line 684
    .line 685
    move-result-object v0

    .line 686
    invoke-static {v0}, Ll/qj60;->a(Ljava/lang/String;)Ljava/nio/file/FileSystemLoopException;

    .line 687
    .line 688
    .line 689
    move-result-object v0

    .line 690
    throw v0

    .line 691
    :cond_13
    new-array v5, v9, [Ljava/nio/file/LinkOption;

    .line 692
    .line 693
    invoke-static {}, Ll/por;->a()Ljava/nio/file/LinkOption;

    .line 694
    .line 695
    .line 696
    move-result-object v15

    .line 697
    aput-object v15, v5, v8

    .line 698
    .line 699
    invoke-static {v5, v9}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 700
    .line 701
    .line 702
    move-result-object v5

    .line 703
    check-cast v5, [Ljava/nio/file/LinkOption;

    .line 704
    .line 705
    invoke-static {v14, v5}, Ll/pj60;->a(Ljava/nio/file/Path;[Ljava/nio/file/LinkOption;)Z

    .line 706
    .line 707
    .line 708
    move-result v5

    .line 709
    if-eqz v5, :cond_11

    .line 710
    .line 711
    iput-object v1, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$0:Ljava/lang/Object;

    .line 712
    .line 713
    iput-object v7, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$1:Ljava/lang/Object;

    .line 714
    .line 715
    iput-object v4, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$2:Ljava/lang/Object;

    .line 716
    .line 717
    invoke-static {v3}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 718
    .line 719
    .line 720
    move-result-object v5

    .line 721
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$3:Ljava/lang/Object;

    .line 722
    .line 723
    invoke-static {v10}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 724
    .line 725
    .line 726
    move-result-object v5

    .line 727
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$4:Ljava/lang/Object;

    .line 728
    .line 729
    invoke-static {v11}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 730
    .line 731
    .line 732
    move-result-object v5

    .line 733
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$5:Ljava/lang/Object;

    .line 734
    .line 735
    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 736
    .line 737
    .line 738
    move-result-object v5

    .line 739
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$6:Ljava/lang/Object;

    .line 740
    .line 741
    invoke-static {v13}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 742
    .line 743
    .line 744
    move-result-object v5

    .line 745
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$7:Ljava/lang/Object;

    .line 746
    .line 747
    invoke-static {v1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 748
    .line 749
    .line 750
    move-result-object v5

    .line 751
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$8:Ljava/lang/Object;

    .line 752
    .line 753
    invoke-static {v12}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 754
    .line 755
    .line 756
    move-result-object v5

    .line 757
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$9:Ljava/lang/Object;

    .line 758
    .line 759
    invoke-static {v4}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 760
    .line 761
    .line 762
    move-result-object v5

    .line 763
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$10:Ljava/lang/Object;

    .line 764
    .line 765
    invoke-static {v14}, Lkotlin/coroutines/jvm/internal/SpillingKt;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 766
    .line 767
    .line 768
    move-result-object v5

    .line 769
    iput-object v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->L$11:Ljava/lang/Object;

    .line 770
    .line 771
    iput v8, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->I$0:I

    .line 772
    .line 773
    const/4 v5, 0x4

    .line 774
    iput v5, v0, Lkotlin/io/path/PathTreeWalk$dfsIterator$1;->label:I

    .line 775
    .line 776
    invoke-virtual {v1, v14, v0}, Lkotlin/sequences/SequenceScope;->c(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 777
    .line 778
    .line 779
    move-result-object v10

    .line 780
    if-ne v10, v2, :cond_c

    .line 781
    .line 782
    :goto_6
    return-object v2

    .line 783
    :cond_14
    invoke-virtual {v7}, Lkotlin/collections/ArrayDeque;->removeLast()Ljava/lang/Object;

    .line 784
    .line 785
    .line 786
    goto/16 :goto_3

    .line 787
    .line 788
    :cond_15
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 789
    .line 790
    return-object v0
.end method
