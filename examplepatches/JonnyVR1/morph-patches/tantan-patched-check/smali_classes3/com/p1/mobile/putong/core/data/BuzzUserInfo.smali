.class public Lcom/p1/mobile/putong/core/data/BuzzUserInfo;
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
            "Lcom/p1/mobile/putong/core/data/BuzzUserInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/BuzzUserInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "buzzuserinfo"


# instance fields
.field public age:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public gender:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public lookingForGender:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public modStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public popLevel:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public seeStatus:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public svipStatus:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public vipStatus:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/BuzzUserInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->nullCheck()V

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

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->clone()Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/BuzzUserInfo;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->age:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->age:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->gender:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->gender:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->lookingForGender:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->lookingForGender:Ljava/lang/String;

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->popLevel:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->popLevel:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->modStatus:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->modStatus:Ljava/lang/String;

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->vipStatus:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->vipStatus:Z

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->svipStatus:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->svipStatus:Z

    .line 33
    .line 34
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->seeStatus:Z

    .line 35
    .line 36
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->seeStatus:Z

    .line 37
    .line 38
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->clone()Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->age:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->age:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->gender:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->gender:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->lookingForGender:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->lookingForGender:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->popLevel:I

    .line 40
    .line 41
    iget v3, p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->popLevel:I

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->modStatus:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->modStatus:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->vipStatus:Z

    .line 56
    .line 57
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->vipStatus:Z

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->svipStatus:Z

    .line 62
    .line 63
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->svipStatus:Z

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->seeStatus:Z

    .line 68
    .line 69
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->seeStatus:Z

    .line 70
    .line 71
    if-ne p0, p1, :cond_2

    .line 72
    .line 73
    return v0

    .line 74
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "buzzuserinfo"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->age:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->gender:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v1, v2

    .line 23
    :goto_0
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->lookingForGender:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v1, v2

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->popLevel:I

    .line 40
    .line 41
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->modStatus:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    :cond_2
    add-int/2addr v0, v2

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->vipStatus:Z

    .line 56
    .line 57
    const/16 v2, 0x4d5

    .line 58
    .line 59
    const/16 v3, 0x4cf

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    move v1, v3

    .line 64
    goto :goto_2

    .line 65
    :cond_3
    move v1, v2

    .line 66
    :goto_2
    add-int/2addr v0, v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->svipStatus:Z

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    move v1, v3

    .line 74
    goto :goto_3

    .line 75
    :cond_4
    move v1, v2

    .line 76
    :goto_3
    add-int/2addr v0, v1

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->seeStatus:Z

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    move v2, v3

    .line 84
    :cond_5
    add-int/2addr v0, v2

    .line 85
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 86
    .line 87
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->gender:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->gender:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->lookingForGender:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->lookingForGender:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->modStatus:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->modStatus:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/BuzzUserInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
