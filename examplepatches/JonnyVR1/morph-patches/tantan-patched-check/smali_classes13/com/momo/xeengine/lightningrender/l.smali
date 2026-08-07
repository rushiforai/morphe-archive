.class public final synthetic Lcom/momo/xeengine/lightningrender/l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/l;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

    iput-object p2, p0, Lcom/momo/xeengine/lightningrender/l;->b:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/momo/xeengine/lightningrender/l;->c:Z

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/l;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;

    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/l;->b:Ljava/lang/String;

    iget-boolean p0, p0, Lcom/momo/xeengine/lightningrender/l;->c:Z

    invoke-static {v0, v1, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;->b(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$1;Ljava/lang/String;Z)V

    return-void
.end method
