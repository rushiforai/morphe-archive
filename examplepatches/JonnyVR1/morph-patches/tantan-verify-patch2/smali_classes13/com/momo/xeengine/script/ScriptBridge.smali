.class public interface abstract Lcom/momo/xeengine/script/ScriptBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/script/ScriptBridge$Callback;
    }
.end annotation


# virtual methods
.method public abstract add(Ljava/lang/Object;Ljava/lang/String;)V
.end method

.method public abstract call(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract regist(Ljava/lang/Object;Ljava/lang/String;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract remove(Ljava/lang/String;)V
.end method

.method public abstract removeAll()V
.end method

.method public abstract unregist(Ljava/lang/String;)V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract unregistAll()V
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method
