.class Lcom/p1/mobile/putong/core/data/Coupon$33;
.super Ll/vzf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Coupon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vzf0<",
        "Lcom/p1/mobile/putong/core/data/Coupon;",
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
    const-string p1, " (_id INTEGER PRIMARY KEY,id_c TEXT,name_c TEXT,tags_c BLOB,couponType_c TEXT,ignoreBeginTime_c INTEGER,ignoreEndTime_c INTEGER,beginTime_c REAL,endTime_c REAL,condition_purchaseChannel_c BLOB,condition_skuIDs_c BLOB,condition_merchandiseIDs_c BLOB,benefit_localBenefit_benefitType_c TEXT,benefit_localBenefit_trialBenefit_trialDuration_c INTEGER,benefit_localBenefit_trialBenefit_discount_discountType_c TEXT,benefit_localBenefit_trialBenefit_discount_value_c INTEGER,benefit_localBenefit_trialBenefit_trialReplaceItemID_c INTEGER,benefit_localBenefit_trialBenefit_afterTrialDiscount_discountType_c TEXT,benefit_localBenefit_trialBenefit_afterTrialDiscount_value_c INTEGER,benefit_localBenefit_discountBenefit_discountType_c TEXT,benefit_localBenefit_discountBenefit_value_c INTEGER,userCouponID_c TEXT,couponID_c TEXT,benefit_localBenefit_discountBenefit_showDiscount_c TEXT,benefit_localBenefit_discountBenefit_privilegesChange_c BLOB,benefit_localBenefit_discountBenefit_hasPrivilegesChange_c INTEGER,localApplyPromotions_c BLOB,benefit_localBenefit_giftBenefit_discount_discountType_c TEXT,benefit_localBenefit_giftBenefit_discount_value_c INTEGER,benefit_localBenefit_giftBenefit_giveItemIDs_c BLOB)"

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
    const-class p0, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    return-object p0
.end method

.method public init()Lcom/p1/mobile/putong/core/data/Coupon;
    .locals 2

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Coupon;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, ""

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    new-instance v0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Condition;->new_()Lcom/p1/mobile/putong/core/data/Condition;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Benefit;->new_()Lcom/p1/mobile/putong/core/data/Benefit;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 56
    .line 57
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_6

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 62
    .line 63
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_7

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 68
    .line 69
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 70
    .line 71
    if-nez v0, :cond_8

    .line 72
    .line 73
    new-instance v0, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 79
    .line 80
    :cond_8
    return-object p0
.end method

.method public bridge synthetic init()Ljava/lang/Object;
    .locals 0

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Coupon$33;->init()Lcom/p1/mobile/putong/core/data/Coupon;

    move-result-object p0

    return-object p0
.end method

