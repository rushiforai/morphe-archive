.class public Lcom/p1/mobile/putong/core/data/ConversationAdditional;
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
            "Lcom/p1/mobile/putong/core/data/ConversationAdditional;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ConversationAdditional;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "conversationadditional"


# instance fields
.field public avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public blackList:Lcom/p1/mobile/putong/core/data/BlackList;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public game:Lcom/p1/mobile/putong/core/data/ConversationGame;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public previewTexts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/ConversationAdditional;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->nullCheck()V

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

    .line 343
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ConversationAdditional;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->clone()Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/TimeLimited;->clone()Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->clone()Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 45
    .line 46
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 47
    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 55
    .line 56
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 57
    .line 58
    if-eqz v1, :cond_5

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 65
    .line 66
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 67
    .line 68
    if-eqz v1, :cond_6

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->clone()Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 75
    .line 76
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 77
    .line 78
    if-eqz v1, :cond_7

    .line 79
    .line 80
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->clone()Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 85
    .line 86
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 87
    .line 88
    if-eqz v1, :cond_8

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->clone()Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 95
    .line 96
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 97
    .line 98
    if-eqz v1, :cond_9

    .line 99
    .line 100
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;->clone()Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 105
    .line 106
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 107
    .line 108
    if-eqz v1, :cond_a

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->clone()Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 115
    .line 116
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 117
    .line 118
    if-eqz v1, :cond_b

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->clone()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 125
    .line 126
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 127
    .line 128
    if-eqz v1, :cond_c

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->clone()Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 135
    .line 136
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 137
    .line 138
    if-eqz v1, :cond_d

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveActivityConversation;->clone()Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 145
    .line 146
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 147
    .line 148
    if-eqz v1, :cond_e

    .line 149
    .line 150
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationGame;->clone()Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 155
    .line 156
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 157
    .line 158
    if-eqz v1, :cond_f

    .line 159
    .line 160
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 165
    .line 166
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 167
    .line 168
    if-eqz v1, :cond_10

    .line 169
    .line 170
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 175
    .line 176
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 177
    .line 178
    if-eqz v1, :cond_11

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ContinuousChat;->clone()Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 185
    .line 186
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 187
    .line 188
    if-eqz v1, :cond_12

    .line 189
    .line 190
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->clone()Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 195
    .line 196
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 197
    .line 198
    if-eqz v1, :cond_13

    .line 199
    .line 200
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->clone()Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 201
    .line 202
    .line 203
    move-result-object v1

    .line 204
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 205
    .line 206
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 207
    .line 208
    if-eqz v1, :cond_14

    .line 209
    .line 210
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->clone()Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 211
    .line 212
    .line 213
    move-result-object v1

    .line 214
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 215
    .line 216
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 217
    .line 218
    if-eqz v1, :cond_15

    .line 219
    .line 220
    new-instance v2, Ll/v46;

    .line 221
    .line 222
    invoke-direct {v2}, Ll/v46;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 230
    .line 231
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 232
    .line 233
    if-eqz v1, :cond_16

    .line 234
    .line 235
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingInfo;->clone()Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 240
    .line 241
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 242
    .line 243
    if-eqz v1, :cond_17

    .line 244
    .line 245
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 250
    .line 251
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 252
    .line 253
    if-eqz v1, :cond_18

    .line 254
    .line 255
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LowPayOneside;->clone()Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 260
    .line 261
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 262
    .line 263
    if-eqz v1, :cond_19

    .line 264
    .line 265
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->clone()Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 266
    .line 267
    .line 268
    move-result-object v1

    .line 269
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 270
    .line 271
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 272
    .line 273
    if-eqz v1, :cond_1a

    .line 274
    .line 275
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->clone()Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 280
    .line 281
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 282
    .line 283
    if-eqz v1, :cond_1b

    .line 284
    .line 285
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->clone()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 290
    .line 291
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 292
    .line 293
    if-eqz v1, :cond_1c

    .line 294
    .line 295
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatMM;->clone()Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 300
    .line 301
    :cond_1c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 302
    .line 303
    if-eqz v1, :cond_1d

    .line 304
    .line 305
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BlackList;->clone()Lcom/p1/mobile/putong/core/data/BlackList;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 310
    .line 311
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 312
    .line 313
    if-eqz v1, :cond_1e

    .line 314
    .line 315
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageRelate;->clone()Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 320
    .line 321
    :cond_1e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 322
    .line 323
    if-eqz v1, :cond_1f

    .line 324
    .line 325
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->clone()Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 330
    .line 331
    :cond_1f
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 332
    .line 333
    if-eqz p0, :cond_20

    .line 334
    .line 335
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->clone()Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 340
    .line 341
    :cond_20
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 342
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->clone()Lcom/p1/mobile/putong/core/data/ConversationAdditional;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 186
    .line 187
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    if-eqz v1, :cond_2

    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 194
    .line 195
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 196
    .line 197
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-eqz v1, :cond_2

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 204
    .line 205
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 206
    .line 207
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-eqz v1, :cond_2

    .line 212
    .line 213
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 214
    .line 215
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 216
    .line 217
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_2

    .line 222
    .line 223
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 224
    .line 225
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 226
    .line 227
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    if-eqz v1, :cond_2

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 234
    .line 235
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 236
    .line 237
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    if-eqz v1, :cond_2

    .line 242
    .line 243
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 244
    .line 245
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 246
    .line 247
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    if-eqz v1, :cond_2

    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 254
    .line 255
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 256
    .line 257
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    if-eqz v1, :cond_2

    .line 262
    .line 263
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 264
    .line 265
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 266
    .line 267
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    if-eqz v1, :cond_2

    .line 272
    .line 273
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 274
    .line 275
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 276
    .line 277
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    if-eqz v1, :cond_2

    .line 282
    .line 283
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 284
    .line 285
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 286
    .line 287
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    if-eqz v1, :cond_2

    .line 292
    .line 293
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 294
    .line 295
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 296
    .line 297
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    if-eqz v1, :cond_2

    .line 302
    .line 303
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 304
    .line 305
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 306
    .line 307
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    if-eqz v1, :cond_2

    .line 312
    .line 313
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 314
    .line 315
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 316
    .line 317
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    if-eqz v1, :cond_2

    .line 322
    .line 323
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 324
    .line 325
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 326
    .line 327
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    if-eqz v1, :cond_2

    .line 332
    .line 333
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 334
    .line 335
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 336
    .line 337
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    if-eqz p0, :cond_2

    .line 342
    .line 343
    return v0

    .line 344
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "conversationadditional"

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
    if-nez v0, :cond_21

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/TimeLimited;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 178
    .line 179
    if-eqz v1, :cond_d

    .line 180
    .line 181
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveActivityConversation;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 191
    .line 192
    if-eqz v1, :cond_e

    .line 193
    .line 194
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationGame;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 204
    .line 205
    if-eqz v1, :cond_f

    .line 206
    .line 207
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 217
    .line 218
    if-eqz v1, :cond_10

    .line 219
    .line 220
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 230
    .line 231
    if-eqz v1, :cond_11

    .line 232
    .line 233
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ContinuousChat;->hashCode()I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    goto :goto_11

    .line 238
    :cond_11
    move v1, v2

    .line 239
    :goto_11
    add-int/2addr v0, v1

    .line 240
    mul-int/lit8 v0, v0, 0x29

    .line 241
    .line 242
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 243
    .line 244
    if-eqz v1, :cond_12

    .line 245
    .line 246
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->hashCode()I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    goto :goto_12

    .line 251
    :cond_12
    move v1, v2

    .line 252
    :goto_12
    add-int/2addr v0, v1

    .line 253
    mul-int/lit8 v0, v0, 0x29

    .line 254
    .line 255
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 256
    .line 257
    if-eqz v1, :cond_13

    .line 258
    .line 259
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->hashCode()I

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    goto :goto_13

    .line 264
    :cond_13
    move v1, v2

    .line 265
    :goto_13
    add-int/2addr v0, v1

    .line 266
    mul-int/lit8 v0, v0, 0x29

    .line 267
    .line 268
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 269
    .line 270
    if-eqz v1, :cond_14

    .line 271
    .line 272
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->hashCode()I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    goto :goto_14

    .line 277
    :cond_14
    move v1, v2

    .line 278
    :goto_14
    add-int/2addr v0, v1

    .line 279
    mul-int/lit8 v0, v0, 0x29

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 282
    .line 283
    if-eqz v1, :cond_15

    .line 284
    .line 285
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    goto :goto_15

    .line 290
    :cond_15
    move v1, v2

    .line 291
    :goto_15
    add-int/2addr v0, v1

    .line 292
    mul-int/lit8 v0, v0, 0x29

    .line 293
    .line 294
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 295
    .line 296
    if-eqz v1, :cond_16

    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GreetingInfo;->hashCode()I

    .line 299
    .line 300
    .line 301
    move-result v1

    .line 302
    goto :goto_16

    .line 303
    :cond_16
    move v1, v2

    .line 304
    :goto_16
    add-int/2addr v0, v1

    .line 305
    mul-int/lit8 v0, v0, 0x29

    .line 306
    .line 307
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 308
    .line 309
    if-eqz v1, :cond_17

    .line 310
    .line 311
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->hashCode()I

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    goto :goto_17

    .line 316
    :cond_17
    move v1, v2

    .line 317
    :goto_17
    add-int/2addr v0, v1

    .line 318
    mul-int/lit8 v0, v0, 0x29

    .line 319
    .line 320
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 321
    .line 322
    if-eqz v1, :cond_18

    .line 323
    .line 324
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LowPayOneside;->hashCode()I

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    goto :goto_18

    .line 329
    :cond_18
    move v1, v2

    .line 330
    :goto_18
    add-int/2addr v0, v1

    .line 331
    mul-int/lit8 v0, v0, 0x29

    .line 332
    .line 333
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 334
    .line 335
    if-eqz v1, :cond_19

    .line 336
    .line 337
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->hashCode()I

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    goto :goto_19

    .line 342
    :cond_19
    move v1, v2

    .line 343
    :goto_19
    add-int/2addr v0, v1

    .line 344
    mul-int/lit8 v0, v0, 0x29

    .line 345
    .line 346
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 347
    .line 348
    if-eqz v1, :cond_1a

    .line 349
    .line 350
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->hashCode()I

    .line 351
    .line 352
    .line 353
    move-result v1

    .line 354
    goto :goto_1a

    .line 355
    :cond_1a
    move v1, v2

    .line 356
    :goto_1a
    add-int/2addr v0, v1

    .line 357
    mul-int/lit8 v0, v0, 0x29

    .line 358
    .line 359
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 360
    .line 361
    if-eqz v1, :cond_1b

    .line 362
    .line 363
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->hashCode()I

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    goto :goto_1b

    .line 368
    :cond_1b
    move v1, v2

    .line 369
    :goto_1b
    add-int/2addr v0, v1

    .line 370
    mul-int/lit8 v0, v0, 0x29

    .line 371
    .line 372
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 373
    .line 374
    if-eqz v1, :cond_1c

    .line 375
    .line 376
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatMM;->hashCode()I

    .line 377
    .line 378
    .line 379
    move-result v1

    .line 380
    goto :goto_1c

    .line 381
    :cond_1c
    move v1, v2

    .line 382
    :goto_1c
    add-int/2addr v0, v1

    .line 383
    mul-int/lit8 v0, v0, 0x29

    .line 384
    .line 385
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 386
    .line 387
    if-eqz v1, :cond_1d

    .line 388
    .line 389
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BlackList;->hashCode()I

    .line 390
    .line 391
    .line 392
    move-result v1

    .line 393
    goto :goto_1d

    .line 394
    :cond_1d
    move v1, v2

    .line 395
    :goto_1d
    add-int/2addr v0, v1

    .line 396
    mul-int/lit8 v0, v0, 0x29

    .line 397
    .line 398
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 399
    .line 400
    if-eqz v1, :cond_1e

    .line 401
    .line 402
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageRelate;->hashCode()I

    .line 403
    .line 404
    .line 405
    move-result v1

    .line 406
    goto :goto_1e

    .line 407
    :cond_1e
    move v1, v2

    .line 408
    :goto_1e
    add-int/2addr v0, v1

    .line 409
    mul-int/lit8 v0, v0, 0x29

    .line 410
    .line 411
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 412
    .line 413
    if-eqz v1, :cond_1f

    .line 414
    .line 415
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->hashCode()I

    .line 416
    .line 417
    .line 418
    move-result v1

    .line 419
    goto :goto_1f

    .line 420
    :cond_1f
    move v1, v2

    .line 421
    :goto_1f
    add-int/2addr v0, v1

    .line 422
    mul-int/lit8 v0, v0, 0x29

    .line 423
    .line 424
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 425
    .line 426
    if-eqz v1, :cond_20

    .line 427
    .line 428
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->hashCode()I

    .line 429
    .line 430
    .line 431
    move-result v2

    .line 432
    :cond_20
    add-int/2addr v0, v2

    .line 433
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 434
    .line 435
    :cond_21
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->new_()Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TimeLimited;->new_()Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->new_()Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 60
    .line 61
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 62
    .line 63
    if-nez v0, :cond_6

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->new_()Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 70
    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 72
    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->new_()Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 80
    .line 81
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 82
    .line 83
    if-nez v0, :cond_8

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->new_()Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 90
    .line 91
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 92
    .line 93
    if-nez v0, :cond_9

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->new_()Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 100
    .line 101
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 102
    .line 103
    if-nez v0, :cond_a

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 110
    .line 111
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 112
    .line 113
    if-nez v0, :cond_b

    .line 114
    .line 115
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveActivityConversation;->new_()Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 120
    .line 121
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 122
    .line 123
    if-nez v0, :cond_c

    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationGame;->new_()Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 130
    .line 131
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 132
    .line 133
    if-nez v0, :cond_d

    .line 134
    .line 135
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 140
    .line 141
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 142
    .line 143
    if-nez v0, :cond_e

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 150
    .line 151
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 152
    .line 153
    if-nez v0, :cond_f

    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ContinuousChat;->new_()Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 160
    .line 161
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 162
    .line 163
    if-nez v0, :cond_10

    .line 164
    .line 165
    new-instance v0, Ljava/util/ArrayList;

    .line 166
    .line 167
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 168
    .line 169
    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 171
    .line 172
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 173
    .line 174
    if-nez v0, :cond_11

    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingInfo;->new_()Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 181
    .line 182
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 183
    .line 184
    if-nez v0, :cond_12

    .line 185
    .line 186
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 191
    .line 192
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 193
    .line 194
    if-nez v0, :cond_13

    .line 195
    .line 196
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LowPayOneside;->new_()Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 201
    .line 202
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 203
    .line 204
    if-nez v0, :cond_14

    .line 205
    .line 206
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 211
    .line 212
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 213
    .line 214
    if-nez v0, :cond_15

    .line 215
    .line 216
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->new_()Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 221
    .line 222
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 223
    .line 224
    if-nez v0, :cond_16

    .line 225
    .line 226
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 231
    .line 232
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 233
    .line 234
    if-nez v0, :cond_17

    .line 235
    .line 236
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BlackList;->new_()Lcom/p1/mobile/putong/core/data/BlackList;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 241
    .line 242
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 243
    .line 244
    if-nez v0, :cond_18

    .line 245
    .line 246
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageRelate;->new_()Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 251
    .line 252
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 253
    .line 254
    if-nez v0, :cond_19

    .line 255
    .line 256
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 261
    .line 262
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 263
    .line 264
    if-nez v0, :cond_1a

    .line 265
    .line 266
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 271
    .line 272
    :cond_1a
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
