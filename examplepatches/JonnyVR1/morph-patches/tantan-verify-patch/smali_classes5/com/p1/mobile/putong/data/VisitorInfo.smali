.class public Lcom/p1/mobile/putong/data/VisitorInfo;
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
            "Lcom/p1/mobile/putong/data/VisitorInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/VisitorInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "visitorinfo"


# instance fields
.field public allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public unprivilegedVisitors:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VisitorInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VisitorInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/VisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/VisitorInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VisitorInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/VisitorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;)Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;->clone()Lcom/p1/mobile/putong/data/UnPrivilegedVisitor;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/VisitorInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VisitorInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/VisitorInfo;->nullCheck()V

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

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VisitorInfo;->clone()Lcom/p1/mobile/putong/data/VisitorInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/VisitorInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VisitorInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AllVisitors;->clone()Lcom/p1/mobile/putong/data/AllVisitors;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 15
    .line 16
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NewVisitors;->clone()Lcom/p1/mobile/putong/data/NewVisitors;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RecommendVisitors;->clone()Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 37
    .line 38
    if-eqz v1, :cond_3

    .line 39
    .line 40
    new-instance v2, Ll/bfm0;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/bfm0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 50
    .line 51
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 52
    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NewVisitors;->clone()Lcom/p1/mobile/putong/data/NewVisitors;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 60
    .line 61
    :cond_4
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->clone()Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 70
    .line 71
    :cond_5
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/VisitorInfo;->clone()Lcom/p1/mobile/putong/data/VisitorInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 46
    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_2

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 56
    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 66
    .line 67
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_2

    .line 72
    .line 73
    return v0

    .line 74
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "visitorinfo"

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
    if-nez v0, :cond_6

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AllVisitors;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NewVisitors;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RecommendVisitors;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 48
    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    goto :goto_3

    .line 56
    :cond_3
    move v1, v2

    .line 57
    :goto_3
    add-int/2addr v0, v1

    .line 58
    mul-int/lit8 v0, v0, 0x29

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/NewVisitors;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    goto :goto_4

    .line 69
    :cond_4
    move v1, v2

    .line 70
    :goto_4
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x29

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    :cond_5
    add-int/2addr v0, v2

    .line 82
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 83
    .line 84
    :cond_6
    return v0
.end method

.method public nullCheck()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/AllVisitors;->new_()Lcom/p1/mobile/putong/data/AllVisitors;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->allVisitors:Lcom/p1/mobile/putong/data/AllVisitors;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/data/NewVisitors;->new_()Lcom/p1/mobile/putong/data/NewVisitors;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->newVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 22
    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/RecommendVisitors;->new_()Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->recommendVisitors:Lcom/p1/mobile/putong/data/RecommendVisitors;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 32
    .line 33
    if-nez v0, :cond_3

    .line 34
    .line 35
    new-instance v0, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->unprivilegedVisitors:Ljava/util/List;

    .line 41
    .line 42
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 43
    .line 44
    if-nez v0, :cond_4

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/data/NewVisitors;->new_()Lcom/p1/mobile/putong/data/NewVisitors;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->myVisitors:Lcom/p1/mobile/putong/data/NewVisitors;

    .line 51
    .line 52
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 53
    .line 54
    if-nez v0, :cond_5

    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;->new_()Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VisitorInfo;->oDiamondVisitor:Lcom/p1/mobile/putong/data/ODiamondVisitorInfo;

    .line 61
    .line 62
    :cond_5
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/VisitorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
