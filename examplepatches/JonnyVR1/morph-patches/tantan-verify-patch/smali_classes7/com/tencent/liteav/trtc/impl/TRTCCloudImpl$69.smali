.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setBeautyStyle(IIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$beauty:I

.field final synthetic val$ruddiness:I

.field final synthetic val$style:I

.field final synthetic val$white:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IIII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->val$style:I

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->val$beauty:I

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->val$white:I

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->val$ruddiness:I

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getBeautyManager()Lcom/tencent/liteav/beauty/TXBeautyManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->val$style:I

    .line 8
    .line 9
    invoke-interface {v0, v1}, Lcom/tencent/liteav/beauty/TXBeautyManager;->setBeautyStyle(I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getBeautyManager()Lcom/tencent/liteav/beauty/TXBeautyManager;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->val$beauty:I

    .line 19
    .line 20
    invoke-interface {v0, v1}, Lcom/tencent/liteav/beauty/TXBeautyManager;->setBeautyLevel(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getBeautyManager()Lcom/tencent/liteav/beauty/TXBeautyManager;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->val$white:I

    .line 30
    .line 31
    invoke-interface {v0, v1}, Lcom/tencent/liteav/beauty/TXBeautyManager;->setWhitenessLevel(I)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->getBeautyManager()Lcom/tencent/liteav/beauty/TXBeautyManager;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$69;->val$ruddiness:I

    .line 41
    .line 42
    invoke-interface {v0, p0}, Lcom/tencent/liteav/beauty/TXBeautyManager;->setRuddyLevel(I)V

    .line 43
    .line 44
    .line 45
    return-void
.end method
