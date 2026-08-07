.class public Lcom/p1/mobile/putong/core/data/CreativeData;
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
            "Lcom/p1/mobile/putong/core/data/CreativeData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CreativeData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "creativedata"


# instance fields
.field public autoRenewable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public backgroundPicture:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public buttonText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public buttonTexts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public clause:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public currency:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public currencyCode:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public discountPrice:Ljava/lang/Double;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public displayPrice:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public endTime:Ljava/lang/Long;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public iconPicture:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public itemID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public normalPrice:Ljava/lang/Double;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public payPlatform:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PaymentPlatform;",
            ">;"
        }
    .end annotation
.end field

.field public popUpWindow:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public positionPicture:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public productType:Lcom/p1/mobile/putong/core/data/ProductCategory;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public promotionName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public skuID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public startTime:Ljava/lang/Long;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public terms:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public textContent:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public textTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CreativeData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CreativeData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CreativeData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CreativeData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CreativeData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CreativeData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/PaymentPlatform;)Lcom/p1/mobile/putong/core/data/PaymentPlatform;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/CreativeData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CreativeData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CreativeData;->nullCheck()V

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

    .line 177
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CreativeData;->clone()Lcom/p1/mobile/putong/core/data/CreativeData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CreativeData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CreativeData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    new-instance v2, Ll/dvb;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/dvb;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 36
    .line 37
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 46
    .line 47
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 50
    .line 51
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 62
    .line 63
    if-eqz v1, :cond_1

    .line 64
    .line 65
    new-instance v2, Ll/evb;

    .line 66
    .line 67
    invoke-direct {v2}, Ll/evb;-><init>()V

    .line 68
    .line 69
    .line 70
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 75
    .line 76
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 81
    .line 82
    if-eqz v1, :cond_2

    .line 83
    .line 84
    new-instance v2, Ll/fvb;

    .line 85
    .line 86
    invoke-direct {v2}, Ll/fvb;-><init>()V

    .line 87
    .line 88
    .line 89
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 94
    .line 95
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 96
    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 100
    .line 101
    if-eqz v1, :cond_3

    .line 102
    .line 103
    new-instance v2, Ll/gvb;

    .line 104
    .line 105
    invoke-direct {v2}, Ll/gvb;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 113
    .line 114
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 115
    .line 116
    if-eqz v1, :cond_4

    .line 117
    .line 118
    new-instance v2, Ll/hvb;

    .line 119
    .line 120
    invoke-direct {v2}, Ll/hvb;-><init>()V

    .line 121
    .line 122
    .line 123
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 128
    .line 129
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 130
    .line 131
    if-eqz v1, :cond_5

    .line 132
    .line 133
    new-instance v2, Ll/ivb;

    .line 134
    .line 135
    invoke-direct {v2}, Ll/ivb;-><init>()V

    .line 136
    .line 137
    .line 138
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 143
    .line 144
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 145
    .line 146
    if-eqz v1, :cond_6

    .line 147
    .line 148
    new-instance v2, Ll/jvb;

    .line 149
    .line 150
    invoke-direct {v2}, Ll/jvb;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 158
    .line 159
    :cond_6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 160
    .line 161
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 164
    .line 165
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 168
    .line 169
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 170
    .line 171
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 172
    .line 173
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 174
    .line 175
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 176
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CreativeData;->clone()Lcom/p1/mobile/putong/core/data/CreativeData;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CreativeData;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 26
    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_2

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 84
    .line 85
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 86
    .line 87
    if-ne v1, v3, :cond_2

    .line 88
    .line 89
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 90
    .line 91
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 92
    .line 93
    if-ne v1, v3, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 116
    .line 117
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 118
    .line 119
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 138
    .line 139
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_2

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 156
    .line 157
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 158
    .line 159
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-eqz v1, :cond_2

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 166
    .line 167
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 168
    .line 169
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_2

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 176
    .line 177
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 178
    .line 179
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_2

    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 186
    .line 187
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 188
    .line 189
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-eqz v1, :cond_2

    .line 194
    .line 195
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 196
    .line 197
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 198
    .line 199
    if-ne v1, v3, :cond_2

    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 202
    .line 203
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 204
    .line 205
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-eqz v1, :cond_2

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 212
    .line 213
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 214
    .line 215
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-eqz v1, :cond_2

    .line 220
    .line 221
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 222
    .line 223
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 224
    .line 225
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    if-eqz p0, :cond_2

    .line 230
    .line 231
    return v0

    .line 232
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "creativedata"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_17

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Long;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Long;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    goto :goto_1

    .line 30
    :cond_1
    move v1, v2

    .line 31
    :goto_1
    add-int/2addr v0, v1

    .line 32
    mul-int/lit8 v0, v0, 0x29

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/Double;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/Double;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_6

    .line 95
    :cond_6
    move v1, v2

    .line 96
    :goto_6
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 100
    .line 101
    const/16 v3, 0x4d5

    .line 102
    .line 103
    const/16 v4, 0x4cf

    .line 104
    .line 105
    if-eqz v1, :cond_7

    .line 106
    .line 107
    move v1, v4

    .line 108
    goto :goto_7

    .line 109
    :cond_7
    move v1, v3

    .line 110
    :goto_7
    add-int/2addr v0, v1

    .line 111
    mul-int/lit8 v0, v0, 0x29

    .line 112
    .line 113
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 114
    .line 115
    if-eqz v1, :cond_8

    .line 116
    .line 117
    move v1, v4

    .line 118
    goto :goto_8

    .line 119
    :cond_8
    move v1, v3

    .line 120
    :goto_8
    add-int/2addr v0, v1

    .line 121
    mul-int/lit8 v0, v0, 0x29

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz v1, :cond_9

    .line 126
    .line 127
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    goto :goto_9

    .line 132
    :cond_9
    move v1, v2

    .line 133
    :goto_9
    add-int/2addr v0, v1

    .line 134
    mul-int/lit8 v0, v0, 0x29

    .line 135
    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 137
    .line 138
    if-eqz v1, :cond_a

    .line 139
    .line 140
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    goto :goto_a

    .line 145
    :cond_a
    move v1, v2

    .line 146
    :goto_a
    add-int/2addr v0, v1

    .line 147
    mul-int/lit8 v0, v0, 0x29

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 150
    .line 151
    if-eqz v1, :cond_b

    .line 152
    .line 153
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    goto :goto_b

    .line 158
    :cond_b
    move v1, v2

    .line 159
    :goto_b
    add-int/2addr v0, v1

    .line 160
    mul-int/lit8 v0, v0, 0x29

    .line 161
    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz v1, :cond_c

    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    goto :goto_c

    .line 171
    :cond_c
    move v1, v2

    .line 172
    :goto_c
    add-int/2addr v0, v1

    .line 173
    mul-int/lit8 v0, v0, 0x29

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 176
    .line 177
    if-eqz v1, :cond_d

    .line 178
    .line 179
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    goto :goto_d

    .line 184
    :cond_d
    move v1, v2

    .line 185
    :goto_d
    add-int/2addr v0, v1

    .line 186
    mul-int/lit8 v0, v0, 0x29

    .line 187
    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 189
    .line 190
    if-eqz v1, :cond_e

    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    goto :goto_e

    .line 197
    :cond_e
    move v1, v2

    .line 198
    :goto_e
    add-int/2addr v0, v1

    .line 199
    mul-int/lit8 v0, v0, 0x29

    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 202
    .line 203
    if-eqz v1, :cond_f

    .line 204
    .line 205
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    goto :goto_f

    .line 210
    :cond_f
    move v1, v2

    .line 211
    :goto_f
    add-int/2addr v0, v1

    .line 212
    mul-int/lit8 v0, v0, 0x29

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 215
    .line 216
    if-eqz v1, :cond_10

    .line 217
    .line 218
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    goto :goto_10

    .line 223
    :cond_10
    move v1, v2

    .line 224
    :goto_10
    add-int/2addr v0, v1

    .line 225
    mul-int/lit8 v0, v0, 0x29

    .line 226
    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 228
    .line 229
    if-eqz v1, :cond_11

    .line 230
    .line 231
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    goto :goto_11

    .line 236
    :cond_11
    move v1, v2

    .line 237
    :goto_11
    add-int/2addr v0, v1

    .line 238
    mul-int/lit8 v0, v0, 0x29

    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 241
    .line 242
    if-eqz v1, :cond_12

    .line 243
    .line 244
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    goto :goto_12

    .line 249
    :cond_12
    move v1, v2

    .line 250
    :goto_12
    add-int/2addr v0, v1

    .line 251
    mul-int/lit8 v0, v0, 0x29

    .line 252
    .line 253
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 254
    .line 255
    if-eqz v1, :cond_13

    .line 256
    .line 257
    move v3, v4

    .line 258
    :cond_13
    add-int/2addr v0, v3

    .line 259
    mul-int/lit8 v0, v0, 0x29

    .line 260
    .line 261
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 262
    .line 263
    if-eqz v1, :cond_14

    .line 264
    .line 265
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    goto :goto_13

    .line 270
    :cond_14
    move v1, v2

    .line 271
    :goto_13
    add-int/2addr v0, v1

    .line 272
    mul-int/lit8 v0, v0, 0x29

    .line 273
    .line 274
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 275
    .line 276
    if-eqz v1, :cond_15

    .line 277
    .line 278
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    goto :goto_14

    .line 283
    :cond_15
    move v1, v2

    .line 284
    :goto_14
    add-int/2addr v0, v1

    .line 285
    mul-int/lit8 v0, v0, 0x29

    .line 286
    .line 287
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 288
    .line 289
    if-eqz v1, :cond_16

    .line 290
    .line 291
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 292
    .line 293
    .line 294
    move-result v2

    .line 295
    :cond_16
    add-int/2addr v0, v2

    .line 296
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 297
    .line 298
    :cond_17
    return v0
