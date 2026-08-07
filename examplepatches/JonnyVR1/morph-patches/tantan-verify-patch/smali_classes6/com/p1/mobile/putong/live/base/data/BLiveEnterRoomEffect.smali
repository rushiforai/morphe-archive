.class public Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveenterroomeffect"


# instance fields
.field public animationSizeType:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public avatarGradientDirection:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public avatarGradients:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public backgroundGradientDirection:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public backgroundGradients:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public backgroundUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public backgroundUrlEndMargin:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public dynamicEffectExtends:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;",
            ">;"
        }
    .end annotation
.end field

.field public effectId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public enterVersion:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public expireTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public fixedBackgroundUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public floatingUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public hierarchys:Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public internalText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public isWealthHierarchy:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public newFloatingUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public newResourceId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public resourceId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public showDuration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public text:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public textColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public userImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public userName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public userNameColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public userNameGradientColors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public videoEffectExtras:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;)Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;)Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->nullCheck()V

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

    .line 185
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->roomId:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->roomId:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userName:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userName:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userImage:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userImage:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameColor:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameColor:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameGradientColors:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    new-instance v2, Ll/lz1;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/lz1;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameGradientColors:Ljava/util/List;

    .line 40
    .line 41
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->text:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->text:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->textColor:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->textColor:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrl:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrl:Ljava/lang/String;

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradientDirection:I

    .line 54
    .line 55
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradientDirection:I

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradients:Ljava/util/List;

    .line 58
    .line 59
    if-eqz v1, :cond_1

    .line 60
    .line 61
    new-instance v2, Ll/mz1;

    .line 62
    .line 63
    invoke-direct {v2}, Ll/mz1;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradients:Ljava/util/List;

    .line 71
    .line 72
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->floatingUrl:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->floatingUrl:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->resourceId:Ljava/lang/String;

    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->resourceId:Ljava/lang/String;

    .line 79
    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->showDuration:I

    .line 81
    .line 82
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->showDuration:I

    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->isWealthHierarchy:Z

    .line 85
    .line 86
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->isWealthHierarchy:Z

    .line 87
    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->hierarchys:Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 89
    .line 90
    if-eqz v1, :cond_2

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->hierarchys:Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 97
    .line 98
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradientDirection:I

    .line 99
    .line 100
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradientDirection:I

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradients:Ljava/util/List;

    .line 103
    .line 104
    if-eqz v1, :cond_3

    .line 105
    .line 106
    new-instance v2, Ll/nz1;

    .line 107
    .line 108
    invoke-direct {v2}, Ll/nz1;-><init>()V

    .line 109
    .line 110
    .line 111
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradients:Ljava/util/List;

    .line 116
    .line 117
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->effectId:Ljava/lang/String;

    .line 118
    .line 119
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->effectId:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->internalText:Ljava/lang/String;

    .line 122
    .line 123
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->internalText:Ljava/lang/String;

    .line 124
    .line 125
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->expireTime:J

    .line 126
    .line 127
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->expireTime:J

    .line 128
    .line 129
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrlEndMargin:I

    .line 130
    .line 131
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrlEndMargin:I

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->fixedBackgroundUrl:Ljava/lang/String;

    .line 134
    .line 135
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->fixedBackgroundUrl:Ljava/lang/String;

    .line 136
    .line 137
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->animationSizeType:J

    .line 138
    .line 139
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->animationSizeType:J

    .line 140
    .line 141
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->enterVersion:J

    .line 142
    .line 143
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->enterVersion:J

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newFloatingUrl:Ljava/lang/String;

    .line 146
    .line 147
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newFloatingUrl:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newResourceId:Ljava/lang/String;

    .line 150
    .line 151
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newResourceId:Ljava/lang/String;

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->videoEffectExtras:Ljava/util/List;

    .line 154
    .line 155
    if-eqz v1, :cond_4

    .line 156
    .line 157
    new-instance v2, Ll/oz1;

    .line 158
    .line 159
    invoke-direct {v2}, Ll/oz1;-><init>()V

    .line 160
    .line 161
    .line 162
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->videoEffectExtras:Ljava/util/List;

    .line 167
    .line 168
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->dynamicEffectExtends:Ljava/util/List;

    .line 169
    .line 170
    if-eqz p0, :cond_5

    .line 171
    .line 172
    new-instance v1, Ll/pz1;

    .line 173
    .line 174
    invoke-direct {v1}, Ll/pz1;-><init>()V

    .line 175
    .line 176
    .line 177
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->dynamicEffectExtends:Ljava/util/List;

    .line 182
    .line 183
    :cond_5
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 184
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->roomId:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userName:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userImage:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userImage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameColor:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameGradientColors:Ljava/util/List;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameGradientColors:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->text:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->text:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->textColor:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->textColor:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-eqz v1, :cond_2

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrl:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrl:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    if-eqz v1, :cond_2

    .line 102
    .line 103
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradientDirection:I

    .line 104
    .line 105
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradientDirection:I

    .line 106
    .line 107
    if-ne v1, v3, :cond_2

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradients:Ljava/util/List;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradients:Ljava/util/List;

    .line 112
    .line 113
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    if-eqz v1, :cond_2

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->floatingUrl:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->floatingUrl:Ljava/lang/String;

    .line 122
    .line 123
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-eqz v1, :cond_2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->resourceId:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->resourceId:Ljava/lang/String;

    .line 132
    .line 133
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_2

    .line 138
    .line 139
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->showDuration:I

    .line 140
    .line 141
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->showDuration:I

    .line 142
    .line 143
    if-ne v1, v3, :cond_2

    .line 144
    .line 145
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->isWealthHierarchy:Z

    .line 146
    .line 147
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->isWealthHierarchy:Z

    .line 148
    .line 149
    if-ne v1, v3, :cond_2

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->hierarchys:Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 152
    .line 153
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->hierarchys:Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 154
    .line 155
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_2

    .line 160
    .line 161
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradientDirection:I

    .line 162
    .line 163
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradientDirection:I

    .line 164
    .line 165
    if-ne v1, v3, :cond_2

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradients:Ljava/util/List;

    .line 168
    .line 169
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradients:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->effectId:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->effectId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->internalText:Ljava/lang/String;

    .line 188
    .line 189
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->internalText:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-eqz v1, :cond_2

    .line 196
    .line 197
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->expireTime:J

    .line 198
    .line 199
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->expireTime:J

    .line 200
    .line 201
    cmp-long v1, v3, v5

    .line 202
    .line 203
    if-nez v1, :cond_2

    .line 204
    .line 205
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrlEndMargin:I

    .line 206
    .line 207
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrlEndMargin:I

    .line 208
    .line 209
    if-ne v1, v3, :cond_2

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->fixedBackgroundUrl:Ljava/lang/String;

    .line 212
    .line 213
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->fixedBackgroundUrl:Ljava/lang/String;

    .line 214
    .line 215
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-eqz v1, :cond_2

    .line 220
    .line 221
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->animationSizeType:J

    .line 222
    .line 223
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->animationSizeType:J

    .line 224
    .line 225
    cmp-long v1, v3, v5

    .line 226
    .line 227
    if-nez v1, :cond_2

    .line 228
    .line 229
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->enterVersion:J

    .line 230
    .line 231
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->enterVersion:J

    .line 232
    .line 233
    cmp-long v1, v3, v5

    .line 234
    .line 235
    if-nez v1, :cond_2

    .line 236
    .line 237
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newFloatingUrl:Ljava/lang/String;

    .line 238
    .line 239
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newFloatingUrl:Ljava/lang/String;

    .line 240
    .line 241
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    if-eqz v1, :cond_2

    .line 246
    .line 247
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newResourceId:Ljava/lang/String;

    .line 248
    .line 249
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newResourceId:Ljava/lang/String;

    .line 250
    .line 251
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    if-eqz v1, :cond_2

    .line 256
    .line 257
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->videoEffectExtras:Ljava/util/List;

    .line 258
    .line 259
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->videoEffectExtras:Ljava/util/List;

    .line 260
    .line 261
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    if-eqz v1, :cond_2

    .line 266
    .line 267
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->dynamicEffectExtends:Ljava/util/List;

    .line 268
    .line 269
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->dynamicEffectExtends:Ljava/util/List;

    .line 270
    .line 271
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result p0

    .line 275
    if-eqz p0, :cond_2

    .line 276
    .line 277
    return v0

    .line 278
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveenterroomeffect"

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
    if-nez v0, :cond_16

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userImage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameGradientColors:Ljava/util/List;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->text:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    goto :goto_6

    .line 95
    :cond_6
    move v1, v2

    .line 96
    :goto_6
    add-int/2addr v0, v1

    .line 97
    mul-int/lit8 v0, v0, 0x29

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->textColor:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    goto :goto_7

    .line 108
    :cond_7
    move v1, v2

    .line 109
    :goto_7
    add-int/2addr v0, v1

    .line 110
    mul-int/lit8 v0, v0, 0x29

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrl:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    goto :goto_8

    .line 121
    :cond_8
    move v1, v2

    .line 122
    :goto_8
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradientDirection:I

    .line 126
    .line 127
    add-int/2addr v0, v1

    .line 128
    mul-int/lit8 v0, v0, 0x29

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradients:Ljava/util/List;

    .line 131
    .line 132
    if-eqz v1, :cond_9

    .line 133
    .line 134
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    goto :goto_9

    .line 139
    :cond_9
    move v1, v2

    .line 140
    :goto_9
    add-int/2addr v0, v1

    .line 141
    mul-int/lit8 v0, v0, 0x29

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->floatingUrl:Ljava/lang/String;

    .line 144
    .line 145
    if-eqz v1, :cond_a

    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    goto :goto_a

    .line 152
    :cond_a
    move v1, v2

    .line 153
    :goto_a
    add-int/2addr v0, v1

    .line 154
    mul-int/lit8 v0, v0, 0x29

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->resourceId:Ljava/lang/String;

    .line 157
    .line 158
    if-eqz v1, :cond_b

    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    goto :goto_b

    .line 165
    :cond_b
    move v1, v2

    .line 166
    :goto_b
    add-int/2addr v0, v1

    .line 167
    mul-int/lit8 v0, v0, 0x29

    .line 168
    .line 169
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->showDuration:I

    .line 170
    .line 171
    add-int/2addr v0, v1

    .line 172
    mul-int/lit8 v0, v0, 0x29

    .line 173
    .line 174
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->isWealthHierarchy:Z

    .line 175
    .line 176
    if-eqz v1, :cond_c

    .line 177
    .line 178
    const/16 v1, 0x4cf

    .line 179
    .line 180
    goto :goto_c

    .line 181
    :cond_c
    const/16 v1, 0x4d5

    .line 182
    .line 183
    :goto_c
    add-int/2addr v0, v1

    .line 184
    mul-int/lit8 v0, v0, 0x29

    .line 185
    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->hierarchys:Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 187
    .line 188
    if-eqz v1, :cond_d

    .line 189
    .line 190
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;->hashCode()I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    goto :goto_d

    .line 195
    :cond_d
    move v1, v2

    .line 196
    :goto_d
    add-int/2addr v0, v1

    .line 197
    mul-int/lit8 v0, v0, 0x29

    .line 198
    .line 199
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradientDirection:I

    .line 200
    .line 201
    add-int/2addr v0, v1

    .line 202
    mul-int/lit8 v0, v0, 0x29

    .line 203
    .line 204
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradients:Ljava/util/List;

    .line 205
    .line 206
    if-eqz v1, :cond_e

    .line 207
    .line 208
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    goto :goto_e

    .line 213
    :cond_e
    move v1, v2

    .line 214
    :goto_e
    add-int/2addr v0, v1

    .line 215
    mul-int/lit8 v0, v0, 0x29

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->effectId:Ljava/lang/String;

    .line 218
    .line 219
    if-eqz v1, :cond_f

    .line 220
    .line 221
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    goto :goto_f

    .line 226
    :cond_f
    move v1, v2

    .line 227
    :goto_f
    add-int/2addr v0, v1

    .line 228
    mul-int/lit8 v0, v0, 0x29

    .line 229
    .line 230
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->internalText:Ljava/lang/String;

    .line 231
    .line 232
    if-eqz v1, :cond_10

    .line 233
    .line 234
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    goto :goto_10

    .line 239
    :cond_10
    move v1, v2

    .line 240
    :goto_10
    add-int/2addr v0, v1

    .line 241
    mul-int/lit8 v0, v0, 0x29

    .line 242
    .line 243
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->expireTime:J

    .line 244
    .line 245
    const/16 v1, 0x20

    .line 246
    .line 247
    ushr-long v5, v3, v1

    .line 248
    .line 249
    xor-long/2addr v3, v5

    .line 250
    long-to-int v3, v3

    .line 251
    add-int/2addr v0, v3

    .line 252
    mul-int/lit8 v0, v0, 0x29

    .line 253
    .line 254
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrlEndMargin:I

    .line 255
    .line 256
    add-int/2addr v0, v3

    .line 257
    mul-int/lit8 v0, v0, 0x29

    .line 258
    .line 259
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->fixedBackgroundUrl:Ljava/lang/String;

    .line 260
    .line 261
    if-eqz v3, :cond_11

    .line 262
    .line 263
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 264
    .line 265
    .line 266
    move-result v3

    .line 267
    goto :goto_11

    .line 268
    :cond_11
    move v3, v2

    .line 269
    :goto_11
    add-int/2addr v0, v3

    .line 270
    mul-int/lit8 v0, v0, 0x29

    .line 271
    .line 272
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->animationSizeType:J

    .line 273
    .line 274
    ushr-long v5, v3, v1

    .line 275
    .line 276
    xor-long/2addr v3, v5

    .line 277
    long-to-int v3, v3

    .line 278
    add-int/2addr v0, v3

    .line 279
    mul-int/lit8 v0, v0, 0x29

    .line 280
    .line 281
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->enterVersion:J

    .line 282
    .line 283
    ushr-long v5, v3, v1

    .line 284
    .line 285
    xor-long/2addr v3, v5

    .line 286
    long-to-int v1, v3

    .line 287
    add-int/2addr v0, v1

    .line 288
    mul-int/lit8 v0, v0, 0x29

    .line 289
    .line 290
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newFloatingUrl:Ljava/lang/String;

    .line 291
    .line 292
    if-eqz v1, :cond_12

    .line 293
    .line 294
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 295
    .line 296
    .line 297
    move-result v1

    .line 298
    goto :goto_12

    .line 299
    :cond_12
    move v1, v2

    .line 300
    :goto_12
    add-int/2addr v0, v1

    .line 301
    mul-int/lit8 v0, v0, 0x29

    .line 302
    .line 303
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newResourceId:Ljava/lang/String;

    .line 304
    .line 305
    if-eqz v1, :cond_13

    .line 306
    .line 307
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    goto :goto_13

    .line 312
    :cond_13
    move v1, v2

    .line 313
    :goto_13
    add-int/2addr v0, v1

    .line 314
    mul-int/lit8 v0, v0, 0x29

    .line 315
    .line 316
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->videoEffectExtras:Ljava/util/List;

    .line 317
    .line 318
    if-eqz v1, :cond_14

    .line 319
    .line 320
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 321
    .line 322
    .line 323
    move-result v1

    .line 324
    goto :goto_14

    .line 325
    :cond_14
    move v1, v2

    .line 326
    :goto_14
    add-int/2addr v0, v1

    .line 327
    mul-int/lit8 v0, v0, 0x29

    .line 328
    .line 329
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->dynamicEffectExtends:Ljava/util/List;

    .line 330
    .line 331
    if-eqz v1, :cond_15

    .line 332
    .line 333
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 334
    .line 335
    .line 336
    move-result v2

    .line 337
    :cond_15
    add-int/2addr v0, v2

    .line 338
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 339
    .line 340
    :cond_16
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->roomId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userName:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userName:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userImage:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userImage:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameColor:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameColor:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameGradientColors:Ljava/util/List;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    new-instance v0, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->userNameGradientColors:Ljava/util/List;

    .line 43
    .line 44
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->text:Ljava/lang/String;

    .line 45
    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->text:Ljava/lang/String;

    .line 49
    .line 50
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->textColor:Ljava/lang/String;

    .line 51
    .line 52
    if-nez v0, :cond_7

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->textColor:Ljava/lang/String;

    .line 55
    .line 56
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrl:Ljava/lang/String;

    .line 57
    .line 58
    if-nez v0, :cond_8

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundUrl:Ljava/lang/String;

    .line 61
    .line 62
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradients:Ljava/util/List;

    .line 63
    .line 64
    if-nez v0, :cond_9

    .line 65
    .line 66
    new-instance v0, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->backgroundGradients:Ljava/util/List;

    .line 72
    .line 73
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->floatingUrl:Ljava/lang/String;

    .line 74
    .line 75
    if-nez v0, :cond_a

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->floatingUrl:Ljava/lang/String;

    .line 78
    .line 79
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->resourceId:Ljava/lang/String;

    .line 80
    .line 81
    if-nez v0, :cond_b

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->resourceId:Ljava/lang/String;

    .line 84
    .line 85
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->hierarchys:Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 86
    .line 87
    if-nez v0, :cond_c

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->hierarchys:Lcom/p1/mobile/putong/live/base/data/BLiveWealthHierarchys;

    .line 94
    .line 95
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradients:Ljava/util/List;

    .line 96
    .line 97
    if-nez v0, :cond_d

    .line 98
    .line 99
    new-instance v0, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->avatarGradients:Ljava/util/List;

    .line 105
    .line 106
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->effectId:Ljava/lang/String;

    .line 107
    .line 108
    if-nez v0, :cond_e

    .line 109
    .line 110
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->effectId:Ljava/lang/String;

    .line 111
    .line 112
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->internalText:Ljava/lang/String;

    .line 113
    .line 114
    if-nez v0, :cond_f

    .line 115
    .line 116
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->internalText:Ljava/lang/String;

    .line 117
    .line 118
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->fixedBackgroundUrl:Ljava/lang/String;

    .line 119
    .line 120
    if-nez v0, :cond_10

    .line 121
    .line 122
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->fixedBackgroundUrl:Ljava/lang/String;

    .line 123
    .line 124
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newFloatingUrl:Ljava/lang/String;

    .line 125
    .line 126
    if-nez v0, :cond_11

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newFloatingUrl:Ljava/lang/String;

    .line 129
    .line 130
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newResourceId:Ljava/lang/String;

    .line 131
    .line 132
    if-nez v0, :cond_12

    .line 133
    .line 134
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->newResourceId:Ljava/lang/String;

    .line 135
    .line 136
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->videoEffectExtras:Ljava/util/List;

    .line 137
    .line 138
    if-nez v0, :cond_13

    .line 139
    .line 140
    new-instance v0, Ljava/util/ArrayList;

    .line 141
    .line 142
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 143
    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->videoEffectExtras:Ljava/util/List;

    .line 146
    .line 147
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->dynamicEffectExtends:Ljava/util/List;

    .line 148
    .line 149
    if-nez v0, :cond_14

    .line 150
    .line 151
    new-instance v0, Ljava/util/ArrayList;

    .line 152
    .line 153
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 154
    .line 155
    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->dynamicEffectExtends:Ljava/util/List;

    .line 157
    .line 158
    :cond_14
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoomEffect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
