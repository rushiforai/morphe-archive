.class public Lcom/p1/mobile/account_core/exception/AccountException;
.super Ljava/lang/RuntimeException;
.source "SourceFile"


# instance fields
.field public meta:Lcom/p1/mobile/account_core/reponse_data/Meta;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/account_core/reponse_data/Meta;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/RuntimeException;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/account_core/exception/AccountException;->meta:Lcom/p1/mobile/account_core/reponse_data/Meta;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getMessage()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/account_core/exception/AccountException;->meta:Lcom/p1/mobile/account_core/reponse_data/Meta;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, v0, Lcom/p1/mobile/account_core/reponse_data/Meta;->message:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-super {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method
