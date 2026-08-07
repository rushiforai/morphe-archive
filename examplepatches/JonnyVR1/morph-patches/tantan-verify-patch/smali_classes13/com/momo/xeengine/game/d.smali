.class public final synthetic Lcom/momo/xeengine/game/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/game/XEngineRenderThread;

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/game/XEngineRenderThread;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/game/d;->a:Lcom/momo/xeengine/game/XEngineRenderThread;

    iput-object p2, p0, Lcom/momo/xeengine/game/d;->b:Ljava/lang/Object;

    iput-object p3, p0, Lcom/momo/xeengine/game/d;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/d;->a:Lcom/momo/xeengine/game/XEngineRenderThread;

    iget-object v1, p0, Lcom/momo/xeengine/game/d;->b:Ljava/lang/Object;

    iget-object p0, p0, Lcom/momo/xeengine/game/d;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {v0, v1, p0}, Lcom/momo/xeengine/game/XEngineRenderThread;->b(Lcom/momo/xeengine/game/XEngineRenderThread;Ljava/lang/Object;Ljava/util/concurrent/atomic/AtomicBoolean;)V

    return-void
.end method
