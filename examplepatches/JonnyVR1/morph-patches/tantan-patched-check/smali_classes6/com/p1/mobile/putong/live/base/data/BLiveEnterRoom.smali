.class public Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static ENTER_EFFECT_V0:J = 0x0L

.field public static ENTER_EFFECT_V1:J = 0x1L

.field public static ENTER_EFFECT_V2:J = 0x2L

.field public static ENTER_EFFECT_V3:J = 0x3L

.field public static ENTER_EFFECT_V4:J = 0x4L

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveenterroom"


# instance fields
.field public animationSizeType:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public avatarGradientDirection:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public avatarGradients:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
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
        index = 0x11
    .end annotation
.end field

.field public backgroundGradients:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public backgroundUrlEndMargin:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public bgUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public contentText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public contentTextColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
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
        index = 0xc
    .end annotation
.end field

.field public enterRoomEffectId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public enterVersion:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public fixedBackgroundUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public floatBgUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
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
        index = 0x19
    .end annotation
.end field

.field public newResourceId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public resourceId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public showDuration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public uid:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public userGrade:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public userGradeIcon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public userImage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
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
        index = 0x4
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
        index = 0x1a
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
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;)Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;
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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public checkDefaultColor()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "ffffff"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 179
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    new-instance v2, Ll/gz1;

    .line 27
    .line 28
    invoke-direct {v2}, Ll/gz1;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 36
    .line 37
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 40
    .line 41
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 42
    .line 43
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 50
    .line 51
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 54
    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 68
    .line 69
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 70
    .line 71
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 72
    .line 73
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 74
    .line 75
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 76
    .line 77
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 78
    .line 79
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 82
    .line 83
    if-eqz v1, :cond_1

    .line 84
    .line 85
    new-instance v2, Ll/hz1;

    .line 86
    .line 87
    invoke-direct {v2}, Ll/hz1;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 95
    .line 96
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 97
    .line 98
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 101
    .line 102
    if-eqz v1, :cond_2

    .line 103
    .line 104
    new-instance v2, Ll/iz1;

    .line 105
    .line 106
    invoke-direct {v2}, Ll/iz1;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 114
    .line 115
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 116
    .line 117
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 118
    .line 119
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

    .line 120
    .line 121
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 124
    .line 125
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 126
    .line 127
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 128
    .line 129
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 130
    .line 131
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 132
    .line 133
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 134
    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 136
    .line 137
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 140
    .line 141
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 144
    .line 145
    if-eqz v1, :cond_3

    .line 146
    .line 147
    new-instance v2, Ll/jz1;

    .line 148
    .line 149
    invoke-direct {v2}, Ll/jz1;-><init>()V

    .line 150
    .line 151
    .line 152
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 157
    .line 158
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 159
    .line 160
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 163
    .line 164
    if-eqz p0, :cond_4

    .line 165
    .line 166
    new-instance v1, Ll/kz1;

    .line 167
    .line 168
    invoke-direct {v1}, Ll/kz1;-><init>()V

    .line 169
    .line 170
    .line 171
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 176
    .line 177
    :cond_4
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 178
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 74
    .line 75
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 76
    .line 77
    cmp-long v1, v3, v5

    .line 78
    .line 79
    if-nez v1, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 112
    .line 113
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 114
    .line 115
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_2

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_2

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    if-eqz v1, :cond_2

    .line 140
    .line 141
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 142
    .line 143
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 144
    .line 145
    cmp-long v1, v3, v5

    .line 146
    .line 147
    if-nez v1, :cond_2

    .line 148
    .line 149
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 150
    .line 151
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 152
    .line 153
    if-ne v1, v3, :cond_2

    .line 154
    .line 155
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 156
    .line 157
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 158
    .line 159
    if-ne v1, v3, :cond_2

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 162
    .line 163
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 164
    .line 165
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_2

    .line 170
    .line 171
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 172
    .line 173
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 174
    .line 175
    if-ne v1, v3, :cond_2

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 178
    .line 179
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 188
    .line 189
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

    .line 198
    .line 199
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

    .line 200
    .line 201
    cmp-long v1, v3, v5

    .line 202
    .line 203
    if-nez v1, :cond_2

    .line 204
    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 206
    .line 207
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    if-eqz v1, :cond_2

    .line 214
    .line 215
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 216
    .line 217
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 218
    .line 219
    cmp-long v1, v3, v5

    .line 220
    .line 221
    if-nez v1, :cond_2

    .line 222
    .line 223
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 224
    .line 225
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 226
    .line 227
    cmp-long v1, v3, v5

    .line 228
    .line 229
    if-nez v1, :cond_2

    .line 230
    .line 231
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 232
    .line 233
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 234
    .line 235
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    if-eqz v1, :cond_2

    .line 240
    .line 241
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 242
    .line 243
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 244
    .line 245
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    if-eqz v1, :cond_2

    .line 250
    .line 251
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 252
    .line 253
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 254
    .line 255
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-eqz v1, :cond_2

    .line 260
    .line 261
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 262
    .line 263
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 264
    .line 265
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v1

    .line 269
    if-eqz v1, :cond_2

    .line 270
    .line 271
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 272
    .line 273
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 274
    .line 275
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result p0

    .line 279
    if-eqz p0, :cond_2

    .line 280
    .line 281
    return v0

    .line 282
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveenterroom"

    .line 2
    .line 3
    return-object p0
