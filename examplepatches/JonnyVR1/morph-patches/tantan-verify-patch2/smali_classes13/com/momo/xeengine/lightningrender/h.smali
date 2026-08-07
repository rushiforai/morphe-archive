.class public final synthetic Lcom/momo/xeengine/lightningrender/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/h;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

    iput-boolean p2, p0, Lcom/momo/xeengine/lightningrender/h;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/h;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

    iget-boolean p0, p0, Lcom/momo/xeengine/lightningrender/h;->b:Z

    invoke-static {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->g(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Z)V

    return-void
.end method
