.class public interface abstract Lcom/momo/xeengine/somanager/IXEngineSOLoader$LoaderCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/xeengine/somanager/IXEngineSOLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LoaderCallback"
.end annotation


# virtual methods
.method public abstract onFailed(Ljava/lang/String;)V
.end method

.method public abstract onProcess(ID)V
.end method

.method public abstract onSuccess()V
.end method
