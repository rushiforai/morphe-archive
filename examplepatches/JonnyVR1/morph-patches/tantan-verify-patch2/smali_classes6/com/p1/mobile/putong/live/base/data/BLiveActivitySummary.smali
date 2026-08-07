.class public Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveactivitysummary"


# instance fields
.field public cardEnterLive:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public cardLives:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;",
            ">;"
        }
    .end annotation
.end field

.field public counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public icons:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
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

.field public ongoingLiveIds:Ljava/util/List;
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

.field public showStartLiveGuide:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public type:Ljava/lang/String;
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
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;)Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveActivityCardLive;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->nullCheck()V

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

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->id:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->id:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

    .line 29
    .line 30
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 31
    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    new-instance v2, Ll/dr1;

    .line 35
    .line 36
    invoke-direct {v2}, Ll/dr1;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 44
    .line 45
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->type:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->type:Ljava/lang/String;

    .line 48
    .line 49
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->showStartLiveGuide:Z

    .line 50
    .line 51
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->showStartLiveGuide:Z

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    new-instance v2, Ll/er1;

    .line 58
    .line 59
    invoke-direct {v2}, Ll/er1;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 67
    .line 68
    :cond_3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardEnterLive:Z

    .line 69
    .line 70
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardEnterLive:Z

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardLives:Ljava/util/List;

    .line 73
    .line 74
    if-eqz p0, :cond_4

    .line 75
    .line 76
    new-instance v1, Ll/fr1;

    .line 77
    .line 78
    invoke-direct {v1}, Ll/fr1;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardLives:Ljava/util/List;

    .line 86
    .line 87
    :cond_4
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->id:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->id:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->type:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->type:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->showStartLiveGuide:Z

    .line 60
    .line 61
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->showStartLiveGuide:Z

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 68
    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardEnterLive:Z

    .line 76
    .line 77
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardEnterLive:Z

    .line 78
    .line 79
    if-ne v1, v3, :cond_2

    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardLives:Ljava/util/List;

    .line 82
    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardLives:Ljava/util/List;

    .line 84
    .line 85
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    if-eqz p0, :cond_2

    .line 90
    .line 91
    return v0

    .line 92
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveactivitysummary"

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
    if-nez v0, :cond_8

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->id:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->counters:Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummaryCounters;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v2

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->type:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v2

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->showStartLiveGuide:Z

    .line 66
    .line 67
    const/16 v3, 0x4d5

    .line 68
    .line 69
    const/16 v4, 0x4cf

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    move v1, v4

    .line 74
    goto :goto_4

    .line 75
    :cond_4
    move v1, v3

    .line 76
    :goto_4
    add-int/2addr v0, v1

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    goto :goto_5

    .line 88
    :cond_5
    move v1, v2

    .line 89
    :goto_5
    add-int/2addr v0, v1

    .line 90
    mul-int/lit8 v0, v0, 0x29

    .line 91
    .line 92
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardEnterLive:Z

    .line 93
    .line 94
    if-eqz v1, :cond_6

    .line 95
    .line 96
    move v3, v4

    .line 97
    :cond_6
    add-int/2addr v0, v3

    .line 98
    mul-int/lit8 v0, v0, 0x29

    .line 99
    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardLives:Ljava/util/List;

    .line 101
    .line 102
    if-eqz v1, :cond_7

    .line 103
    .line 104
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    :cond_7
    add-int/2addr v0, v2

    .line 109
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 110
    .line 111
    :cond_8
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->description:Lcom/p1/mobile/putong/live/base/data/BLiveActivityDesc;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->ongoingLiveIds:Ljava/util/List;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->type:Ljava/lang/String;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-string v0, ""

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->type:Ljava/lang/String;

    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 31
    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->icons:Ljava/util/List;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardLives:Ljava/util/List;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    new-instance v0, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->cardLives:Ljava/util/List;

    .line 51
    .line 52
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveActivitySummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
