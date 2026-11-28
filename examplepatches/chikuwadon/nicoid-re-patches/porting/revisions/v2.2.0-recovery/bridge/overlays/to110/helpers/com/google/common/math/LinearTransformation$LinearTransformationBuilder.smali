.class public final Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;
.super Ljava/lang/Object;
.source "LinearTransformation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/math/LinearTransformation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LinearTransformationBuilder"
.end annotation


# instance fields
.field private final x1:D

.field private final y1:D


# direct methods
.method private constructor <init>(DD)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "x1",
            "y1"
        }
    .end annotation

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    iput-wide p1, p0, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;->x1:D

    .line 73
    iput-wide p3, p0, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;->y1:D

    return-void
.end method

.method synthetic constructor <init>(DDLcom/google/common/math/LinearTransformation$1;)V
    .registers 6

    .line 66
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;-><init>(DD)V

    return-void
.end method


# virtual methods
.method public and(DD)Lcom/google/common/math/LinearTransformation;
    .registers 12
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "x2",
            "y2"
        }
    .end annotation

    .line 83
    invoke-static {p1, p2}, Lcom/google/common/math/DoubleUtils;->isFinite(D)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-static {p3, p4}, Lcom/google/common/math/DoubleUtils;->isFinite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 84
    iget-wide v3, p0, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;->x1:D

    cmpl-double v0, p1, v3

    .line 88
    iget-wide v5, p0, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;->y1:D

    if-nez v0, :cond_2

    cmpl-double p1, p3, v5

    if-nez p1, :cond_1

    move v1, v2

    .line 85
    :cond_1
    invoke-static {v1}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 86
    new-instance p1, Lcom/google/common/math/LinearTransformation$VerticalLinearTransformation;

    iget-wide p2, p0, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;->x1:D

    invoke-direct {p1, p2, p3}, Lcom/google/common/math/LinearTransformation$VerticalLinearTransformation;-><init>(D)V

    return-object p1

    :cond_2
    sub-double/2addr p3, v5

    sub-double/2addr p1, v3

    div-double/2addr p3, p1

    .line 88
    invoke-virtual {p0, p3, p4}, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;->withSlope(D)Lcom/google/common/math/LinearTransformation;

    move-result-object p0

    return-object p0
.end method

.method public withSlope(D)Lcom/google/common/math/LinearTransformation;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "slope"
        }
    .end annotation

    .line 98
    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 99
    invoke-static {p1, p2}, Lcom/google/common/math/DoubleUtils;->isFinite(D)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    iget-wide v0, p0, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;->y1:D

    iget-wide v2, p0, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;->x1:D

    mul-double/2addr v2, p1

    sub-double/2addr v0, v2

    .line 101
    new-instance p0, Lcom/google/common/math/LinearTransformation$RegularLinearTransformation;

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/google/common/math/LinearTransformation$RegularLinearTransformation;-><init>(DD)V

    return-object p0

    .line 103
    :cond_0
    new-instance p1, Lcom/google/common/math/LinearTransformation$VerticalLinearTransformation;

    iget-wide v0, p0, Lcom/google/common/math/LinearTransformation$LinearTransformationBuilder;->x1:D

    invoke-direct {p1, v0, v1}, Lcom/google/common/math/LinearTransformation$VerticalLinearTransformation;-><init>(D)V

    return-object p1
.end method
