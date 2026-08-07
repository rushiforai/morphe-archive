.class Lcom/momo/xengine/ar/ARCameraImpl$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/xnative/IXEngineListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xengine/ar/ARCameraImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/xengine/ar/ARCameraImpl;


# direct methods
.method public constructor <init>(Lcom/momo/xengine/ar/ARCameraImpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/ar/ARCameraImpl$1;->this$0:Lcom/momo/xengine/ar/ARCameraImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onEngineRelease()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/ar/ARCameraImpl$1;->this$0:Lcom/momo/xengine/ar/ARCameraImpl;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xengine/ar/ARCameraCache;->removeARCamera(Lcom/momo/xengine/ar/IXARCamera;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/xengine/ar/ARCameraImpl$1;->this$0:Lcom/momo/xengine/ar/ARCameraImpl;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/momo/xengine/ar/ARCameraImpl;->access$000(Lcom/momo/xengine/ar/ARCameraImpl;)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long v0, v0, v2

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/xengine/ar/ARCameraImpl$1;->this$0:Lcom/momo/xengine/ar/ARCameraImpl;

    .line 19
    .line 20
    invoke-static {v0}, Lcom/momo/xengine/ar/ARCameraImpl;->access$000(Lcom/momo/xengine/ar/ARCameraImpl;)J

    .line 21
    .line 22
    .line 23
    move-result-wide v4

    .line 24
    invoke-static {v0, v4, v5}, Lcom/momo/xengine/ar/ARCameraImpl;->access$100(Lcom/momo/xengine/ar/ARCameraImpl;J)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/momo/xengine/ar/ARCameraImpl$1;->this$0:Lcom/momo/xengine/ar/ARCameraImpl;

    .line 28
    .line 29
    invoke-static {p0, v2, v3}, Lcom/momo/xengine/ar/ARCameraImpl;->access$002(Lcom/momo/xengine/ar/ARCameraImpl;J)J

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public postRender()V
    .locals 0

    return-void
.end method

.method public preRender()V
    .locals 0

    return-void
.end method
