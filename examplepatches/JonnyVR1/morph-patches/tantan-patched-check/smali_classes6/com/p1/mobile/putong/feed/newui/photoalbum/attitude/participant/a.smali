.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a$a;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;

.field public c:Lcom/p1/mobile/putong/feed/data/Moment;

.field public d:Ll/f41;

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Lcom/p1/mobile/putong/data/Links;

.field public j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public l:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a$a;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;Lcom/p1/mobile/putong/feed/data/Moment;Ll/f41;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->h:Z

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->k:Ljava/util/List;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->a:Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->b:Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;

    .line 17
    .line 18
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 19
    .line 20
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->d:Ll/f41;

    .line 21
    .line 22
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 23
    .line 24
    iget-object p2, p2, Ll/jka;->Q0:Lrx/subjects/b;

    .line 25
    .line 26
    invoke-virtual {p4, p2}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance p3, Ll/y31;

    .line 31
    .line 32
    invoke-direct {p3, p0, p1}, Ll/y31;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->k(Ll/pf60;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->m(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->n(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;Lcom/p1/mobile/android/app/Act;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j(Lcom/p1/mobile/android/app/Act;Ll/pf60;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->l(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public b()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->g:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->i:Lcom/p1/mobile/putong/data/Links;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->i:Lcom/p1/mobile/putong/data/Links;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public c()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;->setLoadMoreHandler(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem$b;)V

    .line 4
    .line 5
    .line 6
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->g:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->k:Ljava/util/List;

    .line 11
    .line 12
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;->e()V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->k:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->a:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->k:Ljava/util/List;

    .line 37
    .line 38
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;->d(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->p()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/data/Links;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->i:Lcom/p1/mobile/putong/data/Links;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    :cond_0
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->g:Z

    .line 21
    .line 22
    :cond_1
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->k:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

    .line 42
    .line 43
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->a:Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->k:Ljava/util/List;

    .line 46
    .line 47
    invoke-virtual {p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;->d(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->k:Ljava/util/List;

    .line 51
    .line 52
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    if-eqz p1, :cond_3

    .line 57
    .line 58
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

    .line 59
    .line 60
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;->e()V

    .line 69
    .line 70
    .line 71
    :cond_3
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/android/app/Act;Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->k:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p2, p1, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/AttitudeParticipantPagerItem;->d(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final synthetic k(Ll/pf60;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->e:Z

    .line 3
    .line 4
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 7
    .line 8
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p1, Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->i(Lcom/p1/mobile/putong/data/Links;Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic l(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->e:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic m(Ll/bkj0;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->e:Z

    .line 3
    .line 4
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/data/Links;

    .line 7
    .line 8
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->i(Lcom/p1/mobile/putong/data/Links;Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a$a;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a$a;

    .line 24
    .line 25
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast p1, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a$a;->c(Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->e:Z

    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->f:Z

    .line 6
    .line 7
    return-void
.end method

.method public o()V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->e:Z

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->d:Ll/f41;

    .line 10
    .line 11
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->b:Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;

    .line 20
    .line 21
    iget v4, v4, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->id:I

    .line 22
    .line 23
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->i:Lcom/p1/mobile/putong/data/Links;

    .line 24
    .line 25
    iget-object v5, v5, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v3, v2, v4, v5}, Ll/jka;->r7(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/b41;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/b41;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;)V

    .line 38
    .line 39
    .line 40
    new-instance v2, Ll/c41;

    .line 41
    .line 42
    invoke-direct {v2, p0}, Ll/c41;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public p()V
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->e:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->d:Ll/f41;

    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->c:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 9
    .line 10
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->b:Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;

    .line 15
    .line 16
    iget v4, v4, Lcom/p1/mobile/putong/feed/data/AttitudeConfigs;->id:I

    .line 17
    .line 18
    invoke-virtual {v1, v3, v2, v4}, Ll/jka;->s7(Ljava/lang/String;Ljava/lang/String;I)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Ll/pej0;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/z31;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/z31;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/a41;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/a41;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a;->l:Lcom/p1/mobile/putong/feed/newui/photoalbum/attitude/participant/a$a;

    .line 2
    .line 3
    return-void
.end method
