.class public Lcom/p1/mobile/putong/feed/data/TopicMoment;
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
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "topicmoment"


# instance fields
.field public activityUserCounter:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public activityUserIds:Ljava/util/List;
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

.field public commentCounter:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public consensusCounter:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public consensusUserIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public description:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public guideTab:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public headIcon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public hideOwner:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public icon:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field private isEnterGroup:Z

.field public landingPage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public momentCounter:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public momentId:Ljava/lang/String;

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public options:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/VoteOptions;",
            ">;"
        }
    .end annotation
.end field

.field public owner:Lcom/p1/mobile/putong/data/IdBoxed;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public priority:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public selected:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public source:Lcom/p1/mobile/putong/feed/data/TopicSource;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public sourceTabs:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public status:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public topicType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public typeAlias:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public userViewCounter:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public viewCounter:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public voteCounter:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/TopicMoment$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/TopicMoment$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/TopicMoment$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/TopicMoment$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isEnterGroup:Z

    .line 6
    .line 7
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

.method public static synthetic c(Lcom/p1/mobile/putong/feed/data/VoteOptions;)Lcom/p1/mobile/putong/feed/data/VoteOptions;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/VoteOptions;->clone()Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/TopicMoment;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->nullCheck()V

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

    .line 192
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->clone()Lcom/p1/mobile/putong/feed/data/TopicMoment;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/TopicMoment;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/IdBoxed;->clone()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->priority:Ljava/lang/String;

    .line 41
    .line 42
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->priority:Ljava/lang/String;

    .line 43
    .line 44
    iget-wide v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->createdTime:D

    .line 45
    .line 46
    iput-wide v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->createdTime:D

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 51
    .line 52
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->momentCounter:I

    .line 53
    .line 54
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->momentCounter:I

    .line 55
    .line 56
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 57
    .line 58
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 59
    .line 60
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 61
    .line 62
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->voteCounter:I

    .line 63
    .line 64
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->commentCounter:I

    .line 65
    .line 66
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->commentCounter:I

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 69
    .line 70
    if-eqz v1, :cond_1

    .line 71
    .line 72
    new-instance v2, Ll/g9j0;

    .line 73
    .line 74
    invoke-direct {v2}, Ll/g9j0;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 82
    .line 83
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 92
    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 96
    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    new-instance v2, Ll/h9j0;

    .line 100
    .line 101
    invoke-direct {v2}, Ll/h9j0;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 109
    .line 110
    :cond_2
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->hideOwner:Z

    .line 111
    .line 112
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->hideOwner:Z

    .line 113
    .line 114
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserCounter:I

    .line 115
    .line 116
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserCounter:I

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 119
    .line 120
    if-eqz v1, :cond_3

    .line 121
    .line 122
    new-instance v2, Ll/i9j0;

    .line 123
    .line 124
    invoke-direct {v2}, Ll/i9j0;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 132
    .line 133
    :cond_3
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->viewCounter:I

    .line 134
    .line 135
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->viewCounter:I

    .line 136
    .line 137
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->userViewCounter:I

    .line 138
    .line 139
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->userViewCounter:I

    .line 140
    .line 141
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 142
    .line 143
    if-eqz v1, :cond_4

    .line 144
    .line 145
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->clone()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 150
    .line 151
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 152
    .line 153
    if-eqz v1, :cond_5

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/TopicSource;->clone()Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 160
    .line 161
    :cond_5
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 162
    .line 163
    iput v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 164
    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 166
    .line 167
    if-eqz v1, :cond_6

    .line 168
    .line 169
    new-instance v2, Ll/j9j0;

    .line 170
    .line 171
    invoke-direct {v2}, Ll/j9j0;-><init>()V

    .line 172
    .line 173
    .line 174
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 179
    .line 180
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 181
    .line 182
    if-eqz p0, :cond_7

    .line 183
    .line 184
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;->clone()Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 189
    .line 190
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

    .line 191
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->clone()Lcom/p1/mobile/putong/feed/data/TopicMoment;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->priority:Ljava/lang/String;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->priority:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->createdTime:D

    .line 94
    .line 95
    iget-wide v5, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->createdTime:D

    .line 96
    .line 97
    cmpl-double v1, v3, v5

    .line 98
    .line 99
    if-nez v1, :cond_2

    .line 100
    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eqz v1, :cond_2

    .line 110
    .line 111
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 112
    .line 113
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 114
    .line 115
    if-ne v1, v3, :cond_2

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 118
    .line 119
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 138
    .line 139
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 148
    .line 149
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->hideOwner:Z

    .line 158
    .line 159
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->hideOwner:Z

    .line 160
    .line 161
    if-ne v1, v3, :cond_2

    .line 162
    .line 163
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

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
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 194
    .line 195
    iget v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 196
    .line 197
    if-ne v1, v3, :cond_2

    .line 198
    .line 199
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 200
    .line 201
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 210
    .line 211
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 212
    .line 213
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result p0

    .line 217
    if-eqz p0, :cond_2

    .line 218
    .line 219
    return v0

    .line 220
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "topicmoment"

    .line 2
    .line 3
    return-object p0
