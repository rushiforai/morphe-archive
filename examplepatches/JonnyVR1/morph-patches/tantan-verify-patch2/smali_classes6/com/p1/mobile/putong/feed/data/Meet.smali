.class public Lcom/p1/mobile/putong/feed/data/Meet;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ValueObject<",
        "Lcom/p1/mobile/putong/feed/data/Meet;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/feed/data/Meet;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/feed/data/Meet;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "meet"


# instance fields
.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field private parseFieldSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public userId:Ljava/lang/String;
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
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Meet$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Meet$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/feed/data/Meet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Meet$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Meet$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/feed/data/Meet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/feed/data/Meet;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Meet;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Meet;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/data/Meet;->nullCheck()V

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

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Meet;->clone()Lcom/p1/mobile/putong/feed/data/Meet;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/feed/data/Meet;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/data/Meet;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/feed/data/Meet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 15
    .line 16
    iput-object p0, v0, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 17
    .line 18
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/Meet;->clone()Lcom/p1/mobile/putong/feed/data/Meet;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/feed/data/Meet;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Meet;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-eqz p0, :cond_2

    .line 42
    .line 43
    return v0

    .line 44
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "meet"

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
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    :cond_2
    add-int/2addr v0, v2

    .line 43
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 44
    .line 45
    :cond_3
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->parseFieldSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/feed/data/Meet;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Meet;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "type"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Meet;->isFieldParsed(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

    .line 25
    .line 26
    :cond_1
    const-string v0, "id"

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Meet;->isFieldParsed(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

    .line 37
    .line 38
    :cond_2
    const-string v0, "userId"

    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/data/Meet;->isFieldParsed(Ljava/lang/String;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_3

    .line 45
    .line 46
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 49
    .line 50
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->parseFieldSet:Ljava/util/HashSet;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 53
    .line 54
    .line 55
    :cond_4
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 56
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Meet;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Meet;->mergeData(Lcom/p1/mobile/putong/feed/data/Meet;)V

    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->type:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->id:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Meet;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Meet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
