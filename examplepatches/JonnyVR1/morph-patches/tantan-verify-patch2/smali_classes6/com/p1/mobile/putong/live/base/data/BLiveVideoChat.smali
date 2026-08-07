.class public Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevideochat"


# instance fields
.field public anchorCallId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public anchorId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public called:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public category:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public createdTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public endTipMessage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public endType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public giftId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public liveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public players:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;",
            ">;"
        }
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public startedTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public ttc:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
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
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->lambda$getAnchor$0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->lambda$getAttendee$1(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private synthetic lambda$getAnchor$0(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private synthetic lambda$getAttendee$1(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userId:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->nullCheck()V

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

    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->startedTime:J

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->startedTime:J

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->createdTime:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->createdTime:J

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 47
    .line 48
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 51
    .line 52
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->ttc:J

    .line 53
    .line 54
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->ttc:J

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    new-instance v2, Ll/c82;

    .line 61
    .line 62
    invoke-direct {v2}, Ll/c82;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 70
    .line 71
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->called:Z

    .line 76
    .line 77
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->called:Z

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 80
    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorCallId:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorCallId:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->source:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->source:Ljava/lang/String;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->category:Ljava/lang/String;

    .line 92
    .line 93
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->category:Ljava/lang/String;

    .line 94
    .line 95
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->startedTime:J

    .line 74
    .line 75
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->startedTime:J

    .line 76
    .line 77
    cmp-long v1, v3, v5

    .line 78
    .line 79
    if-nez v1, :cond_2

    .line 80
    .line 81
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->createdTime:J

    .line 82
    .line 83
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->createdTime:J

    .line 84
    .line 85
    cmp-long v1, v3, v5

    .line 86
    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 92
    .line 93
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_2

    .line 108
    .line 109
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->ttc:J

    .line 110
    .line 111
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->ttc:J

    .line 112
    .line 113
    cmp-long v1, v3, v5

    .line 114
    .line 115
    if-nez v1, :cond_2

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 120
    .line 121
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    if-eqz v1, :cond_2

    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_2

    .line 136
    .line 137
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->called:Z

    .line 138
    .line 139
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->called:Z

    .line 140
    .line 141
    if-ne v1, v3, :cond_2

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 146
    .line 147
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorCallId:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorCallId:Ljava/lang/String;

    .line 156
    .line 157
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_2

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->source:Ljava/lang/String;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->source:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    if-eqz v1, :cond_2

    .line 172
    .line 173
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->category:Ljava/lang/String;

    .line 174
    .line 175
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->category:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    if-eqz p0, :cond_2

    .line 182
    .line 183
    return v0

    .line 184
    :cond_2
    return v2
.end method

.method public getAnchor()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 15
    .line 16
    new-instance v1, Ll/a82;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/a82;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 26
    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :cond_1
    return-object p0
.end method

.method public getAttendee()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 15
    .line 16
    new-instance v1, Ll/b82;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/b82;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 26
    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    :cond_1
    return-object p0
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevideochat"

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
    if-nez v0, :cond_f

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->startedTime:J

    .line 87
    .line 88
    const/16 v1, 0x20

    .line 89
    .line 90
    ushr-long v5, v3, v1

    .line 91
    .line 92
    xor-long/2addr v3, v5

    .line 93
    long-to-int v3, v3

    .line 94
    add-int/2addr v0, v3

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->createdTime:J

    .line 98
    .line 99
    ushr-long v5, v3, v1

    .line 100
    .line 101
    xor-long/2addr v3, v5

    .line 102
    long-to-int v3, v3

    .line 103
    add-int/2addr v0, v3

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 107
    .line 108
    if-eqz v3, :cond_6

    .line 109
    .line 110
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->hashCode()I

    .line 111
    .line 112
    .line 113
    move-result v3

    .line 114
    goto :goto_6

    .line 115
    :cond_6
    move v3, v2

    .line 116
    :goto_6
    add-int/2addr v0, v3

    .line 117
    mul-int/lit8 v0, v0, 0x29

    .line 118
    .line 119
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 120
    .line 121
    if-eqz v3, :cond_7

    .line 122
    .line 123
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 124
    .line 125
    .line 126
    move-result v3

    .line 127
    goto :goto_7

    .line 128
    :cond_7
    move v3, v2

    .line 129
    :goto_7
    add-int/2addr v0, v3

    .line 130
    mul-int/lit8 v0, v0, 0x29

    .line 131
    .line 132
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->ttc:J

    .line 133
    .line 134
    ushr-long v5, v3, v1

    .line 135
    .line 136
    xor-long/2addr v3, v5

    .line 137
    long-to-int v1, v3

    .line 138
    add-int/2addr v0, v1

    .line 139
    mul-int/lit8 v0, v0, 0x29

    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 142
    .line 143
    if-eqz v1, :cond_8

    .line 144
    .line 145
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    goto :goto_8

    .line 150
    :cond_8
    move v1, v2

    .line 151
    :goto_8
    add-int/2addr v0, v1

    .line 152
    mul-int/lit8 v0, v0, 0x29

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 155
    .line 156
    if-eqz v1, :cond_9

    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    goto :goto_9

    .line 163
    :cond_9
    move v1, v2

    .line 164
    :goto_9
    add-int/2addr v0, v1

    .line 165
    mul-int/lit8 v0, v0, 0x29

    .line 166
    .line 167
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->called:Z

    .line 168
    .line 169
    if-eqz v1, :cond_a

    .line 170
    .line 171
    const/16 v1, 0x4cf

    .line 172
    .line 173
    goto :goto_a

    .line 174
    :cond_a
    const/16 v1, 0x4d5

    .line 175
    .line 176
    :goto_a
    add-int/2addr v0, v1

    .line 177
    mul-int/lit8 v0, v0, 0x29

    .line 178
    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 180
    .line 181
    if-eqz v1, :cond_b

    .line 182
    .line 183
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    goto :goto_b

    .line 188
    :cond_b
    move v1, v2

    .line 189
    :goto_b
    add-int/2addr v0, v1

    .line 190
    mul-int/lit8 v0, v0, 0x29

    .line 191
    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorCallId:Ljava/lang/String;

    .line 193
    .line 194
    if-eqz v1, :cond_c

    .line 195
    .line 196
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    goto :goto_c

    .line 201
    :cond_c
    move v1, v2

    .line 202
    :goto_c
    add-int/2addr v0, v1

    .line 203
    mul-int/lit8 v0, v0, 0x29

    .line 204
    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->source:Ljava/lang/String;

    .line 206
    .line 207
    if-eqz v1, :cond_d

    .line 208
    .line 209
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    goto :goto_d

    .line 214
    :cond_d
    move v1, v2

    .line 215
    :goto_d
    add-int/2addr v0, v1

    .line 216
    mul-int/lit8 v0, v0, 0x29

    .line 217
    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->category:Ljava/lang/String;

    .line 219
    .line 220
    if-eqz v1, :cond_e

    .line 221
    .line 222
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    :cond_e
    add-int/2addr v0, v2

    .line 227
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 228
    .line 229
    :cond_f
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->liveId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->roomId:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->status:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->media:Lcom/p1/mobile/putong/live/base/data/BLiveVideoQualityConf;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->giftId:Ljava/lang/String;

    .line 54
    .line 55
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 56
    .line 57
    if-nez v0, :cond_8

    .line 58
    .line 59
    new-instance v0, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->players:Ljava/util/List;

    .line 65
    .line 66
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 67
    .line 68
    if-nez v0, :cond_9

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endType:Ljava/lang/String;

    .line 71
    .line 72
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 73
    .line 74
    if-nez v0, :cond_a

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->endTipMessage:Ljava/lang/String;

    .line 77
    .line 78
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorCallId:Ljava/lang/String;

    .line 79
    .line 80
    if-nez v0, :cond_b

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->anchorCallId:Ljava/lang/String;

    .line 83
    .line 84
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->source:Ljava/lang/String;

    .line 85
    .line 86
    if-nez v0, :cond_c

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->source:Ljava/lang/String;

    .line 89
    .line 90
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->category:Ljava/lang/String;

    .line 91
    .line 92
    if-nez v0, :cond_d

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->category:Ljava/lang/String;

    .line 95
    .line 96
    :cond_d
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
