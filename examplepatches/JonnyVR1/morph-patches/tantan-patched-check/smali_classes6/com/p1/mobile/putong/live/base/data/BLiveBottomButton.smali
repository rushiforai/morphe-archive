.class public Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivebottombutton"


# instance fields
.field public alignment:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public bubbleIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public callback:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public category:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public enableNewlyEffect:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public enableRedDot:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public fillUp:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public icon:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public id:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isClosed:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public jumpType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public labels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

.field public minAnchorHierarchy:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public minAnchorHierarchyTip:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public redDotCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public text:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->nullCheck()V

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

    .line 137
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->jumpType:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->jumpType:Ljava/lang/String;

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    new-instance v2, Ll/yr1;

    .line 31
    .line 32
    invoke-direct {v2}, Ll/yr1;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 40
    .line 41
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableRedDot:Z

    .line 42
    .line 43
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableRedDot:Z

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 46
    .line 47
    if-eqz v1, :cond_1

    .line 48
    .line 49
    new-instance v2, Ll/zr1;

    .line 50
    .line 51
    invoke-direct {v2}, Ll/zr1;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 59
    .line 60
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->fillUp:Z

    .line 61
    .line 62
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->fillUp:Z

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 67
    .line 68
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchy:I

    .line 69
    .line 70
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchy:I

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchyTip:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchyTip:Ljava/lang/String;

    .line 75
    .line 76
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->callback:Z

    .line 77
    .line 78
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->callback:Z

    .line 79
    .line 80
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableNewlyEffect:Z

    .line 81
    .line 82
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableNewlyEffect:Z

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 85
    .line 86
    if-eqz v1, :cond_2

    .line 87
    .line 88
    new-instance v2, Ll/as1;

    .line 89
    .line 90
    invoke-direct {v2}, Ll/as1;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 98
    .line 99
    :cond_2
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isClosed:Z

    .line 100
    .line 101
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isClosed:Z

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->text:Ljava/lang/String;

    .line 104
    .line 105
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->text:Ljava/lang/String;

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 108
    .line 109
    if-eqz v1, :cond_3

    .line 110
    .line 111
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTicker;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 116
    .line 117
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 118
    .line 119
    if-eqz v1, :cond_4

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 126
    .line 127
    :cond_4
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->redDotCount:I

    .line 128
    .line 129
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->redDotCount:I

    .line 130
    .line 131
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->alignment:I

    .line 132
    .line 133
    iput p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->alignment:I

    .line 134
    .line 135
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->jumpType:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->jumpType:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 40
    .line 41
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 56
    .line 57
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 58
    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-eqz v1, :cond_2

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableRedDot:Z

    .line 66
    .line 67
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableRedDot:Z

    .line 68
    .line 69
    if-ne v1, v3, :cond_2

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 72
    .line 73
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->fillUp:Z

    .line 82
    .line 83
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->fillUp:Z

    .line 84
    .line 85
    if-ne v1, v3, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchy:I

    .line 98
    .line 99
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchy:I

    .line 100
    .line 101
    if-ne v1, v3, :cond_2

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchyTip:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchyTip:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->callback:Z

    .line 114
    .line 115
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->callback:Z

    .line 116
    .line 117
    if-ne v1, v3, :cond_2

    .line 118
    .line 119
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableNewlyEffect:Z

    .line 120
    .line 121
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableNewlyEffect:Z

    .line 122
    .line 123
    if-ne v1, v3, :cond_2

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 126
    .line 127
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 128
    .line 129
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_2

    .line 134
    .line 135
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isClosed:Z

    .line 136
    .line 137
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isClosed:Z

    .line 138
    .line 139
    if-ne v1, v3, :cond_2

    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->text:Ljava/lang/String;

    .line 142
    .line 143
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->text:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-eqz v1, :cond_2

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 152
    .line 153
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 154
    .line 155
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_2

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 162
    .line 163
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 164
    .line 165
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    if-eqz v1, :cond_2

    .line 170
    .line 171
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->redDotCount:I

    .line 172
    .line 173
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->redDotCount:I

    .line 174
    .line 175
    if-ne v1, v3, :cond_2

    .line 176
    .line 177
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->alignment:I

    .line 178
    .line 179
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->alignment:I

    .line 180
    .line 181
    if-ne p0, p1, :cond_2

    .line 182
    .line 183
    return v0

    .line 184
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivebottombutton"

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v1, v2

    .line 23
    :goto_0
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->jumpType:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move v1, v2

    .line 36
    :goto_1
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 40
    .line 41
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v1, :cond_2

    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move v1, v2

    .line 54
    :goto_2
    add-int/2addr v0, v1

    .line 55
    mul-int/lit8 v0, v0, 0x29

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 58
    .line 59
    if-eqz v1, :cond_3

    .line 60
    .line 61
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    goto :goto_3

    .line 66
    :cond_3
    move v1, v2

    .line 67
    :goto_3
    add-int/2addr v0, v1

    .line 68
    mul-int/lit8 v0, v0, 0x29

    .line 69
    .line 70
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableRedDot:Z

    .line 71
    .line 72
    const/16 v3, 0x4d5

    .line 73
    .line 74
    const/16 v4, 0x4cf

    .line 75
    .line 76
    if-eqz v1, :cond_4

    .line 77
    .line 78
    move v1, v4

    .line 79
    goto :goto_4

    .line 80
    :cond_4
    move v1, v3

    .line 81
    :goto_4
    add-int/2addr v0, v1

    .line 82
    mul-int/lit8 v0, v0, 0x29

    .line 83
    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 85
    .line 86
    if-eqz v1, :cond_5

    .line 87
    .line 88
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    goto :goto_5

    .line 93
    :cond_5
    move v1, v2

    .line 94
    :goto_5
    add-int/2addr v0, v1

    .line 95
    mul-int/lit8 v0, v0, 0x29

    .line 96
    .line 97
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->fillUp:Z

    .line 98
    .line 99
    if-eqz v1, :cond_6

    .line 100
    .line 101
    move v1, v4

    .line 102
    goto :goto_6

    .line 103
    :cond_6
    move v1, v3

    .line 104
    :goto_6
    add-int/2addr v0, v1

    .line 105
    mul-int/lit8 v0, v0, 0x29

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz v1, :cond_7

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    goto :goto_7

    .line 116
    :cond_7
    move v1, v2

    .line 117
    :goto_7
    add-int/2addr v0, v1

    .line 118
    mul-int/lit8 v0, v0, 0x29

    .line 119
    .line 120
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchy:I

    .line 121
    .line 122
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchyTip:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz v1, :cond_8

    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    goto :goto_8

    .line 134
    :cond_8
    move v1, v2

    .line 135
    :goto_8
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x29

    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->callback:Z

    .line 139
    .line 140
    if-eqz v1, :cond_9

    .line 141
    .line 142
    move v1, v4

    .line 143
    goto :goto_9

    .line 144
    :cond_9
    move v1, v3

    .line 145
    :goto_9
    add-int/2addr v0, v1

    .line 146
    mul-int/lit8 v0, v0, 0x29

    .line 147
    .line 148
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableNewlyEffect:Z

    .line 149
    .line 150
    if-eqz v1, :cond_a

    .line 151
    .line 152
    move v1, v4

    .line 153
    goto :goto_a

    .line 154
    :cond_a
    move v1, v3

    .line 155
    :goto_a
    add-int/2addr v0, v1

    .line 156
    mul-int/lit8 v0, v0, 0x29

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 159
    .line 160
    if-eqz v1, :cond_b

    .line 161
    .line 162
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    goto :goto_b

    .line 167
    :cond_b
    move v1, v2

    .line 168
    :goto_b
    add-int/2addr v0, v1

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isClosed:Z

    .line 172
    .line 173
    if-eqz v1, :cond_c

    .line 174
    .line 175
    move v3, v4

    .line 176
    :cond_c
    add-int/2addr v0, v3

    .line 177
    mul-int/lit8 v0, v0, 0x29

    .line 178
    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->text:Ljava/lang/String;

    .line 180
    .line 181
    if-eqz v1, :cond_d

    .line 182
    .line 183
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    goto :goto_c

    .line 188
    :cond_d
    move v1, v2

    .line 189
    :goto_c
    add-int/2addr v0, v1

    .line 190
    mul-int/lit8 v0, v0, 0x29

    .line 191
    .line 192
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 193
    .line 194
    if-eqz v1, :cond_e

    .line 195
    .line 196
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveTicker;->hashCode()I

    .line 197
    .line 198
    .line 199
    move-result v1

    .line 200
    goto :goto_d

    .line 201
    :cond_e
    move v1, v2

    .line 202
    :goto_d
    add-int/2addr v0, v1

    .line 203
    mul-int/lit8 v0, v0, 0x29

    .line 204
    .line 205
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 206
    .line 207
    if-eqz v1, :cond_f

    .line 208
    .line 209
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->hashCode()I

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    :cond_f
    add-int/2addr v0, v2

    .line 214
    mul-int/lit8 v0, v0, 0x29

    .line 215
    .line 216
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->redDotCount:I

    .line 217
    .line 218
    add-int/2addr v0, v1

    .line 219
    mul-int/lit8 v0, v0, 0x29

    .line 220
    .line 221
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->alignment:I

    .line 222
    .line 223
    add-int/2addr v0, v1

    .line 224
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 225
    .line 226
    :cond_10
    return v0
