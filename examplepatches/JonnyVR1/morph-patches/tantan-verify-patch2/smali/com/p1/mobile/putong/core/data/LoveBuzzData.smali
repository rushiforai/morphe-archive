.class public Lcom/p1/mobile/putong/core/data/LoveBuzzData;
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
            "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "lovebuzzdata"


# instance fields
.field public allowedMCCSwitchList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public bonusEnabledBuzz:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public conversationId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public enabledBuzz:Ljava/util/List;
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

.field public isBoosted:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public isTextBuzzBoosted:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public isTextBuzzExhausted:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public matched:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public mcc:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public memojiBuzzConnectTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public memojiBuzzPairFailHintTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public memojiBuzzRTCVendor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation
.end field

.field public memojiBuzzReactTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public memojiBuzzToggle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public memojiBuzzWaitingTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public potentialPremium:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation
.end field

.field public prolongDuration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation
.end field

.field public remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public remainingMemojiBuzz:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation
.end field

.field public remainingProlongCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public remainingTextBuzz:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public remainingVideoBuzz:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public remainingVoiceBuzz:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public showedPassiveModeBuzz:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public textBuzzPairFailHintTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public textBuzzToggle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public totalDuration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public videoBuzzConnectTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public videoBuzzPairFailHintTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public videoBuzzRTCVendor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public videoBuzzReactTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public videoBuzzToggle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public videoBuzzWaitingTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public voiceBuzzConnectTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public voiceBuzzPairFailHintTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public voiceBuzzRTCVendor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public voiceBuzzReactTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public voiceBuzzToggle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public voiceBuzzWaitingTimeout:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic d(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/LoveBuzzData;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->nullCheck()V

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

    .line 248
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->clone()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/LoveBuzzData;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 31
    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    .line 37
    .line 38
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    .line 39
    .line 40
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    .line 43
    .line 44
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    .line 45
    .line 46
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    .line 47
    .line 48
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    .line 55
    .line 56
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    .line 57
    .line 58
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    .line 59
    .line 60
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 67
    .line 68
    if-eqz v1, :cond_0

    .line 69
    .line 70
    new-instance v2, Ll/q6w;

    .line 71
    .line 72
    invoke-direct {v2}, Ll/q6w;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 80
    .line 81
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 82
    .line 83
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 84
    .line 85
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    .line 86
    .line 87
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    .line 88
    .line 89
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    .line 90
    .line 91
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    .line 92
    .line 93
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    .line 94
    .line 95
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    .line 96
    .line 97
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    .line 98
    .line 99
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    .line 100
    .line 101
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    .line 102
    .line 103
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    .line 104
    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 106
    .line 107
    if-eqz v1, :cond_1

    .line 108
    .line 109
    new-instance v2, Ll/r6w;

    .line 110
    .line 111
    invoke-direct {v2}, Ll/r6w;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 119
    .line 120
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    .line 121
    .line 122
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    .line 123
    .line 124
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    .line 125
    .line 126
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    .line 127
    .line 128
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    .line 129
    .line 130
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    .line 131
    .line 132
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    .line 133
    .line 134
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    .line 135
    .line 136
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    .line 137
    .line 138
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    .line 139
    .line 140
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    .line 141
    .line 142
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    .line 143
    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 145
    .line 146
    if-eqz v1, :cond_2

    .line 147
    .line 148
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RemainingBonus;->clone()Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 153
    .line 154
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 155
    .line 156
    if-eqz v1, :cond_3

    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RateLimited;->clone()Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 163
    .line 164
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 165
    .line 166
    if-eqz v1, :cond_4

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BonusThreshold;->clone()Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 173
    .line 174
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    .line 175
    .line 176
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    .line 177
    .line 178
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    .line 179
    .line 180
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    .line 181
    .line 182
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    .line 183
    .line 184
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    .line 185
    .line 186
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    .line 187
    .line 188
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    .line 189
    .line 190
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    .line 191
    .line 192
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    .line 193
    .line 194
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 195
    .line 196
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 199
    .line 200
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 203
    .line 204
    if-eqz v1, :cond_5

    .line 205
    .line 206
    new-instance v2, Ll/s6w;

    .line 207
    .line 208
    invoke-direct {v2}, Ll/s6w;-><init>()V

    .line 209
    .line 210
    .line 211
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 216
    .line 217
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 218
    .line 219
    if-eqz v1, :cond_6

    .line 220
    .line 221
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BuzzResolution;->clone()Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 226
    .line 227
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 228
    .line 229
    if-eqz v1, :cond_7

    .line 230
    .line 231
    new-instance v2, Ll/t6w;

    .line 232
    .line 233
    invoke-direct {v2}, Ll/t6w;-><init>()V

    .line 234
    .line 235
    .line 236
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 241
    .line 242
    :cond_7
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    .line 243
    .line 244
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    .line 245
    .line 246
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 247
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->clone()Lcom/p1/mobile/putong/core/data/LoveBuzzData;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    .line 30
    .line 31
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    .line 46
    .line 47
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    .line 48
    .line 49
    if-ne v1, v3, :cond_2

    .line 50
    .line 51
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    .line 52
    .line 53
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    .line 54
    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 58
    .line 59
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 60
    .line 61
    if-ne v1, v3, :cond_2

    .line 62
    .line 63
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    .line 64
    .line 65
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    .line 66
    .line 67
    if-ne v1, v3, :cond_2

    .line 68
    .line 69
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    .line 70
    .line 71
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    .line 72
    .line 73
    if-ne v1, v3, :cond_2

    .line 74
    .line 75
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    .line 76
    .line 77
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    .line 78
    .line 79
    if-ne v1, v3, :cond_2

    .line 80
    .line 81
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    .line 82
    .line 83
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    .line 84
    .line 85
    if-ne v1, v3, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-eqz v1, :cond_2

    .line 96
    .line 97
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    .line 98
    .line 99
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    .line 100
    .line 101
    if-ne v1, v3, :cond_2

    .line 102
    .line 103
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    .line 104
    .line 105
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    .line 106
    .line 107
    if-ne v1, v3, :cond_2

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 130
    .line 131
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 132
    .line 133
    if-ne v1, v3, :cond_2

    .line 134
    .line 135
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    .line 136
    .line 137
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    .line 138
    .line 139
    if-ne v1, v3, :cond_2

    .line 140
    .line 141
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    .line 142
    .line 143
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    .line 144
    .line 145
    if-ne v1, v3, :cond_2

    .line 146
    .line 147
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    .line 148
    .line 149
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    .line 150
    .line 151
    if-ne v1, v3, :cond_2

    .line 152
    .line 153
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    .line 154
    .line 155
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    .line 156
    .line 157
    if-ne v1, v3, :cond_2

    .line 158
    .line 159
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    .line 160
    .line 161
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    .line 162
    .line 163
    if-ne v1, v3, :cond_2

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 166
    .line 167
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 168
    .line 169
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_2

    .line 174
    .line 175
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    .line 176
    .line 177
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    .line 178
    .line 179
    if-ne v1, v3, :cond_2

    .line 180
    .line 181
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    .line 182
    .line 183
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    .line 184
    .line 185
    if-ne v1, v3, :cond_2

    .line 186
    .line 187
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    .line 188
    .line 189
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    .line 190
    .line 191
    if-ne v1, v3, :cond_2

    .line 192
    .line 193
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    .line 194
    .line 195
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    .line 196
    .line 197
    if-ne v1, v3, :cond_2

    .line 198
    .line 199
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    .line 200
    .line 201
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    .line 202
    .line 203
    if-ne v1, v3, :cond_2

    .line 204
    .line 205
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    .line 206
    .line 207
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    .line 208
    .line 209
    if-ne v1, v3, :cond_2

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 212
    .line 213
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 222
    .line 223
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 224
    .line 225
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    if-eqz v1, :cond_2

    .line 230
    .line 231
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 232
    .line 233
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    .line 242
    .line 243
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    .line 244
    .line 245
    if-ne v1, v3, :cond_2

    .line 246
    .line 247
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    .line 248
    .line 249
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    .line 250
    .line 251
    if-ne v1, v3, :cond_2

    .line 252
    .line 253
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    .line 254
    .line 255
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    .line 256
    .line 257
    if-ne v1, v3, :cond_2

    .line 258
    .line 259
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    .line 260
    .line 261
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    .line 262
    .line 263
    if-ne v1, v3, :cond_2

    .line 264
    .line 265
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    .line 266
    .line 267
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    .line 268
    .line 269
    if-ne v1, v3, :cond_2

    .line 270
    .line 271
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 272
    .line 273
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 274
    .line 275
    if-ne v1, v3, :cond_2

    .line 276
    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 278
    .line 279
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 280
    .line 281
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    if-eqz v1, :cond_2

    .line 286
    .line 287
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 288
    .line 289
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 290
    .line 291
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result v1

    .line 295
    if-eqz v1, :cond_2

    .line 296
    .line 297
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 298
    .line 299
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 300
    .line 301
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    move-result v1

    .line 305
    if-eqz v1, :cond_2

    .line 306
    .line 307
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 308
    .line 309
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 310
    .line 311
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result v1

    .line 315
    if-eqz v1, :cond_2

    .line 316
    .line 317
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    .line 318
    .line 319
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    .line 320
    .line 321
    if-ne p0, p1, :cond_2

    .line 322
    .line 323
    return v0

    .line 324
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "lovebuzzdata"

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
    if-nez v0, :cond_16

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    .line 27
    .line 28
    const/16 v3, 0x4d5

    .line 29
    .line 30
    const/16 v4, 0x4cf

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    move v1, v4

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v1, v3

    .line 37
    :goto_1
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    move v1, v2

    .line 50
    :goto_2
    add-int/2addr v0, v1

    .line 51
    mul-int/lit8 v0, v0, 0x29

    .line 52
    .line 53
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    move v1, v4

    .line 58
    goto :goto_3

    .line 59
    :cond_3
    move v1, v3

    .line 60
    :goto_3
    add-int/2addr v0, v1

    .line 61
    mul-int/lit8 v0, v0, 0x29

    .line 62
    .line 63
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    .line 64
    .line 65
    if-eqz v1, :cond_4

    .line 66
    .line 67
    move v1, v4

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v3

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 74
    .line 75
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x29

    .line 77
    .line 78
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    .line 79
    .line 80
    add-int/2addr v0, v1

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    .line 84
    .line 85
    if-eqz v1, :cond_5

    .line 86
    .line 87
    move v1, v4

    .line 88
    goto :goto_5

    .line 89
    :cond_5
    move v1, v3

    .line 90
    :goto_5
    add-int/2addr v0, v1

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    .line 94
    .line 95
    add-int/2addr v0, v1

    .line 96
    mul-int/lit8 v0, v0, 0x29

    .line 97
    .line 98
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    .line 99
    .line 100
    add-int/2addr v0, v1

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v1, :cond_6

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    goto :goto_6

    .line 112
    :cond_6
    move v1, v2

    .line 113
    :goto_6
    add-int/2addr v0, v1

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    .line 117
    .line 118
    if-eqz v1, :cond_7

    .line 119
    .line 120
    move v1, v4

    .line 121
    goto :goto_7

    .line 122
    :cond_7
    move v1, v3

    .line 123
    :goto_7
    add-int/2addr v0, v1

    .line 124
    mul-int/lit8 v0, v0, 0x29

    .line 125
    .line 126
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    .line 127
    .line 128
    add-int/2addr v0, v1

    .line 129
    mul-int/lit8 v0, v0, 0x29

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz v1, :cond_8

    .line 134
    .line 135
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 136
    .line 137
    .line 138
    move-result v1

    .line 139
    goto :goto_8

    .line 140
    :cond_8
    move v1, v2

    .line 141
    :goto_8
    add-int/2addr v0, v1

    .line 142
    mul-int/lit8 v0, v0, 0x29

    .line 143
    .line 144
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 145
    .line 146
    if-eqz v1, :cond_9

    .line 147
    .line 148
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    goto :goto_9

    .line 153
    :cond_9
    move v1, v2

    .line 154
    :goto_9
    add-int/2addr v0, v1

    .line 155
    mul-int/lit8 v0, v0, 0x29

    .line 156
    .line 157
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 158
    .line 159
    add-int/2addr v0, v1

    .line 160
    mul-int/lit8 v0, v0, 0x29

    .line 161
    .line 162
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    .line 163
    .line 164
    add-int/2addr v0, v1

    .line 165
    mul-int/lit8 v0, v0, 0x29

    .line 166
    .line 167
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    .line 168
    .line 169
    add-int/2addr v0, v1

    .line 170
    mul-int/lit8 v0, v0, 0x29

    .line 171
    .line 172
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    .line 173
    .line 174
    add-int/2addr v0, v1

    .line 175
    mul-int/lit8 v0, v0, 0x29

    .line 176
    .line 177
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    .line 178
    .line 179
    if-eqz v1, :cond_a

    .line 180
    .line 181
    move v1, v4

    .line 182
    goto :goto_a

    .line 183
    :cond_a
    move v1, v3

    .line 184
    :goto_a
    add-int/2addr v0, v1

    .line 185
    mul-int/lit8 v0, v0, 0x29

    .line 186
    .line 187
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    .line 188
    .line 189
    if-eqz v1, :cond_b

    .line 190
    .line 191
    move v1, v4

    .line 192
    goto :goto_b

    .line 193
    :cond_b
    move v1, v3

    .line 194
    :goto_b
    add-int/2addr v0, v1

    .line 195
    mul-int/lit8 v0, v0, 0x29

    .line 196
    .line 197
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 198
    .line 199
    if-eqz v1, :cond_c

    .line 200
    .line 201
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    goto :goto_c

    .line 206
    :cond_c
    move v1, v2

    .line 207
    :goto_c
    add-int/2addr v0, v1

    .line 208
    mul-int/lit8 v0, v0, 0x29

    .line 209
    .line 210
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    .line 211
    .line 212
    add-int/2addr v0, v1

    .line 213
    mul-int/lit8 v0, v0, 0x29

    .line 214
    .line 215
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    .line 216
    .line 217
    add-int/2addr v0, v1

    .line 218
    mul-int/lit8 v0, v0, 0x29

    .line 219
    .line 220
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    .line 221
    .line 222
    add-int/2addr v0, v1

    .line 223
    mul-int/lit8 v0, v0, 0x29

    .line 224
    .line 225
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    .line 226
    .line 227
    add-int/2addr v0, v1

    .line 228
    mul-int/lit8 v0, v0, 0x29

    .line 229
    .line 230
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    .line 231
    .line 232
    add-int/2addr v0, v1

    .line 233
    mul-int/lit8 v0, v0, 0x29

    .line 234
    .line 235
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    .line 236
    .line 237
    add-int/2addr v0, v1

    .line 238
    mul-int/lit8 v0, v0, 0x29

    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 241
    .line 242
    if-eqz v1, :cond_d

    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RemainingBonus;->hashCode()I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    goto :goto_d

    .line 249
    :cond_d
    move v1, v2

    .line 250
    :goto_d
    add-int/2addr v0, v1

    .line 251
    mul-int/lit8 v0, v0, 0x29

    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 254
    .line 255
    if-eqz v1, :cond_e

    .line 256
    .line 257
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/RateLimited;->hashCode()I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    goto :goto_e

    .line 262
    :cond_e
    move v1, v2

    .line 263
    :goto_e
    add-int/2addr v0, v1

    .line 264
    mul-int/lit8 v0, v0, 0x29

    .line 265
    .line 266
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 267
    .line 268
    if-eqz v1, :cond_f

    .line 269
    .line 270
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BonusThreshold;->hashCode()I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    goto :goto_f

    .line 275
    :cond_f
    move v1, v2

    .line 276
    :goto_f
    add-int/2addr v0, v1

    .line 277
    mul-int/lit8 v0, v0, 0x29

    .line 278
    .line 279
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    .line 280
    .line 281
    if-eqz v1, :cond_10

    .line 282
    .line 283
    move v1, v4

    .line 284
    goto :goto_10

    .line 285
    :cond_10
    move v1, v3

    .line 286
    :goto_10
    add-int/2addr v0, v1

    .line 287
    mul-int/lit8 v0, v0, 0x29

    .line 288
    .line 289
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    .line 290
    .line 291
    add-int/2addr v0, v1

    .line 292
    mul-int/lit8 v0, v0, 0x29

    .line 293
    .line 294
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    .line 295
    .line 296
    add-int/2addr v0, v1

    .line 297
    mul-int/lit8 v0, v0, 0x29

    .line 298
    .line 299
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    .line 300
    .line 301
    add-int/2addr v0, v1

    .line 302
    mul-int/lit8 v0, v0, 0x29

    .line 303
    .line 304
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    .line 305
    .line 306
    add-int/2addr v0, v1

    .line 307
    mul-int/lit8 v0, v0, 0x29

    .line 308
    .line 309
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 310
    .line 311
    add-int/2addr v0, v1

    .line 312
    mul-int/lit8 v0, v0, 0x29

    .line 313
    .line 314
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 315
    .line 316
    if-eqz v1, :cond_11

    .line 317
    .line 318
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    goto :goto_11

    .line 323
    :cond_11
    move v1, v2

    .line 324
    :goto_11
    add-int/2addr v0, v1

    .line 325
    mul-int/lit8 v0, v0, 0x29

    .line 326
    .line 327
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 328
    .line 329
    if-eqz v1, :cond_12

    .line 330
    .line 331
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 332
    .line 333
    .line 334
    move-result v1

    .line 335
    goto :goto_12

    .line 336
    :cond_12
    move v1, v2

    .line 337
    :goto_12
    add-int/2addr v0, v1

    .line 338
    mul-int/lit8 v0, v0, 0x29

    .line 339
    .line 340
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 341
    .line 342
    if-eqz v1, :cond_13

    .line 343
    .line 344
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BuzzResolution;->hashCode()I

    .line 345
    .line 346
    .line 347
    move-result v1

    .line 348
    goto :goto_13

    .line 349
    :cond_13
    move v1, v2

    .line 350
    :goto_13
    add-int/2addr v0, v1

    .line 351
    mul-int/lit8 v0, v0, 0x29

    .line 352
    .line 353
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 354
    .line 355
    if-eqz v1, :cond_14

    .line 356
    .line 357
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 358
    .line 359
    .line 360
    move-result v2

    .line 361
    :cond_14
    add-int/2addr v0, v2

    .line 362
    mul-int/lit8 v0, v0, 0x29

    .line 363
    .line 364
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    .line 365
    .line 366
    if-eqz v1, :cond_15

    .line 367
    .line 368
    move v3, v4

    .line 369
    :cond_15
    add-int/2addr v0, v3

    .line 370
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 371
    .line 372
    :cond_16
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 37
    .line 38
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 39
    .line 40
    if-nez v0, :cond_5

    .line 41
    .line 42
    new-instance v0, Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 48
    .line 49
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 50
    .line 51
    if-nez v0, :cond_6

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RemainingBonus;->new_()Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 58
    .line 59
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 60
    .line 61
    if-nez v0, :cond_7

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RateLimited;->new_()Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 68
    .line 69
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 70
    .line 71
    if-nez v0, :cond_8

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BonusThreshold;->new_()Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 78
    .line 79
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 80
    .line 81
    if-nez v0, :cond_9

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 84
    .line 85
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 86
    .line 87
    if-nez v0, :cond_a

    .line 88
    .line 89
    new-instance v0, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 95
    .line 96
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 97
    .line 98
    if-nez v0, :cond_b

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BuzzResolution;->new_()Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 105
    .line 106
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 107
    .line 108
    if-nez v0, :cond_c

    .line 109
    .line 110
    new-instance v0, Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 116
    .line 117
    :cond_c
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
