.class public Ll/pc2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ll/hpl<",
        "TR;>;R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public a:Landroid/os/HandlerThread;

.field public b:Landroid/os/Handler;

.field public c:Ll/kcg0;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field public e:Ll/hpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field public f:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "TT;>;"
        }
    .end annotation
.end field

.field public g:I


# direct methods
.method public constructor <init>(Ll/wbg0;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wbg0<",
            "TT;TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/pc2;->d:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/pc2;->f:Lrx/subjects/b;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    iput v1, p0, Ll/pc2;->g:I

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Ll/pc2;->c:Ll/kcg0;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Ll/hpl;Ll/hpl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/hpl;->getTapType()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p1}, Ll/hpl;->getTapType()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    return-object p0
.end method

.method public static synthetic b(Ll/hpl;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic c(Ll/pc2;Ll/hpl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pc2;->i(Ll/hpl;)V

    return-void
.end method

.method public static synthetic d(Ll/pc2;Ll/pf60;)Ll/hpl;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/pc2;->j(Ll/pf60;)Ll/hpl;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Ll/pc2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pc2;->k()V

    return-void
.end method

.method public static synthetic f(Ll/pc2;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pc2;->h()V

    return-void
.end method


# virtual methods
.method public final g()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "BackgroundTapSubject add subs\uff0ccount\uff1a"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget v1, p0, Ll/pc2;->g:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "[live]msg_observer_handler"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget v0, p0, Ll/pc2;->g:I

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/pc2;->a:Landroid/os/HandlerThread;

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    new-instance v0, Landroid/os/HandlerThread;

    .line 31
    .line 32
    const-string v1, "BackgroundTapThread"

    .line 33
    .line 34
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/pc2;->a:Landroid/os/HandlerThread;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 40
    .line 41
    .line 42
    new-instance v0, Landroid/os/Handler;

    .line 43
    .line 44
    iget-object v1, p0, Ll/pc2;->a:Landroid/os/HandlerThread;

    .line 45
    .line 46
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 51
    .line 52
    .line 53
    iput-object v0, p0, Ll/pc2;->b:Landroid/os/Handler;

    .line 54
    .line 55
    :cond_0
    return-void
.end method

.method public final h()V
    .locals 2

    .line 1
    iget v0, p0, Ll/pc2;->g:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, -0x1

    .line 4
    .line 5
    iput v0, p0, Ll/pc2;->g:I

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v1, "BackgroundTapSubject remove subs\uff0ccount\uff1a"

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget v1, p0, Ll/pc2;->g:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "[live]msg_observer_handler"

    .line 24
    .line 25
    invoke-static {v1, v0}, Ll/nsh0;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget v0, p0, Ll/pc2;->g:I

    .line 29
    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Ll/pc2;->a:Landroid/os/HandlerThread;

    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Ll/pc2;->a:Landroid/os/HandlerThread;

    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Ll/pc2;->b:Landroid/os/Handler;

    .line 43
    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iput-object v1, p0, Ll/pc2;->b:Landroid/os/Handler;

    .line 47
    .line 48
    :cond_1
    iget-object p0, p0, Ll/pc2;->c:Ll/kcg0;

    .line 49
    .line 50
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 51
    .line 52
    .line 53
    :cond_2
    return-void
.end method

.method public final synthetic i(Ll/hpl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pc2;->f:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic j(Ll/pf60;)Ll/hpl;
    .locals 3

    .line 1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ll/hpl;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    sget-object v2, Lcom/p1/mobile/android/app/c;->k:Lcom/p1/mobile/android/app/c;

    .line 14
    .line 15
    if-eq v0, v2, :cond_4

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 18
    .line 19
    if-ne v0, v2, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    sget-object v2, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 23
    .line 24
    if-ne v0, v2, :cond_3

    .line 25
    .line 26
    iget-object v0, p0, Ll/pc2;->d:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    new-instance p1, Ljava/util/ArrayList;

    .line 35
    .line 36
    iget-object v0, p0, Ll/pc2;->d:Ljava/util/List;

    .line 37
    .line 38
    invoke-direct {p1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Ll/pc2;->d:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ll/nc2;

    .line 47
    .line 48
    invoke-direct {v0, p0}, Ll/nc2;-><init>(Ll/pc2;)V

    .line 49
    .line 50
    .line 51
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 52
    .line 53
    .line 54
    return-object v1

    .line 55
    :cond_2
    iput-object p1, p0, Ll/pc2;->e:Ll/hpl;

    .line 56
    .line 57
    return-object p1

    .line 58
    :cond_3
    return-object v1

    .line 59
    :cond_4
    :goto_0
    iget-object v0, p0, Ll/pc2;->e:Ll/hpl;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-nez v0, :cond_6

    .line 66
    .line 67
    iget-object v0, p0, Ll/pc2;->d:Ljava/util/List;

    .line 68
    .line 69
    new-instance v2, Ll/mc2;

    .line 70
    .line 71
    invoke-direct {v2, p1}, Ll/mc2;-><init>(Ll/hpl;)V

    .line 72
    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/jyb;->d0(Ljava/util/List;Ll/qcj;)I

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/pc2;->d:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    const/16 v2, 0x20

    .line 84
    .line 85
    if-ne v0, v2, :cond_5

    .line 86
    .line 87
    iget-object v0, p0, Ll/pc2;->d:Ljava/util/List;

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    invoke-interface {v0, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 94
    .line 95
    const-string v2, "tap size is too small"

    .line 96
    .line 97
    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    :cond_5
    iget-object p0, p0, Ll/pc2;->d:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    :cond_6
    return-object v1
.end method

.method public final synthetic k()V
    .locals 1

    .line 1
    new-instance v0, Ll/oc2;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/oc2;-><init>(Ll/pc2;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/pc2;->g()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Ll/pc2;->g:I

    .line 5
    .line 6
    add-int/lit8 v0, v0, 0x1

    .line 7
    .line 8
    iput v0, p0, Ll/pc2;->g:I

    .line 9
    .line 10
    iget-object v0, p0, Ll/pc2;->f:Lrx/subjects/b;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v1, Ll/ic2;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/ic2;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v0, p1, v1}, Lrx/c;->combineLatest(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object v0, p0, Ll/pc2;->b:Landroid/os/Handler;

    .line 26
    .line 27
    invoke-static {v0}, Ll/qxk;->a(Landroid/os/Handler;)Ll/qxk;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/jc2;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/jc2;-><init>(Ll/pc2;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    new-instance v0, Ll/kc2;

    .line 45
    .line 46
    invoke-direct {v0, p0}, Ll/kc2;-><init>(Ll/pc2;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v0}, Lrx/c;->doOnUnsubscribe(Ll/x20;)Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance p1, Ll/lc2;

    .line 54
    .line 55
    invoke-direct {p1}, Ll/lc2;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0
.end method
