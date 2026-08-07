.class Lcom/bef/effectsdk/view/BEFView$6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/view/BEFView;->onPause()V
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
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$6;->this$0:Lcom/bef/effectsdk/view/BEFView;

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
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$6;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/bef/effectsdk/view/BEFView;->access$1200(Lcom/bef/effectsdk/view/BEFView;)Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$600(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;->GAME:Lcom/bef/effectsdk/view/BEFView$BEFViewSceneKey;

    .line 12
    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$6;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/bef/effectsdk/view/BEFView;->access$1200(Lcom/bef/effectsdk/view/BEFView;)Lcom/bef/effectsdk/view/BEFView$Builder$Params;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/bef/effectsdk/view/BEFView$Builder$Params;->access$800(Lcom/bef/effectsdk/view/BEFView$Builder$Params;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-ne v0, v1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$6;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 30
    .line 31
    invoke-static {p0}, Lcom/bef/effectsdk/view/BEFView;->access$1300(Lcom/bef/effectsdk/view/BEFView;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$6;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 36
    .line 37
    iget-wide v0, p0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/bef/effectsdk/view/ViewControllerInterface;->onPause(J)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
