.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoicehourleaderboarditem"


# instance fields
.field public amount:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public rank:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public sweetCpRoom:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public sweetCpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;
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
        index = 0x5
    .end annotation
.end field

.field public user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;
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
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->nullCheck()V

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

    .line 70
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 25
    .line 26
    :cond_1
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->type:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->type:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 57
    .line 58
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpRoom:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;

    .line 59
    .line 60
    if-eqz p0, :cond_4

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    iput-object p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpRoom:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;

    .line 67
    .line 68
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

    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 36
    .line 37
    cmp-long v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 42
    .line 43
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 44
    .line 45
    cmp-long v1, v3, v5

    .line 46
    .line 47
    if-nez v1, :cond_2

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->type:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 72
    .line 73
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpRoom:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpRoom:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;

    .line 82
    .line 83
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-eqz p0, :cond_2

    .line 88
    .line 89
    return v0

    .line 90
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "blivevoicehourleaderboarditem"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->hashCode()I

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->rank:J

    .line 35
    .line 36
    const/16 v1, 0x20

    .line 37
    .line 38
    ushr-long v5, v3, v1

    .line 39
    .line 40
    xor-long/2addr v3, v5

    .line 41
    long-to-int v3, v3

    .line 42
    add-int/2addr v0, v3

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->amount:J

    .line 46
    .line 47
    ushr-long v5, v3, v1

    .line 48
    .line 49
    xor-long/2addr v3, v5

    .line 50
    long-to-int v1, v3

    .line 51
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->type:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v1, :cond_2

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    move v1, v2

    .line 64
    :goto_2
    add-int/2addr v0, v1

    .line 65
    mul-int/lit8 v0, v0, 0x29

    .line 66
    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 68
    .line 69
    if-eqz v1, :cond_3

    .line 70
    .line 71
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->hashCode()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    goto :goto_3

    .line 76
    :cond_3
    move v1, v2

    .line 77
    :goto_3
    add-int/2addr v0, v1

    .line 78
    mul-int/lit8 v0, v0, 0x29

    .line 79
    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->hashCode()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    goto :goto_4

    .line 89
    :cond_4
    move v1, v2

    .line 90
    :goto_4
    add-int/2addr v0, v1

    .line 91
    mul-int/lit8 v0, v0, 0x29

    .line 92
    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpRoom:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;

    .line 94
    .line 95
    if-eqz v1, :cond_5

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;->hashCode()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    :cond_5
    add-int/2addr v0, v2

    .line 102
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 103
    .line 104
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->mvpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->type:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    const-string v0, ""

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->type:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->room:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpUser:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpRoom:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->sweetCpRoom:Lcom/p1/mobile/putong/live/base/data/BLiveSweetCpRoom;

    .line 58
    .line 59
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
