.class public final Lcom/immomo/svgaplayer/SVGAPoint;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x2
    }
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0006R\u0011\u0010\u0005\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u0008\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/immomo/svgaplayer/SVGAPoint;",
        "",
        "x",
        "",
        "y",
        "value",
        "(FFF)V",
        "getValue",
        "()F",
        "getX",
        "getY",
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
.field private final value:F

.field private final x:F

.field private final y:F


# direct methods
.method public constructor <init>(FFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/immomo/svgaplayer/SVGAPoint;->x:F

    .line 5
    .line 6
    iput p2, p0, Lcom/immomo/svgaplayer/SVGAPoint;->y:F

    .line 7
    .line 8
    iput p3, p0, Lcom/immomo/svgaplayer/SVGAPoint;->value:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final getValue()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAPoint;->value:F

    .line 2
    .line 3
    return p0
.end method

.method public final getX()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAPoint;->x:F

    .line 2
    .line 3
    return p0
.end method

.method public final getY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/immomo/svgaplayer/SVGAPoint;->y:F

    .line 2
    .line 3
    return p0
.end method
