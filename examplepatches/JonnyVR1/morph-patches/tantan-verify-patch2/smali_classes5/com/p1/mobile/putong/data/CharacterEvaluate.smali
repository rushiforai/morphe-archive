.class public Lcom/p1/mobile/putong/data/CharacterEvaluate;
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
            "Lcom/p1/mobile/putong/data/CharacterEvaluate;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/CharacterEvaluate;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "characterevaluate"


# instance fields
.field public actionTemperature:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public alcoholConcentration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public characterSweetness:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public classification:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public hideCharacter:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public tags:Ljava/util/List;
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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CharacterEvaluate$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CharacterEvaluate$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/CharacterEvaluate$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CharacterEvaluate$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/CharacterEvaluate;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CharacterEvaluate;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/CharacterEvaluate;->nullCheck()V

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

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CharacterEvaluate;->clone()Lcom/p1/mobile/putong/data/CharacterEvaluate;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/CharacterEvaluate;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/CharacterEvaluate;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->tags:Ljava/util/List;

    .line 11
    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    new-instance v2, Ll/ys4;

    .line 15
    .line 16
    invoke-direct {v2}, Ll/ys4;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->tags:Ljava/util/List;

    .line 24
    .line 25
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->actionTemperature:I

    .line 26
    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->actionTemperature:I

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->characterSweetness:I

    .line 30
    .line 31
    iput v1, v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->characterSweetness:I

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->alcoholConcentration:I

    .line 34
    .line 35
    iput v1, v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->alcoholConcentration:I

    .line 36
    .line 37
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 38
    .line 39
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 40
    .line 41
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CharacterEvaluate;->clone()Lcom/p1/mobile/putong/data/CharacterEvaluate;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;

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
    check-cast p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->tags:Ljava/util/List;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->tags:Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->actionTemperature:I

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->actionTemperature:I

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->characterSweetness:I

    .line 40
    .line 41
    iget v3, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->characterSweetness:I

    .line 42
    .line 43
    if-ne v1, v3, :cond_2

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->alcoholConcentration:I

    .line 46
    .line 47
    iget v3, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->alcoholConcentration:I

    .line 48
    .line 49
    if-ne v1, v3, :cond_2

    .line 50
    .line 51
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 52
    .line 53
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 54
    .line 55
    if-ne p0, p1, :cond_2

    .line 56
    .line 57
    return v0

    .line 58
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "characterevaluate"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->tags:Ljava/util/List;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    :cond_1
    add-int/2addr v0, v2

    .line 30
    mul-int/lit8 v0, v0, 0x29

    .line 31
    .line 32
    iget v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->actionTemperature:I

    .line 33
    .line 34
    add-int/2addr v0, v1

    .line 35
    mul-int/lit8 v0, v0, 0x29

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->characterSweetness:I

    .line 38
    .line 39
    add-int/2addr v0, v1

    .line 40
    mul-int/lit8 v0, v0, 0x29

    .line 41
    .line 42
    iget v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->alcoholConcentration:I

    .line 43
    .line 44
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->hideCharacter:Z

    .line 48
    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    const/16 v1, 0x4cf

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    const/16 v1, 0x4d5

    .line 55
    .line 56
    :goto_1
    add-int/2addr v0, v1

    .line 57
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 58
    .line 59
    :cond_3
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->classification:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->tags:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->tags:Ljava/util/List;

    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
