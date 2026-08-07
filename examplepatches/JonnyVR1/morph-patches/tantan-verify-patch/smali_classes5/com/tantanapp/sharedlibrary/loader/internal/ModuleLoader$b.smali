.class public final Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wdr;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader;->j(Lcom/tantanapp/sharedlibrary/loader/a;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;Ljava/util/Map;)Ll/q5d0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0006J\u0017\u0010\u0008\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\u0006\u00a8\u0006\t"
    }
    d2 = {
        "com/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b",
        "Ll/wdr;",
        "",
        "p0",
        "",
        "a",
        "(I)V",
        "b",
        "c",
        "loader_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final synthetic a:Ll/n1;

.field public final synthetic b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic c:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

.field public final synthetic d:[Ll/q5d0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ll/q5d0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Ll/n1;Ljava/util/Map;Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;[Ll/q5d0;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/n1;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;",
            "[",
            "Ll/q5d0<",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/util/concurrent/CountDownLatch;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->a:Ll/n1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->b:Ljava/util/Map;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->c:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->d:[Ll/q5d0;

    .line 8
    .line 9
    iput-object p5, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->e:Ljava/util/concurrent/CountDownLatch;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 12

    .line 1
    iget-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->a:Ll/n1;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/n1;->f()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    if-lez p1, :cond_5

    .line 9
    .line 10
    iget-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->a:Ll/n1;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Ll/n1;->e(I)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v7

    .line 16
    iget-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->a:Ll/n1;

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Ll/n1;->d(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    new-instance p1, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    const-string v1, "fetchObbInfo: url="

    .line 25
    .line 26
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v1, ", name="

    .line 33
    .line 34
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-static {p1}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->b:Ljava/util/Map;

    .line 48
    .line 49
    const-string v11, "missing_zip_info_list"

    .line 50
    .line 51
    invoke-interface {p1, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    .line 57
    .line 58
    check-cast p1, Ljava/util/List;

    .line 59
    .line 60
    check-cast p1, Ljava/util/Collection;

    .line 61
    .line 62
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->toMutableList(Ljava/util/Collection;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->c:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;->getObbZipInfo()Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    new-instance v2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v4, "fetchObbInfo obbZipInfo="

    .line 75
    .line 76
    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const/16 v4, 0x2c

    .line 87
    .line 88
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getUrl()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v5

    .line 95
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-static {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    move-object v2, p1

    .line 106
    check-cast v2, Ljava/lang/Iterable;

    .line 107
    .line 108
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 113
    .line 114
    .line 115
    move-result v5

    .line 116
    const/4 v6, 0x0

    .line 117
    if-eqz v5, :cond_1

    .line 118
    .line 119
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    move-object v8, v5

    .line 124
    check-cast v8, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 125
    .line 126
    invoke-virtual {v8}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getName()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getName()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v10

    .line 134
    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v9

    .line 138
    if-eqz v9, :cond_0

    .line 139
    .line 140
    invoke-virtual {v8}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getAbi()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v9

    .line 144
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getAbi()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v10

    .line 148
    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    if-eqz v9, :cond_0

    .line 153
    .line 154
    invoke-virtual {v8}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getMd5()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v8

    .line 158
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getMd5()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v9

    .line 162
    invoke-static {v8, v9}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    move-result v8

    .line 166
    if-eqz v8, :cond_0

    .line 167
    .line 168
    goto :goto_0

    .line 169
    :cond_1
    move-object v5, v6

    .line 170
    :goto_0
    move-object v1, v5

    .line 171
    check-cast v1, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 172
    .line 173
    new-instance v2, Ljava/lang/StringBuilder;

    .line 174
    .line 175
    const-string v5, "fetchObbInfo findZipInfo="

    .line 176
    .line 177
    invoke-direct {v2, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    if-eqz v1, :cond_2

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getName()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    goto :goto_1

    .line 187
    :cond_2
    move-object v5, v6

    .line 188
    :goto_1
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    if-eqz v1, :cond_3

    .line 195
    .line 196
    invoke-virtual {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getUrl()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v6

    .line 200
    :cond_3
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-static {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    if-eqz v1, :cond_4

    .line 211
    .line 212
    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 219
    .line 220
    .line 221
    const/16 v9, 0x2d

    .line 222
    .line 223
    const/4 v10, 0x0

    .line 224
    const/4 v2, 0x0

    .line 225
    const/4 v4, 0x0

    .line 226
    const-wide/16 v5, 0x0

    .line 227
    .line 228
    const/4 v8, 0x0

    .line 229
    invoke-static/range {v1 .. v10}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->copy$default(Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/util/List;ILjava/lang/Object;)Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    iget-object v1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->b:Ljava/util/Map;

    .line 237
    .line 238
    invoke-interface {v1, v11, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 239
    .line 240
    .line 241
    :cond_4
    iget-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->c:Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 242
    .line 243
    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 247
    .line 248
    .line 249
    invoke-virtual {p1, v7, v3}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;->setObbInfo(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    iget-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->d:[Ll/q5d0;

    .line 253
    .line 254
    sget-object v1, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 255
    .line 256
    invoke-virtual {v1}, Ll/q5d0$a;->d()Ll/q5d0;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    aput-object v1, p1, v0

    .line 261
    .line 262
    goto :goto_2

    .line 263
    :cond_5
    iget-object p1, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->d:[Ll/q5d0;

    .line 264
    .line 265
    sget-object v1, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 266
    .line 267
    const-string v2, "LicenseChecker get url failed"

    .line 268
    .line 269
    invoke-virtual {v1, v2}, Ll/q5d0$a;->a(Ljava/lang/String;)Ll/q5d0;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    aput-object v1, p1, v0

    .line 274
    .line 275
    :goto_2
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->e:Ljava/util/concurrent/CountDownLatch;

    .line 276
    .line 277
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 278
    .line 279
    .line 280
    return-void
.end method

.method public b(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->d:[Ll/q5d0;

    .line 2
    .line 3
    sget-object v1, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "LicenseChecker dontAllow: "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v1, p1}, Ll/q5d0$a;->c(Ljava/lang/String;)Ll/q5d0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v1, 0x0

    .line 24
    aput-object p1, v0, v1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->e:Ljava/util/concurrent/CountDownLatch;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public c(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->d:[Ll/q5d0;

    .line 2
    .line 3
    sget-object v1, Ll/q5d0;->Companion:Ll/q5d0$a;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "LicenseChecker applicationError: "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {v1, p1}, Ll/q5d0$a;->c(Ljava/lang/String;)Ll/q5d0;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    const/4 v1, 0x0

    .line 24
    aput-object p1, v0, v1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleLoader$b;->e:Ljava/util/concurrent/CountDownLatch;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 29
    .line 30
    .line 31
    return-void
.end method
