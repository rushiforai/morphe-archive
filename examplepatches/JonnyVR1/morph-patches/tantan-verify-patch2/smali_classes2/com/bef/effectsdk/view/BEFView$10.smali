.class Lcom/bef/effectsdk/view/BEFView$10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/view/BEFView;->setRenderCacheTexture(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/view/BEFView;

.field final synthetic val$key:Ljava/lang/String;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/view/BEFView;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$10;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/bef/effectsdk/view/BEFView$10;->val$key:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/bef/effectsdk/view/BEFView$10;->val$path:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$10;->this$0:Lcom/bef/effectsdk/view/BEFView;

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
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$10;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 10
    .line 11
    iget-wide v0, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 12
    .line 13
    iget-object v2, p0, Lcom/bef/effectsdk/view/BEFView$10;->val$key:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$10;->val$path:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, v1, v2, p0}, Lcom/bef/effectsdk/view/ViewControllerInterface;->setRenderCacheTexture(JLjava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
