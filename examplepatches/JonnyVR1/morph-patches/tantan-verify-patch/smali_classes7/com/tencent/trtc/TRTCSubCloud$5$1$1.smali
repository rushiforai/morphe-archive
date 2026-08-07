.class Lcom/tencent/trtc/TRTCSubCloud$5$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/trtc/TRTCSubCloud$5$1;->onTakePhotoComplete(Landroid/graphics/Bitmap;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/graphics/Bitmap;

.field final synthetic b:Lcom/tencent/trtc/TRTCSubCloud$5$1;


# direct methods
.method public constructor <init>(Lcom/tencent/trtc/TRTCSubCloud$5$1;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud$5$1$1;->b:Lcom/tencent/trtc/TRTCSubCloud$5$1;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/trtc/TRTCSubCloud$5$1$1;->a:Landroid/graphics/Bitmap;

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
    iget-object v0, p0, Lcom/tencent/trtc/TRTCSubCloud$5$1$1;->b:Lcom/tencent/trtc/TRTCSubCloud$5$1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/trtc/TRTCSubCloud$5$1;->a:Lcom/tencent/trtc/TRTCSubCloud$5;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tencent/trtc/TRTCSubCloud$5;->c:Lcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/tencent/trtc/TRTCSubCloud$5$1$1;->a:Landroid/graphics/Bitmap;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Lcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;->onSnapshotComplete(Landroid/graphics/Bitmap;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
