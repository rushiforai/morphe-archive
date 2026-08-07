.class public Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public interP1:I

.field public interP2:I

.field public interRatioX:F

.field public interRatioY:F

.field public transformPoint:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interP1:I

    .line 6
    .line 7
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interP2:I

    .line 8
    .line 9
    const/high16 v0, 0x3f800000    # 1.0f

    .line 10
    .line 11
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interRatioX:F

    .line 12
    .line 13
    iput v0, p0, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interRatioY:F

    .line 14
    .line 15
    iput p1, p0, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->transformPoint:I

    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public interp(II)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interP1:I

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interP2:I

    .line 4
    .line 5
    return-object p0
.end method

.method public ratio(FF)Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;
    .locals 0

    .line 1
    iput p1, p0, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interRatioX:F

    .line 2
    .line 3
    iput p2, p0, Lcom/immomo/momomediaext/filter/beauty/TransformPointConfig;->interRatioY:F

    .line 4
    .line 5
    return-object p0
.end method
