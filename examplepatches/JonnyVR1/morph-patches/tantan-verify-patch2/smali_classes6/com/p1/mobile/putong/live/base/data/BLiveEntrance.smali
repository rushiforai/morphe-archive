.class public Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveentrance"


# instance fields
.field public defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public defaultTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public followTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public hourlySuggestedTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public on:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public showDefaultTitle:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public showFollow:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public showHourlySuggested:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->nullCheck()V

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

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->on:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->on:Z

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 23
    .line 24
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showFollow:Z

    .line 25
    .line 26
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showFollow:Z

    .line 27
    .line 28
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showDefaultTitle:Z

    .line 29
    .line 30
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showDefaultTitle:Z

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->followTitle:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->followTitle:Ljava/lang/String;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultTitle:Ljava/lang/String;

    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultTitle:Ljava/lang/String;

    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showHourlySuggested:Z

    .line 41
    .line 42
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showHourlySuggested:Z

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->hourlySuggestedTitle:Ljava/lang/String;

    .line 45
    .line 46
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->hourlySuggestedTitle:Ljava/lang/String;

    .line 47
    .line 48
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->on:Z

    .line 24
    .line 25
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->on:Z

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showFollow:Z

    .line 40
    .line 41
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showFollow:Z

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showDefaultTitle:Z

    .line 46
    .line 47
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showDefaultTitle:Z

    .line 48
    .line 49
    if-ne v1, v3, :cond_2

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->followTitle:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->followTitle:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultTitle:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultTitle:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showHourlySuggested:Z

    .line 72
    .line 73
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showHourlySuggested:Z

    .line 74
    .line 75
    if-ne v1, v3, :cond_2

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->hourlySuggestedTitle:Ljava/lang/String;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->hourlySuggestedTitle:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_2

    .line 86
    .line 87
    return v0

    .line 88
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveentrance"

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
    if-nez v0, :cond_9

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->on:Z

    .line 22
    .line 23
    const/16 v3, 0x4d5

    .line 24
    .line 25
    const/16 v4, 0x4cf

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    move v1, v4

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v1, v3

    .line 32
    :goto_1
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 36
    .line 37
    if-eqz v1, :cond_2

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    move v1, v2

    .line 45
    :goto_2
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x29

    .line 47
    .line 48
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showFollow:Z

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    move v1, v4

    .line 53
    goto :goto_3

    .line 54
    :cond_3
    move v1, v3

    .line 55
    :goto_3
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showDefaultTitle:Z

    .line 59
    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    move v1, v4

    .line 63
    goto :goto_4

    .line 64
    :cond_4
    move v1, v3

    .line 65
    :goto_4
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x29

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->followTitle:Ljava/lang/String;

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
    move v1, v2

    .line 78
    :goto_5
    add-int/2addr v0, v1

    .line 79
    mul-int/lit8 v0, v0, 0x29

    .line 80
    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultTitle:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v1, :cond_6

    .line 84
    .line 85
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    goto :goto_6

    .line 90
    :cond_6
    move v1, v2

    .line 91
    :goto_6
    add-int/2addr v0, v1

    .line 92
    mul-int/lit8 v0, v0, 0x29

    .line 93
    .line 94
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->showHourlySuggested:Z

    .line 95
    .line 96
    if-eqz v1, :cond_7

    .line 97
    .line 98
    move v3, v4

    .line 99
    :cond_7
    add-int/2addr v0, v3

    .line 100
    mul-int/lit8 v0, v0, 0x29

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->hourlySuggestedTitle:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v1, :cond_8

    .line 105
    .line 106
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    :cond_8
    add-int/2addr v0, v2

    .line 111
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 112
    .line 113
    :cond_9
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->source:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->defaultOpen:Lcom/p1/mobile/putong/live/base/data/BLiveEntranceDefaultOpen;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->followTitle:Ljava/lang/String;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->followTitle:Ljava/lang/String;

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->hourlySuggestedTitle:Ljava/lang/String;

    .line 26
    .line 27
    if-nez v0, :cond_3

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->hourlySuggestedTitle:Ljava/lang/String;

    .line 30
    .line 31
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
