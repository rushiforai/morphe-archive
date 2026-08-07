.class public interface abstract Ll/sy3;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract execute(Ll/x1d0;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x1d0;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;"
        }
    .end annotation
.end method

.method public executeWithTimeout(Ll/x1d0;J)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x1d0;",
            "J)",
            "Lrx/c<",
            "Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p1}, Ll/sy3;->execute(Ll/x1d0;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public abstract interceptRequest(Ll/x1d0;)Ll/x1d0;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
