.class public Lcom/p1/mobile/putong/core/ui/promotion/b;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/promotion/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Lcom/p1/mobile/putong/core/ui/promotion/c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/promotion/b$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 17

    .line 1
    invoke-direct/range {p0 .. p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "lowPriceFirstMonthVIP1M@local"

    .line 5
    .line 6
    filled-new-array {v0}, [Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "VIP\u9996\u6708\u4f4e\u4ef7"

    .line 15
    .line 16
    const-string v2, "lowPriceFirstMonth"

    .line 17
    .line 18
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const-string v0, "lowPrice3MonthVIP1M1R@local"

    .line 23
    .line 24
    filled-new-array {v0}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v1, "VIP\u524d\u4e09\u6708\u4f4e\u4ef7"

    .line 33
    .line 34
    const-string v2, "lowPrice3Month"

    .line 35
    .line 36
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    const-string v0, "lowPriceCallback3VIP3M@local"

    .line 41
    .line 42
    const-string v1, "lowPriceCallback3VIP12M@local"

    .line 43
    .line 44
    const-string v2, "lowPriceCallback3VIP1M@local"

    .line 45
    .line 46
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-string v1, "VIP\u4f4e\u4ef7\u53ec\u56de"

    .line 55
    .line 56
    const-string v2, "lowPriceCallback3VIP"

    .line 57
    .line 58
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    const-string v0, "lowPriceCustomerVIP@local_1M"

    .line 63
    .line 64
    const-string v1, "lowPriceCustomerVIP@local_3M"

    .line 65
    .line 66
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const-string v1, "VIP\u65b0\u5ba2\u4fc3\u9500"

    .line 75
    .line 76
    const-string v2, "lowPriceCustomerVIP"

    .line 77
    .line 78
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 79
    .line 80
    .line 81
    move-result-object v6

    .line 82
    const-string v0, "trialSVIP7Day@local_1M"

    .line 83
    .line 84
    filled-new-array {v0}, [Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const-string v1, "SVIP\u4e00\u5143\u8bd5\u7528"

    .line 93
    .line 94
    const-string v2, "trial7DSVIP"

    .line 95
    .line 96
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    const-string v0, "lowPriceCallback3SVIP6M@local"

    .line 101
    .line 102
    const-string v1, "lowPriceCallback3SVIP12M@local"

    .line 103
    .line 104
    const-string v2, "lowPriceCallback3SVIP1M@local"

    .line 105
    .line 106
    const-string v8, "lowPriceCallback3SVIP3M@local"

    .line 107
    .line 108
    filled-new-array {v2, v8, v0, v1}, [Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const-string v1, "SVIP\u4f4e\u4ef7\u53ec\u56de"

    .line 117
    .line 118
    const-string v2, "lowPriceCallback3SVIP"

    .line 119
    .line 120
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    const-string v15, "lowPriceCustomerSVIP@local_6M_exceed23age_h"

    .line 125
    .line 126
    const-string v16, "lowPriceCustomerSVIP@local_6M_under23age_h"

    .line 127
    .line 128
    const-string v9, "lowPriceCustomerSVIP@local_1M_exceed23age_h"

    .line 129
    .line 130
    const-string v10, "lowPriceCustomerSVIP_local_1M_under23age_h"

    .line 131
    .line 132
    const-string v11, "lowPriceCustomerSVIP@local_3M_exceed23age_h"

    .line 133
    .line 134
    const-string v12, "lowPriceCustomerSVIP@local_3M_under23age_h"

    .line 135
    .line 136
    const-string v13, "lowPriceCustomerSVIP@local_1M_exceed23age_h_58"

    .line 137
    .line 138
    const-string v14, "lowPriceCustomerSVIP@local_3M_exceed23age_h_128"

    .line 139
    .line 140
    filled-new-array/range {v9 .. v16}, [Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    const-string v1, "SVIP\u65b0\u5ba2\u4fc3\u9500"

    .line 149
    .line 150
    const-string v2, "lowPriceCustomerSVIP"

    .line 151
    .line 152
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 153
    .line 154
    .line 155
    move-result-object v9

    .line 156
    const-string v0, "lowPriceFirstTime12MSVIP@local_exceed23age_nonRenewal"

    .line 157
    .line 158
    const-string v1, "lowPriceFirstTime12MSVIP@local_under23age_nonRenewal"

    .line 159
    .line 160
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    const-string v1, "SVIP\u5e74\u5361\u4fc3\u9500"

    .line 169
    .line 170
    const-string v2, "lowPriceFirstTime12MSVIP"

    .line 171
    .line 172
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 173
    .line 174
    .line 175
    move-result-object v10

    .line 176
    const-string v0, "lowPriceSVIPPicks@local_3M_exceed23age"

    .line 177
    .line 178
    const-string v1, "lowPriceSVIPPicks@local_3M_under23age"

    .line 179
    .line 180
    const-string v2, "lowPriceSVIPPicks@local_1M_exceed23age"

    .line 181
    .line 182
    const-string v11, "lowPriceSVIPPicks@local_1M_under23age"

    .line 183
    .line 184
    filled-new-array {v2, v11, v0, v1}, [Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    const-string v1, "SVIP&Picks"

    .line 193
    .line 194
    const-string v2, "lowPriceSVIPPicks"

    .line 195
    .line 196
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 197
    .line 198
    .line 199
    move-result-object v11

    .line 200
    const-string v0, "lowPriceODiamond@android_3M_nonRenewal"

    .line 201
    .line 202
    const-string v1, "lowPriceODiamond@android_12M_nonRenewal"

    .line 203
    .line 204
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    const-string v1, "\u9ed1\u91d1\u6625\u8282\u4f4e\u4ef7"

    .line 213
    .line 214
    const-string v2, "lowPriceODiamond"

    .line 215
    .line 216
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 217
    .line 218
    .line 219
    move-result-object v12

    .line 220
    const-string v0, "lowPriceCustomerUpliftSVIP@local_1M_exceed23age_l"

    .line 221
    .line 222
    const-string v1, "lowPriceCustomerUpliftSVIP@local_1M_under23age_l"

    .line 223
    .line 224
    const-string v2, "lowPriceCustomerUpliftSVIP@local_1M_exceed23age_h"

    .line 225
    .line 226
    const-string v13, "lowPriceCustomerUpliftSVIP@local_1M_under23age_h"

    .line 227
    .line 228
    filled-new-array {v2, v13, v0, v1}, [Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    const-string v1, "SVIP\u65b0\u5ba2\u4fc3\u9500\u91cd\u6784"

    .line 237
    .line 238
    const-string v2, "lowPriceCustomerUpliftSVIP"

    .line 239
    .line 240
    invoke-static {v1, v2, v0}, Lcom/p1/mobile/putong/core/ui/promotion/b$a;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 241
    .line 242
    .line 243
    move-result-object v13

    .line 244
    filled-new-array/range {v3 .. v13}, [Lcom/p1/mobile/putong/core/ui/promotion/b$a;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 249
    .line 250
    .line 251
    move-result-object v0

    .line 252
    move-object/from16 v1, p0

    .line 253
    .line 254
    iput-object v0, v1, Lcom/p1/mobile/putong/core/ui/promotion/b;->a:Ljava/util/List;

    .line 255
    .line 256
    return-void
.end method

.method public static synthetic e0(Lcom/p1/mobile/putong/core/ui/promotion/b;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/promotion/b;->f0(Landroid/os/Bundle;)V

    return-void
.end method

.method private synthetic f0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/core/ui/promotion/c;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/promotion/b;->a:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/promotion/c;->c(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qgb0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qgb0;-><init>(Lcom/p1/mobile/putong/core/ui/promotion/b;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public destroy()V
    .locals 0

    return-void
.end method
