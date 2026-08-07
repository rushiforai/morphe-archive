.class Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/effectsar/labcv/effectsdk/SensorHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Accelerometer"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Accelerometer"


# instance fields
.field private mAlbumOrientationEventListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;

.field private mOrientation:I

.field final synthetic this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;


# direct methods
.method public constructor <init>(Lcom/effectsar/labcv/effectsdk/SensorHelper;Landroid/content/Context;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;->this$0:Lcom/effectsar/labcv/effectsdk/SensorHelper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;->mOrientation:I

    .line 8
    .line 9
    new-instance p1, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;

    .line 10
    .line 11
    const/4 v0, 0x3

    .line 12
    invoke-direct {p1, p0, p2, v0}, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;-><init>(Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;Landroid/content/Context;I)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;->mAlbumOrientationEventListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/OrientationEventListener;->canDetectOrientation()Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;->mAlbumOrientationEventListener:Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer$AlbumOrientationEventListener;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/OrientationEventListener;->enable()V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic access$700(Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;->mOrientation:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic access$702(Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;I)I
    .locals 0

    .line 1
    iput p1, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;->mOrientation:I

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public getDirection()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/effectsar/labcv/effectsdk/SensorHelper$Accelerometer;->mOrientation:I

    .line 2
    .line 3
    return p0
.end method
