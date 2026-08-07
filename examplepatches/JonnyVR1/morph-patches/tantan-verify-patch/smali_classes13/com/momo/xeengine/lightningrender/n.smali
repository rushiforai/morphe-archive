.class public final synthetic Lcom/momo/xeengine/lightningrender/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/n;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

    iput p2, p0, Lcom/momo/xeengine/lightningrender/n;->b:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/n;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

    iget p0, p0, Lcom/momo/xeengine/lightningrender/n;->b:I

    invoke-static {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->b(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;I)V

    return-void
.end method
