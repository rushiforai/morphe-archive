.class public Lcom/p1/mobile/putong/core/data/AppealInfo;
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
            "Lcom/p1/mobile/putong/core/data/AppealInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/AppealInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "appealinfo"


# instance fields
.field public allowAppeal:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public appeal_count:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public method:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public needAppeal:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public needAppealDescription:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public reason:Lcom/p1/mobile/putong/core/data/AppealReason;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/AppealInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AppealInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/AppealInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AppealInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/AppealInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AppealInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/AppealInfo;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AppealInfo;->clone()Lcom/p1/mobile/putong/core/data/AppealInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/AppealInfo;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/AppealInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AppealReason;->clone()Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 35
    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 37
    .line 38
    iput v1, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 41
    .line 42
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 43
    .line 44
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/AppealInfo;->clone()Lcom/p1/mobile/putong/core/data/AppealInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/AppealInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 30
    .line 31
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 66
    .line 67
    iget v3, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 68
    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_2

    .line 80
    .line 81
    return v0

    .line 82
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "appealinfo"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 5

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_7

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppeal:Z

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
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->allowAppeal:Z

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    move v3, v4

    .line 40
    :cond_2
    add-int/2addr v0, v3

    .line 41
    mul-int/lit8 v0, v0, 0x29

    .line 42
    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 44
    .line 45
    if-eqz v1, :cond_3

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AppealReason;->hashCode()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    goto :goto_2

    .line 52
    :cond_3
    move v1, v2

    .line 53
    :goto_2
    add-int/2addr v0, v1

    .line 54
    mul-int/lit8 v0, v0, 0x29

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v1, :cond_4

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    goto :goto_3

    .line 65
    :cond_4
    move v1, v2

    .line 66
    :goto_3
    add-int/2addr v0, v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz v1, :cond_5

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    goto :goto_4

    .line 78
    :cond_5
    move v1, v2

    .line 79
    :goto_4
    add-int/2addr v0, v1

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->appeal_count:I

    .line 83
    .line 84
    add-int/2addr v0, v1

    .line 85
    mul-int/lit8 v0, v0, 0x29

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 88
    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    :cond_6
    add-int/2addr v0, v2

    .line 96
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 97
    .line 98
    :cond_7
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AppealReason;->new_()Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->reason:Lcom/p1/mobile/putong/core/data/AppealReason;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->method:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->status:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/AppealInfo;->needAppealDescription:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/AppealInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
