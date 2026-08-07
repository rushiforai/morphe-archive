.class public Lcom/p1/mobile/putong/data/ActivityUser;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/ValueObject<",
        "Lcom/p1/mobile/putong/data/ActivityUser;",
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
            "Lcom/p1/mobile/putong/data/ActivityUser;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/ActivityUser;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "activityuser"


# instance fields
.field public action:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
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

.field public score:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/ActivityUser$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ActivityUser$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/ActivityUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/ActivityUser$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ActivityUser$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/ActivityUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/data/ActivityUser;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/ActivityUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ActivityUser;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/ActivityUser;->nullCheck()V

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

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/ActivityUser;->clone()Lcom/p1/mobile/putong/data/ActivityUser;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/ActivityUser;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/ActivityUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ActivityUser;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    .line 13
    .line 14
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/ActivityUser;->clone()Lcom/p1/mobile/putong/data/ActivityUser;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/ActivityUser;

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
    check-cast p1, Lcom/p1/mobile/putong/data/ActivityUser;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    .line 24
    .line 25
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    .line 26
    .line 27
    cmp-long p0, v3, p0

    .line 28
    .line 29
    if-nez p0, :cond_2

    .line 30
    .line 31
    return v0

    .line 32
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "activityuser"

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
    if-nez v0, :cond_1

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    :goto_0
    add-int/2addr v0, v1

    .line 18
    mul-int/lit8 v0, v0, 0x29

    .line 19
    .line 20
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    .line 21
    .line 22
    const/16 v3, 0x20

    .line 23
    .line 24
    ushr-long v3, v1, v3

    .line 25
    .line 26
    xor-long/2addr v1, v3

    .line 27
    long-to-int v1, v1

    .line 28
    add-int/2addr v0, v1

    .line 29
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 30
    .line 31
    :cond_1
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->parseFieldSet:Ljava/util/HashSet;

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

.method public mergeData(Lcom/p1/mobile/putong/data/ActivityUser;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/ActivityUser;->equals(Ljava/lang/Object;)Z

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
    const-string v0, "action"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/ActivityUser;->isFieldParsed(Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 25
    .line 26
    :cond_1
    const-string v0, "score"

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/ActivityUser;->isFieldParsed(Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_2

    .line 33
    .line 34
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    .line 35
    .line 36
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->score:J

    .line 37
    .line 38
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->parseFieldSet:Ljava/util/HashSet;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 41
    .line 42
    .line 43
    :cond_3
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/data/ActivityUser;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/ActivityUser;->mergeData(Lcom/p1/mobile/putong/data/ActivityUser;)V

    return-void
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/ActivityUser;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/data/ActivityUser;)Lcom/p1/mobile/putong/data/ActivityUser;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/ActivityUser;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/ActivityUser;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p0, v0, Lcom/p1/mobile/putong/data/ActivityUser;->action:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    new-instance p0, Lcom/p1/mobile/putong/data/ActivityUser;

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/ActivityUser;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/ActivityUser;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    return-object p0

    .line 33
    :cond_1
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/ActivityUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
