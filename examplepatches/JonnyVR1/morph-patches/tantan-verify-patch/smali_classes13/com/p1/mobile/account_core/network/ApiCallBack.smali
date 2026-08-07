.class public interface abstract Lcom/p1/mobile/account_core/network/ApiCallBack;
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

.method public abstract beforeExceptionCheck(Ll/i5d0;)Ljava/lang/Exception;
.end method

.method public abstract whenApiError(Ljava/lang/Exception;)V
.end method

.method public abstract whenApiFinish()V
.end method

.method public abstract whenGetRealCall(Ll/ry3;)V
.end method

.method public abstract whenGetResponse(Ll/i5d0;)V
.end method
