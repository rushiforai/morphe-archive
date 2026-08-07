.class Lcom/p1/mobile/putong/core/data/Merchandise$27;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Merchandise;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vzf0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public CREATE_TABLE(Ll/wzh0;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "CREATE TABLE IF NOT EXISTS "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Ll/wzh0;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,category_c INTEGER,quantity_c INTEGER,productType_c INTEGER,defaultStockKeepUnit_id_c TEXT,defaultStockKeepUnit_type_c TEXT,defaultStockKeepUnit_affiliateProducts_alipay_c TEXT,defaultStockKeepUnit_affiliateProducts_wechat_c TEXT,defaultStockKeepUnit_affiliateProducts_googleplay_c TEXT,defaultStockKeepUnit_affiliateProducts_huawei_c TEXT,defaultStockKeepUnit_prices_currencyCode_c TEXT,defaultStockKeepUnit_prices_currencySymbol_c TEXT,defaultStockKeepUnit_prices_price_c REAL,defaultStockKeepUnit_prices_unitPrice_c REAL,defaultStockKeepUnit_prices_originalPrice_c REAL,defaultStockKeepUnit_prices_originalUnitPrice_c REAL,defaultStockKeepUnit_prices_noneRenewalPrice_c REAL,defaultStockKeepUnit_prices_noneRenewalUnitPrice_c REAL,defaultStockKeepUnit_tracker_c TEXT,str_category_c TEXT,str_productType_c TEXT,localCoupons_c BLOB,duration_times_c INTEGER,duration_timeUnit_c TEXT,extra_discountText_c TEXT)"

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 1

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 19
    .line 20
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 35
    .line 36
    if-nez v0, :cond_2

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->new_()Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 43
    .line 44
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 45
    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    new-instance v0, Ljava/util/ArrayList;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 54
    .line 55
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 56
    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->new_()Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 64
    .line 65
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 66
    .line 67
    if-nez v0, :cond_5

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;->new_()Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 74
    .line 75
    :cond_5
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Merchandise$27;->init()Lcom/p1/mobile/putong/core/data/Merchandise;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 9

    .line 1
    const-string v0, "unknown_"

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    iput v1, p0, Ll/vzf0;->readIndex:I

    .line 7
    .line 8
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/Merchandise;-><init>()V

    .line 11
    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    :try_start_0
    new-instance v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 15
    .line 16
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/StockKeepUnit;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 20
    .line 21
    new-instance v3, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 22
    .line 23
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 27
    .line 28
    new-instance v3, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 29
    .line 30
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v3, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 34
    .line 35
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 36
    .line 37
    new-instance v4, Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 38
    .line 39
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/AffiliateProducts;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 43
    .line 44
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 45
    .line 46
    new-instance v4, Lcom/p1/mobile/putong/core/data/Prices;

    .line 47
    .line 48
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/data/Prices;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v4, v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 52
    .line 53
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    iput-wide v3, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 58
    .line 59
    add-int/lit8 v3, p2, 0x1

    .line 60
    .line 61
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    const/4 v5, 0x0

    .line 66
    if-eqz v4, :cond_1

    .line 67
    .line 68
    move-object v3, v5

    .line 69
    goto :goto_0

    .line 70
    :cond_1
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    :goto_0
    iput-object v3, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 75
    .line 76
    add-int/lit8 v3, p2, 0x2

    .line 77
    .line 78
    invoke-interface {p1, v3}, Landroid/database/Cursor;->isNull(I)Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_2

    .line 83
    .line 84
    move v3, v2

    .line 85
    goto :goto_1

    .line 86
    :cond_2
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 87
    .line 88
    .line 89
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    .line 90
    :goto_1
    add-int/lit8 v4, p2, 0x3

    .line 91
    .line 92
    :try_start_1
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    iput v4, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 97
    .line 98
    add-int/lit8 v4, p2, 0x4

    .line 99
    .line 100
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    if-eqz v6, :cond_3

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_3
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    :goto_2
    add-int/lit8 v4, p2, 0x5

    .line 112
    .line 113
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 114
    .line 115
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 116
    .line 117
    .line 118
    move-result v7

    .line 119
    if-eqz v7, :cond_4

    .line 120
    .line 121
    move-object v4, v5

    .line 122
    goto :goto_3

    .line 123
    :cond_4
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    :goto_3
    iput-object v4, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 128
    .line 129
    add-int/lit8 v4, p2, 0x6

    .line 130
    .line 131
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 132
    .line 133
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 134
    .line 135
    .line 136
    move-result v7

    .line 137
    if-eqz v7, :cond_5

    .line 138
    .line 139
    move-object v4, v5

    .line 140
    goto :goto_4

    .line 141
    :cond_5
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v4

    .line 145
    :goto_4
    iput-object v4, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->type:Ljava/lang/String;

    .line 146
    .line 147
    add-int/lit8 v4, p2, 0x7

    .line 148
    .line 149
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 150
    .line 151
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 152
    .line 153
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    if-eqz v7, :cond_6

    .line 158
    .line 159
    move-object v4, v5

    .line 160
    goto :goto_5

    .line 161
    :cond_6
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v4

    .line 165
    :goto_5
    iput-object v4, v6, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->alipay:Ljava/lang/String;

    .line 166
    .line 167
    add-int/lit8 v4, p2, 0x8

    .line 168
    .line 169
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 170
    .line 171
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 172
    .line 173
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 174
    .line 175
    .line 176
    move-result v7

    .line 177
    if-eqz v7, :cond_7

    .line 178
    .line 179
    move-object v4, v5

    .line 180
    goto :goto_6

    .line 181
    :cond_7
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    :goto_6
    iput-object v4, v6, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->wechat:Ljava/lang/String;

    .line 186
    .line 187
    add-int/lit8 v4, p2, 0x9

    .line 188
    .line 189
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 190
    .line 191
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 192
    .line 193
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 194
    .line 195
    .line 196
    move-result v7

    .line 197
    if-eqz v7, :cond_8

    .line 198
    .line 199
    move-object v4, v5

    .line 200
    goto :goto_7

    .line 201
    :cond_8
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    :goto_7
    iput-object v4, v6, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 206
    .line 207
    add-int/lit8 v4, p2, 0xa

    .line 208
    .line 209
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 210
    .line 211
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 212
    .line 213
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 214
    .line 215
    .line 216
    move-result v7

    .line 217
    if-eqz v7, :cond_9

    .line 218
    .line 219
    move-object v4, v5

    .line 220
    goto :goto_8

    .line 221
    :cond_9
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    :goto_8
    iput-object v4, v6, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->huawei:Ljava/lang/String;

    .line 226
    .line 227
    add-int/lit8 v4, p2, 0xb

    .line 228
    .line 229
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 230
    .line 231
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 232
    .line 233
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 234
    .line 235
    .line 236
    move-result v7

    .line 237
    if-eqz v7, :cond_a

    .line 238
    .line 239
    move-object v4, v5

    .line 240
    goto :goto_9

    .line 241
    :cond_a
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object v4

    .line 245
    :goto_9
    iput-object v4, v6, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 246
    .line 247
    add-int/lit8 v4, p2, 0xc

    .line 248
    .line 249
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 250
    .line 251
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 252
    .line 253
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 254
    .line 255
    .line 256
    move-result v7

    .line 257
    if-eqz v7, :cond_b

    .line 258
    .line 259
    move-object v4, v5

    .line 260
    goto :goto_a

    .line 261
    :cond_b
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v4

    .line 265
    :goto_a
    iput-object v4, v6, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 266
    .line 267
    add-int/lit8 v4, p2, 0xd

    .line 268
    .line 269
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 270
    .line 271
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 272
    .line 273
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getDouble(I)D

    .line 274
    .line 275
    .line 276
    move-result-wide v7

    .line 277
    iput-wide v7, v6, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 278
    .line 279
    add-int/lit8 v4, p2, 0xe

    .line 280
    .line 281
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 282
    .line 283
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 284
    .line 285
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getDouble(I)D

    .line 286
    .line 287
    .line 288
    move-result-wide v7

    .line 289
    iput-wide v7, v6, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 290
    .line 291
    add-int/lit8 v4, p2, 0xf

    .line 292
    .line 293
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 294
    .line 295
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 296
    .line 297
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getDouble(I)D

    .line 298
    .line 299
    .line 300
    move-result-wide v7

    .line 301
    iput-wide v7, v6, Lcom/p1/mobile/putong/core/data/Prices;->originalPrice:D

    .line 302
    .line 303
    add-int/lit8 v4, p2, 0x10

    .line 304
    .line 305
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 306
    .line 307
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 308
    .line 309
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getDouble(I)D

    .line 310
    .line 311
    .line 312
    move-result-wide v7

    .line 313
    iput-wide v7, v6, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 314
    .line 315
    add-int/lit8 v4, p2, 0x11

    .line 316
    .line 317
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 318
    .line 319
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 320
    .line 321
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getDouble(I)D

    .line 322
    .line 323
    .line 324
    move-result-wide v7

    .line 325
    iput-wide v7, v6, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 326
    .line 327
    add-int/lit8 v4, p2, 0x12

    .line 328
    .line 329
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 330
    .line 331
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 332
    .line 333
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getDouble(I)D

    .line 334
    .line 335
    .line 336
    move-result-wide v7

    .line 337
    iput-wide v7, v6, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalUnitPrice:D

    .line 338
    .line 339
    add-int/lit8 v4, p2, 0x13

    .line 340
    .line 341
    iget-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 342
    .line 343
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 344
    .line 345
    .line 346
    move-result v7

    .line 347
    if-eqz v7, :cond_c

    .line 348
    .line 349
    move-object v4, v5

    .line 350
    goto :goto_b

    .line 351
    :cond_c
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v4

    .line 355
    :goto_b
    iput-object v4, v6, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->tracker:Ljava/lang/String;

    .line 356
    .line 357
    add-int/lit8 v4, p2, 0x14

    .line 358
    .line 359
    invoke-interface {p1, v4}, Landroid/database/Cursor;->isNull(I)Z

    .line 360
    .line 361
    .line 362
    move-result v6

    .line 363
    if-eqz v6, :cond_d

    .line 364
    .line 365
    move-object v4, v5

    .line 366
    goto :goto_c

    .line 367
    :cond_d
    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 371
    :goto_c
    add-int/lit8 v6, p2, 0x15

    .line 372
    .line 373
    :try_start_2
    invoke-interface {p1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 374
    .line 375
    .line 376
    move-result v7

    .line 377
    if-eqz v7, :cond_e

    .line 378
    .line 379
    move-object v0, v5

    .line 380
    goto :goto_d

    .line 381
    :cond_e
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    :goto_d
    add-int/lit8 v6, p2, 0x16

    .line 386
    .line 387
    invoke-interface {p1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 388
    .line 389
    .line 390
    move-result v7

    .line 391
    if-eqz v7, :cond_f

    .line 392
    .line 393
    move-object v6, v5

    .line 394
    goto :goto_e

    .line 395
    :cond_f
    sget-object v7, Lcom/p1/mobile/putong/core/data/Coupon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 396
    .line 397
    invoke-virtual {v7}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 398
    .line 399
    .line 400
    move-result-object v7

    .line 401
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getBlob(I)[B

    .line 402
    .line 403
    .line 404
    move-result-object v6

    .line 405
    invoke-virtual {v7, v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    move-result-object v6

    .line 409
    check-cast v6, Ljava/util/List;

    .line 410
    .line 411
    :goto_e
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 412
    .line 413
    add-int/lit8 v6, p2, 0x17

    .line 414
    .line 415
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 416
    .line 417
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 418
    .line 419
    .line 420
    move-result v6

    .line 421
    iput v6, v7, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->times:I

    .line 422
    .line 423
    add-int/lit8 v6, p2, 0x18

    .line 424
    .line 425
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 426
    .line 427
    invoke-interface {p1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 428
    .line 429
    .line 430
    move-result v8

    .line 431
    if-eqz v8, :cond_10

    .line 432
    .line 433
    move-object v6, v5

    .line 434
    goto :goto_f

    .line 435
    :cond_10
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object v6

    .line 439
    :goto_f
    iput-object v6, v7, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->timeUnit:Ljava/lang/String;

    .line 440
    .line 441
    add-int/lit8 v6, p2, 0x19

    .line 442
    .line 443
    iget-object v7, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 444
    .line 445
    invoke-interface {p1, v6}, Landroid/database/Cursor;->isNull(I)Z

    .line 446
    .line 447
    .line 448
    move-result v8

    .line 449
    if-eqz v8, :cond_11

    .line 450
    .line 451
    goto :goto_10

    .line 452
    :cond_11
    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object v5

    .line 456
    :goto_10
    iput-object v5, v7, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;->discountText:Ljava/lang/String;

    .line 457
    .line 458
    add-int/lit8 p2, p2, 0x1a

    .line 459
    .line 460
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 461
    .line 462
    goto :goto_12

    .line 463
    :catch_0
    move-exception p0

    .line 464
    move p2, v3

    .line 465
    move v3, v2

    .line 466
    move v2, p2

    .line 467
    move-object p2, v0

    .line 468
    move-object v0, v4

    .line 469
    goto :goto_11

    .line 470
    :catch_1
    move-exception p0

    .line 471
    move p2, v3

    .line 472
    move v3, v2

    .line 473
    move v2, p2

    .line 474
    move-object p2, v0

    .line 475
    goto :goto_11

    .line 476
    :catch_2
    move-exception p0

    .line 477
    move-object p2, v0

    .line 478
    move v3, v2

    .line 479
    :goto_11
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 480
    .line 481
    .line 482
    move v4, v3

    .line 483
    move v3, v2

    .line 484
    move v2, v4

    .line 485
    move-object v4, v0

    .line 486
    move-object v0, p2

    .line 487
    :goto_12
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 488
    .line 489
    invoke-virtual {p0, v4, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 490
    .line 491
    .line 492
    move-result-object p1

    .line 493
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 494
    .line 495
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 496
    .line 497
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 498
    .line 499
    invoke-virtual {p1, v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 500
    .line 501
    .line 502
    move-result-object p2

    .line 503
    check-cast p2, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 504
    .line 505
    iput-object p2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 506
    .line 507
    iget-object p2, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 508
    .line 509
    if-nez p2, :cond_12

    .line 510
    .line 511
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 512
    .line 513
    .line 514
    move-result-object p0

    .line 515
    check-cast p0, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 516
    .line 517
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 518
    .line 519
    :cond_12
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 520
    .line 521
    if-nez p0, :cond_13

    .line 522
    .line 523
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 524
    .line 525
    .line 526
    move-result-object p0

    .line 527
    check-cast p0, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 528
    .line 529
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 530
    .line 531
    :cond_13
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 532
    .line 533
    if-nez p0, :cond_14

    .line 534
    .line 535
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->new_()Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 536
    .line 537
    .line 538
    move-result-object p0

    .line 539
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 540
    .line 541
    :cond_14
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 542
    .line 543
    if-nez p0, :cond_15

    .line 544
    .line 545
    new-instance p0, Ljava/util/ArrayList;

    .line 546
    .line 547
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 548
    .line 549
    .line 550
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 551
    .line 552
    :cond_15
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 553
    .line 554
    if-nez p0, :cond_16

    .line 555
    .line 556
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->new_()Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 557
    .line 558
    .line 559
    move-result-object p0

    .line 560
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 561
    .line 562
    :cond_16
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 563
    .line 564
    if-nez p0, :cond_17

    .line 565
    .line 566
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;->new_()Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 567
    .line 568
    .line 569
    move-result-object p0

    .line 570
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 571
    .line 572
    :cond_17
    return-object v1
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 573
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Merchandise$27;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Merchandise;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/Merchandise;Landroid/content/ContentValues;)V
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    :try_start_0
    const-string v0, "id_c"

    .line 3
    .line 4
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const-string v0, "str_category_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    move-object v1, p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "category_c"

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    move-object v1, p0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 41
    .line 42
    .line 43
    const-string v0, "quantity_c"

    .line 44
    .line 45
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 46
    .line 47
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 52
    .line 53
    .line 54
    const-string v0, "str_productType_c"

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 57
    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    move-object v1, p0

    .line 61
    goto :goto_2

    .line 62
    :cond_2
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    const-string v0, "productType_c"

    .line 70
    .line 71
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 72
    .line 73
    if-nez v1, :cond_3

    .line 74
    .line 75
    move-object v1, p0

    .line 76
    goto :goto_3

    .line 77
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 86
    .line 87
    .line 88
    const-string v0, "defaultStockKeepUnit_id_c"

    .line 89
    .line 90
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 91
    .line 92
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->id:Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    const-string v0, "defaultStockKeepUnit_type_c"

    .line 98
    .line 99
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->type:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    const-string v0, "defaultStockKeepUnit_affiliateProducts_alipay_c"

    .line 107
    .line 108
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 111
    .line 112
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->alipay:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    const-string v0, "defaultStockKeepUnit_affiliateProducts_wechat_c"

    .line 118
    .line 119
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 122
    .line 123
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->wechat:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    const-string v0, "defaultStockKeepUnit_affiliateProducts_googleplay_c"

    .line 129
    .line 130
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 131
    .line 132
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 133
    .line 134
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->googleplay:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    const-string v0, "defaultStockKeepUnit_affiliateProducts_huawei_c"

    .line 140
    .line 141
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 142
    .line 143
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->affiliateProducts:Lcom/p1/mobile/putong/core/data/AffiliateProducts;

    .line 144
    .line 145
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/AffiliateProducts;->huawei:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    const-string v0, "defaultStockKeepUnit_prices_currencyCode_c"

    .line 151
    .line 152
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 153
    .line 154
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 155
    .line 156
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->currencyCode:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    const-string v0, "defaultStockKeepUnit_prices_currencySymbol_c"

    .line 162
    .line 163
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 164
    .line 165
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 166
    .line 167
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->currencySymbol:Ljava/lang/String;

    .line 168
    .line 169
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    const-string v0, "defaultStockKeepUnit_prices_price_c"

    .line 173
    .line 174
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 175
    .line 176
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 177
    .line 178
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->price:D

    .line 179
    .line 180
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 185
    .line 186
    .line 187
    const-string v0, "defaultStockKeepUnit_prices_unitPrice_c"

    .line 188
    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 190
    .line 191
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 192
    .line 193
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->unitPrice:D

    .line 194
    .line 195
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 200
    .line 201
    .line 202
    const-string v0, "defaultStockKeepUnit_prices_originalPrice_c"

    .line 203
    .line 204
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 205
    .line 206
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 207
    .line 208
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->originalPrice:D

    .line 209
    .line 210
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 215
    .line 216
    .line 217
    const-string v0, "defaultStockKeepUnit_prices_originalUnitPrice_c"

    .line 218
    .line 219
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 220
    .line 221
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 222
    .line 223
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->originalUnitPrice:D

    .line 224
    .line 225
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 230
    .line 231
    .line 232
    const-string v0, "defaultStockKeepUnit_prices_noneRenewalPrice_c"

    .line 233
    .line 234
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 235
    .line 236
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 237
    .line 238
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalPrice:D

    .line 239
    .line 240
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 241
    .line 242
    .line 243
    move-result-object v1

    .line 244
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 245
    .line 246
    .line 247
    const-string v0, "defaultStockKeepUnit_prices_noneRenewalUnitPrice_c"

    .line 248
    .line 249
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 250
    .line 251
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->prices:Lcom/p1/mobile/putong/core/data/Prices;

    .line 252
    .line 253
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/Prices;->noneRenewalUnitPrice:D

    .line 254
    .line 255
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 260
    .line 261
    .line 262
    const-string v0, "defaultStockKeepUnit_tracker_c"

    .line 263
    .line 264
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 265
    .line 266
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->tracker:Ljava/lang/String;

    .line 267
    .line 268
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    const-string v0, "localCoupons_c"

    .line 272
    .line 273
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 274
    .line 275
    if-nez v1, :cond_4

    .line 276
    .line 277
    move-object v1, p0

    .line 278
    goto :goto_4

    .line 279
    :cond_4
    sget-object v1, Lcom/p1/mobile/putong/core/data/Coupon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 280
    .line 281
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 286
    .line 287
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    :goto_4
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 292
    .line 293
    .line 294
    const-string v0, "duration_times_c"

    .line 295
    .line 296
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 297
    .line 298
    iget v1, v1, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->times:I

    .line 299
    .line 300
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 305
    .line 306
    .line 307
    const-string v0, "duration_timeUnit_c"

    .line 308
    .line 309
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 310
    .line 311
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->timeUnit:Ljava/lang/String;

    .line 312
    .line 313
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    const-string v0, "extra_discountText_c"

    .line 317
    .line 318
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 319
    .line 320
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;->discountText:Ljava/lang/String;

    .line 321
    .line 322
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 323
    .line 324
    .line 325
    return-void

    .line 326
    :catch_0
    move-exception p1

    .line 327
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 328
    .line 329
    .line 330
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 331
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Merchandise$27;->write(Lcom/p1/mobile/putong/core/data/Merchandise;Landroid/content/ContentValues;)V

    return-void
.end method
