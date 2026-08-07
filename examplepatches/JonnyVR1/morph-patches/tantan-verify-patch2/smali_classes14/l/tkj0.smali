.class public final Ll/tkj0;
.super Ll/ibf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ibf0<",
        "Ll/alj0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0002\u0008\u0008\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u000f\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u000f\u0010\u0008\u001a\u00020\u0007H\u0016\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\r\u0010\n\u001a\u00020\u0007\u00a2\u0006\u0004\u0008\n\u0010\tR\u0018\u0010\u000e\u001a\u0004\u0018\u00010\u000b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u000c\u0010\rR\u0018\u0010\u0012\u001a\u0004\u0018\u00010\u000f8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0010\u0010\u0011R\"\u0010\u001a\u001a\u00020\u00138\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0014\u0010\u0015\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001b"
    }
    d2 = {
        "Ll/tkj0;",
        "Ll/ibf0;",
        "Ll/alj0;",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "a0",
        "()V",
        "c1",
        "Lcom/p1/mobile/putong/data/SignUpData;",
        "e",
        "Lcom/p1/mobile/putong/data/SignUpData;",
        "signUpData",
        "Lcom/p1/mobile/putong/data/VerifyData;",
        "f",
        "Lcom/p1/mobile/putong/data/VerifyData;",
        "verifyData",
        "",
        "g",
        "J",
        "getClickTime",
        "()J",
        "f1",
        "(J)V",
        "clickTime",
        "b_account_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public e:Lcom/p1/mobile/putong/data/SignUpData;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/data/VerifyData;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public g:J


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/ibf0;-><init>(Ll/ner;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static Q0(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic R0(Ll/tkj0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tkj0;->a1(Ll/tkj0;Ll/uxj0;)V

    return-void
.end method

.method public static S0(Lcom/p1/mobile/android/app/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 5
    .line 6
    if-ne p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static U0(Ll/tkj0;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/tkj0;->g:J

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const-string v1, "key_signup_data"

    .line 21
    .line 22
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    move-object p1, v0

    .line 28
    :goto_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 29
    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    check-cast p1, Lcom/p1/mobile/putong/data/SignUpData;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    move-object p1, v0

    .line 36
    :goto_1
    iput-object p1, p0, Ll/tkj0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    if-eqz p1, :cond_2

    .line 49
    .line 50
    const-string v1, "key_verify_data"

    .line 51
    .line 52
    invoke-virtual {p1, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    goto :goto_2

    .line 57
    :cond_2
    move-object p1, v0

    .line 58
    :goto_2
    instance-of v1, p1, Lcom/p1/mobile/putong/data/VerifyData;

    .line 59
    .line 60
    if-eqz v1, :cond_3

    .line 61
    .line 62
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyData;

    .line 63
    .line 64
    goto :goto_3

    .line 65
    :cond_3
    move-object p1, v0

    .line 66
    :goto_3
    iput-object p1, p0, Ll/tkj0;->f:Lcom/p1/mobile/putong/data/VerifyData;

    .line 67
    .line 68
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 69
    .line 70
    check-cast p1, Ll/alj0;

    .line 71
    .line 72
    iget-object v1, p0, Ll/tkj0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 73
    .line 74
    if-eqz v1, :cond_4

    .line 75
    .line 76
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_4
    move-object v1, v0

    .line 80
    :goto_4
    sget-object v2, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 81
    .line 82
    if-ne v1, v2, :cond_5

    .line 83
    .line 84
    const/4 v1, 0x1

    .line 85
    goto :goto_5

    .line 86
    :cond_5
    const/4 v1, 0x0

    .line 87
    :goto_5
    invoke-virtual {p1, v1}, Ll/alj0;->I(Z)V

    .line 88
    .line 89
    .line 90
    new-instance p1, Ll/q4f;

    .line 91
    .line 92
    invoke-direct {p1}, Ll/q4f;-><init>()V

    .line 93
    .line 94
    .line 95
    const-string v1, "p_clone_if_ttcuser"

    .line 96
    .line 97
    iput-object v1, p1, Ll/q4f;->n:Ljava/lang/String;

    .line 98
    .line 99
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 100
    .line 101
    iput-object v1, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 102
    .line 103
    iget-object p0, p0, Ll/tkj0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 104
    .line 105
    if-eqz p0, :cond_6

    .line 106
    .line 107
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 108
    .line 109
    :cond_6
    if-ne v0, v2, :cond_7

    .line 110
    .line 111
    const-string p0, "phone_number"

    .line 112
    .line 113
    goto :goto_6

    .line 114
    :cond_7
    const-string p0, "email"

    .line 115
    .line 116
    :goto_6
    const-string v0, "sign_type"

    .line 117
    .line 118
    invoke-static {v0, p0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-static {p0}, Lkotlin/collections/MapsKt;->mapOf(Lkotlin/Pair;)Ljava/util/Map;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {p1, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 127
    .line 128
    .line 129
    return-void
.end method

.method public static synthetic V0(Ll/tkj0;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tkj0;->d1(Ll/tkj0;Ll/uxj0;)V

    return-void
.end method

.method public static W0(Ll/tkj0;Lcom/p1/mobile/android/app/c;)V
    .locals 4

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/tkj0;->g:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    const-wide/16 v2, 0x1f4

    .line 13
    .line 14
    cmp-long p1, v0, v2

    .line 15
    .line 16
    if-lez p1, :cond_2

    .line 17
    .line 18
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 19
    .line 20
    check-cast p1, Ll/alj0;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/alj0;->J()Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-eqz p1, :cond_2

    .line 27
    .line 28
    new-instance p1, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;

    .line 29
    .line 30
    iget-object v0, p0, Ll/tkj0;->f:Lcom/p1/mobile/putong/data/VerifyData;

    .line 31
    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 35
    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    :cond_0
    const-string v0, ""

    .line 39
    .line 40
    :cond_1
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Device;->toJson()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "device"

    .line 52
    .line 53
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/account_core/request_data/JsonData;->addExtraData(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/account/api/a;->S0(Lcom/p1/mobile/account_core/request_data/RequestData;Z)V

    .line 58
    .line 59
    .line 60
    sget-object v0, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 61
    .line 62
    iget-object v1, p0, Ll/tkj0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 63
    .line 64
    invoke-virtual {v0, v1, p1}, Lcom/p1/mobile/putong/account/api/a;->v2(Lcom/p1/mobile/putong/data/SignUpData;Lcom/p1/mobile/putong/account/ui/accountnew/loginopt/TokenSigninParam;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {}, Ll/psd0;->R()Lrx/c$d;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance v0, Ll/pkj0;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Ll/pkj0;-><init>(Ll/tkj0;)V

    .line 79
    .line 80
    .line 81
    new-instance v1, Ll/qkj0;

    .line 82
    .line 83
    invoke-direct {v1, p0}, Ll/qkj0;-><init>(Ll/tkj0;)V

    .line 84
    .line 85
    .line 86
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 91
    .line 92
    .line 93
    :cond_2
    return-void
.end method

.method public static synthetic X0(Ll/tkj0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tkj0;->e1(Ll/tkj0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic Y0(Ll/tkj0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tkj0;->b1(Ll/tkj0;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static final a1(Ll/tkj0;Ll/uxj0;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/ibf0;->r0()V

    .line 2
    .line 3
    .line 4
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 5
    .line 6
    iget-object p0, p0, Ll/tkj0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 15
    .line 16
    if-ne p0, v0, :cond_1

    .line 17
    .line 18
    const-string p0, "Phone"

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_1
    const-string p0, "email"

    .line 22
    .line 23
    :goto_1
    const-string v0, "Method used"

    .line 24
    .line 25
    invoke-static {v0, p0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "Status"

    .line 30
    .line 31
    const-string v1, "Success"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 38
    .line 39
    invoke-static {v1}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    const-string v2, "Version"

    .line 44
    .line 45
    invoke-static {v2, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    filled-new-array {p0, v0, v1}, [Lkotlin/Pair;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string v0, "Login"

    .line 58
    .line 59
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static final b1(Ll/tkj0;Ljava/lang/Throwable;)V
    .locals 6

    .line 1
    sget-object v0, Ll/x95;->INSTANCE:Ll/x95;

    .line 2
    .line 3
    iget-object v1, p0, Ll/tkj0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move-object v1, v2

    .line 12
    :goto_0
    sget-object v3, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 13
    .line 14
    if-ne v1, v3, :cond_1

    .line 15
    .line 16
    const-string v1, "Phone"

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    const-string v1, "email"

    .line 20
    .line 21
    :goto_1
    const-string v3, "Method used"

    .line 22
    .line 23
    invoke-static {v3, v1}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v3, "Status"

    .line 28
    .line 29
    const-string v4, "Failure"

    .line 30
    .line 31
    invoke-static {v3, v4}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    sget-object v4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 36
    .line 37
    invoke-static {v4}, Ll/wx0;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    const-string v5, "Version"

    .line 42
    .line 43
    invoke-static {v5, v4}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    filled-new-array {v1, v3, v4}, [Lkotlin/Pair;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-static {v1}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v3, "Login"

    .line 56
    .line 57
    invoke-virtual {v0, v3, v1}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 58
    .line 59
    .line 60
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 61
    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;

    .line 65
    .line 66
    goto :goto_2

    .line 67
    :cond_2
    move-object p1, v2

    .line 68
    :goto_2
    if-eqz p1, :cond_4

    .line 69
    .line 70
    iget v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$AccountService;->code:I

    .line 71
    .line 72
    const v1, 0x61b18

    .line 73
    .line 74
    .line 75
    if-ne v0, v1, :cond_3

    .line 76
    .line 77
    move-object v2, p1

    .line 78
    :cond_3
    if-eqz v2, :cond_4

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    if-eqz p0, :cond_4

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 87
    .line 88
    .line 89
    :cond_4
    return-void
.end method

.method public static final d1(Ll/tkj0;Ll/uxj0;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/alj0;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/alj0;->N()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast v0, Ll/alj0;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Ll/tkj0;->f:Lcom/p1/mobile/putong/data/VerifyData;

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    invoke-static {v0, v1, v2, v2}, Lcom/p1/mobile/putong/account/ui/accountnew/SignUpDetailsNewAct;->c2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerifyData;ZZ)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 33
    .line 34
    iget-object v0, p0, Ll/tkj0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v0, 0x0

    .line 42
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 43
    .line 44
    if-ne v0, v1, :cond_2

    .line 45
    .line 46
    const-string v0, "Phone number register success"

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    const-string v0, "Email register success"

    .line 50
    .line 51
    :goto_1
    const-string v1, "Sign up status"

    .line 52
    .line 53
    invoke-static {v1, v0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    filled-new-array {v0}, [Lkotlin/Pair;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {v0}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "Sign Up"

    .line 66
    .line 67
    invoke-virtual {p1, v1, v0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 77
    .line 78
    .line 79
    :cond_3
    return-void
.end method

.method public static final e1(Ll/tkj0;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/alj0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/alj0;->N()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-static {p1}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    sget-object p1, Ll/x95;->INSTANCE:Ll/x95;

    .line 21
    .line 22
    iget-object p0, p0, Ll/tkj0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SignUpData;->signUpType:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    :goto_0
    sget-object v0, Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;->phone:Lcom/p1/mobile/putong/api/api/AccountTempApi$SignUpType;

    .line 31
    .line 32
    if-ne p0, v0, :cond_2

    .line 33
    .line 34
    const-string p0, "Phone number register fail"

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    const-string p0, "Email register fail"

    .line 38
    .line 39
    :goto_1
    const-string v0, "Sign up status"

    .line 40
    .line 41
    invoke-static {v0, p0}, Lkotlin/TuplesKt;->a(Ljava/lang/Object;Ljava/lang/Object;)Lkotlin/Pair;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    filled-new-array {p0}, [Lkotlin/Pair;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Lkotlin/collections/MapsKt;->mutableMapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string v0, "Sign Up"

    .line 54
    .line 55
    invoke-virtual {p1, v0, p0}, Ll/x95;->m(Ljava/lang/String;Ljava/util/Map;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/ibf0;->a0()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lkj0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/lkj0;-><init>(Ll/tkj0;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/mkj0;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/mkj0;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v2, Ll/nkj0;

    .line 22
    .line 23
    invoke-direct {v2, v1}, Ll/nkj0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/okj0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/okj0;-><init>(Ll/tkj0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final c1()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/tkj0;->e:Lcom/p1/mobile/putong/data/SignUpData;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v1, Ll/alj0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/alj0;->M()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v1, Ll/alj0;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    const/4 v3, 0x1

    .line 24
    invoke-static {v0, v2, v3}, Ll/ike;->r(Lcom/p1/mobile/putong/data/SignUpData;Ljava/lang/Runnable;Z)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    new-instance v1, Ll/rkj0;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/rkj0;-><init>(Ll/tkj0;)V

    .line 37
    .line 38
    .line 39
    new-instance v2, Ll/skj0;

    .line 40
    .line 41
    invoke-direct {v2, p0}, Ll/skj0;-><init>(Ll/tkj0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public final f1(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/tkj0;->g:J

    .line 2
    .line 3
    return-void
.end method
