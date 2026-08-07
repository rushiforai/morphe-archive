.class public Lcom/p1/mobile/putong/data/CommonAssetsSettings;
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
            "Lcom/p1/mobile/putong/data/CommonAssetsSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/CommonAssetsSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "commonassetssettings"


# instance fields
.field public NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public androidAudioExt:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public androidUrlHostTokenWhitelist:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
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

.field public emoji:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/EmojiType;",
            ">;"
        }
    .end annotation
.end field

.field public enableAgc:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public enableHighLegibility:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public enableNetReport:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public enableTTPlayer:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public httpDns:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public letterContents:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LetterContent;",
            ">;"
        }
    .end annotation
.end field

.field public limitEighteenBelowSignup:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public privateQuestionSuggestCardHideRate:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;",
            ">;"
        }
    .end annotation
.end field

.field public pullAlive:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/AwakeApp;",
            ">;"
        }
    .end annotation
.end field

.field public recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public sendOneSuperlikeActivitySwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/EmojiType;)Lcom/p1/mobile/putong/data/EmojiType;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/EmojiType;->clone()Lcom/p1/mobile/putong/data/EmojiType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/AwakeApp;)Lcom/p1/mobile/putong/data/AwakeApp;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/AwakeApp;->clone()Lcom/p1/mobile/putong/data/AwakeApp;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/LetterContent;)Lcom/p1/mobile/putong/data/LetterContent;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LetterContent;->clone()Lcom/p1/mobile/putong/data/LetterContent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;)Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;->clone()Lcom/p1/mobile/putong/data/PrivateQuestionSuggestCardHideRate;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/CommonAssetsSettings;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->nullCheck()V

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

    .line 167
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->clone()Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/CommonAssetsSettings;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->clone()Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RecommendPrefetch;->clone()Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    new-instance v2, Ll/zi5;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/zi5;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 40
    .line 41
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    new-instance v2, Ll/aj5;

    .line 46
    .line 47
    invoke-direct {v2}, Ll/aj5;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 55
    .line 56
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 57
    .line 58
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/TtpointDialog;->clone()Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 69
    .line 70
    :cond_4
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 71
    .line 72
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 73
    .line 74
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 75
    .line 76
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 79
    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    new-instance v2, Ll/bj5;

    .line 83
    .line 84
    invoke-direct {v2}, Ll/bj5;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 92
    .line 93
    :cond_5
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 94
    .line 95
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 98
    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    new-instance v2, Ll/cj5;

    .line 102
    .line 103
    invoke-direct {v2}, Ll/cj5;-><init>()V

    .line 104
    .line 105
    .line 106
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 111
    .line 112
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 113
    .line 114
    if-eqz v1, :cond_7

    .line 115
    .line 116
    new-instance v2, Ll/dj5;

    .line 117
    .line 118
    invoke-direct {v2}, Ll/dj5;-><init>()V

    .line 119
    .line 120
    .line 121
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 126
    .line 127
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 128
    .line 129
    if-eqz v1, :cond_8

    .line 130
    .line 131
    new-instance v2, Ll/ej5;

    .line 132
    .line 133
    invoke-direct {v2}, Ll/ej5;-><init>()V

    .line 134
    .line 135
    .line 136
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 141
    .line 142
    :cond_8
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 143
    .line 144
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 145
    .line 146
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 147
    .line 148
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 149
    .line 150
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 151
    .line 152
    if-eqz p0, :cond_9

    .line 153
    .line 154
    new-instance v1, Ll/fj5;

    .line 155
    .line 156
    invoke-direct {v1}, Ll/fj5;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    iput-object p0, v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 164
    .line 165
    :cond_9
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->clone()Lcom/p1/mobile/putong/data/CommonAssetsSettings;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 54
    .line 55
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 62
    .line 63
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 70
    .line 71
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 72
    .line 73
    if-ne v1, v3, :cond_2

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 76
    .line 77
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 78
    .line 79
    if-ne v1, v3, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 92
    .line 93
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 94
    .line 95
    if-ne v1, v3, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 100
    .line 101
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 128
    .line 129
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 130
    .line 131
    if-ne v1, v3, :cond_2

    .line 132
    .line 133
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 134
    .line 135
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 136
    .line 137
    if-ne v1, v3, :cond_2

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 140
    .line 141
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 142
    .line 143
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-eqz p0, :cond_2

    .line 148
    .line 149
    return v0

    .line 150
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "commonassetssettings"

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
    if-nez v0, :cond_10

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RecommendPrefetch;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->limitEighteenBelowSignup:Z

    .line 61
    .line 62
    const/16 v3, 0x4d5

    .line 63
    .line 64
    const/16 v4, 0x4cf

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    move v1, v4

    .line 69
    goto :goto_4

    .line 70
    :cond_4
    move v1, v3

    .line 71
    :goto_4
    add-int/2addr v0, v1

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 75
    .line 76
    if-eqz v1, :cond_5

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/TtpointDialog;->hashCode()I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    goto :goto_5

    .line 83
    :cond_5
    move v1, v2

    .line 84
    :goto_5
    add-int/2addr v0, v1

    .line 85
    mul-int/lit8 v0, v0, 0x29

    .line 86
    .line 87
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->sendOneSuperlikeActivitySwitch:Z

    .line 88
    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    move v1, v4

    .line 92
    goto :goto_6

    .line 93
    :cond_6
    move v1, v3

    .line 94
    :goto_6
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidAudioExt:Z

    .line 98
    .line 99
    if-eqz v1, :cond_7

    .line 100
    .line 101
    move v1, v4

    .line 102
    goto :goto_7

    .line 103
    :cond_7
    move v1, v3

    .line 104
    :goto_7
    add-int/2addr v0, v1

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 108
    .line 109
    if-eqz v1, :cond_8

    .line 110
    .line 111
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    goto :goto_8

    .line 116
    :cond_8
    move v1, v2

    .line 117
    :goto_8
    add-int/2addr v0, v1

    .line 118
    mul-int/lit8 v0, v0, 0x29

    .line 119
    .line 120
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableTTPlayer:Z

    .line 121
    .line 122
    if-eqz v1, :cond_9

    .line 123
    .line 124
    move v1, v4

    .line 125
    goto :goto_9

    .line 126
    :cond_9
    move v1, v3

    .line 127
    :goto_9
    add-int/2addr v0, v1

    .line 128
    mul-int/lit8 v0, v0, 0x29

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableHighLegibility:Ljava/util/List;

    .line 131
    .line 132
    if-eqz v1, :cond_a

    .line 133
    .line 134
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    goto :goto_a

    .line 139
    :cond_a
    move v1, v2

    .line 140
    :goto_a
    add-int/2addr v0, v1

    .line 141
    mul-int/lit8 v0, v0, 0x29

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableAgc:Ljava/util/List;

    .line 144
    .line 145
    if-eqz v1, :cond_b

    .line 146
    .line 147
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    goto :goto_b

    .line 152
    :cond_b
    move v1, v2

    .line 153
    :goto_b
    add-int/2addr v0, v1

    .line 154
    mul-int/lit8 v0, v0, 0x29

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 157
    .line 158
    if-eqz v1, :cond_c

    .line 159
    .line 160
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    goto :goto_c

    .line 165
    :cond_c
    move v1, v2

    .line 166
    :goto_c
    add-int/2addr v0, v1

    .line 167
    mul-int/lit8 v0, v0, 0x29

    .line 168
    .line 169
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->httpDns:Z

    .line 170
    .line 171
    if-eqz v1, :cond_d

    .line 172
    .line 173
    move v1, v4

    .line 174
    goto :goto_d

    .line 175
    :cond_d
    move v1, v3

    .line 176
    :goto_d
    add-int/2addr v0, v1

    .line 177
    mul-int/lit8 v0, v0, 0x29

    .line 178
    .line 179
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->enableNetReport:Z

    .line 180
    .line 181
    if-eqz v1, :cond_e

    .line 182
    .line 183
    move v3, v4

    .line 184
    :cond_e
    add-int/2addr v0, v3

    .line 185
    mul-int/lit8 v0, v0, 0x29

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->androidUrlHostTokenWhitelist:Ljava/util/List;

    .line 188
    .line 189
    if-eqz v1, :cond_f

    .line 190
    .line 191
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 192
    .line 193
    .line 194
    move-result v2

    .line 195
    :cond_f
    add-int/2addr v0, v2

    .line 196
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 197
    .line 198
    :cond_10
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/NCTAndroidBatch_;->new_()Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->NCTAndroidBatch:Lcom/p1/mobile/putong/data/NCTAndroidBatch_;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/data/RecommendPrefetch;->new_()Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->recommendPrefetch:Lcom/p1/mobile/putong/data/RecommendPrefetch;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->pullAlive:Ljava/util/List;

    .line 31
    .line 32
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 33
    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->privateQuestionSuggestCardHideRate:Ljava/util/List;

    .line 42
    .line 43
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 44
    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/data/TtpointDialog;->new_()Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->ttpointDialog:Lcom/p1/mobile/putong/data/TtpointDialog;

    .line 52
    .line 53
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 54
    .line 55
    if-nez v0, :cond_5

    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->letterContents:Ljava/util/List;

    .line 63
    .line 64
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 65
    .line 66
    if-nez v0, :cond_6

    .line 67
    .line 68
    new-instance v0, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->emoji:Ljava/util/List;

    .line 74
    .line 75
    :cond_6
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/CommonAssetsSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
