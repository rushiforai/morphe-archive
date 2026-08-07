.class public Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private innerProcessorName:Ljava/lang/String;

.field private final mSOLoadCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

.field private tag:Ljava/lang/String;

.field private useInnerProcessor:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->useInnerProcessor:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->innerProcessorName:Ljava/lang/String;

    .line 9
    .line 10
    const-string v0, "LightningRender"

    .line 11
    .line 12
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->tag:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder$1;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder$1;-><init>(Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->mSOLoadCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 20
    .line 21
    return-void
.end method


# virtual methods
.method public build()Lcom/momo/xeengine/lightningrender/ILightningRender;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/momo/xeengine/XEngineException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->mSOLoadCallback:Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/momo/xeengine/somanager/XEngineSOManager;->check(Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;)Z

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/momo/xeengine/XEnginePreferences;->checkEngineEnv()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->tag:Ljava/lang/String;

    .line 12
    .line 13
    iget-boolean v2, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->useInnerProcessor:Z

    .line 14
    .line 15
    iget-object p0, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->innerProcessorName:Ljava/lang/String;

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, p0}, Lcom/momo/xeengine/lightningrender/LightningRenderImpl;-><init>(Ljava/lang/String;ZLjava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public setDelay(Z)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    return-void
.end method

.method public setInnerProcessorName(Ljava/lang/String;)Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->innerProcessorName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setTag(Ljava/lang/String;)Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->tag:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setUseInnerProcessor(Z)Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->useInnerProcessor:Z

    .line 2
    .line 3
    return-object p0
.end method
