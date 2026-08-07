.class public Ll/m8t;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/q0m;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ll/v120;

.field public final c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Landroid/util/Pair<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Ll/kcg0;

.field public e:Ll/g8t;

.field public f:Ll/kcg0;

.field public g:Ll/kcg0;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/v120;)V
    .locals 1

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
    iput-object v0, p0, Ll/m8t;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 16
    .line 17
    iput-object p1, p0, Ll/m8t;->b:Ll/v120;

    .line 18
    .line 19
    new-instance p1, Ll/g8t;

    .line 20
    .line 21
    invoke-direct {p1}, Ll/g8t;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/m8t;->e:Ll/g8t;

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/m8t;->f()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/m8t;->g()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/m8t;->e()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/m8t;->n()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static synthetic a(Ll/m8t;Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m8t;->i(Lcom/p1/mobile/android/app/Act$r;)V

    return-void
.end method

.method public static synthetic b(Ll/m8t;Lcom/p1/mobile/android/app/Act$r;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m8t;->k(Lcom/p1/mobile/android/app/Act$r;)V

    return-void
.end method

.method public static synthetic c(Ll/m8t;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m8t;->j(Ljava/lang/Boolean;)V

    return-void
.end method


# virtual methods
.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->onCompleted()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/m8t;->d:Ll/kcg0;

    .line 7
    .line 8
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/m8t;->f:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/m8t;->g:Ll/kcg0;

    .line 17
    .line 18
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/m8t;->o()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/h8t;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/h8t;-><init>(Ll/m8t;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/m8t;->d:Ll/kcg0;

    .line 19
    .line 20
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->mediaCapture()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/k8t;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/k8t;-><init>(Ll/m8t;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/m8t;->g:Ll/kcg0;

    .line 19
    .line 20
    return-void
.end method

.method public final g()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/m8t;->b:Ll/v120;

    .line 6
    .line 7
    instance-of v1, v1, Ll/msf0;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/j8t;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/j8t;-><init>(Ll/m8t;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/m8t;->f:Ll/kcg0;

    .line 27
    .line 28
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8t;->e:Ll/g8t;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g8t;->a()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic i(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    new-instance p0, Landroid/util/Pair;

    .line 6
    .line 7
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-direct {p0, p1, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Landroid/util/Pair;

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p1, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    iget-object p0, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 36
    .line 37
    new-instance p1, Landroid/util/Pair;

    .line 38
    .line 39
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 40
    .line 41
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-direct {p1, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final synthetic j(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8t;->e:Ll/g8t;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Ll/g8t;->c(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/android/app/Act$r;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Landroid/app/Activity;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 p1, 0x0

    .line 16
    :goto_0
    const-string v0, "voice"

    .line 17
    .line 18
    iget-object v1, p0, Ll/m8t;->h:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ll/wrv;->O(Landroid/app/Activity;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Ll/wrv;->M(Landroid/app/Activity;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    :cond_2
    iget-object p0, p0, Ll/m8t;->e:Ll/g8t;

    .line 44
    .line 45
    invoke-virtual {p0, v1}, Ll/g8t;->c(Z)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ll/wrv;->W(Landroid/app/Activity;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget-object p0, p0, Ll/m8t;->e:Ll/g8t;

    .line 56
    .line 57
    if-eqz p1, :cond_4

    .line 58
    .line 59
    const/4 p1, 0x1

    .line 60
    invoke-virtual {p0, p1}, Ll/g8t;->c(Z)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_4
    invoke-virtual {p0, v1}, Ll/g8t;->c(Z)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public final l()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/m8t;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/h1j;

    .line 4
    .line 5
    iget-object v2, p0, Ll/m8t;->b:Ll/v120;

    .line 6
    .line 7
    iget-object v3, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 8
    .line 9
    iget-object v4, p0, Ll/m8t;->e:Ll/g8t;

    .line 10
    .line 11
    invoke-direct {v1, v2, v3, v4}, Ll/h1j;-><init>(Ll/v120;Lrx/c;Ll/g8t;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/m8t;->a:Ljava/util/List;

    .line 18
    .line 19
    new-instance v1, Ll/wqx;

    .line 20
    .line 21
    iget-object v2, p0, Ll/m8t;->b:Ll/v120;

    .line 22
    .line 23
    iget-object v3, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 24
    .line 25
    iget-object v4, p0, Ll/m8t;->e:Ll/g8t;

    .line 26
    .line 27
    invoke-direct {v1, v2, v3, v4}, Ll/wqx;-><init>(Ll/v120;Lrx/c;Ll/g8t;)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/m8t;->a:Ljava/util/List;

    .line 34
    .line 35
    new-instance v1, Ll/jb1;

    .line 36
    .line 37
    iget-object v2, p0, Ll/m8t;->b:Ll/v120;

    .line 38
    .line 39
    iget-object v3, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 40
    .line 41
    iget-object v4, p0, Ll/m8t;->e:Ll/g8t;

    .line 42
    .line 43
    invoke-direct {v1, v2, v3, v4}, Ll/jb1;-><init>(Ll/v120;Lrx/c;Ll/g8t;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Ll/m8t;->a:Ljava/util/List;

    .line 50
    .line 51
    new-instance v1, Ll/jtx;

    .line 52
    .line 53
    iget-object v2, p0, Ll/m8t;->b:Ll/v120;

    .line 54
    .line 55
    iget-object v3, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 56
    .line 57
    iget-object v4, p0, Ll/m8t;->e:Ll/g8t;

    .line 58
    .line 59
    invoke-direct {v1, v2, v3, v4}, Ll/jtx;-><init>(Ll/v120;Lrx/c;Ll/g8t;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/m8t;->b:Ll/v120;

    .line 66
    .line 67
    instance-of v1, v0, Ll/msf0;

    .line 68
    .line 69
    if-eqz v1, :cond_0

    .line 70
    .line 71
    check-cast v0, Ll/msf0;

    .line 72
    .line 73
    iget-object v1, p0, Ll/m8t;->a:Ljava/util/List;

    .line 74
    .line 75
    new-instance v2, Ll/fnf0;

    .line 76
    .line 77
    iget-object v3, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 78
    .line 79
    iget-object v4, p0, Ll/m8t;->e:Ll/g8t;

    .line 80
    .line 81
    invoke-direct {v2, v0, v3, v4}, Ll/fnf0;-><init>(Ll/msf0;Lrx/c;Ll/g8t;)V

    .line 82
    .line 83
    .line 84
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Ll/m8t;->a:Ljava/util/List;

    .line 88
    .line 89
    new-instance v2, Ll/cbb0;

    .line 90
    .line 91
    iget-object v3, p0, Ll/m8t;->c:Lrx/subjects/a;

    .line 92
    .line 93
    iget-object v4, p0, Ll/m8t;->e:Ll/g8t;

    .line 94
    .line 95
    invoke-direct {v2, v0, v3, v4}, Ll/cbb0;-><init>(Ll/msf0;Lrx/c;Ll/g8t;)V

    .line 96
    .line 97
    .line 98
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    :cond_0
    iget-object p0, p0, Ll/m8t;->a:Ljava/util/List;

    .line 102
    .line 103
    new-instance v0, Ll/i8t;

    .line 104
    .line 105
    invoke-direct {v0}, Ll/i8t;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public m(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/m8t;->h:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final n()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m8t;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final o()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m8t;->a:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/l8t;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/l8t;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/m8t;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    return-void
.end method
