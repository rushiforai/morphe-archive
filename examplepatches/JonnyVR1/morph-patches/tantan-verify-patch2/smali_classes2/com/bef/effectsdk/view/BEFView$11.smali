.class Lcom/bef/effectsdk/view/BEFView$11;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/view/BEFView;->setRenderCacheTextureWithBuffer(Ljava/lang/String;[BII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/view/BEFView;

.field final synthetic val$data:[B

.field final synthetic val$height:I

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$width:I


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/view/BEFView;Ljava/lang/String;[BII)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$11;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/bef/effectsdk/view/BEFView$11;->val$key:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/bef/effectsdk/view/BEFView$11;->val$data:[B

    .line 6
    .line 7
    iput p4, p0, Lcom/bef/effectsdk/view/BEFView$11;->val$width:I

    .line 8
    .line 9
    iput p5, p0, Lcom/bef/effectsdk/view/BEFView$11;->val$height:I

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
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$11;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bef/effectsdk/view/BEFView;->getNativeInited()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$11;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 10
    .line 11
    iget-wide v1, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 12
    .line 13
    iget-object v3, p0, Lcom/bef/effectsdk/view/BEFView$11;->val$key:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v4, p0, Lcom/bef/effectsdk/view/BEFView$11;->val$data:[B

    .line 16
    .line 17
    iget v5, p0, Lcom/bef/effectsdk/view/BEFView$11;->val$width:I

    .line 18
    .line 19
    iget v6, p0, Lcom/bef/effectsdk/view/BEFView$11;->val$height:I

    .line 20
    .line 21
    invoke-static/range {v1 .. v6}, Lcom/bef/effectsdk/view/ViewControllerInterface;->setRenderCacheTextureWithBuffer(JLjava/lang/String;[BII)I

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method
