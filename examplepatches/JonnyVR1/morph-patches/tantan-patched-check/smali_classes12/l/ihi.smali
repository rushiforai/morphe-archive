.class public final Ll/ihi;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J)\u0010\t\u001a\u00020\u00082\u001a\u0010\u0007\u001a\u0016\u0012\u0012\u0012\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00050\u0004\u00a2\u0006\u0004\u0008\t\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Ll/ihi;",
        "",
        "<init>",
        "()V",
        "",
        "",
        "",
        "packageConfs",
        "",
        "a",
        "(Ljava/util/List;)V",
        "FEP_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;)V
    .locals 8
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "+",
            "Ljava/lang/Object;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const-string p0, "bid"

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object p0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/16 v5, 0xe

    .line 19
    .line 20
    const/4 v6, 0x0

    .line 21
    const-string v1, "Preload: packageConfs is empty"

    .line 22
    .line 23
    const/4 v2, 0x0

    .line 24
    const/4 v3, 0x0

    .line 25
    const/4 v4, 0x0

    .line 26
    invoke-static/range {v0 .. v6}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    check-cast p1, Ljava/lang/Iterable;

    .line 31
    .line 32
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_4

    .line 41
    .line 42
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ljava/util/Map;

    .line 47
    .line 48
    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    if-eqz v1, :cond_1

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    const-string v2, "newest_version"

    .line 61
    .line 62
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    if-eqz v2, :cond_1

    .line 67
    .line 68
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    if-eqz v2, :cond_1

    .line 73
    .line 74
    invoke-static {v2}, Ll/jhi;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    if-eqz v2, :cond_1

    .line 79
    .line 80
    invoke-static {v1}, Lkotlin/text/StringsKt;->e0(Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    if-eqz v3, :cond_2

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    sget-object v3, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->Companion:Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;

    .line 88
    .line 89
    invoke-virtual {v3}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager$a;->a()Lcom/hellogroup/fep/feppkg/core/FepPackageManager;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    sget-object v4, Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;->LOCAL_ONLY:Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;

    .line 94
    .line 95
    const/4 v5, 0x0

    .line 96
    invoke-virtual {v3, v1, v2, v5, v4}, Lcom/hellogroup/fep/feppkg/core/FepPackageManager;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/hellogroup/fep/feppkg/internal/core/CheckPolicy;)Ll/zgi;

    .line 97
    .line 98
    .line 99
    move-result-object v2

    .line 100
    if-eqz v2, :cond_1

    .line 101
    .line 102
    invoke-static {p0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    const-string v4, "preloadData"

    .line 107
    .line 108
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    invoke-static {v4, v6}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 113
    .line 114
    .line 115
    move-result-object v4

    .line 116
    filled-new-array {v3, v4}, [Lkotlin/Pair;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-static {v3}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    const-string v4, "FepPackagePreloadModule-preload"

    .line 125
    .line 126
    invoke-static {v3, v4}, Ll/xgi;->a(Ljava/util/Map;Ljava/lang/String;)Ljava/util/Map;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    sget-object v4, Ll/tgi;->Companion:Ll/tgi$a;

    .line 131
    .line 132
    invoke-virtual {v4, v0, v1}, Ll/tgi$a;->d(Ljava/util/Map;Ljava/lang/String;)Ll/tgi;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v2}, Ll/zgi;->g()J

    .line 137
    .line 138
    .line 139
    move-result-wide v6

    .line 140
    invoke-virtual {v0, v6, v7}, Ll/tgi;->l(J)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2}, Ll/zgi;->p()Z

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    if-eqz v4, :cond_3

    .line 148
    .line 149
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 150
    .line 151
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    new-instance v2, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 158
    .line 159
    .line 160
    const-string v3, "Preload: skip "

    .line 161
    .line 162
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    const-string v1, ", update in progress"

    .line 169
    .line 170
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    const/4 v2, 0x2

    .line 178
    invoke-static {v0, v1, v5, v2, v5}, Ll/pgi;->b(Ll/pgi;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :catch_0
    move-exception v0

    .line 184
    move-object v3, v0

    .line 185
    goto :goto_1

    .line 186
    :cond_3
    sget-object v1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 187
    .line 188
    invoke-virtual {v1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->t()Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v1, v2, v0, v3}, Lcom/hellogroup/fep/feppkg/internal/module/update/FepPackageUpdateModule;->h(Ll/zgi;Ll/tgi;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 193
    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :goto_1
    sget-object v0, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 198
    .line 199
    invoke-virtual {v0}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    new-instance v0, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    const-string v2, "Preload package failed: "

    .line 206
    .line 207
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v2

    .line 221
    const/16 v6, 0xc

    .line 222
    .line 223
    const/4 v7, 0x0

    .line 224
    const/4 v4, 0x0

    .line 225
    const/4 v5, 0x0

    .line 226
    invoke-static/range {v1 .. v7}, Ll/pgi;->k(Ll/pgi;Ljava/lang/String;Ljava/lang/Throwable;ILjava/util/Map;ILjava/lang/Object;)V

    .line 227
    .line 228
    .line 229
    goto/16 :goto_0

    .line 230
    .line 231
    :cond_4
    return-void
.end method
