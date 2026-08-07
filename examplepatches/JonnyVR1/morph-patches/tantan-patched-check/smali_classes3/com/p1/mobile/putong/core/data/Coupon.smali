.class public Lcom/p1/mobile/putong/core/data/Coupon;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final BEGINTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_BENEFITTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_DISCOUNTTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_HASPRIVILEGESCHANGE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_PRIVILEGESCHANGE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Lcom/p1/mobile/putong/core/data/PrivilegesChange;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_SHOWDISCOUNT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_VALUE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_GIFTBENEFIT_DISCOUNT_DISCOUNTTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_GIFTBENEFIT_DISCOUNT_VALUE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_GIFTBENEFIT_GIVEITEMIDS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_TRIALBENEFIT_AFTERTRIALDISCOUNT_DISCOUNTTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_TRIALBENEFIT_AFTERTRIALDISCOUNT_VALUE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_TRIALBENEFIT_DISCOUNT_DISCOUNTTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_TRIALBENEFIT_DISCOUNT_VALUE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_TRIALBENEFIT_TRIALDURATION:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final BENEFIT_LOCALBENEFIT_TRIALBENEFIT_TRIALREPLACEITEMID:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final CONDITION_MERCHANDISEIDS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final CONDITION_PURCHASECHANNEL:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final CONDITION_SKUIDS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final COUPONID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final COUPONTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final ENDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final IGNOREBEGINTIME:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final IGNOREENDTIME:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALAPPLYPROMOTIONS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final NAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final TAGS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "coupon"

