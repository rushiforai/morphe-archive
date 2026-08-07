.class public Lcom/p1/mobile/putong/data/UserPushSettings;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ValueObject<",
        "Lcom/p1/mobile/putong/data/UserPushSettings;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/UserPushSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/UserPushSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "userpushsettings"


# instance fields
.field public allPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public anchorRecommendPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public anchorShowPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public friendNewMomentPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public livePush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public messagePush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public momentCommentPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public momentFollowPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public momentLikePush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public momentPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public msgPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public newMatchPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public officialPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field private parseFieldSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public previewMessage:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public recommendPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public showMomentLikes:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public silentEndTime:Ljava/lang/Integer;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public silentStartTime:Ljava/lang/Integer;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public silentSwitch:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public soundPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public superLikePush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public systemPush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public voiceLivePush:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserPushSettings$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserPushSettings$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/UserPushSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/UserPushSettings$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserPushSettings$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/UserPushSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/data/UserPushSettings;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserPushSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->nullCheck()V

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

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserPushSettings;->clone()Lcom/p1/mobile/putong/data/UserPushSettings;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/UserPushSettings;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserPushSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 93
    .line 94
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 95
    .line 96
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 97
    .line 98
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserPushSettings;->clone()Lcom/p1/mobile/putong/data/UserPushSettings;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/UserPushSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 74
    .line 75
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 84
    .line 85
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 94
    .line 95
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 104
    .line 105
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 114
    .line 115
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 116
    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-eqz v1, :cond_2

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 124
    .line 125
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 126
    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    if-eqz v1, :cond_2

    .line 132
    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 134
    .line 135
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 136
    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    if-eqz v1, :cond_2

    .line 142
    .line 143
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 144
    .line 145
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 146
    .line 147
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_2

    .line 152
    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 154
    .line 155
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 164
    .line 165
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 174
    .line 175
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 184
    .line 185
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 194
    .line 195
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 196
    .line 197
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    if-eqz v1, :cond_2

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 204
    .line 205
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 206
    .line 207
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    if-eqz v1, :cond_2

    .line 212
    .line 213
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 214
    .line 215
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 216
    .line 217
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_2

    .line 222
    .line 223
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 224
    .line 225
    iget-object v3, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 226
    .line 227
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    if-eqz v1, :cond_2

    .line 232
    .line 233
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 234
    .line 235
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 236
    .line 237
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result p0

    .line 241
    if-eqz p0, :cond_2

    .line 242
    .line 243
    return v0

    .line 244
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "userpushsettings"

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
    if-nez v0, :cond_17

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 113
    .line 114
    if-eqz v1, :cond_8

    .line 115
    .line 116
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    goto :goto_8

    .line 121
    :cond_8
    move v1, v2

    .line 122
    :goto_8
    add-int/2addr v0, v1

    .line 123
    mul-int/lit8 v0, v0, 0x29

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 126
    .line 127
    if-eqz v1, :cond_9

    .line 128
    .line 129
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 139
    .line 140
    if-eqz v1, :cond_a

    .line 141
    .line 142
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 152
    .line 153
    if-eqz v1, :cond_b

    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    goto :goto_b

    .line 160
    :cond_b
    move v1, v2

    .line 161
    :goto_b
    add-int/2addr v0, v1

    .line 162
    mul-int/lit8 v0, v0, 0x29

    .line 163
    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 165
    .line 166
    if-eqz v1, :cond_c

    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    goto :goto_c

    .line 173
    :cond_c
    move v1, v2

    .line 174
    :goto_c
    add-int/2addr v0, v1

    .line 175
    mul-int/lit8 v0, v0, 0x29

    .line 176
    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 178
    .line 179
    if-eqz v1, :cond_d

    .line 180
    .line 181
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 182
    .line 183
    .line 184
    move-result v1

    .line 185
    goto :goto_d

    .line 186
    :cond_d
    move v1, v2

    .line 187
    :goto_d
    add-int/2addr v0, v1

    .line 188
    mul-int/lit8 v0, v0, 0x29

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 191
    .line 192
    if-eqz v1, :cond_e

    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    goto :goto_e

    .line 199
    :cond_e
    move v1, v2

    .line 200
    :goto_e
    add-int/2addr v0, v1

    .line 201
    mul-int/lit8 v0, v0, 0x29

    .line 202
    .line 203
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 204
    .line 205
    if-eqz v1, :cond_f

    .line 206
    .line 207
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    goto :goto_f

    .line 212
    :cond_f
    move v1, v2

    .line 213
    :goto_f
    add-int/2addr v0, v1

    .line 214
    mul-int/lit8 v0, v0, 0x29

    .line 215
    .line 216
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 217
    .line 218
    if-eqz v1, :cond_10

    .line 219
    .line 220
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    goto :goto_10

    .line 225
    :cond_10
    move v1, v2

    .line 226
    :goto_10
    add-int/2addr v0, v1

    .line 227
    mul-int/lit8 v0, v0, 0x29

    .line 228
    .line 229
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 230
    .line 231
    if-eqz v1, :cond_11

    .line 232
    .line 233
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    goto :goto_11

    .line 238
    :cond_11
    move v1, v2

    .line 239
    :goto_11
    add-int/2addr v0, v1

    .line 240
    mul-int/lit8 v0, v0, 0x29

    .line 241
    .line 242
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 243
    .line 244
    if-eqz v1, :cond_12

    .line 245
    .line 246
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 247
    .line 248
    .line 249
    move-result v1

    .line 250
    goto :goto_12

    .line 251
    :cond_12
    move v1, v2

    .line 252
    :goto_12
    add-int/2addr v0, v1

    .line 253
    mul-int/lit8 v0, v0, 0x29

    .line 254
    .line 255
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 256
    .line 257
    if-eqz v1, :cond_13

    .line 258
    .line 259
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    goto :goto_13

    .line 264
    :cond_13
    move v1, v2

    .line 265
    :goto_13
    add-int/2addr v0, v1

    .line 266
    mul-int/lit8 v0, v0, 0x29

    .line 267
    .line 268
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 269
    .line 270
    if-eqz v1, :cond_14

    .line 271
    .line 272
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    goto :goto_14

    .line 277
    :cond_14
    move v1, v2

    .line 278
    :goto_14
    add-int/2addr v0, v1

    .line 279
    mul-int/lit8 v0, v0, 0x29

    .line 280
    .line 281
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 282
    .line 283
    if-eqz v1, :cond_15

    .line 284
    .line 285
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    goto :goto_15

    .line 290
    :cond_15
    move v1, v2

    .line 291
    :goto_15
    add-int/2addr v0, v1

    .line 292
    mul-int/lit8 v0, v0, 0x29

    .line 293
    .line 294
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 295
    .line 296
    if-eqz v1, :cond_16

    .line 297
    .line 298
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 299
    .line 300
    .line 301
    move-result v2

    .line 302
    :cond_16
    add-int/2addr v0, v2

    .line 303
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 304
    .line 305
    :cond_17
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->parseFieldSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/data/UserPushSettings;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_18

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserPushSettings;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    const-string v0, "anchorRecommendPush"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 26
    .line 27
    :cond_1
    const-string v0, "anchorShowPush"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 38
    .line 39
    :cond_2
    const-string v0, "friendNewMomentPush"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 50
    .line 51
    :cond_3
    const-string v0, "messagePush"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 62
    .line 63
    :cond_4
    const-string v0, "momentCommentPush"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 74
    .line 75
    :cond_5
    const-string v0, "momentFollowPush"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 86
    .line 87
    :cond_6
    const-string v0, "momentLikePush"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 98
    .line 99
    :cond_7
    const-string v0, "newMatchPush"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 110
    .line 111
    :cond_8
    const-string v0, "officialPush"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 122
    .line 123
    :cond_9
    const-string v0, "previewMessage"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 134
    .line 135
    :cond_a
    const-string v0, "showMomentLikes"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 146
    .line 147
    :cond_b
    const-string v0, "soundPush"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 158
    .line 159
    :cond_c
    const-string v0, "superLikePush"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 170
    .line 171
    :cond_d
    const-string v0, "msgPush"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 182
    .line 183
    :cond_e
    const-string v0, "recommendPush"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 194
    .line 195
    :cond_f
    const-string v0, "momentPush"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 206
    .line 207
    :cond_10
    const-string v0, "livePush"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_11

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 218
    .line 219
    :cond_11
    const-string v0, "systemPush"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_12

    .line 226
    .line 227
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 228
    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 230
    .line 231
    :cond_12
    const-string v0, "silentSwitch"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_13

    .line 238
    .line 239
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 240
    .line 241
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 242
    .line 243
    :cond_13
    const-string v0, "voiceLivePush"

    .line 244
    .line 245
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-nez v0, :cond_14

    .line 250
    .line 251
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 254
    .line 255
    :cond_14
    const-string v0, "silentEndTime"

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_15

    .line 262
    .line 263
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 264
    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 266
    .line 267
    :cond_15
    const-string v0, "silentStartTime"

    .line 268
    .line 269
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_16

    .line 274
    .line 275
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 276
    .line 277
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 278
    .line 279
    :cond_16
    const-string v0, "allPush"

    .line 280
    .line 281
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/UserPushSettings;->isFieldParsed(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_17

    .line 286
    .line 287
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 288
    .line 289
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 290
    .line 291
    :cond_17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->parseFieldSet:Ljava/util/HashSet;

    .line 292
    .line 293
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 294
    .line 295
    .line 296
    :cond_18
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 297
    check-cast p1, Lcom/p1/mobile/putong/data/UserPushSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserPushSettings;->mergeData(Lcom/p1/mobile/putong/data/UserPushSettings;)V

    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 15
    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 21
    .line 22
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 23
    .line 24
    if-nez v1, :cond_2

    .line 25
    .line 26
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 29
    .line 30
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 31
    .line 32
    if-nez v1, :cond_3

    .line 33
    .line 34
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 35
    .line 36
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 37
    .line 38
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 39
    .line 40
    if-nez v1, :cond_4

    .line 41
    .line 42
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 45
    .line 46
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 47
    .line 48
    if-nez v1, :cond_5

    .line 49
    .line 50
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 53
    .line 54
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 55
    .line 56
    if-nez v1, :cond_6

    .line 57
    .line 58
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 61
    .line 62
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 63
    .line 64
    if-nez v1, :cond_7

    .line 65
    .line 66
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 67
    .line 68
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 69
    .line 70
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 71
    .line 72
    if-nez v1, :cond_8

    .line 73
    .line 74
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 75
    .line 76
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 77
    .line 78
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 79
    .line 80
    if-nez v1, :cond_9

    .line 81
    .line 82
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 85
    .line 86
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 87
    .line 88
    if-nez v1, :cond_a

    .line 89
    .line 90
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 91
    .line 92
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 93
    .line 94
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 95
    .line 96
    if-nez v1, :cond_b

    .line 97
    .line 98
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 99
    .line 100
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 101
    .line 102
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 103
    .line 104
    if-nez v1, :cond_c

    .line 105
    .line 106
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 107
    .line 108
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 109
    .line 110
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 111
    .line 112
    if-nez v1, :cond_d

    .line 113
    .line 114
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 115
    .line 116
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 117
    .line 118
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 119
    .line 120
    if-nez v1, :cond_e

    .line 121
    .line 122
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 123
    .line 124
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 125
    .line 126
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 127
    .line 128
    if-nez v1, :cond_f

    .line 129
    .line 130
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 131
    .line 132
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 133
    .line 134
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 135
    .line 136
    if-nez v1, :cond_10

    .line 137
    .line 138
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 139
    .line 140
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 141
    .line 142
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 143
    .line 144
    if-nez v1, :cond_11

    .line 145
    .line 146
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 147
    .line 148
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 149
    .line 150
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 151
    .line 152
    if-nez v1, :cond_12

    .line 153
    .line 154
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 155
    .line 156
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 157
    .line 158
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 159
    .line 160
    if-nez v1, :cond_13

    .line 161
    .line 162
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 163
    .line 164
    iput-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 165
    .line 166
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 167
    .line 168
    if-nez v1, :cond_14

    .line 169
    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 171
    .line 172
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 173
    .line 174
    if-nez v1, :cond_15

    .line 175
    .line 176
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 177
    .line 178
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 179
    .line 180
    if-nez v0, :cond_16

    .line 181
    .line 182
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 183
    .line 184
    iput-object v0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 185
    .line 186
    :cond_16
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/data/UserPushSettings;)Lcom/p1/mobile/putong/data/UserPushSettings;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserPushSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 49
    .line 50
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 51
    .line 52
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    if-nez v1, :cond_3

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 65
    .line 66
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_4

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 75
    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 77
    .line 78
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 79
    .line 80
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    if-nez v1, :cond_5

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 89
    .line 90
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 91
    .line 92
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 93
    .line 94
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_6

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 101
    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 103
    .line 104
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 105
    .line 106
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 107
    .line 108
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-nez v1, :cond_7

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 115
    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 117
    .line 118
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 119
    .line 120
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 121
    .line 122
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-nez v1, :cond_8

    .line 127
    .line 128
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 129
    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 131
    .line 132
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 133
    .line 134
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 135
    .line 136
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-nez v1, :cond_9

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 143
    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 145
    .line 146
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 147
    .line 148
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 149
    .line 150
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    if-nez v1, :cond_a

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 157
    .line 158
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 159
    .line 160
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 161
    .line 162
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 163
    .line 164
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-nez v1, :cond_b

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 171
    .line 172
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 173
    .line 174
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 175
    .line 176
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 177
    .line 178
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-nez v1, :cond_c

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 185
    .line 186
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 187
    .line 188
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 189
    .line 190
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 191
    .line 192
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-nez v1, :cond_d

    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 199
    .line 200
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 201
    .line 202
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 203
    .line 204
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 205
    .line 206
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    if-nez v1, :cond_e

    .line 211
    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 213
    .line 214
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 215
    .line 216
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 217
    .line 218
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 219
    .line 220
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    if-nez v1, :cond_f

    .line 225
    .line 226
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 227
    .line 228
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 229
    .line 230
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 231
    .line 232
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 233
    .line 234
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    if-nez v1, :cond_10

    .line 239
    .line 240
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 241
    .line 242
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 243
    .line 244
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 245
    .line 246
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 247
    .line 248
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    if-nez v1, :cond_11

    .line 253
    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 255
    .line 256
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 257
    .line 258
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 259
    .line 260
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 261
    .line 262
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    if-nez v1, :cond_12

    .line 267
    .line 268
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 269
    .line 270
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 271
    .line 272
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 273
    .line 274
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 275
    .line 276
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    if-nez v1, :cond_13

    .line 281
    .line 282
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 283
    .line 284
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 285
    .line 286
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 287
    .line 288
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 289
    .line 290
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    if-nez v1, :cond_14

    .line 295
    .line 296
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 297
    .line 298
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 299
    .line 300
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 301
    .line 302
    iget-object v2, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 303
    .line 304
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v1

    .line 308
    if-nez v1, :cond_15

    .line 309
    .line 310
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 311
    .line 312
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 313
    .line 314
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 315
    .line 316
    iget-object p1, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 317
    .line 318
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    if-nez p1, :cond_16

    .line 323
    .line 324
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 325
    .line 326
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 327
    .line 328
    :cond_16
    new-instance p0, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 329
    .line 330
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/UserPushSettings;-><init>()V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/UserPushSettings;->equals(Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result p0

    .line 337
    if-eqz p0, :cond_17

    .line 338
    .line 339
    const/4 p0, 0x0

    .line 340
    return-object p0

    .line 341
    :cond_17
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/UserPushSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
