.class public Lcom/p1/mobile/putong/data/Contract;
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
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Contract;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "contract"


# instance fields
.field public contractStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public itemId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public itemName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public nextDeductTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public nextDuductMoney:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public platform:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public productType:Lcom/p1/mobile/putong/data/ContractProductType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public promotions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Promotions;",
            ">;"
        }
    .end annotation
.end field

.field public signTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public signVersion:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Contract$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Contract$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Contract;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/Contract$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Contract$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/Contract;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/Promotions;)Lcom/p1/mobile/putong/data/Promotions;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Promotions;->clone()Lcom/p1/mobile/putong/data/Promotions;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/Contract;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Contract;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Contract;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Contract;->nullCheck()V

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

    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Contract;->clone()Lcom/p1/mobile/putong/data/Contract;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Contract;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Contract;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Contract;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Contract;->signTime:D

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Contract;->signTime:D

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/data/Contract;->signVersion:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/data/Contract;->signVersion:I

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Contract;->nextDeductTime:D

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Contract;->nextDeductTime:D

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 47
    .line 48
    if-eqz p0, :cond_0

    .line 49
    .line 50
    new-instance v1, Ll/w26;

    .line 51
    .line 52
    invoke-direct {v1}, Ll/w26;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 60
    .line 61
    :cond_0
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Contract;->clone()Lcom/p1/mobile/putong/data/Contract;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Contract;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Contract;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Contract;->signTime:D

    .line 64
    .line 65
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Contract;->signTime:D

    .line 66
    .line 67
    cmpl-double v1, v3, v5

    .line 68
    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget v1, p0, Lcom/p1/mobile/putong/data/Contract;->signVersion:I

    .line 82
    .line 83
    iget v3, p1, Lcom/p1/mobile/putong/data/Contract;->signVersion:I

    .line 84
    .line 85
    if-ne v1, v3, :cond_2

    .line 86
    .line 87
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Contract;->nextDeductTime:D

    .line 88
    .line 89
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Contract;->nextDeductTime:D

    .line 90
    .line 91
    cmpl-double v1, v3, v5

    .line 92
    .line 93
    if-nez v1, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 108
    .line 109
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    if-eqz p0, :cond_2

    .line 114
    .line 115
    return v0

    .line 116
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "contract"

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
    if-nez v0, :cond_8

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Contract;->signTime:D

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
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 89
    .line 90
    if-eqz v3, :cond_5

    .line 91
    .line 92
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    goto :goto_5

    .line 97
    :cond_5
    move v3, v2

    .line 98
    :goto_5
    add-int/2addr v0, v3

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget v3, p0, Lcom/p1/mobile/putong/data/Contract;->signVersion:I

    .line 102
    .line 103
    add-int/2addr v0, v3

    .line 104
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Contract;->nextDeductTime:D

    .line 105
    .line 106
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 107
    .line 108
    .line 109
    move-result-wide v3

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    ushr-long v5, v3, v1

    .line 113
    .line 114
    xor-long/2addr v3, v5

    .line 115
    long-to-int v1, v3

    .line 116
    add-int/2addr v0, v1

    .line 117
    mul-int/lit8 v0, v0, 0x29

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 120
    .line 121
    if-eqz v1, :cond_6

    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    goto :goto_6

    .line 128
    :cond_6
    move v1, v2

    .line 129
    :goto_6
    add-int/2addr v0, v1

    .line 130
    mul-int/lit8 v0, v0, 0x29

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 133
    .line 134
    if-eqz v1, :cond_7

    .line 135
    .line 136
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    :cond_7
    add-int/2addr v0, v2

    .line 141
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 142
    .line 143
    :cond_8
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/data/ContractProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Lcom/p1/mobile/putong/data/ContractProductType;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 46
    .line 47
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 48
    .line 49
    if-nez v0, :cond_6

    .line 50
    .line 51
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 52
    .line 53
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 54
    .line 55
    if-nez v0, :cond_7

    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 63
    .line 64
    :cond_7
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Contract;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
