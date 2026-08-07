.class public Ll/qsf0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/qsf0$a;
    }
.end annotation


# instance fields
.field public final a:Ll/ovb;

.field public b:Ll/nvb;

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/ovb$a;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/ovb$a;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ll/ovb$a;->d()Ll/ovb$a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/ovb$a;->c()Ll/ovb;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/qsf0;->a:Ll/ovb;

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/lvb;->b(Landroid/content/Context;Ll/ovb;)Ll/nvb;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Ll/qsf0;->b:Ll/nvb;

    .line 26
    .line 27
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Ll/qsf0;->c:Lrx/subjects/a;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic a(Landroid/app/Activity;Lcom/google/android/gms/tasks/Task;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->k()Ljava/lang/Exception;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    instance-of v0, p1, Lcom/google/android/gms/common/api/ResolvableApiException;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/google/android/gms/common/api/ResolvableApiException;

    .line 17
    .line 18
    const/16 v0, 0x2775

    .line 19
    .line 20
    :try_start_0
    invoke-virtual {p1, p0, v0}, Lcom/google/android/gms/common/api/ResolvableApiException;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :catch_0
    move-exception p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic b(Landroid/app/Activity;Lcom/google/android/gms/tasks/Task;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->p()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->k()Ljava/lang/Exception;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    instance-of v0, p1, Lcom/google/android/gms/common/api/ResolvableApiException;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    check-cast p1, Lcom/google/android/gms/common/api/ResolvableApiException;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/google/android/gms/common/api/ApiException;->getStatusCode()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    const/4 v1, 0x6

    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    :try_start_0
    const-string v0, "e_smart_lock_signin"

    .line 26
    .line 27
    const-string v1, "p_sign_in_phone_number_view"

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    new-array v2, v2, [Ll/pf60;

    .line 31
    .line 32
    invoke-static {v0, v1, v2}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    const/16 v0, 0x2776

    .line 36
    .line 37
    invoke-virtual {p1, p0, v0}, Lcom/google/android/gms/common/api/ResolvableApiException;->startResolutionForResult(Landroid/app/Activity;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    :catch_0
    :cond_1
    :goto_0
    return-void
.end method

.method public static d()Ll/qsf0;
    .locals 1

    .line 1
    invoke-static {}, Ll/qsf0$a;->a()Ll/qsf0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public c(Lcom/google/android/gms/auth/api/credentials/Credential;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qsf0;->b:Ll/nvb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/nvb;->b(Lcom/google/android/gms/auth/api/credentials/Credential;)Lcom/google/android/gms/tasks/Task;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/qsf0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(IILandroid/content/Intent;Ll/y20;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Landroid/content/Intent;",
            "Ll/y20<",
            "Lcom/google/android/gms/auth/api/credentials/Credential;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/16 p0, 0x2776

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-ne p1, p0, :cond_1

    .line 5
    .line 6
    const/4 p0, -0x1

    .line 7
    if-ne p2, p0, :cond_0

    .line 8
    .line 9
    const-string p0, "com.google.android.gms.credentials.Credential"

    .line 10
    .line 11
    invoke-virtual {p3, p0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/google/android/gms/auth/api/credentials/Credential;

    .line 16
    .line 17
    if-eqz p4, :cond_0

    .line 18
    .line 19
    invoke-interface {p4, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return v0

    .line 23
    :cond_1
    const/16 p0, 0x2775

    .line 24
    .line 25
    if-ne p1, p0, :cond_2

    .line 26
    .line 27
    return v0

    .line 28
    :cond_2
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public g(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qsf0;->a:Ll/ovb;

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/lvb;->a(Landroid/app/Activity;Ll/ovb;)Ll/nvb;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Ll/qsf0;->b:Ll/nvb;

    .line 8
    .line 9
    new-instance v0, Lcom/google/android/gms/auth/api/credentials/CredentialRequest$a;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/google/android/gms/auth/api/credentials/CredentialRequest$a;-><init>()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    invoke-virtual {v0, v1}, Lcom/google/android/gms/auth/api/credentials/CredentialRequest$a;->b(Z)Lcom/google/android/gms/auth/api/credentials/CredentialRequest$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/google/android/gms/auth/api/credentials/CredentialRequest$a;->a()Lcom/google/android/gms/auth/api/credentials/CredentialRequest;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/qsf0;->b:Ll/nvb;

    .line 24
    .line 25
    invoke-virtual {v1}, Ll/nvb;->c()Lcom/google/android/gms/tasks/Task;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/qsf0;->b:Ll/nvb;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/nvb;->d(Lcom/google/android/gms/auth/api/credentials/CredentialRequest;)Lcom/google/android/gms/tasks/Task;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance v0, Ll/psf0;

    .line 35
    .line 36
    invoke-direct {v0, p1}, Ll/psf0;-><init>(Landroid/app/Activity;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public h(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qsf0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/ovb$a;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/ovb$a;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/ovb$a;->d()Ll/ovb$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/ovb$a;->c()Ll/ovb;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {p1, v0}, Ll/lvb;->a(Landroid/app/Activity;Ll/ovb;)Ll/nvb;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Ll/qsf0;->b:Ll/nvb;

    .line 25
    .line 26
    new-instance v0, Lcom/google/android/gms/auth/api/credentials/Credential$a;

    .line 27
    .line 28
    invoke-direct {v0, p2}, Lcom/google/android/gms/auth/api/credentials/Credential$a;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p2}, Lcom/google/android/gms/auth/api/credentials/Credential$a;->b(Ljava/lang/String;)Lcom/google/android/gms/auth/api/credentials/Credential$a;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p2, p3}, Lcom/google/android/gms/auth/api/credentials/Credential$a;->c(Ljava/lang/String;)Lcom/google/android/gms/auth/api/credentials/Credential$a;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/account/AccountModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    invoke-interface {p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    if-eqz p3, :cond_0

    .line 48
    .line 49
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_0

    .line 60
    .line 61
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p2, v0}, Lcom/google/android/gms/auth/api/credentials/Credential$a;->d(Landroid/net/Uri;)Lcom/google/android/gms/auth/api/credentials/Credential$a;

    .line 72
    .line 73
    .line 74
    :cond_0
    if-eqz p3, :cond_1

    .line 75
    .line 76
    iget-object v0, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-nez v0, :cond_1

    .line 83
    .line 84
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p2, p3}, Lcom/google/android/gms/auth/api/credentials/Credential$a;->b(Ljava/lang/String;)Lcom/google/android/gms/auth/api/credentials/Credential$a;

    .line 87
    .line 88
    .line 89
    :cond_1
    invoke-virtual {p2}, Lcom/google/android/gms/auth/api/credentials/Credential$a;->a()Lcom/google/android/gms/auth/api/credentials/Credential;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    iget-object p0, p0, Ll/qsf0;->b:Ll/nvb;

    .line 94
    .line 95
    invoke-virtual {p0, p2}, Ll/nvb;->e(Lcom/google/android/gms/auth/api/credentials/Credential;)Lcom/google/android/gms/tasks/Task;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    new-instance p2, Ll/osf0;

    .line 100
    .line 101
    invoke-direct {p2, p1}, Ll/osf0;-><init>(Landroid/app/Activity;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, p2}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    .line 105
    .line 106
    .line 107
    return-void
.end method
