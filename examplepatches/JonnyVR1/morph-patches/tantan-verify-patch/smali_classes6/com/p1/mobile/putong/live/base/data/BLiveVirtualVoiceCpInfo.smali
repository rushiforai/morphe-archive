.class public Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevirtualvoicecpinfo"


# instance fields
.field public currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;
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

.field public luxuryValue:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public meUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public otherUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->nullCheck()V

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

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->luxuryValue:D

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->luxuryValue:D

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->meUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->meUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 43
    .line 44
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

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->id:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->luxuryValue:D

    .line 24
    .line 25
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->luxuryValue:D

    .line 26
    .line 27
    cmpl-double v1, v3, v5

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->meUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->meUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 54
    .line 55
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-eqz p0, :cond_2

    .line 60
    .line 61
    return v0

    .line 62
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevirtualvoicecpinfo"

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
    if-nez v0, :cond_4

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->id:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->luxuryValue:D

    .line 20
    .line 21
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    const/16 v1, 0x20

    .line 28
    .line 29
    ushr-long v5, v3, v1

    .line 30
    .line 31
    xor-long/2addr v3, v5

    .line 32
    long-to-int v1, v3

    .line 33
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->hashCode()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    goto :goto_1

    .line 45
    :cond_1
    move v1, v2

    .line 46
    :goto_1
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->meUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    move v1, v2

    .line 59
    :goto_2
    add-int/2addr v0, v1

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    :cond_3
    add-int/2addr v0, v2

    .line 71
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 72
    .line 73
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->currentHouse:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpHouseInfo;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->meUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->meUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->otherUser:Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpUserInfo;

    .line 38
    .line 39
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVirtualVoiceCpInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
