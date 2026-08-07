.class public Lcom/p1/mobile/putong/data/OmsCardSound;
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
            "Lcom/p1/mobile/putong/data/OmsCardSound;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OmsCardSound;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "omscardsound"


# instance fields
.field public button:Lcom/p1/mobile/putong/data/Action;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public color:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public description:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public icons:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public pictures:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public topLeftTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
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
    new-instance v0, Lcom/p1/mobile/putong/data/OmsCardSound$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OmsCardSound$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OmsCardSound;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/OmsCardSound$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OmsCardSound$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/OmsCardSound;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/OmsCardSound;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OmsCardSound;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OmsCardSound;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OmsCardSound;->nullCheck()V

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

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OmsCardSound;->clone()Lcom/p1/mobile/putong/data/OmsCardSound;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/OmsCardSound;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OmsCardSound;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OmsCardSound;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->pictures:Ljava/util/List;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/si50;

    .line 11
    .line 12
    invoke-direct {v2}, Ll/si50;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsCardSound;->pictures:Ljava/util/List;

    .line 20
    .line 21
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->color:Ljava/lang/String;

    .line 22
    .line 23
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsCardSound;->color:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->topLeftTags:Ljava/util/List;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    new-instance v2, Ll/ti50;

    .line 30
    .line 31
    invoke-direct {v2}, Ll/ti50;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsCardSound;->topLeftTags:Ljava/util/List;

    .line 39
    .line 40
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->icons:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    new-instance v2, Ll/ui50;

    .line 45
    .line 46
    invoke-direct {v2}, Ll/ui50;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsCardSound;->icons:Ljava/util/List;

    .line 54
    .line 55
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->title:Ljava/lang/String;

    .line 56
    .line 57
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsCardSound;->title:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->description:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OmsCardSound;->description:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->button:Lcom/p1/mobile/putong/data/Action;

    .line 64
    .line 65
    if-eqz p0, :cond_3

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Action;->clone()Lcom/p1/mobile/putong/data/Action;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    iput-object p0, v0, Lcom/p1/mobile/putong/data/OmsCardSound;->button:Lcom/p1/mobile/putong/data/Action;

    .line 72
    .line 73
    :cond_3
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OmsCardSound;->clone()Lcom/p1/mobile/putong/data/OmsCardSound;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/OmsCardSound;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OmsCardSound;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->pictures:Ljava/util/List;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OmsCardSound;->pictures:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->color:Ljava/lang/String;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OmsCardSound;->color:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->topLeftTags:Ljava/util/List;

    .line 34
    .line 35
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OmsCardSound;->topLeftTags:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->icons:Ljava/util/List;

    .line 44
    .line 45
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OmsCardSound;->icons:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->title:Ljava/lang/String;

    .line 54
    .line 55
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OmsCardSound;->title:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->description:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OmsCardSound;->description:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->button:Lcom/p1/mobile/putong/data/Action;

    .line 74
    .line 75
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsCardSound;->button:Lcom/p1/mobile/putong/data/Action;

    .line 76
    .line 77
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_2

    .line 82
    .line 83
    return v0

    .line 84
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "omscardsound"

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
    if-nez v0, :cond_7

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->pictures:Ljava/util/List;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->color:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->topLeftTags:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->icons:Ljava/util/List;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->title:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->description:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v1, :cond_5

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    goto :goto_5

    .line 82
    :cond_5
    move v1, v2

    .line 83
    :goto_5
    add-int/2addr v0, v1

    .line 84
    mul-int/lit8 v0, v0, 0x29

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->button:Lcom/p1/mobile/putong/data/Action;

    .line 87
    .line 88
    if-eqz v1, :cond_6

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Action;->hashCode()I

    .line 91
    .line 92
    .line 93
    move-result v2

    .line 94
    :cond_6
    add-int/2addr v0, v2

    .line 95
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 96
    .line 97
    :cond_7
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->pictures:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->pictures:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->color:Ljava/lang/String;

    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->color:Ljava/lang/String;

    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->topLeftTags:Ljava/util/List;

    .line 21
    .line 22
    if-nez v0, :cond_2

    .line 23
    .line 24
    new-instance v0, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->topLeftTags:Ljava/util/List;

    .line 30
    .line 31
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->icons:Ljava/util/List;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->icons:Ljava/util/List;

    .line 41
    .line 42
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->title:Ljava/lang/String;

    .line 43
    .line 44
    if-nez v0, :cond_4

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->title:Ljava/lang/String;

    .line 47
    .line 48
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->description:Ljava/lang/String;

    .line 49
    .line 50
    if-nez v0, :cond_5

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->description:Ljava/lang/String;

    .line 53
    .line 54
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->button:Lcom/p1/mobile/putong/data/Action;

    .line 55
    .line 56
    if-nez v0, :cond_6

    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/data/Action;->new_()Lcom/p1/mobile/putong/data/Action;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OmsCardSound;->button:Lcom/p1/mobile/putong/data/Action;

    .line 63
    .line 64
    :cond_6
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OmsCardSound;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
