.class public Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;
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
            "Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "userprivilegecontent"


# instance fields
.field public beginTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public expiredTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public inExperience:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public refreshMaxRemaining:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public remaining:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public unlimit:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->nullCheck()V

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

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->clone()Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->inExperience:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->inExperience:Z

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->unlimit:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->unlimit:Z

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->beginTime:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->beginTime:J

    .line 25
    .line 26
    iget p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->refreshMaxRemaining:I

    .line 27
    .line 28
    iput p0, v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->refreshMaxRemaining:I

    .line 29
    .line 30
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->clone()Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->inExperience:Z

    .line 22
    .line 23
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->inExperience:Z

    .line 24
    .line 25
    if-ne v1, v3, :cond_2

    .line 26
    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 28
    .line 29
    iget v3, p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 30
    .line 31
    if-ne v1, v3, :cond_2

    .line 32
    .line 33
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->unlimit:Z

    .line 34
    .line 35
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->unlimit:Z

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->beginTime:J

    .line 40
    .line 41
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->beginTime:J

    .line 42
    .line 43
    cmp-long v1, v3, v5

    .line 44
    .line 45
    if-nez v1, :cond_2

    .line 46
    .line 47
    iget p0, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->refreshMaxRemaining:I

    .line 48
    .line 49
    iget p1, p1, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->refreshMaxRemaining:I

    .line 50
    .line 51
    if-ne p0, p1, :cond_2

    .line 52
    .line 53
    return v0

    .line 54
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "userprivilegecontent"

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
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->expiredTime:J

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->inExperience:Z

    .line 19
    .line 20
    const/16 v2, 0x4d5

    .line 21
    .line 22
    const/16 v4, 0x4cf

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    move v1, v4

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v1, v2

    .line 29
    :goto_0
    add-int/2addr v0, v1

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->remaining:I

    .line 33
    .line 34
    add-int/2addr v0, v1

    .line 35
    mul-int/lit8 v0, v0, 0x29

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->unlimit:Z

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    move v2, v4

    .line 42
    :cond_1
    add-int/2addr v0, v2

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->beginTime:J

    .line 46
    .line 47
    ushr-long v3, v1, v3

    .line 48
    .line 49
    xor-long/2addr v1, v3

    .line 50
    long-to-int v1, v1

    .line 51
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->refreshMaxRemaining:I

    .line 55
    .line 56
    add-int/2addr v0, v1

    .line 57
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 58
    .line 59
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserPrivilegeContent;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
