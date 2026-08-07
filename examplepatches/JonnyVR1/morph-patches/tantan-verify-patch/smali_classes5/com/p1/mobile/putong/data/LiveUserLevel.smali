.class public Lcom/p1/mobile/putong/data/LiveUserLevel;
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
            "Lcom/p1/mobile/putong/data/LiveUserLevel;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/LiveUserLevel;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "liveuserlevel"


# instance fields
.field public backendUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public gap:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public grade:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public iconUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public superGrade:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public wealthRatio:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveUserLevel$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveUserLevel$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/LiveUserLevel$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveUserLevel$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/LiveUserLevel;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveUserLevel;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/LiveUserLevel;->nullCheck()V

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

    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveUserLevel;->clone()Lcom/p1/mobile/putong/data/LiveUserLevel;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/LiveUserLevel;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/LiveUserLevel;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 9
    .line 10
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->wealthRatio:D

    .line 11
    .line 12
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->wealthRatio:D

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->gap:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->gap:J

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->iconUrl:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->iconUrl:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 25
    .line 26
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->superGrade:J

    .line 27
    .line 28
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->superGrade:J

    .line 29
    .line 30
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/LiveUserLevel;->clone()Lcom/p1/mobile/putong/data/LiveUserLevel;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;

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
    check-cast p1, Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 12
    .line 13
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 14
    .line 15
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 16
    .line 17
    cmp-long v1, v3, v5

    .line 18
    .line 19
    if-nez v1, :cond_2

    .line 20
    .line 21
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->wealthRatio:D

    .line 22
    .line 23
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->wealthRatio:D

    .line 24
    .line 25
    cmpl-double v1, v3, v5

    .line 26
    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->gap:J

    .line 30
    .line 31
    iget-wide v5, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->gap:J

    .line 32
    .line 33
    cmp-long v1, v3, v5

    .line 34
    .line 35
    if-nez v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->iconUrl:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->iconUrl:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->superGrade:J

    .line 58
    .line 59
    iget-wide p0, p1, Lcom/p1/mobile/putong/data/LiveUserLevel;->superGrade:J

    .line 60
    .line 61
    cmp-long p0, v3, p0

    .line 62
    .line 63
    if-nez p0, :cond_2

    .line 64
    .line 65
    return v0

    .line 66
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "liveuserlevel"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 6

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 8
    .line 9
    const/16 v3, 0x20

    .line 10
    .line 11
    ushr-long v4, v1, v3

    .line 12
    .line 13
    xor-long/2addr v1, v4

    .line 14
    long-to-int v1, v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->wealthRatio:D

    .line 17
    .line 18
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    mul-int/lit8 v0, v0, 0x29

    .line 23
    .line 24
    ushr-long v4, v1, v3

    .line 25
    .line 26
    xor-long/2addr v1, v4

    .line 27
    long-to-int v1, v1

    .line 28
    add-int/2addr v0, v1

    .line 29
    mul-int/lit8 v0, v0, 0x29

    .line 30
    .line 31
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->gap:J

    .line 32
    .line 33
    ushr-long v4, v1, v3

    .line 34
    .line 35
    xor-long/2addr v1, v4

    .line 36
    long-to-int v1, v1

    .line 37
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->iconUrl:Ljava/lang/String;

    .line 41
    .line 42
    const/4 v2, 0x0

    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    move v1, v2

    .line 51
    :goto_0
    add-int/2addr v0, v1

    .line 52
    mul-int/lit8 v0, v0, 0x29

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 55
    .line 56
    if-eqz v1, :cond_1

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    :cond_1
    add-int/2addr v0, v2

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->superGrade:J

    .line 66
    .line 67
    ushr-long v3, v1, v3

    .line 68
    .line 69
    xor-long/2addr v1, v3

    .line 70
    long-to-int v1, v1

    .line 71
    add-int/2addr v0, v1

    .line 72
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 73
    .line 74
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->iconUrl:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->iconUrl:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->backendUrl:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/LiveUserLevel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
