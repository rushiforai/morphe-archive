.class public Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivebottommenu"


# instance fields
.field public bubbleOrder:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
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

.field public bubbles:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;",
            ">;"
        }
    .end annotation
.end field

.field public buttons:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            ">;"
        }
    .end annotation
.end field

.field public categorys:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;",
            ">;"
        }
    .end annotation
.end field

.field public chatBox:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;",
            ">;"
        }
    .end annotation
.end field

.field public enableInputButton:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public enableLatestPlayButton:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public enableSettingButton:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public everyDayShowMaxCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public redDotDisappearMod:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public userEnableBubble:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public version:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;)Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;)Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveChatBox;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->nullCheck()V

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

    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    new-instance v2, Ll/es1;

    .line 21
    .line 22
    invoke-direct {v2}, Ll/es1;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

    .line 30
    .line 31
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

    .line 32
    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    new-instance v2, Ll/fs1;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/fs1;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

    .line 45
    .line 46
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 55
    .line 56
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbleOrder:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v1, :cond_4

    .line 59
    .line 60
    new-instance v2, Ll/gs1;

    .line 61
    .line 62
    invoke-direct {v2}, Ll/gs1;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbleOrder:Ljava/util/List;

    .line 70
    .line 71
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->redDotDisappearMod:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->redDotDisappearMod:Ljava/lang/String;

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->userEnableBubble:Z

    .line 76
    .line 77
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->userEnableBubble:Z

    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->everyDayShowMaxCount:I

    .line 80
    .line 81
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->everyDayShowMaxCount:I

    .line 82
    .line 83
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 84
    .line 85
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 86
    .line 87
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableInputButton:Z

    .line 88
    .line 89
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableInputButton:Z

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbles:Ljava/util/List;

    .line 92
    .line 93
    if-eqz v1, :cond_5

    .line 94
    .line 95
    new-instance v2, Ll/hs1;

    .line 96
    .line 97
    invoke-direct {v2}, Ll/hs1;-><init>()V

    .line 98
    .line 99
    .line 100
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbles:Ljava/util/List;

    .line 105
    .line 106
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 107
    .line 108
    if-eqz v1, :cond_6

    .line 109
    .line 110
    new-instance v2, Ll/is1;

    .line 111
    .line 112
    invoke-direct {v2}, Ll/is1;-><init>()V

    .line 113
    .line 114
    .line 115
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 120
    .line 121
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->version:Ljava/lang/String;

    .line 122
    .line 123
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->version:Ljava/lang/String;

    .line 124
    .line 125
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableLatestPlayButton:Z

    .line 126
    .line 127
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableLatestPlayButton:Z

    .line 128
    .line 129
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 130
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbleOrder:Ljava/util/List;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbleOrder:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->redDotDisappearMod:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->redDotDisappearMod:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->userEnableBubble:Z

    .line 74
    .line 75
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->userEnableBubble:Z

    .line 76
    .line 77
    if-ne v1, v3, :cond_2

    .line 78
    .line 79
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->everyDayShowMaxCount:I

    .line 80
    .line 81
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->everyDayShowMaxCount:I

    .line 82
    .line 83
    if-ne v1, v3, :cond_2

    .line 84
    .line 85
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 86
    .line 87
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 88
    .line 89
    if-ne v1, v3, :cond_2

    .line 90
    .line 91
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableInputButton:Z

    .line 92
    .line 93
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableInputButton:Z

    .line 94
    .line 95
    if-ne v1, v3, :cond_2

    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbles:Ljava/util/List;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbles:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->version:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->version:Ljava/lang/String;

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
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableLatestPlayButton:Z

    .line 128
    .line 129
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableLatestPlayButton:Z

    .line 130
    .line 131
    if-ne p0, p1, :cond_2

    .line 132
    .line 133
    return v0

    .line 134
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivebottommenu"

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
    if-nez v0, :cond_d

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->settingButton:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButton;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->buttons:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->categorys:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->menu:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButtonDivision;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbleOrder:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->redDotDisappearMod:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->userEnableBubble:Z

    .line 87
    .line 88
    const/16 v3, 0x4d5

    .line 89
    .line 90
    const/16 v4, 0x4cf

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    move v1, v4

    .line 95
    goto :goto_6

    .line 96
    :cond_6
    move v1, v3

    .line 97
    :goto_6
    add-int/2addr v0, v1

    .line 98
    mul-int/lit8 v0, v0, 0x29

    .line 99
    .line 100
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->everyDayShowMaxCount:I

    .line 101
    .line 102
    add-int/2addr v0, v1

    .line 103
    mul-int/lit8 v0, v0, 0x29

    .line 104
    .line 105
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableSettingButton:Z

    .line 106
    .line 107
    if-eqz v1, :cond_7

    .line 108
    .line 109
    move v1, v4

    .line 110
    goto :goto_7

    .line 111
    :cond_7
    move v1, v3

    .line 112
    :goto_7
    add-int/2addr v0, v1

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableInputButton:Z

    .line 116
    .line 117
    if-eqz v1, :cond_8

    .line 118
    .line 119
    move v1, v4

    .line 120
    goto :goto_8

    .line 121
    :cond_8
    move v1, v3

    .line 122
    :goto_8
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->bubbles:Ljava/util/List;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->chatBox:Ljava/util/List;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->version:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    :cond_b
    add-int/2addr v0, v2

    .line 160
    mul-int/lit8 v0, v0, 0x29

    .line 161
    .line 162
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->enableLatestPlayButton:Z

    .line 163
    .line 164
    if-eqz v1, :cond_c

    .line 165
    .line 166
    move v3, v4

    .line 167
    :cond_c
    add-int/2addr v0, v3

    .line 168
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 169
    .line 170
    :cond_d
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomMenu;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
