.class public Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;
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
            "Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "mymeetentrypoint"


# instance fields
.field public boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public summarizedPrivileges:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/UserPrivilege;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/UserPrivilege;)Lcom/p1/mobile/putong/core/data/UserPrivilege;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/UserPrivilege;->clone()Lcom/p1/mobile/putong/core/data/UserPrivilege;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->nullCheck()V

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

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 45
    .line 46
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 47
    .line 48
    if-eqz v1, :cond_4

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 55
    .line 56
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 57
    .line 58
    if-eqz p0, :cond_5

    .line 59
    .line 60
    new-instance v1, Ll/k320;

    .line 61
    .line 62
    invoke-direct {v1}, Ll/k320;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 70
    .line 71
    :cond_5
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->clone()Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 66
    .line 67
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    return v0

    .line 74
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "mymeetentrypoint"

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
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    :cond_5
    add-int/2addr v0, v2

    .line 82
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 83
    .line 84
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->boost:Lcom/p1/mobile/putong/core/data/MyMeetEntryBoost;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->conversation:Lcom/p1/mobile/putong/core/data/MyMeetEntryConversation;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->feed:Lcom/p1/mobile/putong/core/data/MyMeetEntryFeed;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->picks:Lcom/p1/mobile/putong/core/data/MyMeetEntryPicks;

    .line 40
    .line 41
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 42
    .line 43
    if-nez v0, :cond_4

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;->new_()Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->see:Lcom/p1/mobile/putong/core/data/MyMeetEntrySee;

    .line 50
    .line 51
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 52
    .line 53
    if-nez v0, :cond_5

    .line 54
    .line 55
    new-instance v0, Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->summarizedPrivileges:Ljava/util/List;

    .line 61
    .line 62
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/MyMeetEntrypoint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
