.class public Lcom/ss/android/ttvecamera/TECameraFrame$d;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/android/ttvecamera/TECameraFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:J

.field public d:Landroid/hardware/camera2/TotalCaptureResult;

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$d;->a:I

    .line 6
    .line 7
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$d;->b:I

    .line 8
    .line 9
    const-wide/16 v0, -0x1

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$d;->c:J

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$d;->d:Landroid/hardware/camera2/TotalCaptureResult;

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$d;->e:I

    .line 18
    .line 19
    iput v0, p0, Lcom/ss/android/ttvecamera/TECameraFrame$d;->f:I

    .line 20
    .line 21
    return-void
.end method
