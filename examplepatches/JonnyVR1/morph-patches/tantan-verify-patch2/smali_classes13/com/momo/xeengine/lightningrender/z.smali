.class public final synthetic Lcom/momo/xeengine/lightningrender/z;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

.field public final synthetic b:J


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/z;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

    iput-wide p2, p0, Lcom/momo/xeengine/lightningrender/z;->b:J

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/z;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

    iget-wide v1, p0, Lcom/momo/xeengine/lightningrender/z;->b:J

    invoke-static {v0, v1, v2}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->e(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;J)V

    return-void
.end method
