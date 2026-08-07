.class public final Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/immomo/svgaplayer/SVGAVideoShapeEntity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Styles"
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u0014\n\u0002\u0008\u000e\n\u0002\u0010\u0007\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002R$\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0004@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR$\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0003\u001a\u00020\n@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000c\u0010\r\"\u0004\u0008\u000e\u0010\u000fR$\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u0003\u001a\u00020\u0010@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0012\u0010\u0013\"\u0004\u0008\u0014\u0010\u0015R$\u0010\u0016\u001a\u00020\n2\u0006\u0010\u0003\u001a\u00020\n@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0017\u0010\r\"\u0004\u0008\u0018\u0010\u000fR$\u0010\u0019\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0004@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001a\u0010\u0007\"\u0004\u0008\u001b\u0010\tR$\u0010\u001c\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0004@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001d\u0010\u0007\"\u0004\u0008\u001e\u0010\tR$\u0010 \u001a\u00020\u001f2\u0006\u0010\u0003\u001a\u00020\u001f@@X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008!\u0010\"\"\u0004\u0008#\u0010$\u00a8\u0006%"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;",
        "",
        "()V",
        "<set-?>",
        "",
        "fill",
        "getFill",
        "()I",
        "setFill$svgalibrary_release",
        "(I)V",
        "",
        "lineCap",
        "getLineCap",
        "()Ljava/lang/String;",
        "setLineCap$svgalibrary_release",
        "(Ljava/lang/String;)V",
        "",
        "lineDash",
        "getLineDash",
        "()[F",
        "setLineDash$svgalibrary_release",
        "([F)V",
        "lineJoin",
        "getLineJoin",
        "setLineJoin$svgalibrary_release",
        "miterLimit",
        "getMiterLimit",
        "setMiterLimit$svgalibrary_release",
        "stroke",
        "getStroke",
        "setStroke$svgalibrary_release",
        "",
        "strokeWidth",
        "getStrokeWidth",
        "()F",
        "setStrokeWidth$svgalibrary_release",
        "(F)V",
        "svgalibrary_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xa
    }
.end annotation


# instance fields
.field private fill:I

.field private lineCap:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private lineDash:[F
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private lineJoin:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private miterLimit:I

.field private stroke:I

.field private strokeWidth:F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "butt"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->lineCap:Ljava/lang/String;

    .line 7
    .line 8
    const-string v0, "miter"

    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->lineJoin:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    new-array v0, v0, [F

    .line 14
    .line 15
    iput-object v0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->lineDash:[F

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public final getFill()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->fill:I

    .line 2
    .line 3
    return p0
.end method

.method public final getLineCap()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->lineCap:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getLineDash()[F
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->lineDash:[F

    .line 2
    .line 3
    return-object p0
.end method

.method public final getLineJoin()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->lineJoin:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMiterLimit()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->miterLimit:I

    .line 2
    .line 3
    return p0
.end method

.method public final getStroke()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->stroke:I

    .line 2
    .line 3
    return p0
.end method

.method public final getStrokeWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->strokeWidth:F

    .line 2
    .line 3
    return p0
.end method

.method public final setFill$svgalibrary_release(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->fill:I

    .line 2
    .line 3
    return-void
.end method

.method public final setLineCap$svgalibrary_release(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->lineCap:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final setLineDash$svgalibrary_release([F)V
    .locals 0
    .param p1    # [F
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->lineDash:[F

    .line 5
    .line 6
    return-void
.end method

.method public final setLineJoin$svgalibrary_release(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->lineJoin:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final setMiterLimit$svgalibrary_release(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->miterLimit:I

    .line 2
    .line 3
    return-void
.end method

.method public final setStroke$svgalibrary_release(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->stroke:I

    .line 2
    .line 3
    return-void
.end method

.method public final setStrokeWidth$svgalibrary_release(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/svgaplayer/SVGAVideoShapeEntity$Styles;->strokeWidth:F

    .line 2
    .line 3
    return-void
.end method
