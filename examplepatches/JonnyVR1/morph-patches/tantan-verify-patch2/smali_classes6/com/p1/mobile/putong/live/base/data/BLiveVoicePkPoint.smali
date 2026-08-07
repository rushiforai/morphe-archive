.class public Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivevoicepkpoint"


# instance fields
.field public isNewTopOne:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public isScoreChange:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public point:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
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
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->nullCheck()V

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

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->point:J

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->point:J

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isNewTopOne:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isNewTopOne:Z

    .line 17
    .line 18
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isScoreChange:Z

    .line 19
    .line 20
    iput-boolean p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isScoreChange:Z

    .line 21
    .line 22
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->point:J

    .line 24
    .line 25
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->point:J

    .line 26
    .line 27
    cmp-long v1, v3, v5

    .line 28
    .line 29
    if-nez v1, :cond_2

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isNewTopOne:Z

    .line 32
    .line 33
    iget-boolean v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isNewTopOne:Z

    .line 34
    .line 35
    if-ne v1, v3, :cond_2

    .line 36
    .line 37
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isScoreChange:Z

    .line 38
    .line 39
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isScoreChange:Z

    .line 40
    .line 41
    if-ne p0, p1, :cond_2

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
    const-string p0, "blivevoicepkpoint"

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
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->point:J

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
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isNewTopOne:Z

    .line 32
    .line 33
    const/16 v2, 0x4d5

    .line 34
    .line 35
    const/16 v3, 0x4cf

    .line 36
    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    move v1, v3

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    move v1, v2

    .line 42
    :goto_1
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->isScoreChange:Z

    .line 46
    .line 47
    if-eqz v1, :cond_2

    .line 48
    .line 49
    move v2, v3

    .line 50
    :cond_2
    add-int/2addr v0, v2

    .line 51
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 52
    .line 53
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->userId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoicePkPoint;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
