.class public Ll/qyf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile b:Ll/qyf;


# instance fields
.field public a:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/qyf;->a:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;ILcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p3}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/dkb;->Z7()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-static {p0}, Ll/gv20;->m(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    sget v0, Lcom/p1/mobile/putong/core/R$string;->el:I

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v2, Ll/pyf;

    .line 35
    .line 36
    invoke-direct {v2, p0, p1, p2}, Ll/pyf;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    .line 37
    .line 38
    .line 39
    invoke-static {p0, v1, p3, v0, v2}, Ll/qtk;->V0(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/Media;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-static {}, Ll/bj30;->a()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_1

    .line 47
    .line 48
    invoke-static {}, Ll/f7e;->a()Z

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    if-eqz p0, :cond_2

    .line 53
    .line 54
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 57
    .line 58
    iget-object p0, p0, Ll/dkb;->V0:Ll/vxd0;

    .line 59
    .line 60
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ljava/lang/Integer;

    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    add-int/2addr p1, v1

    .line 71
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0, p1}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 81
    .line 82
    iget-object p0, p0, Ll/dkb;->V0:Ll/vxd0;

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    check-cast p0, Ljava/lang/Integer;

    .line 89
    .line 90
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 91
    .line 92
    .line 93
    move-result p0

    .line 94
    const/4 p1, 0x2

    .line 95
    if-ne p0, p1, :cond_2

    .line 96
    .line 97
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 100
    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/g;->Re()V

    .line 102
    .line 103
    .line 104
    :cond_2
    return-void
.end method

.method public static synthetic b(Ll/qyf;Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qyf;->g(Lcom/p1/mobile/putong/data/User;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/f5g;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static f()Ll/qyf;
    .locals 2

    .line 1
    sget-object v0, Ll/qyf;->b:Ll/qyf;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/qyf;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/qyf;->b:Ll/qyf;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/qyf;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/qyf;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/qyf;->b:Ll/qyf;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/qyf;->b:Ll/qyf;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qyf;->a:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/b;->onCompleted()V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    sput-object p0, Ll/qyf;->b:Ll/qyf;

    .line 8
    .line 9
    return-void
.end method

.method public e(Lrx/c;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;",
            "Lcom/p1/mobile/android/app/Act;",
            "Lcom/p1/mobile/android/app/Frag;",
            "I)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/nyf;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nyf;-><init>(Ll/qyf;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Ll/oyf;

    .line 11
    .line 12
    invoke-direct {p1, p2, p3, p4}, Ll/oyf;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/android/app/Frag;I)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic g(Lcom/p1/mobile/putong/data/User;)Lrx/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qyf;->a:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qyf;->a:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
