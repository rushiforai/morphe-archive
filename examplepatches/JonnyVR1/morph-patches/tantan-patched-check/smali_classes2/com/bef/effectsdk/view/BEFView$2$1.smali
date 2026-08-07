.class Lcom/bef/effectsdk/view/BEFView$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/view/BEFView$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/bef/effectsdk/view/BEFView$2;


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/view/BEFView$2;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$2$1;->this$1:Lcom/bef/effectsdk/view/BEFView$2;

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
    .locals 10

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$2$1;->this$1:Lcom/bef/effectsdk/view/BEFView$2;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$2;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 4
    .line 5
    iget-wide v1, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 6
    .line 7
    iget-wide v3, p0, Lcom/bef/effectsdk/view/BEFView$2;->val$msgId:J

    .line 8
    .line 9
    iget-wide v5, p0, Lcom/bef/effectsdk/view/BEFView$2;->val$arg1:J

    .line 10
    .line 11
    iget-wide v7, p0, Lcom/bef/effectsdk/view/BEFView$2;->val$arg2:J

    .line 12
    .line 13
    iget-object v9, p0, Lcom/bef/effectsdk/view/BEFView$2;->val$arg3:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static/range {v1 .. v9}, Lcom/bef/effectsdk/view/ViewControllerInterface;->postMessage(JJJJLjava/lang/String;)I

    .line 16
    .line 17
    .line 18
    return-void
.end method
