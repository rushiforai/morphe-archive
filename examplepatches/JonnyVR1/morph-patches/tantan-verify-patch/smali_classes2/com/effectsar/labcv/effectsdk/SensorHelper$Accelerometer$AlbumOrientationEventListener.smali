.class Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;
.super Landroid/view/OrientationEventListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AlbumOrientationEventListener"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;


# direct methods
.method public constructor <init>(Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;->this$1:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;Landroid/content/Context;I)V
    .locals 0

    .line 7
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;->this$1:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;

    .line 8
    invoke-direct {p0, p2, p3}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-ne p1, v0, :cond_0

    .line 3
    .line 4
    goto :goto_0

    .line 5
    :cond_0
    add-int/lit8 p1, p1, 0x2d

    .line 6
    .line 7
    div-int/lit8 p1, p1, 0x5a

    .line 8
    .line 9
    mul-int/lit8 p1, p1, 0x5a

    .line 10
    .line 11
    rem-int/lit16 p1, p1, 0x168

    .line 12
    .line 13
    iget-object v0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;->this$1:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;->access$700(Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eq p1, v0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;->this$1:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;

    .line 22
    .line 23
    invoke-static {p0, p1}, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;->access$702(Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;I)I

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method
