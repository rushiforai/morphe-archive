.class public Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivefanbaseredpacketinfo"


# instance fields
.field public anchorContent:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public countdown:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public endTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public giftContent:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;",
            ">;"
        }
    .end annotation
.end field

.field public grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public hasGrabbed:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public histories:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;",
            ">;"
        }
    .end annotation
.end field

.field public hit:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public isAnchor:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public isEnough:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public isValid:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public limitSatisfied:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public senderId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public senderName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public token:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;)Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;)Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->nullCheck()V

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

    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hasGrabbed:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hasGrabbed:Z

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hit:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hit:Z

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    new-instance v2, Ll/yz1;

    .line 37
    .line 38
    invoke-direct {v2}, Ll/yz1;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 46
    .line 47
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->limitSatisfied:Z

    .line 48
    .line 49
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->limitSatisfied:Z

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    new-instance v2, Ll/zz1;

    .line 56
    .line 57
    invoke-direct {v2}, Ll/zz1;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 65
    .line 66
    :cond_2
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->countdown:J

    .line 67
    .line 68
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->countdown:J

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

    .line 73
    .line 74
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isValid:Z

    .line 75
    .line 76
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isValid:Z

    .line 77
    .line 78
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isEnough:Z

    .line 79
    .line 80
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isEnough:Z

    .line 81
    .line 82
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->endTime:D

    .line 83
    .line 84
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->endTime:D

    .line 85
    .line 86
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isAnchor:Z

    .line 87
    .line 88
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isAnchor:Z

    .line 89
    .line 90
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 91
    .line 92
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 93
    .line 94
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hasGrabbed:Z

    .line 34
    .line 35
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hasGrabbed:Z

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hit:Z

    .line 40
    .line 41
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hit:Z

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->limitSatisfied:Z

    .line 66
    .line 67
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->limitSatisfied:Z

    .line 68
    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->countdown:J

    .line 82
    .line 83
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->countdown:J

    .line 84
    .line 85
    cmp-long v1, v3, v5

    .line 86
    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isValid:Z

    .line 100
    .line 101
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isValid:Z

    .line 102
    .line 103
    if-ne v1, v3, :cond_2

    .line 104
    .line 105
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isEnough:Z

    .line 106
    .line 107
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isEnough:Z

    .line 108
    .line 109
    if-ne v1, v3, :cond_2

    .line 110
    .line 111
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->endTime:D

    .line 112
    .line 113
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->endTime:D

    .line 114
    .line 115
    cmpl-double v1, v3, v5

    .line 116
    .line 117
    if-nez v1, :cond_2

    .line 118
    .line 119
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isAnchor:Z

    .line 120
    .line 121
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isAnchor:Z

    .line 122
    .line 123
    if-ne v1, v3, :cond_2

    .line 124
    .line 125
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 126
    .line 127
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    if-eqz p0, :cond_2

    .line 134
    .line 135
    return v0

    .line 136
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivefanbaseredpacketinfo"

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
    if-nez v0, :cond_d

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hasGrabbed:Z

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hit:Z

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    move v1, v4

    .line 53
    goto :goto_3

    .line 54
    :cond_3
    move v1, v3

    .line 55
    :goto_3
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->hashCode()I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    goto :goto_4

    .line 67
    :cond_4
    move v1, v2

    .line 68
    :goto_4
    add-int/2addr v0, v1

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 72
    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    goto :goto_5

    .line 80
    :cond_5
    move v1, v2

    .line 81
    :goto_5
    add-int/2addr v0, v1

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->limitSatisfied:Z

    .line 85
    .line 86
    if-eqz v1, :cond_6

    .line 87
    .line 88
    move v1, v4

    .line 89
    goto :goto_6

    .line 90
    :cond_6
    move v1, v3

    .line 91
    :goto_6
    add-int/2addr v0, v1

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 95
    .line 96
    if-eqz v1, :cond_7

    .line 97
    .line 98
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    goto :goto_7

    .line 103
    :cond_7
    move v1, v2

    .line 104
    :goto_7
    add-int/2addr v0, v1

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->countdown:J

    .line 108
    .line 109
    const/16 v1, 0x20

    .line 110
    .line 111
    ushr-long v7, v5, v1

    .line 112
    .line 113
    xor-long/2addr v5, v7

    .line 114
    long-to-int v5, v5

    .line 115
    add-int/2addr v0, v5

    .line 116
    mul-int/lit8 v0, v0, 0x29

    .line 117
    .line 118
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

    .line 119
    .line 120
    if-eqz v5, :cond_8

    .line 121
    .line 122
    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    goto :goto_8

    .line 127
    :cond_8
    move v5, v2

    .line 128
    :goto_8
    add-int/2addr v0, v5

    .line 129
    mul-int/lit8 v0, v0, 0x29

    .line 130
    .line 131
    iget-boolean v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isValid:Z

    .line 132
    .line 133
    if-eqz v5, :cond_9

    .line 134
    .line 135
    move v5, v4

    .line 136
    goto :goto_9

    .line 137
    :cond_9
    move v5, v3

    .line 138
    :goto_9
    add-int/2addr v0, v5

    .line 139
    mul-int/lit8 v0, v0, 0x29

    .line 140
    .line 141
    iget-boolean v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isEnough:Z

    .line 142
    .line 143
    if-eqz v5, :cond_a

    .line 144
    .line 145
    move v5, v4

    .line 146
    goto :goto_a

    .line 147
    :cond_a
    move v5, v3

    .line 148
    :goto_a
    add-int/2addr v0, v5

    .line 149
    iget-wide v5, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->endTime:D

    .line 150
    .line 151
    invoke-static {v5, v6}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 152
    .line 153
    .line 154
    move-result-wide v5

    .line 155
    mul-int/lit8 v0, v0, 0x29

    .line 156
    .line 157
    ushr-long v7, v5, v1

    .line 158
    .line 159
    xor-long/2addr v5, v7

    .line 160
    long-to-int v1, v5

    .line 161
    add-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isAnchor:Z

    .line 165
    .line 166
    if-eqz v1, :cond_b

    .line 167
    .line 168
    move v3, v4

    .line 169
    :cond_b
    add-int/2addr v0, v3

    .line 170
    mul-int/lit8 v0, v0, 0x29

    .line 171
    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 173
    .line 174
    if-eqz v1, :cond_c

    .line 175
    .line 176
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    :cond_c
    add-int/2addr v0, v2

    .line 181
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 182
    .line 183
    :cond_d
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 36
    .line 37
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_4

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

    .line 42
    .line 43
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_5

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 48
    .line 49
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
