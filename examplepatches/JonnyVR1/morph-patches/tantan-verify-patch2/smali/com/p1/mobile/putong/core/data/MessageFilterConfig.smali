.class public Lcom/p1/mobile/putong/core/data/MessageFilterConfig;
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
            "Lcom/p1/mobile/putong/core/data/MessageFilterConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MessageFilterConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "messagefilterconfig"


# instance fields
.field public convUnreadLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public filterTabList:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LabelParams;",
            ">;"
        }
    .end annotation
.end field

.field public messageFilterEnabled:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public officAccCollectionEnabled:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public redDotLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public showRecommendBanner:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public showRecommendBannerHasNewMatch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public shownDayLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public weakenedTipsEnabled:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/LabelParams;)Lcom/p1/mobile/putong/core/data/LabelParams;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LabelParams;->clone()Lcom/p1/mobile/putong/core/data/LabelParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/MessageFilterConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->nullCheck()V

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

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->clone()Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MessageFilterConfig;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/ddz;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/ddz;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->messageFilterEnabled:Z

    .line 22
    .line 23
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->messageFilterEnabled:Z

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->officAccCollectionEnabled:Z

    .line 26
    .line 27
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->officAccCollectionEnabled:Z

    .line 28
    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->weakenedTipsEnabled:Z

    .line 30
    .line 31
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->weakenedTipsEnabled:Z

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->redDotLimit:I

    .line 34
    .line 35
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->redDotLimit:I

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->convUnreadLimit:I

    .line 38
    .line 39
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->convUnreadLimit:I

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->shownDayLimit:I

    .line 42
    .line 43
    iput v1, v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->shownDayLimit:I

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBanner:Z

    .line 46
    .line 47
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBanner:Z

    .line 48
    .line 49
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBannerHasNewMatch:Z

    .line 50
    .line 51
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBannerHasNewMatch:Z

    .line 52
    .line 53
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->clone()Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->messageFilterEnabled:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->messageFilterEnabled:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->officAccCollectionEnabled:Z

    .line 30
    .line 31
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->officAccCollectionEnabled:Z

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->weakenedTipsEnabled:Z

    .line 36
    .line 37
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->weakenedTipsEnabled:Z

    .line 38
    .line 39
    if-ne v1, v3, :cond_2

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->redDotLimit:I

    .line 42
    .line 43
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->redDotLimit:I

    .line 44
    .line 45
    if-ne v1, v3, :cond_2

    .line 46
    .line 47
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->convUnreadLimit:I

    .line 48
    .line 49
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->convUnreadLimit:I

    .line 50
    .line 51
    if-ne v1, v3, :cond_2

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->shownDayLimit:I

    .line 54
    .line 55
    iget v3, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->shownDayLimit:I

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBanner:Z

    .line 60
    .line 61
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBanner:Z

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBannerHasNewMatch:Z

    .line 66
    .line 67
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBannerHasNewMatch:Z

    .line 68
    .line 69
    if-ne p0, p1, :cond_2

    .line 70
    .line 71
    return v0

    .line 72
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "messagefilterconfig"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 4

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    :goto_0
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x29

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->messageFilterEnabled:Z

    .line 21
    .line 22
    const/16 v2, 0x4d5

    .line 23
    .line 24
    const/16 v3, 0x4cf

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    move v1, v3

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->officAccCollectionEnabled:Z

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    move v1, v3

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    move v1, v2

    .line 41
    :goto_2
    add-int/2addr v0, v1

    .line 42
    mul-int/lit8 v0, v0, 0x29

    .line 43
    .line 44
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->weakenedTipsEnabled:Z

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    move v1, v3

    .line 49
    goto :goto_3

    .line 50
    :cond_3
    move v1, v2

    .line 51
    :goto_3
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->redDotLimit:I

    .line 55
    .line 56
    add-int/2addr v0, v1

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->convUnreadLimit:I

    .line 60
    .line 61
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->shownDayLimit:I

    .line 65
    .line 66
    add-int/2addr v0, v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBanner:Z

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    move v1, v3

    .line 74
    goto :goto_4

    .line 75
    :cond_4
    move v1, v2

    .line 76
    :goto_4
    add-int/2addr v0, v1

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->showRecommendBannerHasNewMatch:Z

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    move v2, v3

    .line 84
    :cond_5
    add-int/2addr v0, v2

    .line 85
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 86
    .line 87
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->filterTabList:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageFilterConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
