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

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 354
    invoke-direct/range {v0 .. v5}, Le/e/a/BikeRunModel$Hazard;-><init>(FFFZZ)V

    return-void
.end method

.method constructor <init>(FFFZZ)V
    .registers 6

    .line 357
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 358
    iput p1, p0, Le/e/a/BikeRunModel$Hazard;->x:F

    .line 359
    iput p2, p0, Le/e/a/BikeRunModel$Hazard;->width:F

    .line 360
    iput p3, p0, Le/e/a/BikeRunModel$Hazard;->height:F

    .line 361
    iput-boolean p4, p0, Le/e/a/BikeRunModel$Hazard;->gap:Z

    .line 362
    iput-boolean p5, p0, Le/e/a/BikeRunModel$Hazard;->spikes:Z

    return-void
.end method
