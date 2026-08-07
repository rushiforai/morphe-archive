.class public Lcom/sina/weibo/sdk/network/base/RequestResult;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private e:Ljava/lang/Exception;

.field private interceptResult:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private response:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getE()Ljava/lang/Exception;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/base/RequestResult;->e:Ljava/lang/Exception;

    .line 2
    .line 3
    return-object p0
.end method

.method public getInterceptResult()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/base/RequestResult;->interceptResult:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResponse()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/sina/weibo/sdk/network/base/RequestResult;->response:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public setE(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/base/RequestResult;->e:Ljava/lang/Exception;

    .line 2
    .line 3
    return-void
.end method

.method public setInterceptResult(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/base/RequestResult;->interceptResult:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method

.method public setResponse(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/sina/weibo/sdk/network/base/RequestResult;->response:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method
