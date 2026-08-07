.class public final synthetic Lcom/momo/xeengine/game/e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/game/XEngineRenderThread;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/game/XEngineRenderThread;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/game/e;->a:Lcom/momo/xeengine/game/XEngineRenderThread;

    iput p2, p0, Lcom/momo/xeengine/game/e;->b:I

    iput p3, p0, Lcom/momo/xeengine/game/e;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/game/e;->a:Lcom/momo/xeengine/game/XEngineRenderThread;

    iget v1, p0, Lcom/momo/xeengine/game/e;->b:I

    iget p0, p0, Lcom/momo/xeengine/game/e;->c:I

    invoke-static {v0, v1, p0}, Lcom/momo/xeengine/game/XEngineRenderThread;->a(Lcom/momo/xeengine/game/XEngineRenderThread;II)V

    return-void
.end method
