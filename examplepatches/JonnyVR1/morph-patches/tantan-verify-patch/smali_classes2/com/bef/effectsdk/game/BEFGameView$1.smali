.class Lcom/bef/effectsdk/game/BEFGameView$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/game/BEFGameView;->setGameBundlePath(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/game/BEFGameView;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/game/BEFGameView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/game/BEFGameView$1;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/bef/effectsdk/game/BEFGameView$1;->val$path:Ljava/lang/String;

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/bef/effectsdk/game/BEFGameView$1;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/bef/effectsdk/game/BEFGameView;->mGameBundlePath:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/bef/effectsdk/game/BEFGameView$1;->val$path:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/bef/effectsdk/game/BEFGameView$1;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/bef/effectsdk/game/BEFGameView$1;->val$path:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/bef/effectsdk/game/BEFGameView;->mGameBundlePath:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/bef/effectsdk/game/BEFGameView;->getNativeInited()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/bef/effectsdk/game/BEFGameView$1;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 27
    .line 28
    iget-wide v0, v0, Lcom/bef/effectsdk/game/BEFGameView;->mHandle:J

    .line 29
    .line 30
    iget-object v2, p0, Lcom/bef/effectsdk/game/BEFGameView$1;->val$path:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0, v1, v2}, Lcom/bef/effectsdk/game/NativeInterface;->setGameBundlePath(JLjava/lang/String;)I

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lcom/bef/effectsdk/game/BEFGameView$1;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    invoke-static {p0, v0}, Lcom/bef/effectsdk/game/BEFGameView;->access$102(Lcom/bef/effectsdk/game/BEFGameView;Z)Z

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return-void
.end method
