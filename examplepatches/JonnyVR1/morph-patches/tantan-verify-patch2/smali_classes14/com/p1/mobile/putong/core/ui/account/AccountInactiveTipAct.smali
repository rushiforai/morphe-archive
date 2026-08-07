.class public Lcom/p1/mobile/putong/core/ui/account/AccountInactiveTipAct;
.super Lcom/p1/mobile/putong/app/PutongMvpAct;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongMvpAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public X1()Ll/ar2;
    .locals 1

    .line 1
    new-instance v0, Ll/tq;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/tq;-><init>(Ll/ner;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public Y1()Ll/iam;
    .locals 1

    .line 1
    new-instance v0, Ll/uq;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/uq;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xi()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p0, "p_delete_account_success"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->pageId()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method
