.class public Lcom/p1/mobile/putong/core/data/CommentInfo;
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
            "Lcom/p1/mobile/putong/core/data/CommentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/CommentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "commentinfo"


# instance fields
.field public isBottom:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public liked:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public likes:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public moreSubMessages:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public parentMessageId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public replyMessageAnonymous:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public replyMessageId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public subMessageIds:Ljava/util/List;
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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CommentInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CommentInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/CommentInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CommentInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/CommentInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CommentInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/CommentInfo;->nullCheck()V

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

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CommentInfo;->clone()Lcom/p1/mobile/putong/core/data/CommentInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/CommentInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/CommentInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->likes:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->likes:I

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->liked:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->liked:Z

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->subMessageIds:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v2, Ll/fi5;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/fi5;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->subMessageIds:Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->isBottom:Z

    .line 38
    .line 39
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->isBottom:Z

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageId:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageId:Ljava/lang/String;

    .line 44
    .line 45
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageAnonymous:Z

    .line 46
    .line 47
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageAnonymous:Z

    .line 48
    .line 49
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CommentInfo;->clone()Lcom/p1/mobile/putong/core/data/CommentInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/CommentInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->likes:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/CommentInfo;->likes:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->liked:Z

    .line 20
    .line 21
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CommentInfo;->liked:Z

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->subMessageIds:Ljava/util/List;

    .line 36
    .line 37
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CommentInfo;->subMessageIds:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->isBottom:Z

    .line 56
    .line 57
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/CommentInfo;->isBottom:Z

    .line 58
    .line 59
    if-ne v1, v3, :cond_2

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageId:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageId:Ljava/lang/String;

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
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageAnonymous:Z

    .line 72
    .line 73
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageAnonymous:Z

    .line 74
    .line 75
    if-ne p0, p1, :cond_2

    .line 76
    .line 77
    return v0

    .line 78
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "commentinfo"

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
    if-nez v0, :cond_7

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->likes:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->liked:Z

    .line 13
    .line 14
    const/16 v2, 0x4d5

    .line 15
    .line 16
    const/16 v3, 0x4cf

    .line 17
    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    move v1, v3

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v1, v4

    .line 37
    :goto_1
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->subMessageIds:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    move v1, v4

    .line 50
    :goto_2
    add-int/2addr v0, v1

    .line 51
    mul-int/lit8 v0, v0, 0x29

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz v1, :cond_3

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    goto :goto_3

    .line 62
    :cond_3
    move v1, v4

    .line 63
    :goto_3
    add-int/2addr v0, v1

    .line 64
    mul-int/lit8 v0, v0, 0x29

    .line 65
    .line 66
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->isBottom:Z

    .line 67
    .line 68
    if-eqz v1, :cond_4

    .line 69
    .line 70
    move v1, v3

    .line 71
    goto :goto_4

    .line 72
    :cond_4
    move v1, v2

    .line 73
    :goto_4
    add-int/2addr v0, v1

    .line 74
    mul-int/lit8 v0, v0, 0x29

    .line 75
    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageId:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    :cond_5
    add-int/2addr v0, v4

    .line 85
    mul-int/lit8 v0, v0, 0x29

    .line 86
    .line 87
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageAnonymous:Z

    .line 88
    .line 89
    if-eqz v1, :cond_6

    .line 90
    .line 91
    move v2, v3

    .line 92
    :cond_6
    add-int/2addr v0, v2

    .line 93
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 94
    .line 95
    :cond_7
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->subMessageIds:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->subMessageIds:Ljava/util/List;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->moreSubMessages:Ljava/lang/String;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageId:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CommentInfo;->replyMessageId:Ljava/lang/String;

    .line 31
    .line 32
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
