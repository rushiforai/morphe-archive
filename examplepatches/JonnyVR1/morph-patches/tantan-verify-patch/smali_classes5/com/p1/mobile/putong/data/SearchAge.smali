.class public Lcom/p1/mobile/putong/data/SearchAge;
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
            "Lcom/p1/mobile/putong/data/SearchAge;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/SearchAge;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "searchage"


# instance fields
.field public allowedMaximum:Ljava/lang/Integer;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public allowedMinimum:Ljava/lang/Integer;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public maximum:Ljava/lang/Integer;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public minimum:Ljava/lang/Integer;
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
    new-instance v0, Lcom/p1/mobile/putong/data/SearchAge$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SearchAge$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/SearchAge;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/SearchAge$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SearchAge$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/SearchAge;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/data/SearchAge;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SearchAge;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SearchAge;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/SearchAge;->nullCheck()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SearchAge;->clone()Lcom/p1/mobile/putong/data/SearchAge;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/SearchAge;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SearchAge;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SearchAge;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 19
    .line 20
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/SearchAge;->clone()Lcom/p1/mobile/putong/data/SearchAge;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/SearchAge;

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
    check-cast p1, Lcom/p1/mobile/putong/data/SearchAge;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    return v0

    .line 54
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "searchage"

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    goto :goto_2

    .line 43
    :cond_2
    move v1, v2

    .line 44
    :goto_2
    add-int/2addr v0, v1

    .line 45
    mul-int/lit8 v0, v0, 0x29

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    :cond_3
    add-int/2addr v0, v2

    .line 56
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 57
    .line 58
    :cond_4
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 7
    .line 8
    if-nez v1, :cond_0

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMinimum:Ljava/lang/Integer;

    .line 11
    .line 12
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SearchAge;->allowedMaximum:Ljava/lang/Integer;

    .line 17
    .line 18
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 19
    .line 20
    if-nez v1, :cond_2

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 23
    .line 24
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 25
    .line 26
    if-nez v1, :cond_3

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 29
    .line 30
    :cond_3
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/data/SearchAge;)Lcom/p1/mobile/putong/data/SearchAge;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/SearchAge;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/SearchAge;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SearchAge;->minimum:Ljava/lang/Integer;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 31
    .line 32
    iput-object p0, v0, Lcom/p1/mobile/putong/data/SearchAge;->maximum:Ljava/lang/Integer;

    .line 33
    .line 34
    :cond_1
    new-instance p0, Lcom/p1/mobile/putong/data/SearchAge;

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/SearchAge;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/SearchAge;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    const/4 p0, 0x0

    .line 46
    return-object p0

    .line 47
    :cond_2
    return-object v0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/SearchAge;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
