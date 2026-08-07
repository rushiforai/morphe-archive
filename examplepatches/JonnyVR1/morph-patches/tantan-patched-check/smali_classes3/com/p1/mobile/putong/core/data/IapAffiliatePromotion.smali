.class public Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "iapaffiliatepromotion"


# instance fields
.field public discount:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public displayConfig:Ljava/util/Map;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;",
            ">;"
        }
    .end annotation
.end field

.field public endTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public ftDays:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public iapId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public offerId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public offerType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public productId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public productType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public promotionHitId:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public promotionName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public promotionType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public startTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;)Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;->clone()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionDisplaySlot;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->nullCheck()V

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

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->clone()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->discount:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->discount:Ljava/lang/String;

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->ftDays:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->ftDays:I

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerType:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerType:Ljava/lang/String;

    .line 45
    .line 46
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->startTime:J

    .line 47
    .line 48
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->startTime:J

    .line 49
    .line 50
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 51
    .line 52
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    new-instance v2, Ll/xam;

    .line 59
    .line 60
    invoke-direct {v2}, Ll/xam;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/Map;Ll/qcj;)Ljava/util/Map;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 68
    .line 69
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 70
    .line 71
    if-eqz p0, :cond_1

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;->clone()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 78
    .line 79
    :cond_1
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->clone()Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 24
    .line 25
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 26
    .line 27
    cmp-long v1, v3, v5

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->discount:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->discount:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->ftDays:I

    .line 52
    .line 53
    iget v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->ftDays:I

    .line 54
    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerType:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerType:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->startTime:J

    .line 108
    .line 109
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->startTime:J

    .line 110
    .line 111
    cmp-long v1, v3, v5

    .line 112
    .line 113
    if-nez v1, :cond_2

    .line 114
    .line 115
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 116
    .line 117
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 118
    .line 119
    cmp-long v1, v3, v5

    .line 120
    .line 121
    if-nez v1, :cond_2

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 126
    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 134
    .line 135
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 136
    .line 137
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-eqz p0, :cond_2

    .line 142
    .line 143
    return v0

    .line 144
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "iapaffiliatepromotion"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 7

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_a

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v1, v2

    .line 18
    :goto_0
    add-int/2addr v0, v1

    .line 19
    mul-int/lit8 v0, v0, 0x29

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionHitId:J

    .line 22
    .line 23
    const/16 v1, 0x20

    .line 24
    .line 25
    ushr-long v5, v3, v1

    .line 26
    .line 27
    xor-long/2addr v3, v5

    .line 28
    long-to-int v3, v3

    .line 29
    add-int/2addr v0, v3

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v3, :cond_1

    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move v3, v2

    .line 42
    :goto_1
    add-int/2addr v0, v3

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->discount:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v3, :cond_2

    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    goto :goto_2

    .line 54
    :cond_2
    move v3, v2

    .line 55
    :goto_2
    add-int/2addr v0, v3

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->ftDays:I

    .line 59
    .line 60
    add-int/2addr v0, v3

    .line 61
    mul-int/lit8 v0, v0, 0x29

    .line 62
    .line 63
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz v3, :cond_3

    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    goto :goto_3

    .line 72
    :cond_3
    move v3, v2

    .line 73
    :goto_3
    add-int/2addr v0, v3

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v3, :cond_4

    .line 79
    .line 80
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 81
    .line 82
    .line 83
    move-result v3

    .line 84
    goto :goto_4

    .line 85
    :cond_4
    move v3, v2

    .line 86
    :goto_4
    add-int/2addr v0, v3

    .line 87
    mul-int/lit8 v0, v0, 0x29

    .line 88
    .line 89
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v3, :cond_5

    .line 92
    .line 93
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    goto :goto_5

    .line 98
    :cond_5
    move v3, v2

    .line 99
    :goto_5
    add-int/2addr v0, v3

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerId:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v3, :cond_6

    .line 105
    .line 106
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 107
    .line 108
    .line 109
    move-result v3

    .line 110
    goto :goto_6

    .line 111
    :cond_6
    move v3, v2

    .line 112
    :goto_6
    add-int/2addr v0, v3

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->offerType:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v3, :cond_7

    .line 118
    .line 119
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 120
    .line 121
    .line 122
    move-result v3

    .line 123
    goto :goto_7

    .line 124
    :cond_7
    move v3, v2

    .line 125
    :goto_7
    add-int/2addr v0, v3

    .line 126
    mul-int/lit8 v0, v0, 0x29

    .line 127
    .line 128
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->startTime:J

    .line 129
    .line 130
    ushr-long v5, v3, v1

    .line 131
    .line 132
    xor-long/2addr v3, v5

    .line 133
    long-to-int v3, v3

    .line 134
    add-int/2addr v0, v3

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->endTime:J

    .line 138
    .line 139
    ushr-long v5, v3, v1

    .line 140
    .line 141
    xor-long/2addr v3, v5

    .line 142
    long-to-int v1, v3

    .line 143
    add-int/2addr v0, v1

    .line 144
    mul-int/lit8 v0, v0, 0x29

    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->displayConfig:Ljava/util/Map;

    .line 147
    .line 148
    if-eqz v1, :cond_8

    .line 149
    .line 150
    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    goto :goto_8

    .line 155
    :cond_8
    move v1, v2

    .line 156
    :goto_8
    add-int/2addr v0, v1

    .line 157
    mul-int/lit8 v0, v0, 0x29

    .line 158
    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->extraConfig:Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;

    .line 160
    .line 161
    if-eqz v1, :cond_9

    .line 162
    .line 163
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotionExtraConfig;->hashCode()I

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    :cond_9
    add-int/2addr v0, v2

    .line 168
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 169
    .line 170
    :cond_a
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionName:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->promotionType:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productType:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->productId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->iapId:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/IapAffiliatePromotion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
