.class public interface abstract Lcom/momo/xeengine/gift/GiftSDKPreferences;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# direct methods
.method public static getInstance()Lcom/momo/xeengine/gift/GiftSDKPreferences;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/momo/xeengine/gift/GiftSDKPreferencesImpl$Holder;->instance:Lcom/momo/xeengine/gift/GiftSDKPreferences;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public abstract getDownloader()Lcom/momo/xeengine/gift/IResourceDownloader;
.end method

.method public abstract init(Landroid/content/Context;)V
.end method

.method public abstract setDownloader(Lcom/momo/xeengine/gift/IResourceDownloader;)V
    .param p1    # Lcom/momo/xeengine/gift/IResourceDownloader;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
