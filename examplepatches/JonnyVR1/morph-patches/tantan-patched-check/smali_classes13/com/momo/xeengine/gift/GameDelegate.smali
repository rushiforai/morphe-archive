.class interface abstract Lcom/momo/xeengine/gift/GameDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# static fields
.field public static final BRIDGE_NAME:Ljava/lang/String; = "GameDelegate"


# virtual methods
.method public abstract getGameExtendParams(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract onGameError(Ljava/lang/String;)V
.end method

.method public abstract onGameFinished(Ljava/lang/String;)V
.end method

.method public abstract onGotoEvent(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract onReceivedEvent(Ljava/lang/String;)V
.end method

.method public abstract onVideoProgress(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract onVideoStart(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract onVideoStop(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract setValidTouchAreas(Ljava/lang/String;)Ljava/lang/String;
.end method
