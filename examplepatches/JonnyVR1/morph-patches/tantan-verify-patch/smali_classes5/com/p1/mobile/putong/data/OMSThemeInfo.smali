.class public Lcom/p1/mobile/putong/data/OMSThemeInfo;
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
            "Lcom/p1/mobile/putong/data/OMSThemeInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OMSThemeInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "omsthemeinfo"


# instance fields
.field public bgColors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public color:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public h5URL:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public h5popLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public icon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public questionnaireFinished:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public settingTxt:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public subTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public suggestSwitch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSThemeInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSThemeInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/OMSThemeInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSThemeInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/OMSThemeInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSThemeInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OMSThemeInfo;->nullCheck()V

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

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSThemeInfo;->clone()Lcom/p1/mobile/putong/data/OMSThemeInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/OMSThemeInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSThemeInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->clone()Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    new-instance v2, Ll/c850;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/c850;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 50
    .line 51
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 52
    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 54
    .line 55
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 56
    .line 57
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 60
    .line 61
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 62
    .line 63
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 64
    .line 65
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 68
    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->clone()Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 76
    .line 77
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 78
    .line 79
    if-eqz v1, :cond_3

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->clone()Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 86
    .line 87
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 88
    .line 89
    if-eqz v1, :cond_4

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->clone()Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 96
    .line 97
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 98
    .line 99
    iput-object p0, v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 100
    .line 101
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSThemeInfo;->clone()Lcom/p1/mobile/putong/data/OMSThemeInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 94
    .line 95
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 96
    .line 97
    if-ne v1, v3, :cond_2

    .line 98
    .line 99
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 100
    .line 101
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 102
    .line 103
    if-ne v1, v3, :cond_2

    .line 104
    .line 105
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 106
    .line 107
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 108
    .line 109
    if-ne v1, v3, :cond_2

    .line 110
    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 112
    .line 113
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 122
    .line 123
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 132
    .line 133
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 142
    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    if-eqz p0, :cond_2

    .line 150
    .line 151
    return v0

    .line 152
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "omsthemeinfo"

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
    if-nez v0, :cond_e

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestSwitch:Z

    .line 113
    .line 114
    const/16 v3, 0x4d5

    .line 115
    .line 116
    const/16 v4, 0x4cf

    .line 117
    .line 118
    if-eqz v1, :cond_8

    .line 119
    .line 120
    move v1, v4

    .line 121
    goto :goto_8

    .line 122
    :cond_8
    move v1, v3

    .line 123
    :goto_8
    add-int/2addr v0, v1

    .line 124
    mul-int/lit8 v0, v0, 0x29

    .line 125
    .line 126
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->questionnaireFinished:Z

    .line 127
    .line 128
    if-eqz v1, :cond_9

    .line 129
    .line 130
    move v3, v4

    .line 131
    :cond_9
    add-int/2addr v0, v3

    .line 132
    mul-int/lit8 v0, v0, 0x29

    .line 133
    .line 134
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5popLimit:I

    .line 135
    .line 136
    add-int/2addr v0, v1

    .line 137
    mul-int/lit8 v0, v0, 0x29

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 140
    .line 141
    if-eqz v1, :cond_a

    .line 142
    .line 143
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->hashCode()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    goto :goto_9

    .line 148
    :cond_a
    move v1, v2

    .line 149
    :goto_9
    add-int/2addr v0, v1

    .line 150
    mul-int/lit8 v0, v0, 0x29

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 153
    .line 154
    if-eqz v1, :cond_b

    .line 155
    .line 156
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->hashCode()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    goto :goto_a

    .line 161
    :cond_b
    move v1, v2

    .line 162
    :goto_a
    add-int/2addr v0, v1

    .line 163
    mul-int/lit8 v0, v0, 0x29

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 166
    .line 167
    if-eqz v1, :cond_c

    .line 168
    .line 169
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->hashCode()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    goto :goto_b

    .line 174
    :cond_c
    move v1, v2

    .line 175
    :goto_b
    add-int/2addr v0, v1

    .line 176
    mul-int/lit8 v0, v0, 0x29

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 179
    .line 180
    if-eqz v1, :cond_d

    .line 181
    .line 182
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 183
    .line 184
    .line 185
    move-result v2

    .line 186
    :cond_d
    add-int/2addr v0, v2

    .line 187
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 188
    .line 189
    :cond_e
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->countdownView:Lcom/p1/mobile/putong/data/OMSThemeCountdownInfo;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->title:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->subTitle:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->settingTxt:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->color:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    new-instance v0, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bgColors:Ljava/util/List;

    .line 53
    .line 54
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 55
    .line 56
    if-nez v0, :cond_7

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->h5URL:Ljava/lang/String;

    .line 59
    .line 60
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 61
    .line 62
    if-nez v0, :cond_8

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubble:Lcom/p1/mobile/putong/data/OMSThemeBubbleInfo;

    .line 69
    .line 70
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 71
    .line 72
    if-nez v0, :cond_9

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->suggestStrategy:Lcom/p1/mobile/putong/data/OMSThemeSuggestStrageryInfo;

    .line 79
    .line 80
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 81
    .line 82
    if-nez v0, :cond_a

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;->new_()Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->bubbleOpen:Lcom/p1/mobile/putong/data/OMSThemeBubbleOpenInfo;

    .line 89
    .line 90
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 91
    .line 92
    if-nez v0, :cond_b

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->icon:Ljava/lang/String;

    .line 95
    .line 96
    :cond_b
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OMSThemeInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
