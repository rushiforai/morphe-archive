.class public Ll/ui80;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/ui80;->a:I

    .line 6
    .line 7
    new-instance v0, Ll/ui80$a;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/ui80$a;-><init>(Ll/ui80;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/ui80;->b:Ljava/lang/Runnable;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a(Ll/ui80;Ll/kcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ui80;->h(Ll/kcg0;)V

    return-void
.end method

.method public static synthetic b(Ll/ui80;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ui80;->g(Ll/pf60;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ph(Lcom/p1/mobile/android/app/Act$r;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic d(Ljava/lang/String;Ljava/lang/Boolean;)Ll/pf60;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static bridge synthetic e(Ll/ui80;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/ui80;->a:I

    return p0
.end method


# virtual methods
.method public f(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    iget v0, p0, Ll/ui80;->a:I

    .line 2
    .line 3
    const/4 v1, -0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    goto :goto_1

    .line 7
    :cond_0
    if-nez p2, :cond_2

    .line 8
    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    const/16 p1, 0x2710

    .line 12
    .line 13
    iput p1, p0, Ll/ui80;->a:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const p1, 0x927c0

    .line 17
    .line 18
    .line 19
    iput p1, p0, Ll/ui80;->a:I

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    if-eqz p1, :cond_3

    .line 23
    .line 24
    const/16 p1, 0x7530

    .line 25
    .line 26
    iput p1, p0, Ll/ui80;->a:I

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_3
    const/4 p1, -0x1

    .line 30
    iput p1, p0, Ll/ui80;->a:I

    .line 31
    .line 32
    :goto_0
    iget-object p1, p0, Ll/ui80;->b:Ljava/lang/Runnable;

    .line 33
    .line 34
    invoke-static {p1}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    iget p1, p0, Ll/ui80;->a:I

    .line 38
    .line 39
    if-ltz p1, :cond_4

    .line 40
    .line 41
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 42
    .line 43
    iget-object p0, p0, Ll/ui80;->b:Ljava/lang/Runnable;

    .line 44
    .line 45
    int-to-long v0, p1

    .line 46
    invoke-static {p2, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 47
    .line 48
    .line 49
    :cond_4
    :goto_1
    return-void
.end method

.method public final synthetic g(Ll/pf60;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/String;

    .line 4
    .line 5
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p1, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, v0, p1}, Ll/ui80;->f(Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic h(Ll/kcg0;)V
    .locals 1

    .line 1
    const/4 v0, -0x2

    .line 2
    iput v0, p0, Ll/ui80;->a:I

    .line 3
    .line 4
    invoke-interface {p1}, Ll/kcg0;->unsubscribe()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public i()Ll/kcg0;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/qi80;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/qi80;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/p1/mobile/putong/app/TantanApp;->c:Ll/cmb0;

    .line 19
    .line 20
    invoke-virtual {v1}, Ll/cmb0;->s()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    new-instance v2, Ll/ri80;

    .line 25
    .line 26
    invoke-direct {v2}, Ll/ri80;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    new-instance v1, Ll/si80;

    .line 34
    .line 35
    invoke-direct {v1, p0}, Ll/si80;-><init>(Ll/ui80;)V

    .line 36
    .line 37
    .line 38
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x0

    .line 47
    const/4 v2, 0x1

    .line 48
    invoke-virtual {p0, v1, v2}, Ll/ui80;->f(Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Ll/ti80;

    .line 52
    .line 53
    invoke-direct {v1, p0, v0}, Ll/ti80;-><init>(Ll/ui80;Ll/kcg0;)V

    .line 54
    .line 55
    .line 56
    invoke-static {v1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method
