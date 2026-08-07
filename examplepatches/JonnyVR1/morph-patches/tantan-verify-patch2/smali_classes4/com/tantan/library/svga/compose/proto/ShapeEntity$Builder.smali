.class public final Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/compose/proto/ShapeEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity;",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

.field public rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

.field public shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

.field public styles:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

.field public transform:Lcom/tantan/library/svga/compose/proto/Transform;

.field public type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;


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
.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 23
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->build()Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    move-result-object p0

    return-object p0
.end method

.method public build()Lcom/tantan/library/svga/compose/proto/ShapeEntity;
    .locals 8

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->styles:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 14
    .line 15
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 16
    .line 17
    .line 18
    move-result-object v7

    .line 19
    invoke-direct/range {v0 .. v7}, Lcom/tantan/library/svga/compose/proto/ShapeEntity;-><init>(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;Lcom/tantan/library/svga/compose/proto/Transform;Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;Lokio/ByteString;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public ellipse(Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 7
    .line 8
    return-object p0
.end method

.method public rect(Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 7
    .line 8
    return-object p0
.end method

.method public shape(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->shape:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeArgs;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->rect:Lcom/tantan/library/svga/compose/proto/ShapeEntity$RectArgs;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->ellipse:Lcom/tantan/library/svga/compose/proto/ShapeEntity$EllipseArgs;

    .line 7
    .line 8
    return-object p0
.end method

.method public styles(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->styles:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 2
    .line 3
    return-object p0
.end method

.method public transform(Lcom/tantan/library/svga/compose/proto/Transform;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->transform:Lcom/tantan/library/svga/compose/proto/Transform;

    .line 2
    .line 3
    return-object p0
.end method

.method public type(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$Builder;->type:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeType;

    .line 2
    .line 3
    return-object p0
.end method