.end method

.method public nullCheck()V
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 18
    .line 19
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 20
    .line 21
    if-nez v2, :cond_1

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 24
    .line 25
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 38
    .line 39
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, ""

    .line 42
    .line 43
    if-nez v1, :cond_3

    .line 44
    .line 45
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 46
    .line 47
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 48
    .line 49
    if-nez v1, :cond_4

    .line 50
    .line 51
    new-instance v1, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 57
    .line 58
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 59
    .line 60
    if-nez v1, :cond_5

    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 63
    .line 64
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 65
    .line 66
    if-nez v1, :cond_6

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 69
    .line 70
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 71
    .line 72
    if-nez v0, :cond_7

    .line 73
    .line 74
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 75
    .line 76
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 77
    .line 78
    if-nez v0, :cond_8

    .line 79
    .line 80
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 81
    .line 82
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 83
    .line 84
    if-nez v0, :cond_9

    .line 85
    .line 86
    new-instance v0, Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 92
    .line 93
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 94
    .line 95
    if-nez v0, :cond_a

    .line 96
    .line 97
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 98
    .line 99
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 100
    .line 101
    if-nez v0, :cond_b

    .line 102
    .line 103
    new-instance v0, Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 109
    .line 110
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 111
    .line 112
    if-nez v0, :cond_c

    .line 113
    .line 114
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 115
    .line 116
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 117
    .line 118
    if-nez v0, :cond_d

    .line 119
    .line 120
    new-instance v0, Ljava/util/ArrayList;

    .line 121
    .line 122
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 123
    .line 124
    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 126
    .line 127
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 128
    .line 129
    if-nez v0, :cond_e

    .line 130
    .line 131
    new-instance v0, Ljava/util/ArrayList;

    .line 132
    .line 133
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 134
    .line 135
    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 137
    .line 138
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 139
    .line 140
    if-nez v0, :cond_f

    .line 141
    .line 142
    new-instance v0, Ljava/util/ArrayList;

    .line 143
    .line 144
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 145
    .line 146
    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 148
    .line 149
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 150
    .line 151
    if-nez v0, :cond_10

    .line 152
    .line 153
    new-instance v0, Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .line 157
    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 159
    .line 160
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 161
    .line 162
    if-nez v0, :cond_11

    .line 163
    .line 164
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 165
    .line 166
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 167
    .line 168
    if-nez v0, :cond_12

    .line 169
    .line 170
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 171
    .line 172
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 173
    .line 174
    if-nez v0, :cond_13

    .line 175
    .line 176
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 177
    .line 178
    :cond_13
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CreativeData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
