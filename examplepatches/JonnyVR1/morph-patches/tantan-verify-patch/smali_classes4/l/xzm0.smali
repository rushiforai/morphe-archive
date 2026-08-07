.class public Ll/xzm0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xzm0$b;
    }
.end annotation


# static fields
.field public static final h:Ljava/lang/String; = "xzm0"


# instance fields
.field public a:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Lcom/p1/mobile/putong/data/PushMessage;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ll/u1n0;

.field public final c:Ll/l3n0;

.field public final d:Ll/f3n0;

.field public final e:Ll/vod0;

.field public final f:Ll/h2n0;

.field public g:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/xzm0;->a:Ljava/util/HashSet;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p0, Ll/xzm0;->g:Ljava/lang/Integer;

    .line 17
    .line 18
    new-instance v0, Ll/u1n0;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/u1n0;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 24
    .line 25
    new-instance v1, Ll/vod0;

    .line 26
    .line 27
    invoke-direct {v1, v0}, Ll/vod0;-><init>(Ll/u1n0;)V

    .line 28
    .line 29
    .line 30
    iput-object v1, p0, Ll/xzm0;->e:Ll/vod0;

    .line 31
    .line 32
    new-instance v0, Ll/l3n0;

    .line 33
    .line 34
    iget-object v1, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ll/l3n0;-><init>(Ll/u1n0;)V

    .line 37
    .line 38
    .line 39
    iput-object v0, p0, Ll/xzm0;->c:Ll/l3n0;

    .line 40
    .line 41
    new-instance v0, Ll/f3n0;

    .line 42
    .line 43
    iget-object v1, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 44
    .line 45
    invoke-direct {v0, v1}, Ll/f3n0;-><init>(Ll/u1n0;)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/xzm0;->d:Ll/f3n0;

    .line 49
    .line 50
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    const-wide/16 v1, 0x19

    .line 55
    .line 56
    invoke-virtual {v0, v1, v2}, Ll/uqx;->X(J)V

    .line 57
    .line 58
    .line 59
    new-instance v0, Ll/f2n0;

    .line 60
    .line 61
    iget-object v1, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 62
    .line 63
    invoke-direct {v0, p0, v1}, Ll/f2n0;-><init>(Ll/xzm0;Ll/u1n0;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Ll/xzm0;->f:Ll/h2n0;

    .line 67
    .line 68
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Ll/xzm0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/xzm0;->t(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Lrx/c;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic d(Ll/xzm0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzm0;->u()V

    return-void
.end method

.method public static p()Ll/xzm0;
    .locals 1

    .line 1
    sget-object v0, Ll/xzm0$b;->a:Ll/xzm0;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public A()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xzm0;->f:Ll/h2n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/h2n0;->i()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public e()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzm0;->q()Z

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
    iget-object v0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/u1n0;->i()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/u1n0;->o()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    iget-object v0, p0, Ll/xzm0;->d:Ll/f3n0;

    .line 27
    .line 28
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    new-instance v1, Ll/tzm0;

    .line 32
    .line 33
    invoke-direct {v1, v0}, Ll/tzm0;-><init>(Ll/f3n0;)V

    .line 34
    .line 35
    .line 36
    new-instance v0, Ll/xzm0$a;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/xzm0$a;-><init>(Ll/xzm0;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v1, v0}, Ll/w1n0;->a(Ll/pcj;Ll/x20;)V

    .line 42
    .line 43
    .line 44
    :cond_2
    :goto_0
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->R0:Ll/rnb;

    .line 4
    .line 5
    iget-object p0, p0, Ll/rnb;->R:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, -0x1

    .line 18
    .line 19
    cmp-long p0, v0, v2

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->R0:Ll/rnb;

    .line 26
    .line 27
    iget-object p0, p0, Ll/rnb;->R:Ll/byd0;

    .line 28
    .line 29
    invoke-static {}, Ll/pzi0;->o()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    :cond_0
    new-instance p0, Ll/uzm0;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/uzm0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {p0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {}, Ll/psd0;->R()Lrx/c$d;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance v0, Ll/vzm0;

    .line 58
    .line 59
    invoke-direct {v0}, Ll/vzm0;-><init>()V

    .line 60
    .line 61
    .line 62
    new-instance v1, Ll/wzm0;

    .line 63
    .line 64
    invoke-direct {v1}, Ll/wzm0;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public g()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xzm0;->g:Ljava/lang/Integer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v2, p0, Ll/xzm0;->g:Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-interface {v0, v2}, Ll/r97;->u3(I)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/xzm0;->g:Ljava/lang/Integer;

    .line 33
    .line 34
    return-void
.end method

.method public h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzm0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->a7:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isChatJailed()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    instance-of v0, p1, Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    const/4 p2, 0x0

    .line 42
    invoke-interface {p0, p1, p2}, Ll/r97;->Z2(Lcom/p1/mobile/android/app/Act;Z)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    new-instance v0, Ll/rzm0;

    .line 47
    .line 48
    invoke-direct {v0, p0, p1, p2, p3}, Ll/rzm0;-><init>(Ll/xzm0;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    new-instance p1, Ll/szm0;

    .line 52
    .line 53
    invoke-direct {p1, p0}, Ll/szm0;-><init>(Ll/xzm0;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v0, p1}, Ll/w1n0;->a(Ll/pcj;Ll/x20;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public i()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1n0;->g()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1n0;->f()Ll/azm0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Ll/azm0;->h:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1n0;->h()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1n0;->i()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1n0;->l()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/xzm0;->o(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public o(Z)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzm0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/u1n0;->r()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {v1}, Ll/u1n0;->i()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x1

    .line 18
    if-eq v0, v1, :cond_3

    .line 19
    .line 20
    const/4 v2, 0x2

    .line 21
    if-eq v0, v2, :cond_1

    .line 22
    .line 23
    const/4 v2, 0x3

    .line 24
    if-eq v0, v2, :cond_1

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/u1n0;->l()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v2, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 34
    .line 35
    invoke-virtual {v2}, Ll/u1n0;->f()Ll/azm0;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v2, v2, Ll/azm0;->h:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, v2}, Ll/qzm0;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    if-eqz p1, :cond_2

    .line 45
    .line 46
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->X6:I

    .line 47
    .line 48
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 49
    .line 50
    .line 51
    :cond_2
    new-instance p1, Ll/azm0;

    .line 52
    .line 53
    invoke-direct {p1}, Ll/azm0;-><init>()V

    .line 54
    .line 55
    .line 56
    iput-boolean v1, p1, Ll/azm0;->s:Z

    .line 57
    .line 58
    iget-object v0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Ll/u1n0;->p(Ll/azm0;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 64
    .line 65
    const-string p1, "finished"

    .line 66
    .line 67
    invoke-virtual {p0, p1}, Ll/u1n0;->d(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    iget-object v0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 72
    .line 73
    invoke-virtual {v0}, Ll/u1n0;->o()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_5

    .line 78
    .line 79
    if-eqz p1, :cond_4

    .line 80
    .line 81
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->b7:I

    .line 82
    .line 83
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 84
    .line 85
    .line 86
    :cond_4
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 87
    .line 88
    const-string p1, "canceled"

    .line 89
    .line 90
    invoke-virtual {p0, p1}, Ll/u1n0;->d(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_5
    if-eqz p1, :cond_6

    .line 95
    .line 96
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->Y1:I

    .line 97
    .line 98
    invoke-static {p1}, Ll/o1j0;->w(I)V

    .line 99
    .line 100
    .line 101
    :cond_6
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 102
    .line 103
    const-string p1, "rejected"

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ll/u1n0;->d(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1n0;->n()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public r()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1n0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public s()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final synthetic t(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzm0;->c:Ll/l3n0;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/l3n0;->g(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic u()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xzm0;->o(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/data/PushMessage;Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/rum0;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p2, :cond_1

    .line 9
    .line 10
    iget-object p2, p0, Ll/xzm0;->a:Ljava/util/HashSet;

    .line 11
    .line 12
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget-object p2, p0, Ll/xzm0;->a:Ljava/util/HashSet;

    .line 20
    .line 21
    invoke-virtual {p2, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p2, p1, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 29
    .line 30
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/VoiceCallStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/VoiceCallStatus;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v1, "unknown_"

    .line 37
    .line 38
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    :goto_0
    return-void

    .line 45
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v2, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessage;->content:Lcom/p1/mobile/putong/data/PushMessageContent;

    .line 60
    .line 61
    if-eqz v1, :cond_3

    .line 62
    .line 63
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 64
    .line 65
    iget-object p0, p0, Ll/xzm0;->c:Ll/l3n0;

    .line 66
    .line 67
    invoke-virtual {p0, v0, p2}, Ll/l3n0;->j(Lcom/p1/mobile/putong/core/data/VoiceCallStatus;Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageContent;->id:Ljava/lang/String;

    .line 72
    .line 73
    iget-object p0, p0, Ll/xzm0;->d:Ll/f3n0;

    .line 74
    .line 75
    invoke-virtual {p0, v0, p2}, Ll/f3n0;->g(Lcom/p1/mobile/putong/core/data/VoiceCallStatus;Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public w(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzm0;->q()Z

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
    iget-object v0, p0, Ll/xzm0;->b:Ll/u1n0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/u1n0;->l()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Ll/xzm0;->o(Z)V

    .line 22
    .line 23
    .line 24
    :cond_1
    :goto_0
    return-void
.end method

.method public x(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xzm0;->g:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method public y(Landroid/content/Context;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xzm0;->f:Ll/h2n0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h2n0;->g(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/xzm0;->o(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
