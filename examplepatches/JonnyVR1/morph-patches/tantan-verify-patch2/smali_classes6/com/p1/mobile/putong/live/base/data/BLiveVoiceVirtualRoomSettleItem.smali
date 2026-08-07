.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATE_CREATED:Ljava/lang/String; = "created"

.field public static final STATE_SETTLED:Ljava/lang/String; = "settled"

.field public static final STATE_UNSETTLE:Ljava/lang/String; = "unSettle"

.field public static final TYPE:Ljava/lang/String; = "blivevoicevirtualroomsettleitem"


# instance fields
.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isManager:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public isRoomOwner:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public likePopUp:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public state:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public toast:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->roomId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->roomId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->userId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->userId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isRoomOwner:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isRoomOwner:Z

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isManager:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isManager:Z

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->toast:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->toast:Ljava/lang/String;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->likePopUp:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;

    .line 35
    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->likePopUp:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;

    .line 43
    .line 44
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

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->roomId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->userId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isRoomOwner:Z

    .line 54
    .line 55
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isRoomOwner:Z

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isManager:Z

    .line 60
    .line 61
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isManager:Z

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->toast:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->toast:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->likePopUp:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->likePopUp:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;

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
    const-string p0, "blivevoicevirtualroomsettleitem"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isRoomOwner:Z

    .line 61
    .line 62
    const/16 v3, 0x4d5

    .line 63
    .line 64
    const/16 v4, 0x4cf

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    move v1, v4

    .line 69
    goto :goto_4

    .line 70
    :cond_4
    move v1, v3

    .line 71
    :goto_4
    add-int/2addr v0, v1

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->isManager:Z

    .line 75
    .line 76
    if-eqz v1, :cond_5

    .line 77
    .line 78
    move v3, v4

    .line 79
    :cond_5
    add-int/2addr v0, v3

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->toast:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v1, :cond_6

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    goto :goto_5

    .line 91
    :cond_6
    move v1, v2

    .line 92
    :goto_5
    add-int/2addr v0, v1

    .line 93
    mul-int/lit8 v0, v0, 0x29

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->likePopUp:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;

    .line 96
    .line 97
    if-eqz v1, :cond_7

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLikePopUp;->hashCode()I

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

.method public isCreated()Z
    .locals 1

    .line 1
    const-string v0, "created"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isSettled()Z
    .locals 1

    .line 1
    const-string v0, "settled"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isUnSettled()Z
    .locals 1

    .line 1
    const-string v0, "unSettle"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->roomId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->state:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
