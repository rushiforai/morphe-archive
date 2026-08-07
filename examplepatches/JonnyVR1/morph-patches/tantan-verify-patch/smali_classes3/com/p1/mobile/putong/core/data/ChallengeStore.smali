.class public Lcom/p1/mobile/putong/core/data/ChallengeStore;
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
            "Lcom/p1/mobile/putong/core/data/ChallengeStore;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ChallengeStore;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "challengestore"


# instance fields
.field public lastInsertTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public switchStatus:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChallengeStore$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChallengeStore$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChallengeStore$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChallengeStore$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/ChallengeStore;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChallengeStore;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChallengeStore;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ChallengeStore;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChallengeStore;
    .locals 1

    .line 1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChallengeStore;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :catch_0
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChallengeStore;->new_()Lcom/p1/mobile/putong/core/data/ChallengeStore;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChallengeStore;->clone()Lcom/p1/mobile/putong/core/data/ChallengeStore;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ChallengeStore;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChallengeStore;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChallengeStore;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->switchStatus:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->switchStatus:Z

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->lastInsertTime:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->lastInsertTime:J

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChallengeStore;->clone()Lcom/p1/mobile/putong/core/data/ChallengeStore;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ChallengeStore;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChallengeStore;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->switchStatus:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/ChallengeStore;->switchStatus:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->lastInsertTime:J

    .line 20
    .line 21
    iget-wide p0, p1, Lcom/p1/mobile/putong/core/data/ChallengeStore;->lastInsertTime:J

    .line 22
    .line 23
    cmp-long p0, v3, p0

    .line 24
    .line 25
    if-nez p0, :cond_2

    .line 26
    .line 27
    return v0

    .line 28
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "challengestore"

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
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->switchStatus:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    const/16 v1, 0x4cf

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 v1, 0x4d5

    .line 15
    .line 16
    :goto_0
    add-int/2addr v0, v1

    .line 17
    mul-int/lit8 v0, v0, 0x29

    .line 18
    .line 19
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->lastInsertTime:J

    .line 20
    .line 21
    const/16 v3, 0x20

    .line 22
    .line 23
    ushr-long v3, v1, v3

    .line 24
    .line 25
    xor-long/2addr v1, v3

    .line 26
    long-to-int v1, v1

    .line 27
    add-int/2addr v0, v1

    .line 28
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 29
    .line 30
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 0

    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChallengeStore;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
