.class public Lcom/momo/mcamera/mask/xehandler/XEGameHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallbackAdapter;,
        Lcom/momo/mcamera/mask/xehandler/XEGameHandler$RhythmGameCallback;,
        Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;,
        Lcom/momo/mcamera/mask/xehandler/XEGameHandler$BaseGameCallback;
    }
.end annotation


# static fields
.field private static final HANDLER:Ljava/lang/String; = "LiveGameHandler"


# instance fields
.field private engine:Lcom/momo/xeengine/XE3DEngine;

.field private luaCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;

.field private rhythmGameCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$RhythmGameCallback;


# direct methods
.method public constructor <init>(Lcom/momo/xeengine/XE3DEngine;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public addTrace(Ljava/lang/String;)V
    .locals 0

    .line 1
    :try_start_0
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "type"

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    const-string p1, "sType"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    const-string p1, "msg"

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :catch_0
    return-void
.end method

.method public apiWithUrlParams(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->luaCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;->uploadScore(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public gameDecodeError(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public getClientInfo()Ljava/lang/String;
    .locals 0

    .line 1
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getGameScore()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

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
    new-instance p0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public gotoAction(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public imgWithUrlParams(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
    .locals 0

    return-void
.end method

.method public onLuaEntrance(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->luaCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;->onLuaEntrance()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public playerDead(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->luaCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;->playerDead(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public playerOff(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

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
    iget-object p1, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

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
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 7
    .line 8
    .line 9
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "LiveGameHandler"

    .line 26
    .line 27
    invoke-interface {v0, p0, v1}, Lcom/momo/xeengine/script/ScriptBridge;->regist(Ljava/lang/Object;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public removeGame(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->luaCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, Lcom/momo/mcamera/mask/xehandler/XEGameHandler$BaseGameCallback;->removeGame(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->rhythmGameCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$RhythmGameCallback;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/xehandler/XEGameHandler$BaseGameCallback;->removeGame(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method public removeLuaGame()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "removeLuaGame"

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

.method public rhythmBuy(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->rhythmGameCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$RhythmGameCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/xehandler/XEGameHandler$RhythmGameCallback;->rhythmBuy(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public sendDataToLua(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

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

.method public sendMessage(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setLuaCallback(Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->luaCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;

    .line 2
    .line 3
    return-void
.end method

.method public setRhythmCallback(Lcom/momo/mcamera/mask/xehandler/XEGameHandler$RhythmGameCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->rhythmGameCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$RhythmGameCallback;

    .line 2
    .line 3
    return-void
.end method

.method public touchArea(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->luaCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;->setTouchArea(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public unRegister()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->engine:Lcom/momo/xeengine/XE3DEngine;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/momo/xeengine/XE3DEngine;->getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;

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

.method public uploadGameData(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public uploadGameScore(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->luaCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;->uploadScore(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public userInfo(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/xehandler/XEGameHandler;->luaCallback:Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;->getUserInfo()Ljava/lang/String;

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
