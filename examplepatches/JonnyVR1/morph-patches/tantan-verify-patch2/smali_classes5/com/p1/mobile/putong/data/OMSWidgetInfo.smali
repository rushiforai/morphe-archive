.class public Lcom/p1/mobile/putong/data/OMSWidgetInfo;
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
            "Lcom/p1/mobile/putong/data/OMSWidgetInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/OMSWidgetInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "omswidgetinfo"


# instance fields
.field public animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public contents:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OMSResourceContent;",
            ">;"
        }
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public mercuries:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/OmsMerCuryData;",
            ">;"
        }
    .end annotation
.end field

.field public picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public type:Lcom/p1/mobile/putong/data/OMSWidgeType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public version:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSWidgetInfo$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSWidgetInfo$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public static synthetic a(Lcom/p1/mobile/putong/data/OMSResourceContent;)Lcom/p1/mobile/putong/data/OMSResourceContent;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSResourceContent;->clone()Lcom/p1/mobile/putong/data/OMSResourceContent;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/OmsMerCuryData;)Lcom/p1/mobile/putong/data/OmsMerCuryData;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OmsMerCuryData;->clone()Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/OMSWidgetInfo;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSWidgetInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->nullCheck()V

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

    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->clone()Lcom/p1/mobile/putong/data/OMSWidgetInfo;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/OMSWidgetInfo;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/OMSWidgetInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 13
    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->version:I

    .line 15
    .line 16
    iput v1, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->version:I

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->clone()Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 31
    .line 32
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 33
    .line 34
    if-eqz v1, :cond_1

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;->clone()Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 41
    .line 42
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSBubbleStyle;->clone()Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 51
    .line 52
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    new-instance v2, Ll/f850;

    .line 57
    .line 58
    invoke-direct {v2}, Ll/f850;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 66
    .line 67
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 68
    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 72
    .line 73
    if-eqz p0, :cond_4

    .line 74
    .line 75
    new-instance v1, Ll/g850;

    .line 76
    .line 77
    invoke-direct {v1}, Ll/g850;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {p0, v1}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    iput-object p0, v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 85
    .line 86
    :cond_4
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->clone()Lcom/p1/mobile/putong/data/OMSWidgetInfo;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;

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
    check-cast p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 24
    .line 25
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

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
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->version:I

    .line 34
    .line 35
    iget v3, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->version:I

    .line 36
    .line 37
    if-ne v1, v3, :cond_2

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 40
    .line 41
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 52
    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 60
    .line 61
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 62
    .line 63
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 70
    .line 71
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 72
    .line 73
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eqz v1, :cond_2

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 80
    .line 81
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 82
    .line 83
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 100
    .line 101
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 102
    .line 103
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_2

    .line 108
    .line 109
    return v0

    .line 110
    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "omswidgetinfo"

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
    if-nez v0, :cond_9

    .line 4
    .line 5
    mul-int/lit8 v0, v0, 0x29

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

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
    iget v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->version:I

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    mul-int/lit8 v0, v0, 0x29

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    goto :goto_2

    .line 48
    :cond_2
    move v1, v2

    .line 49
    :goto_2
    add-int/2addr v0, v1

    .line 50
    mul-int/lit8 v0, v0, 0x29

    .line 51
    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->hashCode()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v1, v2

    .line 62
    :goto_3
    add-int/2addr v0, v1

    .line 63
    mul-int/lit8 v0, v0, 0x29

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 66
    .line 67
    if-eqz v1, :cond_4

    .line 68
    .line 69
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;->hashCode()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    goto :goto_4

    .line 74
    :cond_4
    move v1, v2

    .line 75
    :goto_4
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x29

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 79
    .line 80
    if-eqz v1, :cond_5

    .line 81
    .line 82
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/OMSBubbleStyle;->hashCode()I

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    goto :goto_5

    .line 87
    :cond_5
    move v1, v2

    .line 88
    :goto_5
    add-int/2addr v0, v1

    .line 89
    mul-int/lit8 v0, v0, 0x29

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 92
    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    goto :goto_6

    .line 100
    :cond_6
    move v1, v2

    .line 101
    :goto_6
    add-int/2addr v0, v1

    .line 102
    mul-int/lit8 v0, v0, 0x29

    .line 103
    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v1, :cond_7

    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    goto :goto_7

    .line 113
    :cond_7
    move v1, v2

    .line 114
    :goto_7
    add-int/2addr v0, v1

    .line 115
    mul-int/lit8 v0, v0, 0x29

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 118
    .line 119
    if-eqz v1, :cond_8

    .line 120
    .line 121
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    :cond_8
    add-int/2addr v0, v2

    .line 126
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 127
    .line 128
    :cond_9
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWidgeArea;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->identifier:Lcom/p1/mobile/putong/data/OMSWidgeArea;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWidgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->type:Lcom/p1/mobile/putong/data/OMSWidgeType;

    .line 36
    .line 37
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 38
    .line 39
    if-nez v0, :cond_3

    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;->new_()Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->animation:Lcom/p1/mobile/putong/data/OMSWidgeAnimationInfo;

    .line 46
    .line 47
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 48
    .line 49
    if-nez v0, :cond_4

    .line 50
    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;->new_()Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->picture:Lcom/p1/mobile/putong/data/OMSWidgeIconInfo;

    .line 56
    .line 57
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 58
    .line 59
    if-nez v0, :cond_5

    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/data/OMSBubbleStyle;->new_()Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->style:Lcom/p1/mobile/putong/data/OMSBubbleStyle;

    .line 66
    .line 67
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 68
    .line 69
    if-nez v0, :cond_6

    .line 70
    .line 71
    new-instance v0, Ljava/util/ArrayList;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->contents:Ljava/util/List;

    .line 77
    .line 78
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 79
    .line 80
    if-nez v0, :cond_7

    .line 81
    .line 82
    iput-object v1, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->url:Ljava/lang/String;

    .line 83
    .line 84
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 85
    .line 86
    if-nez v0, :cond_8

    .line 87
    .line 88
    new-instance v0, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->mercuries:Ljava/util/List;

    .line 94
    .line 95
    :cond_8
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/OMSWidgetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
