.class public Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;
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
            "Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "mymeetentryv3"


# instance fields
.field public conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public nearby:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public oDiamondFeed:Lcom/p1/mobile/putong/core/data/ODiamondFeed;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public seeReminder:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->nullCheck()V

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

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->seeReminder:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->clone()Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->seeReminder:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->oDiamondFeed:Lcom/p1/mobile/putong/core/data/ODiamondFeed;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ODiamondFeed;->clone()Lcom/p1/mobile/putong/core/data/ODiamondFeed;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->oDiamondFeed:Lcom/p1/mobile/putong/core/data/ODiamondFeed;

    .line 45
    .line 46
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->nearby:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 47
    .line 48
    if-eqz p0, :cond_4

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->nearby:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 55
    .line 56
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

    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->seeReminder:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->seeReminder:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->oDiamondFeed:Lcom/p1/mobile/putong/core/data/ODiamondFeed;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->oDiamondFeed:Lcom/p1/mobile/putong/core/data/ODiamondFeed;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->nearby:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->nearby:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 56
    .line 57
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    return v0

    .line 64
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "mymeetentryv3"

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
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->seeReminder:Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetSeeReminder;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->oDiamondFeed:Lcom/p1/mobile/putong/core/data/ODiamondFeed;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ODiamondFeed;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->nearby:Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryNearby;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    :cond_4
    add-int/2addr v0, v2

    .line 69
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 70
    .line 71
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntryV3;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