.field public static final USERCOUPONID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/Coupon;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public beginTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public benefit:Lcom/p1/mobile/putong/core/data/Benefit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public condition:Lcom/p1/mobile/putong/core/data/Condition;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public couponID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public couponType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public endTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public ignoreBeginTime:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public ignoreEndTime:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public localApplyPromotions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public newCustomerPromotionConfig:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public userCouponID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Coupon$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Coupon$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$5;

    .line 34
    .line 35
    const-string v1, "name_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->NAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$6;

    .line 43
    .line 44
    const-string v1, "tags_c"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$6;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->TAGS:Lcom/tantanapp/common/data/orm/Column;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$7;

    .line 52
    .line 53
    const-string v1, "couponType_c"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$7;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->COUPONTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$8;

    .line 61
    .line 62
    const-string v1, "ignoreBeginTime_c"

    .line 63
    .line 64
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$8;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->IGNOREBEGINTIME:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$9;

    .line 70
    .line 71
    const-string v1, "ignoreEndTime_c"

    .line 72
    .line 73
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$9;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->IGNOREENDTIME:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 77
    .line 78
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$10;

    .line 79
    .line 80
    const-string v1, "beginTime_c"

    .line 81
    .line 82
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$10;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BEGINTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 86
    .line 87
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$11;

    .line 88
    .line 89
    const-string v1, "endTime_c"

    .line 90
    .line 91
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$11;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->ENDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 95
    .line 96
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$12;

    .line 97
    .line 98
    const-string v1, "condition_purchaseChannel_c"

    .line 99
    .line 100
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$12;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->CONDITION_PURCHASECHANNEL:Lcom/tantanapp/common/data/orm/Column;

    .line 104
    .line 105
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$13;

    .line 106
    .line 107
    const-string v1, "condition_skuIDs_c"

    .line 108
    .line 109
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$13;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->CONDITION_SKUIDS:Lcom/tantanapp/common/data/orm/Column;

    .line 113
    .line 114
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$14;

    .line 115
    .line 116
    const-string v1, "condition_merchandiseIDs_c"

    .line 117
    .line 118
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$14;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->CONDITION_MERCHANDISEIDS:Lcom/tantanapp/common/data/orm/Column;

    .line 122
    .line 123
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$15;

    .line 124
    .line 125
    const-string v1, "benefit_localBenefit_benefitType_c"

    .line 126
    .line 127
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$15;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_BENEFITTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 131
    .line 132
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$16;

    .line 133
    .line 134
    const-string v1, "benefit_localBenefit_trialBenefit_trialDuration_c"

    .line 135
    .line 136
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$16;-><init>(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_TRIALBENEFIT_TRIALDURATION:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 140
    .line 141
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$17;

    .line 142
    .line 143
    const-string v1, "benefit_localBenefit_trialBenefit_discount_discountType_c"

    .line 144
    .line 145
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$17;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_TRIALBENEFIT_DISCOUNT_DISCOUNTTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 149
    .line 150
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$18;

    .line 151
    .line 152
    const-string v1, "benefit_localBenefit_trialBenefit_discount_value_c"

    .line 153
    .line 154
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$18;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_TRIALBENEFIT_DISCOUNT_VALUE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 158
    .line 159
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$19;

    .line 160
    .line 161
    const-string v1, "benefit_localBenefit_trialBenefit_trialReplaceItemID_c"

    .line 162
    .line 163
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$19;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_TRIALBENEFIT_TRIALREPLACEITEMID:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 167
    .line 168
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$20;

    .line 169
    .line 170
    const-string v1, "benefit_localBenefit_trialBenefit_afterTrialDiscount_discountType_c"

    .line 171
    .line 172
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$20;-><init>(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_TRIALBENEFIT_AFTERTRIALDISCOUNT_DISCOUNTTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 176
    .line 177
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$21;

    .line 178
    .line 179
    const-string v1, "benefit_localBenefit_trialBenefit_afterTrialDiscount_value_c"

    .line 180
    .line 181
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$21;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_TRIALBENEFIT_AFTERTRIALDISCOUNT_VALUE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 185
    .line 186
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$22;

    .line 187
    .line 188
    const-string v1, "benefit_localBenefit_discountBenefit_discountType_c"

    .line 189
    .line 190
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$22;-><init>(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_DISCOUNTTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 194
    .line 195
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$23;

    .line 196
    .line 197
    const-string v1, "benefit_localBenefit_discountBenefit_value_c"

    .line 198
    .line 199
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$23;-><init>(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_VALUE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 203
    .line 204
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$24;

    .line 205
    .line 206
    const-string v1, "userCouponID_c"

    .line 207
    .line 208
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$24;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->USERCOUPONID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 212
    .line 213
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$25;

    .line 214
    .line 215
    const-string v1, "couponID_c"

    .line 216
    .line 217
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$25;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->COUPONID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 221
    .line 222
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$26;

    .line 223
    .line 224
    const-string v1, "benefit_localBenefit_discountBenefit_showDiscount_c"

    .line 225
    .line 226
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$26;-><init>(Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_SHOWDISCOUNT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 230
    .line 231
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$27;

    .line 232
    .line 233
    const-string v1, "benefit_localBenefit_discountBenefit_privilegesChange_c"

    .line 234
    .line 235
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$27;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_PRIVILEGESCHANGE:Lcom/tantanapp/common/data/orm/Column;

    .line 239
    .line 240
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$28;

    .line 241
    .line 242
    const-string v1, "benefit_localBenefit_discountBenefit_hasPrivilegesChange_c"

    .line 243
    .line 244
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$28;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_DISCOUNTBENEFIT_HASPRIVILEGESCHANGE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 248
    .line 249
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$29;

    .line 250
    .line 251
    const-string v1, "localApplyPromotions_c"

    .line 252
    .line 253
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$29;-><init>(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->LOCALAPPLYPROMOTIONS:Lcom/tantanapp/common/data/orm/Column;

    .line 257
    .line 258
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$30;

    .line 259
    .line 260
    const-string v1, "benefit_localBenefit_giftBenefit_discount_discountType_c"

    .line 261
    .line 262
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$30;-><init>(Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_GIFTBENEFIT_DISCOUNT_DISCOUNTTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 266
    .line 267
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$31;

    .line 268
    .line 269
    const-string v1, "benefit_localBenefit_giftBenefit_discount_value_c"

    .line 270
    .line 271
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$31;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_GIFTBENEFIT_DISCOUNT_VALUE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 275
    .line 276
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$32;

    .line 277
    .line 278
    const-string v1, "benefit_localBenefit_giftBenefit_giveItemIDs_c"

    .line 279
    .line 280
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Coupon$32;-><init>(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->BENEFIT_LOCALBENEFIT_GIFTBENEFIT_GIVEITEMIDS:Lcom/tantanapp/common/data/orm/Column;

    .line 284
    .line 285
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon$33;

    .line 286
    .line 287
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Coupon$33;-><init>()V

    .line 288
    .line 289
    .line 290
    sput-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->DB_ADAPTER:Ll/vzf0;

    .line 291
    .line 292
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/Coupon;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Coupon;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Coupon;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Coupon;->clone()Lcom/p1/mobile/putong/core/data/Coupon;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/Coupon;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Coupon;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v2, Ll/osb;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/osb;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 38
    .line 39
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 40
    .line 41
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 42
    .line 43
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 44
    .line 45
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 46
    .line 47
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 48
    .line 49
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 50
    .line 51
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 54
    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Condition;->clone()Lcom/p1/mobile/putong/core/data/Condition;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 62
    .line 63
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 64
    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Benefit;->clone()Lcom/p1/mobile/putong/core/data/Benefit;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 72
    .line 73
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 74
    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 78
    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 82
    .line 83
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 86
    .line 87
    if-eqz p0, :cond_3

    .line 88
    .line 89
    new-instance v1, Ll/psb;

    .line 90
    .line 91
    invoke-direct {v1}, Ll/psb;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 99
    .line 100
    :cond_3
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Coupon;->clone()Lcom/p1/mobile/putong/core/data/Coupon;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/core/data/Coupon;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 52
    .line 53
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 54
    .line 55
    if-ne p1, v3, :cond_3

    .line 56
    .line 57
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 58
    .line 59
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 60
    .line 61
    if-ne p1, v3, :cond_3

    .line 62
    .line 63
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 64
    .line 65
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 66
    .line 67
    cmpl-double p1, v3, v5

    .line 68
    .line 69
    if-nez p1, :cond_3

    .line 70
    .line 71
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 72
    .line 73
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 74
    .line 75
    cmpl-double p1, v3, v5

    .line 76
    .line 77
    if-nez p1, :cond_3

    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 80
    .line 81
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 82
    .line 83
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 90
    .line 91
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 92
    .line 93
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 100
    .line 101
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_3

    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_3

    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_3

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 130
    .line 131
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 132
    .line 133
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result p0

    .line 137
    if-eqz p0, :cond_3

    .line 138
    .line 139
    return v0

    .line 140
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "coupon"

    .line 2
    .line 3
    return-object p0
.end method

.method public getCouponPrice()D
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/LocalBenefit;->benefitType:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "localTrial"

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 14
    .line 15
    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LocalBenefit;->trialBenefit:Lcom/p1/mobile/putong/core/data/TrialBenefit;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/TrialBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 24
    .line 25
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Discount;->value:I

    .line 26
    .line 27
    :goto_0
    int-to-double v0, p0

    .line 28
    div-double/2addr v0, v2

    .line 29
    return-wide v0

    .line 30
    :cond_0
    iget-object v0, v1, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/LocalBenefit;->benefitType:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, "localGift"

    .line 35
    .line 36
    invoke-static {v1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LocalBenefit;->giftBenefit:Lcom/p1/mobile/putong/core/data/GiftBenefit;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GiftBenefit;->discount:Lcom/p1/mobile/putong/core/data/Discount;

    .line 49
    .line 50
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Discount;->value:I

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Benefit;->localBenefit:Lcom/p1/mobile/putong/core/data/LocalBenefit;

    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LocalBenefit;->discountBenefit:Lcom/p1/mobile/putong/core/data/DiscountBenefit;

    .line 56
    .line 57
    iget p0, p0, Lcom/p1/mobile/putong/core/data/DiscountBenefit;->value:I

    .line 58
    .line 59
    goto :goto_0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_b

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tantanapp/common/data/DbObject;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreBeginTime:Z

    .line 52
    .line 53
    const/16 v3, 0x4d5

    .line 54
    .line 55
    const/16 v4, 0x4cf

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    move v1, v4

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v3

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->ignoreEndTime:Z

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    move v3, v4

    .line 70
    :cond_4
    add-int/2addr v0, v3

    .line 71
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Coupon;->beginTime:D

    .line 72
    .line 73
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 74
    .line 75
    .line 76
    move-result-wide v3

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    const/16 v1, 0x20

    .line 80
    .line 81
    ushr-long v5, v3, v1

    .line 82
    .line 83
    xor-long/2addr v3, v5

    .line 84
    long-to-int v3, v3

    .line 85
    add-int/2addr v0, v3

    .line 86
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Coupon;->endTime:D

    .line 87
    .line 88
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 89
    .line 90
    .line 91
    move-result-wide v3

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    ushr-long v5, v3, v1

    .line 95
    .line 96
    xor-long/2addr v3, v5

    .line 97
    long-to-int v1, v3

    .line 98
    add-int/2addr v0, v1

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 102
    .line 103
    if-eqz v1, :cond_5

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Condition;->hashCode()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    goto :goto_4

    .line 110
    :cond_5
    move v1, v2

    .line 111
    :goto_4
    add-int/2addr v0, v1

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 115
    .line 116
    if-eqz v1, :cond_6

    .line 117
    .line 118
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Benefit;->hashCode()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    goto :goto_5

    .line 123
    :cond_6
    move v1, v2

    .line 124
    :goto_5
    add-int/2addr v0, v1

    .line 125
    mul-int/lit8 v0, v0, 0x29

    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v1, :cond_7

    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    goto :goto_6

    .line 136
    :cond_7
    move v1, v2

    .line 137
    :goto_6
    add-int/2addr v0, v1

    .line 138
    mul-int/lit8 v0, v0, 0x29

    .line 139
    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz v1, :cond_8

    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    goto :goto_7

    .line 149
    :cond_8
    move v1, v2

    .line 150
    :goto_7
    add-int/2addr v0, v1

    .line 151
    mul-int/lit8 v0, v0, 0x29

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 154
    .line 155
    if-eqz v1, :cond_9

    .line 156
    .line 157
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    goto :goto_8

    .line 162
    :cond_9
    move v1, v2

    .line 163
    :goto_8
    add-int/2addr v0, v1

    .line 164
    mul-int/lit8 v0, v0, 0x29

    .line 165
    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 167
    .line 168
    if-eqz v1, :cond_a

    .line 169
    .line 170
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    :cond_a
    add-int/2addr v0, v2

    .line 175
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 176
    .line 177
    :cond_b
    return v0
.end method

.method public isBelongPromotion(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->name:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->tags:Ljava/util/List;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponType:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Condition;->new_()Lcom/p1/mobile/putong/core/data/Condition;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->condition:Lcom/p1/mobile/putong/core/data/Condition;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Benefit;->new_()Lcom/p1/mobile/putong/core/data/Benefit;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->benefit:Lcom/p1/mobile/putong/core/data/Benefit;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->userCouponID:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_6

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->couponID:Ljava/lang/String;

    .line 60
    .line 61
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_7

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Coupon;->newCustomerPromotionConfig:Ljava/lang/String;

    .line 66
    .line 67
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 68
    .line 69
    if-nez v0, :cond_8

    .line 70
    .line 71
    new-instance v0, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Coupon;->localApplyPromotions:Ljava/util/List;

    .line 77
    .line 78
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
