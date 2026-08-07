.class public Lcom/p1/mobile/putong/core/data/DatingPurpose;
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
            "Lcom/p1/mobile/putong/core/data/DatingPurpose;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/DatingPurpose;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "datingpurpose"


# instance fields
.field public extension:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public information:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public interest:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public introduction:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public myrecent:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public personality:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public picture:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public question:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/DatingPurpose$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/DatingPurpose$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/DatingPurpose$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/DatingPurpose$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/DatingPurpose;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/DatingPurpose;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/DatingPurpose;->nullCheck()V

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

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/DatingPurpose;->clone()Lcom/p1/mobile/putong/core/data/DatingPurpose;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/DatingPurpose;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/DatingPurpose;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/d9c;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/d9c;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->introduction:I

    .line 22
    .line 23
    iput v1, v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->introduction:I

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->information:I

    .line 26
    .line 27
    iput v1, v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->information:I

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->extension:I

    .line 30
    .line 31
    iput v1, v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->extension:I

    .line 32
    .line 33
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->personality:I

    .line 34
    .line 35
    iput v1, v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->personality:I

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->interest:I

    .line 38
    .line 39
    iput v1, v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->interest:I

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->question:I

    .line 42
    .line 43
    iput v1, v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->question:I

    .line 44
    .line 45
    iget p0, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->myrecent:I

    .line 46
    .line 47
    iput p0, v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->myrecent:I

    .line 48
    .line 49
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/DatingPurpose;->clone()Lcom/p1/mobile/putong/core/data/DatingPurpose;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->introduction:I

    .line 24
    .line 25
    iget v3, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->introduction:I

    .line 26
    .line 27
    if-ne v1, v3, :cond_2

    .line 28
    .line 29
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->information:I

    .line 30
    .line 31
    iget v3, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->information:I

    .line 32
    .line 33
    if-ne v1, v3, :cond_2

    .line 34
    .line 35
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->extension:I

    .line 36
    .line 37
    iget v3, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->extension:I

    .line 38
    .line 39
    if-ne v1, v3, :cond_2

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->personality:I

    .line 42
    .line 43
    iget v3, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->personality:I

    .line 44
    .line 45
    if-ne v1, v3, :cond_2

    .line 46
    .line 47
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->interest:I

    .line 48
    .line 49
    iget v3, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->interest:I

    .line 50
    .line 51
    if-ne v1, v3, :cond_2

    .line 52
    .line 53
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->question:I

    .line 54
    .line 55
    iget v3, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->question:I

    .line 56
    .line 57
    if-ne v1, v3, :cond_2

    .line 58
    .line 59
    iget p0, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->myrecent:I

    .line 60
    .line 61
    iget p1, p1, Lcom/p1/mobile/putong/core/data/DatingPurpose;->myrecent:I

    .line 62
    .line 63
    if-ne p0, p1, :cond_2

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
    const-string p0, "datingpurpose"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->introduction:I

    .line 21
    .line 22
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->information:I

    .line 26
    .line 27
    add-int/2addr v0, v1

    .line 28
    mul-int/lit8 v0, v0, 0x29

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->extension:I

    .line 31
    .line 32
    add-int/2addr v0, v1

    .line 33
    mul-int/lit8 v0, v0, 0x29

    .line 34
    .line 35
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->personality:I

    .line 36
    .line 37
    add-int/2addr v0, v1

    .line 38
    mul-int/lit8 v0, v0, 0x29

    .line 39
    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->interest:I

    .line 41
    .line 42
    add-int/2addr v0, v1

    .line 43
    mul-int/lit8 v0, v0, 0x29

    .line 44
    .line 45
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->question:I

    .line 46
    .line 47
    add-int/2addr v0, v1

    .line 48
    mul-int/lit8 v0, v0, 0x29

    .line 49
    .line 50
    iget v1, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->myrecent:I

    .line 51
    .line 52
    add-int/2addr v0, v1

    .line 53
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 54
    .line 55
    :cond_1
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->picture:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/DatingPurpose;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
