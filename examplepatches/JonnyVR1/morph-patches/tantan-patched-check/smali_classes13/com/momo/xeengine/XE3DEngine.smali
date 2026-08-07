.class public final Lcom/momo/xeengine/XE3DEngine;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xeengine/IXEngine;


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private height:I

.field private initLibraryPath:Ljava/lang/String;

.field private lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

.field private tag:Ljava/lang/String;

.field private tickEnable:Z

.field private width:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/momo/xeengine/XE3DEngine;->initLibraryPath:Ljava/lang/String;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/momo/xeengine/XE3DEngine;->tickEnable:Z

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    iput p1, p0, Lcom/momo/xeengine/XE3DEngine;->width:I

    .line 12
    .line 13
    iput p1, p0, Lcom/momo/xeengine/XE3DEngine;->height:I

    .line 14
    .line 15
    iput-object p2, p0, Lcom/momo/xeengine/XE3DEngine;->tag:Ljava/lang/String;

    .line 16
    .line 17
    return-void
.end method

.method public static getEngineVersion()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "5.0.7"

    .line 2
    .line 3
    return-object v0
.end method

.method public static getEngineVersionNum()I
    .locals 1

    const/16 v0, 0x1fb

    return v0
.end method

.method public static loadEngineSo()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xeengine/somanager/XEngineSOManager;->loadEngineSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static loadLuaEngineSo()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/momo/xeengine/somanager/XEngineSOManager;->loadEngineSO()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    return v0
.end method

