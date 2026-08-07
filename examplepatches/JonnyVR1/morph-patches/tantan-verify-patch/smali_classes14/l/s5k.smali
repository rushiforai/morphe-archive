.class public Ll/s5k;
.super Ll/mwl;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/mwl;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(Ll/s5k;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/s5k;->t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic s(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/mwl;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/abe0;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ll/zit;

    .line 5
    .line 6
    invoke-virtual {p3}, Ll/abe0;->c()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p3

    .line 10
    invoke-direct {p2, p3}, Ll/zit;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string p3, "h5Url"

    .line 14
    .line 15
    invoke-virtual {p2, p3}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p0, p1, p2}, Ll/s5k;->u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public l(Ljava/lang/String;)Z
    .locals 0

    .line 1
    const-string p0, "live/room/octopusGame"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic t(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/s5k;->v(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final u(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/intl/game/api/IntlGameApiProvider;->getRealOctopusGameUrl(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    new-instance v0, Ll/p5k;

    .line 10
    .line 11
    invoke-direct {v0}, Ll/p5k;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p2, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    new-instance v0, Ll/q5k;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Ll/q5k;-><init>(Ll/s5k;Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Ll/r5k;

    .line 24
    .line 25
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final v(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-static {p2}, Ll/zqo;->d(Ljava/lang/String;)Ll/px50;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Ll/pjn;

    .line 6
    .line 7
    invoke-direct {v0, p1}, Ll/pjn;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/px50;->n()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p0}, Ll/px50;->m()[I

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {p0}, Ll/px50;->i()Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {p0}, Ll/px50;->h()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    invoke-virtual {p0}, Ll/px50;->b()Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 27
    .line 28
    .line 29
    move-result-object v5

    .line 30
    invoke-virtual {p0}, Ll/px50;->k()Z

    .line 31
    .line 32
    .line 33
    move-result v6

    .line 34
    invoke-virtual {p0}, Ll/px50;->j()Z

    .line 35
    .line 36
    .line 37
    move-result v7

    .line 38
    invoke-virtual {p0}, Ll/px50;->f()I

    .line 39
    .line 40
    .line 41
    move-result v8

    .line 42
    const/4 v9, 0x0

    .line 43
    invoke-virtual/range {v0 .. v9}, Ll/pjn;->O(Ljava/lang/String;[IZILcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;ZZIZ)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
