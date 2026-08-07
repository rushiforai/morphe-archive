.class public Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;
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
            "Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "diamondvipprivilegesettings"


# instance fields
.field public boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public expiredTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public mysterySwipe:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public showQualityIdentity:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public trialExpiredTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->nullCheck()V

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

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->clone()Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->expiredTime:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->expiredTime:J

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->trialExpiredTime:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->trialExpiredTime:J

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->mysterySwipe:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->mysterySwipe:Z

    .line 21
    .line 22
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->showQualityIdentity:Z

    .line 23
    .line 24
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->showQualityIdentity:Z

    .line 25
    .line 26
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->clone()Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->expiredTime:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->expiredTime:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->trialExpiredTime:J

    .line 22
    .line 23
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->trialExpiredTime:J

    .line 24
    .line 25
    cmp-long v1, v3, v5

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->mysterySwipe:Z

    .line 40
    .line 41
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->mysterySwipe:Z

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->showQualityIdentity:Z

    .line 46
    .line 47
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->showQualityIdentity:Z

    .line 48
    .line 49
    if-ne p0, p1, :cond_2

    .line 50
    .line 51
    return v0

    .line 52
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "diamondvipprivilegesettings"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 6

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
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->expiredTime:J

    .line 8
    .line 9
    const/16 v3, 0x20

    .line 10
    .line 11
    ushr-long v4, v1, v3

    .line 12
    .line 13
    xor-long/2addr v1, v4

    .line 14
    long-to-int v1, v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x29

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->trialExpiredTime:J

    .line 19
    .line 20
    ushr-long v3, v1, v3

    .line 21
    .line 22
    xor-long/2addr v1, v3

    .line 23
    long-to-int v1, v1

    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 28
    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const/4 v1, 0x0

    .line 37
    :goto_0
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->mysterySwipe:Z

    .line 41
    .line 42
    const/16 v2, 0x4d5

    .line 43
    .line 44
    const/16 v3, 0x4cf

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    move v1, v3

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move v1, v2

    .line 51
    :goto_1
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->showQualityIdentity:Z

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    move v2, v3

    .line 59
    :cond_2
    add-int/2addr v0, v2

    .line 60
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 61
    .line 62
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->boostMode:Lcom/p1/mobile/putong/data/DiamondVIPBoostType;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
