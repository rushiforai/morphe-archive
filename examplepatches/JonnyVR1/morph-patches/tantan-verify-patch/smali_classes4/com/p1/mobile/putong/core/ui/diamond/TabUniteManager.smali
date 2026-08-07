.class public Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;
    }
.end annotation


# static fields
.field public static volatile m:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;


# instance fields
.field public final a:Ll/byd0;

.field public final b:Ll/vxd0;

.field public final c:Ll/vxd0;

.field public final d:Ll/byd0;

.field public final e:Ll/byd0;

.field public final f:Ll/byd0;

.field public final g:Ll/jxd0;

.field public final h:Ll/vxd0;

.field public final i:Ll/byd0;

.field public j:Z

.field public final k:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/kcg0;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "tab_unite_time_"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->a:Ll/byd0;

    .line 38
    .line 39
    new-instance v0, Ll/vxd0;

    .line 40
    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    const-string v3, "tab_unite_online_time_"

    .line 44
    .line 45
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/4 v3, 0x0

    .line 64
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->b:Ll/vxd0;

    .line 68
    .line 69
    new-instance v0, Ll/vxd0;

    .line 70
    .line 71
    new-instance v1, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v4, "tab_unite_super_time_"

    .line 74
    .line 75
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v4

    .line 86
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 94
    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->c:Ll/vxd0;

    .line 97
    .line 98
    new-instance v0, Ll/byd0;

    .line 99
    .line 100
    new-instance v1, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v4, "tab_unite_show_promotion_time_"

    .line 103
    .line 104
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 123
    .line 124
    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->d:Ll/byd0;

    .line 126
    .line 127
    new-instance v0, Ll/byd0;

    .line 128
    .line 129
    new-instance v1, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    const-string v4, "tab_unite_show_see_time_"

    .line 132
    .line 133
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 152
    .line 153
    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->e:Ll/byd0;

    .line 155
    .line 156
    new-instance v0, Ll/byd0;

    .line 157
    .line 158
    new-instance v1, Ljava/lang/StringBuilder;

    .line 159
    .line 160
    const-string v4, "tab_unite_show_boost_time_"

    .line 161
    .line 162
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 181
    .line 182
    .line 183
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->f:Ll/byd0;

    .line 184
    .line 185
    new-instance v0, Ll/jxd0;

    .line 186
    .line 187
    new-instance v1, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    const-string v4, "tab_unite_boost_third_time_"

    .line 190
    .line 191
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v4

    .line 202
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 210
    .line 211
    invoke-direct {v0, v1, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 212
    .line 213
    .line 214
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->g:Ll/jxd0;

    .line 215
    .line 216
    new-instance v0, Ll/vxd0;

    .line 217
    .line 218
    new-instance v1, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    const-string v4, "tab_unite_boost_time_"

    .line 221
    .line 222
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v4

    .line 233
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 241
    .line 242
    .line 243
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->h:Ll/vxd0;

    .line 244
    .line 245
    new-instance v0, Ll/byd0;

    .line 246
    .line 247
    new-instance v1, Ljava/lang/StringBuilder;

    .line 248
    .line 249
    const-string v4, "tab_unite_show_o_diamond_time_"

    .line 250
    .line 251
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 255
    .line 256
    .line 257
    move-result-object v4

    .line 258
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    invoke-direct {v0, v1, v2}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 270
    .line 271
    .line 272
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->i:Ll/byd0;

    .line 273
    .line 274
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->j:Z

    .line 275
    .line 276
    sget-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->NONE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 277
    .line 278
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->k:Lrx/subjects/a;

    .line 283
    .line 284
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->k()V

    .line 285
    .line 286
    .line 287
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 2
    .line 3
    const-string v1, "tttVip"

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    if-ne v0, v2, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Le(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->pj(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 40
    .line 41
    const-string v1, "svip"

    .line 42
    .line 43
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/ProductCategory;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    if-ne v0, v2, :cond_2

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->Zs(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_1

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->pj(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-eqz p0, :cond_2

    .line 76
    .line 77
    :cond_1
    const/4 p0, 0x1

    .line 78
    goto :goto_0

    .line 79
    :cond_2
    const/4 p0, 0x0

    .line 80
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ljava/util/List;Lcom/p1/mobile/putong/core/api/CoreLikers$a;Lcom/p1/mobile/putong/data/Counter;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->n(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->o(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->m(Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;)V

    return-void
.end method

.method public static i()Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->m:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->m:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->m:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->m:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public h(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->ODIAMOND:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 13
    .line 14
    if-ne p1, v2, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->i:Ll/byd0;

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->PROMOTION:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 23
    .line 24
    if-ne p1, v2, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->d:Ll/byd0;

    .line 27
    .line 28
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->SEE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 33
    .line 34
    if-ne p1, v2, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->e:Ll/byd0;

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->BOOST_ONCE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 43
    .line 44
    if-ne p1, v2, :cond_3

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->g:Ll/jxd0;

    .line 47
    .line 48
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->h:Ll/vxd0;

    .line 54
    .line 55
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->BOOST:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 60
    .line 61
    if-ne p1, v2, :cond_4

    .line 62
    .line 63
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->f:Ll/byd0;

    .line 64
    .line 65
    invoke-virtual {p1, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->h:Ll/vxd0;

    .line 69
    .line 70
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->NONE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 75
    .line 76
    if-ne p1, v2, :cond_5

    .line 77
    .line 78
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->d:Ll/byd0;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->e:Ll/byd0;

    .line 84
    .line 85
    invoke-virtual {p1, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->f:Ll/byd0;

    .line 89
    .line 90
    invoke-virtual {p1, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->g:Ll/jxd0;

    .line 94
    .line 95
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 96
    .line 97
    invoke-virtual {p1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->h:Ll/vxd0;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->i:Ll/byd0;

    .line 106
    .line 107
    invoke-virtual {p0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    :cond_5
    return-void
.end method

.method public final j()I
    .locals 2

    .line 1
    const/4 p0, 0x1

    .line 2
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    const-string v1, "me_badge_icon_see_configs"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    new-instance v1, Lorg/json/JSONObject;

    .line 19
    .line 20
    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const-string v0, "see_interval_days"

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    .line 30
    .line 31
    .line 32
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 33
    :catch_0
    :cond_0
    return p0
.end method

.method public final k()V
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->f()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/bzh0;

    .line 27
    .line 28
    invoke-direct {v1}, Ll/bzh0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-wide/16 v2, 0x1

    .line 41
    .line 42
    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 43
    .line 44
    invoke-virtual {v0, v2, v3, v4}, Lrx/c;->delay(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v2, Ll/czh0;

    .line 57
    .line 58
    invoke-direct {v2, p0}, Ll/czh0;-><init>(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->a:Ll/byd0;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/Long;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 77
    .line 78
    .line 79
    move-result-wide v2

    .line 80
    invoke-static {v2, v3}, Ll/pzi0;->D(J)Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_1

    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->a:Ll/byd0;

    .line 87
    .line 88
    invoke-static {}, Ll/pzi0;->o()J

    .line 89
    .line 90
    .line 91
    move-result-wide v2

    .line 92
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 93
    .line 94
    .line 95
    move-result-object v2

    .line 96
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 102
    .line 103
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    new-instance v3, Ll/dzh0;

    .line 114
    .line 115
    invoke-direct {v3}, Ll/dzh0;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-static {v0, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    new-instance v2, Ll/ezh0;

    .line 127
    .line 128
    invoke-direct {v2, p0}, Ll/ezh0;-><init>(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;)V

    .line 129
    .line 130
    .line 131
    new-instance v3, Ll/fzh0;

    .line 132
    .line 133
    invoke-direct {v3}, Ll/fzh0;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-static {v2, v3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-virtual {v0, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 141
    .line 142
    .line 143
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 144
    .line 145
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreLikers;->c7()Lrx/c;

    .line 148
    .line 149
    .line 150
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 151
    .line 152
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->E4()Lrx/subjects/a;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 163
    .line 164
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->u0:Lcom/p1/mobile/putong/core/api/CoreLikers;

    .line 165
    .line 166
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/CoreLikers;->T6()Lrx/c;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v2, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 175
    .line 176
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/c;->n3()Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    new-instance v3, Ll/gzh0;

    .line 181
    .line 182
    invoke-direct {v3}, Ll/gzh0;-><init>()V

    .line 183
    .line 184
    .line 185
    invoke-static {v0, v1, v2, v3}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    new-instance v1, Ll/hzh0;

    .line 194
    .line 195
    invoke-direct {v1, p0}, Ll/hzh0;-><init>(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;)V

    .line 196
    .line 197
    .line 198
    new-instance v2, Ll/izh0;

    .line 199
    .line 200
    invoke-direct {v2}, Ll/izh0;-><init>()V

    .line 201
    .line 202
    .line 203
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->l:Ll/kcg0;

    .line 212
    .line 213
    return-void
.end method

.method public final l()Z
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->d:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->e:Ll/byd0;

    .line 14
    .line 15
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Ljava/lang/Long;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->f:Ll/byd0;

    .line 26
    .line 27
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    check-cast v4, Ljava/lang/Long;

    .line 32
    .line 33
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 34
    .line 35
    .line 36
    move-result-wide v4

    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->i:Ll/byd0;

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Ljava/lang/Long;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 46
    .line 47
    .line 48
    move-result-wide v6

    .line 49
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_1

    .line 54
    .line 55
    invoke-static {v2, v3}, Ll/pzi0;->D(J)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_1

    .line 60
    .line 61
    invoke-static {v4, v5}, Ll/pzi0;->D(J)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-nez p0, :cond_1

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-interface {p0}, Ll/r97;->f()Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_0

    .line 80
    .line 81
    invoke-static {v6, v7}, Ll/pzi0;->D(J)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_0

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_0
    const/4 p0, 0x0

    .line 89
    return p0

    .line 90
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 91
    return p0
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/core/data/MonetizationConfiguration;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->i:Ll/byd0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Long;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    sget-object p1, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->NONE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/api/t$a;->N()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    const-wide/16 v2, 0x0

    .line 28
    .line 29
    cmp-long v0, v0, v2

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Ll/joa;->G3()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->ODIAMOND:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move-object v0, p1

    .line 43
    :goto_0
    if-eq v0, p1, :cond_1

    .line 44
    .line 45
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->j:Z

    .line 46
    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    const/4 p1, 0x1

    .line 50
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->j:Z

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->q(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->k:Lrx/subjects/a;

    .line 56
    .line 57
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public final synthetic n(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->b:Ll/vxd0;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->b3()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->c:Ll/vxd0;

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 31
    .line 32
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->remainAll()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic o(Landroid/util/Pair;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Landroid/util/Pair;

    .line 10
    .line 11
    iget-object v0, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/util/Collection;

    .line 14
    .line 15
    new-instance v1, Ll/jzh0;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/jzh0;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->d:Ll/byd0;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ljava/lang/Long;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->e:Ll/byd0;

    .line 43
    .line 44
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Ljava/lang/Long;

    .line 49
    .line 50
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 51
    .line 52
    .line 53
    move-result-wide v3

    .line 54
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->i:Ll/byd0;

    .line 55
    .line 56
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    check-cast v5, Ljava/lang/Long;

    .line 61
    .line 62
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide v5

    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    invoke-virtual {v7}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    invoke-interface {v7}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Nf()I

    .line 75
    .line 76
    .line 77
    move-result v7

    .line 78
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->h:Ll/vxd0;

    .line 79
    .line 80
    invoke-virtual {v8}, Ll/azd0;->get()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v8

    .line 84
    check-cast v8, Ljava/lang/Integer;

    .line 85
    .line 86
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    sget-object v9, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 91
    .line 92
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 93
    .line 94
    iget-object v9, v9, Lcom/p1/mobile/putong/core/api/t;->R:Lcom/p1/mobile/putong/core/api/t$a;

    .line 95
    .line 96
    invoke-virtual {v9}, Lcom/p1/mobile/putong/core/api/t$a;->N()Z

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    if-eqz v9, :cond_0

    .line 101
    .line 102
    const-wide/16 v9, 0x0

    .line 103
    .line 104
    cmp-long v5, v5, v9

    .line 105
    .line 106
    if-nez v5, :cond_0

    .line 107
    .line 108
    invoke-static {}, Ll/joa;->G3()Z

    .line 109
    .line 110
    .line 111
    move-result v5

    .line 112
    if-nez v5, :cond_0

    .line 113
    .line 114
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 115
    .line 116
    .line 117
    move-result-object v5

    .line 118
    invoke-virtual {v5}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 119
    .line 120
    .line 121
    move-result-object v5

    .line 122
    invoke-interface {v5}, Ll/r97;->f()Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-eqz v5, :cond_0

    .line 127
    .line 128
    sget-object p1, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->ODIAMOND:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_0
    if-eqz v0, :cond_1

    .line 132
    .line 133
    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    if-nez v0, :cond_1

    .line 138
    .line 139
    sget-object p1, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->PROMOTION:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 143
    .line 144
    check-cast p1, Landroid/util/Pair;

    .line 145
    .line 146
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 147
    .line 148
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;

    .line 149
    .line 150
    iget p1, p1, Lcom/p1/mobile/putong/core/api/CoreLikers$a;->c:I

    .line 151
    .line 152
    if-lez p1, :cond_2

    .line 153
    .line 154
    invoke-static {}, Ll/joa;->f4()Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_2

    .line 159
    .line 160
    invoke-static {v3, v4}, Ll/pzi0;->D(J)Z

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    if-nez p1, :cond_2

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->j()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    mul-int/lit8 p1, p1, 0x18

    .line 171
    .line 172
    invoke-static {v3, v4, p1}, Ll/pzi0;->w(JI)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_2

    .line 177
    .line 178
    sget-object p1, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->SEE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_2
    sget-object p1, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->NONE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 182
    .line 183
    :goto_0
    if-ge v7, v8, :cond_3

    .line 184
    .line 185
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->h:Ll/vxd0;

    .line 186
    .line 187
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    invoke-virtual {v0, v1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->NONE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 195
    .line 196
    if-eq p1, v0, :cond_4

    .line 197
    .line 198
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->j:Z

    .line 199
    .line 200
    if-nez v0, :cond_4

    .line 201
    .line 202
    const/4 v0, 0x1

    .line 203
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->j:Z

    .line 204
    .line 205
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->q(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;)V

    .line 206
    .line 207
    .line 208
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->k:Lrx/subjects/a;

    .line 209
    .line 210
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 211
    .line 212
    .line 213
    :cond_4
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->l:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->l:Ll/kcg0;

    .line 8
    .line 9
    sput-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->m:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;

    .line 10
    .line 11
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->ODIAMOND:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 6
    .line 7
    if-ne p1, v2, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->i:Ll/byd0;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->PROMOTION:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 20
    .line 21
    if-ne p1, v2, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->d:Ll/byd0;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->SEE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 34
    .line 35
    if-ne p1, v2, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->e:Ll/byd0;

    .line 38
    .line 39
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->BOOST_ONCE:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 48
    .line 49
    if-ne p1, v2, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->g:Ll/jxd0;

    .line 52
    .line 53
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 54
    .line 55
    invoke-virtual {p1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Nf()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->h:Ll/vxd0;

    .line 71
    .line 72
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {v2, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->f:Ll/byd0;

    .line 80
    .line 81
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->BOOST:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 90
    .line 91
    if-ne p1, v2, :cond_4

    .line 92
    .line 93
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Nf()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->h:Ll/vxd0;

    .line 106
    .line 107
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {v2, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->f:Ll/byd0;

    .line 115
    .line 116
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0, p1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    :cond_4
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager;->k:Lrx/subjects/a;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;->ODIAMOND:Lcom/p1/mobile/putong/core/ui/diamond/TabUniteManager$BadgeIconType;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
