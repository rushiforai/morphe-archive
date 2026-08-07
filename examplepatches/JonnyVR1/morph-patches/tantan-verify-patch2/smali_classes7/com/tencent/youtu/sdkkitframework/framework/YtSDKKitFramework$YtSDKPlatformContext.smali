.class public Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "YtSDKPlatformContext"
.end annotation


# instance fields
.field public baseFunctionListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTBaseFunctionListener;

.field public currentAppContext:Landroid/content/Context;

.field public currentCamera:Landroid/hardware/Camera;

.field public currentCameraId:I

.field public currentRotateState:I

.field public imageToComapreType:I

.field public imageToCompare:Landroid/graphics/Bitmap;

.field public reflectLayout:Landroid/widget/RelativeLayout;

.field public reflectListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToComapreType:I

    .line 6
    .line 7
    return-void
.end method
