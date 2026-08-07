.class public Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivegiftbubbleconfig"


# instance fields
.field public backgroundColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public blackClose:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public bubbleShowAfterWatch:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public bubbleText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public content:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public contentColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public contentDesc:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public descriptions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;",
            ">;"
        }
    .end annotation
.end field

.field public displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public extra:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public extraClickAction:Ll/x20;

.field public giftItemId:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public giftNums:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public iconUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public isCircle:Z

.field public isFromLongLink:Z

.field public remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public remindID:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public schema:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public showClose:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public window:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomWindow;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;)Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomContent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveBottomWindow;)Lcom/p1/mobile/putong/live/base/data/BLiveBottomWindow;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomWindow;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomWindow;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->nullCheck()V

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

    .line 156
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftItemId:I

    .line 23
    .line 24
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftItemId:I

    .line 25
    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftNums:I

    .line 27
    .line 28
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftNums:I

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleShowAfterWatch:I

    .line 31
    .line 32
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleShowAfterWatch:I

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 35
    .line 36
    if-eqz v1, :cond_0

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 43
    .line 44
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remindID:I

    .line 45
    .line 46
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remindID:I

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 53
    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 61
    .line 62
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 63
    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 71
    .line 72
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 77
    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 81
    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 89
    .line 90
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->showClose:Z

    .line 91
    .line 92
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->showClose:Z

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 95
    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 103
    .line 104
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 109
    .line 110
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 111
    .line 112
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->blackClose:Z

    .line 113
    .line 114
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->blackClose:Z

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 117
    .line 118
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 119
    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

    .line 121
    .line 122
    if-eqz v1, :cond_5

    .line 123
    .line 124
    new-instance v2, Ll/k02;

    .line 125
    .line 126
    invoke-direct {v2}, Ll/k02;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

    .line 134
    .line 135
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

    .line 136
    .line 137
    if-eqz v1, :cond_6

    .line 138
    .line 139
    new-instance v2, Ll/l02;

    .line 140
    .line 141
    invoke-direct {v2}, Ll/l02;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

    .line 149
    .line 150
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 151
    .line 152
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 153
    .line 154
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftItemId:I

    .line 54
    .line 55
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftItemId:I

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftNums:I

    .line 60
    .line 61
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftNums:I

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleShowAfterWatch:I

    .line 66
    .line 67
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleShowAfterWatch:I

    .line 68
    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 74
    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-eqz v1, :cond_2

    .line 80
    .line 81
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remindID:I

    .line 82
    .line 83
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remindID:I

    .line 84
    .line 85
    if-ne v1, v3, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    if-eqz v1, :cond_2

    .line 136
    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 138
    .line 139
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 140
    .line 141
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-eqz v1, :cond_2

    .line 146
    .line 147
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->showClose:Z

    .line 148
    .line 149
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->showClose:Z

    .line 150
    .line 151
    if-ne v1, v3, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->blackClose:Z

    .line 184
    .line 185
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->blackClose:Z

    .line 186
    .line 187
    if-ne v1, v3, :cond_2

    .line 188
    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 190
    .line 191
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

    .line 200
    .line 201
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

    .line 210
    .line 211
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 220
    .line 221
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    if-eqz p0, :cond_2

    .line 228
    .line 229
    return v0

    .line 230
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivegiftbubbleconfig"

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
    if-nez v0, :cond_14

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftItemId:I

    .line 61
    .line 62
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftNums:I

    .line 66
    .line 67
    add-int/2addr v0, v1

    .line 68
    mul-int/lit8 v0, v0, 0x29

    .line 69
    .line 70
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleShowAfterWatch:I

    .line 71
    .line 72
    add-int/2addr v0, v1

    .line 73
    mul-int/lit8 v0, v0, 0x29

    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 76
    .line 77
    if-eqz v1, :cond_4

    .line 78
    .line 79
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;->hashCode()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    goto :goto_4

    .line 84
    :cond_4
    move v1, v2

    .line 85
    :goto_4
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x29

    .line 87
    .line 88
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remindID:I

    .line 89
    .line 90
    add-int/2addr v0, v1

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz v1, :cond_5

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    goto :goto_5

    .line 102
    :cond_5
    move v1, v2

    .line 103
    :goto_5
    add-int/2addr v0, v1

    .line 104
    mul-int/lit8 v0, v0, 0x29

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 107
    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->hashCode()I

    .line 111
    .line 112
    .line 113
    move-result v1

    .line 114
    goto :goto_6

    .line 115
    :cond_6
    move v1, v2

    .line 116
    :goto_6
    add-int/2addr v0, v1

    .line 117
    mul-int/lit8 v0, v0, 0x29

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 120
    .line 121
    if-eqz v1, :cond_7

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;->hashCode()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    goto :goto_7

    .line 128
    :cond_7
    move v1, v2

    .line 129
    :goto_7
    add-int/2addr v0, v1

    .line 130
    mul-int/lit8 v0, v0, 0x29

    .line 131
    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 133
    .line 134
    if-eqz v1, :cond_8

    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    goto :goto_8

    .line 141
    :cond_8
    move v1, v2

    .line 142
    :goto_8
    add-int/2addr v0, v1

    .line 143
    mul-int/lit8 v0, v0, 0x29

    .line 144
    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 146
    .line 147
    if-eqz v1, :cond_9

    .line 148
    .line 149
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    goto :goto_9

    .line 154
    :cond_9
    move v1, v2

    .line 155
    :goto_9
    add-int/2addr v0, v1

    .line 156
    mul-int/lit8 v0, v0, 0x29

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 159
    .line 160
    if-eqz v1, :cond_a

    .line 161
    .line 162
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;->hashCode()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    goto :goto_a

    .line 167
    :cond_a
    move v1, v2

    .line 168
    :goto_a
    add-int/2addr v0, v1

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->showClose:Z

    .line 172
    .line 173
    const/16 v3, 0x4d5

    .line 174
    .line 175
    const/16 v4, 0x4cf

    .line 176
    .line 177
    if-eqz v1, :cond_b

    .line 178
    .line 179
    move v1, v4

    .line 180
    goto :goto_b

    .line 181
    :cond_b
    move v1, v3

    .line 182
    :goto_b
    add-int/2addr v0, v1

    .line 183
    mul-int/lit8 v0, v0, 0x29

    .line 184
    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 186
    .line 187
    if-eqz v1, :cond_c

    .line 188
    .line 189
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->hashCode()I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    goto :goto_c

    .line 194
    :cond_c
    move v1, v2

    .line 195
    :goto_c
    add-int/2addr v0, v1

    .line 196
    mul-int/lit8 v0, v0, 0x29

    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 199
    .line 200
    if-eqz v1, :cond_d

    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    goto :goto_d

    .line 207
    :cond_d
    move v1, v2

    .line 208
    :goto_d
    add-int/2addr v0, v1

    .line 209
    mul-int/lit8 v0, v0, 0x29

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 212
    .line 213
    if-eqz v1, :cond_e

    .line 214
    .line 215
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    goto :goto_e

    .line 220
    :cond_e
    move v1, v2

    .line 221
    :goto_e
    add-int/2addr v0, v1

    .line 222
    mul-int/lit8 v0, v0, 0x29

    .line 223
    .line 224
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->blackClose:Z

    .line 225
    .line 226
    if-eqz v1, :cond_f

    .line 227
    .line 228
    move v3, v4

    .line 229
    :cond_f
    add-int/2addr v0, v3

    .line 230
    mul-int/lit8 v0, v0, 0x29

    .line 231
    .line 232
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 233
    .line 234
    if-eqz v1, :cond_10

    .line 235
    .line 236
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    goto :goto_f

    .line 241
    :cond_10
    move v1, v2

    .line 242
    :goto_f
    add-int/2addr v0, v1

    .line 243
    mul-int/lit8 v0, v0, 0x29

    .line 244
    .line 245
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

    .line 246
    .line 247
    if-eqz v1, :cond_11

    .line 248
    .line 249
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 250
    .line 251
    .line 252
    move-result v1

    .line 253
    goto :goto_10

    .line 254
    :cond_11
    move v1, v2

    .line 255
    :goto_10
    add-int/2addr v0, v1

    .line 256
    mul-int/lit8 v0, v0, 0x29

    .line 257
    .line 258
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

    .line 259
    .line 260
    if-eqz v1, :cond_12

    .line 261
    .line 262
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    goto :goto_11

    .line 267
    :cond_12
    move v1, v2

    .line 268
    :goto_11
    add-int/2addr v0, v1

    .line 269
    mul-int/lit8 v0, v0, 0x29

    .line 270
    .line 271
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 272
    .line 273
    if-eqz v1, :cond_13

    .line 274
    .line 275
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 276
    .line 277
    .line 278
    move-result v2

    .line 279
    :cond_13
    add-int/2addr v0, v2

    .line 280
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 281
    .line 282
    :cond_14
    return v0