.end method

.method public getTopicNameWithPrefix()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "#"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public hashCode()I
    .locals 7

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/IdBoxed;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->priority:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->createdTime:D

    .line 111
    .line 112
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 113
    .line 114
    .line 115
    move-result-wide v3

    .line 116
    mul-int/lit8 v0, v0, 0x29

    .line 117
    .line 118
    const/16 v1, 0x20

    .line 119
    .line 120
    ushr-long v5, v3, v1

    .line 121
    .line 122
    xor-long/2addr v3, v5

    .line 123
    long-to-int v1, v3

    .line 124
    add-int/2addr v0, v1

    .line 125
    mul-int/lit8 v0, v0, 0x29

    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v1, :cond_8

    .line 130
    .line 131
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    goto :goto_8

    .line 136
    :cond_8
    move v1, v2

    .line 137
    :goto_8
    add-int/2addr v0, v1

    .line 138
    mul-int/lit8 v0, v0, 0x29

    .line 139
    .line 140
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->selected:Z

    .line 141
    .line 142
    const/16 v3, 0x4d5

    .line 143
    .line 144
    const/16 v4, 0x4cf

    .line 145
    .line 146
    if-eqz v1, :cond_9

    .line 147
    .line 148
    move v1, v4

    .line 149
    goto :goto_9

    .line 150
    :cond_9
    move v1, v3

    .line 151
    :goto_9
    add-int/2addr v0, v1

    .line 152
    mul-int/lit8 v0, v0, 0x29

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 155
    .line 156
    if-eqz v1, :cond_a

    .line 157
    .line 158
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    goto :goto_a

    .line 163
    :cond_a
    move v1, v2

    .line 164
    :goto_a
    add-int/2addr v0, v1

    .line 165
    mul-int/lit8 v0, v0, 0x29

    .line 166
    .line 167
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 168
    .line 169
    if-eqz v1, :cond_b

    .line 170
    .line 171
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    goto :goto_b

    .line 176
    :cond_b
    move v1, v2

    .line 177
    :goto_b
    add-int/2addr v0, v1

    .line 178
    mul-int/lit8 v0, v0, 0x29

    .line 179
    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 181
    .line 182
    if-eqz v1, :cond_c

    .line 183
    .line 184
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    goto :goto_c

    .line 189
    :cond_c
    move v1, v2

    .line 190
    :goto_c
    add-int/2addr v0, v1

    .line 191
    mul-int/lit8 v0, v0, 0x29

    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 194
    .line 195
    if-eqz v1, :cond_d

    .line 196
    .line 197
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    goto :goto_d

    .line 202
    :cond_d
    move v1, v2

    .line 203
    :goto_d
    add-int/2addr v0, v1

    .line 204
    mul-int/lit8 v0, v0, 0x29

    .line 205
    .line 206
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->hideOwner:Z

    .line 207
    .line 208
    if-eqz v1, :cond_e

    .line 209
    .line 210
    move v3, v4

    .line 211
    :cond_e
    add-int/2addr v0, v3

    .line 212
    mul-int/lit8 v0, v0, 0x29

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 215
    .line 216
    if-eqz v1, :cond_f

    .line 217
    .line 218
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 219
    .line 220
    .line 221
    move-result v1

    .line 222
    goto :goto_e

    .line 223
    :cond_f
    move v1, v2

    .line 224
    :goto_e
    add-int/2addr v0, v1

    .line 225
    mul-int/lit8 v0, v0, 0x29

    .line 226
    .line 227
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 228
    .line 229
    if-eqz v1, :cond_10

    .line 230
    .line 231
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->hashCode()I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    goto :goto_f

    .line 236
    :cond_10
    move v1, v2

    .line 237
    :goto_f
    add-int/2addr v0, v1

    .line 238
    mul-int/lit8 v0, v0, 0x29

    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 241
    .line 242
    if-eqz v1, :cond_11

    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/TopicSource;->hashCode()I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    goto :goto_10

    .line 249
    :cond_11
    move v1, v2

    .line 250
    :goto_10
    add-int/2addr v0, v1

    .line 251
    mul-int/lit8 v0, v0, 0x29

    .line 252
    .line 253
    iget v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 254
    .line 255
    add-int/2addr v0, v1

    .line 256
    mul-int/lit8 v0, v0, 0x29

    .line 257
    .line 258
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 272
    .line 273
    if-eqz v1, :cond_13

    .line 274
    .line 275
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;->hashCode()I

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

