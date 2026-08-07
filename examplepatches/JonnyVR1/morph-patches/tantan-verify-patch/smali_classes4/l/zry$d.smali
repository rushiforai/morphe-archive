.class public Ll/zry$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jzl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
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

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method


# virtual methods
.method public a(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v5, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    invoke-virtual/range {v0 .. v5}, Ll/zry$d;->h(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public h(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/ProductCategory;Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/p1/mobile/putong/core/data/PurchaseType;",
            "Lcom/p1/mobile/putong/core/data/ProductCategory;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p4

    .line 2
    .line 3
    invoke-static {v0}, Ll/zry;->g(Ljava/util/List;)Z

    .line 4
    .line 5
    .line 6
    move-result v7

    .line 7
    invoke-static {v0}, Ll/zry;->f(Ljava/util/List;)Z

    .line 8
    .line 9
    .line 10
    move-result v8

    .line 11
    new-instance v9, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v1, Ll/csy;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/csy;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    move-object v6, v1

    .line 26
    check-cast v6, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 27
    .line 28
    const/4 v3, 0x0

    .line 29
    move-object v5, v6

    .line 30
    move-object/from16 v1, p1

    .line 31
    .line 32
    move-object/from16 v2, p2

    .line 33
    .line 34
    move-object/from16 v4, p3

    .line 35
    .line 36
    invoke-static/range {v1 .. v8}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 37
    .line 38
    .line 39
    move-result-object v10

    .line 40
    move-object v11, v5

    .line 41
    new-instance v1, Ll/dsy;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/dsy;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    move-object v5, v1

    .line 51
    check-cast v5, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 52
    .line 53
    move-object v6, v5

    .line 54
    move-object/from16 v1, p1

    .line 55
    .line 56
    invoke-static/range {v1 .. v8}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    move-object v12, v5

    .line 61
    invoke-static {v10}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    const/4 v13, 0x0

    .line 66
    const/4 v14, 0x1

    .line 67
    if-eqz v1, :cond_0

    .line 68
    .line 69
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_0

    .line 74
    .line 75
    invoke-static {v10, v3, v14}, Lcom/p1/mobile/putong/core/ui/purchase/d;->a(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {v12}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->s(Z)V

    .line 84
    .line 85
    .line 86
    invoke-static {v11}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->t(Z)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v1, v13}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 94
    .line 95
    .line 96
    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    :cond_0
    new-instance v1, Ll/esy;

    .line 100
    .line 101
    invoke-direct {v1}, Ll/esy;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    move-object v5, v1

    .line 109
    check-cast v5, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 110
    .line 111
    const/4 v3, 0x1

    .line 112
    move-object/from16 v1, p1

    .line 113
    .line 114
    move-object/from16 v2, p2

    .line 115
    .line 116
    move-object/from16 v4, p3

    .line 117
    .line 118
    move-object v6, v11

    .line 119
    invoke-static/range {v1 .. v8}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 120
    .line 121
    .line 122
    move-result-object v10

    .line 123
    move-object v15, v5

    .line 124
    new-instance v1, Ll/fsy;

    .line 125
    .line 126
    invoke-direct {v1}, Ll/fsy;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    move-object v5, v1

    .line 134
    check-cast v5, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 135
    .line 136
    move-object/from16 v1, p1

    .line 137
    .line 138
    move-object v6, v12

    .line 139
    invoke-static/range {v1 .. v8}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    invoke-static {v10}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_1

    .line 148
    .line 149
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_1

    .line 154
    .line 155
    invoke-static {v10, v3, v14}, Lcom/p1/mobile/putong/core/ui/purchase/d;->a(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-static {v5}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->s(Z)V

    .line 164
    .line 165
    .line 166
    invoke-static {v15}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->t(Z)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, v14}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1, v14}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 177
    .line 178
    .line 179
    invoke-interface {v9, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    :cond_1
    new-instance v1, Ll/gsy;

    .line 183
    .line 184
    invoke-direct {v1}, Ll/gsy;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    move-object v5, v1

    .line 192
    check-cast v5, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 193
    .line 194
    const/4 v3, 0x2

    .line 195
    move-object/from16 v1, p1

    .line 196
    .line 197
    move-object/from16 v2, p2

    .line 198
    .line 199
    move-object/from16 v4, p3

    .line 200
    .line 201
    move-object v6, v11

    .line 202
    invoke-static/range {v1 .. v8}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 203
    .line 204
    .line 205
    move-result-object v10

    .line 206
    move-object v11, v5

    .line 207
    new-instance v1, Ll/hsy;

    .line 208
    .line 209
    invoke-direct {v1}, Ll/hsy;-><init>()V

    .line 210
    .line 211
    .line 212
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    move-object v4, v0

    .line 217
    check-cast v4, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 218
    .line 219
    const/4 v2, 0x2

    .line 220
    move-object/from16 v0, p1

    .line 221
    .line 222
    move-object/from16 v1, p2

    .line 223
    .line 224
    move-object/from16 v3, p3

    .line 225
    .line 226
    move v6, v7

    .line 227
    move v7, v8

    .line 228
    move-object v5, v12

    .line 229
    invoke-static/range {v0 .. v7}, Ll/zry;->I(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/PurchaseType;ILcom/p1/mobile/putong/core/data/ProductCategory;Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/p1/mobile/putong/core/data/Merchandise;ZZ)Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-static {v10}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    if-eqz v1, :cond_2

    .line 238
    .line 239
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-eqz v1, :cond_2

    .line 244
    .line 245
    invoke-static {v10, v0, v14}, Lcom/p1/mobile/putong/core/ui/purchase/d;->a(Lcom/p1/mobile/putong/core/ui/purchase/d$a;Lcom/p1/mobile/putong/core/ui/purchase/d$a;Z)Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-static {v4}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->s(Z)V

    .line 254
    .line 255
    .line 256
    invoke-static {v11}, Ll/v5b0;->n(Lcom/p1/mobile/putong/core/data/Merchandise;)Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/d;->t(Z)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v0, v13}, Lcom/p1/mobile/putong/core/ui/purchase/d;->v(Z)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {v0, v13}, Lcom/p1/mobile/putong/core/ui/purchase/d;->r(Z)V

    .line 267
    .line 268
    .line 269
    invoke-interface {v9, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    :cond_2
    return-object v9
.end method
