.class public interface abstract Lcom/tantanapp/common/network/ApiCallBack;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract beforeCall(Ll/x1d0;)Ll/x1d0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract decodeResponse(Ll/i5d0;)Ll/k5d0;
    .param p1    # Ll/i5d0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public abstract requestCancel(Ll/x1d0;)V
.end method

.method public abstract whenApiError(Ll/x1d0;Ljava/lang/Throwable;)V
.end method

.method public abstract whenApiFinish(Ll/x1d0;)V
.end method

.method public abstract whenGetResponse(Ll/x1d0;Ll/i5d0;)V
.end method

.method public abstract whenResponseCheckError(Lcom/tantanapp/common/network/ApiExcep;)Ljava/lang/Exception;
.end method
