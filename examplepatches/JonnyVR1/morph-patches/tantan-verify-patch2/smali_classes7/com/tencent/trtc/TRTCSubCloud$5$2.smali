.class Lcom/tencent/trtc/TRTCSubCloud$5$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


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
    iput-object p1, p0, Lcom/tencent/trtc/TRTCSubCloud$5$2;->a:Lcom/tencent/trtc/TRTCSubCloud$5;

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
    iget-object p0, p0, Lcom/tencent/trtc/TRTCSubCloud$5$2;->a:Lcom/tencent/trtc/TRTCSubCloud$5;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tencent/trtc/TRTCSubCloud$5;->c:Lcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p0, v0}, Lcom/tencent/trtc/TRTCCloudListener$TRTCSnapshotListener;->onSnapshotComplete(Landroid/graphics/Bitmap;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
