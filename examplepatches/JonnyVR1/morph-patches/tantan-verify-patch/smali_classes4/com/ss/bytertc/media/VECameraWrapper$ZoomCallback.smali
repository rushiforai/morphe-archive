.class Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/android/ttvecamera/TECameraSettings$p;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/media/VECameraWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ZoomCallback"
.end annotation


# instance fields
.field public mMaxZoom:F

.field mSigFinish:Ljava/util/concurrent/CountDownLatch;

.field public mSupportZoom:Z

.field final synthetic this$0:Lcom/ss/bytertc/media/VECameraWrapper;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/media/VECameraWrapper;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;->this$0:Lcom/ss/bytertc/media/VECameraWrapper;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;->mSupportZoom:Z

    .line 8
    .line 9
    const/high16 p1, 0x3f800000    # 1.0f

    .line 10
    .line 11
    iput p1, p0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;->mMaxZoom:F

    .line 12
    .line 13
    iput-object p2, p0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;->mSigFinish:Ljava/util/concurrent/CountDownLatch;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public enableSmooth()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public onChange(IFZ)V
    .locals 0

    return-void
.end method

.method public onZoomSupport(IZZFLjava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZZF",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;->mSupportZoom:Z

    .line 2
    .line 3
    iput p4, p0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;->mMaxZoom:F

    .line 4
    .line 5
    iget-object p0, p0, Lcom/ss/bytertc/media/VECameraWrapper$ZoomCallback;->mSigFinish:Ljava/util/concurrent/CountDownLatch;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
