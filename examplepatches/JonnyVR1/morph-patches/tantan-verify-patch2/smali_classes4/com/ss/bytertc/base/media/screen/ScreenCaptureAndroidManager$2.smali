.class Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->changeCaptureFormat(III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$2;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$2;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->access$702(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;)Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$DeviceOrientation;

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager$2;->this$0:Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;->access$800(Lcom/ss/bytertc/base/media/screen/ScreenCaptureAndroidManager;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
