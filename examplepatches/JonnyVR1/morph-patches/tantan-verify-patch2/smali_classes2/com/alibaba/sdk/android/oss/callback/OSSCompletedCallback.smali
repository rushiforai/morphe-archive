.class public interface abstract Lcom/alibaba/sdk/android/oss/callback/OSSCompletedCallback;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T1:",
        "Lcom/alibaba/sdk/android/oss/model/OSSRequest;",
        "T2:",
        "Lcom/alibaba/sdk/android/oss/model/OSSResult;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract onFailure(Lcom/alibaba/sdk/android/oss/model/OSSRequest;Lcom/alibaba/sdk/android/oss/ClientException;Lcom/alibaba/sdk/android/oss/ServiceException;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT1;",
            "Lcom/alibaba/sdk/android/oss/ClientException;",
            "Lcom/alibaba/sdk/android/oss/ServiceException;",
            ")V"
        }
    .end annotation
.end method

.method public abstract onSuccess(Lcom/alibaba/sdk/android/oss/model/OSSRequest;Lcom/alibaba/sdk/android/oss/model/OSSResult;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT1;TT2;)V"
        }
    .end annotation
.end method
