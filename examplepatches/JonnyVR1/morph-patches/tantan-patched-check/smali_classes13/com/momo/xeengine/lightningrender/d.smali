.class public final synthetic Lcom/momo/xeengine/lightningrender/d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

.field public final synthetic b:Lcom/momo/xeengine/event/DataEvent;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/event/DataEvent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/d;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    iput-object p2, p0, Lcom/momo/xeengine/lightningrender/d;->b:Lcom/momo/xeengine/event/DataEvent;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/d;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/d;->b:Lcom/momo/xeengine/event/DataEvent;

    invoke-static {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->b(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/event/DataEvent;)V

    return-void
.end method
