.class public interface abstract Lcom/appsflyer/internal/AFi1lSDK;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract getMonetizationNetwork()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public abstract getRevenue(Lcom/appsflyer/internal/platform_extension/PluginInfo;)V
    .param p1    # Lcom/appsflyer/internal/platform_extension/PluginInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method
