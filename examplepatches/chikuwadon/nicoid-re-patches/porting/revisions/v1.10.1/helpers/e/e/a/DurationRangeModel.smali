.class final Le/e/a/DurationRangeModel;
.super Ljava/lang/Object;
.source "DurationRangeModel.java"


# instance fields
.field high:I

.field low:I

.field unlimited:Z


# direct methods
.method constructor <init>(IIZ)V
    .registers 4

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/DurationRangeModel;->low:I

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Le/e/a/DurationRangeModel;->high:I

    iput-boolean p3, p0, Le/e/a/DurationRangeModel;->unlimited:Z

    return-void
.end method


# virtual methods
.method dragged(II)V
    .registers 3

    .line 7
    iput p1, p0, Le/e/a/DurationRangeModel;->low:I

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Le/e/a/DurationRangeModel;->high:I

    return-void
.end method

.method maximum()I
    .registers 2

    .line 8
    iget-boolean v0, p0, Le/e/a/DurationRangeModel;->unlimited:Z

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    goto :goto_8

    :cond_6
    iget v0, p0, Le/e/a/DurationRangeModel;->high:I

    :goto_8
    return v0
.end method

.method typed(II)V
    .registers 4

    .line 6
    if-ltz p1, :cond_13

    if-ltz p2, :cond_13

    iget-boolean v0, p0, Le/e/a/DurationRangeModel;->unlimited:Z

    if-nez v0, :cond_a

    if-gt p1, p2, :cond_13

    :cond_a
    iput p1, p0, Le/e/a/DurationRangeModel;->low:I

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Le/e/a/DurationRangeModel;->high:I

    return-void

    :cond_13
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p1
.end method
