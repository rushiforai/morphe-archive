.class public interface abstract Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;,
        Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$RequestInfo;
    }
.end annotation


# virtual methods
.method public abstract getRequest(Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$RequestInfo;)Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;
.end method

.method public abstract postRequest(Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$RequestInfo;)Lcom/effectsar/labcv/licenselibrary/HttpRequestProvider$ResponseInfo;
.end method
