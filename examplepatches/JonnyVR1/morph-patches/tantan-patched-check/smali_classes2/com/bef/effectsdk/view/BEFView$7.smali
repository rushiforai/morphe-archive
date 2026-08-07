.class Lcom/bef/effectsdk/view/BEFView$7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/view/BEFView;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/view/BEFView;


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/view/BEFView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$7;->this$0:Lcom/bef/effectsdk/view/BEFView;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$7;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/bef/effectsdk/view/BEFView;->getNativeInited()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$7;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Lcom/bef/effectsdk/view/BEFView;->access$1400(Lcom/bef/effectsdk/view/BEFView;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-wide v0, p0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/bef/effectsdk/view/ViewControllerInterface;->onResume(J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
