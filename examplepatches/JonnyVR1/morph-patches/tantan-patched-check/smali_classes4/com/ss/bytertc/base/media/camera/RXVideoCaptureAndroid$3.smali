.class Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$3;
.super Landroid/media/projection/MediaProjection$Callback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;->createVideoCapturer(ZLandroid/content/Intent;I)Lcom/ss/bytertc/base/media/VideoCapturer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid$3;->this$0:Lcom/ss/bytertc/base/media/camera/RXVideoCaptureAndroid;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/media/projection/MediaProjection$Callback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onStop()V
    .locals 1

    .line 1
    const-string p0, "RXVideoCaptureAndroid"

    .line 2
    .line 3
    const-string v0, "User revoked permission to capture the screen."

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
