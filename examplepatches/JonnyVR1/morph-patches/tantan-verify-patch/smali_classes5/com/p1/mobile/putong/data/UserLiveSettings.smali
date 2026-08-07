.class public Lcom/p1/mobile/putong/data/UserLiveSettings;
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
            "Lcom/p1/mobile/putong/data/UserLiveSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/UserLiveSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "userlivesettings"


# instance fields
.field public closeEnterRoomMsg:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public closeSmallWindow:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public fakeId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public hideDiamondTag:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public hideMomentsWealthTag:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public hideProfileWealthTag:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public hideStoppedRoom:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public hideSwipeWealthTag:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public hideVoiceOnCall:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public intlAdUser:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public isDiamondVIP:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public pureModeGroup:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public regionTag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public showVoiceStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public teenModeEnable:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public voiceNotification:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public voiceWindowEnable:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public wealthGrade:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserLiveSettings$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserLiveSettings$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/UserLiveSettings$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserLiveSettings$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/UserLiveSettings;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserLiveSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/UserLiveSettings;->nullCheck()V

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

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserLiveSettings;->clone()Lcom/p1/mobile/putong/data/UserLiveSettings;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/UserLiveSettings;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserLiveSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 43
    .line 44
    iput v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 75
    .line 76
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 77
    .line 78
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserLiveSettings;->clone()Lcom/p1/mobile/putong/data/UserLiveSettings;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 104
    .line 105
    iget v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 106
    .line 107
    if-ne v1, v3, :cond_2

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 142
    .line 143
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_2

    .line 148
    .line 149
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 152
    .line 153
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    if-eqz v1, :cond_2

    .line 158
    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 160
    .line 161
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 162
    .line 163
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result v1

    .line 167
    if-eqz v1, :cond_2

    .line 168
    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_2

    .line 178
    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-eqz p0, :cond_2

    .line 188
    .line 189
    return v0

    .line 190
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "userlivesettings"

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
    if-nez v0, :cond_11

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->wealthGrade:I

    .line 126
    .line 127
    add-int/2addr v0, v1

    .line 128
    mul-int/lit8 v0, v0, 0x29

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 131
    .line 132
    if-eqz v1, :cond_9

    .line 133
    .line 134
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 144
    .line 145
    if-eqz v1, :cond_a

    .line 146
    .line 147
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 157
    .line 158
    if-eqz v1, :cond_b

    .line 159
    .line 160
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 170
    .line 171
    if-eqz v1, :cond_c

    .line 172
    .line 173
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    goto :goto_c

    .line 178
    :cond_c
    move v1, v2

    .line 179
    :goto_c
    add-int/2addr v0, v1

    .line 180
    mul-int/lit8 v0, v0, 0x29

    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 183
    .line 184
    if-eqz v1, :cond_d

    .line 185
    .line 186
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    goto :goto_d

    .line 191
    :cond_d
    move v1, v2

    .line 192
    :goto_d
    add-int/2addr v0, v1

    .line 193
    mul-int/lit8 v0, v0, 0x29

    .line 194
    .line 195
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 196
    .line 197
    if-eqz v1, :cond_e

    .line 198
    .line 199
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    goto :goto_e

    .line 204
    :cond_e
    move v1, v2

    .line 205
    :goto_e
    add-int/2addr v0, v1

    .line 206
    mul-int/lit8 v0, v0, 0x29

    .line 207
    .line 208
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 209
    .line 210
    if-eqz v1, :cond_f

    .line 211
    .line 212
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    goto :goto_f

    .line 217
    :cond_f
    move v1, v2

    .line 218
    :goto_f
    add-int/2addr v0, v1

    .line 219
    mul-int/lit8 v0, v0, 0x29

    .line 220
    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 222
    .line 223
    if-eqz v1, :cond_10

    .line 224
    .line 225
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    :cond_10
    add-int/2addr v0, v2

    .line 230
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 231
    .line 232
    :cond_11
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeEnterRoomMsg:Ljava/lang/Boolean;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->closeSmallWindow:Ljava/lang/Boolean;

    .line 16
    .line 17
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->teenModeEnable:Ljava/lang/Boolean;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->intlAdUser:Ljava/lang/Boolean;

    .line 32
    .line 33
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 34
    .line 35
    const-string v1, ""

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->regionTag:Ljava/lang/String;

    .line 40
    .line 41
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 42
    .line 43
    if-nez v0, :cond_5

    .line 44
    .line 45
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceWindowEnable:Ljava/lang/Boolean;

    .line 48
    .line 49
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_6

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->fakeId:Ljava/lang/String;

    .line 54
    .line 55
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 56
    .line 57
    if-nez v0, :cond_7

    .line 58
    .line 59
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideStoppedRoom:Ljava/lang/Boolean;

    .line 62
    .line 63
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 64
    .line 65
    if-nez v0, :cond_8

    .line 66
    .line 67
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideVoiceOnCall:Ljava/lang/Boolean;

    .line 70
    .line 71
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 72
    .line 73
    if-nez v0, :cond_9

    .line 74
    .line 75
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideMomentsWealthTag:Ljava/lang/Boolean;

    .line 78
    .line 79
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 80
    .line 81
    if-nez v0, :cond_a

    .line 82
    .line 83
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideProfileWealthTag:Ljava/lang/Boolean;

    .line 86
    .line 87
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 88
    .line 89
    if-nez v0, :cond_b

    .line 90
    .line 91
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideSwipeWealthTag:Ljava/lang/Boolean;

    .line 94
    .line 95
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 96
    .line 97
    if-nez v0, :cond_c

    .line 98
    .line 99
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 100
    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 102
    .line 103
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 104
    .line 105
    if-nez v0, :cond_d

    .line 106
    .line 107
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 110
    .line 111
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 112
    .line 113
    if-nez v0, :cond_e

    .line 114
    .line 115
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 116
    .line 117
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 118
    .line 119
    if-nez v0, :cond_f

    .line 120
    .line 121
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->showVoiceStatus:Ljava/lang/String;

    .line 122
    .line 123
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 124
    .line 125
    if-nez v0, :cond_10

    .line 126
    .line 127
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->voiceNotification:Ljava/lang/String;

    .line 128
    .line 129
    :cond_10
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
