.class public final Lcom/opera/android/oauth2/OperaAccessTokenProvider;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/oauth2/OperaAccessSandbox;

.field public final b:J

.field public c:Lcom/opera/android/oauth2/OperaAccessToken;

.field public final d:Lh7f;

.field public e:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/oauth2/OperaAccessSandbox;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lbhf;

    invoke-direct {v0, p0}, Lbhf;-><init>(Lcom/opera/android/oauth2/OperaAccessTokenProvider;)V

    new-instance v1, Lh7f;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->d:Lh7f;

    if-nez p5, :cond_1a

    const-wide/16 v0, 0x0

    :goto_13
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-wide v7, v0

    goto :goto_4f

    :cond_1a
    iput-object p5, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->a:Lcom/opera/android/oauth2/OperaAccessSandbox;

    iget-object v1, p5, Lcom/opera/android/oauth2/OperaAccessSandbox;->a:Li7f;

    invoke-virtual {v1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    iget-byte v0, p5, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    if-eqz v0, :cond_2b

    const/4 v1, 0x5

    if-eq v0, v1, :cond_2b

    const/4 v1, 0x6

    if-ne v0, v1, :cond_4c

    :cond_2b
    iget-wide v0, p5, Lcom/opera/android/oauth2/OperaAccessSandbox;->d:J

    invoke-static {v0, v1}, LJ/N;->MXGc3ngP(J)Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-virtual {p5}, Lcom/opera/android/oauth2/OperaAccessSandbox;->b()V

    goto :goto_4c

    :cond_37
    const/4 v0, 0x1

    iput-byte v0, p5, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    iget-object v1, p5, Lcom/opera/android/oauth2/OperaAccessSandbox;->b:La55;

    new-instance v2, Lj42;

    invoke-direct {v2, p5}, Lj42;-><init>(Lcom/opera/android/oauth2/OperaAccessSandbox;)V

    iget-object v3, v1, La55;->c:Lnrl;

    new-instance v4, Lkw4;

    const/4 v5, 0x2

    invoke-direct {v4, v1, v5, v2, v0}, Lkw4;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    invoke-virtual {v3, v4}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :cond_4c
    :goto_4c
    iget-wide v0, p5, Lcom/opera/android/oauth2/OperaAccessSandbox;->d:J

    goto :goto_13

    :goto_4f
    invoke-static/range {v2 .. v8}, LJ/N;->MeY2CSfq(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;J)J

    move-result-wide p0

    iput-wide p0, v2, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b:J

    return-void
.end method

.method public static a(I)[Ljava/lang/String;
    .registers 4

    const-string v0, "user:read"

    if-eqz p0, :cond_24

    const/4 v1, 0x1

    if-eq p0, v1, :cond_1d

    const/4 v1, 0x2

    const-string v2, "shodan:aria"

    if-eq p0, v1, :cond_18

    const/4 v1, 0x3

    if-eq p0, v1, :cond_13

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/String;

    return-object p0

    :cond_13
    filled-new-array {v2, v0}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_18
    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1d
    const-string p0, "subscriptions"

    filled-new-array {v0, p0}, [Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_24
    const-string p0, "user"

    const-string v1, "social_accounts:read"

    const-string v2, "https://news.opera-api.com/"

    filled-new-array {v2, v0, p0, v1}, [Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final b(Lchf;)V
    .registers 6

    iget-object v0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->d:Lh7f;

    if-eqz p1, :cond_7

    invoke-virtual {v0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_7
    iget-object p1, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->a:Lcom/opera/android/oauth2/OperaAccessSandbox;

    if-eqz p1, :cond_2b

    iget-byte v1, p1, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    const/4 v2, 0x4

    const/4 v3, 0x1

    if-eq v1, v2, :cond_17

    const/4 v2, 0x5

    if-eq v1, v2, :cond_17

    iput-boolean v3, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->e:Z

    return-void

    :cond_17
    iget p1, p1, Lcom/opera/android/oauth2/OperaAccessSandbox;->f:I

    if-eqz p1, :cond_2b

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    if-eqz p1, :cond_27

    if-ne p1, v3, :cond_2b

    invoke-virtual {p0}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->onTokenDenied()V

    return-void

    :cond_27
    invoke-virtual {p0}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->onTokenLost()V

    return-void

    :cond_2b
    iget-object p1, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->c:Lcom/opera/android/oauth2/OperaAccessToken;

    if-eqz p1, :cond_4f

    invoke-virtual {p1}, Lcom/opera/android/oauth2/OperaAccessToken;->a()Z

    move-result p1

    if-nez p1, :cond_4f

    iget-object p0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->c:Lcom/opera/android/oauth2/OperaAccessToken;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_3b
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4b

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lchf;

    invoke-interface {v1, p0}, Lchf;->a(Lcom/opera/android/oauth2/OperaAccessToken;)V

    goto :goto_3b

    :cond_4b
    invoke-virtual {v0}, Lh7f;->clear()V

    return-void

    :cond_4f
    iget-wide p0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b:J

    invoke-static {p0, p1}, LJ/N;->MhBclenx(J)V

    return-void
.end method

.method public final onToken(Lcom/opera/android/oauth2/OperaAccessToken;)V
    .registers 4
    .param p1    # Lcom/opera/android/oauth2/OperaAccessToken;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Lcom/opera/android/oauth2/OperaAccessToken;->a()Z

    move-result v0

    if-eqz v0, :cond_b

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b(Lchf;)V

    return-void

    :cond_b
    iput-object p1, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->c:Lcom/opera/android/oauth2/OperaAccessToken;

    iget-object p0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->d:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_13
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_23

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lchf;

    invoke-interface {v1, p1}, Lchf;->a(Lcom/opera/android/oauth2/OperaAccessToken;)V

    goto :goto_13

    :cond_23
    invoke-virtual {p0}, Lh7f;->clear()V

    return-void
.end method

.method public final onTokenDenied()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->a:Lcom/opera/android/oauth2/OperaAccessSandbox;

    if-eqz v0, :cond_1d

    iget-byte v1, v0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    const/4 v2, 0x1

    const/4 v3, 0x6

    if-eq v1, v2, :cond_1b

    const/4 v2, 0x2

    if-eq v1, v2, :cond_1b

    const/4 v2, 0x3

    if-eq v1, v2, :cond_1b

    const/4 v2, 0x4

    if-ne v1, v2, :cond_1d

    iget-wide v1, v0, Lcom/opera/android/oauth2/OperaAccessSandbox;->d:J

    invoke-static {v1, v2}, LJ/N;->MiD6gAXx(J)V

    iput-byte v3, v0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    goto :goto_1d

    :cond_1b
    iput-byte v3, v0, Lcom/opera/android/oauth2/OperaAccessSandbox;->e:B

    :cond_1d
    :goto_1d
    iget-object p0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->d:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_23
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_33

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lchf;

    invoke-interface {v1}, Lchf;->c()V

    goto :goto_23

    :cond_33
    invoke-virtual {p0}, Lh7f;->clear()V

    return-void
.end method

.method public final onTokenLost()V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->c:Lcom/opera/android/oauth2/OperaAccessToken;

    iget-object p0, p0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->d:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_9
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lchf;

    invoke-interface {v1}, Lchf;->b()V

    goto :goto_9

    :cond_19
    invoke-virtual {p0}, Lh7f;->clear()V

    return-void
.end method
