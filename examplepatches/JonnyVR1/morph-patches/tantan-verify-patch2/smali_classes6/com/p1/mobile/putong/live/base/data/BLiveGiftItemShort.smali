.class public Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivegiftitemshort"


# instance fields
.field public createdTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public discounts:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;",
            ">;"
        }
    .end annotation
.end field

.field public endRightTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public endTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public expiredTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public expiredTimeText:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public fastGiftNum:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public giftSource:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public hdUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public id:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public interactStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public labels:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public localRightTag:Lcom/p1/mobile/putong/data/LangModel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public nextValidTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public remain:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public rightTag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public rightTagTextColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public showOutside:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public startRightTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public startTagColor:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public tag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;)Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDiscountItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nullCheck()V

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

    .line 170
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->fastGiftNum:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->fastGiftNum:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->giftSource:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->giftSource:I

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->remain:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->remain:I

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTime:J

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTime:J

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nextValidTime:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nextValidTime:J

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showOutside:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showOutside:Z

    .line 33
    .line 34
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->createdTime:J

    .line 35
    .line 36
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->createdTime:J

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 51
    .line 52
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 55
    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    new-instance v2, Ll/w02;

    .line 61
    .line 62
    invoke-direct {v2}, Ll/w02;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 70
    .line 71
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 72
    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 80
    .line 81
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 82
    .line 83
    if-eqz v1, :cond_3

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 90
    .line 91
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hdUrl:Ljava/lang/String;

    .line 92
    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hdUrl:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 96
    .line 97
    if-eqz v1, :cond_4

    .line 98
    .line 99
    new-instance v2, Ll/x02;

    .line 100
    .line 101
    invoke-direct {v2}, Ll/x02;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 109
    .line 110
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 111
    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 115
    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 119
    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 123
    .line 124
    if-eqz v1, :cond_5

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 131
    .line 132
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 133
    .line 134
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 135
    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 137
    .line 138
    if-eqz v1, :cond_6

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->clone()Lcom/p1/mobile/putong/data/LangModel;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 145
    .line 146
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 147
    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 151
    .line 152
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTagTextColor:Ljava/lang/String;

    .line 155
    .line 156
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTagTextColor:Ljava/lang/String;

    .line 157
    .line 158
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 159
    .line 160
    if-eqz p0, :cond_7

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 167
    .line 168
    :cond_7
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 169
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->fastGiftNum:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->fastGiftNum:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->giftSource:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->giftSource:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->remain:I

    .line 32
    .line 33
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->remain:I

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTime:J

    .line 38
    .line 39
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTime:J

    .line 40
    .line 41
    cmp-long v1, v3, v5

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nextValidTime:J

    .line 46
    .line 47
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nextValidTime:J

    .line 48
    .line 49
    cmp-long v1, v3, v5

    .line 50
    .line 51
    if-nez v1, :cond_2

    .line 52
    .line 53
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showOutside:Z

    .line 54
    .line 55
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showOutside:Z

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->createdTime:J

    .line 60
    .line 61
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->createdTime:J

    .line 62
    .line 63
    cmp-long v1, v3, v5

    .line 64
    .line 65
    if-nez v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 78
    .line 79
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 80
    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-eqz v1, :cond_2

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 98
    .line 99
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 108
    .line 109
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hdUrl:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hdUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 138
    .line 139
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 148
    .line 149
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    if-eqz v1, :cond_2

    .line 156
    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 158
    .line 159
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 160
    .line 161
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-eqz v1, :cond_2

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 168
    .line 169
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    if-eqz v1, :cond_2

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 178
    .line 179
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 180
    .line 181
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    if-eqz v1, :cond_2

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 188
    .line 189
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-eqz v1, :cond_2

    .line 196
    .line 197
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 198
    .line 199
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 200
    .line 201
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_2

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 208
    .line 209
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 210
    .line 211
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-eqz v1, :cond_2

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 220
    .line 221
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    if-eqz v1, :cond_2

    .line 226
    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTagTextColor:Ljava/lang/String;

    .line 228
    .line 229
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTagTextColor:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    if-eqz v1, :cond_2

    .line 236
    .line 237
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 238
    .line 239
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 240
    .line 241
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p0

    .line 245
    if-eqz p0, :cond_2

    .line 246
    .line 247
    return v0

    .line 248
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivegiftitemshort"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 6

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_13

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->id:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->fastGiftNum:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->giftSource:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->remain:I

    .line 23
    .line 24
    add-int/2addr v0, v1

    .line 25
    mul-int/lit8 v0, v0, 0x29

    .line 26
    .line 27
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTime:J

    .line 28
    .line 29
    const/16 v3, 0x20

    .line 30
    .line 31
    ushr-long v4, v1, v3

    .line 32
    .line 33
    xor-long/2addr v1, v4

    .line 34
    long-to-int v1, v1

    .line 35
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nextValidTime:J

    .line 39
    .line 40
    ushr-long v4, v1, v3

    .line 41
    .line 42
    xor-long/2addr v1, v4

    .line 43
    long-to-int v1, v1

    .line 44
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showOutside:Z

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    const/16 v1, 0x4cf

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_0
    const/16 v1, 0x4d5

    .line 55
    .line 56
    :goto_0
    add-int/2addr v0, v1

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->createdTime:J

    .line 60
    .line 61
    ushr-long v3, v1, v3

    .line 62
    .line 63
    xor-long/2addr v1, v3

    .line 64
    long-to-int v1, v1

    .line 65
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x29

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 69
    .line 70
    const/4 v2, 0x0

    .line 71
    if-eqz v1, :cond_1

    .line 72
    .line 73
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    goto :goto_1

    .line 78
    :cond_1
    move v1, v2

    .line 79
    :goto_1
    add-int/2addr v0, v1

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 83
    .line 84
    if-eqz v1, :cond_2

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->hashCode()I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    goto :goto_2

    .line 91
    :cond_2
    move v1, v2

    .line 92
    :goto_2
    add-int/2addr v0, v1

    .line 93
    mul-int/lit8 v0, v0, 0x29

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz v1, :cond_3

    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    goto :goto_3

    .line 104
    :cond_3
    move v1, v2

    .line 105
    :goto_3
    add-int/2addr v0, v1

    .line 106
    mul-int/lit8 v0, v0, 0x29

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 109
    .line 110
    if-eqz v1, :cond_4

    .line 111
    .line 112
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    goto :goto_4

    .line 117
    :cond_4
    move v1, v2

    .line 118
    :goto_4
    add-int/2addr v0, v1

    .line 119
    mul-int/lit8 v0, v0, 0x29

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 122
    .line 123
    if-eqz v1, :cond_5

    .line 124
    .line 125
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->hashCode()I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    goto :goto_5

    .line 130
    :cond_5
    move v1, v2

    .line 131
    :goto_5
    add-int/2addr v0, v1

    .line 132
    mul-int/lit8 v0, v0, 0x29

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 135
    .line 136
    if-eqz v1, :cond_6

    .line 137
    .line 138
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->hashCode()I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    goto :goto_6

    .line 143
    :cond_6
    move v1, v2

    .line 144
    :goto_6
    add-int/2addr v0, v1

    .line 145
    mul-int/lit8 v0, v0, 0x29

    .line 146
    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hdUrl:Ljava/lang/String;

    .line 148
    .line 149
    if-eqz v1, :cond_7

    .line 150
    .line 151
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    goto :goto_7

    .line 156
    :cond_7
    move v1, v2

    .line 157
    :goto_7
    add-int/2addr v0, v1

    .line 158
    mul-int/lit8 v0, v0, 0x29

    .line 159
    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 161
    .line 162
    if-eqz v1, :cond_8

    .line 163
    .line 164
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    goto :goto_8

    .line 169
    :cond_8
    move v1, v2

    .line 170
    :goto_8
    add-int/2addr v0, v1

    .line 171
    mul-int/lit8 v0, v0, 0x29

    .line 172
    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 174
    .line 175
    if-eqz v1, :cond_9

    .line 176
    .line 177
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    goto :goto_9

    .line 182
    :cond_9
    move v1, v2

    .line 183
    :goto_9
    add-int/2addr v0, v1

    .line 184
    mul-int/lit8 v0, v0, 0x29

    .line 185
    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 187
    .line 188
    if-eqz v1, :cond_a

    .line 189
    .line 190
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 191
    .line 192
    .line 193
    move-result v1

    .line 194
    goto :goto_a

    .line 195
    :cond_a
    move v1, v2

    .line 196
    :goto_a
    add-int/2addr v0, v1

    .line 197
    mul-int/lit8 v0, v0, 0x29

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 200
    .line 201
    if-eqz v1, :cond_b

    .line 202
    .line 203
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    goto :goto_b

    .line 208
    :cond_b
    move v1, v2

    .line 209
    :goto_b
    add-int/2addr v0, v1

    .line 210
    mul-int/lit8 v0, v0, 0x29

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->nameStatus:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;

    .line 213
    .line 214
    if-eqz v1, :cond_c

    .line 215
    .line 216
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNameStatus;->hashCode()I

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    goto :goto_c

    .line 221
    :cond_c
    move v1, v2

    .line 222
    :goto_c
    add-int/2addr v0, v1

    .line 223
    mul-int/lit8 v0, v0, 0x29

    .line 224
    .line 225
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 226
    .line 227
    if-eqz v1, :cond_d

    .line 228
    .line 229
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    goto :goto_d

    .line 234
    :cond_d
    move v1, v2

    .line 235
    :goto_d
    add-int/2addr v0, v1

    .line 236
    mul-int/lit8 v0, v0, 0x29

    .line 237
    .line 238
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 239
    .line 240
    if-eqz v1, :cond_e

    .line 241
    .line 242
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LangModel;->hashCode()I

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    goto :goto_e

    .line 247
    :cond_e
    move v1, v2

    .line 248
    :goto_e
    add-int/2addr v0, v1

    .line 249
    mul-int/lit8 v0, v0, 0x29

    .line 250
    .line 251
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 252
    .line 253
    if-eqz v1, :cond_f

    .line 254
    .line 255
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    goto :goto_f

    .line 260
    :cond_f
    move v1, v2

    .line 261
    :goto_f
    add-int/2addr v0, v1

    .line 262
    mul-int/lit8 v0, v0, 0x29

    .line 263
    .line 264
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 265
    .line 266
    if-eqz v1, :cond_10

    .line 267
    .line 268
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    goto :goto_10

    .line 273
    :cond_10
    move v1, v2

    .line 274
    :goto_10
    add-int/2addr v0, v1

    .line 275
    mul-int/lit8 v0, v0, 0x29

    .line 276
    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTagTextColor:Ljava/lang/String;

    .line 278
    .line 279
    if-eqz v1, :cond_11

    .line 280
    .line 281
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 282
    .line 283
    .line 284
    move-result v1

    .line 285
    goto :goto_11

    .line 286
    :cond_11
    move v1, v2

    .line 287
    :goto_11
    add-int/2addr v0, v1

    .line 288
    mul-int/lit8 v0, v0, 0x29

    .line 289
    .line 290
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 291
    .line 292
    if-eqz v1, :cond_12

    .line 293
    .line 294
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->hashCode()I

    .line 295
    .line 296
    .line 297
    move-result v2

    .line 298
    :cond_12
    add-int/2addr v0, v2

    .line 299
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 300
    .line 301
    :cond_13
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactStatus:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->interactRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftInteractRules;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->expiredTimeText:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    new-instance v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->labels:Ljava/util/List;

    .line 35
    .line 36
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 37
    .line 38
    if-nez v0, :cond_4

    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->showAnimRules:Lcom/p1/mobile/putong/live/base/data/BLiveGiftShowRules;

    .line 45
    .line 46
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 47
    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->slotGiftInfo:Lcom/p1/mobile/putong/live/base/data/BLiveSlotGiftInfo;

    .line 55
    .line 56
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hdUrl:Ljava/lang/String;

    .line 57
    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->hdUrl:Ljava/lang/String;

    .line 61
    .line 62
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 63
    .line 64
    if-nez v0, :cond_7

    .line 65
    .line 66
    new-instance v0, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->discounts:Ljava/util/List;

    .line 72
    .line 73
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 74
    .line 75
    if-nez v0, :cond_8

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->tag:Ljava/lang/String;

    .line 78
    .line 79
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 80
    .line 81
    if-nez v0, :cond_9

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startTagColor:Ljava/lang/String;

    .line 84
    .line 85
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 86
    .line 87
    if-nez v0, :cond_a

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endTagColor:Ljava/lang/String;

    .line 90
    .line 91
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 92
    .line 93
    if-nez v0, :cond_b

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTag:Ljava/lang/String;

    .line 96
    .line 97
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 98
    .line 99
    if-nez v0, :cond_c

    .line 100
    .line 101
    invoke-static {}, Lcom/p1/mobile/putong/data/LangModel;->new_()Lcom/p1/mobile/putong/data/LangModel;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->localRightTag:Lcom/p1/mobile/putong/data/LangModel;

    .line 106
    .line 107
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 108
    .line 109
    if-nez v0, :cond_d

    .line 110
    .line 111
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->startRightTagColor:Ljava/lang/String;

    .line 112
    .line 113
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 114
    .line 115
    if-nez v0, :cond_e

    .line 116
    .line 117
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->endRightTagColor:Ljava/lang/String;

    .line 118
    .line 119
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTagTextColor:Ljava/lang/String;

    .line 120
    .line 121
    if-nez v0, :cond_f

    .line 122
    .line 123
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->rightTagTextColor:Ljava/lang/String;

    .line 124
    .line 125
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 126
    .line 127
    if-nez v0, :cond_10

    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->flyMicInfo:Lcom/p1/mobile/putong/live/base/data/BLiveIntlFlyMicEffectConfig;

    .line 134
    .line 135
    :cond_10
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItemShort;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
