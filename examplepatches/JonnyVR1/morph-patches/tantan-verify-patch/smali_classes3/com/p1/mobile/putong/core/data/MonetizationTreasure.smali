.class public Lcom/p1/mobile/putong/core/data/MonetizationTreasure;
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
            "Lcom/p1/mobile/putong/core/data/MonetizationTreasure;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MonetizationTreasure;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "monetizationtreasure"


# instance fields
.field public bags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Bags;",
            ">;"
        }
    .end annotation
.end field

.field public coinAmount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public coinConsumeAmount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public coinRemaining:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public expiringCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public freeTimes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public gemConsumeAmount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public gemRemaining:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public treasurePrizeAds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;",
            ">;"
        }
    .end annotation
.end field

.field public treasurePrizeInfos:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;)Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;->clone()Lcom/p1/mobile/putong/core/data/TreasurePrizeInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/Bags;)Lcom/p1/mobile/putong/core/data/Bags;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Bags;->clone()Lcom/p1/mobile/putong/core/data/Bags;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;)Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;->clone()Lcom/p1/mobile/putong/core/data/TreasurePrizeAd;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/MonetizationTreasure;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->clone()Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MonetizationTreasure;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 31
    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    new-instance v2, Ll/z510;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/z510;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 48
    .line 49
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    new-instance v2, Ll/a610;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/a610;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 63
    .line 64
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 65
    .line 66
    if-eqz p0, :cond_2

    .line 67
    .line 68
    new-instance v1, Ll/b610;

    .line 69
    .line 70
    invoke-direct {v1}, Ll/b610;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 78
    .line 79
    :cond_2
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->clone()Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 38
    .line 39
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 44
    .line 45
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 50
    .line 51
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 52
    .line 53
    if-ne v1, v3, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 78
    .line 79
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_2

    .line 84
    .line 85
    return v0

    .line 86
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "monetizationtreasure"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->freeTimes:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemRemaining:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->gemConsumeAmount:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinConsumeAmount:I

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->expiringCount:I

    .line 28
    .line 29
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinRemaining:I

    .line 33
    .line 34
    add-int/2addr v0, v1

    .line 35
    mul-int/lit8 v0, v0, 0x29

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->coinAmount:I

    .line 38
    .line 39
    add-int/2addr v0, v1

    .line 40
    mul-int/lit8 v0, v0, 0x29

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    goto :goto_0

    .line 52
    :cond_0
    move v1, v2

    .line 53
    :goto_0
    add-int/2addr v0, v1

    .line 54
    mul-int/lit8 v0, v0, 0x29

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    goto :goto_1

    .line 65
    :cond_1
    move v1, v2

    .line 66
    :goto_1
    add-int/2addr v0, v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 70
    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 74
    .line 75
    .line 76
    move-result v2

    .line 77
    :cond_2
    add-int/2addr v0, v2

    .line 78
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 79
    .line 80
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeInfos:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->treasurePrizeAds:Ljava/util/List;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->bags:Ljava/util/List;

    .line 33
    .line 34
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MonetizationTreasure;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
