.class public Ll/bbm;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/android/billingclient/api/a;

.field public b:Lcom/p1/mobile/android/app/Act;

.field public c:Z

.field public final d:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field

.field public final e:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Lcom/android/billingclient/api/d;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;>;>;"
        }
    .end annotation
.end field

.field public f:Ll/wkb0;

.field public g:Ll/erm;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/bbm;->c:Z

    .line 6
    .line 7
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/bbm;->d:Lrx/subjects/a;

    .line 12
    .line 13
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Ll/bbm;->e:Lrx/subjects/b;

    .line 18
    .line 19
    new-instance v0, Ll/wkb0;

    .line 20
    .line 21
    new-instance v1, Ll/yam;

    .line 22
    .line 23
    invoke-direct {v1, p0}, Ll/yam;-><init>(Ll/bbm;)V

    .line 24
    .line 25
    .line 26
    invoke-direct {v0, v1}, Ll/wkb0;-><init>(Ll/vkb0;)V

    .line 27
    .line 28
    .line 29
    iput-object v0, p0, Ll/bbm;->f:Ll/wkb0;

    .line 30
    .line 31
    new-instance v0, Ll/zam;

    .line 32
    .line 33
    invoke-direct {v0}, Ll/zam;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/bbm;->g:Ll/erm;

    .line 37
    .line 38
    iput-object p1, p0, Ll/bbm;->b:Lcom/p1/mobile/android/app/Act;

    .line 39
    .line 40
    return-void
.end method

.method public static synthetic a(Ll/frm;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/bbm;Lcom/android/billingclient/api/d;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bbm;->n(Lcom/android/billingclient/api/d;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic c(Ll/bbm;Ll/uxj0;)Lcom/android/billingclient/api/a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bbm;->m(Ll/uxj0;)Lcom/android/billingclient/api/a;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic d(Ll/bbm;)Lrx/subjects/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbm;->d:Lrx/subjects/a;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/bbm;)Lcom/android/billingclient/api/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbm;->a:Lcom/android/billingclient/api/a;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/bbm;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/bbm;->c:Z

    return-void
.end method

.method public static bridge synthetic g(Ll/bbm;Lcom/android/billingclient/api/a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bbm;->q(Lcom/android/billingclient/api/a;)V

    return-void
.end method


# virtual methods
.method public h()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/android/billingclient/api/a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bbm;->d:Lrx/subjects/a;

    .line 2
    .line 3
    new-instance v1, Ll/abm;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/abm;-><init>(Ll/bbm;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public i()Lcom/android/billingclient/api/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbm;->a:Lcom/android/billingclient/api/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Lrx/subjects/b;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Lcom/android/billingclient/api/d;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/Purchase;",
            ">;>;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bbm;->e:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Landroid/app/Application;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {p1}, Lcom/android/billingclient/api/a;->g(Landroid/content/Context;)Lcom/android/billingclient/api/a$a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/android/billingclient/api/a$a;->b()Lcom/android/billingclient/api/a$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Ll/bbm;->f:Ll/wkb0;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Lcom/android/billingclient/api/a$a;->d(Ll/vkb0;)Lcom/android/billingclient/api/a$a;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/android/billingclient/api/a$a;->a()Lcom/android/billingclient/api/a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/bbm;->a:Lcom/android/billingclient/api/a;

    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bbm;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/billingclient/api/a;->g(Landroid/content/Context;)Lcom/android/billingclient/api/a$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/billingclient/api/a$a;->b()Lcom/android/billingclient/api/a$a;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/bbm;->f:Ll/wkb0;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/a$a;->d(Ll/vkb0;)Lcom/android/billingclient/api/a$a;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/billingclient/api/a$a;->a()Lcom/android/billingclient/api/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/bbm;->a:Lcom/android/billingclient/api/a;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-virtual {p0, v0}, Ll/bbm;->r(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic m(Ll/uxj0;)Lcom/android/billingclient/api/a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbm;->a:Lcom/android/billingclient/api/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic n(Lcom/android/billingclient/api/d;Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bbm;->e:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {p1, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public o(IILandroid/content/Intent;)V
    .locals 0

    .line 1
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bbm;->a:Lcom/android/billingclient/api/a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/bbm;->a:Lcom/android/billingclient/api/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/billingclient/api/a;->c()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/bbm;->a:Lcom/android/billingclient/api/a;

    .line 16
    .line 17
    iget-object p0, p0, Ll/bbm;->f:Ll/wkb0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wkb0;->a()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final q(Lcom/android/billingclient/api/a;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/bbm;->b:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/bbm;->b:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Activity;->getComponentName()Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "NewMainAct"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    invoke-static {}, Ll/drm;->a()Ll/drm$a;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/drm$a;->a()Ll/drm$a;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/drm$a;->b()Ll/drm;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p0, Ll/bbm;->b:Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    iget-object p0, p0, Ll/bbm;->g:Ll/erm;

    .line 48
    .line 49
    invoke-virtual {p1, v1, v0, p0}, Lcom/android/billingclient/api/a;->j(Landroid/app/Activity;Ll/drm;Ll/erm;)Lcom/android/billingclient/api/d;

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method

.method public r(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/bbm;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ll/bbm;->a:Lcom/android/billingclient/api/a;

    .line 10
    .line 11
    new-instance v1, Ll/bbm$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, p1}, Ll/bbm$a;-><init>(Ll/bbm;Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/a;->k(Ll/ay2;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
