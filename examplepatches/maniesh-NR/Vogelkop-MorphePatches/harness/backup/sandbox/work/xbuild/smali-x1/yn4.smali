.class public final Lyn4;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lgld;

.field public final b:Lwn4;

.field public final c:Li7f;

.field public final d:Lxn4;

.field public final e:Lvnd;

.field public f:Lxbf;

.field public g:Lcom/google/android/gms/cast/framework/SessionManager;

.field public h:Ldod;

.field public i:Z

.field public j:Lcom/google/android/gms/cast/framework/CastSession;


# direct methods
.method public constructor <init>(Lgld;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lwn4;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lyn4;->b:Lwn4;

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lyn4;->c:Li7f;

    new-instance v0, Lxn4;

    invoke-direct {v0, p0}, Lxn4;-><init>(Lyn4;)V

    iput-object v0, p0, Lyn4;->d:Lxn4;

    iput-object p1, p0, Lyn4;->a:Lgld;

    const-string v0, "AA93A640"

    invoke-static {v0}, Lcom/google/android/gms/cast/CastMediaControlIntent;->categoryForCast(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_49

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_30

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_30
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v2, "controlCategories"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    new-instance v2, Lvnd;

    invoke-direct {v2, v0, v1}, Lvnd;-><init>(Landroid/os/Bundle;Ljava/util/ArrayList;)V

    iput-object v2, p0, Lyn4;->e:Lvnd;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->a(Lmdc;)V

    return-void

    :cond_49
    const-string p0, "category must not be null"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 9

    iget-object p1, p0, Lyn4;->a:Lgld;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {}, Li0l;->g()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_31

    sget-object v0, Landroid/os/Build;->ID:Ljava/lang/String;

    const/16 v2, 0x2d

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const-wide/16 v3, -0x1

    const/4 v5, -0x1

    if-eq v2, v5, :cond_2b

    const/16 v6, 0x2e

    invoke-virtual {v0, v6, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v6

    if-eq v6, v5, :cond_2b

    add-int/2addr v2, v1

    :try_start_23
    invoke-virtual {v0, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3
    :try_end_2b
    .catch Ljava/lang/NumberFormatException; {:try_start_23 .. :try_end_2b} :catch_2b

    :catch_2b
    :cond_2b
    const-wide/16 v5, 0x3288

    cmp-long v0, v3, v5

    if-ltz v0, :cond_48

    :cond_31
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v0

    const v2, 0xc042c0

    invoke-virtual {v0, p1, v2}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;I)I

    move-result v0

    if-nez v0, :cond_48

    :try_start_3e
    invoke-static {p1}, Lcom/google/android/gms/cast/framework/CastContext;->getSharedInstance(Landroid/content/Context;)Lcom/google/android/gms/cast/framework/CastContext;

    move-result-object v0

    const-string v2, "AA93A640"

    invoke-virtual {v0, v2}, Lcom/google/android/gms/cast/framework/CastContext;->setReceiverApplicationId(Ljava/lang/String;)V
    :try_end_47
    .catch Ljava/lang/RuntimeException; {:try_start_3e .. :try_end_47} :catch_48

    goto :goto_49

    :catch_48
    :cond_48
    const/4 v1, 0x0

    :goto_49
    iput-boolean v1, p0, Lyn4;->i:Z

    if-eqz v1, :cond_53

    invoke-static {p1}, Ldod;->d(Landroid/content/Context;)Ldod;

    move-result-object p1

    iput-object p1, p0, Lyn4;->h:Ldod;

    :cond_53
    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 3

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lyn4;->h:Ldod;

    if-eqz p1, :cond_13

    iget-object v0, p0, Lyn4;->b:Lwn4;

    invoke-virtual {p1, v0}, Ldod;->j(Lwnd;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lyn4;->h:Ldod;

    :cond_13
    return-void
.end method

.method public final onStart(Lndc;)V
    .registers 4

    iget-object p1, p0, Lyn4;->h:Ldod;

    if-eqz p1, :cond_c

    iget-object v0, p0, Lyn4;->b:Lwn4;

    const/4 v1, 0x4

    iget-object p0, p0, Lyn4;->e:Lvnd;

    invoke-virtual {p1, p0, v0, v1}, Ldod;->a(Lvnd;Lwnd;I)V

    :cond_c
    return-void
.end method

.method public final onStop(Lndc;)V
    .registers 4

    iget-object p1, p0, Lyn4;->h:Ldod;

    if-eqz p1, :cond_c

    iget-object v0, p0, Lyn4;->b:Lwn4;

    const/4 v1, 0x0

    iget-object p0, p0, Lyn4;->e:Lvnd;

    invoke-virtual {p1, p0, v0, v1}, Ldod;->a(Lvnd;Lwnd;I)V

    :cond_c
    return-void
.end method
