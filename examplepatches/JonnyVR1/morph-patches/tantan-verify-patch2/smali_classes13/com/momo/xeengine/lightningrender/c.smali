.class public final synthetic Lcom/momo/xeengine/lightningrender/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

.field public final synthetic b:Lcom/momo/xeengine/audio/IXAudioPlayer;


# direct methods
.method public synthetic constructor <init>(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/audio/IXAudioPlayer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/c;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    iput-object p2, p0, Lcom/momo/xeengine/lightningrender/c;->b:Lcom/momo/xeengine/audio/IXAudioPlayer;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/c;->a:Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/c;->b:Lcom/momo/xeengine/audio/IXAudioPlayer;

    invoke-static {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;->c(Lcom/momo/xeengine/lightningrender/LightningRenderImpl;Lcom/momo/xeengine/audio/IXAudioPlayer;)V

    return-void
.end method