.method public static setApplicationContext(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/momo/xeengine/XEnginePreferences;->setApplicationContext(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public addLibraryPath(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public clearBackground()V
    .locals 0

    return-void
.end method

.method public clearEvent()V
    .locals 0

    return-void
.end method

.method public dispatchMessage(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public enableClearColor(Z)V
    .locals 0

    return-void
.end method

.method public enableRecording(Z)V
    .locals 0

    return-void
.end method

.method public endEngine()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public getEventDispatcher()Lcom/momo/xeengine/xnative/XEEventDispatcher;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    instance-of v0, p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    check-cast p0, Lcom/momo/xeengine/xnative/XEEventDispatcher;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public getLibraryPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->initLibraryPath:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLogger()Lcom/momo/xeengine/XELogger;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getLogger()Lcom/momo/xeengine/XELogger;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptEngine()Lcom/momo/xeengine/lua/XELuaEngine;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/momo/xeengine/lua/XELuaEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public getScriptEngine()Lcom/momo/xeengine/lua/XELuaEngine;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Lcom/momo/xeengine/lua/XELuaEngine;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Lcom/momo/xeengine/lua/XELuaEngine;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public bridge synthetic getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;
    .locals 0

    .line 18
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptEngine()Lcom/momo/xeengine/lua/XELuaEngine;

    move-result-object p0

    return-object p0
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getTag()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->tag:Ljava/lang/String;

    .line 11
    .line 12
    return-object p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "5.0.7"

    .line 2
    .line 3
    return-object p0
.end method

.method public isRunning()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public isTickEnable()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/momo/xeengine/XE3DEngine;->tickEnable:Z

    .line 2
    .line 3
    return p0
.end method

.method public loadSceneWithId(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/momo/xeengine/lightningrender/StickerModel;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/momo/xeengine/lightningrender/StickerModel;-><init>()V

    .line 8
    .line 9
    .line 10
    const-string v1, "XE3DEngine"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/lightningrender/StickerModel;->setBusinessType(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p2}, Lcom/momo/xeengine/lightningrender/StickerModel;->setStickerId(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/momo/xeengine/XE3DEngine;->initLibraryPath:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v1, "/"

    .line 29
    .line 30
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Lcom/momo/xeengine/lightningrender/StickerModel;->setAssetPath(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 44
    .line 45
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0, v0}, Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;->add(Lcom/momo/xeengine/lightningrender/StickerModel;)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 0

    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Lcom/momo/xeengine/XE3DEngine;->queueEvent(Ljava/lang/Runnable;I)V

    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->runOnRenderThread(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public removeLibraryPath(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/IXEngine;->removeLibraryPath(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public render()V
    .locals 1

    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Lcom/momo/xeengine/XE3DEngine;->render(Ljava/lang/String;)V

    return-void
.end method

.method public render(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget v0, p0, Lcom/momo/xeengine/XE3DEngine;->width:I

    .line 6
    .line 7
    iget v1, p0, Lcom/momo/xeengine/XE3DEngine;->height:I

    .line 8
    .line 9
    invoke-interface {p1, v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender;->renderTest(II)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 16
    .line 17
    iget v0, p0, Lcom/momo/xeengine/XE3DEngine;->width:I

    .line 18
    .line 19
    iget p0, p0, Lcom/momo/xeengine/XE3DEngine;->height:I

    .line 20
    .line 21
    invoke-interface {p1, v0, p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->render(II)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public resizeWindow(II)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/xeengine/XE3DEngine;->width:I

    .line 2
    .line 3
    iput p2, p0, Lcom/momo/xeengine/XE3DEngine;->height:I

    .line 4
    .line 5
    return-void
.end method

.method public rorateCamera(Z)V
    .locals 0

    return-void
.end method

.method public runEngine()Z
    .locals 1

    const/4 v0, 0x0

    .line 76
    invoke-virtual {p0, v0, v0}, Lcom/momo/xeengine/XE3DEngine;->runEngine(II)Z

    move-result p0

    return p0
.end method

.method public declared-synchronized runEngine(II)Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    new-instance v0, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;

    .line 3
    .line 4
    invoke-direct {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;-><init>()V

    .line 5
    .line 6
    .line 7
    iget-object v1, p0, Lcom/momo/xeengine/XE3DEngine;->tag:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->setTag(Ljava/lang/String;)Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    .line 12
    :try_start_1
    invoke-virtual {v0}, Lcom/momo/xeengine/lightningrender/LightningRenderBuilder;->build()Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;
    :try_end_1
    .catch Lcom/momo/xeengine/XEngineException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    monitor-exit p0

    .line 22
    return v1

    .line 23
    :cond_0
    :try_start_2
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->init()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 27
    .line 28
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getBeautyLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IBeautyLevel;->setEnable(Z)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 36
    .line 37
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getLookupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$ILookupLevel;->setEnable(Z)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 45
    .line 46
    invoke-interface {v0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getMakeupLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-interface {v0, v1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IMakeupLevel;->setEnable(Z)V

    .line 51
    .line 52
    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    iput p1, p0, Lcom/momo/xeengine/XE3DEngine;->width:I

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p1

    .line 59
    goto :goto_1

    .line 60
    :cond_1
    :goto_0
    if-eqz p2, :cond_2

    .line 61
    .line 62
    iput p2, p0, Lcom/momo/xeengine/XE3DEngine;->height:I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    .line 64
    :cond_2
    monitor-exit p0

    .line 65
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :catch_0
    move-exception p1

    .line 68
    :try_start_3
    new-instance p2, Ljava/lang/RuntimeException;

    .line 69
    .line 70
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    throw p2

    .line 74
    :goto_1
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 75
    throw p1
.end method

.method public sendEvent(Lcom/momo/xeengine/event/XEvent;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/event/XEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/IXEngine;->sendEvent(Lcom/momo/xeengine/event/XEvent;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setLibraryPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/XE3DEngine;->initLibraryPath:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/momo/xeengine/IXEngine;->addLibraryPath(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setOnBackground(Z)V
    .locals 0

    return-void
.end method

.method public setTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/xeengine/XE3DEngine;->tag:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Lcom/momo/xeengine/IXEngine;->setTag(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public setTickEnable(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/momo/xeengine/XE3DEngine;->tickEnable:Z

    .line 2
    .line 3
    return-void
.end method

.method public setUserAudioPlayer(Lcom/momo/xeengine/audio/IXAudioPlayer;)V
    .locals 0
    .param p1    # Lcom/momo/xeengine/audio/IXAudioPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/IXEngine;->setUserAudioPlayer(Lcom/momo/xeengine/audio/IXAudioPlayer;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public showDebugInfo(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/xeengine/IXEngine;->showDebugInfo(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public touchHitTest(FF)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getEventDispatcher()Lcom/momo/xeengine/event/IXEventDispatcher;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/momo/xeengine/event/ITouchEventHandler;->handleTouchHitTest()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public unloadScene(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/XE3DEngine;->lightningRender:Lcom/momo/xeengine/lightningrender/ILightningRender;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/lightningrender/ILightningRender;->getStickerLevel()Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0, p1}, Lcom/momo/xeengine/lightningrender/ILightningRender$IStickerLevel;->removeByID(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