.end method

.method public getContentText(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    sget p1, Lcom/p1/mobile/putong/live/base/R$string;->w:I

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0
.end method

.method public getMixResId()Ljava/lang/String;
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 2
    .line 3
    sget-wide v2, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->ENTER_EFFECT_V0:J

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 13
    .line 14
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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

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
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz v3, :cond_6

    .line 100
    .line 101
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    goto :goto_6

    .line 106
    :cond_6
    move v3, v2

    .line 107
    :goto_6
    add-int/2addr v0, v3

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz v3, :cond_7

    .line 113
    .line 114
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    goto :goto_7

    .line 119
    :cond_7
    move v3, v2

    .line 120
    :goto_7
    add-int/2addr v0, v3

    .line 121
    mul-int/lit8 v0, v0, 0x29

    .line 122
    .line 123
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz v3, :cond_8

    .line 126
    .line 127
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 128
    .line 129
    .line 130
    move-result v3

    .line 131
    goto :goto_8

    .line 132
    :cond_8
    move v3, v2

    .line 133
    :goto_8
    add-int/2addr v0, v3

    .line 134
    mul-int/lit8 v0, v0, 0x29

    .line 135
    .line 136
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 137
    .line 138
    if-eqz v3, :cond_9

    .line 139
    .line 140
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    goto :goto_9

    .line 145
    :cond_9
    move v3, v2

    .line 146
    :goto_9
    add-int/2addr v0, v3

    .line 147
    mul-int/lit8 v0, v0, 0x29

    .line 148
    .line 149
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 150
    .line 151
    if-eqz v3, :cond_a

    .line 152
    .line 153
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    goto :goto_a

    .line 158
    :cond_a
    move v3, v2

    .line 159
    :goto_a
    add-int/2addr v0, v3

    .line 160
    mul-int/lit8 v0, v0, 0x29

    .line 161
    .line 162
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz v3, :cond_b

    .line 165
    .line 166
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    goto :goto_b

    .line 171
    :cond_b
    move v3, v2

    .line 172
    :goto_b
    add-int/2addr v0, v3

    .line 173
    mul-int/lit8 v0, v0, 0x29

    .line 174
    .line 175
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 176
    .line 177
    ushr-long v5, v3, v1

    .line 178
    .line 179
    xor-long/2addr v3, v5

    .line 180
    long-to-int v3, v3

    .line 181
    add-int/2addr v0, v3

    .line 182
    mul-int/lit8 v0, v0, 0x29

    .line 183
    .line 184
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 185
    .line 186
    if-eqz v3, :cond_c

    .line 187
    .line 188
    const/16 v3, 0x4cf

    .line 189
    .line 190
    goto :goto_c

    .line 191
    :cond_c
    const/16 v3, 0x4d5

    .line 192
    .line 193
    :goto_c
    add-int/2addr v0, v3

    .line 194
    mul-int/lit8 v0, v0, 0x29

    .line 195
    .line 196
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 197
    .line 198
    add-int/2addr v0, v3

    .line 199
    mul-int/lit8 v0, v0, 0x29

    .line 200
    .line 201
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 202
    .line 203
    if-eqz v3, :cond_d

    .line 204
    .line 205
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    goto :goto_d

    .line 210
    :cond_d
    move v3, v2

    .line 211
    :goto_d
    add-int/2addr v0, v3

    .line 212
    mul-int/lit8 v0, v0, 0x29

    .line 213
    .line 214
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 215
    .line 216
    add-int/2addr v0, v3

    .line 217
    mul-int/lit8 v0, v0, 0x29

    .line 218
    .line 219
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 220
    .line 221
    if-eqz v3, :cond_e

    .line 222
    .line 223
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 224
    .line 225
    .line 226
    move-result v3

    .line 227
    goto :goto_e

    .line 228
    :cond_e
    move v3, v2

    .line 229
    :goto_e
    add-int/2addr v0, v3

    .line 230
    mul-int/lit8 v0, v0, 0x29

    .line 231
    .line 232
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 233
    .line 234
    if-eqz v3, :cond_f

    .line 235
    .line 236
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    goto :goto_f

    .line 241
    :cond_f
    move v3, v2

    .line 242
    :goto_f
    add-int/2addr v0, v3

    .line 243
    mul-int/lit8 v0, v0, 0x29

    .line 244
    .line 245
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

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
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 255
    .line 256
    if-eqz v3, :cond_10

    .line 257
    .line 258
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 259
    .line 260
    .line 261
    move-result v3

    .line 262
    goto :goto_10

    .line 263
    :cond_10
    move v3, v2

    .line 264
    :goto_10
    add-int/2addr v0, v3

    .line 265
    mul-int/lit8 v0, v0, 0x29

    .line 266
    .line 267
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 268
    .line 269
    ushr-long v5, v3, v1

    .line 270
    .line 271
    xor-long/2addr v3, v5

    .line 272
    long-to-int v3, v3

    .line 273
    add-int/2addr v0, v3

    .line 274
    mul-int/lit8 v0, v0, 0x29

    .line 275
    .line 276
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 277
    .line 278
    ushr-long v5, v3, v1

    .line 279
    .line 280
    xor-long/2addr v3, v5

    .line 281
    long-to-int v1, v3

    .line 282
    add-int/2addr v0, v1

    .line 283
    mul-int/lit8 v0, v0, 0x29

    .line 284
    .line 285
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 286
    .line 287
    if-eqz v1, :cond_11

    .line 288
    .line 289
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    goto :goto_11

    .line 294
    :cond_11
    move v1, v2

    .line 295
    :goto_11
    add-int/2addr v0, v1

    .line 296
    mul-int/lit8 v0, v0, 0x29

    .line 297
    .line 298
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 299
    .line 300
    if-eqz v1, :cond_12

    .line 301
    .line 302
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    goto :goto_12

    .line 307
    :cond_12
    move v1, v2

    .line 308
    :goto_12
    add-int/2addr v0, v1

    .line 309
    mul-int/lit8 v0, v0, 0x29

    .line 310
    .line 311
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 312
    .line 313
    if-eqz v1, :cond_13

    .line 314
    .line 315
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    goto :goto_13

    .line 320
    :cond_13
    move v1, v2

    .line 321
    :goto_13
    add-int/2addr v0, v1

    .line 322
    mul-int/lit8 v0, v0, 0x29

    .line 323
    .line 324
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 325
    .line 326
    if-eqz v1, :cond_14

    .line 327
    .line 328
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    goto :goto_14

    .line 333
    :cond_14
    move v1, v2

    .line 334
    :goto_14
    add-int/2addr v0, v1

    .line 335
    mul-int/lit8 v0, v0, 0x29

    .line 336
    .line 337
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 338
    .line 339
    if-eqz v1, :cond_15

    .line 340
    .line 341
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 342
    .line 343
    .line 344
    move-result v2

    .line 345
    :cond_15
    add-int/2addr v0, v2

    .line 346
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 347
    .line 348
    :cond_16
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 43
    .line 44
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 45
    .line 46
    if-nez v0, :cond_6

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 49
    .line 50
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 51
    .line 52
    if-nez v0, :cond_7

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 55
    .line 56
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 57
    .line 58
    if-nez v0, :cond_8

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 61
    .line 62
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 63
    .line 64
    if-nez v0, :cond_9

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 67
    .line 68
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 69
    .line 70
    if-nez v0, :cond_a

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 73
    .line 74
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 75
    .line 76
    if-nez v0, :cond_b

    .line 77
    .line 78
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 79
    .line 80
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 81
    .line 82
    if-nez v0, :cond_c

    .line 83
    .line 84
    new-instance v0, Ljava/util/ArrayList;

    .line 85
    .line 86
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 87
    .line 88
    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 90
    .line 91
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 92
    .line 93
    if-nez v0, :cond_d

    .line 94
    .line 95
    new-instance v0, Ljava/util/ArrayList;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 98
    .line 99
    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 101
    .line 102
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 103
    .line 104
    if-nez v0, :cond_e

    .line 105
    .line 106
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 107
    .line 108
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 109
    .line 110
    if-nez v0, :cond_f

    .line 111
    .line 112
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 113
    .line 114
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 115
    .line 116
    if-nez v0, :cond_10

    .line 117
    .line 118
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 119
    .line 120
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 121
    .line 122
    if-nez v0, :cond_11

    .line 123
    .line 124
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 125
    .line 126
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 127
    .line 128
    if-nez v0, :cond_12

    .line 129
    .line 130
    new-instance v0, Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .line 134
    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 136
    .line 137
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 138
    .line 139
    if-nez v0, :cond_13

    .line 140
    .line 141
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 142
    .line 143
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 144
    .line 145
    if-nez v0, :cond_14

    .line 146
    .line 147
    new-instance v0, Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .line 151
    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 153
    .line 154
    :cond_14
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
