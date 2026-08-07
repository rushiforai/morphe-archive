.class public Lcom/p1/mobile/putong/core/data/OptiMVParams;
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
            "Lcom/p1/mobile/putong/core/data/OptiMVParams;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/OptiMVParams;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "optimvparams"


# instance fields
.field public chat_game_show:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public chat_guide:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public createTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public curUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public day_number:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public equipment_type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public guide_type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public hasSendMV:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public isNewMoment:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public isOnline:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public isOnliveAnchor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public isRedDot:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public is_close_friend:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public is_fake:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public is_platinum_top_chat:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public is_top_recommend:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public love_letter:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public messageTab:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public message_pairs:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public messagecCellType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public momentsUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public newMatchRank:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public newMsgPageModule:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public operationId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public otherUid:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public pairing_type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public redDotNum:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public spark_level:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public top_chat_type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public user_tag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/OptiMVParams$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/OptiMVParams$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/OptiMVParams$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/OptiMVParams$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/OptiMVParams;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/OptiMVParams;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/OptiMVParams;->nullCheck()V

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

    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/OptiMVParams;->clone()Lcom/p1/mobile/putong/core/data/OptiMVParams;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/OptiMVParams;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/OptiMVParams;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 41
    .line 42
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->hasSendMV:Z

    .line 43
    .line 44
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->hasSendMV:Z

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 77
    .line 78
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 79
    .line 80
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 81
    .line 82
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 83
    .line 84
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 89
    .line 90
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 91
    .line 92
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 95
    .line 96
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 99
    .line 100
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 103
    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 107
    .line 108
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 109
    .line 110
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 111
    .line 112
    iput v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 113
    .line 114
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 115
    .line 116
    iput v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 117
    .line 118
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 119
    .line 120
    iput v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 121
    .line 122
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 123
    .line 124
    iput v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 127
    .line 128
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 129
    .line 130
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/OptiMVParams;->clone()Lcom/p1/mobile/putong/core/data/OptiMVParams;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 36
    .line 37
    cmpl-double v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_2

    .line 100
    .line 101
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->hasSendMV:Z

    .line 102
    .line 103
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->hasSendMV:Z

    .line 104
    .line 105
    if-ne v1, v3, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    if-eqz v1, :cond_2

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 138
    .line 139
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_2

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_2

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 160
    .line 161
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_2

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_2

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 180
    .line 181
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_2

    .line 186
    .line 187
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 188
    .line 189
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 190
    .line 191
    if-ne v1, v3, :cond_2

    .line 192
    .line 193
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 194
    .line 195
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 196
    .line 197
    if-ne v1, v3, :cond_2

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 202
    .line 203
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_2

    .line 208
    .line 209
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 210
    .line 211
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 212
    .line 213
    if-ne v1, v3, :cond_2

    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 218
    .line 219
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    if-eqz v1, :cond_2

    .line 224
    .line 225
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 226
    .line 227
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 228
    .line 229
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    if-eqz v1, :cond_2

    .line 234
    .line 235
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 236
    .line 237
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 238
    .line 239
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v1

    .line 243
    if-eqz v1, :cond_2

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 246
    .line 247
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 248
    .line 249
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    if-eqz v1, :cond_2

    .line 254
    .line 255
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 256
    .line 257
    iget v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 258
    .line 259
    if-ne v1, v3, :cond_2

    .line 260
    .line 261
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 262
    .line 263
    iget v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 264
    .line 265
    if-ne v1, v3, :cond_2

    .line 266
    .line 267
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 268
    .line 269
    iget v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 270
    .line 271
    if-ne v1, v3, :cond_2

    .line 272
    .line 273
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 274
    .line 275
    iget v3, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 276
    .line 277
    if-ne v1, v3, :cond_2

    .line 278
    .line 279
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 280
    .line 281
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 282
    .line 283
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result p0

    .line 287
    if-eqz p0, :cond_2

    .line 288
    .line 289
    return v0

    .line 290
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "optimvparams"

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
    if-nez v0, :cond_1a

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 33
    .line 34
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 35
    .line 36
    .line 37
    move-result-wide v3

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    const/16 v1, 0x20

    .line 41
    .line 42
    ushr-long v5, v3, v1

    .line 43
    .line 44
    xor-long/2addr v3, v5

    .line 45
    long-to-int v1, v3

    .line 46
    add-int/2addr v0, v1

    .line 47
    mul-int/lit8 v0, v0, 0x29

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    goto :goto_2

    .line 58
    :cond_2
    move v1, v2

    .line 59
    :goto_2
    add-int/2addr v0, v1

    .line 60
    mul-int/lit8 v0, v0, 0x29

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    goto :goto_3

    .line 71
    :cond_3
    move v1, v2

    .line 72
    :goto_3
    add-int/2addr v0, v1

    .line 73
    mul-int/lit8 v0, v0, 0x29

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz v1, :cond_4

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    goto :goto_4

    .line 84
    :cond_4
    move v1, v2

    .line 85
    :goto_4
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v1, :cond_5

    .line 91
    .line 92
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    goto :goto_5

    .line 97
    :cond_5
    move v1, v2

    .line 98
    :goto_5
    add-int/2addr v0, v1

    .line 99
    mul-int/lit8 v0, v0, 0x29

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v1, :cond_6

    .line 104
    .line 105
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    goto :goto_6

    .line 110
    :cond_6
    move v1, v2

    .line 111
    :goto_6
    add-int/2addr v0, v1

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz v1, :cond_7

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    goto :goto_7

    .line 123
    :cond_7
    move v1, v2

    .line 124
    :goto_7
    add-int/2addr v0, v1

    .line 125
    mul-int/lit8 v0, v0, 0x29

    .line 126
    .line 127
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->hasSendMV:Z

    .line 128
    .line 129
    const/16 v3, 0x4d5

    .line 130
    .line 131
    const/16 v4, 0x4cf

    .line 132
    .line 133
    if-eqz v1, :cond_8

    .line 134
    .line 135
    move v1, v4

    .line 136
    goto :goto_8

    .line 137
    :cond_8
    move v1, v3

    .line 138
    :goto_8
    add-int/2addr v0, v1

    .line 139
    mul-int/lit8 v0, v0, 0x29

    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 142
    .line 143
    if-eqz v1, :cond_9

    .line 144
    .line 145
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    goto :goto_9

    .line 150
    :cond_9
    move v1, v2

    .line 151
    :goto_9
    add-int/2addr v0, v1

    .line 152
    mul-int/lit8 v0, v0, 0x29

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 155
    .line 156
    if-eqz v1, :cond_a

    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    goto :goto_a

    .line 163
    :cond_a
    move v1, v2

    .line 164
    :goto_a
    add-int/2addr v0, v1

    .line 165
    mul-int/lit8 v0, v0, 0x29

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 168
    .line 169
    if-eqz v1, :cond_b

    .line 170
    .line 171
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    goto :goto_b

    .line 176
    :cond_b
    move v1, v2

    .line 177
    :goto_b
    add-int/2addr v0, v1

    .line 178
    mul-int/lit8 v0, v0, 0x29

    .line 179
    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 181
    .line 182
    if-eqz v1, :cond_c

    .line 183
    .line 184
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    goto :goto_c

    .line 189
    :cond_c
    move v1, v2

    .line 190
    :goto_c
    add-int/2addr v0, v1

    .line 191
    mul-int/lit8 v0, v0, 0x29

    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 194
    .line 195
    if-eqz v1, :cond_d

    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    goto :goto_d

    .line 202
    :cond_d
    move v1, v2

    .line 203
    :goto_d
    add-int/2addr v0, v1

    .line 204
    mul-int/lit8 v0, v0, 0x29

    .line 205
    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 207
    .line 208
    if-eqz v1, :cond_e

    .line 209
    .line 210
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 211
    .line 212
    .line 213
    move-result v1

    .line 214
    goto :goto_e

    .line 215
    :cond_e
    move v1, v2

    .line 216
    :goto_e
    add-int/2addr v0, v1

    .line 217
    mul-int/lit8 v0, v0, 0x29

    .line 218
    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 220
    .line 221
    if-eqz v1, :cond_f

    .line 222
    .line 223
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    goto :goto_f

    .line 228
    :cond_f
    move v1, v2

    .line 229
    :goto_f
    add-int/2addr v0, v1

    .line 230
    mul-int/lit8 v0, v0, 0x29

    .line 231
    .line 232
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 233
    .line 234
    if-eqz v1, :cond_10

    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    goto :goto_10

    .line 241
    :cond_10
    move v1, v2

    .line 242
    :goto_10
    add-int/2addr v0, v1

    .line 243
    mul-int/lit8 v0, v0, 0x29

    .line 244
    .line 245
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 246
    .line 247
    if-eqz v1, :cond_11

    .line 248
    .line 249
    move v1, v4

    .line 250
    goto :goto_11

    .line 251
    :cond_11
    move v1, v3

    .line 252
    :goto_11
    add-int/2addr v0, v1

    .line 253
    mul-int/lit8 v0, v0, 0x29

    .line 254
    .line 255
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 256
    .line 257
    if-eqz v1, :cond_12

    .line 258
    .line 259
    move v1, v4

    .line 260
    goto :goto_12

    .line 261
    :cond_12
    move v1, v3

    .line 262
    :goto_12
    add-int/2addr v0, v1

    .line 263
    mul-int/lit8 v0, v0, 0x29

    .line 264
    .line 265
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 266
    .line 267
    if-eqz v1, :cond_13

    .line 268
    .line 269
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 270
    .line 271
    .line 272
    move-result v1

    .line 273
    goto :goto_13

    .line 274
    :cond_13
    move v1, v2

    .line 275
    :goto_13
    add-int/2addr v0, v1

    .line 276
    mul-int/lit8 v0, v0, 0x29

    .line 277
    .line 278
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 279
    .line 280
    if-eqz v1, :cond_14

    .line 281
    .line 282
    move v3, v4

    .line 283
    :cond_14
    add-int/2addr v0, v3

    .line 284
    mul-int/lit8 v0, v0, 0x29

    .line 285
    .line 286
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 287
    .line 288
    if-eqz v1, :cond_15

    .line 289
    .line 290
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    goto :goto_14

    .line 295
    :cond_15
    move v1, v2

    .line 296
    :goto_14
    add-int/2addr v0, v1

    .line 297
    mul-int/lit8 v0, v0, 0x29

    .line 298
    .line 299
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 300
    .line 301
    if-eqz v1, :cond_16

    .line 302
    .line 303
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    goto :goto_15

    .line 308
    :cond_16
    move v1, v2

    .line 309
    :goto_15
    add-int/2addr v0, v1

    .line 310
    mul-int/lit8 v0, v0, 0x29

    .line 311
    .line 312
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 313
    .line 314
    if-eqz v1, :cond_17

    .line 315
    .line 316
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 317
    .line 318
    .line 319
    move-result v1

    .line 320
    goto :goto_16

    .line 321
    :cond_17
    move v1, v2

    .line 322
    :goto_16
    add-int/2addr v0, v1

    .line 323
    mul-int/lit8 v0, v0, 0x29

    .line 324
    .line 325
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 326
    .line 327
    if-eqz v1, :cond_18

    .line 328
    .line 329
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    goto :goto_17

    .line 334
    :cond_18
    move v1, v2

    .line 335
    :goto_17
    add-int/2addr v0, v1

    .line 336
    mul-int/lit8 v0, v0, 0x29

    .line 337
    .line 338
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 339
    .line 340
    add-int/2addr v0, v1

    .line 341
    mul-int/lit8 v0, v0, 0x29

    .line 342
    .line 343
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 344
    .line 345
    add-int/2addr v0, v1

    .line 346
    mul-int/lit8 v0, v0, 0x29

    .line 347
    .line 348
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 349
    .line 350
    add-int/2addr v0, v1

    .line 351
    mul-int/lit8 v0, v0, 0x29

    .line 352
    .line 353
    iget v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 354
    .line 355
    add-int/2addr v0, v1

    .line 356
    mul-int/lit8 v0, v0, 0x29

    .line 357
    .line 358
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 359
    .line 360
    if-eqz v1, :cond_19

    .line 361
    .line 362
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 363
    .line 364
    .line 365
    move-result v2

    .line 366
    :cond_19
    add-int/2addr v0, v2

    .line 367
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 368
    .line 369
    :cond_1a
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->curUserId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->name:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->operationId:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 56
    .line 57
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_9

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 62
    .line 63
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_a

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 68
    .line 69
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_b

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 74
    .line 75
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 76
    .line 77
    if-nez v0, :cond_c

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 80
    .line 81
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 82
    .line 83
    if-nez v0, :cond_d

    .line 84
    .line 85
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 86
    .line 87
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 88
    .line 89
    if-nez v0, :cond_e

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 92
    .line 93
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 94
    .line 95
    if-nez v0, :cond_f

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 98
    .line 99
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 100
    .line 101
    if-nez v0, :cond_10

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 104
    .line 105
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 106
    .line 107
    if-nez v0, :cond_11

    .line 108
    .line 109
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 110
    .line 111
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 112
    .line 113
    if-nez v0, :cond_12

    .line 114
    .line 115
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 116
    .line 117
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 118
    .line 119
    if-nez v0, :cond_13

    .line 120
    .line 121
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 122
    .line 123
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 124
    .line 125
    if-nez v0, :cond_14

    .line 126
    .line 127
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 128
    .line 129
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 130
    .line 131
    if-nez v0, :cond_15

    .line 132
    .line 133
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->top_chat_type:Ljava/lang/String;

    .line 134
    .line 135
    :cond_15
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
