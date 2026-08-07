.class public final synthetic Lcom/momo/xeengine/lightningrender/i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/i;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

    iput p2, p0, Lcom/momo/xeengine/lightningrender/i;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/i;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

    iget p0, p0, Lcom/momo/xeengine/lightningrender/i;->b:I

    invoke-static {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->c(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;I)V

    return-void
.end method
