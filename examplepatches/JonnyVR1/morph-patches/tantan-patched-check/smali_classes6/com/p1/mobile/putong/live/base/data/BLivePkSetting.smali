.class public Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;
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
            "Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivepksetting"


# instance fields
.field public entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public firstGiftOn:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public firstGiftToast:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public pkMotions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;",
            ">;"
        }
    .end annotation
.end field

.field public punishMotionSelectIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public punishmentMessage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public victoryMotionId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;)Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkPunishMotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->nullCheck()V

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

    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    new-instance v2, Ll/q42;

    .line 21
    .line 22
    invoke-direct {v2}, Ll/q42;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 30
    .line 31
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 40
    .line 41
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

    .line 46
    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    new-instance v2, Ll/r42;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/r42;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

    .line 59
    .line 60
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 69
    .line 70
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 71
    .line 72
    if-eqz v1, :cond_5

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 79
    .line 80
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

    .line 81
    .line 82
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

    .line 85
    .line 86
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

    .line 87
    .line 88
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftOn:Z

    .line 89
    .line 90
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftOn:Z

    .line 91
    .line 92
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 93
    .line 94
    if-eqz p0, :cond_6

    .line 95
    .line 96
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 101
    .line 102
    :cond_6
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftOn:Z

    .line 104
    .line 105
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftOn:Z

    .line 106
    .line 107
    if-ne v1, v3, :cond_2

    .line 108
    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 110
    .line 111
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 112
    .line 113
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_2

    .line 118
    .line 119
    return v0

    .line 120
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivepksetting"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_b

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftOn:Z

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    const/16 v1, 0x4cf

    .line 130
    .line 131
    goto :goto_9

    .line 132
    :cond_9
    const/16 v1, 0x4d5

    .line 133
    .line 134
    :goto_9
    add-int/2addr v0, v1

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 138
    .line 139
    if-eqz v1, :cond_a

    .line 140
    .line 141
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    :cond_a
    add-int/2addr v0, v2

    .line 146
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 147
    .line 148
    :cond_b
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->entranceShowLimit:Lcom/p1/mobile/putong/live/base/data/BLivePkEntranceShowLimit;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->pkMotions:Ljava/util/List;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->startShowMessage:Lcom/p1/mobile/putong/live/base/data/BLivePkStartMessage;

    .line 31
    .line 32
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

    .line 33
    .line 34
    const-string v1, ""

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->victoryMotionId:Ljava/lang/String;

    .line 39
    .line 40
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

    .line 41
    .line 42
    if-nez v0, :cond_4

    .line 43
    .line 44
    new-instance v0, Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishMotionSelectIds:Ljava/util/List;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->quitPkMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 60
    .line 61
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 62
    .line 63
    if-nez v0, :cond_6

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->stopLiveMessages:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPkMessages;

    .line 70
    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

    .line 72
    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->punishmentMessage:Ljava/lang/String;

    .line 76
    .line 77
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

    .line 78
    .line 79
    if-nez v0, :cond_8

    .line 80
    .line 81
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->firstGiftToast:Ljava/lang/String;

    .line 82
    .line 83
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 84
    .line 85
    if-nez v0, :cond_9

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->winTimesTag:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 92
    .line 93
    :cond_9
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSetting;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
