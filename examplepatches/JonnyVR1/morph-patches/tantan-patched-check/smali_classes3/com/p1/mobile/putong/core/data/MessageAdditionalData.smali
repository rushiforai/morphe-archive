.class public Lcom/p1/mobile/putong/core/data/MessageAdditionalData;
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
            "Lcom/p1/mobile/putong/core/data/MessageAdditionalData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MessageAdditionalData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "messageadditionaldata"


# instance fields
.field public aiChatGuideType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation
.end field

.field public aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public callee:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public caller:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public chatAssistantQuestions:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;",
            ">;"
        }
    .end annotation
.end field

.field public chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public coinSign:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation
.end field

.field public consumeType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public contact:Lcom/p1/mobile/putong/core/data/MessageContact;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public contactInfoRequestMessageId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public duration:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public forceSend:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public href:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public iceBreakQuestionID:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public localBreakIce:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/BreakIce;",
            ">;"
        }
    .end annotation
.end field

.field public localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public questionResult:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/QuestionResult;",
            ">;"
        }
    .end annotation
.end field

.field public song:Lcom/p1/mobile/putong/core/data/MessageMusic;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;)Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->clone()Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/QuestionResult;)Lcom/p1/mobile/putong/core/data/QuestionResult;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/QuestionResult;->clone()Lcom/p1/mobile/putong/core/data/QuestionResult;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/BreakIce;)Lcom/p1/mobile/putong/core/data/BreakIce;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/BreakIce;->clone()Lcom/p1/mobile/putong/core/data/BreakIce;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->nullCheck()V

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

    .line 357
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->clone()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/NewQuestion;->clone()Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 39
    .line 40
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;->clone()Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 49
    .line 50
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    .line 51
    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    new-instance v2, Ll/iwy;

    .line 55
    .line 56
    invoke-direct {v2}, Ll/iwy;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    .line 64
    .line 65
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 66
    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->clone()Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 74
    .line 75
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    .line 76
    .line 77
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 80
    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 88
    .line 89
    if-eqz v1, :cond_4

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageContact;->clone()Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 96
    .line 97
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 98
    .line 99
    if-eqz v1, :cond_5

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;->clone()Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 106
    .line 107
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 108
    .line 109
    if-eqz v1, :cond_6

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageMusic;->clone()Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 116
    .line 117
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 118
    .line 119
    if-eqz v1, :cond_7

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationNotification;->clone()Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 126
    .line 127
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 128
    .line 129
    if-eqz v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->clone()Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 136
    .line 137
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 138
    .line 139
    if-eqz v1, :cond_9

    .line 140
    .line 141
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->clone()Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 146
    .line 147
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 148
    .line 149
    if-eqz v1, :cond_a

    .line 150
    .line 151
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GroupInvitation;->clone()Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 156
    .line 157
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 158
    .line 159
    if-eqz v1, :cond_b

    .line 160
    .line 161
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;->clone()Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 166
    .line 167
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 168
    .line 169
    if-eqz v1, :cond_c

    .line 170
    .line 171
    new-instance v2, Ll/jwy;

    .line 172
    .line 173
    invoke-direct {v2}, Ll/jwy;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 181
    .line 182
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 183
    .line 184
    if-eqz v1, :cond_d

    .line 185
    .line 186
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->clone()Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 191
    .line 192
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 193
    .line 194
    if-eqz v1, :cond_e

    .line 195
    .line 196
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ExchangePicture;->clone()Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 197
    .line 198
    .line 199
    move-result-object v1

    .line 200
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 201
    .line 202
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 203
    .line 204
    if-eqz v1, :cond_f

    .line 205
    .line 206
    new-instance v2, Ll/kwy;

    .line 207
    .line 208
    invoke-direct {v2}, Ll/kwy;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 216
    .line 217
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 218
    .line 219
    if-eqz v1, :cond_10

    .line 220
    .line 221
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatTips;->clone()Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 226
    .line 227
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 228
    .line 229
    if-eqz v1, :cond_11

    .line 230
    .line 231
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;->clone()Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 236
    .line 237
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 238
    .line 239
    if-eqz v1, :cond_12

    .line 240
    .line 241
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AiPicture;->clone()Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 246
    .line 247
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 248
    .line 249
    if-eqz v1, :cond_13

    .line 250
    .line 251
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->clone()Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 256
    .line 257
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 258
    .line 259
    if-eqz v1, :cond_14

    .line 260
    .line 261
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->clone()Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 266
    .line 267
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 268
    .line 269
    if-eqz v1, :cond_15

    .line 270
    .line 271
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SystemReminder;->clone()Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 272
    .line 273
    .line 274
    move-result-object v1

    .line 275
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 276
    .line 277
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 278
    .line 279
    if-eqz v1, :cond_16

    .line 280
    .line 281
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LimitTimePicture;->clone()Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 286
    .line 287
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 288
    .line 289
    if-eqz v1, :cond_17

    .line 290
    .line 291
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CommonTipBox;->clone()Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 292
    .line 293
    .line 294
    move-result-object v1

    .line 295
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 296
    .line 297
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakQuestionID:Ljava/lang/String;

    .line 298
    .line 299
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakQuestionID:Ljava/lang/String;

    .line 300
    .line 301
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 302
    .line 303
    if-eqz v1, :cond_18

    .line 304
    .line 305
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Questionnaire;->clone()Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 310
    .line 311
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 312
    .line 313
    if-eqz v1, :cond_19

    .line 314
    .line 315
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->clone()Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 320
    .line 321
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 322
    .line 323
    if-eqz v1, :cond_1a

    .line 324
    .line 325
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->clone()Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 330
    .line 331
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 332
    .line 333
    if-eqz v1, :cond_1b

    .line 334
    .line 335
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->clone()Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 340
    .line 341
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 342
    .line 343
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 344
    .line 345
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 346
    .line 347
    if-eqz p0, :cond_1c

    .line 348
    .line 349
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;->clone()Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 350
    .line 351
    .line 352
    move-result-object p0

    .line 353
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 354
    .line 355
    :cond_1c
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 356
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->clone()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    .line 114
    .line 115
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    .line 116
    .line 117
    if-ne v1, v3, :cond_2

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 160
    .line 161
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 180
    .line 181
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 182
    .line 183
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    if-eqz v1, :cond_2

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 190
    .line 191
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 192
    .line 193
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-eqz v1, :cond_2

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 200
    .line 201
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 210
    .line 211
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 212
    .line 213
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    if-eqz v1, :cond_2

    .line 218
    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 220
    .line 221
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 222
    .line 223
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eqz v1, :cond_2

    .line 228
    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 230
    .line 231
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 232
    .line 233
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    if-eqz v1, :cond_2

    .line 238
    .line 239
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 240
    .line 241
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 242
    .line 243
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    if-eqz v1, :cond_2

    .line 248
    .line 249
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 250
    .line 251
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 252
    .line 253
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    if-eqz v1, :cond_2

    .line 258
    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 260
    .line 261
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 262
    .line 263
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    if-eqz v1, :cond_2

    .line 268
    .line 269
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 270
    .line 271
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 272
    .line 273
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    if-eqz v1, :cond_2

    .line 278
    .line 279
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 280
    .line 281
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 282
    .line 283
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    if-eqz v1, :cond_2

    .line 288
    .line 289
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 290
    .line 291
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 292
    .line 293
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v1

    .line 297
    if-eqz v1, :cond_2

    .line 298
    .line 299
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 300
    .line 301
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 302
    .line 303
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result v1

    .line 307
    if-eqz v1, :cond_2

    .line 308
    .line 309
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 310
    .line 311
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 312
    .line 313
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    move-result v1

    .line 317
    if-eqz v1, :cond_2

    .line 318
    .line 319
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 320
    .line 321
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 322
    .line 323
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    if-eqz v1, :cond_2

    .line 328
    .line 329
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 330
    .line 331
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 332
    .line 333
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    if-eqz v1, :cond_2

    .line 338
    .line 339
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakQuestionID:Ljava/lang/String;

    .line 340
    .line 341
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakQuestionID:Ljava/lang/String;

    .line 342
    .line 343
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    if-eqz v1, :cond_2

    .line 348
    .line 349
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 350
    .line 351
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 352
    .line 353
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 354
    .line 355
    .line 356
    move-result v1

    .line 357
    if-eqz v1, :cond_2

    .line 358
    .line 359
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 360
    .line 361
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 362
    .line 363
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    move-result v1

    .line 367
    if-eqz v1, :cond_2

    .line 368
    .line 369
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 370
    .line 371
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 372
    .line 373
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    move-result v1

    .line 377
    if-eqz v1, :cond_2

    .line 378
    .line 379
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 380
    .line 381
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 382
    .line 383
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    if-eqz v1, :cond_2

    .line 388
    .line 389
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 390
    .line 391
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 392
    .line 393
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    move-result v1

    .line 397
    if-eqz v1, :cond_2

    .line 398
    .line 399
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 400
    .line 401
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 402
    .line 403
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 404
    .line 405
    .line 406
    move-result p0

    .line 407
    if-eqz p0, :cond_2

    .line 408
    .line 409
    return v0

    .line 410
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "messageadditionaldata"

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
    if-nez v0, :cond_28

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/NewQuestion;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    const/16 v1, 0x4cf

    .line 143
    .line 144
    goto :goto_a

    .line 145
    :cond_a
    const/16 v1, 0x4d5

    .line 146
    .line 147
    :goto_a
    add-int/2addr v0, v1

    .line 148
    mul-int/lit8 v0, v0, 0x29

    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 151
    .line 152
    if-eqz v1, :cond_b

    .line 153
    .line 154
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    goto :goto_b

    .line 159
    :cond_b
    move v1, v2

    .line 160
    :goto_b
    add-int/2addr v0, v1

    .line 161
    mul-int/lit8 v0, v0, 0x29

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 164
    .line 165
    if-eqz v1, :cond_c

    .line 166
    .line 167
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    goto :goto_c

    .line 172
    :cond_c
    move v1, v2

    .line 173
    :goto_c
    add-int/2addr v0, v1

    .line 174
    mul-int/lit8 v0, v0, 0x29

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 177
    .line 178
    if-eqz v1, :cond_d

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageContact;->hashCode()I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    goto :goto_d

    .line 185
    :cond_d
    move v1, v2

    .line 186
    :goto_d
    add-int/2addr v0, v1

    .line 187
    mul-int/lit8 v0, v0, 0x29

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 190
    .line 191
    if-eqz v1, :cond_e

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;->hashCode()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    goto :goto_e

    .line 198
    :cond_e
    move v1, v2

    .line 199
    :goto_e
    add-int/2addr v0, v1

    .line 200
    mul-int/lit8 v0, v0, 0x29

    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 203
    .line 204
    if-eqz v1, :cond_f

    .line 205
    .line 206
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageMusic;->hashCode()I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    goto :goto_f

    .line 211
    :cond_f
    move v1, v2

    .line 212
    :goto_f
    add-int/2addr v0, v1

    .line 213
    mul-int/lit8 v0, v0, 0x29

    .line 214
    .line 215
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 216
    .line 217
    if-eqz v1, :cond_10

    .line 218
    .line 219
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ConversationNotification;->hashCode()I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    goto :goto_10

    .line 224
    :cond_10
    move v1, v2

    .line 225
    :goto_10
    add-int/2addr v0, v1

    .line 226
    mul-int/lit8 v0, v0, 0x29

    .line 227
    .line 228
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 229
    .line 230
    if-eqz v1, :cond_11

    .line 231
    .line 232
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->hashCode()I

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    goto :goto_11

    .line 237
    :cond_11
    move v1, v2

    .line 238
    :goto_11
    add-int/2addr v0, v1

    .line 239
    mul-int/lit8 v0, v0, 0x29

    .line 240
    .line 241
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 242
    .line 243
    if-eqz v1, :cond_12

    .line 244
    .line 245
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->hashCode()I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    goto :goto_12

    .line 250
    :cond_12
    move v1, v2

    .line 251
    :goto_12
    add-int/2addr v0, v1

    .line 252
    mul-int/lit8 v0, v0, 0x29

    .line 253
    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 255
    .line 256
    if-eqz v1, :cond_13

    .line 257
    .line 258
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GroupInvitation;->hashCode()I

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    goto :goto_13

    .line 263
    :cond_13
    move v1, v2

    .line 264
    :goto_13
    add-int/2addr v0, v1

    .line 265
    mul-int/lit8 v0, v0, 0x29

    .line 266
    .line 267
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 268
    .line 269
    if-eqz v1, :cond_14

    .line 270
    .line 271
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;->hashCode()I

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    goto :goto_14

    .line 276
    :cond_14
    move v1, v2

    .line 277
    :goto_14
    add-int/2addr v0, v1

    .line 278
    mul-int/lit8 v0, v0, 0x29

    .line 279
    .line 280
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 281
    .line 282
    if-eqz v1, :cond_15

    .line 283
    .line 284
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    goto :goto_15

    .line 289
    :cond_15
    move v1, v2

    .line 290
    :goto_15
    add-int/2addr v0, v1

    .line 291
    mul-int/lit8 v0, v0, 0x29

    .line 292
    .line 293
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 294
    .line 295
    if-eqz v1, :cond_16

    .line 296
    .line 297
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->hashCode()I

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    goto :goto_16

    .line 302
    :cond_16
    move v1, v2

    .line 303
    :goto_16
    add-int/2addr v0, v1

    .line 304
    mul-int/lit8 v0, v0, 0x29

    .line 305
    .line 306
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 307
    .line 308
    if-eqz v1, :cond_17

    .line 309
    .line 310
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ExchangePicture;->hashCode()I

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    goto :goto_17

    .line 315
    :cond_17
    move v1, v2

    .line 316
    :goto_17
    add-int/2addr v0, v1

    .line 317
    mul-int/lit8 v0, v0, 0x29

    .line 318
    .line 319
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 320
    .line 321
    if-eqz v1, :cond_18

    .line 322
    .line 323
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    goto :goto_18

    .line 328
    :cond_18
    move v1, v2

    .line 329
    :goto_18
    add-int/2addr v0, v1

    .line 330
    mul-int/lit8 v0, v0, 0x29

    .line 331
    .line 332
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 333
    .line 334
    if-eqz v1, :cond_19

    .line 335
    .line 336
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatTips;->hashCode()I

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    goto :goto_19

    .line 341
    :cond_19
    move v1, v2

    .line 342
    :goto_19
    add-int/2addr v0, v1

    .line 343
    mul-int/lit8 v0, v0, 0x29

    .line 344
    .line 345
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 346
    .line 347
    if-eqz v1, :cond_1a

    .line 348
    .line 349
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;->hashCode()I

    .line 350
    .line 351
    .line 352
    move-result v1

    .line 353
    goto :goto_1a

    .line 354
    :cond_1a
    move v1, v2

    .line 355
    :goto_1a
    add-int/2addr v0, v1

    .line 356
    mul-int/lit8 v0, v0, 0x29

    .line 357
    .line 358
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 359
    .line 360
    if-eqz v1, :cond_1b

    .line 361
    .line 362
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AiPicture;->hashCode()I

    .line 363
    .line 364
    .line 365
    move-result v1

    .line 366
    goto :goto_1b

    .line 367
    :cond_1b
    move v1, v2

    .line 368
    :goto_1b
    add-int/2addr v0, v1

    .line 369
    mul-int/lit8 v0, v0, 0x29

    .line 370
    .line 371
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 372
    .line 373
    if-eqz v1, :cond_1c

    .line 374
    .line 375
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->hashCode()I

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    goto :goto_1c

    .line 380
    :cond_1c
    move v1, v2

    .line 381
    :goto_1c
    add-int/2addr v0, v1

    .line 382
    mul-int/lit8 v0, v0, 0x29

    .line 383
    .line 384
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 385
    .line 386
    if-eqz v1, :cond_1d

    .line 387
    .line 388
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->hashCode()I

    .line 389
    .line 390
    .line 391
    move-result v1

    .line 392
    goto :goto_1d

    .line 393
    :cond_1d
    move v1, v2

    .line 394
    :goto_1d
    add-int/2addr v0, v1

    .line 395
    mul-int/lit8 v0, v0, 0x29

    .line 396
    .line 397
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 398
    .line 399
    if-eqz v1, :cond_1e

    .line 400
    .line 401
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/SystemReminder;->hashCode()I

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    goto :goto_1e

    .line 406
    :cond_1e
    move v1, v2

    .line 407
    :goto_1e
    add-int/2addr v0, v1

    .line 408
    mul-int/lit8 v0, v0, 0x29

    .line 409
    .line 410
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 411
    .line 412
    if-eqz v1, :cond_1f

    .line 413
    .line 414
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LimitTimePicture;->hashCode()I

    .line 415
    .line 416
    .line 417
    move-result v1

    .line 418
    goto :goto_1f

    .line 419
    :cond_1f
    move v1, v2

    .line 420
    :goto_1f
    add-int/2addr v0, v1

    .line 421
    mul-int/lit8 v0, v0, 0x29

    .line 422
    .line 423
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 424
    .line 425
    if-eqz v1, :cond_20

    .line 426
    .line 427
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CommonTipBox;->hashCode()I

    .line 428
    .line 429
    .line 430
    move-result v1

    .line 431
    goto :goto_20

    .line 432
    :cond_20
    move v1, v2

    .line 433
    :goto_20
    add-int/2addr v0, v1

    .line 434
    mul-int/lit8 v0, v0, 0x29

    .line 435
    .line 436
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakQuestionID:Ljava/lang/String;

    .line 437
    .line 438
    if-eqz v1, :cond_21

    .line 439
    .line 440
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    goto :goto_21

    .line 445
    :cond_21
    move v1, v2

    .line 446
    :goto_21
    add-int/2addr v0, v1

    .line 447
    mul-int/lit8 v0, v0, 0x29

    .line 448
    .line 449
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 450
    .line 451
    if-eqz v1, :cond_22

    .line 452
    .line 453
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Questionnaire;->hashCode()I

    .line 454
    .line 455
    .line 456
    move-result v1

    .line 457
    goto :goto_22

    .line 458
    :cond_22
    move v1, v2

    .line 459
    :goto_22
    add-int/2addr v0, v1

    .line 460
    mul-int/lit8 v0, v0, 0x29

    .line 461
    .line 462
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 463
    .line 464
    if-eqz v1, :cond_23

    .line 465
    .line 466
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->hashCode()I

    .line 467
    .line 468
    .line 469
    move-result v1

    .line 470
    goto :goto_23

    .line 471
    :cond_23
    move v1, v2

    .line 472
    :goto_23
    add-int/2addr v0, v1

    .line 473
    mul-int/lit8 v0, v0, 0x29

    .line 474
    .line 475
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 476
    .line 477
    if-eqz v1, :cond_24

    .line 478
    .line 479
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->hashCode()I

    .line 480
    .line 481
    .line 482
    move-result v1

    .line 483
    goto :goto_24

    .line 484
    :cond_24
    move v1, v2

    .line 485
    :goto_24
    add-int/2addr v0, v1

    .line 486
    mul-int/lit8 v0, v0, 0x29

    .line 487
    .line 488
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 489
    .line 490
    if-eqz v1, :cond_25

    .line 491
    .line 492
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->hashCode()I

    .line 493
    .line 494
    .line 495
    move-result v1

    .line 496
    goto :goto_25

    .line 497
    :cond_25
    move v1, v2

    .line 498
    :goto_25
    add-int/2addr v0, v1

    .line 499
    mul-int/lit8 v0, v0, 0x29

    .line 500
    .line 501
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 502
    .line 503
    if-eqz v1, :cond_26

    .line 504
    .line 505
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 506
    .line 507
    .line 508
    move-result v1

    .line 509
    goto :goto_26

    .line 510
    :cond_26
    move v1, v2

    .line 511
    :goto_26
    add-int/2addr v0, v1

    .line 512
    mul-int/lit8 v0, v0, 0x29

    .line 513
    .line 514
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 515
    .line 516
    if-eqz v1, :cond_27

    .line 517
    .line 518
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;->hashCode()I

    .line 519
    .line 520
    .line 521
    move-result v2

    .line 522
    :cond_27
    add-int/2addr v0, v2

    .line 523
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 524
    .line 525
    :cond_28
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
