.class public final Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/proto/ShapeEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity;",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

.field public rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

.field public shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

.field public styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

.field public transform:Lcom/immomo/svgaplayer/proto/Transform;

.field public type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/squareup/wire/Message$Builder;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public build()Lcom/immomo/svgaplayer/proto/ShapeEntity;
    .locals 8

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/ShapeEntity;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 14
    .line 15
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    invoke-direct/range {v0 .. v7}, Lcom/immomo/svgaplayer/proto/ShapeEntity;-><init>(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;Lcom/immomo/svgaplayer/proto/Transform;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;Lokio/ByteString;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 23
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->build()Lcom/immomo/svgaplayer/proto/ShapeEntity;

    move-result-object p0

    return-object p0
.end method

.method public ellipse(Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;)Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 7
    .line 8
    return-object p0
.end method

.method public rect(Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;)Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 7
    .line 8
    return-object p0
.end method

.method public shape(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;)Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->shape:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeArgs;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->rect:Lcom/immomo/svgaplayer/proto/ShapeEntity$RectArgs;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->ellipse:Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 7
    .line 8
    return-object p0
.end method

.method public styles(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;)Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->styles:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 2
    .line 3
    return-object p0
.end method

.method public transform(Lcom/immomo/svgaplayer/proto/Transform;)Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->transform:Lcom/immomo/svgaplayer/proto/Transform;

    .line 2
    .line 3
    return-object p0
.end method

.method public type(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;)Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$Builder;->type:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeType;

    .line 2
    .line 3
    return-object p0
.end method
