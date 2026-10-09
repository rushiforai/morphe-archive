.class public final Le/e/a/BikeRunModel$Hazard;
.super Ljava/lang/Object;
.source "BikeRunModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/BikeRunModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Hazard"
.end annotation


# instance fields
.field public final gap:Z

.field public final height:F

.field public final spikes:Z

.field public final width:F

.field public x:F


# direct methods
.method constructor <init>(FFFZ)V
    .registers 11
    .param p1, "x"    # F
    .param p2, "width"    # F
    .param p3, "height"    # F
    .param p4, "gap"    # Z

    .line 15
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .end local p1    # "x":F
    .end local p2    # "width":F
    .end local p3    # "height":F
    .end local p4    # "gap":Z
    .local v1, "x":F
    .local v2, "width":F
    .local v3, "height":F
    .local v4, "gap":Z
    invoke-direct/range {v0 .. v5}, Le/e/a/BikeRunModel$Hazard;-><init>(FFFZZ)V

    return-void
.end method

.method constructor <init>(FFFZZ)V
    .registers 6
    .param p1, "x"    # F
    .param p2, "width"    # F
    .param p3, "height"    # F
    .param p4, "gap"    # Z
    .param p5, "spikes"    # Z

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Le/e/a/BikeRunModel$Hazard;->x:F

    iput p2, p0, Le/e/a/BikeRunModel$Hazard;->width:F

    iput p3, p0, Le/e/a/BikeRunModel$Hazard;->height:F

    iput-boolean p4, p0, Le/e/a/BikeRunModel$Hazard;->gap:Z

    iput-boolean p5, p0, Le/e/a/BikeRunModel$Hazard;->spikes:Z

    return-void
.end method
