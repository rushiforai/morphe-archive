.class Lcom/bef/effectsdk/view/BEFView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/view/BEFView;->setStickerPath(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/view/BEFView;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/view/BEFView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/view/BEFView$1;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/bef/effectsdk/view/BEFView$1;->val$path:Ljava/lang/String;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$1;->this$0:Lcom/bef/effectsdk/view/BEFView;

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
    iget-object v0, p0, Lcom/bef/effectsdk/view/BEFView$1;->this$0:Lcom/bef/effectsdk/view/BEFView;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/bef/effectsdk/view/BEFView$1;->val$path:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p0, v0, Lcom/bef/effectsdk/view/BEFView;->mAdBundlePath:Ljava/lang/String;

    .line 14
    .line 15
    iget-wide v0, v0, Lcom/bef/effectsdk/view/BEFView;->mHandle:J

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Lcom/bef/effectsdk/view/ViewControllerInterface;->setStickerPath(JLjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method
