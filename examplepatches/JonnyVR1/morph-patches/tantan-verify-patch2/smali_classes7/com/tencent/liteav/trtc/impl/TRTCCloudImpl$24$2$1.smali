.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2;->onTakePhotoComplete(Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2;

.field final synthetic val$bitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2$1;->this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2$1;->val$bitmap:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2$1;->this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24;->val$listener:Lcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$24$2$1;->val$bitmap:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Lcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;->onSnapshotComplete(Landroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
