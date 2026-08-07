.class public Lcom/p1/mobile/putong/core/data/GuessLikersConfig;
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
            "Lcom/p1/mobile/putong/core/data/GuessLikersConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/GuessLikersConfig;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "guesslikersconfig"


# instance fields
.field public firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public isGuessLikeOpen:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/GuessLikersConfig;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->nullCheck()V

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

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->clone()Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/GuessLikersConfig;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->isGuessLikeOpen:Z

    .line 7
    .line 8
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->isGuessLikeOpen:Z

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;->clone()Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 25
    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;->clone()Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 33
    .line 34
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;->clone()Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 43
    .line 44
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

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->clone()Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;

    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->isGuessLikeOpen:Z

    .line 14
    .line 15
    iget-boolean v3, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->isGuessLikeOpen:Z

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 30
    .line 31
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

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
    const-string p0, "guesslikersconfig"

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
    if-nez v0, :cond_5

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->isGuessLikeOpen:Z

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v1, v2

    .line 30
    :goto_1
    add-int/2addr v0, v1

    .line 31
    mul-int/lit8 v0, v0, 0x29

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 34
    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;->hashCode()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    goto :goto_2

    .line 42
    :cond_2
    move v1, v2

    .line 43
    :goto_2
    add-int/2addr v0, v1

    .line 44
    mul-int/lit8 v0, v0, 0x29

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 47
    .line 48
    if-eqz v1, :cond_3

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;->hashCode()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    goto :goto_3

    .line 55
    :cond_3
    move v1, v2

    .line 56
    :goto_3
    add-int/2addr v0, v1

    .line 57
    mul-int/lit8 v0, v0, 0x29

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 60
    .line 61
    if-eqz v1, :cond_4

    .line 62
    .line 63
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;->hashCode()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    :cond_4
    add-int/2addr v0, v2

    .line 68
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 69
    .line 70
    :cond_5
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->name:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;->new_()Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->firstRule:Lcom/p1/mobile/putong/core/data/GuessLikersFirstRule;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;->new_()Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->secondRule:Lcom/p1/mobile/putong/core/data/GuessLikersSecondRule;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;->new_()Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->thirdRule:Lcom/p1/mobile/putong/core/data/GuessLikersThirdRule;

    .line 38
    .line 39
    :cond_3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/GuessLikersConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
