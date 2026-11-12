.class public final Lwro;
.super Lsxo;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-class v0, Lwro;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-virtual {v0}, Ls15;->c()Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;Ljava/lang/String;Lmzo;)V
    .registers 12

    sget-object v0, Lqb7;->h:Ltmj;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Ltmj;->f(Landroid/content/Context;)Lqb7;

    move-result-object v0

    iget-object v0, v0, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_4d

    sget-object v1, Lw3b;->c:Lw3b;

    sget-object v2, Lgvf;->b:Lgvf;

    sget-object v3, Lu06;->d:Lu06;

    invoke-static {v3, v1, v2, v2}, Ls9i;->E(Lu06;Lw3b;Lgvf;Lgvf;)Ls9i;

    move-result-object v1

    const-string v2, "2.14.0"

    invoke-static {v2}, Lgd7;->a(Ljava/lang/String;)Lgd7;

    move-result-object v2

    const/4 v3, 0x0

    :try_start_21
    iget-object v4, p3, Lmzo;->a:Ljava/lang/String;

    new-instance v5, Ljava/net/URL;

    iget-object v6, p3, Lmzo;->c:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    iget-object v6, p3, Lmzo;->b:Ljava/lang/String;

    const-string v7, "VendorKey is null or empty"

    invoke-static {v4, v7}, Lzch;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "VerificationParameters is null or empty"

    invoke-static {v6, v7}, Lzch;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v7, Lt1n;

    invoke-direct {v7, v4, v5, v6}, Lt1n;-><init>(Ljava/lang/String;Ljava/net/URL;Ljava/lang/String;)V

    invoke-static {v7}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p3
    :try_end_3f
    .catch Ljava/net/MalformedURLException; {:try_start_21 .. :try_end_3f} :catch_48

    invoke-static {v2, v0, p3, p2}, Lne5;->w(Lgd7;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)Lne5;

    move-result-object p2

    invoke-static {v1, p2}, Luio;->b(Ls9i;Lne5;)Luio;

    move-result-object p2

    goto :goto_4b

    :catch_48
    iget-object p2, p3, Lmzo;->c:Ljava/lang/String;

    move-object p2, v3

    :goto_4b
    if-nez p2, :cond_4e

    :cond_4d
    return-void

    :cond_4e
    invoke-virtual {p2, p1}, Luio;->d(Landroid/view/View;)V

    invoke-static {p2}, Lqe6;->K(Luio;)Lqe6;

    move-result-object p1

    iput-object p1, p0, Lsxo;->c:Lqe6;

    invoke-virtual {p2}, Luio;->e()V

    invoke-static {p2}, Lzy9;->J(Luio;)Lzy9;

    move-result-object p1

    iget-object p3, p1, Lzy9;->a:Ljava/lang/Object;

    check-cast p3, Luio;

    invoke-static {p3}, Lzch;->c(Luio;)V

    invoke-static {p3}, Lzch;->j(Luio;)V

    iget-boolean v0, p3, Luio;->j:Z

    if-nez v0, :cond_87

    iget-object v0, p3, Luio;->e:Lyp;

    sget-object v1, Lqii;->p:Lqii;

    invoke-virtual {v0}, Lyp;->g()Landroid/webkit/WebView;

    move-result-object v2

    iget-object v0, v0, Lyp;->a:Ljava/lang/String;

    filled-new-array {v3, v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v3, "publishLoadedEvent"

    invoke-virtual {v1, v2, v3, v0}, Lqii;->m(Landroid/webkit/WebView;Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 v0, 0x1

    iput-boolean v0, p3, Luio;->j:Z

    iput-object p1, p0, Lsxo;->b:Lzy9;

    iput-object p2, p0, Lsxo;->a:Luio;

    return-void

    :cond_87
    const-string p0, "Loaded event can only be sent once"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
