.class public final Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
.super Lcom/squareup/wire/Message$Builder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/squareup/wire/Message$Builder<",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;",
        "Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;",
        ">;"
    }
.end annotation


# instance fields
.field public fill:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

.field public lineCap:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineCap;

.field public lineDashI:Ljava/lang/Float;

.field public lineDashII:Ljava/lang/Float;

.field public lineDashIII:Ljava/lang/Float;

.field public lineJoin:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineJoin;

.field public miterLimit:Ljava/lang/Float;

.field public stroke:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

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
.method public bridge synthetic build()Lcom/squareup/wire/Message;
    .locals 0

    .line 29
    invoke-virtual {p0}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->build()Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    move-result-object p0

    return-object p0
.end method

.method public build()Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;
    .locals 11

    .line 1
    new-instance v0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->fill:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->stroke:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->strokeWidth:Ljava/lang/Float;

    .line 8
    .line 9
    iget-object v4, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineCap:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 10
    .line 11
    iget-object v5, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineJoin:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 12
    .line 13
    iget-object v6, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->miterLimit:Ljava/lang/Float;

    .line 14
    .line 15
    iget-object v7, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineDashI:Ljava/lang/Float;

    .line 16
    .line 17
    iget-object v8, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineDashII:Ljava/lang/Float;

    .line 18
    .line 19
    iget-object v9, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineDashIII:Ljava/lang/Float;

    .line 20
    .line 21
    invoke-super {p0}, Lcom/squareup/wire/Message$Builder;->buildUnknownFields()Lokio/ByteString;

    .line 22
    .line 23
    .line 24
    move-result-object v10

    .line 25
    invoke-direct/range {v0 .. v10}, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle;-><init>(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;Ljava/lang/Float;Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineCap;Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineJoin;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Ljava/lang/Float;Lokio/ByteString;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method public fill(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->fill:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineCap(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineCap;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineCap:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineCap;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineDashI(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineDashI:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineDashII(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineDashII:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineDashIII(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineDashIII:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public lineJoin(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineJoin;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->lineJoin:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$LineJoin;

    .line 2
    .line 3
    return-object p0
.end method

.method public miterLimit(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->miterLimit:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method

.method public stroke(Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->stroke:Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$RGBAColor;

    .line 2
    .line 3
    return-object p0
.end method

.method public strokeWidth(Ljava/lang/Float;)Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/compose/proto/ShapeEntity$ShapeStyle$Builder;->strokeWidth:Ljava/lang/Float;

    .line 2
    .line 3
    return-object p0
.end method
