.class public Lcom/p1/mobile/putong/feed/data/Extra;
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
            "Lcom/p1/mobile/putong/feed/data/Extra;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/Extra;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "extra"


# instance fields
.field public activityShowReadButton:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public bindPhone:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public defaultSyncMoment:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public defaultTab:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public explorePostBubble:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public feedDefaultPage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public feedShowAccostButton:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public liveShowFollowButton:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public showPopWindow:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public stateEmotion:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/StateEmotion;",
            ">;"
        }
    .end annotation
.end field

.field public stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public topicH5RedirectURL:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Extra$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Extra$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/Extra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Extra$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Extra$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/Extra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/feed/data/StateEmotion;)Lcom/p1/mobile/putong/feed/data/StateEmotion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/StateEmotion;->clone()Lcom/p1/mobile/putong/feed/data/StateEmotion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/Extra;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Extra;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Extra;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Extra;->nullCheck()V

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

    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Extra;->clone()Lcom/p1/mobile/putong/feed/data/Extra;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/Extra;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Extra;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Extra;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->bindPhone:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->bindPhone:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentMedia;->clone()Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 19
    .line 20
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->liveShowFollowButton:Z

    .line 21
    .line 22
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->liveShowFollowButton:Z

    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedShowAccostButton:Z

    .line 25
    .line 26
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->feedShowAccostButton:Z

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 35
    .line 36
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showPopWindow:Z

    .line 37
    .line 38
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->showPopWindow:Z

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/ShowAudit;->clone()Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 49
    .line 50
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultSyncMoment:Z

    .line 51
    .line 52
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultSyncMoment:Z

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    new-instance v2, Ll/mrf;

    .line 59
    .line 60
    invoke-direct {v2}, Ll/mrf;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 68
    .line 69
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 70
    .line 71
    if-eqz v1, :cond_3

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/StateGuide;->clone()Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 78
    .line 79
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 80
    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 82
    .line 83
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->activityShowReadButton:Z

    .line 84
    .line 85
    iput-boolean v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->activityShowReadButton:Z

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->explorePostBubble:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 88
    .line 89
    if-eqz v1, :cond_4

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->clone()Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->explorePostBubble:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 96
    .line 97
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 98
    .line 99
    if-eqz v1, :cond_5

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/StateWindow;->clone()Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 106
    .line 107
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 108
    .line 109
    if-eqz p0, :cond_6

    .line 110
    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;->clone()Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 116
    .line 117
    :cond_6
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Extra;->clone()Lcom/p1/mobile/putong/feed/data/Extra;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/Extra;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Extra;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->bindPhone:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->bindPhone:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->liveShowFollowButton:Z

    .line 30
    .line 31
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->liveShowFollowButton:Z

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedShowAccostButton:Z

    .line 36
    .line 37
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->feedShowAccostButton:Z

    .line 38
    .line 39
    if-ne v1, v3, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showPopWindow:Z

    .line 62
    .line 63
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->showPopWindow:Z

    .line 64
    .line 65
    if-ne v1, v3, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultSyncMoment:Z

    .line 78
    .line 79
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->defaultSyncMoment:Z

    .line 80
    .line 81
    if-ne v1, v3, :cond_2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->activityShowReadButton:Z

    .line 114
    .line 115
    iget-boolean v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->activityShowReadButton:Z

    .line 116
    .line 117
    if-ne v1, v3, :cond_2

    .line 118
    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->explorePostBubble:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 120
    .line 121
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->explorePostBubble:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 130
    .line 131
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 140
    .line 141
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

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
    const-string p0, "extra"

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->bindPhone:Z

    .line 8
    .line 9
    const/16 v2, 0x4d5

    .line 10
    .line 11
    const/16 v3, 0x4cf

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    move v1, v3

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 22
    .line 23
    const/4 v4, 0x0

    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentMedia;->hashCode()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v1, v4

    .line 32
    :goto_1
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->liveShowFollowButton:Z

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    move v1, v3

    .line 40
    goto :goto_2

    .line 41
    :cond_2
    move v1, v2

    .line 42
    :goto_2
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedShowAccostButton:Z

    .line 46
    .line 47
    if-eqz v1, :cond_3

    .line 48
    .line 49
    move v1, v3

    .line 50
    goto :goto_3

    .line 51
    :cond_3
    move v1, v2

    .line 52
    :goto_3
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x29

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v1, :cond_4

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    goto :goto_4

    .line 64
    :cond_4
    move v1, v4

    .line 65
    :goto_4
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x29

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    goto :goto_5

    .line 77
    :cond_5
    move v1, v4

    .line 78
    :goto_5
    add-int/2addr v0, v1

    .line 79
    mul-int/lit8 v0, v0, 0x29

    .line 80
    .line 81
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showPopWindow:Z

    .line 82
    .line 83
    if-eqz v1, :cond_6

    .line 84
    .line 85
    move v1, v3

    .line 86
    goto :goto_6

    .line 87
    :cond_6
    move v1, v2

    .line 88
    :goto_6
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 92
    .line 93
    if-eqz v1, :cond_7

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/ShowAudit;->hashCode()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    goto :goto_7

    .line 100
    :cond_7
    move v1, v4

    .line 101
    :goto_7
    add-int/2addr v0, v1

    .line 102
    mul-int/lit8 v0, v0, 0x29

    .line 103
    .line 104
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultSyncMoment:Z

    .line 105
    .line 106
    if-eqz v1, :cond_8

    .line 107
    .line 108
    move v1, v3

    .line 109
    goto :goto_8

    .line 110
    :cond_8
    move v1, v2

    .line 111
    :goto_8
    add-int/2addr v0, v1

    .line 112
    mul-int/lit8 v0, v0, 0x29

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 115
    .line 116
    if-eqz v1, :cond_9

    .line 117
    .line 118
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    goto :goto_9

    .line 123
    :cond_9
    move v1, v4

    .line 124
    :goto_9
    add-int/2addr v0, v1

    .line 125
    mul-int/lit8 v0, v0, 0x29

    .line 126
    .line 127
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 128
    .line 129
    if-eqz v1, :cond_a

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/StateGuide;->hashCode()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    goto :goto_a

    .line 136
    :cond_a
    move v1, v4

    .line 137
    :goto_a
    add-int/2addr v0, v1

    .line 138
    mul-int/lit8 v0, v0, 0x29

    .line 139
    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz v1, :cond_b

    .line 143
    .line 144
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    goto :goto_b

    .line 149
    :cond_b
    move v1, v4

    .line 150
    :goto_b
    add-int/2addr v0, v1

    .line 151
    mul-int/lit8 v0, v0, 0x29

    .line 152
    .line 153
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->activityShowReadButton:Z

    .line 154
    .line 155
    if-eqz v1, :cond_c

    .line 156
    .line 157
    move v2, v3

    .line 158
    :cond_c
    add-int/2addr v0, v2

    .line 159
    mul-int/lit8 v0, v0, 0x29

    .line 160
    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->explorePostBubble:Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;

    .line 162
    .line 163
    if-eqz v1, :cond_d

    .line 164
    .line 165
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/ExplorePostBubble;->hashCode()I

    .line 166
    .line 167
    .line 168
    move-result v1

    .line 169
    goto :goto_c

    .line 170
    :cond_d
    move v1, v4

    .line 171
    :goto_c
    add-int/2addr v0, v1

    .line 172
    mul-int/lit8 v0, v0, 0x29

    .line 173
    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 175
    .line 176
    if-eqz v1, :cond_e

    .line 177
    .line 178
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/StateWindow;->hashCode()I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    goto :goto_d

    .line 183
    :cond_e
    move v1, v4

    .line 184
    :goto_d
    add-int/2addr v0, v1

    .line 185
    mul-int/lit8 v0, v0, 0x29

    .line 186
    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 188
    .line 189
    if-eqz v1, :cond_f

    .line 190
    .line 191
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;->hashCode()I

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    :cond_f
    add-int/2addr v0, v4

    .line 196
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 197
    .line 198
    :cond_10
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentMedia;->new_()Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentMedia:Lcom/p1/mobile/putong/feed/data/MomentMedia;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, ""

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->feedDefaultPage:Ljava/lang/String;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->topicH5RedirectURL:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ShowAudit;->new_()Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->showAudit:Lcom/p1/mobile/putong/feed/data/ShowAudit;

    .line 34
    .line 35
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 36
    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateEmotion:Ljava/util/List;

    .line 45
    .line 46
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 47
    .line 48
    if-nez v0, :cond_5

    .line 49
    .line 50
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/StateGuide;->new_()Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateGuide:Lcom/p1/mobile/putong/feed/data/StateGuide;

    .line 55
    .line 56
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 57
    .line 58
    if-nez v0, :cond_6

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Extra;->defaultTab:Ljava/lang/String;

    .line 61
    .line 62
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 63
    .line 64
    if-nez v0, :cond_7

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/StateWindow;->new_()Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->stateWindow:Lcom/p1/mobile/putong/feed/data/StateWindow;

    .line 71
    .line 72
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 73
    .line 74
    if-nez v0, :cond_8

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;->new_()Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Extra;->momentExposeConfig:Lcom/p1/mobile/putong/feed/data/MomentExposeConfig;

    .line 81
    .line 82
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Extra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
