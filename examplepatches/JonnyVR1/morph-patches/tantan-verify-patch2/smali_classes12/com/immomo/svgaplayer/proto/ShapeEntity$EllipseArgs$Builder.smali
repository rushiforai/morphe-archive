.class public final Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public radiusX:Ljava/lang/Float;

.field public radiusY:Ljava/lang/Float;

.field public x:Ljava/lang/Float;

.field public y:Ljava/lang/Float;


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
.method public build()Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;
    .locals 6

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;->x:Ljava/lang/Float;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;->y:Ljava/lang/Float;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;->radiusX:Ljava/lang/Float;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;->radiusY:Ljava/lang/Float;

    .line 10
    .line 11
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-direct/range {v0 .. v5}, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;-><init>(Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 19
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;->build()Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs;

    move-result-object p0

    return-object p0
.end method

.method public radiusX(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;->radiusX:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public radiusY(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;->radiusY:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public x(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;->x:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$EllipseArgs$Builder;->y:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method
