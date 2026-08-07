.class public final Lcom/immomo/svgaplayer/proto/ShapeEntity;
.super Lcom/squareup/wire/Message;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/svgaplayer/proto/ShapeEntity$ProtoAdapter_ShapeEntity;,
        Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;,
        Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;,
        Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;,
        Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;,
        Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;,
        Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message<",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity;",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;",
        ">;"
    }
.end annotation


# static fields
.field public static final ADAPTER:Lcom/squareup/wire/ProtoAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/squareup/wire/ProtoAdapter<",
            "Lcom/immomo/svgaplayer/proto/ShapeEntity;",
            ">;"
        }
    .end annotation
.end field

.field public static final DEFAULT_TYPE:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

.field private static final serialVersionUID:J


# instance fields
.field public final ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.ShapeEntity$EllipseArgs#ADAPTER"
        tag = 0x4
    .end annotation
.end field

.field public final rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.ShapeEntity$RectArgs#ADAPTER"
        tag = 0x3
    .end annotation
.end field

.field public final shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.ShapeEntity$ShapeArgs#ADAPTER"
        tag = 0x2
    .end annotation
.end field

.field public final styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.ShapeEntity$ShapeStyle#ADAPTER"
        tag = 0xa
    .end annotation
.end field

.field public final transform:Lcom/immomo/svgaplayer/proto/Transform;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.Transform#ADAPTER"
        tag = 0xb
    .end annotation
.end field

.field public final type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;
    .annotation runtime Lcom/squareup/wire/WireField;
        adapter = "com.opensource.svgaplayer.proto.ShapeEntity$ShapeType#ADAPTER"
        tag = 0x1
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ProtoAdapter_ShapeEntity;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/svgaplayer/proto/ShapeEntity$ProtoAdapter_ShapeEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 7
    .line 8
    sget-object v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;->SHAPE:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 9
    .line 10
    sput-object v0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->DEFAULT_TYPE:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 11
    .line 12
    return-void
.end method

.method public constructor <init>(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;Lcom/immomo/svgaplayer/proto/Transform;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;)V
    .locals 8

    .line 33
    sget-object v7, Lokio/ByteString;->EMPTY:Lokio/ByteString;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/immomo/svgaplayer/proto/ShapeEntity;-><init>(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;Lcom/immomo/svgaplayer/proto/Transform;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;Lokio/ByteString;)V

    return-void
.end method

.method public constructor <init>(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;Lcom/immomo/svgaplayer/proto/Transform;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;Lokio/ByteString;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->ADAPTER:Lcom/squareup/wire/ProtoAdapter;

    .line 2
    .line 3
    invoke-direct {p0, v0, p7}, Lcom/squareup/wire/Message;-><init>(Lcom/squareup/wire/ProtoAdapter;Lokio/ByteString;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p4, p5, p6}, Lcom/squareup/wire/internal/Internal;->countNonNull(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)I

    .line 7
    .line 8
    .line 9
    move-result p7

    .line 10
    const/4 v0, 0x1

    .line 11
    if-gt p7, v0, :cond_0

    .line 12
    .line 13
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 14
    .line 15
    iput-object p2, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 16
    .line 17
    iput-object p3, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 18
    .line 19
    iput-object p4, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 20
    .line 21
    iput-object p5, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 22
    .line 23
    iput-object p6, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string p0, "at most one of shape, rect, ellipse may be non-null"

    .line 27
    .line 28
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    throw p0
.end method


# virtual methods
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
    instance-of v1, p1, Lcom/immomo/svgaplayer/proto/ShapeEntity;

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
    check-cast p1, Lcom/immomo/svgaplayer/proto/ShapeEntity;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {p1}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v1, v3}, Lokio/ByteString;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/immomo/svgaplayer/proto/ShapeEntity;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 30
    .line 31
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 38
    .line 39
    iget-object v3, p1, Lcom/immomo/svgaplayer/proto/ShapeEntity;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 40
    .line 41
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 48
    .line 49
    iget-object v3, p1, Lcom/immomo/svgaplayer/proto/ShapeEntity;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 50
    .line 51
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 58
    .line 59
    iget-object v3, p1, Lcom/immomo/svgaplayer/proto/ShapeEntity;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 60
    .line 61
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_2

    .line 66
    .line 67
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 68
    .line 69
    iget-object v3, p1, Lcom/immomo/svgaplayer/proto/ShapeEntity;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 70
    .line 71
    invoke-static {v1, v3}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    if-eqz v1, :cond_2

    .line 76
    .line 77
    iget-object p0, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 78
    .line 79
    iget-object p1, p1, Lcom/immomo/svgaplayer/proto/ShapeEntity;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 80
    .line 81
    invoke-static {p0, p1}, Lcom/squareup/wire/internal/Internal;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_2

    .line 86
    .line 87
    return v0

    .line 88
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/squareup/wire/Message;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lokio/ByteString;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    mul-int/lit8 v0, v0, 0x25

    .line 14
    .line 15
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    move v1, v2

    .line 26
    :goto_0
    add-int/2addr v0, v1

    .line 27
    mul-int/lit8 v0, v0, 0x25

    .line 28
    .line 29
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 30
    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;->hashCode()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v1, v2

    .line 39
    :goto_1
    add-int/2addr v0, v1

    .line 40
    mul-int/lit8 v0, v0, 0x25

    .line 41
    .line 42
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/proto/Transform;->hashCode()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    goto :goto_2

    .line 51
    :cond_2
    move v1, v2

    .line 52
    :goto_2
    add-int/2addr v0, v1

    .line 53
    mul-int/lit8 v0, v0, 0x25

    .line 54
    .line 55
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 56
    .line 57
    if-eqz v1, :cond_3

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;->hashCode()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    goto :goto_3

    .line 64
    :cond_3
    move v1, v2

    .line 65
    :goto_3
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x25

    .line 67
    .line 68
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 69
    .line 70
    if-eqz v1, :cond_4

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;->hashCode()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    goto :goto_4

    .line 77
    :cond_4
    move v1, v2

    .line 78
    :goto_4
    add-int/2addr v0, v1

    .line 79
    mul-int/lit8 v0, v0, 0x25

    .line 80
    .line 81
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 82
    .line 83
    if-eqz v1, :cond_5

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;->hashCode()I

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    :cond_5
    add-int/2addr v0, v2

    .line 90
    iput v0, p0, Lcom/squareup/wire/Message;->hashCode:I

    .line 91
    .line 92
    :cond_6
    return v0
.end method

.method public newBuilder()Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;
    .locals 2

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/squareup/wire/Message;->unknownFields()Lokio/ByteString;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {v0, p0}, Lcom/squareup/wire/Message$Builder;->addUnknownFields(Lokio/ByteString;)Lcom/squareup/wire/Message$Builder;

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public bridge synthetic newBuilder()Lcom/squareup/wire/Message$Builder;
    .locals 0

    .line 38
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/proto/ShapeEntity;->newBuilder()Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    const-string v1, ", type="

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 21
    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    const-string v1, ", styles="

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    const-string v1, ", transform="

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    const-string v1, ", shape="

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    :cond_3
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 63
    .line 64
    if-eqz v1, :cond_4

    .line 65
    .line 66
    const-string v1, ", rect="

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    :cond_4
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    const-string v1, ", ellipse="

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 86
    .line 87
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    :cond_5
    const/4 p0, 0x2

    .line 91
    const-string v1, "ShapeEntity{"

    .line 92
    .line 93
    const/4 v2, 0x0

    .line 94
    invoke-virtual {v0, v2, p0, v1}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    const/16 v0, 0x7d

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    return-object p0
.end method
