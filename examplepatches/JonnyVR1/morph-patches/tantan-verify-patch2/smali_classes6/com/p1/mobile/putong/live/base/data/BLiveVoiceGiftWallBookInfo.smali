.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoicegiftwallbookinfo"


# instance fields
.field public canLight:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public firstLightTime:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public firstLightUserAvatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public firstLightUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public firstLightUserName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public giftId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public giftImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public giftPrice:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public giftTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public giftWallBookId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isLight:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public mostGiveCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public mostGiveUserAvatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public mostGiveUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public mostGiveUserName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public noLightReason:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->nullCheck()V

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

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftWallBookId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftWallBookId:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->isLight:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->isLight:Z

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftPrice:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftPrice:Ljava/lang/String;

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->canLight:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->canLight:Z

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->noLightReason:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->noLightReason:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightTime:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightTime:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserName:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserName:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserName:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserName:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 65
    .line 66
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveCount:I

    .line 67
    .line 68
    iput p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveCount:I

    .line 69
    .line 70
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftWallBookId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftWallBookId:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->isLight:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->isLight:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftId:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftPrice:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftPrice:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->canLight:Z

    .line 70
    .line 71
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->canLight:Z

    .line 72
    .line 73
    if-ne v1, v3, :cond_2

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->noLightReason:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->noLightReason:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightTime:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightTime:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 96
    .line 97
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserName:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserName:Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_2

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 116
    .line 117
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 126
    .line 127
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 128
    .line 129
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_2

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserName:Ljava/lang/String;

    .line 136
    .line 137
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserName:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_2

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 146
    .line 147
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 148
    .line 149
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_2

    .line 154
    .line 155
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveCount:I

    .line 156
    .line 157
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveCount:I

    .line 158
    .line 159
    if-ne p0, p1, :cond_2

    .line 160
    .line 161
    return v0

    .line 162
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoicegiftwallbookinfo"

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
    if-nez v0, :cond_f

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftWallBookId:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->isLight:Z

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftId:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v2

    .line 45
    :goto_2
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x29

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftPrice:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v1, :cond_5

    .line 77
    .line 78
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->canLight:Z

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->noLightReason:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v1, :cond_7

    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    goto :goto_6

    .line 104
    :cond_7
    move v1, v2

    .line 105
    :goto_6
    add-int/2addr v0, v1

    .line 106
    mul-int/lit8 v0, v0, 0x29

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightTime:Ljava/lang/String;

    .line 109
    .line 110
    if-eqz v1, :cond_8

    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    goto :goto_7

    .line 117
    :cond_8
    move v1, v2

    .line 118
    :goto_7
    add-int/2addr v0, v1

    .line 119
    mul-int/lit8 v0, v0, 0x29

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 122
    .line 123
    if-eqz v1, :cond_9

    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    goto :goto_8

    .line 130
    :cond_9
    move v1, v2

    .line 131
    :goto_8
    add-int/2addr v0, v1

    .line 132
    mul-int/lit8 v0, v0, 0x29

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserName:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz v1, :cond_a

    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    goto :goto_9

    .line 143
    :cond_a
    move v1, v2

    .line 144
    :goto_9
    add-int/2addr v0, v1

    .line 145
    mul-int/lit8 v0, v0, 0x29

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 148
    .line 149
    if-eqz v1, :cond_b

    .line 150
    .line 151
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    goto :goto_a

    .line 156
    :cond_b
    move v1, v2

    .line 157
    :goto_a
    add-int/2addr v0, v1

    .line 158
    mul-int/lit8 v0, v0, 0x29

    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 161
    .line 162
    if-eqz v1, :cond_c

    .line 163
    .line 164
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    goto :goto_b

    .line 169
    :cond_c
    move v1, v2

    .line 170
    :goto_b
    add-int/2addr v0, v1

    .line 171
    mul-int/lit8 v0, v0, 0x29

    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserName:Ljava/lang/String;

    .line 174
    .line 175
    if-eqz v1, :cond_d

    .line 176
    .line 177
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    goto :goto_c

    .line 182
    :cond_d
    move v1, v2

    .line 183
    :goto_c
    add-int/2addr v0, v1

    .line 184
    mul-int/lit8 v0, v0, 0x29

    .line 185
    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 187
    .line 188
    if-eqz v1, :cond_e

    .line 189
    .line 190
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    :cond_e
    add-int/2addr v0, v2

    .line 195
    mul-int/lit8 v0, v0, 0x29

    .line 196
    .line 197
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveCount:I

    .line 198
    .line 199
    add-int/2addr v0, v1

    .line 200
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 201
    .line 202
    :cond_f
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftWallBookId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftWallBookId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftImage:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftTitle:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftPrice:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->giftPrice:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->noLightReason:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->noLightReason:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightTime:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightTime:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserId:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserName:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserName:Ljava/lang/String;

    .line 56
    .line 57
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_9

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->firstLightUserAvatar:Ljava/lang/String;

    .line 62
    .line 63
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_a

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserId:Ljava/lang/String;

    .line 68
    .line 69
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserName:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_b

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserName:Ljava/lang/String;

    .line 74
    .line 75
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 76
    .line 77
    if-nez v0, :cond_c

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->mostGiveUserAvatar:Ljava/lang/String;

    .line 80
    .line 81
    :cond_c
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGiftWallBookInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
