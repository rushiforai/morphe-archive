.class public Lcom/p1/mobile/putong/core/data/RecentContractInfo;
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
            "Lcom/p1/mobile/putong/core/data/RecentContractInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/RecentContractInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "recentcontractinfo"


# instance fields
.field public autoRenew:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public cancelTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public chargeInterval:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public contractId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public contractStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public createTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public endTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public intervalDays:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public isUpgraded:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public membershipType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public platform:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public productType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public startTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RecentContractInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RecentContractInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/RecentContractInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RecentContractInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->nullCheck()V

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

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->clone()Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/RecentContractInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/RecentContractInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->startTime:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->startTime:J

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->endTime:J

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->endTime:J

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->cancelTime:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->cancelTime:J

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->autoRenew:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->autoRenew:Z

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 49
    .line 50
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->intervalDays:J

    .line 51
    .line 52
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->intervalDays:J

    .line 53
    .line 54
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->createTime:J

    .line 55
    .line 56
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->createTime:J

    .line 57
    .line 58
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->clone()Lcom/p1/mobile/putong/core/data/RecentContractInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->startTime:J

    .line 64
    .line 65
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->startTime:J

    .line 66
    .line 67
    cmp-long v1, v3, v5

    .line 68
    .line 69
    if-nez v1, :cond_2

    .line 70
    .line 71
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->endTime:J

    .line 72
    .line 73
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->endTime:J

    .line 74
    .line 75
    cmp-long v1, v3, v5

    .line 76
    .line 77
    if-nez v1, :cond_2

    .line 78
    .line 79
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->cancelTime:J

    .line 80
    .line 81
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->cancelTime:J

    .line 82
    .line 83
    cmp-long v1, v3, v5

    .line 84
    .line 85
    if-nez v1, :cond_2

    .line 86
    .line 87
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->autoRenew:Z

    .line 88
    .line 89
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->autoRenew:Z

    .line 90
    .line 91
    if-ne v1, v3, :cond_2

    .line 92
    .line 93
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

    .line 94
    .line 95
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

    .line 96
    .line 97
    if-ne v1, v3, :cond_2

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_2

    .line 108
    .line 109
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->intervalDays:J

    .line 110
    .line 111
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->intervalDays:J

    .line 112
    .line 113
    cmp-long v1, v3, v5

    .line 114
    .line 115
    if-nez v1, :cond_2

    .line 116
    .line 117
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->createTime:J

    .line 118
    .line 119
    iget-wide p0, p1, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->createTime:J

    .line 120
    .line 121
    cmp-long p0, v3, p0

    .line 122
    .line 123
    if-nez p0, :cond_2

    .line 124
    .line 125
    return v0

    .line 126
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "recentcontractinfo"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

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
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->startTime:J

    .line 74
    .line 75
    const/16 v1, 0x20

    .line 76
    .line 77
    ushr-long v5, v3, v1

    .line 78
    .line 79
    xor-long/2addr v3, v5

    .line 80
    long-to-int v3, v3

    .line 81
    add-int/2addr v0, v3

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->endTime:J

    .line 85
    .line 86
    ushr-long v5, v3, v1

    .line 87
    .line 88
    xor-long/2addr v3, v5

    .line 89
    long-to-int v3, v3

    .line 90
    add-int/2addr v0, v3

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->cancelTime:J

    .line 94
    .line 95
    ushr-long v5, v3, v1

    .line 96
    .line 97
    xor-long/2addr v3, v5

    .line 98
    long-to-int v3, v3

    .line 99
    add-int/2addr v0, v3

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->autoRenew:Z

    .line 103
    .line 104
    const/16 v4, 0x4d5

    .line 105
    .line 106
    const/16 v5, 0x4cf

    .line 107
    .line 108
    if-eqz v3, :cond_5

    .line 109
    .line 110
    move v3, v5

    .line 111
    goto :goto_5

    .line 112
    :cond_5
    move v3, v4

    .line 113
    :goto_5
    add-int/2addr v0, v3

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->isUpgraded:Z

    .line 117
    .line 118
    if-eqz v3, :cond_6

    .line 119
    .line 120
    move v4, v5

    .line 121
    :cond_6
    add-int/2addr v0, v4

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 125
    .line 126
    if-eqz v3, :cond_7

    .line 127
    .line 128
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    :cond_7
    add-int/2addr v0, v2

    .line 133
    mul-int/lit8 v0, v0, 0x29

    .line 134
    .line 135
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->intervalDays:J

    .line 136
    .line 137
    ushr-long v4, v2, v1

    .line 138
    .line 139
    xor-long/2addr v2, v4

    .line 140
    long-to-int v2, v2

    .line 141
    add-int/2addr v0, v2

    .line 142
    mul-int/lit8 v0, v0, 0x29

    .line 143
    .line 144
    iget-wide v2, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->createTime:J

    .line 145
    .line 146
    ushr-long v4, v2, v1

    .line 147
    .line 148
    xor-long v1, v2, v4

    .line 149
    .line 150
    long-to-int v1, v1

    .line 151
    add-int/2addr v0, v1

    .line 152
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 153
    .line 154
    :cond_8
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->productType:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->membershipType:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->platform:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->contractStatus:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->chargeInterval:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/RecentContractInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
