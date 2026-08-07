.class public Lcom/p1/mobile/putong/core/data/ChatMM;
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
            "Lcom/p1/mobile/putong/core/data/ChatMM;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ChatMM;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "chatmm"


# instance fields
.field public details:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatMMDetail;",
            ">;"
        }
    .end annotation
.end field

.field public expireTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public level:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public matchTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public mmCnt:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public partnerSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public pinChatSuggested:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public sparkSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public taskGuide:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatMM$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatMM$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatMM;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatMM$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatMM$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatMM;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/ChatMMDetail;)Lcom/p1/mobile/putong/core/data/ChatMMDetail;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatMMDetail;->clone()Lcom/p1/mobile/putong/core/data/ChatMMDetail;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/ChatMM;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatMM;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ChatMM;->nullCheck()V

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

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatMM;->clone()Lcom/p1/mobile/putong/core/data/ChatMM;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ChatMM;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatMM;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->mmCnt:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->mmCnt:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->taskGuide:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->taskGuide:Z

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->sparkSwitch:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->sparkSwitch:Z

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->partnerSwitch:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->partnerSwitch:Z

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->pinChatSuggested:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->pinChatSuggested:Z

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->expireTime:D

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->expireTime:D

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->matchTime:D

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->matchTime:D

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->details:Ljava/util/List;

    .line 39
    .line 40
    if-eqz p0, :cond_0

    .line 41
    .line 42
    new-instance v1, Ll/oy4;

    .line 43
    .line 44
    invoke-direct {v1}, Ll/oy4;-><init>()V

    .line 45
    .line 46
    .line 47
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ChatMM;->details:Ljava/util/List;

    .line 52
    .line 53
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

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatMM;->clone()Lcom/p1/mobile/putong/core/data/ChatMM;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ChatMM;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->mmCnt:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->mmCnt:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->taskGuide:Z

    .line 26
    .line 27
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->taskGuide:Z

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->sparkSwitch:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->sparkSwitch:Z

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->partnerSwitch:Z

    .line 38
    .line 39
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->partnerSwitch:Z

    .line 40
    .line 41
    if-ne v1, v3, :cond_2

    .line 42
    .line 43
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->pinChatSuggested:Z

    .line 44
    .line 45
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->pinChatSuggested:Z

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->expireTime:D

    .line 50
    .line 51
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->expireTime:D

    .line 52
    .line 53
    cmpl-double v1, v3, v5

    .line 54
    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->matchTime:D

    .line 58
    .line 59
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->matchTime:D

    .line 60
    .line 61
    cmpl-double v1, v3, v5

    .line 62
    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->details:Ljava/util/List;

    .line 66
    .line 67
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatMM;->details:Ljava/util/List;

    .line 68
    .line 69
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_2

    .line 74
    .line 75
    return v0

    .line 76
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "chatmm"

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
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->mmCnt:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->level:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->taskGuide:Z

    .line 18
    .line 19
    const/16 v2, 0x4d5

    .line 20
    .line 21
    const/16 v3, 0x4cf

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    move v1, v3

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move v1, v2

    .line 28
    :goto_0
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->sparkSwitch:Z

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    move v1, v3

    .line 36
    goto :goto_1

    .line 37
    :cond_1
    move v1, v2

    .line 38
    :goto_1
    add-int/2addr v0, v1

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->partnerSwitch:Z

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    move v1, v3

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->pinChatSuggested:Z

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    move v2, v3

    .line 56
    :cond_3
    add-int/2addr v0, v2

    .line 57
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->expireTime:D

    .line 58
    .line 59
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 60
    .line 61
    .line 62
    move-result-wide v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    const/16 v3, 0x20

    .line 66
    .line 67
    ushr-long v4, v1, v3

    .line 68
    .line 69
    xor-long/2addr v1, v4

    .line 70
    long-to-int v1, v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->matchTime:D

    .line 73
    .line 74
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 75
    .line 76
    .line 77
    move-result-wide v1

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    ushr-long v3, v1, v3

    .line 81
    .line 82
    xor-long/2addr v1, v3

    .line 83
    long-to-int v1, v1

    .line 84
    add-int/2addr v0, v1

    .line 85
    mul-int/lit8 v0, v0, 0x29

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->details:Ljava/util/List;

    .line 88
    .line 89
    if-eqz v1, :cond_4

    .line 90
    .line 91
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    goto :goto_3

    .line 96
    :cond_4
    const/4 v1, 0x0

    .line 97
    :goto_3
    add-int/2addr v0, v1

    .line 98
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 99
    .line 100
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->details:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatMM;->details:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatMM;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
