.class public Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;,
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$d;,
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$c;,
        Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$a;
    }
.end annotation


# static fields
.field private static final HANDLER:Ljava/lang/String; = "LiveGameHandler"

.field private static final TAG:Ljava/lang/String; = "LiveGameHandler"


# instance fields
.field private final engine:Lcom/momo/xeengine/IXEngine;

.field private luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

.field private rhythmGameCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$d;


# direct methods
.method private constructor <init>(Lcom/momo/xeengine/IXEngine;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 5
    .line 6
    return-void
.end method

.method public static getInstance(Lcom/momo/xeengine/IXEngine;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;-><init>(Lcom/momo/xeengine/IXEngine;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public addTrace(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "type"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    const-string v0, "sType"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    const-string v0, "msg"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ll/clj;->o(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public apiWithUrlParams(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;->uploadScore(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public gameEnded(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public gameStarted(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$a;->b(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getClientInfo()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "appVersionName"

    .line 7
    .line 8
    sget-object v1, Ll/uqb0;->s:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 11
    .line 12
    .line 13
    const-string v0, "appVersion"

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    sget v2, Ll/uqb0;->t:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v2, ""

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 35
    .line 36
    .line 37
    :catch_0
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public getGameScore()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "getGameScore"

    .line 18
    .line 19
    const-string v1, ""

    .line 20
    .line 21
    const-string v2, "LiveGameHandler"

    .line 22
    .line 23
    invoke-interface {p0, v2, v0, v1}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public getSystemInfo()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public playerDead(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;->playerDead(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public playerOff(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "LiveGameHandler"

    .line 18
    .line 19
    const-string v1, "playerOff"

    .line 20
    .line 21
    invoke-interface {p0, v0, v1, p1}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public pushGameInfo(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "LiveGameHandler"

    .line 18
    .line 19
    const-string v1, "gameInfo"

    .line 20
    .line 21
    invoke-interface {p0, v0, v1, p1}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public pushPBGameInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "LiveGameHandler"

    .line 18
    .line 19
    const-string v0, "pbGameInfo"

    .line 20
    .line 21
    invoke-interface {p0, p1, v0, p2}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public pushRoomInfo(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "LiveGameHandler"

    .line 18
    .line 19
    const-string v1, "roomInfo"

    .line 20
    .line 21
    invoke-interface {p0, v0, v1, p1}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public receivedMessage(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "LiveGameHandler"

    .line 18
    .line 19
    const-string v1, "receivedMessage"

    .line 20
    .line 21
    invoke-interface {p0, v0, v1, p1}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public register()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "engine null"

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    const-string v0, "engine.getScriptBridge null"

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const-string v0, ""

    .line 18
    .line 19
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 20
    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    invoke-interface {v1}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 30
    .line 31
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "LiveGameHandler"

    .line 36
    .line 37
    invoke-interface {v0, p0, v1}, Lcom/momo/xeengine/script/ScriptBridge;->regist(Ljava/lang/Object;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    const-string p0, "game.register.fail: "

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Ll/clj;->o(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public removeGame(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$a;->removeGame(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public removeLuaGame()V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string v0, "removeLuaGame"

    .line 12
    .line 13
    const-string v1, ""

    .line 14
    .line 15
    const-string v2, "LiveGameHandler"

    .line 16
    .line 17
    invoke-interface {p0, v2, v0, v1}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public rhythmBuy(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public sendDataToLua(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "LiveGameHandler"

    .line 18
    .line 19
    const-string v1, "sendDataToLua"

    .line 20
    .line 21
    invoke-interface {p0, v0, v1, p1}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public sendGameStateToLua(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "LiveGameHandler"

    .line 18
    .line 19
    const-string v1, "sendGameStateToLua"

    .line 20
    .line 21
    invoke-interface {p0, v0, v1, p1}, Lcom/momo/xeengine/script/ScriptBridge;->call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public setLuaCallback(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

    .line 2
    .line 3
    return-void
.end method

.method public setRhythmCallback(Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$d;)V
    .locals 0

    return-void
.end method

.method public touchArea(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;->setTouchArea(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public unRegister()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->engine:Lcom/momo/xeengine/IXEngine;

    .line 12
    .line 13
    invoke-interface {p0}, Lcom/momo/xeengine/IXEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "LiveGameHandler"

    .line 18
    .line 19
    invoke-interface {p0, v0}, Lcom/momo/xeengine/script/ScriptBridge;->unregist(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public uploadCurrentScore(Ljava/lang/String;)V
    .locals 1

    .line 1
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "currentScore"

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;->a(I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public uploadGameScore(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;->uploadScore(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public userInfo(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler;->luaCallback:Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/game/LiveGameHandler$b;->getUserInfo()Ljava/lang/String;

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
