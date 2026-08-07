.class public Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;
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
            "Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "blivedefaultopenparas"


# instance fields
.field public effectiveWatchMinSeconds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public maxOpenPerDay:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public sidebarLiveLimitCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->nullCheck()V

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

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->effectiveWatchMinSeconds:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->effectiveWatchMinSeconds:J

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerDay:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerDay:I

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;->clone()Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 23
    .line 24
    :cond_0
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->sidebarLiveLimitCount:I

    .line 25
    .line 26
    iput p0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->sidebarLiveLimitCount:I

    .line 27
    .line 28
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->clone()Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

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
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->effectiveWatchMinSeconds:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->effectiveWatchMinSeconds:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerDay:I

    .line 22
    .line 23
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerDay:I

    .line 24
    .line 25
    if-ne v1, v3, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 30
    .line 31
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->sidebarLiveLimitCount:I

    .line 38
    .line 39
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->sidebarLiveLimitCount:I

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
    const-string p0, "blivedefaultopenparas"

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
    iget-wide v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->effectiveWatchMinSeconds:J

    .line 8
    .line 9
    const/16 v3, 0x20

    .line 10
    .line 11
    ushr-long v3, v1, v3

    .line 12
    .line 13
    xor-long/2addr v1, v3

    .line 14
    long-to-int v1, v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x29

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerDay:I

    .line 19
    .line 20
    add-int/2addr v0, v1

    .line 21
    mul-int/lit8 v0, v0, 0x29

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 v1, 0x0

    .line 33
    :goto_0
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->sidebarLiveLimitCount:I

    .line 37
    .line 38
    add-int/2addr v0, v1

    .line 39
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 40
    .line 41
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;->new_()Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->maxOpenPerNDays:Lcom/p1/mobile/putong/live/base/data/BLivePerNDays;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveDefaultOpenParas;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
