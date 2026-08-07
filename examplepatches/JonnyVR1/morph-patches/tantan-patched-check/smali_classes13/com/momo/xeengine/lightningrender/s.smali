.class public final synthetic Lcom/momo/xeengine/lightningrender/s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;Ljava/lang/String;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/s;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

    iput-object p2, p0, Lcom/momo/xeengine/lightningrender/s;->b:Ljava/lang/String;

    iput p3, p0, Lcom/momo/xeengine/lightningrender/s;->c:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/s;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;

    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/s;->b:Ljava/lang/String;

    iget p0, p0, Lcom/momo/xeengine/lightningrender/s;->c:F

    invoke-static {v0, v1, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;->f(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$2;Ljava/lang/String;F)V

    return-void
.end method
