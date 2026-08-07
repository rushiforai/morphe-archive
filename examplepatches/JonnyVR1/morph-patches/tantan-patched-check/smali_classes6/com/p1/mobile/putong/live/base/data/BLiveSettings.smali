.class public Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivesettings"


# instance fields
.field public chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public expConfig:Ljava/util/Map;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public intlGameSquareUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public intlOctopusGameUrlPrefix:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public liveAble:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public liveLabels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveLabel;",
            ">;"
        }
    .end annotation
.end field

.field public liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public liveSquareExtTabs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;"
        }
    .end annotation
.end field

.field public liveSquareTabs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;"
        }
    .end annotation
.end field

.field public predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public sensitiveWords:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public templates:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;",
            ">;"
        }
    .end annotation
.end field

.field public tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveLabel;)Lcom/p1/mobile/putong/live/base/data/BLiveLabel;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveLabel;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLabel;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;)Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;)Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTemplate;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->nullCheck()V

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

    .line 270
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->templates:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    new-instance v2, Ll/q52;

    .line 21
    .line 22
    invoke-direct {v2}, Ll/q52;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->templates:Ljava/util/List;

    .line 30
    .line 31
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 40
    .line 41
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    new-instance v2, Ll/r52;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/r52;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

    .line 55
    .line 56
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v1, :cond_4

    .line 59
    .line 60
    new-instance v2, Ll/s52;

    .line 61
    .line 62
    invoke-direct {v2}, Ll/s52;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 70
    .line 71
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 72
    .line 73
    if-eqz v1, :cond_5

    .line 74
    .line 75
    new-instance v2, Ll/t52;

    .line 76
    .line 77
    invoke-direct {v2}, Ll/t52;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 85
    .line 86
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 95
    .line 96
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 97
    .line 98
    if-eqz v1, :cond_7

    .line 99
    .line 100
    new-instance v2, Ll/u52;

    .line 101
    .line 102
    invoke-direct {v2}, Ll/u52;-><init>()V

    .line 103
    .line 104
    .line 105
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 110
    .line 111
    :cond_7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveAble:Z

    .line 112
    .line 113
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveAble:Z

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 116
    .line 117
    if-eqz v1, :cond_8

    .line 118
    .line 119
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 124
    .line 125
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 134
    .line 135
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 136
    .line 137
    if-eqz v1, :cond_a

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 144
    .line 145
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 146
    .line 147
    if-eqz v1, :cond_b

    .line 148
    .line 149
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 154
    .line 155
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 156
    .line 157
    if-eqz v1, :cond_c

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 164
    .line 165
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 166
    .line 167
    if-eqz v1, :cond_d

    .line 168
    .line 169
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 174
    .line 175
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 176
    .line 177
    if-eqz v1, :cond_e

    .line 178
    .line 179
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 184
    .line 185
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 186
    .line 187
    if-eqz v1, :cond_f

    .line 188
    .line 189
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 194
    .line 195
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 196
    .line 197
    if-eqz v1, :cond_10

    .line 198
    .line 199
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 204
    .line 205
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 206
    .line 207
    if-eqz v1, :cond_11

    .line 208
    .line 209
    new-instance v2, Ll/v52;

    .line 210
    .line 211
    invoke-direct {v2}, Ll/v52;-><init>()V

    .line 212
    .line 213
    .line 214
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/Map;Ll/qcj;)Ljava/util/Map;

    .line 215
    .line 216
    .line 217
    move-result-object v1

    .line 218
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 219
    .line 220
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 221
    .line 222
    if-eqz v1, :cond_12

    .line 223
    .line 224
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 229
    .line 230
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 231
    .line 232
    if-eqz v1, :cond_13

    .line 233
    .line 234
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 235
    .line 236
    .line 237
    move-result-object v1

    .line 238
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 239
    .line 240
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 241
    .line 242
    if-eqz v1, :cond_14

    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 249
    .line 250
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

    .line 251
    .line 252
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

    .line 253
    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

    .line 255
    .line 256
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

    .line 257
    .line 258
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 259
    .line 260
    if-eqz p0, :cond_15

    .line 261
    .line 262
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->clone()Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 267
    .line 268
    :cond_15
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 269
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->templates:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->templates:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveAble:Z

    .line 94
    .line 95
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveAble:Z

    .line 96
    .line 97
    if-ne v1, v3, :cond_2

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 100
    .line 101
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 102
    .line 103
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_2

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 110
    .line 111
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 140
    .line 141
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 150
    .line 151
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 160
    .line 161
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 170
    .line 171
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 180
    .line 181
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 190
    .line 191
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 200
    .line 201
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 210
    .line 211
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 220
    .line 221
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

    .line 230
    .line 231
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

    .line 240
    .line 241
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 250
    .line 251
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 252
    .line 253
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p0

    .line 257
    if-eqz p0, :cond_2

    .line 258
    .line 259
    return v0

    .line 260
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivesettings"

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
    if-nez v0, :cond_19

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveConfig;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->templates:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveAble:Z

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    const/16 v1, 0x4cf

    .line 117
    .line 118
    goto :goto_8

    .line 119
    :cond_8
    const/16 v1, 0x4d5

    .line 120
    .line 121
    :goto_8
    add-int/2addr v0, v1

    .line 122
    mul-int/lit8 v0, v0, 0x29

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;

    .line 125
    .line 126
    if-eqz v1, :cond_9

    .line 127
    .line 128
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceLiveConfig;->hashCode()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    goto :goto_9

    .line 133
    :cond_9
    move v1, v2

    .line 134
    :goto_9
    add-int/2addr v0, v1

    .line 135
    mul-int/lit8 v0, v0, 0x29

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSkinConfig:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 138
    .line 139
    if-eqz v1, :cond_a

    .line 140
    .line 141
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->hashCode()I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    goto :goto_a

    .line 146
    :cond_a
    move v1, v2

    .line 147
    :goto_a
    add-int/2addr v0, v1

    .line 148
    mul-int/lit8 v0, v0, 0x29

    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 151
    .line 152
    if-eqz v1, :cond_b

    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->resourceConfig:Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;

    .line 164
    .line 165
    if-eqz v1, :cond_c

    .line 166
    .line 167
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveResourceConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 177
    .line 178
    if-eqz v1, :cond_d

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->voiceLiveTemplates:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;

    .line 190
    .line 191
    if-eqz v1, :cond_e

    .line 192
    .line 193
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualTemplates;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 203
    .line 204
    if-eqz v1, :cond_f

    .line 205
    .line 206
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfig:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 216
    .line 217
    if-eqz v1, :cond_10

    .line 218
    .line 219
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->wealthLogoNewIconConfigV2:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;

    .line 229
    .line 230
    if-eqz v1, :cond_11

    .line 231
    .line 232
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->expConfig:Ljava/util/Map;

    .line 242
    .line 243
    if-eqz v1, :cond_12

    .line 244
    .line 245
    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveTemplatesMetadata:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;

    .line 255
    .line 256
    if-eqz v1, :cond_13

    .line 257
    .line 258
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveTemplatesCdnData;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;

    .line 268
    .line 269
    if-eqz v1, :cond_14

    .line 270
    .line 271
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->videoChatConfig:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;

    .line 281
    .line 282
    if-eqz v1, :cond_15

    .line 283
    .line 284
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatConfig;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

    .line 294
    .line 295
    if-eqz v1, :cond_16

    .line 296
    .line 297
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

    .line 307
    .line 308
    if-eqz v1, :cond_17

    .line 309
    .line 310
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->tttLiveConfig:Lcom/p1/mobile/putong/live/base/data/LiveConfig;

    .line 320
    .line 321
    if-eqz v1, :cond_18

    .line 322
    .line 323
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/LiveConfig;->hashCode()I

    .line 324
    .line 325
    .line 326
    move-result v2

    .line 327
    :cond_18
    add-int/2addr v0, v2

    .line 328
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 329
    .line 330
    :cond_19
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->predefineMessages:Lcom/p1/mobile/putong/live/base/data/BLivePreDefineMessages;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->sensitiveWords:Ljava/util/List;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    new-instance v0, Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveLabels:Ljava/util/List;

    .line 32
    .line 33
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 34
    .line 35
    if-nez v0, :cond_3

    .line 36
    .line 37
    new-instance v0, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareTabs:Ljava/util/List;

    .line 43
    .line 44
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 45
    .line 46
    if-nez v0, :cond_4

    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->chatTips:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 53
    .line 54
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 55
    .line 56
    if-nez v0, :cond_5

    .line 57
    .line 58
    new-instance v0, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->liveSquareExtTabs:Ljava/util/List;

    .line 64
    .line 65
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 66
    .line 67
    if-nez v0, :cond_6

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 74
    .line 75
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 76
    .line 77
    if-nez v0, :cond_7

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->swipeVirtualVoiceCardConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCommonConfig;

    .line 84
    .line 85
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

    .line 86
    .line 87
    const-string v1, ""

    .line 88
    .line 89
    if-nez v0, :cond_8

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlOctopusGameUrlPrefix:Ljava/lang/String;

    .line 92
    .line 93
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

    .line 94
    .line 95
    if-nez v0, :cond_9

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->intlGameSquareUrl:Ljava/lang/String;

    .line 98
    .line 99
    :cond_9
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
