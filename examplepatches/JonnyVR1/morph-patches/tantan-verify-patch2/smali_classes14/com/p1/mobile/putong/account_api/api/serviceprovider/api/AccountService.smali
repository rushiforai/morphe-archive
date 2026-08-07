.class public interface abstract Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/android/injecter/facade/template/IProvider;


# virtual methods
.method public abstract Aq(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract Em(Lcom/p1/mobile/putong/data/ForgetPasswordData;Ljava/lang/Runnable;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/ForgetPasswordData;",
            "Ljava/lang/Runnable;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract G6()Ljava/lang/String;
.end method

.method public abstract Jm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Jr()Z
.end method

.method public abstract K7()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Lr(Lcom/p1/mobile/putong/data/IntlGender;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract Mn(Landroid/content/Context;)Landroid/content/Intent;
.end method

.method public abstract N9()I
.end method

.method public abstract Pd(Lcom/p1/mobile/putong/data/ForgetPasswordData;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/ForgetPasswordData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract Qa(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;Ljava/lang/String;)Landroid/content/Intent;
.end method

.method public abstract Xg()Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end method

.method public abstract a()Ll/bo;
.end method

.method public abstract accessOutterToken()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AuthData;",
            ">;"
        }
    .end annotation
.end method

.method public abstract accessToken()Ljava/lang/String;
.end method

.method public abstract buildBanReleaseVerifyIntent(Landroid/content/Context;Lcom/p1/mobile/putong/data/PhoneNumber;)Landroid/content/Intent;
.end method

.method public abstract checkDownloadData()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/DownloadDataCheck;",
            ">;"
        }
    .end annotation
.end method

.method public abstract checkSmartLockSave(Lcom/p1/mobile/android/app/Act;)V
.end method

.method public abstract dialogCCode(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract downloadDataVerifyEmail(Lcom/p1/mobile/putong/data/EmailVerifyData;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/EmailVerifyData;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/AccountErrorResponse;",
            ">;"
        }
    .end annotation
.end method

.method public abstract eq()I
.end method

.method public abstract getAuthData()Ll/gxd0;
.end method

.method public abstract getSignOutJumpAct()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSignUpData()Lcom/p1/mobile/putong/data/SignUpData;
.end method

.method public abstract getSignUpType()Ljava/lang/String;
.end method

.method public abstract handleAccountErrors(Ljava/lang/Throwable;)V
.end method

.method public abstract hb(Lcom/p1/mobile/putong/data/IntlGender;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/IntlGender;",
            ")",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlGenderItem;",
            ">;"
        }
    .end annotation
.end method

.method public abstract il(Ljava/lang/String;)V
.end method

.method public abstract ji(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V
.end method

.method public abstract kg(Landroid/content/Context;Z)Landroid/content/Intent;
.end method

.method public abstract mp(Ljava/lang/String;)Lrx/c;
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
.end method

.method public abstract onActivityResultForSmartLock(IILandroid/content/Intent;)Z
.end method

.method public abstract oneClickBindPhone(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/SignInGrantType;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/SignInGrantType;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract openLoginUiOptCropAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
.end method

.method public abstract p9()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlProfileInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract phoneVerificationActArgs(Landroid/content/Context;Lcom/p1/mobile/putong/data/VerifyReason;)Landroid/content/Intent;
.end method

.method public abstract ql(Ljava/lang/String;)V
.end method

.method public abstract rq(Lcom/p1/mobile/putong/data/SettingGroups;)Z
.end method

.method public abstract send(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract setAuthData(Lcom/p1/mobile/putong/data/AuthData;)V
.end method

.method public abstract setSignUpData(Lcom/p1/mobile/putong/data/SignUpData;)V
.end method

.method public abstract signedIn()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end method

.method public abstract signedIn_()Z
.end method

.method public abstract startSignInAct(Landroid/content/Context;Landroid/content/Intent;)V
.end method

.method public abstract t5()Ljava/lang/Class;
.end method

.method public abstract uk()Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "+",
            "Lcom/p1/mobile/android/app/Act;",
            ">;"
        }
    .end annotation
.end method

.method public abstract userId()Ljava/lang/String;
.end method

.method public abstract verify(Lcom/p1/mobile/putong/data/VerifyData;)Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/VerifyData;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end method

.method public abstract wj(Ljava/lang/Throwable;)Ljava/lang/String;
.end method

.method public abstract y7()Lrx/c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract y8()V
.end method

.method public abstract zh()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IntlProfileInfo;",
            ">;"
        }
    .end annotation
.end method
