.class public interface abstract Lcom/sina/weibo/sdk/network/IRequestIntercept;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract doIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sina/weibo/sdk/network/exception/InterceptException;
        }
    .end annotation
.end method

.method public abstract needIntercept(Lcom/sina/weibo/sdk/network/IRequestParam;Landroid/os/Bundle;)Z
.end method
