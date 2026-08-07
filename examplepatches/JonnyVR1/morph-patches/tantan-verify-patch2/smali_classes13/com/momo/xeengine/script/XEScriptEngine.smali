.class public interface abstract Lcom/momo/xeengine/script/XEScriptEngine;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xeengine/script/XEScriptEngine$XEScriptEngineRegister;
    }
.end annotation


# virtual methods
.method public abstract executeScriptFile(Ljava/lang/String;)V
.end method

.method public abstract executeScriptString(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end method

.method public abstract registerModule(Lcom/momo/xeengine/script/XEScriptEngine$XEScriptEngineRegister;)V
.end method

.method public abstract setSecretKey(Ljava/lang/String;)V
.end method

.method public abstract startGameScriptFile(Ljava/lang/String;)V
.end method

.method public abstract startGameScriptFile(Ljava/lang/String;Ljava/lang/String;)V
.end method