.method public read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Coupon;
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    iput v0, p0, Ll/vzf0;->readIndex:I

    .line 5
    .line 6
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 7
    .line 8
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/Coupon;-><init>()V

    .line 9
    .line 10
    .line 11
    :try_start_0
    new-instance v2, Lcom/p1/mobile/putong/core/data/Condition;

    .line 12
    .line 13
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/Condition;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 17
    .line 18
    new-instance v2, Lcom/p1/mobile/putong/core/data/Benefit;

    .line 19
    .line 20
    invoke-direct {v2}, Lcom/p1/mobile/putong/core/data/Benefit;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 24
    .line 25
    new-instance v3, Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 26
    .line 27
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/LocalBenefit;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 31
    .line 32
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 33
    .line 34
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 35
    .line 36
    new-instance v3, Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 37
    .line 38
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/TrialBenefit;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 42
    .line 43
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 44
    .line 45
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 46
    .line 47
    new-instance v3, Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 48
    .line 49
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/DiscountBenefit;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 53
    .line 54
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 55
    .line 56
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 57
    .line 58
    new-instance v3, Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 59
    .line 60
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/GiftBenefit;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 64
    .line 65
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 68
    .line 69
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 70
    .line 71
    new-instance v3, Lcom/p1/mobile/putong/core/data/Discount;

    .line 72
    .line 73
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/Discount;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/TrialBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 77
    .line 78
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 79
    .line 80
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 81
    .line 82
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 83
    .line 84
    new-instance v3, Lcom/p1/mobile/putong/core/data/Discount;

    .line 85
    .line 86
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/Discount;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/TrialBenefit;->afterTrialDiscount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 90
    .line 91
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 94
    .line 95
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 96
    .line 97
    new-instance v3, Lcom/p1/mobile/putong/core/data/Discount;

    .line 98
    .line 99
    invoke-direct {v3}, Lcom/p1/mobile/putong/core/data/Discount;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object v3, v2, Lcom/p1/mobile/putong/core/data/GiftBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 103
    .line 104
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getLong(I)J

    .line 105
    .line 106
    .line 107
    move-result-wide v2

    .line 108
    iput-wide v2, v1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 109
    .line 110
    add-int/lit8 v2, p2, 0x1

    .line 111
    .line 112
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    const/4 v4, 0x0

    .line 117
    if-eqz v3, :cond_1

    .line 118
    .line 119
    move-object v2, v4

    .line 120
    goto :goto_0

    .line 121
    :cond_1
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v2

    .line 125
    :goto_0
    iput-object v2, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 126
    .line 127
    add-int/lit8 v2, p2, 0x2

    .line 128
    .line 129
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    if-eqz v3, :cond_2

    .line 134
    .line 135
    move-object v2, v4

    .line 136
    goto :goto_1

    .line 137
    :cond_2
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    :goto_1
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 142
    .line 143
    add-int/lit8 v2, p2, 0x3

    .line 144
    .line 145
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    if-eqz v3, :cond_3

    .line 150
    .line 151
    move-object v2, v4

    .line 152
    goto :goto_2

    .line 153
    :cond_3
    sget-object v3, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 154
    .line 155
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    invoke-virtual {v3, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    check-cast v2, Ljava/util/List;

    .line 168
    .line 169
    :goto_2
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 170
    .line 171
    add-int/lit8 v2, p2, 0x4

    .line 172
    .line 173
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    if-eqz v3, :cond_4

    .line 178
    .line 179
    move-object v2, v4

    .line 180
    goto :goto_3

    .line 181
    :cond_4
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    :goto_3
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 186
    .line 187
    add-int/lit8 v2, p2, 0x5

    .line 188
    .line 189
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 190
    .line 191
    .line 192
    move-result v2

    .line 193
    const/4 v3, 0x1

    .line 194
    if-ne v2, v3, :cond_5

    .line 195
    .line 196
    move v2, v3

    .line 197
    goto :goto_4

    .line 198
    :cond_5
    move v2, v0

    .line 199
    :goto_4
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 200
    .line 201
    add-int/lit8 v2, p2, 0x6

    .line 202
    .line 203
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    if-ne v2, v3, :cond_6

    .line 208
    .line 209
    move v2, v3

    .line 210
    goto :goto_5

    .line 211
    :cond_6
    move v2, v0

    .line 212
    :goto_5
    iput-boolean v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 213
    .line 214
    add-int/lit8 v2, p2, 0x7

    .line 215
    .line 216
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 217
    .line 218
    .line 219
    move-result-wide v5

    .line 220
    iput-wide v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 221
    .line 222
    add-int/lit8 v2, p2, 0x8

    .line 223
    .line 224
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getDouble(I)D

    .line 225
    .line 226
    .line 227
    move-result-wide v5

    .line 228
    iput-wide v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 229
    .line 230
    add-int/lit8 v2, p2, 0x9

    .line 231
    .line 232
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 233
    .line 234
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 235
    .line 236
    .line 237
    move-result v6

    .line 238
    if-eqz v6, :cond_7

    .line 239
    .line 240
    move-object v2, v4

    .line 241
    goto :goto_6

    .line 242
    :cond_7
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 243
    .line 244
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 245
    .line 246
    .line 247
    move-result-object v6

    .line 248
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    invoke-virtual {v6, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    check-cast v2, Ljava/util/List;

    .line 257
    .line 258
    :goto_6
    iput-object v2, v5, Lcom/p1/mobile/putong/core/data/Condition;->purchaseChannel:Ljava/util/List;

    .line 259
    .line 260
    add-int/lit8 v2, p2, 0xa

    .line 261
    .line 262
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 263
    .line 264
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 265
    .line 266
    .line 267
    move-result v6

    .line 268
    if-eqz v6, :cond_8

    .line 269
    .line 270
    move-object v2, v4

    .line 271
    goto :goto_7

    .line 272
    :cond_8
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 273
    .line 274
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 275
    .line 276
    .line 277
    move-result-object v6

    .line 278
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    invoke-virtual {v6, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    check-cast v2, Ljava/util/List;

    .line 287
    .line 288
    :goto_7
    iput-object v2, v5, Lcom/p1/mobile/putong/core/data/Condition;->skuIDs:Ljava/util/List;

    .line 289
    .line 290
    add-int/lit8 v2, p2, 0xb

    .line 291
    .line 292
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 293
    .line 294
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 295
    .line 296
    .line 297
    move-result v6

    .line 298
    if-eqz v6, :cond_9

    .line 299
    .line 300
    move-object v2, v4

    .line 301
    goto :goto_8

    .line 302
    :cond_9
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 303
    .line 304
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 305
    .line 306
    .line 307
    move-result-object v6

    .line 308
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    invoke-virtual {v6, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 313
    .line 314
    .line 315
    move-result-object v2

    .line 316
    check-cast v2, Ljava/util/List;

    .line 317
    .line 318
    :goto_8
    iput-object v2, v5, Lcom/p1/mobile/putong/core/data/Condition;->merchandiseIDs:Ljava/util/List;

    .line 319
    .line 320
    add-int/lit8 v2, p2, 0xc

    .line 321
    .line 322
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 323
    .line 324
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 325
    .line 326
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 327
    .line 328
    .line 329
    move-result v6

    .line 330
    if-eqz v6, :cond_a

    .line 331
    .line 332
    move-object v2, v4

    .line 333
    goto :goto_9

    .line 334
    :cond_a
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    :goto_9
    iput-object v2, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->benefitType:Ljava/lang/String;

    .line 339
    .line 340
    add-int/lit8 v2, p2, 0xd

    .line 341
    .line 342
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 343
    .line 344
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 345
    .line 346
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 347
    .line 348
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    .line 349
    .line 350
    .line 351
    move-result-wide v6

    .line 352
    iput-wide v6, v5, Lcom/p1/mobile/putong/core/data/TrialBenefit;->trialDuration:J

    .line 353
    .line 354
    add-int/lit8 v2, p2, 0xe

    .line 355
    .line 356
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 357
    .line 358
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 359
    .line 360
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 361
    .line 362
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/TrialBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 363
    .line 364
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 365
    .line 366
    .line 367
    move-result v6

    .line 368
    if-eqz v6, :cond_b

    .line 369
    .line 370
    move-object v2, v4

    .line 371
    goto :goto_a

    .line 372
    :cond_b
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object v2

    .line 376
    :goto_a
    iput-object v2, v5, Lcom/p1/mobile/putong/core/data/Discount;->discountType:Ljava/lang/String;

    .line 377
    .line 378
    add-int/lit8 v2, p2, 0xf

    .line 379
    .line 380
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 381
    .line 382
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 383
    .line 384
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 385
    .line 386
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/TrialBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 387
    .line 388
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 389
    .line 390
    .line 391
    move-result v2

    .line 392
    iput v2, v5, Lcom/p1/mobile/putong/core/data/Discount;->value:I

    .line 393
    .line 394
    add-int/lit8 v2, p2, 0x10

    .line 395
    .line 396
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 397
    .line 398
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 399
    .line 400
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 401
    .line 402
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 403
    .line 404
    .line 405
    move-result v2

    .line 406
    iput v2, v5, Lcom/p1/mobile/putong/core/data/TrialBenefit;->trialReplaceItemID:I

    .line 407
    .line 408
    add-int/lit8 v2, p2, 0x11

    .line 409
    .line 410
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 411
    .line 412
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 413
    .line 414
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 415
    .line 416
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/TrialBenefit;->afterTrialDiscount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 417
    .line 418
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 419
    .line 420
    .line 421
    move-result v6

    .line 422
    if-eqz v6, :cond_c

    .line 423
    .line 424
    move-object v2, v4

    .line 425
    goto :goto_b

    .line 426
    :cond_c
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object v2

    .line 430
    :goto_b
    iput-object v2, v5, Lcom/p1/mobile/putong/core/data/Discount;->discountType:Ljava/lang/String;

    .line 431
    .line 432
    add-int/lit8 v2, p2, 0x12

    .line 433
    .line 434
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 435
    .line 436
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 437
    .line 438
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 439
    .line 440
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/TrialBenefit;->afterTrialDiscount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 441
    .line 442
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 443
    .line 444
    .line 445
    move-result v2

    .line 446
    iput v2, v5, Lcom/p1/mobile/putong/core/data/Discount;->value:I

    .line 447
    .line 448
    add-int/lit8 v2, p2, 0x13

    .line 449
    .line 450
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 451
    .line 452
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 453
    .line 454
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 455
    .line 456
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 457
    .line 458
    .line 459
    move-result v6

    .line 460
    if-eqz v6, :cond_d

    .line 461
    .line 462
    move-object v2, v4

    .line 463
    goto :goto_c

    .line 464
    :cond_d
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object v2

    .line 468
    :goto_c
    iput-object v2, v5, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->discountType:Ljava/lang/String;

    .line 469
    .line 470
    add-int/lit8 v2, p2, 0x14

    .line 471
    .line 472
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 473
    .line 474
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 475
    .line 476
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 477
    .line 478
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 479
    .line 480
    .line 481
    move-result v2

    .line 482
    iput v2, v5, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->value:I

    .line 483
    .line 484
    add-int/lit8 v2, p2, 0x15

    .line 485
    .line 486
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 487
    .line 488
    .line 489
    move-result v5

    .line 490
    if-eqz v5, :cond_e

    .line 491
    .line 492
    move-object v2, v4

    .line 493
    goto :goto_d

    .line 494
    :cond_e
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 495
    .line 496
    .line 497
    move-result-object v2

    .line 498
    :goto_d
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 499
    .line 500
    add-int/lit8 v2, p2, 0x16

    .line 501
    .line 502
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 503
    .line 504
    .line 505
    move-result v5

    .line 506
    if-eqz v5, :cond_f

    .line 507
    .line 508
    move-object v2, v4

    .line 509
    goto :goto_e

    .line 510
    :cond_f
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 511
    .line 512
    .line 513
    move-result-object v2

    .line 514
    :goto_e
    iput-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 515
    .line 516
    add-int/lit8 v2, p2, 0x17

    .line 517
    .line 518
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 519
    .line 520
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 521
    .line 522
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 523
    .line 524
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 525
    .line 526
    .line 527
    move-result v6

    .line 528
    if-eqz v6, :cond_10

    .line 529
    .line 530
    move-object v2, v4

    .line 531
    goto :goto_f

    .line 532
    :cond_10
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v2

    .line 536
    :goto_f
    iput-object v2, v5, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->showDiscount:Ljava/lang/String;

    .line 537
    .line 538
    add-int/lit8 v2, p2, 0x18

    .line 539
    .line 540
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 541
    .line 542
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 543
    .line 544
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 545
    .line 546
    invoke-interface {p1, v2}, Landroid/database/Cursor;->isNull(I)Z

    .line 547
    .line 548
    .line 549
    move-result v6

    .line 550
    if-eqz v6, :cond_11

    .line 551
    .line 552
    move-object v2, v4

    .line 553
    goto :goto_10

    .line 554
    :cond_11
    sget-object v6, Lcom/p1/mobile/putong/core/data/PrivilegesChange;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 555
    .line 556
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getBlob(I)[B

    .line 557
    .line 558
    .line 559
    move-result-object v2

    .line 560
    invoke-virtual {v6, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 561
    .line 562
    .line 563
    move-result-object v2

    .line 564
    check-cast v2, Lcom/p1/mobile/putong/core/data/PrivilegesChange;

    .line 565
    .line 566
    :goto_10
    iput-object v2, v5, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->privilegesChange:Lcom/p1/mobile/putong/core/data/PrivilegesChange;

    .line 567
    .line 568
    add-int/lit8 v2, p2, 0x19

    .line 569
    .line 570
    iget-object v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 571
    .line 572
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 573
    .line 574
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 575
    .line 576
    invoke-interface {p1, v2}, Landroid/database/Cursor;->getInt(I)I

    .line 577
    .line 578
    .line 579
    move-result v2

    .line 580
    if-ne v2, v3, :cond_12

    .line 581
    .line 582
    move v0, v3

    .line 583
    :cond_12
    iput-boolean v0, v5, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->hasPrivilegesChange:Z

    .line 584
    .line 585
    add-int/lit8 v0, p2, 0x1a

    .line 586
    .line 587
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 588
    .line 589
    .line 590
    move-result v2

    .line 591
    if-eqz v2, :cond_13

    .line 592
    .line 593
    move-object v0, v4

    .line 594
    goto :goto_11

    .line 595
    :cond_13
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 596
    .line 597
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 598
    .line 599
    .line 600
    move-result-object v2

    .line 601
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 602
    .line 603
    .line 604
    move-result-object v0

    .line 605
    invoke-virtual {v2, v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 606
    .line 607
    .line 608
    move-result-object v0

    .line 609
    check-cast v0, Ljava/util/List;

    .line 610
    .line 611
    :goto_11
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 612
    .line 613
    add-int/lit8 v0, p2, 0x1b

    .line 614
    .line 615
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 616
    .line 617
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 618
    .line 619
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 620
    .line 621
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/GiftBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 622
    .line 623
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 624
    .line 625
    .line 626
    move-result v3

    .line 627
    if-eqz v3, :cond_14

    .line 628
    .line 629
    move-object v0, v4

    .line 630
    goto :goto_12

    .line 631
    :cond_14
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 632
    .line 633
    .line 634
    move-result-object v0

    .line 635
    :goto_12
    iput-object v0, v2, Lcom/p1/mobile/putong/core/data/Discount;->discountType:Ljava/lang/String;

    .line 636
    .line 637
    add-int/lit8 v0, p2, 0x1c

    .line 638
    .line 639
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 640
    .line 641
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 642
    .line 643
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 644
    .line 645
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/GiftBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 646
    .line 647
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 648
    .line 649
    .line 650
    move-result v0

    .line 651
    iput v0, v2, Lcom/p1/mobile/putong/core/data/Discount;->value:I

    .line 652
    .line 653
    add-int/lit8 v0, p2, 0x1d

    .line 654
    .line 655
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 656
    .line 657
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 658
    .line 659
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 660
    .line 661
    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    .line 662
    .line 663
    .line 664
    move-result v3

    .line 665
    if-eqz v3, :cond_15

    .line 666
    .line 667
    goto :goto_13

    .line 668
    :cond_15
    sget-object v3, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 669
    .line 670
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 671
    .line 672
    .line 673
    move-result-object v3

    .line 674
    invoke-interface {p1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    .line 675
    .line 676
    .line 677
    move-result-object v0

    .line 678
    invoke-virtual {v3, v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 679
    .line 680
    .line 681
    move-result-object v0

    .line 682
    move-object v4, v0

    .line 683
    check-cast v4, Ljava/util/List;

    .line 684
    .line 685
    :goto_13
    iput-object v4, v2, Lcom/p1/mobile/putong/core/data/GiftBenefit;->giveItemIDs:Ljava/util/List;

    .line 686
    .line 687
    add-int/lit8 p2, p2, 0x1e

    .line 688
    .line 689
    iput p2, p0, Ll/vzf0;->readIndex:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 690
    .line 691
    goto :goto_14

    .line 692
    :catch_0
    move-exception p0

    .line 693
    invoke-static {p0, p1}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 694
    .line 695
    .line 696
    :goto_14
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 697
    .line 698
    const-string p1, ""

    .line 699
    .line 700
    if-nez p0, :cond_16

    .line 701
    .line 702
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 703
    .line 704
    :cond_16
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 705
    .line 706
    if-nez p0, :cond_17

    .line 707
    .line 708
    new-instance p0, Ljava/util/ArrayList;

    .line 709
    .line 710
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 711
    .line 712
    .line 713
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 714
    .line 715
    :cond_17
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 716
    .line 717
    if-nez p0, :cond_18

    .line 718
    .line 719
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 720
    .line 721
    :cond_18
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 722
    .line 723
    if-nez p0, :cond_19

    .line 724
    .line 725
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Condition;->new_()Lcom/p1/mobile/putong/core/data/Condition;

    .line 726
    .line 727
    .line 728
    move-result-object p0

    .line 729
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 730
    .line 731
    :cond_19
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 732
    .line 733
    if-nez p0, :cond_1a

    .line 734
    .line 735
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Benefit;->new_()Lcom/p1/mobile/putong/core/data/Benefit;

    .line 736
    .line 737
    .line 738
    move-result-object p0

    .line 739
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 740
    .line 741
    :cond_1a
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 742
    .line 743
    if-nez p0, :cond_1b

    .line 744
    .line 745
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 746
    .line 747
    :cond_1b
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 748
    .line 749
    if-nez p0, :cond_1c

    .line 750
    .line 751
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 752
    .line 753
    :cond_1c
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 754
    .line 755
    if-nez p0, :cond_1d

    .line 756
    .line 757
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 758
    .line 759
    :cond_1d
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 760
    .line 761
    if-nez p0, :cond_1e

    .line 762
    .line 763
    new-instance p0, Ljava/util/ArrayList;

    .line 764
    .line 765
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 766
    .line 767
    .line 768
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 769
    .line 770
    :cond_1e
    return-object v1
.end method

.method public bridge synthetic read(Landroid/database/Cursor;I)Ljava/lang/Object;
    .locals 0

    .line 771
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Coupon$33;->read(Landroid/database/Cursor;I)Lcom/p1/mobile/putong/core/data/Coupon;

    move-result-object p0

    return-object p0
.end method

.method public write(Lcom/p1/mobile/putong/core/data/Coupon;Landroid/content/ContentValues;)V
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
    const-string v0, "name_c"

    .line 10
    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "tags_c"

    .line 17
    .line 18
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    move-object v1, p0

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    :goto_0
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 37
    .line 38
    .line 39
    const-string v0, "couponType_c"

    .line 40
    .line 41
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-string v0, "ignoreBeginTime_c"

    .line 47
    .line 48
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 49
    .line 50
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 55
    .line 56
    .line 57
    const-string v0, "ignoreEndTime_c"

    .line 58
    .line 59
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 60
    .line 61
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 66
    .line 67
    .line 68
    const-string v0, "beginTime_c"

    .line 69
    .line 70
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 71
    .line 72
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 77
    .line 78
    .line 79
    const-string v0, "endTime_c"

    .line 80
    .line 81
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 82
    .line 83
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Double;)V

    .line 88
    .line 89
    .line 90
    const-string v0, "condition_purchaseChannel_c"

    .line 91
    .line 92
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Condition;->purchaseChannel:Ljava/util/List;

    .line 95
    .line 96
    if-nez v1, :cond_1

    .line 97
    .line 98
    move-object v1, p0

    .line 99
    goto :goto_1

    .line 100
    :cond_1
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 107
    .line 108
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Condition;->purchaseChannel:Ljava/util/List;

    .line 109
    .line 110
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    :goto_1
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 115
    .line 116
    .line 117
    const-string v0, "condition_skuIDs_c"

    .line 118
    .line 119
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Condition;->skuIDs:Ljava/util/List;

    .line 122
    .line 123
    if-nez v1, :cond_2

    .line 124
    .line 125
    move-object v1, p0

    .line 126
    goto :goto_2

    .line 127
    :cond_2
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 134
    .line 135
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Condition;->skuIDs:Ljava/util/List;

    .line 136
    .line 137
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    :goto_2
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 142
    .line 143
    .line 144
    const-string v0, "condition_merchandiseIDs_c"

    .line 145
    .line 146
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 147
    .line 148
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Condition;->merchandiseIDs:Ljava/util/List;

    .line 149
    .line 150
    if-nez v1, :cond_3

    .line 151
    .line 152
    move-object v1, p0

    .line 153
    goto :goto_3

    .line 154
    :cond_3
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 161
    .line 162
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Condition;->merchandiseIDs:Ljava/util/List;

    .line 163
    .line 164
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    :goto_3
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 169
    .line 170
    .line 171
    const-string v0, "benefit_localBenefit_benefitType_c"

    .line 172
    .line 173
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 174
    .line 175
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 176
    .line 177
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->benefitType:Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    const-string v0, "benefit_localBenefit_trialBenefit_trialDuration_c"

    .line 183
    .line 184
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 185
    .line 186
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 187
    .line 188
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 189
    .line 190
    iget-wide v1, v1, Lcom/p1/mobile/putong/core/data/TrialBenefit;->trialDuration:J

    .line 191
    .line 192
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Long;)V

    .line 197
    .line 198
    .line 199
    const-string v0, "benefit_localBenefit_trialBenefit_discount_discountType_c"

    .line 200
    .line 201
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 202
    .line 203
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 204
    .line 205
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 206
    .line 207
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/TrialBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 208
    .line 209
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Discount;->discountType:Ljava/lang/String;

    .line 210
    .line 211
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    const-string v0, "benefit_localBenefit_trialBenefit_discount_value_c"

    .line 215
    .line 216
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 217
    .line 218
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 219
    .line 220
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 221
    .line 222
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/TrialBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 223
    .line 224
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Discount;->value:I

    .line 225
    .line 226
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 231
    .line 232
    .line 233
    const-string v0, "benefit_localBenefit_trialBenefit_trialReplaceItemID_c"

    .line 234
    .line 235
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 236
    .line 237
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 238
    .line 239
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 240
    .line 241
    iget v1, v1, Lcom/p1/mobile/putong/core/data/TrialBenefit;->trialReplaceItemID:I

    .line 242
    .line 243
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 248
    .line 249
    .line 250
    const-string v0, "benefit_localBenefit_trialBenefit_afterTrialDiscount_discountType_c"

    .line 251
    .line 252
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 253
    .line 254
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 255
    .line 256
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 257
    .line 258
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/TrialBenefit;->afterTrialDiscount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 259
    .line 260
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Discount;->discountType:Ljava/lang/String;

    .line 261
    .line 262
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    const-string v0, "benefit_localBenefit_trialBenefit_afterTrialDiscount_value_c"

    .line 266
    .line 267
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 268
    .line 269
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 270
    .line 271
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 272
    .line 273
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/TrialBenefit;->afterTrialDiscount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 274
    .line 275
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Discount;->value:I

    .line 276
    .line 277
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 282
    .line 283
    .line 284
    const-string v0, "benefit_localBenefit_discountBenefit_discountType_c"

    .line 285
    .line 286
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 287
    .line 288
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 289
    .line 290
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 291
    .line 292
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->discountType:Ljava/lang/String;

    .line 293
    .line 294
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    const-string v0, "benefit_localBenefit_discountBenefit_value_c"

    .line 298
    .line 299
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 300
    .line 301
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 302
    .line 303
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 304
    .line 305
    iget v1, v1, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->value:I

    .line 306
    .line 307
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 312
    .line 313
    .line 314
    const-string v0, "userCouponID_c"

    .line 315
    .line 316
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 317
    .line 318
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    const-string v0, "couponID_c"

    .line 322
    .line 323
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 324
    .line 325
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    const-string v0, "benefit_localBenefit_discountBenefit_showDiscount_c"

    .line 329
    .line 330
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 331
    .line 332
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 333
    .line 334
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 335
    .line 336
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->showDiscount:Ljava/lang/String;

    .line 337
    .line 338
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    const-string v0, "benefit_localBenefit_discountBenefit_privilegesChange_c"

    .line 342
    .line 343
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 344
    .line 345
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 346
    .line 347
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 348
    .line 349
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->privilegesChange:Lcom/p1/mobile/putong/core/data/PrivilegesChange;

    .line 350
    .line 351
    if-nez v1, :cond_4

    .line 352
    .line 353
    move-object v1, p0

    .line 354
    goto :goto_4

    .line 355
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/PrivilegesChange;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 356
    .line 357
    invoke-virtual {v2, v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 358
    .line 359
    .line 360
    move-result-object v1

    .line 361
    :goto_4
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 362
    .line 363
    .line 364
    const-string v0, "benefit_localBenefit_discountBenefit_hasPrivilegesChange_c"

    .line 365
    .line 366
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 367
    .line 368
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 369
    .line 370
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 371
    .line 372
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->hasPrivilegesChange:Z

    .line 373
    .line 374
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 379
    .line 380
    .line 381
    const-string v0, "localApplyPromotions_c"

    .line 382
    .line 383
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 384
    .line 385
    if-nez v1, :cond_5

    .line 386
    .line 387
    move-object v1, p0

    .line 388
    goto :goto_5

    .line 389
    :cond_5
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 390
    .line 391
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 396
    .line 397
    invoke-virtual {v1, v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    :goto_5
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V

    .line 402
    .line 403
    .line 404
    const-string v0, "benefit_localBenefit_giftBenefit_discount_discountType_c"

    .line 405
    .line 406
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 407
    .line 408
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 409
    .line 410
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 411
    .line 412
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 413
    .line 414
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Discount;->discountType:Ljava/lang/String;

    .line 415
    .line 416
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    .line 418
    .line 419
    const-string v0, "benefit_localBenefit_giftBenefit_discount_value_c"

    .line 420
    .line 421
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 422
    .line 423
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 424
    .line 425
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 426
    .line 427
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 428
    .line 429
    iget v1, v1, Lcom/p1/mobile/putong/core/data/Discount;->value:I

    .line 430
    .line 431
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 432
    .line 433
    .line 434
    move-result-object v1

    .line 435
    invoke-static {p2, v0, v1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 436
    .line 437
    .line 438
    const-string v0, "benefit_localBenefit_giftBenefit_giveItemIDs_c"

    .line 439
    .line 440
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 441
    .line 442
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 443
    .line 444
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 445
    .line 446
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftBenefit;->giveItemIDs:Ljava/util/List;

    .line 447
    .line 448
    if-nez v1, :cond_6

    .line 449
    .line 450
    move-object p1, p0

    .line 451
    goto :goto_6

    .line 452
    :cond_6
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 453
    .line 454
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 455
    .line 456
    .line 457
    move-result-object v1

    .line 458
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 459
    .line 460
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 461
    .line 462
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 463
    .line 464
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GiftBenefit;->giveItemIDs:Ljava/util/List;

    .line 465
    .line 466
    invoke-virtual {v1, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 467
    .line 468
    .line 469
    move-result-object p1

    .line 470
    :goto_6
    invoke-static {p2, v0, p1}, Lcom/tantanapp/common/data/DbObject;->cvPut(Landroid/content/ContentValues;Ljava/lang/String;[B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 471
    .line 472
    .line 473
    return-void

    .line 474
    :catch_0
    move-exception p1

    .line 475
    invoke-static {p1, p0}, Lcom/google/protobuf/nano/MessageNano;->reportError(Ljava/lang/Exception;Landroid/database/Cursor;)V

    .line 476
    .line 477
    .line 478
    return-void
.end method

.method public bridge synthetic write(Ljava/lang/Object;Landroid/content/ContentValues;)V
    .locals 0

    .line 479
    check-cast p1, Lcom/p1/mobile/putong/core/data/Coupon;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Coupon$33;->write(Lcom/p1/mobile/putong/core/data/Coupon;Landroid/content/ContentValues;)V

    return-void
.end method
