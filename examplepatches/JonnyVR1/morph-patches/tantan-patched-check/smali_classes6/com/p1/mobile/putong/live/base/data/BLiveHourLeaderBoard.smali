.class public Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivehourleaderboard"


# instance fields
.field public allLeaderboards:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field

.field public currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public currentRoomLeaderboards:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field

.field public helperPageUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public isFinishHeaderAnim:Z

.field public isHeaderBgAnimFinish:Z

.field public isOpen:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public notices:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourNotices;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourNotices;)Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourNotices;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourNotices;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourNotices;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;)Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->nullCheck()V

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

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/o12;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/o12;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    new-instance v2, Ll/p12;

    .line 26
    .line 27
    invoke-direct {v2}, Ll/p12;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

    .line 35
    .line 36
    :cond_1
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->isOpen:Z

    .line 37
    .line 38
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->isOpen:Z

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    new-instance v2, Ll/q12;

    .line 45
    .line 46
    invoke-direct {v2}, Ll/q12;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

    .line 54
    .line 55
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 68
    .line 69
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 70
    .line 71
    if-eqz p0, :cond_4

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 78
    .line 79
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

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->isOpen:Z

    .line 34
    .line 35
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->isOpen:Z

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 62
    .line 63
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 72
    .line 73
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_2

    .line 78
    .line 79
    return v0

    .line 80
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivehourleaderboard"

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
    if-nez v0, :cond_7

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->isOpen:Z

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    const/16 v1, 0x4cf

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_2
    const/16 v1, 0x4d5

    .line 42
    .line 43
    :goto_2
    add-int/2addr v0, v1

    .line 44
    mul-int/lit8 v0, v0, 0x29

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    goto :goto_3

    .line 55
    :cond_3
    move v1, v2

    .line 56
    :goto_3
    add-int/2addr v0, v1

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz v1, :cond_4

    .line 62
    .line 63
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    goto :goto_4

    .line 68
    :cond_4
    move v1, v2

    .line 69
    :goto_4
    add-int/2addr v0, v1

    .line 70
    mul-int/lit8 v0, v0, 0x29

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 73
    .line 74
    if-eqz v1, :cond_5

    .line 75
    .line 76
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->hashCode()I

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    goto :goto_5

    .line 81
    :cond_5
    move v1, v2

    .line 82
    :goto_5
    add-int/2addr v0, v1

    .line 83
    mul-int/lit8 v0, v0, 0x29

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 86
    .line 87
    if-eqz v1, :cond_6

    .line 88
    .line 89
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;->hashCode()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    :cond_6
    add-int/2addr v0, v2

    .line 94
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 95
    .line 96
    :cond_7
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentRoomLeaderboards:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->allLeaderboards:Ljava/util/List;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->notices:Ljava/util/List;

    .line 33
    .line 34
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    const-string v0, ""

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->helperPageUrl:Ljava/lang/String;

    .line 41
    .line 42
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 43
    .line 44
    if-nez v0, :cond_4

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 51
    .line 52
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 53
    .line 54
    if-nez v0, :cond_5

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->hourLeaderboardBattle:Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardBattle;

    .line 61
    .line 62
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
