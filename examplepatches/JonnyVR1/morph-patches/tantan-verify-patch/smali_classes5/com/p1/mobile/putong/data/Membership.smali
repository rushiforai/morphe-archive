.class public Lcom/p1/mobile/putong/data/Membership;
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
            "Lcom/p1/mobile/putong/data/Membership;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Membership;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "membership"


# instance fields
.field public active:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public duration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public expiresTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public hideActivityTime:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public hideVIP:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public name:Lcom/p1/mobile/putong/data/MembershipType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;
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
    new-instance v0, Lcom/p1/mobile/putong/data/Membership$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Membership$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/Membership$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Membership$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/Membership;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/Membership;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Membership;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Membership;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Membership;->nullCheck()V

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

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Membership;->clone()Lcom/p1/mobile/putong/data/Membership;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Membership;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Membership;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Membership;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Membership;->active:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Membership;->active:Z

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/Membership;->duration:J

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/Membership;->duration:J

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 29
    .line 30
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 31
    .line 32
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 33
    .line 34
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Membership;->clone()Lcom/p1/mobile/putong/data/Membership;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Membership;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Membership;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Membership;->active:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Membership;->active:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 32
    .line 33
    cmpl-double v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/Membership;->duration:J

    .line 38
    .line 39
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/Membership;->duration:J

    .line 40
    .line 41
    cmp-long v1, v3, v5

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 56
    .line 57
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 62
    .line 63
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 64
    .line 65
    if-ne p0, p1, :cond_2

    .line 66
    .line 67
    return v0

    .line 68
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "membership"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 9

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Membership;->active:Z

    .line 22
    .line 23
    const/16 v3, 0x4d5

    .line 24
    .line 25
    const/16 v4, 0x4cf

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    move v1, v4

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v1, v3

    .line 32
    :goto_1
    add-int/2addr v0, v1

    .line 33
    iget-wide v5, p0, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 34
    .line 35
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 36
    .line 37
    .line 38
    move-result-wide v5

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    const/16 v1, 0x20

    .line 42
    .line 43
    ushr-long v7, v5, v1

    .line 44
    .line 45
    xor-long/2addr v5, v7

    .line 46
    long-to-int v5, v5

    .line 47
    add-int/2addr v0, v5

    .line 48
    mul-int/lit8 v0, v0, 0x29

    .line 49
    .line 50
    iget-wide v5, p0, Lcom/p1/mobile/putong/data/Membership;->duration:J

    .line 51
    .line 52
    ushr-long v7, v5, v1

    .line 53
    .line 54
    xor-long/2addr v5, v7

    .line 55
    long-to-int v1, v5

    .line 56
    add-int/2addr v0, v1

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    :cond_2
    add-int/2addr v0, v2

    .line 68
    mul-int/lit8 v0, v0, 0x29

    .line 69
    .line 70
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 71
    .line 72
    if-eqz v1, :cond_3

    .line 73
    .line 74
    move v1, v4

    .line 75
    goto :goto_2

    .line 76
    :cond_3
    move v1, v3

    .line 77
    :goto_2
    add-int/2addr v0, v1

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    move v3, v4

    .line 85
    :cond_4
    add-int/2addr v0, v3

    .line 86
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 87
    .line 88
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/data/MembershipType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/data/VIPBadgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Membership;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
