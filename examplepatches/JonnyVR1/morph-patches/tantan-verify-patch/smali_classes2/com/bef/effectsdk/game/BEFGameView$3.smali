.class Lcom/bef/effectsdk/game/BEFGameView$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bef/effectsdk/game/BEFGameView;->pauseGame()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bef/effectsdk/game/BEFGameView;


# direct methods
.method public constructor <init>(Lcom/bef/effectsdk/game/BEFGameView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bef/effectsdk/game/BEFGameView$3;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

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
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/bef/effectsdk/game/BEFGameView$3;->this$0:Lcom/bef/effectsdk/game/BEFGameView;

    .line 2
    .line 3
    iget-wide v0, p0, Lcom/bef/effectsdk/game/BEFGameView;->mHandle:J

    .line 4
    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bef/effectsdk/game/NativeInterface;->pause(J)I

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
