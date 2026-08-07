.class Lcom/momo/mcamera/mask/handdetect/PickNoseDetector$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->loadModel(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;


# direct methods
.method public constructor <init>(Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector$1;->this$0:Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector$1;->this$0:Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->handDetectLandmark:Lcom/momocv/handdetectlandmark/HandDetectLandmark;

    .line 4
    .line 5
    sget-object v0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->path:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/momocv/handdetectlandmark/HandDetectLandmark;->LoadModel(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->access$002(Z)Z

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->access$000()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_0

    .line 19
    .line 20
    sget-object p0, Lcom/momo/mcamera/mask/handdetect/PickNoseDetector;->path:Ljava/lang/String;

    .line 21
    .line 22
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v0, "pick noise model is invalid:%s"

    .line 27
    .line 28
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void
.end method
