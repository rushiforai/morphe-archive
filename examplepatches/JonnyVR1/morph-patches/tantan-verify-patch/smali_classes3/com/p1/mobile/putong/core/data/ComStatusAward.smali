.class public Lcom/p1/mobile/putong/core/data/ComStatusAward;
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
            "Lcom/p1/mobile/putong/core/data/ComStatusAward;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ComStatusAward;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "comstatusaward"


# instance fields
.field public awards:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/AwardType;",
            ">;"
        }
    .end annotation
.end field

.field public businessName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public hide:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/core/data/AwardStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public updateTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ComStatusAward$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ComStatusAward$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ComStatusAward$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ComStatusAward$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/AwardType;)Lcom/p1/mobile/putong/core/data/AwardType;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AwardType;->clone()Lcom/p1/mobile/putong/core/data/AwardType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/ComStatusAward;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ComStatusAward;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nullCheck()V

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

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ComStatusAward;->clone()Lcom/p1/mobile/putong/core/data/ComStatusAward;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ComStatusAward;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ComStatusAward;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    new-instance v2, Ll/kf5;

    .line 19
    .line 20
    invoke-direct {v2}, Ll/kf5;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 28
    .line 29
    :cond_0
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->updateTime:J

    .line 30
    .line 31
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->updateTime:J

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/NextStatus;->clone()Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 42
    .line 43
    :cond_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->hide:Z

    .line 44
    .line 45
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->hide:Z

    .line 46
    .line 47
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 48
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ComStatusAward;->clone()Lcom/p1/mobile/putong/core/data/ComStatusAward;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->updateTime:J

    .line 44
    .line 45
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->updateTime:J

    .line 46
    .line 47
    cmp-long v1, v3, v5

    .line 48
    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 54
    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->hide:Z

    .line 62
    .line 63
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/ComStatusAward;->hide:Z

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
    const-string p0, "comstatusaward"

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
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->updateTime:J

    .line 48
    .line 49
    const/16 v1, 0x20

    .line 50
    .line 51
    ushr-long v5, v3, v1

    .line 52
    .line 53
    xor-long/2addr v3, v5

    .line 54
    long-to-int v1, v3

    .line 55
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/NextStatus;->hashCode()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    :cond_3
    add-int/2addr v0, v2

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->hide:Z

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    const/16 v1, 0x4cf

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_4
    const/16 v1, 0x4d5

    .line 77
    .line 78
    :goto_3
    add-int/2addr v0, v1

    .line 79
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 80
    .line 81
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->businessName:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/data/AwardStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->status:Lcom/p1/mobile/putong/core/data/AwardStatus;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->awards:Ljava/util/List;

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    invoke-static {}, Lcom/p1/mobile/putong/core/data/NextStatus;->new_()Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->nextStatus:Lcom/p1/mobile/putong/core/data/NextStatus;

    .line 43
    .line 44
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ComStatusAward;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
