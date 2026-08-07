.class public Ll/xzc0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static l:Ll/xzc0;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/ContractInfo;

.field public b:Lcom/p1/mobile/putong/core/data/OrderInfo;

.field public final c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/OrderInfo;",
            "Lcom/p1/mobile/putong/core/data/ContractInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/core/data/Merchandise;

.field public e:Lcom/p1/mobile/putong/core/data/ContractInfo;

.field public f:Lcom/p1/mobile/putong/core/data/OrderInfo;

.field public final g:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/OrderInfo;",
            "Lcom/p1/mobile/putong/core/data/ContractInfo;",
            ">;>;"
        }
    .end annotation
.end field

.field public final h:Ll/jxd0;

.field public i:Ll/kcg0;

.field public j:Ll/kcg0;

.field public final k:[Ll/bkj0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ll/bkj0<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 13

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/xzc0;->c:Lrx/subjects/a;

    .line 9
    .line 10
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/xzc0;->g:Lrx/subjects/a;

    .line 15
    .line 16
    new-instance v0, Ll/jxd0;

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v2, "recall_dlg_show"

    .line 21
    .line 22
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/xzc0;->h:Ll/jxd0;

    .line 46
    .line 47
    const/16 v0, 0x177

    .line 48
    .line 49
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const-wide/high16 v1, 0x4004000000000000L    # 2.5

    .line 54
    .line 55
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const-wide/high16 v2, 0x4020000000000000L    # 8.0

    .line 60
    .line 61
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-static {v0, v1, v2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    const/16 v0, 0x11a

    .line 70
    .line 71
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-wide v4, 0x4002666666666666L    # 2.3

    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    const-wide/high16 v4, 0x401c000000000000L    # 7.0

    .line 85
    .line 86
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-static {v0, v2, v4}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    const/16 v0, 0xbd

    .line 95
    .line 96
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const-wide v5, 0x400199999999999aL    # 2.2

    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    const-wide/high16 v5, 0x4018000000000000L    # 6.0

    .line 110
    .line 111
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    invoke-static {v0, v2, v5}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 116
    .line 117
    .line 118
    move-result-object v5

    .line 119
    const/16 v0, 0x7f

    .line 120
    .line 121
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    .line 126
    .line 127
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    const-wide/high16 v6, 0x4014000000000000L    # 5.0

    .line 132
    .line 133
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    invoke-static {v0, v2, v6}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    const/16 v0, 0x60

    .line 142
    .line 143
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const-wide v7, 0x3ffe666666666666L    # 1.9

    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 153
    .line 154
    .line 155
    move-result-object v7

    .line 156
    const-wide/high16 v8, 0x4010000000000000L    # 4.0

    .line 157
    .line 158
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 159
    .line 160
    .line 161
    move-result-object v8

    .line 162
    invoke-static {v0, v7, v8}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 163
    .line 164
    .line 165
    move-result-object v7

    .line 166
    const/16 v0, 0x41

    .line 167
    .line 168
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const-wide v8, 0x3ffb333333333333L    # 1.7

    .line 173
    .line 174
    .line 175
    .line 176
    .line 177
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 178
    .line 179
    .line 180
    move-result-object v8

    .line 181
    const-wide/high16 v9, 0x400c000000000000L    # 3.5

    .line 182
    .line 183
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 184
    .line 185
    .line 186
    move-result-object v9

    .line 187
    invoke-static {v0, v8, v9}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 188
    .line 189
    .line 190
    move-result-object v8

    .line 191
    const/16 v0, 0x22

    .line 192
    .line 193
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    const-wide/high16 v9, 0x3ff8000000000000L    # 1.5

    .line 198
    .line 199
    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 200
    .line 201
    .line 202
    move-result-object v9

    .line 203
    const-wide/high16 v10, 0x4008000000000000L    # 3.0

    .line 204
    .line 205
    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 206
    .line 207
    .line 208
    move-result-object v10

    .line 209
    invoke-static {v0, v9, v10}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 210
    .line 211
    .line 212
    move-result-object v9

    .line 213
    const/4 v0, 0x4

    .line 214
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    const-wide v10, 0x3ff4cccccccccccdL    # 1.3

    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 224
    .line 225
    .line 226
    move-result-object v10

    .line 227
    invoke-static {v0, v10, v1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 228
    .line 229
    .line 230
    move-result-object v10

    .line 231
    const/4 v0, 0x0

    .line 232
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    const-wide v11, 0x3ff199999999999aL    # 1.1

    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-static {v0, v1, v2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 246
    .line 247
    .line 248
    move-result-object v11

    .line 249
    filled-new-array/range {v3 .. v11}, [Ll/bkj0;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    iput-object v0, p0, Ll/xzc0;->k:[Ll/bkj0;

    .line 254
    .line 255
    return-void
.end method

.method public static L(J)J
    .locals 2

    .line 1
    const-wide/32 v0, 0x5265c00

    .line 2
    .line 3
    .line 4
    div-long/2addr p0, v0

    .line 5
    const-wide/16 v0, 0x1

    .line 6
    .line 7
    add-long/2addr p0, v0

    .line 8
    return-wide p0
.end method

.method public static O()V
    .locals 1

    .line 1
    sget-object v0, Ll/xzc0;->l:Ll/xzc0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Ll/xzc0;->l:Ll/xzc0;

    .line 10
    .line 11
    iget-object v0, v0, Ll/xzc0;->i:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    sget-object v0, Ll/xzc0;->l:Ll/xzc0;

    .line 17
    .line 18
    iget-object v0, v0, Ll/xzc0;->j:Ll/kcg0;

    .line 19
    .line 20
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    const/4 v0, 0x0

    .line 24
    sput-object v0, Ll/xzc0;->l:Ll/xzc0;

    .line 25
    .line 26
    return-void
.end method

.method public static Q(Z)Ljava/lang/String;
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/16 p0, 0x9

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 p0, 0x3

    .line 7
    :goto_0
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "\u5f00\u901a\u7eed\u8d39\uff0c\u4eab\u6700\u9ad8%s\u500d\u52a0\u901f\u66dd\u5149"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/xzc0;Ll/x20;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/xzc0;->H(Ll/x20;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/ContractInfo;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 6
    .line 7
    if-ne v0, p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic d(Ll/xzc0;Landroid/util/Pair;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xzc0;->I(Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/OrderInfo;Lcom/p1/mobile/putong/core/data/Merchandise;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OrderInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 6
    .line 7
    if-ne v0, p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthType()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/data/OrderInfo;Ljava/util/List;)Ll/bkj0;
    .locals 1

    .line 1
    new-instance v0, Ll/szc0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/szc0;-><init>(Lcom/p1/mobile/putong/core/data/OrderInfo;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {p0, v0, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic g(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic h(Ll/xzc0;Landroid/util/Pair;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xzc0;->G(Landroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic i(Ll/xzc0;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/xzc0;->k(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/data/ContractInfo;Ljava/util/List;)Ll/bkj0;
    .locals 1

    .line 1
    new-instance v0, Ll/tzc0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tzc0;-><init>(Lcom/p1/mobile/putong/core/data/ContractInfo;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-static {v0, p0, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static n()Ljava/lang/String;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/pay/R$string;->j7:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method public static r()Ll/xzc0;
    .locals 2

    .line 1
    sget-object v0, Ll/xzc0;->l:Ll/xzc0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/xzc0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/xzc0;->l:Ll/xzc0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/xzc0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/xzc0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/xzc0;->l:Ll/xzc0;

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
    sget-object v0, Ll/xzc0;->l:Ll/xzc0;

    .line 27
    .line 28
    return-object v0
.end method

.method public static t()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "\u52a0\u901f\u66dd\u5149"

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/data/Contract;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 2
    .line 3
    const-string v0, "vip"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 12
    .line 13
    const-string p1, "svip"

    .line 14
    .line 15
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public B(Lcom/p1/mobile/putong/data/MembershipType;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzc0;->f:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/xzc0;->f:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OrderInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public C()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OrderInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 4
    .line 5
    const-string v0, "svip"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public D(Lcom/p1/mobile/putong/data/MembershipType;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzc0;->e:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/xzc0;->e:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 12
    .line 13
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public E()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzc0;->e:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Ll/xzc0;->f:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public F()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OrderInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 4
    .line 5
    const-string v0, "vip"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic G(Landroid/util/Pair;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 4
    .line 5
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/xzc0;->m(Lcom/p1/mobile/putong/core/data/OrderInfo;Lcom/p1/mobile/putong/core/data/ContractInfo;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic H(Ll/x20;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Ll/xzc0;->k(Ll/bkj0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic I(Landroid/util/Pair;)Lrx/c;
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 4
    .line 5
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/xzc0;->m(Lcom/p1/mobile/putong/core/data/OrderInfo;Lcom/p1/mobile/putong/core/data/ContractInfo;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public J()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzc0;->i:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->s3()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/nzc0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/nzc0;-><init>(Ll/xzc0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/ozc0;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/ozc0;-><init>(Ll/xzc0;)V

    .line 26
    .line 27
    .line 28
    new-instance v2, Ll/pzc0;

    .line 29
    .line 30
    invoke-direct {v2}, Ll/pzc0;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/xzc0;->i:Ll/kcg0;

    .line 42
    .line 43
    return-void
.end method

.method public K(Ll/ner;Ll/x20;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->s3()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/uzc0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/uzc0;-><init>(Ll/xzc0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {p1, v0}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ll/vzc0;

    .line 23
    .line 24
    invoke-direct {v0, p0, p2}, Ll/vzc0;-><init>(Ll/xzc0;Ll/x20;)V

    .line 25
    .line 26
    .line 27
    new-instance p0, Ll/wzc0;

    .line 28
    .line 29
    invoke-direct {p0}, Ll/wzc0;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public M()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "svip"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OrderInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 14
    .line 15
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 31
    .line 32
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public N()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "vip"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OrderInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 14
    .line 15
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object p0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 31
    .line 32
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_1
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public P()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/data/OrderInfo;",
            "Lcom/p1/mobile/putong/core/data/ContractInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xzc0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public R()[Ll/pf60;
    .locals 6

    .line 1
    iget-object v0, p0, Ll/xzc0;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "if_auto_order"

    .line 8
    .line 9
    const-string v2, "reauto_duration"

    .line 10
    .line 11
    const-string v3, "vip"

    .line 12
    .line 13
    const-string v4, "svip"

    .line 14
    .line 15
    const-string v5, "reauto_product"

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/xzc0;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 28
    .line 29
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 30
    .line 31
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0}, Ll/xzc0;->M()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_0

    .line 44
    .line 45
    move-object v3, v4

    .line 46
    :cond_0
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    filled-new-array {v0, p0, v1}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_1
    iget-object v0, p0, Ll/xzc0;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    iget-object v0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 70
    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-eqz v0, :cond_3

    .line 76
    .line 77
    iget-object v0, p0, Ll/xzc0;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 78
    .line 79
    iget v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 80
    .line 81
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {p0}, Ll/xzc0;->M()Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_2

    .line 94
    .line 95
    move-object v3, v4

    .line 96
    :cond_2
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 101
    .line 102
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    filled-new-array {v0, p0, v1}, [Ll/pf60;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    return-object p0

    .line 111
    :cond_3
    invoke-virtual {p0}, Ll/xzc0;->M()Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_4

    .line 116
    .line 117
    move-object v3, v4

    .line 118
    :cond_4
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    filled-new-array {p0}, [Ll/pf60;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    return-object p0
.end method

.method public S(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

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
    invoke-interface {v0}, Ll/r97;->a2()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v0, p0, Ll/xzc0;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    new-instance v0, Ll/e0d0;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iget-object p0, p0, Ll/xzc0;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 28
    .line 29
    invoke-direct {v0, p1, v1, p0, p2}, Ll/e0d0;-><init>(Lcom/p1/mobile/android/app/Act;Ll/x20;Lcom/p1/mobile/putong/core/data/Merchandise;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ll/e0d0;->show()V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method public T()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/xzc0;->h:Ll/jxd0;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final k(Ll/bkj0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/core/data/OrderInfo;",
            "Lcom/p1/mobile/putong/core/data/ContractInfo;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 4
    .line 5
    iput-object v0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 6
    .line 7
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 10
    .line 11
    iput-object v1, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 12
    .line 13
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 16
    .line 17
    iput-object p1, p0, Ll/xzc0;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 18
    .line 19
    iget-object p0, p0, Ll/xzc0;->c:Lrx/subjects/a;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final m(Lcom/p1/mobile/putong/core/data/OrderInfo;Lcom/p1/mobile/putong/core/data/ContractInfo;)Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/OrderInfo;",
            "Lcom/p1/mobile/putong/core/data/ContractInfo;",
            ")",
            "Lrx/c<",
            "Ll/bkj0<",
            "Lcom/p1/mobile/putong/core/data/OrderInfo;",
            "Lcom/p1/mobile/putong/core/data/ContractInfo;",
            "Lcom/p1/mobile/putong/core/data/Merchandise;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OrderInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/OrderInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    iget-object p2, p1, Lcom/p1/mobile/putong/core/data/OrderInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 27
    .line 28
    iput-object p2, p0, Ll/xzc0;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 29
    .line 30
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 35
    .line 36
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    new-instance p2, Ll/qzc0;

    .line 45
    .line 46
    invoke-direct {p2, p1}, Ll/qzc0;-><init>(Lcom/p1/mobile/putong/core/data/OrderInfo;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0

    .line 54
    :cond_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    const/4 v0, 0x0

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractStatus:Ljava/lang/String;

    .line 62
    .line 63
    const-string v2, "signing"

    .line 64
    .line 65
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_1

    .line 70
    .line 71
    invoke-static {v0, p2, v0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_1
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 81
    .line 82
    iput-object p1, p0, Ll/xzc0;->d:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 85
    .line 86
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 87
    .line 88
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->y5(Lcom/p1/mobile/putong/core/data/ProductCategory;)Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0, v1}, Lrx/c;->take(I)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    new-instance p1, Ll/rzc0;

    .line 99
    .line 100
    invoke-direct {p1, p2}, Ll/rzc0;-><init>(Lcom/p1/mobile/putong/core/data/ContractInfo;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0

    .line 108
    :cond_2
    invoke-static {v0, v0, v0}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0
.end method

.method public o()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractCanceledDays:I

    .line 4
    .line 5
    return p0
.end method

.method public p()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->continuousDays:I

    .line 4
    .line 5
    return p0
.end method

.method public q()Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzc0;->e:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/xzc0;->e:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public s()Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzc0;->f:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/xzc0;->f:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OrderInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public u()Ll/bkj0;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzc0;->M()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/xzc0;->p()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v0, v1}, Ll/xzc0;->v(ZI)Ll/bkj0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final v(ZI)Ll/bkj0;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZI)",
            "Ll/bkj0<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/text/DecimalFormat;

    .line 2
    .line 3
    const-string v1, "#.#"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v1, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/text/DecimalFormat;->setRoundingMode(Ljava/math/RoundingMode;)V

    .line 11
    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    :goto_0
    iget-object v4, p0, Ll/xzc0;->k:[Ll/bkj0;

    .line 17
    .line 18
    array-length v5, v4

    .line 19
    if-ge v3, v5, :cond_5

    .line 20
    .line 21
    aget-object v4, v4, v3

    .line 22
    .line 23
    iget-object v5, v4, Ll/bkj0;->a:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v5, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v5

    .line 31
    if-lt p2, v5, :cond_4

    .line 32
    .line 33
    if-nez v1, :cond_1

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    iget-object p0, v4, Ll/bkj0;->c:Ljava/lang/Object;

    .line 38
    .line 39
    :goto_1
    check-cast p0, Ljava/lang/Double;

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :cond_0
    iget-object p0, v4, Ll/bkj0;->b:Ljava/lang/Object;

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :goto_2
    invoke-virtual {v0, p0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string p2, "0"

    .line 54
    .line 55
    invoke-static {p0, p1, p2}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    return-object p0

    .line 60
    :cond_1
    if-eqz p1, :cond_2

    .line 61
    .line 62
    iget-object p0, v4, Ll/bkj0;->c:Ljava/lang/Object;

    .line 63
    .line 64
    :goto_3
    check-cast p0, Ljava/lang/Double;

    .line 65
    .line 66
    goto :goto_4

    .line 67
    :cond_2
    iget-object p0, v4, Ll/bkj0;->b:Ljava/lang/Object;

    .line 68
    .line 69
    goto :goto_3

    .line 70
    :goto_4
    invoke-virtual {v0, p0}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object v2, v1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 75
    .line 76
    check-cast v2, Ljava/lang/Integer;

    .line 77
    .line 78
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    sub-int/2addr v2, p2

    .line 83
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object p2

    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    iget-object p1, v1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 90
    .line 91
    :goto_5
    check-cast p1, Ljava/lang/Double;

    .line 92
    .line 93
    goto :goto_6

    .line 94
    :cond_3
    iget-object p1, v1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 95
    .line 96
    goto :goto_5

    .line 97
    :goto_6
    invoke-virtual {v0, p1}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    invoke-static {p0, p2, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0

    .line 106
    :cond_4
    add-int/lit8 v3, v3, 0x1

    .line 107
    .line 108
    move-object v1, v4

    .line 109
    goto :goto_0

    .line 110
    :cond_5
    const/4 p0, 0x1

    .line 111
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    const-string p1, "1"

    .line 116
    .line 117
    invoke-static {p1, p0, p1}, Ll/bkj0;->a(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/bkj0;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0
.end method

.method public w()J
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 8
    .line 9
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OrderInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 23
    .line 24
    :goto_0
    const-string v2, "svip"

    .line 25
    .line 26
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 35
    .line 36
    invoke-static {v2}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {p0, v2}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 51
    .line 52
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    const-wide/16 v0, 0x1

    .line 56
    .line 57
    return-wide v0

    .line 58
    :cond_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 61
    .line 62
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getVipExpireTime()J

    .line 67
    .line 68
    .line 69
    move-result-wide v2

    .line 70
    :goto_1
    sub-long/2addr v2, v0

    .line 71
    invoke-static {v2, v3}, Ll/xzc0;->L(J)J

    .line 72
    .line 73
    .line 74
    move-result-wide v0

    .line 75
    return-wide v0
.end method

.method public x(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)J
    .locals 2

    .line 1
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-string p0, "svip"

    .line 8
    .line 9
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    const-string p0, "oDiamond"

    .line 16
    .line 17
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getVipExpireTime()J

    .line 33
    .line 34
    .line 35
    move-result-wide p0

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ll/joa;->x4(Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilege;->content:Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 52
    .line 53
    iget-wide p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 54
    .line 55
    :goto_1
    sub-long/2addr p0, v0

    .line 56
    invoke-static {p0, p1}, Ll/xzc0;->L(J)J

    .line 57
    .line 58
    .line 59
    move-result-wide p0

    .line 60
    return-wide p0

    .line 61
    :cond_2
    const-wide/16 p0, 0x1

    .line 62
    .line 63
    return-wide p0
.end method

.method public y()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractStatus:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "signing"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public z()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzc0;->b:Lcom/p1/mobile/putong/core/data/OrderInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/xzc0;->a:Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 18
    .line 19
    iget p0, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->privilegeExpiredDays:I

    .line 20
    .line 21
    if-gtz p0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0
.end method
