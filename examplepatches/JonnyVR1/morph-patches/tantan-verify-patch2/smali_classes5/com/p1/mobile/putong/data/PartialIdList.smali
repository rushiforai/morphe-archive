.class public Lcom/p1/mobile/putong/data/PartialIdList;
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
            "Lcom/p1/mobile/putong/data/PartialIdList;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/PartialIdList;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "partialidlist"

.field public static UNINITIALIZED:Lcom/p1/mobile/putong/data/PartialIdList;


# instance fields
.field public count:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public expouseIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public ids:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public latestMessageId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public links:Lcom/p1/mobile/putong/data/Links;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Lcom/p1/mobile/putong/data/PartialIdList;->UNINITIALIZED:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/data/PartialIdList$1;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PartialIdList$1;-><init>()V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lcom/p1/mobile/putong/data/PartialIdList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/data/PartialIdList$2;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PartialIdList$2;-><init>()V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/p1/mobile/putong/data/PartialIdList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 20
    .line 21
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

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/PartialIdList;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/PartialIdList;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PartialIdList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PartialIdList;->nullCheck()V

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

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PartialIdList;->clone()Lcom/p1/mobile/putong/data/PartialIdList;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/PartialIdList;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/PartialIdList;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PartialIdList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    new-instance v2, Ll/tg60;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/tg60;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Links;->clone()Lcom/p1/mobile/putong/data/Links;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 34
    .line 35
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->latestMessageId:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PartialIdList;->latestMessageId:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->expouseIds:Ljava/util/List;

    .line 40
    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    new-instance v1, Ll/ug60;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/ug60;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iput-object p0, v0, Lcom/p1/mobile/putong/data/PartialIdList;->expouseIds:Ljava/util/List;

    .line 53
    .line 54
    :cond_2
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PartialIdList;->clone()Lcom/p1/mobile/putong/data/PartialIdList;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/PartialIdList;

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
    check-cast p1, Lcom/p1/mobile/putong/data/PartialIdList;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->latestMessageId:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/data/PartialIdList;->latestMessageId:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->expouseIds:Ljava/util/List;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PartialIdList;->expouseIds:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    return v0

    .line 60
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "partialidlist"

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
    if-nez v0, :cond_4

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->count:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 18
    .line 19
    .line 20
    move-result v1

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Links;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->latestMessageId:Ljava/lang/String;

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
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PartialIdList;->expouseIds:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    :cond_3
    add-int/2addr v0, v2

    .line 61
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 62
    .line 63
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->ids:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/data/Links;->new_()Lcom/p1/mobile/putong/data/Links;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->links:Lcom/p1/mobile/putong/data/Links;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->latestMessageId:Ljava/lang/String;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-string v0, ""

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->latestMessageId:Ljava/lang/String;

    .line 29
    .line 30
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->expouseIds:Ljava/util/List;

    .line 31
    .line 32
    if-nez v0, :cond_3

    .line 33
    .line 34
    new-instance v0, Ljava/util/ArrayList;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PartialIdList;->expouseIds:Ljava/util/List;

    .line 40
    .line 41
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/PartialIdList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