.end method

.method public isTitlePositionCenter()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->position:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupTitlePosition;

    .line 4
    .line 5
    const-string v0, "center"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isTitlePositionMiddle()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->position:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupTitlePosition;

    .line 4
    .line 5
    const-string v0, "middle"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isTurboCoupon()Z
    .locals 1

    .line 1
    const-string v0, "anchor-daily-task"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isValid()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->giftItemId:I

    .line 10
    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleShowAfterWatch:I

    .line 14
    .line 15
    if-lez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->title:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->content:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->bubbleText:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->iconUrl:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->displayRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleRule;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->schema:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->button:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupButton;

    .line 52
    .line 53
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 54
    .line 55
    if-nez v0, :cond_7

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->remind:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubblePopupRemind;

    .line 62
    .line 63
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_8

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->type:Ljava/lang/String;

    .line 68
    .line 69
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_9

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->extra:Ljava/lang/String;

    .line 74
    .line 75
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 76
    .line 77
    if-nez v0, :cond_a

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->toast:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleToast;

    .line 84
    .line 85
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 86
    .line 87
    if-nez v0, :cond_b

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->header:Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleHeader;

    .line 94
    .line 95
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 96
    .line 97
    if-nez v0, :cond_c

    .line 98
    .line 99
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->backgroundColor:Ljava/lang/String;

    .line 100
    .line 101
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 102
    .line 103
    if-nez v0, :cond_d

    .line 104
    .line 105
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentColor:Ljava/lang/String;

    .line 106
    .line 107
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 108
    .line 109
    if-nez v0, :cond_e

    .line 110
    .line 111
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->styleType:Lcom/p1/mobile/putong/live/base/data/BLiveBottomPopupStyleTypeEnum;

    .line 120
    .line 121
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

    .line 122
    .line 123
    if-nez v0, :cond_f

    .line 124
    .line 125
    new-instance v0, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .line 129
    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->descriptions:Ljava/util/List;

    .line 131
    .line 132
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

    .line 133
    .line 134
    if-nez v0, :cond_10

    .line 135
    .line 136
    new-instance v0, Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .line 140
    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->window:Ljava/util/List;

    .line 142
    .line 143
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 144
    .line 145
    if-nez v0, :cond_11

    .line 146
    .line 147
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->contentDesc:Ljava/lang/String;

    .line 148
    .line 149
    :cond_11
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftBubbleConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
