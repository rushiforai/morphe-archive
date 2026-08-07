.class Lcom/bef/effectsdk/game/BEFGameView$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/game/BEFGameView;->postMessage(JJJLjava/lang/String;)I
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/game/BEFGameView;

.field final synthetic val$arg1:J

.field final synthetic val$arg2:J

.field final synthetic val$arg3:Ljava/lang/String;

.field final synthetic val$msgId:J


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/game/BEFGameView;JJJLjava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/game/BEFGameView$2;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 2
    .line 3
    iput-wide p2, p0, Lcom/bef/effectsdk/game/BEFGameView$2;->val$msgId:J

    .line 4
    .line 5
    iput-wide p4, p0, Lcom/bef/effectsdk/game/BEFGameView$2;->val$arg1:J

    .line 6
    .line 7
    iput-wide p6, p0, Lcom/bef/effectsdk/game/BEFGameView$2;->val$arg2:J

    .line 8
    .line 9
    iput-object p8, p0, Lcom/bef/effectsdk/game/BEFGameView$2;->val$arg3:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/bef/effectsdk/game/BEFGameView$2;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/bef/effectsdk/game/BEFGameView;->mCacheMessages:Ljava/util/Queue;

    .line 4
    .line 5
    new-instance v1, Lcom/bef/effectsdk/game/BEFGameView$2$1;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Lcom/bef/effectsdk/game/BEFGameView$2$1;-><init>(Lcom/bef/effectsdk/game/BEFGameView$2;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    return-void
.end method
