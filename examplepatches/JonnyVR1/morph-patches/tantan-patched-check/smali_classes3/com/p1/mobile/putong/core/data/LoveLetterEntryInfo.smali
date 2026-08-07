.class public Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;
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
            "Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "loveletterentryinfo"


# instance fields
.field public count:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public display:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public endTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public msgLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public shadingWord:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public startTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->nullCheck()V

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

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->clone()Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 17
    .line 18
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 19
    .line 20
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->clone()Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 31
    .line 32
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->msgLimit:I

    .line 33
    .line 34
    iput v1, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->msgLimit:I

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 39
    .line 40
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->clone()Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 26
    .line 27
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 28
    .line 29
    cmpl-double v1, v3, v5

    .line 30
    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 34
    .line 35
    iget-wide v5, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 36
    .line 37
    cmpl-double v1, v3, v5

    .line 38
    .line 39
    if-nez v1, :cond_2

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 42
    .line 43
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 44
    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->msgLimit:I

    .line 52
    .line 53
    iget v3, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->msgLimit:I

    .line 54
    .line 55
    if-ne v1, v3, :cond_2

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 58
    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    return v0

    .line 68
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "loveletterentryinfo"

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
    if-nez v0, :cond_3

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 20
    .line 21
    add-int/2addr v0, v1

    .line 22
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->startTime:D

    .line 23
    .line 24
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 25
    .line 26
    .line 27
    move-result-wide v1

    .line 28
    mul-int/lit8 v0, v0, 0x29

    .line 29
    .line 30
    const/16 v3, 0x20

    .line 31
    .line 32
    ushr-long v4, v1, v3

    .line 33
    .line 34
    xor-long/2addr v1, v4

    .line 35
    long-to-int v1, v1

    .line 36
    add-int/2addr v0, v1

    .line 37
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 38
    .line 39
    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    ushr-long v3, v1, v3

    .line 46
    .line 47
    xor-long/2addr v1, v3

    .line 48
    long-to-int v1, v1

    .line 49
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->message:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 53
    .line 54
    const/4 v2, 0x0

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->hashCode()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    move v1, v2

    .line 63
    :goto_1
    add-int/2addr v0, v1

    .line 64
    mul-int/lit8 v0, v0, 0x29

    .line 65
    .line 66
    iget v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->msgLimit:I

    .line 67
    .line 68
    add-int/2addr v0, v1

    .line 69
    mul-int/lit8 v0, v0, 0x29

    .line 70
    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    :cond_2
    add-int/2addr v0, v2

    .line 80
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 81
    .line 82
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->shadingWord:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