.method public isActivityTopic()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->details:Lcom/p1/mobile/putong/feed/data/TopicActivityDetail;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isAudioTopicType()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "audio"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isBookMovieDramaTopic()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/TopicSource;->sourceType:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "literature"

    .line 8
    .line 9
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->source:Lcom/p1/mobile/putong/feed/data/TopicSource;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicSource;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public isEnterGroup()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isEnterGroup:Z

    .line 2
    .line 3
    return p0
.end method

.method public isQATopicType()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "qa"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isTopicAnonymousType()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "anonymous"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isTopicLinkType()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "link"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isTopicVoteType()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "vote"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isUserCreate(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/IdBoxed;->new_()Lcom/p1/mobile/putong/data/IdBoxed;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->owner:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->name:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 32
    .line 33
    if-nez v0, :cond_4

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->icon:Ljava/lang/String;

    .line 36
    .line 37
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 38
    .line 39
    if-nez v0, :cond_5

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->topicType:Ljava/lang/String;

    .line 42
    .line 43
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_6

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->typeAlias:Ljava/lang/String;

    .line 48
    .line 49
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_7

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->status:Ljava/lang/String;

    .line 54
    .line 55
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 56
    .line 57
    if-nez v0, :cond_8

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->landingPage:Ljava/lang/String;

    .line 60
    .line 61
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 62
    .line 63
    if-nez v0, :cond_9

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->guideTab:Ljava/lang/String;

    .line 66
    .line 67
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 68
    .line 69
    if-nez v0, :cond_a

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 72
    .line 73
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 74
    .line 75
    if-nez v0, :cond_b

    .line 76
    .line 77
    new-instance v0, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->sourceTabs:Ljava/util/List;

    .line 83
    .line 84
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 85
    .line 86
    if-nez v0, :cond_c

    .line 87
    .line 88
    new-instance v0, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->activityUserIds:Ljava/util/List;

    .line 94
    .line 95
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 96
    .line 97
    if-nez v0, :cond_d

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->new_()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 104
    .line 105
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 106
    .line 107
    if-nez v0, :cond_e

    .line 108
    .line 109
    new-instance v0, Ljava/util/ArrayList;

    .line 110
    .line 111
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 115
    .line 116
    :cond_e
    return-void
.end method

.method public setEnterGroup(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->isEnterGroup:Z

    .line 2
    .line 3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
