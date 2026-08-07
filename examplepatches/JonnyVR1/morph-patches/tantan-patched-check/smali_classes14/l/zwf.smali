.class public Ll/zwf;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/cxf;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/data/SignUpData;

.field public b:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private H0()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-interface {v0, v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->newMainActClearStack(Landroid/content/Context;ZZ)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "from_sign_up"

    .line 16
    .line 17
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Ll/bsj0;->S(Lcom/p1/mobile/android/app/Act;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic e0(Ll/zwf;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwf;->t0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f0(Ll/zwf;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zwf;->y0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic g0(Ll/zwf;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwf;->C0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/zwf;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwf;->s0(Z)V

    return-void
.end method

.method public static synthetic i0(Ll/zwf;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zwf;->z0()V

    return-void
.end method

.method public static synthetic j0(Ll/zwf;Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zwf;->A0(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic k0(Ll/zwf;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zwf;->u0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic l0(Ll/zwf;Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwf;->x0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic m0(Ll/l4g0;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/api/a;->d1()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "signup_source"

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "phone_num"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string v0, "e_signup_photo_alert_continue_button"

    .line 35
    .line 36
    const-string v1, "p_imagepage_signup_photo_alert"

    .line 37
    .line 38
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public static synthetic n0(Ll/zwf;Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zwf;->D0(Ll/l4g0;)V

    return-void
.end method

.method private q0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/hve0;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 12
    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/zwf;->b:Z

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    invoke-direct {p0}, Ll/zwf;->H0()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic u0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/cxf;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zwf;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/cxf;->j(Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic y0(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/zwf;->H0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final synthetic A0(Lcom/p1/mobile/putong/data/SignUpData;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    const-string v0, "male"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    const-string p1, "signup_male_fb"

    .line 13
    .line 14
    new-array p2, v0, [Ljava/lang/Object;

    .line 15
    .line 16
    invoke-static {p1, p2}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 21
    .line 22
    const-string p2, "female"

    .line 23
    .line 24
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    const-string p1, "signup_female_fb"

    .line 31
    .line 32
    new-array p2, v0, [Ljava/lang/Object;

    .line 33
    .line 34
    invoke-static {p1, p2}, Ll/uqb0;->e1(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 42
    .line 43
    .line 44
    invoke-direct {p0}, Ll/zwf;->q0()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final synthetic C0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic D0(Ll/l4g0;)V
    .locals 8

    .line 1
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    sget-object p1, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/account/api/a;->d1()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    const-string v0, "signup_source"

    .line 11
    .line 12
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 23
    .line 24
    const-string v1, "phone_num"

    .line 25
    .line 26
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "e_signup_photo_alert_change_button"

    .line 35
    .line 36
    const-string v1, "p_imagepage_signup_photo_alert"

    .line 37
    .line 38
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iget-object p0, p0, Ll/zwf;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 46
    .line 47
    if-nez p0, :cond_0

    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    :goto_0
    move-object v7, p0

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :goto_1
    const/4 v3, 0x1

    .line 56
    const/4 v4, 0x0

    .line 57
    const/4 v5, 0x0

    .line 58
    const/4 v6, 0x1

    .line 59
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPickerInFloatLayerExp(IZZZLcom/p1/mobile/putong/data/Gender;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public E0()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/zwf;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 11
    .line 12
    invoke-static {}, Lcom/appsflyer/AppsFlyerLib;->getInstance()Lcom/appsflyer/AppsFlyerLib;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v1, v2}, Lcom/appsflyer/AppsFlyerLib;->getAppsFlyerUID(Landroid/content/Context;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/SignUpData;->appsFlyerUID:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v1, Ll/twf;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/twf;-><init>(Ll/zwf;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/account/api/a;->q2(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/uwf;

    .line 36
    .line 37
    invoke-direct {v2, p0, v0}, Ll/uwf;-><init>(Ll/zwf;Lcom/p1/mobile/putong/data/SignUpData;)V

    .line 38
    .line 39
    .line 40
    new-instance v0, Ll/vwf;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ll/vwf;-><init>(Ll/zwf;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public F0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x1

    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0, v0, v1, v1, v0}, Lcom/p1/mobile/putong/app/PutongAct;->pickImagesWithPicker(IZZZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final G0()V
    .locals 9

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_imagepage_signup_photo_alert"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .line 17
    .line 18
    :try_start_0
    const-string v0, "phone_num"

    .line 19
    .line 20
    sget-object v3, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 21
    .line 22
    invoke-virtual {v3}, Lcom/p1/mobile/putong/account/api/a;->c1()Lcom/p1/mobile/putong/data/SignUpData;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    iget-object v3, v3, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string v0, "signup_source"

    .line 32
    .line 33
    sget-object v3, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/p1/mobile/putong/account/api/a;->d1()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 40
    .line 41
    .line 42
    const-string v3, "passive"

    .line 43
    .line 44
    const-string v4, "alert"

    .line 45
    .line 46
    const-string v5, "alert_system"

    .line 47
    .line 48
    const-string v6, "null"

    .line 49
    .line 50
    const-string v7, "edit_profile_page"

    .line 51
    .line 52
    const-string v8, "guide"

    .line 53
    .line 54
    invoke-static/range {v2 .. v8}, Ll/i6e;->a(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1, v2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catch_0
    move-exception v0

    .line 62
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 63
    .line 64
    .line 65
    :goto_0
    invoke-virtual {v1, v2}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/w1e;->f(Ll/l4g0;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 72
    .line 73
    check-cast v0, Ll/cxf;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/cxf;->d()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    sget v2, Lcom/p1/mobile/putong/account/R$string;->H3:I

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->E0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    sget v2, Lcom/p1/mobile/putong/account/R$string;->G3:I

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    sget v2, Lcom/p1/mobile/putong/account/R$string;->c:I

    .line 96
    .line 97
    new-instance v3, Ll/xwf;

    .line 98
    .line 99
    invoke-direct {v3, v1}, Ll/xwf;-><init>(Ll/l4g0;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    sget v2, Lcom/p1/mobile/putong/account/R$string;->F3:I

    .line 107
    .line 108
    new-instance v3, Ll/ywf;

    .line 109
    .line 110
    invoke-direct {v3, p0, v1}, Ll/ywf;-><init>(Ll/zwf;Ll/l4g0;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/ar2;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/pwf;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/pwf;-><init>(Ll/zwf;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/hve0;->w()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/qwf;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/qwf;-><init>(Ll/zwf;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/rwf;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/rwf;-><init>(Ll/zwf;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public p0(Lcom/p1/mobile/putong/data/Media;)V
    .locals 2

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast v0, Ll/cxf;

    .line 10
    .line 11
    iget-object v1, p0, Ll/zwf;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 12
    .line 13
    iput-object p1, v1, Lcom/p1/mobile/putong/data/SignUpData;->profilePath:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/cxf;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/swf;

    .line 28
    .line 29
    invoke-direct {v0, p0, p1}, Ll/swf;-><init>(Ll/zwf;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public r0(Lcom/p1/mobile/putong/data/SignUpData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zwf;->a:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic s0(Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/zwf;->G0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic t0(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/uuf;->b(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    new-instance v0, Ll/wwf;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Ll/wwf;-><init>(Ll/zwf;Z)V

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/zwf;->b:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 6
    .line 7
    if-ne p1, p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public final synthetic z0()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zwf;->o0()Lcom/p1/mobile/putong/account/ui/accountnew/facebook/FacebookSignUpProfileImageAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
