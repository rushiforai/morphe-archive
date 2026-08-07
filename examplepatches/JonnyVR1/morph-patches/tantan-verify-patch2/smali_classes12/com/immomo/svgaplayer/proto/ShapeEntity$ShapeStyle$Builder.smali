.class public final Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;",
        "Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public fill:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

.field public lineCap:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

.field public lineDashI:Ljava/lang/Float;

.field public lineDashII:Ljava/lang/Float;

.field public lineDashIII:Ljava/lang/Float;

.field public lineJoin:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

.field public miterLimit:Ljava/lang/Float;

.field public stroke:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

.field public strokeWidth:Ljava/lang/Float;


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
.method public build()Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;
    .locals 11

    .line 1
    new-instance v0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->fill:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->stroke:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->strokeWidth:Ljava/lang/Float;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineCap:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineJoin:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->miterLimit:Ljava/lang/Float;

    .line 14
    .line 15
    iget-object v7, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashI:Ljava/lang/Float;

    .line 16
    .line 17
    iget-object v8, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashII:Ljava/lang/Float;

    .line 18
    .line 19
    iget-object v9, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashIII:Ljava/lang/Float;

    .line 20
    .line 21
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 22
    .line 23
    .line 24
    move-result-object v10

    .line 25
    invoke-direct/range {v0 .. v10}, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;-><init>(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;Ljava/lang/Float;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 29
    invoke-virtual {p0}, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->build()Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle;

    move-result-object p0

    return-object p0
.end method

.method public fill(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->fill:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineCap(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineCap:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineDashI(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashI:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineDashII(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashII:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineDashIII(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineDashIII:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineJoin(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->lineJoin:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 2
    .line 3
    return-object p0
.end method

.method public miterLimit(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->miterLimit:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public stroke(Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->stroke:Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 2
    .line 3
    return-object p0
.end method

.method public strokeWidth(Ljava/lang/Float;)Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/svgaplayer/proto/ShapeEntity$ShapeStyle$Builder;->strokeWidth:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method
