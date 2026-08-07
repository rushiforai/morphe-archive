.class public Lcom/google/android/material/shape/TriangleEdgeTreatment;
.super Lcom/google/android/material/shape/EdgeTreatment;
.source "SourceFile"


# instance fields
.field private final inside:Z

.field private final size:F


# direct methods
.method public constructor <init>(FZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/google/android/material/shape/EdgeTreatment;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->inside:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getEdgePath(FFFLcom/google/android/material/shape/ShapePath;)V
    .locals 3
    .param p4    # Lcom/google/android/material/shape/ShapePath;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    .line 2
    .line 3
    mul-float/2addr v0, p3

    .line 4
    sub-float v0, p2, v0

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p4, v0, v1}, Lcom/google/android/material/shape/ShapePath;->lineTo(FF)V

    .line 8
    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->inside:Z

    .line 11
    .line 12
    iget v2, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    mul-float/2addr v2, p3

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    neg-float v0, v2

    .line 19
    mul-float v2, v0, p3

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p4, p2, v2}, Lcom/google/android/material/shape/ShapePath;->lineTo(FF)V

    .line 22
    .line 23
    .line 24
    iget p0, p0, Lcom/google/android/material/shape/TriangleEdgeTreatment;->size:F

    .line 25
    .line 26
    mul-float/2addr p0, p3

    .line 27
    add-float/2addr p2, p0

    .line 28
    invoke-virtual {p4, p2, v1}, Lcom/google/android/material/shape/ShapePath;->lineTo(FF)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p4, p1, v1}, Lcom/google/android/material/shape/ShapePath;->lineTo(FF)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
