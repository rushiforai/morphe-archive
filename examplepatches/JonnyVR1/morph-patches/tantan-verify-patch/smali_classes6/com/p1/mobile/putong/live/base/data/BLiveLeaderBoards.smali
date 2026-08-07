.class public Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "bliveleaderboards"


# instance fields
.field public amount:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public gap:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public isFooter:Z

.field public isFooterDesc:Z

.field public isNewUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public liveUserLevel:Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;

.field public owner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public rank:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public rankDiff:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public rankType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public user:Lcom/p1/mobile/putong/data/User;

.field public userNameGradientColors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
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
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isFooterDesc:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->nullCheck()V

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

    .line 59
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rank:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rank:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->type:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->type:Ljava/lang/String;

    .line 21
    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 23
    .line 24
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankType:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankType:Ljava/lang/String;

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isNewUser:Z

    .line 31
    .line 32
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isNewUser:Z

    .line 33
    .line 34
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankDiff:I

    .line 35
    .line 36
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankDiff:I

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->gap:D

    .line 39
    .line 40
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->gap:D

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->userNameGradientColors:Ljava/util/List;

    .line 43
    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    new-instance v1, Ll/d22;

    .line 47
    .line 48
    invoke-direct {v1}, Ll/d22;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->userNameGradientColors:Ljava/util/List;

    .line 56
    .line 57
    :cond_0
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->id:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rank:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rank:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->type:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->type:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 50
    .line 51
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 52
    .line 53
    cmpl-double v1, v3, v5

    .line 54
    .line 55
    if-nez v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankType:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankType:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isNewUser:Z

    .line 68
    .line 69
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isNewUser:Z

    .line 70
    .line 71
    if-ne v1, v3, :cond_2

    .line 72
    .line 73
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankDiff:I

    .line 74
    .line 75
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankDiff:I

    .line 76
    .line 77
    if-ne v1, v3, :cond_2

    .line 78
    .line 79
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->gap:D

    .line 80
    .line 81
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->gap:D

    .line 82
    .line 83
    cmpl-double v1, v3, v5

    .line 84
    .line 85
    if-nez v1, :cond_2

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->userNameGradientColors:Ljava/util/List;

    .line 88
    .line 89
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->userNameGradientColors:Ljava/util/List;

    .line 90
    .line 91
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_2

    .line 96
    .line 97
    return v0

    .line 98
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "bliveleaderboards"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 7

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->id:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rank:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->type:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->amount:D

    .line 51
    .line 52
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 53
    .line 54
    .line 55
    move-result-wide v3

    .line 56
    mul-int/lit8 v0, v0, 0x29

    .line 57
    .line 58
    const/16 v1, 0x20

    .line 59
    .line 60
    ushr-long v5, v3, v1

    .line 61
    .line 62
    xor-long/2addr v3, v5

    .line 63
    long-to-int v3, v3

    .line 64
    add-int/2addr v0, v3

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankType:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz v3, :cond_3

    .line 70
    .line 71
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    goto :goto_3

    .line 76
    :cond_3
    move v3, v2

    .line 77
    :goto_3
    add-int/2addr v0, v3

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-boolean v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->isNewUser:Z

    .line 81
    .line 82
    if-eqz v3, :cond_4

    .line 83
    .line 84
    const/16 v3, 0x4cf

    .line 85
    .line 86
    goto :goto_4

    .line 87
    :cond_4
    const/16 v3, 0x4d5

    .line 88
    .line 89
    :goto_4
    add-int/2addr v0, v3

    .line 90
    mul-int/lit8 v0, v0, 0x29

    .line 91
    .line 92
    iget v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankDiff:I

    .line 93
    .line 94
    add-int/2addr v0, v3

    .line 95
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->gap:D

    .line 96
    .line 97
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 98
    .line 99
    .line 100
    move-result-wide v3

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    ushr-long v5, v3, v1

    .line 104
    .line 105
    xor-long/2addr v3, v5

    .line 106
    long-to-int v1, v3

    .line 107
    add-int/2addr v0, v1

    .line 108
    mul-int/lit8 v0, v0, 0x29

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->userNameGradientColors:Ljava/util/List;

    .line 111
    .line 112
    if-eqz v1, :cond_5

    .line 113
    .line 114
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    :cond_5
    add-int/2addr v0, v2

    .line 119
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 120
    .line 121
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->owner:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->type:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->type:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankType:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->rankType:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->userNameGradientColors:Ljava/util/List;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    new-instance v0, Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->userNameGradientColors:Ljava/util/List;

    .line 37
    .line 38
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveLeaderBoards;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
