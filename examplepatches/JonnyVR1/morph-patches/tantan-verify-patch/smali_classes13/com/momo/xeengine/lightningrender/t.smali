.class public final synthetic Lcom/momo/xeengine/lightningrender/t;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;

.field public final synthetic b:I

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;IF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/t;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;

    iput p2, p0, Lcom/momo/xeengine/lightningrender/t;->b:I

    iput p3, p0, Lcom/momo/xeengine/lightningrender/t;->c:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/t;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;

    iget v1, p0, Lcom/momo/xeengine/lightningrender/t;->b:I

    iget p0, p0, Lcom/momo/xeengine/lightningrender/t;->c:F

    invoke-static {v0, v1, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;->a(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$3;IF)V

    return-void
.end method
