.class public interface abstract Lcom/sina/weibo/sdk/network/IRequestParam;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sina/weibo/sdk/network/IRequestParam$ValuePart;,
        Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;
    }
.end annotation


# virtual methods
.method public abstract addInterceptResult(Ljava/lang/String;Ljava/lang/Object;)V
.end method

.method public abstract byteArrays()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end method

.method public abstract files()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sina/weibo/sdk/network/IRequestParam$ValuePart<",
            "Ljava/io/File;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getContext()Landroid/content/Context;
.end method

.method public abstract getExtraBundle()Landroid/os/Bundle;
.end method

.method public abstract getGetBundle()Landroid/os/Bundle;
.end method

.method public abstract getHeader()Landroid/os/Bundle;
.end method

.method public abstract getIntercept()Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/sina/weibo/sdk/network/IRequestIntercept;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getInterceptResult(Ljava/lang/String;)Ljava/lang/Object;
.end method

.method public abstract getMethod()Lcom/sina/weibo/sdk/network/IRequestParam$RequestType;
.end method

.method public abstract getPostBundle()Landroid/os/Bundle;
.end method

.method public abstract getRequestTimeout()I
.end method

.method public abstract getResponseTimeout()I
.end method

.method public abstract getUrl()Ljava/lang/String;
.end method

.method public abstract needGzip()Z
.end method

.method public abstract needIntercept()Z
.end method

.method public abstract setUrl(Ljava/lang/String;)V
.end method

.method public abstract useDefaultHost()Z
.end method
