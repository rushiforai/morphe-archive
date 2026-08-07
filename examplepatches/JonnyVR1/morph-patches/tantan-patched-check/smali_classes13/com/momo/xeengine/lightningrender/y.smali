.class public final synthetic Lcom/momo/xeengine/lightningrender/y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

.field public final synthetic b:Lcom/momo/xeengine/lightningrender/StickerModel;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Lcom/momo/xeengine/lightningrender/StickerModel;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/y;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

    iput-object p2, p0, Lcom/momo/xeengine/lightningrender/y;->b:Lcom/momo/xeengine/lightningrender/StickerModel;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/y;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;

    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/y;->b:Lcom/momo/xeengine/lightningrender/StickerModel;

    invoke-static {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;->b(Lcom/momo/xeengine/lightningrender/LightningRenderImpl$4;Lcom/momo/xeengine/lightningrender/StickerModel;)V

    return-void
.end method
