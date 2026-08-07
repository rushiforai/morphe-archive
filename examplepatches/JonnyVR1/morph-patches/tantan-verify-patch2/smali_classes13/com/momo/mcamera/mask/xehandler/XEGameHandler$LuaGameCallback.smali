.class public interface abstract Lcom/momo/mcamera/mask/xehandler/XEGameHandler$LuaGameCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/xehandler/XEGameHandler$BaseGameCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/xehandler/XEGameHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LuaGameCallback"
.end annotation


# virtual methods
.method public abstract getUserInfo()Ljava/lang/String;
.end method

.method public abstract onLuaEntrance()V
.end method

.method public abstract playerDead(Ljava/lang/String;)V
.end method

.method public abstract setTouchArea(Ljava/lang/String;)V
.end method

.method public abstract uploadScore(Ljava/lang/String;)V
.end method

.method public abstract uploadScore(Ljava/lang/String;Lcom/momo/xeengine/script/ScriptBridge$Callback;)V
.end method
