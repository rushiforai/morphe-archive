.class public Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;
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
            "Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "mymeetliveitem"


# instance fields
.field public anonymous:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public follow:Lcom/p1/mobile/putong/core/data/MeetFollow;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public liveType:Lcom/p1/mobile/putong/core/data/LiveType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public picksTracker:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public picksUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public relation:Lcom/p1/mobile/putong/core/data/MeetRelation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->nullCheck()V

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

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->clone()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksUser:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksUser:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MeetRelation;->clone()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MeetFollow;->clone()Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 41
    .line 42
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 47
    .line 48
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 49
    .line 50
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->clone()Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksUser:Z

    .line 34
    .line 35
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksUser:Z

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 42
    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 62
    .line 63
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 70
    .line 71
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 72
    .line 73
    if-ne v1, v3, :cond_2

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    if-eqz p0, :cond_2

    .line 84
    .line 85
    return v0

    .line 86
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "mymeetliveitem"

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
    if-nez v0, :cond_8

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksUser:Z

    .line 35
    .line 36
    const/16 v3, 0x4d5

    .line 37
    .line 38
    const/16 v4, 0x4cf

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    move v1, v4

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v3

    .line 45
    :goto_2
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x29

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    goto :goto_3

    .line 57
    :cond_3
    move v1, v2

    .line 58
    :goto_3
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MeetRelation;->hashCode()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    goto :goto_4

    .line 70
    :cond_4
    move v1, v2

    .line 71
    :goto_4
    add-int/2addr v0, v1

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 75
    .line 76
    if-eqz v1, :cond_5

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MeetFollow;->hashCode()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    goto :goto_5

    .line 83
    :cond_5
    move v1, v2

    .line 84
    :goto_5
    add-int/2addr v0, v1

    .line 85
    mul-int/lit8 v0, v0, 0x29

    .line 86
    .line 87
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->anonymous:Z

    .line 88
    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    move v3, v4

    .line 92
    :cond_6
    add-int/2addr v0, v3

    .line 93
    mul-int/lit8 v0, v0, 0x29

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v1, :cond_7

    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 100
    .line 101
    .line 102
    move-result v2

    .line 103
    :cond_7
    add-int/2addr v0, v2

    .line 104
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 105
    .line 106
    :cond_8
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/data/LiveType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiveType;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->liveType:Lcom/p1/mobile/putong/core/data/LiveType;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetRelation;->new_()Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MeetFollow;->new_()Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->follow:Lcom/p1/mobile/putong/core/data/MeetFollow;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->picksTracker:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetLiveItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
