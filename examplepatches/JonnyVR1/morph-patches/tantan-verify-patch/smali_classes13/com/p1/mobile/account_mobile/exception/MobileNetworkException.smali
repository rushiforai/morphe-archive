.class public Lcom/p1/mobile/account_mobile/exception/MobileNetworkException;
.super Ljava/lang/RuntimeException;
.source "SourceFile"


# instance fields
.field public networkError:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "network error, maybe network is turn off"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string v0, "get info failed"

    .line 7
    .line 8
    :goto_0
    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/account_mobile/exception/MobileNetworkException;->networkError:Z

    .line 12
    .line 13
    return-void
.end method
