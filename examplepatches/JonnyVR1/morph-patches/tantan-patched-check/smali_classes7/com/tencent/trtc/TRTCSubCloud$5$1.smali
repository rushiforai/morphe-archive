.class Lcom/tencent/trtc/TRTCSubCloud$5$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/c/o;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/trtc/TRTCSubCloud$5;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/tencent/trtc/TRTCSubCloud$5;


# direct methods
.method public constructor <init>(Lcom/tencent/trtc/TRTCSubCloud$5;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud$5$1;->a:Lcom/tencent/trtc/TRTCSubCloud$5;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTakePhotoComplete(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$5$1;->a:Lcom/tencent/trtc/TRTCSubCloud$5;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/trtc/TRTCSubCloud$5;->d:Lcom/tencent/trtc/TRTCSubCloud;

    .line 4
    .line 5
    new-instance v1, Lcom/tencent/trtc/TRTCSubCloud$5$1$1;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Lcom/tencent/trtc/TRTCSubCloud$5$1$1;-><init>(Lcom/tencent/trtc/TRTCSubCloud$5$1;Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/tencent/trtc/TRTCSubCloud;->access$5600(Lcom/tencent/trtc/TRTCSubCloud;Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
