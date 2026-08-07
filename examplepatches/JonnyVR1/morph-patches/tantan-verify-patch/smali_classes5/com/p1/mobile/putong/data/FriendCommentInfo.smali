.class public Lcom/p1/mobile/putong/data/FriendCommentInfo;
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
            "Lcom/p1/mobile/putong/data/FriendCommentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/FriendCommentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "friendcommentinfo"


# instance fields
.field public alreadyInterested:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public commentsCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public friendsComments:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/FriendComment;",
            ">;"
        }
    .end annotation
.end field

.field public friendsCommentsHistory:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/FriendComment;",
            ">;"
        }
    .end annotation
.end field

.field public interestedUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/InterestUserSimple;",
            ">;"
        }
    .end annotation
.end field

.field public interestsCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public unreadCounter:Lcom/p1/mobile/putong/data/UnreadCounter;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public userId:Ljava/lang/String;
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
    new-instance v0, Lcom/p1/mobile/putong/data/FriendCommentInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/FriendCommentInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/FriendCommentInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/FriendCommentInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/FriendComment;)Lcom/p1/mobile/putong/data/FriendComment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/FriendComment;->clone()Lcom/p1/mobile/putong/data/FriendComment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/FriendComment;)Lcom/p1/mobile/putong/data/FriendComment;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/FriendComment;->clone()Lcom/p1/mobile/putong/data/FriendComment;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/InterestUserSimple;)Lcom/p1/mobile/putong/data/InterestUserSimple;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/InterestUserSimple;->clone()Lcom/p1/mobile/putong/data/InterestUserSimple;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/FriendCommentInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/FriendCommentInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/FriendCommentInfo;->nullCheck()V

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

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/FriendCommentInfo;->clone()Lcom/p1/mobile/putong/data/FriendCommentInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/FriendCommentInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/FriendCommentInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestsCount:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestsCount:I

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->alreadyInterested:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->alreadyInterested:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v2, Ll/k9j;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/k9j;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestedUsers:Ljava/util/List;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    new-instance v2, Ll/l9j;

    .line 38
    .line 39
    invoke-direct {v2}, Ll/l9j;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestedUsers:Ljava/util/List;

    .line 47
    .line 48
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->commentsCount:I

    .line 49
    .line 50
    iput v1, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->commentsCount:I

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    new-instance v2, Ll/m9j;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/m9j;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

    .line 66
    .line 67
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->unreadCounter:Lcom/p1/mobile/putong/data/UnreadCounter;

    .line 68
    .line 69
    if-eqz p0, :cond_3

    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UnreadCounter;->clone()Lcom/p1/mobile/putong/data/UnreadCounter;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    iput-object p0, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->unreadCounter:Lcom/p1/mobile/putong/data/UnreadCounter;

    .line 76
    .line 77
    :cond_3
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/FriendCommentInfo;->clone()Lcom/p1/mobile/putong/data/FriendCommentInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;->userId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestsCount:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestsCount:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->alreadyInterested:Z

    .line 30
    .line 31
    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;->alreadyInterested:Z

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestedUsers:Ljava/util/List;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestedUsers:Ljava/util/List;

    .line 48
    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->commentsCount:I

    .line 56
    .line 57
    iget v3, p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;->commentsCount:I

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->unreadCounter:Lcom/p1/mobile/putong/data/UnreadCounter;

    .line 72
    .line 73
    iget-object p1, p1, Lcom/p1/mobile/putong/data/FriendCommentInfo;->unreadCounter:Lcom/p1/mobile/putong/data/UnreadCounter;

    .line 74
    .line 75
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_2

    .line 80
    .line 81
    return v0

    .line 82
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "friendcommentinfo"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->userId:Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestsCount:I

    .line 22
    .line 23
    add-int/2addr v0, v1

    .line 24
    mul-int/lit8 v0, v0, 0x29

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->alreadyInterested:Z

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    const/16 v1, 0x4cf

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    const/16 v1, 0x4d5

    .line 34
    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestedUsers:Ljava/util/List;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    goto :goto_3

    .line 60
    :cond_3
    move v1, v2

    .line 61
    :goto_3
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->commentsCount:I

    .line 65
    .line 66
    add-int/2addr v0, v1

    .line 67
    mul-int/lit8 v0, v0, 0x29

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

    .line 70
    .line 71
    if-eqz v1, :cond_4

    .line 72
    .line 73
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    goto :goto_4

    .line 78
    :cond_4
    move v1, v2

    .line 79
    :goto_4
    add-int/2addr v0, v1

    .line 80
    mul-int/lit8 v0, v0, 0x29

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->unreadCounter:Lcom/p1/mobile/putong/data/UnreadCounter;

    .line 83
    .line 84
    if-eqz v1, :cond_5

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UnreadCounter;->hashCode()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    :cond_5
    add-int/2addr v0, v2

    .line 91
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 92
    .line 93
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->userId:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestedUsers:Ljava/util/List;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestedUsers:Ljava/util/List;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

    .line 41
    .line 42
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->unreadCounter:Lcom/p1/mobile/putong/data/UnreadCounter;

    .line 43
    .line 44
    if-nez v0, :cond_4

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/data/UnreadCounter;->new_()Lcom/p1/mobile/putong/data/UnreadCounter;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->unreadCounter:Lcom/p1/mobile/putong/data/UnreadCounter;

    .line 51
    .line 52
    :cond_4
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
