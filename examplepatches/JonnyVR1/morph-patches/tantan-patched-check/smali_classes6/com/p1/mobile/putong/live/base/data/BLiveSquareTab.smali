.class public Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivesquaretab"


# instance fields
.field public anchorSuggest:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSuggest;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public bannerType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public hasActivityExposure:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public hasBanner:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public hasRedDot:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public hasSearch:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public layoutColumn:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public pageId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public showNearby:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public subTabs:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSquareSubTab;",
            ">;"
        }
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveSquareSubTab;)Lcom/p1/mobile/putong/live/base/data/BLiveSquareSubTab;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareSubTab;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSquareSubTab;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->nullCheck()V

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

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasBanner:Z

    .line 19
    .line 20
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasBanner:Z

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->anchorSuggest:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSuggest;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSuggest;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSuggest;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->anchorSuggest:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSuggest;

    .line 31
    .line 32
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->layoutColumn:I

    .line 33
    .line 34
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->layoutColumn:I

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->bannerType:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->bannerType:Ljava/lang/String;

    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->showNearby:Z

    .line 41
    .line 42
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->showNearby:Z

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->subTabs:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    new-instance v2, Ll/i62;

    .line 49
    .line 50
    invoke-direct {v2}, Ll/i62;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->subTabs:Ljava/util/List;

    .line 58
    .line 59
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 62
    .line 63
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasSearch:Z

    .line 64
    .line 65
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasSearch:Z

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasActivityExposure:Z

    .line 68
    .line 69
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasActivityExposure:Z

    .line 70
    .line 71
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasRedDot:Z

    .line 72
    .line 73
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasRedDot:Z

    .line 74
    .line 75
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasBanner:Z

    .line 44
    .line 45
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasBanner:Z

    .line 46
    .line 47
    if-ne v1, v3, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->anchorSuggest:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSuggest;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->anchorSuggest:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSuggest;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->layoutColumn:I

    .line 60
    .line 61
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->layoutColumn:I

    .line 62
    .line 63
    if-ne v1, v3, :cond_2

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->bannerType:Ljava/lang/String;

    .line 66
    .line 67
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->bannerType:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->showNearby:Z

    .line 76
    .line 77
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->showNearby:Z

    .line 78
    .line 79
    if-ne v1, v3, :cond_2

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->subTabs:Ljava/util/List;

    .line 82
    .line 83
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->subTabs:Ljava/util/List;

    .line 84
    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_2

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_2

    .line 100
    .line 101
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasSearch:Z

    .line 102
    .line 103
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasSearch:Z

    .line 104
    .line 105
    if-ne v1, v3, :cond_2

    .line 106
    .line 107
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasActivityExposure:Z

    .line 108
    .line 109
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasActivityExposure:Z

    .line 110
    .line 111
    if-ne v1, v3, :cond_2

    .line 112
    .line 113
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasRedDot:Z

    .line 114
    .line 115
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasRedDot:Z

    .line 116
    .line 117
    if-ne p0, p1, :cond_2

    .line 118
    .line 119
    return v0

    .line 120
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivesquaretab"

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
    if-nez v0, :cond_c

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasBanner:Z

    .line 48
    .line 49
    const/16 v3, 0x4d5

    .line 50
    .line 51
    const/16 v4, 0x4cf

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    move v1, v4

    .line 56
    goto :goto_3

    .line 57
    :cond_3
    move v1, v3

    .line 58
    :goto_3
    add-int/2addr v0, v1

    .line 59
    mul-int/lit8 v0, v0, 0x29

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->anchorSuggest:Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSuggest;

    .line 62
    .line 63
    if-eqz v1, :cond_4

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveAnchorSuggest;->hashCode()I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    goto :goto_4

    .line 70
    :cond_4
    move v1, v2

    .line 71
    :goto_4
    add-int/2addr v0, v1

    .line 72
    mul-int/lit8 v0, v0, 0x29

    .line 73
    .line 74
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->layoutColumn:I

    .line 75
    .line 76
    add-int/2addr v0, v1

    .line 77
    mul-int/lit8 v0, v0, 0x29

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->bannerType:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz v1, :cond_5

    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->showNearby:Z

    .line 93
    .line 94
    if-eqz v1, :cond_6

    .line 95
    .line 96
    move v1, v4

    .line 97
    goto :goto_6

    .line 98
    :cond_6
    move v1, v3

    .line 99
    :goto_6
    add-int/2addr v0, v1

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->subTabs:Ljava/util/List;

    .line 103
    .line 104
    if-eqz v1, :cond_7

    .line 105
    .line 106
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 107
    .line 108
    .line 109
    move-result v1

    .line 110
    goto :goto_7

    .line 111
    :cond_7
    move v1, v2

    .line 112
    :goto_7
    add-int/2addr v0, v1

    .line 113
    mul-int/lit8 v0, v0, 0x29

    .line 114
    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v1, :cond_8

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    :cond_8
    add-int/2addr v0, v2

    .line 124
    mul-int/lit8 v0, v0, 0x29

    .line 125
    .line 126
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasSearch:Z

    .line 127
    .line 128
    if-eqz v1, :cond_9

    .line 129
    .line 130
    move v1, v4

    .line 131
    goto :goto_8

    .line 132
    :cond_9
    move v1, v3

    .line 133
    :goto_8
    add-int/2addr v0, v1

    .line 134
    mul-int/lit8 v0, v0, 0x29

    .line 135
    .line 136
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasActivityExposure:Z

    .line 137
    .line 138
    if-eqz v1, :cond_a

    .line 139
    .line 140
    move v1, v4

    .line 141
    goto :goto_9

    .line 142
    :cond_a
    move v1, v3

    .line 143
    :goto_9
    add-int/2addr v0, v1

    .line 144
    mul-int/lit8 v0, v0, 0x29

    .line 145
    .line 146
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->hasRedDot:Z

    .line 147
    .line 148
    if-eqz v1, :cond_b

    .line 149
    .line 150
    move v3, v4

    .line 151
    :cond_b
    add-int/2addr v0, v3

    .line 152
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 153
    .line 154
    :cond_c
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->title:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->name:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->bannerType:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->bannerType:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->pageId:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSquareTab;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
