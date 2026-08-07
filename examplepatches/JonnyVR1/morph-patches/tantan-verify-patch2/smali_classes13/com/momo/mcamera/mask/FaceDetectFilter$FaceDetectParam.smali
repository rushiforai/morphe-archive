.class public Lcom/momo/mcamera/mask/FaceDetectFilter$FaceDetectParam;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/FaceDetectFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FaceDetectParam"
.end annotation


# instance fields
.field public angle:F

.field public cX:F

.field public cY:F

.field public centerPoint:Landroid/graphics/PointF;

.field public euler_angles:[F

.field public filterTrigerManager:Lcom/momo/mcamera/mask/FilterTriggerManager;

.field public gestureRect:Landroid/graphics/RectF;

.field public mmcvBoxes:Lcom/core/glcore/cv/MMCVBoxes;

.field public points104:[F

.field public points68:[F

.field public points8:[F

.field public points96:[F

.field public scaleH:F

.field public scaleW:F

.field public triggerType:Ljava/lang/String;

.field public warpedPoints104:[F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method
