.class public Lcom/p1/mobile/putong/data/Extensions;
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
            "Lcom/p1/mobile/putong/data/Extensions;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/Extensions;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "extensions"


# instance fields
.field public anonymity:Lcom/p1/mobile/putong/data/Anonymity;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public business:Lcom/p1/mobile/putong/data/Business;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public game:Lcom/p1/mobile/putong/data/ExtensionGame;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public headFrame:Lcom/p1/mobile/putong/data/HeadFrame;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public interest:Lcom/p1/mobile/putong/data/Interest;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public mate:Lcom/p1/mobile/putong/data/ProfileMate;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public pet:Lcom/p1/mobile/putong/data/PetInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public physical:Lcom/p1/mobile/putong/data/Physical;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public tailFrame:Lcom/p1/mobile/putong/data/TailFrame;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public wealth:Lcom/p1/mobile/putong/data/UserWealth;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Extensions$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Extensions$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/Extensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/Extensions$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Extensions$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/Extensions;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/Extensions;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Extensions;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Extensions;->nullCheck()V

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

    .line 188
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Extensions;->clone()Lcom/p1/mobile/putong/data/Extensions;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/Extensions;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Extensions;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Physical;->clone()Lcom/p1/mobile/putong/data/Physical;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Business;->clone()Lcom/p1/mobile/putong/data/Business;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Interest;->clone()Lcom/p1/mobile/putong/data/Interest;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->clone()Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 45
    .line 46
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 47
    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Anonymity;->clone()Lcom/p1/mobile/putong/data/Anonymity;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 55
    .line 56
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 57
    .line 58
    if-eqz v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/HeadFrame;->clone()Lcom/p1/mobile/putong/data/HeadFrame;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 65
    .line 66
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 67
    .line 68
    if-eqz v1, :cond_6

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FriendStatus;->clone()Lcom/p1/mobile/putong/data/FriendStatus;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 75
    .line 76
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 77
    .line 78
    if-eqz v1, :cond_7

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MomentSwitch;->clone()Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 85
    .line 86
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 87
    .line 88
    if-eqz v1, :cond_8

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserWealth;->clone()Lcom/p1/mobile/putong/data/UserWealth;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 95
    .line 96
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 97
    .line 98
    if-eqz v1, :cond_9

    .line 99
    .line 100
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileCompletion;->clone()Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 105
    .line 106
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 107
    .line 108
    if-eqz v1, :cond_a

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VoiceSignature;->clone()Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 115
    .line 116
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 117
    .line 118
    if-eqz v1, :cond_b

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->clone()Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 125
    .line 126
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 127
    .line 128
    if-eqz v1, :cond_c

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileMate;->clone()Lcom/p1/mobile/putong/data/ProfileMate;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 135
    .line 136
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 137
    .line 138
    if-eqz v1, :cond_d

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PetInfo;->clone()Lcom/p1/mobile/putong/data/PetInfo;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 145
    .line 146
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 147
    .line 148
    if-eqz v1, :cond_e

    .line 149
    .line 150
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/TailFrame;->clone()Lcom/p1/mobile/putong/data/TailFrame;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 155
    .line 156
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 157
    .line 158
    if-eqz v1, :cond_f

    .line 159
    .line 160
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->clone()Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 165
    .line 166
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 167
    .line 168
    if-eqz v1, :cond_10

    .line 169
    .line 170
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->clone()Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 175
    .line 176
    :cond_10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 177
    .line 178
    if-eqz p0, :cond_11

    .line 179
    .line 180
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/ExtensionGame;->clone()Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 185
    .line 186
    :cond_11
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 187
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Extensions;->clone()Lcom/p1/mobile/putong/data/Extensions;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/Extensions;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 106
    .line 107
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 116
    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 126
    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 136
    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 176
    .line 177
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_2

    .line 182
    .line 183
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 184
    .line 185
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 186
    .line 187
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    if-eqz p0, :cond_2

    .line 192
    .line 193
    return v0

    .line 194
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "extensions"

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
    if-nez v0, :cond_12

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Physical;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Business;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Interest;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Anonymity;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/HeadFrame;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FriendStatus;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MomentSwitch;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserWealth;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileCompletion;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_9

    .line 134
    :cond_9
    move v1, v2

    .line 135
    :goto_9
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VoiceSignature;->hashCode()I

    .line 143
    .line 144
    .line 145
    move-result v1

    .line 146
    goto :goto_a

    .line 147
    :cond_a
    move v1, v2

    .line 148
    :goto_a
    add-int/2addr v0, v1

    .line 149
    mul-int/lit8 v0, v0, 0x29

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    goto :goto_b

    .line 160
    :cond_b
    move v1, v2

    .line 161
    :goto_b
    add-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileMate;->hashCode()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    goto :goto_c

    .line 173
    :cond_c
    move v1, v2

    .line 174
    :goto_c
    add-int/2addr v0, v1

    .line 175
    mul-int/lit8 v0, v0, 0x29

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 178
    .line 179
    if-eqz v1, :cond_d

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PetInfo;->hashCode()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    goto :goto_d

    .line 186
    :cond_d
    move v1, v2

    .line 187
    :goto_d
    add-int/2addr v0, v1

    .line 188
    mul-int/lit8 v0, v0, 0x29

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 191
    .line 192
    if-eqz v1, :cond_e

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/TailFrame;->hashCode()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    goto :goto_e

    .line 199
    :cond_e
    move v1, v2

    .line 200
    :goto_e
    add-int/2addr v0, v1

    .line 201
    mul-int/lit8 v0, v0, 0x29

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 204
    .line 205
    if-eqz v1, :cond_f

    .line 206
    .line 207
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->hashCode()I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    goto :goto_f

    .line 212
    :cond_f
    move v1, v2

    .line 213
    :goto_f
    add-int/2addr v0, v1

    .line 214
    mul-int/lit8 v0, v0, 0x29

    .line 215
    .line 216
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 217
    .line 218
    if-eqz v1, :cond_10

    .line 219
    .line 220
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->hashCode()I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    goto :goto_10

    .line 225
    :cond_10
    move v1, v2

    .line 226
    :goto_10
    add-int/2addr v0, v1

    .line 227
    mul-int/lit8 v0, v0, 0x29

    .line 228
    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 230
    .line 231
    if-eqz v1, :cond_11

    .line 232
    .line 233
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ExtensionGame;->hashCode()I

    .line 234
    .line 235
    .line 236
    move-result v2

    .line 237
    :cond_11
    add-int/2addr v0, v2

    .line 238
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 239
    .line 240
    :cond_12
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/Physical;->new_()Lcom/p1/mobile/putong/data/Physical;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/data/Business;->new_()Lcom/p1/mobile/putong/data/Business;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/Interest;->new_()Lcom/p1/mobile/putong/data/Interest;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->new_()Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/data/Anonymity;->new_()Lcom/p1/mobile/putong/data/Anonymity;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/data/HeadFrame;->new_()Lcom/p1/mobile/putong/data/HeadFrame;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 60
    .line 61
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 62
    .line 63
    if-nez v0, :cond_6

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/data/FriendStatus;->new_()Lcom/p1/mobile/putong/data/FriendStatus;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 70
    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 72
    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/data/MomentSwitch;->new_()Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 80
    .line 81
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 82
    .line 83
    if-nez v0, :cond_8

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/data/UserWealth;->new_()Lcom/p1/mobile/putong/data/UserWealth;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 90
    .line 91
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 92
    .line 93
    if-nez v0, :cond_9

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileCompletion;->new_()Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 100
    .line 101
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 102
    .line 103
    if-nez v0, :cond_a

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceSignature;->new_()Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 110
    .line 111
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 112
    .line 113
    if-nez v0, :cond_b

    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 120
    .line 121
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 122
    .line 123
    if-nez v0, :cond_c

    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileMate;->new_()Lcom/p1/mobile/putong/data/ProfileMate;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 130
    .line 131
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 132
    .line 133
    if-nez v0, :cond_d

    .line 134
    .line 135
    invoke-static {}, Lcom/p1/mobile/putong/data/PetInfo;->new_()Lcom/p1/mobile/putong/data/PetInfo;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 140
    .line 141
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 142
    .line 143
    if-nez v0, :cond_e

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/data/TailFrame;->new_()Lcom/p1/mobile/putong/data/TailFrame;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 150
    .line 151
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 152
    .line 153
    if-nez v0, :cond_f

    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->new_()Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 160
    .line 161
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 162
    .line 163
    if-nez v0, :cond_10

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->new_()Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 170
    .line 171
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 172
    .line 173
    if-nez v0, :cond_11

    .line 174
    .line 175
    invoke-static {}, Lcom/p1/mobile/putong/data/ExtensionGame;->new_()Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 180
    .line 181
    :cond_11
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/data/Extensions;)Lcom/p1/mobile/putong/data/Extensions;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Extensions;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/Interest;->subtract(Lcom/p1/mobile/putong/data/Interest;)Lcom/p1/mobile/putong/data/Interest;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 45
    .line 46
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 51
    .line 52
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->subtract(Lcom/p1/mobile/putong/data/ProfileExtensionBasic;)Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 57
    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 63
    .line 64
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/Anonymity;->subtract(Lcom/p1/mobile/putong/data/Anonymity;)Lcom/p1/mobile/putong/data/Anonymity;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 69
    .line 70
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 71
    .line 72
    if-eqz v1, :cond_5

    .line 73
    .line 74
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/HeadFrame;->subtract(Lcom/p1/mobile/putong/data/HeadFrame;)Lcom/p1/mobile/putong/data/HeadFrame;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 81
    .line 82
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 83
    .line 84
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 85
    .line 86
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-nez v1, :cond_6

    .line 91
    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 93
    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 95
    .line 96
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 97
    .line 98
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 99
    .line 100
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_7

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 107
    .line 108
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 109
    .line 110
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 111
    .line 112
    if-eqz v1, :cond_8

    .line 113
    .line 114
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/UserWealth;->subtract(Lcom/p1/mobile/putong/data/UserWealth;)Lcom/p1/mobile/putong/data/UserWealth;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 121
    .line 122
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 123
    .line 124
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 125
    .line 126
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_9

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 133
    .line 134
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 135
    .line 136
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 137
    .line 138
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 139
    .line 140
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-nez v1, :cond_a

    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 147
    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 149
    .line 150
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 151
    .line 152
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 153
    .line 154
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    if-nez v1, :cond_b

    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 161
    .line 162
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 163
    .line 164
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 165
    .line 166
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 167
    .line 168
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    if-nez v1, :cond_c

    .line 173
    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 175
    .line 176
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 177
    .line 178
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 179
    .line 180
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 181
    .line 182
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-nez v1, :cond_d

    .line 187
    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 189
    .line 190
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 191
    .line 192
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 193
    .line 194
    if-eqz v1, :cond_e

    .line 195
    .line 196
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 197
    .line 198
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/TailFrame;->subtract(Lcom/p1/mobile/putong/data/TailFrame;)Lcom/p1/mobile/putong/data/TailFrame;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 203
    .line 204
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 205
    .line 206
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 207
    .line 208
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    if-nez v1, :cond_f

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 215
    .line 216
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 217
    .line 218
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 219
    .line 220
    if-eqz v1, :cond_10

    .line 221
    .line 222
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 223
    .line 224
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->subtract(Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;)Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 229
    .line 230
    :cond_10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 231
    .line 232
    if-eqz p0, :cond_11

    .line 233
    .line 234
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 235
    .line 236
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/ExtensionGame;->subtract(Lcom/p1/mobile/putong/data/ExtensionGame;)Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 241
    .line 242
    :cond_11
    new-instance p0, Lcom/p1/mobile/putong/data/Extensions;

    .line 243
    .line 244
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/Extensions;->equals(Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    if-eqz p0, :cond_12

    .line 252
    .line 253
    const/4 p0, 0x0

    .line 254
    return-object p0

    .line 255
    :cond_12
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/Extensions;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