.end method

.method public isGame()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isGiftSwitch()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 2
    .line 3
    const/16 v0, 0x76

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isMsgRemind()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 2
    .line 3
    const/16 v0, 0x8d

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isSetting()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->category:I

    .line 2
    .line 3
    const/4 v0, 0x3

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->jumpType:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->jumpType:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    new-instance v0, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->bubbleIds:Ljava/util/List;

    .line 31
    .line 32
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 33
    .line 34
    if-nez v0, :cond_4

    .line 35
    .line 36
    new-instance v0, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 42
    .line 43
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_5

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 48
    .line 49
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchyTip:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_6

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->minAnchorHierarchyTip:Ljava/lang/String;

    .line 54
    .line 55
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 56
    .line 57
    if-nez v0, :cond_7

    .line 58
    .line 59
    new-instance v0, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 65
    .line 66
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->text:Ljava/lang/String;

    .line 67
    .line 68
    if-nez v0, :cond_8

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->text:Ljava/lang/String;

    .line 71
    .line 72
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 73
    .line 74
    if-nez v0, :cond_9

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveTicker;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->ticker:Lcom/p1/mobile/putong/live/base/data/BLiveTicker;

    .line 81
    .line 82
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 83
    .line 84
    if-nez v0, :cond_a

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->animation:Lcom/p1/mobile/putong/live/base/data/BLiveButtonAnimation;

    .line 91
    .line 92
    :cond_a
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
