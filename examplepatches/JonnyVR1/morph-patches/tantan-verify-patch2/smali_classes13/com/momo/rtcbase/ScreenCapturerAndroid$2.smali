.class Lcom/momo/rtcbase/ScreenCapturerAndroid$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/ScreenCapturerAndroid;->changeCaptureFormat(III)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/ScreenCapturerAndroid;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/ScreenCapturerAndroid;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid$2;->this$0:Lcom/momo/rtcbase/ScreenCapturerAndroid;

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
    iget-object v0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid$2;->this$0:Lcom/momo/rtcbase/ScreenCapturerAndroid;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/rtcbase/ScreenCapturerAndroid;->access$200(Lcom/momo/rtcbase/ScreenCapturerAndroid;)Landroid/hardware/display/VirtualDisplay;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/hardware/display/VirtualDisplay;->release()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/momo/rtcbase/ScreenCapturerAndroid$2;->this$0:Lcom/momo/rtcbase/ScreenCapturerAndroid;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/momo/rtcbase/ScreenCapturerAndroid;->access$500(Lcom/momo/rtcbase/ScreenCapturerAndroid;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
