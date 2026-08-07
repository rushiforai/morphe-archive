.class final Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->c(Ll/zgi;Ll/ngi;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/tgi;",
        "Ljava/lang/Throwable;",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0003\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0007\u001a\u00020\u00042\u0008\u0010\u0001\u001a\u0004\u0018\u00010\u00002\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002H\n\u00a2\u0006\u0004\u0008\u0005\u0010\u0006"
    }
    d2 = {
        "Ll/tgi;",
        "checkResult",
        "",
        "error",
        "",
        "invoke",
        "(Ll/tgi;Ljava/lang/Throwable;)V",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field final synthetic $currentUrl:Ljava/lang/String;

.field final synthetic $info:Lkotlin/jvm/internal/Ref$ObjectRef;

.field final synthetic $recordData:Ljava/util/Map;

.field final synthetic this$0:Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;Lkotlin/jvm/internal/Ref$ObjectRef;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;

    iput-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    iput-object p3, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$currentUrl:Ljava/lang/String;

    iput-object p4, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$recordData:Ljava/util/Map;

    const/4 p1, 0x2

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 414
    check-cast p1, Ll/tgi;

    check-cast p2, Ljava/lang/Throwable;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->invoke(Ll/tgi;Ljava/lang/Throwable;)V

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public final invoke(Ll/tgi;Ljava/lang/Throwable;)V
    .locals 9
    .param p1    # Ll/tgi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 4
    .line 5
    iget-object p0, p0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ll/zgi;

    .line 8
    .line 9
    sget-object p1, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->Failed:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 18
    .line 19
    iget-object p0, p0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ll/zgi;

    .line 22
    .line 23
    sget-object p1, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->Failed:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-virtual {p1}, Ll/tgi;->f()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    invoke-static {p2}, Ll/jhi;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 42
    .line 43
    iget-object v0, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, Ll/zgi;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/zgi;->d()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_2

    .line 56
    .line 57
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 64
    .line 65
    iget-object v0, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast v0, Ll/zgi;

    .line 68
    .line 69
    invoke-virtual {v0}, Ll/zgi;->e()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    const-string v2, "bid"

    .line 74
    .line 75
    invoke-static {v2, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 80
    .line 81
    iget-object v2, v2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 82
    .line 83
    check-cast v2, Ll/zgi;

    .line 84
    .line 85
    invoke-virtual {v2}, Ll/zgi;->d()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    const-string v3, "baseVersion"

    .line 90
    .line 91
    invoke-static {v3, v2}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {p1}, Ll/tgi;->f()J

    .line 96
    .line 97
    .line 98
    move-result-wide v3

    .line 99
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v3

    .line 103
    const-string v4, "serverBaseVersion"

    .line 104
    .line 105
    invoke-static {v4, v3}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    filled-new-array {v0, v2, v3}, [Lkotlin/Pair;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Lkotlin/collections/MapsKt;->hashMapOf([Lkotlin/Pair;)Ljava/util/HashMap;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    const/4 v6, 0x6

    .line 118
    const/4 v7, 0x0

    .line 119
    const-string v2, "Check update process start, but baseVersion is not match, use server baseVersion"

    .line 120
    .line 121
    const/4 v3, 0x0

    .line 122
    const/4 v4, 0x0

    .line 123
    invoke-static/range {v1 .. v7}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    sget-object v0, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iget-object v1, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 133
    .line 134
    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast v1, Ll/zgi;

    .line 137
    .line 138
    invoke-virtual {v1}, Ll/zgi;->e()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    iget-object v2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 143
    .line 144
    iget-object v2, v2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 145
    .line 146
    check-cast v2, Ll/zgi;

    .line 147
    .line 148
    invoke-virtual {v2}, Ll/zgi;->k()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    sget-object v3, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 153
    .line 154
    invoke-virtual {v0, v1, p2, v2, v3}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    if-eqz p2, :cond_2

    .line 159
    .line 160
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 161
    .line 162
    iput-object p2, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 163
    .line 164
    :cond_2
    iget-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 165
    .line 166
    iget-object p2, p2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 167
    .line 168
    check-cast p2, Ll/zgi;

    .line 169
    .line 170
    invoke-virtual {p1}, Ll/tgi;->g()Lorg/json/JSONObject;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {p2, v0}, Ll/zgi;->s(Lorg/json/JSONObject;)V

    .line 175
    .line 176
    .line 177
    iget-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;

    .line 178
    .line 179
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 180
    .line 181
    iget-object v0, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 182
    .line 183
    check-cast v0, Ll/zgi;

    .line 184
    .line 185
    invoke-static {p2, v0, p1}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->b(Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;Ll/zgi;Ll/tgi;)Z

    .line 186
    .line 187
    .line 188
    move-result p2

    .line 189
    if-eqz p2, :cond_3

    .line 190
    .line 191
    iget-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 192
    .line 193
    iget-object p2, p2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 194
    .line 195
    check-cast p2, Ll/zgi;

    .line 196
    .line 197
    invoke-virtual {p2}, Ll/zgi;->i()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    if-eqz p2, :cond_3

    .line 202
    .line 203
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 204
    .line 205
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->k()Ll/chi;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    new-instance v2, Ljava/io/File;

    .line 210
    .line 211
    invoke-direct {v2, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v1, v2}, Ll/chi;->b(Ljava/io/File;)Z

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->i()Ll/ahi;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    iget-object v1, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 222
    .line 223
    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 224
    .line 225
    check-cast v1, Ll/zgi;

    .line 226
    .line 227
    invoke-virtual {v1}, Ll/zgi;->e()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    iget-object v2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 232
    .line 233
    iget-object v2, v2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 234
    .line 235
    check-cast v2, Ll/zgi;

    .line 236
    .line 237
    invoke-virtual {v2}, Ll/zgi;->d()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    invoke-virtual {p2, v1, v2}, Ll/ahi;->h(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 245
    .line 246
    .line 247
    move-result-object v3

    .line 248
    iget-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 249
    .line 250
    iget-object p2, p2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 251
    .line 252
    check-cast p2, Ll/zgi;

    .line 253
    .line 254
    invoke-virtual {p2}, Ll/zgi;->e()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v4

    .line 258
    iget-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 259
    .line 260
    iget-object p2, p2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 261
    .line 262
    check-cast p2, Ll/zgi;

    .line 263
    .line 264
    invoke-virtual {p2}, Ll/zgi;->d()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v5

    .line 268
    const/4 v7, 0x4

    .line 269
    const/4 v8, 0x0

    .line 270
    const/4 v6, 0x0

    .line 271
    invoke-static/range {v3 .. v8}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->n(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;ILjava/lang/Object;)V

    .line 272
    .line 273
    .line 274
    iget-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 275
    .line 276
    iget-object p2, p2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 277
    .line 278
    check-cast p2, Ll/zgi;

    .line 279
    .line 280
    sget-object v0, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->None:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 281
    .line 282
    invoke-virtual {p2, v0}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 283
    .line 284
    .line 285
    :cond_3
    sget-object p2, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 286
    .line 287
    invoke-virtual {p2}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->r()Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    iget-object v1, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 292
    .line 293
    iget-object v1, v1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 294
    .line 295
    check-cast v1, Ll/zgi;

    .line 296
    .line 297
    invoke-virtual {v1}, Ll/zgi;->e()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    iget-object v2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 302
    .line 303
    iget-object v2, v2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 304
    .line 305
    check-cast v2, Ll/zgi;

    .line 306
    .line 307
    invoke-virtual {v2}, Ll/zgi;->d()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v2

    .line 311
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->F(Ljava/lang/String;Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {p1}, Ll/tgi;->j()Z

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    if-nez v0, :cond_4

    .line 319
    .line 320
    iget-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 321
    .line 322
    iget-object p1, p1, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 323
    .line 324
    check-cast p1, Ll/zgi;

    .line 325
    .line 326
    sget-object v0, Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;->Ready:Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;

    .line 327
    .line 328
    invoke-virtual {p1, v0}, Ll/zgi;->u(Lcom/hellogroup/fep/feppkg/model/FepPackageStatus;)V

    .line 329
    .line 330
    .line 331
    invoke-virtual {p2}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    new-instance p1, Ljava/lang/StringBuilder;

    .line 336
    .line 337
    const-string p2, "FepPackageUpdateModule: skip currentUrl="

    .line 338
    .line 339
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    iget-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$currentUrl:Ljava/lang/String;

    .line 343
    .line 344
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    const-string p2, ", bid="

    .line 348
    .line 349
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    iget-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 353
    .line 354
    iget-object p2, p2, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 355
    .line 356
    check-cast p2, Ll/zgi;

    .line 357
    .line 358
    invoke-virtual {p2}, Ll/zgi;->e()Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object p2

    .line 362
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    const-string p2, ",baseVer="

    .line 366
    .line 367
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 368
    .line 369
    .line 370
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 371
    .line 372
    iget-object p0, p0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 373
    .line 374
    check-cast p0, Ll/zgi;

    .line 375
    .line 376
    invoke-virtual {p0}, Ll/zgi;->d()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object p0

    .line 380
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 381
    .line 382
    .line 383
    const-string p0, ", no new version"

    .line 384
    .line 385
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    .line 387
    .line 388
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object v2

    .line 392
    const/4 v5, 0x6

    .line 393
    const/4 v6, 0x0

    .line 394
    const/4 v3, 0x0

    .line 395
    const/4 v4, 0x0

    .line 396
    invoke-static/range {v1 .. v6}, Ll/pgi;->f(Ll/pgi;Ljava/lang/String;Ljava/util/Map;IILjava/lang/Object;)V

    .line 397
    .line 398
    .line 399
    return-void

    .line 400
    :cond_4
    iget-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;

    .line 401
    .line 402
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$info:Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 403
    .line 404
    iget-object v0, v0, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 405
    .line 406
    check-cast v0, Ll/zgi;

    .line 407
    .line 408
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule$checkAndUpdate$1;->$recordData:Ljava/util/Map;

    .line 409
    .line 410
    invoke-static {p2, v0, p1, p0}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->a(Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;Ll/zgi;Ll/tgi;Ljava/util/Map;)V

    .line 411
    .line 412
    .line 413
    return-void
.end method
