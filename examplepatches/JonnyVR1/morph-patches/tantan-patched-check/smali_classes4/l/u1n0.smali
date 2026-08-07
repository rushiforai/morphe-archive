.class public Ll/u1n0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/os/Vibrator;

.field public b:Ll/azm0;

.field public c:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Ljava/lang/Integer;",
            ">;"
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
    new-instance v0, Ll/azm0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/azm0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Ll/u1n0;->c:Lrx/subjects/a;

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    const-string v1, "vibrator"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Landroid/os/Vibrator;

    .line 31
    .line 32
    iput-object v0, p0, Ll/u1n0;->a:Landroid/os/Vibrator;

    .line 33
    .line 34
    return-void
.end method

.method public static synthetic a(Ll/y20;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-interface {p0, p2}, Ll/y20;->call(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public c()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const-string v0, "audio"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroid/media/AudioManager;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    return v0

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/media/AudioManager;->getRingerMode()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return p0

    .line 23
    :cond_1
    return v0
.end method

.method public d(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/u1n0;->q(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Ll/u1n0;->e(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public e(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    iput-object p1, v0, Ll/azm0;->r:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/u1n0;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f()Ll/azm0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Lrx/c;
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
    iget-object p0, p0, Ll/u1n0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "localInfo:caller:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/u1n0;->b:Ll/azm0;

    .line 9
    .line 10
    iget-object v1, v1, Ll/azm0;->a:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ",callee:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/u1n0;->b:Ll/azm0;

    .line 21
    .line 22
    iget-object v1, v1, Ll/azm0;->b:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, ",channel:"

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/u1n0;->b:Ll/azm0;

    .line 33
    .line 34
    iget-object v1, v1, Ll/azm0;->h:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, ",callerDid:"

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Ll/u1n0;->b:Ll/azm0;

    .line 45
    .line 46
    iget-object v1, v1, Ll/azm0;->d:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v1, ",calleeDid:"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    iget-object v1, p0, Ll/u1n0;->b:Ll/azm0;

    .line 57
    .line 58
    iget-object v1, v1, Ll/azm0;->c:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ",callerToken:"

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/u1n0;->b:Ll/azm0;

    .line 69
    .line 70
    iget-object v1, v1, Ll/azm0;->g:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v1, ",calleeToken:"

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Ll/u1n0;->b:Ll/azm0;

    .line 81
    .line 82
    iget-object v1, v1, Ll/azm0;->f:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, ",localStatus:"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0}, Ll/u1n0;->i()I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    return-object p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1n0;->c:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public j()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    iget-wide v0, p0, Ll/azm0;->q:J

    .line 4
    .line 5
    return-wide v0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/azm0;->r:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public l()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/azm0;->n:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public m(Ll/t54;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/u1n0;->i()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/u1n0;->r()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v0, Ll/t54;->g:Ll/t54;

    .line 12
    .line 13
    if-ne p1, v0, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    invoke-virtual {p0, p1}, Ll/u1n0;->u(I)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    sget-object v0, Ll/t54;->i:Ll/t54;

    .line 21
    .line 22
    if-eq p1, v0, :cond_2

    .line 23
    .line 24
    sget-object v0, Ll/t54;->h:Ll/t54;

    .line 25
    .line 26
    if-ne p1, v0, :cond_4

    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/t54;->a()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    iput p1, v0, Ll/azm0;->t:I

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/u1n0;->i()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    const/4 v0, 0x1

    .line 41
    if-ne p1, v0, :cond_3

    .line 42
    .line 43
    const-string p1, "canceled"

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Ll/u1n0;->d(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_3
    invoke-virtual {p0}, Ll/u1n0;->i()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    const/4 v0, 0x2

    .line 54
    if-ne p1, v0, :cond_4

    .line 55
    .line 56
    const-string p1, "finished"

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Ll/u1n0;->d(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_4
    return-void
.end method

.method public n()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u1n0;->i()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    iget-boolean p0, p0, Ll/azm0;->o:Z

    .line 4
    .line 5
    return p0
.end method

.method public p(Ll/azm0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/azm0;->a(Ll/azm0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/u1n0;->o()Z

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/u1n0;->l()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public q(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/avm0;->i(Ll/azm0;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public r()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/u1n0;->i()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/azm0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/azm0;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 16
    .line 17
    iget-object v1, v0, Ll/azm0;->n:Ljava/lang/String;

    .line 18
    .line 19
    iget-object v0, v0, Ll/azm0;->h:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/u1n0;->i()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-static {v1, v0, v2}, Ll/qzm0;->g(Ljava/lang/String;Ljava/lang/String;I)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x4

    .line 29
    invoke-virtual {p0, v0}, Ll/u1n0;->u(I)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/qzm0;->m()V

    .line 37
    .line 38
    .line 39
    new-instance v0, Ll/azm0;

    .line 40
    .line 41
    invoke-direct {v0}, Ll/azm0;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 45
    .line 46
    const/16 v0, 0x1f4

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/u1n0;->s(I)V

    .line 49
    .line 50
    .line 51
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget-object v1, Ll/xzm0;->h:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-virtual {p0, v0}, Ll/u1n0;->u(I)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public s(I)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/u1n0;->a:Landroid/os/Vibrator;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    int-to-long v0, p1

    .line 7
    invoke-virtual {p0, v0, v1}, Landroid/os/Vibrator;->vibrate(J)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public t(Ljava/lang/String;Ll/y20;)Ll/kcg0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ll/kcg0;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/u1n0;->g()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/s1n0;

    .line 6
    .line 7
    invoke-direct {v0, p2, p1}, Ll/s1n0;-><init>(Ll/y20;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/t1n0;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/t1n0;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public u(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/azm0;->n:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v0, v0, Ll/azm0;->h:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v2, p0, Ll/u1n0;->c:Lrx/subjects/a;

    .line 8
    .line 9
    invoke-virtual {v2}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    check-cast v2, Ljava/lang/Integer;

    .line 14
    .line 15
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-static {v1, v0, v2, p1}, Ll/qzm0;->n(Ljava/lang/String;Ljava/lang/String;II)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/u1n0;->c:Lrx/subjects/a;

    .line 23
    .line 24
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public v(J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u1n0;->b:Ll/azm0;

    .line 2
    .line 3
    iput-wide p1, p0, Ll/azm0;->q:J

    .line 4
    .line 5
    return-void
.end method
