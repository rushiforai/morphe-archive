.class public Ll/fdd0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/fdd0$a;
    }
.end annotation


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

.method public static synthetic a(Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;IILandroid/content/Intent;)Z
    .locals 1

    .line 1
    const/4 p2, -0x1

    .line 2
    const/4 v0, 0x0

    .line 3
    if-ne p3, p2, :cond_2

    .line 4
    .line 5
    const-string p2, "up_link_sms"

    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 8
    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 10
    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    const-string p2, "extra_result_action"

    .line 14
    .line 15
    invoke-virtual {p4, p2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p2, 0x0

    .line 21
    :goto_0
    if-eqz p2, :cond_1

    .line 22
    .line 23
    invoke-static {p2}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iput-object p2, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 28
    .line 29
    :cond_1
    invoke-interface {p1, p0}, Ll/fdd0$a;->a(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_2
    return v0
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p1, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;->required:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 9
    .line 10
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    invoke-static {p0, p1, p2, p3}, Ll/fdd0;->c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    if-nez p1, :cond_2

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string p2, "required="

    .line 24
    .line 25
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-boolean p1, p1, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;->required:Z

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    :goto_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/account_core/reponse_data/RiskVerification;Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;)V
    .locals 8

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    move-object v7, v0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    const-string v0, "signup_signin"

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :goto_1
    iget-object v2, p1, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;->upCode:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v3, p1, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;->upReceiveNumber:Ljava/lang/String;

    .line 17
    .line 18
    iget v4, p1, Lcom/p1/mobile/account_core/reponse_data/RiskVerification;->expireSeconds:I

    .line 19
    .line 20
    iget v5, p2, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 21
    .line 22
    iget-object v6, p2, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 23
    .line 24
    move-object v1, p0

    .line 25
    invoke-static/range {v1 .. v7}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/act/OriginalSMSAct;->Z1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IILjava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance p1, Ll/edd0;

    .line 30
    .line 31
    invoke-direct {p1, p2, p3}, Ll/edd0;-><init>(Lcom/p1/mobile/putong/data/VerifyData;Ll/fdd0$a;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method
