.class public Lcom/p1/mobile/putong/account/ui/jsbridge/AccountBridgeImplementation;
.super Ll/lf2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/lf2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final c(Ll/bqq;)Ljava/lang/String;
    .locals 0
    .param p1    # Ll/bqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string p1, "["

    .line 4
    .line 5
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/api/ABManager;->i()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string p1, "]"

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public getABNames(Ll/aqq;)Ljava/lang/String;
    .locals 0
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "getABNames"
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/jsbridge/AccountBridgeImplementation;->c(Ll/bqq;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public jumpBindPhone(Ll/aqq;)V
    .locals 1
    .param p1    # Ll/aqq;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation runtime Ll/lkq;
        key = "jumpBindPhone"
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Ll/aqq;->c()Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "bind_mobile"

    .line 10
    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;->Z1(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
