.class public Ll/vw6;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Ll/b270;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/b270;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/b270;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/vw6;->R:Ll/b270;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a3(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Ll/uxj0;
    .locals 0

    .line 1
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b3(Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;)Lcom/p1/mobile/putong/data/AccountErrorResponse;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/AccountErrorResponse;->new_()Lcom/p1/mobile/putong/data/AccountErrorResponse;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0xc8

    .line 6
    .line 7
    iput v1, v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;->code:I

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->extra:Ljava/util/Map;

    .line 10
    .line 11
    const-string v2, "hasContract"

    .line 12
    .line 13
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "true"

    .line 18
    .line 19
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;->hasContract:Z

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/AccountEnvelop;->meta:Lcom/p1/mobile/account_core/reponse_data/Meta;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/account_core/reponse_data/Meta;->message:Ljava/lang/String;

    .line 28
    .line 29
    iput-object p0, v0, Lcom/p1/mobile/putong/data/AccountErrorResponse;->message:Ljava/lang/String;

    .line 30
    .line 31
    return-object v0
.end method


# virtual methods
.method public c3(Ljava/lang/String;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/vw6;->R:Ll/b270;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/cn5;->q(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance p1, Ll/tw6;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/tw6;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public d3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AccountErrorResponse;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_core/request_data/DeleteAccountData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_core/request_data/DeleteAccountData;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p4, v0, Lcom/p1/mobile/account_core/request_data/DeleteAccountData;->value:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p2, v0, Lcom/p1/mobile/account_core/request_data/DeactivatedData;->reason:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-nez p2, :cond_0

    .line 15
    .line 16
    const-string p2, "category"

    .line 17
    .line 18
    invoke-virtual {v0, p2, p1}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    const-string p1, "content"

    .line 28
    .line 29
    invoke-virtual {v0, p1, p3}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    iget-object p0, p0, Ll/vw6;->R:Ll/b270;

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/cn5;->r(Lcom/p1/mobile/account_core/request_data/DeleteAccountData;)Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Ll/uw6;

    .line 39
    .line 40
    invoke-direct {p1}, Ll/uw6;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public e3(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/account_core/request_data/VerifyPasswordData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/account_core/request_data/VerifyPasswordData;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/account_core/request_data/VerifyPasswordData;->setPassword(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/vw6;->R:Ll/b270;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/cn5;->x(Lcom/p1/mobile/account_core/request_data/VerifyPasswordData;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
