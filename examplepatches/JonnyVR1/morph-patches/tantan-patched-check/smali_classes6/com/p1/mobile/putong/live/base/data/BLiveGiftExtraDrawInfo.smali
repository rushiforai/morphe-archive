.class public Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final DISMISS_DURATION:F = 400.0f

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final SINGLE_GIFT_DURATION:F = 200.0f

.field public static final STAY_DURATION:F = 500.0f

.field public static final TYPE:Ljava/lang/String; = "blivegiftextradrawinfo"


# instance fields
.field public coordinates:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePosition;",
            ">;"
        }
    .end annotation
.end field

.field public imgUrl:Ljava/lang/String;

.field public length:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public width:F
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLivePosition;)Lcom/p1/mobile/putong/live/base/data/BLivePosition;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static getFirstTemple()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    const-string v1, "{\n    \"coordinates\":[\n        {\n            \"x\":561,\n            \"y\":352\n        },\n        {\n            \"x\":459,\n            \"y\":299\n        },\n        {\n            \"x\":356,\n            \"y\":356\n        },\n        {\n            \"x\":278,\n            \"y\":455\n        },\n        {\n            \"x\":352,\n            \"y\":539\n        },\n        {\n            \"x\":444,\n            \"y\":620\n        },\n        {\n            \"x\":550,\n            \"y\":697\n        },\n        {\n            \"x\":658,\n            \"y\":620\n        },\n        {\n            \"x\":755,\n            \"y\":544\n        },\n        {\n            \"x\":820,\n            \"y\":458\n        },\n        {\n            \"x\":757,\n            \"y\":359\n        },\n        {\n            \"x\":661,\n            \"y\":299\n        }\n    ],\n    \"length\":984,\n    \"width\":1104\n}"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :catch_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method

.method public static getForthTemple()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    const-string v1, "{\n    \"coordinates\":[\n        {\n            \"x\":717,\n            \"y\":375\n        },\n        {\n            \"x\":648,\n            \"y\":293\n        },\n        {\n            \"x\":553,\n            \"y\":293\n        },\n        {\n            \"x\":459,\n            \"y\":293\n        },\n        {\n            \"x\":363,\n            \"y\":293\n        },\n        {\n            \"x\":288,\n            \"y\":375\n        },\n        {\n            \"x\":268,\n            \"y\":452\n        },\n        {\n            \"x\":320,\n            \"y\":537\n        },\n        {\n            \"x\":412,\n            \"y\":622\n        },\n        {\n            \"x\":508,\n            \"y\":705\n        },\n        {\n            \"x\":693,\n            \"y\":544\n        },\n        {\n            \"x\":599,\n            \"y\":626\n        },\n        {\n            \"x\":737,\n            \"y\":450\n        },\n        {\n            \"x\":645,\n            \"y\":450\n        },\n        {\n            \"x\":549,\n            \"y\":450\n        },\n        {\n            \"x\":462,\n            \"y\":450\n        },\n        {\n            \"x\":365,\n            \"y\":450\n        }\n    ],\n    \"length\":984,\n    \"width\":1008\n}"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :catch_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method

.method public static getSecondTemple()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    const-string v1, "{\n    \"coordinates\":[\n        {\n            \"x\":506,\n            \"y\":294\n        },\n        {\n            \"x\":428,\n            \"y\":363\n        },\n        {\n            \"x\":364,\n            \"y\":436\n        },\n        {\n            \"x\":261,\n            \"y\":378\n        },\n        {\n            \"x\":268,\n            \"y\":478\n        },\n        {\n            \"x\":286,\n            \"y\":572\n        },\n        {\n            \"x\":300,\n            \"y\":674\n        },\n        {\n            \"x\":396,\n            \"y\":674\n        },\n        {\n            \"x\":494,\n            \"y\":674\n        },\n        {\n            \"x\":592,\n            \"y\":674\n        },\n        {\n            \"x\":689,\n            \"y\":674\n        },\n        {\n            \"x\":715,\n            \"y\":574\n        },\n        {\n            \"x\":722,\n            \"y\":478\n        },\n        {\n            \"x\":733,\n            \"y\":380\n        },\n        {\n            \"x\":638,\n            \"y\":436\n        },\n        {\n            \"x\":580,\n            \"y\":363\n        }\n    ],\n    \"length\":984,\n    \"width\":1008\n}\n"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :catch_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method

.method public static getThirdTemple()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    .locals 2

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    const-string v1, "{\n    \"coordinates\":[\n        {\n            \"x\":279,\n            \"y\":447\n        },\n        {\n            \"x\":279,\n            \"y\":535\n        },\n        {\n            \"x\":279,\n            \"y\":625\n        },\n        {\n            \"x\":279,\n            \"y\":717\n        },\n        {\n            \"x\":380,\n            \"y\":717\n        },\n        {\n            \"x\":479,\n            \"y\":717\n        },\n        {\n            \"x\":577,\n            \"y\":717\n        },\n        {\n            \"x\":676,\n            \"y\":717\n        },\n        {\n            \"x\":703,\n            \"y\":629\n        },\n        {\n            \"x\":719,\n            \"y\":529\n        },\n        {\n            \"x\":731,\n            \"y\":434\n        },\n        {\n            \"x\":635,\n            \"y\":432\n        },\n        {\n            \"x\":543,\n            \"y\":375\n        },\n        {\n            \"x\":574,\n            \"y\":284\n        },\n        {\n            \"x\":469,\n            \"y\":276\n        },\n        {\n            \"x\":414,\n            \"y\":357\n        },\n        {\n            \"x\":380,\n            \"y\":447\n        },\n        {\n            \"x\":380,\n            \"y\":535\n        },\n        {\n            \"x\":380,\n            \"y\":625\n        }\n    ],\n    \"length\":984,\n    \"width\":1008\n}"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    return-object v0

    .line 12
    :catch_0
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    return-object v0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public clear()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/n02;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/n02;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 22
    .line 23
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 24
    .line 25
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 26
    .line 27
    iput p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 28
    .line 29
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 26
    .line 27
    cmpl-float v1, v1, v3

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 32
    .line 33
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 34
    .line 35
    cmpl-float p0, p0, p1

    .line 36
    .line 37
    if-nez p0, :cond_2

    .line 38
    .line 39
    return v0

    .line 40
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivegiftextradrawinfo"

    .line 2
    .line 3
    return-object p0
.end method

.method public getGiftNum()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItem(I)Lcom/p1/mobile/putong/live/base/data/BLivePosition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 8
    .line 9
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    :goto_0
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x29

    .line 19
    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->length:F

    .line 21
    .line 22
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x29

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->width:F

    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v0, v1

    .line 36
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 37
    .line 38
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->coordinates:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
