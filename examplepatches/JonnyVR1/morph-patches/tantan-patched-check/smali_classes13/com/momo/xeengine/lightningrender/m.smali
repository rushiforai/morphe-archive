.class public final synthetic Lcom/momo/xeengine/lightningrender/m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/m;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/m;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

    invoke-static {p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->d(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;)V

    return-void
.end method
