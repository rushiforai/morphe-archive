.class public Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;
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
            "Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "visitorfiltersettings"


# instance fields
.field public distance:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public maxAge:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public minAge:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;
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
    new-instance v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static new_()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->nullCheck()V

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

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->clone()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 7
    .line 8
    iput v1, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 11
    .line 12
    iput v1, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 23
    .line 24
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 25
    .line 26
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->clone()Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;

    .line 12
    .line 13
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 14
    .line 15
    iget v3, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 16
    .line 17
    if-ne v1, v3, :cond_2

    .line 18
    .line 19
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 20
    .line 21
    iget v3, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 22
    .line 23
    if-ne v1, v3, :cond_2

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 26
    .line 27
    iget v3, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 28
    .line 29
    if-ne v1, v3, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 32
    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 34
    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    if-eqz v1, :cond_2

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 44
    .line 45
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    return v0

    .line 52
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "visitorfiltersettings"

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
    if-nez v0, :cond_2

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->distance:I

    .line 8
    .line 9
    add-int/2addr v0, v1

    .line 10
    mul-int/lit8 v0, v0, 0x29

    .line 11
    .line 12
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->minAge:I

    .line 13
    .line 14
    add-int/2addr v0, v1

    .line 15
    mul-int/lit8 v0, v0, 0x29

    .line 16
    .line 17
    iget v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->maxAge:I

    .line 18
    .line 19
    add-int/2addr v0, v1

    .line 20
    mul-int/lit8 v0, v0, 0x29

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v1, v2

    .line 33
    :goto_0
    add-int/2addr v0, v1

    .line 34
    mul-int/lit8 v0, v0, 0x29

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    :cond_1
    add-int/2addr v0, v2

    .line 45
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 46
    .line 47
    :cond_2
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorFilterType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->filter:Lcom/p1/mobile/putong/core/data/VisitorFilterType;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorSortType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->sort:Lcom/p1/mobile/putong/core/data/VisitorSortType;

    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/VisitorFilterSettings;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
