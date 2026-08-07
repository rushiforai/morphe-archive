.class public final synthetic Lcom/momo/xeengine/lightningrender/q;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/q;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

    iput-boolean p2, p0, Lcom/momo/xeengine/lightningrender/q;->b:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/q;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

    iget-boolean p0, p0, Lcom/momo/xeengine/lightningrender/q;->b:Z

    invoke-static {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->d(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;Z)V

    return-void
.end method
