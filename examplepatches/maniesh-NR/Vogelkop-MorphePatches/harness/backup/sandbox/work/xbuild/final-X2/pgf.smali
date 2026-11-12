.class public final Lpgf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lb59;

.field public final b:Lk6l;

.field public final c:Lcom/opera/android/Lazy;

.field public final d:Lumi;

.field public final e:Lmu6;

.field public final f:Ldu3;

.field public g:Ljava/lang/String;

.field public final h:Lode;

.field public i:Loml;


# direct methods
.method public constructor <init>(Lk6l;Lcom/opera/android/Lazy;Lumi;Landroid/content/Context;Lmu6;Ldu3;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    iput-object v0, p0, Lpgf;->h:Lode;

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "open_in_app_count"

    invoke-static {p4, p3, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p4

    iput-object p4, p0, Lpgf;->a:Lb59;

    iput-object p1, p0, Lpgf;->b:Lk6l;

    iput-object p2, p0, Lpgf;->c:Lcom/opera/android/Lazy;

    iput-object p3, p0, Lpgf;->d:Lumi;

    iput-object p5, p0, Lpgf;->e:Lmu6;

    iput-object p6, p0, Lpgf;->f:Ldu3;

    new-instance p2, Lngf;

    invoke-direct {p2, p0}, Lngf;-><init>(Lpgf;)V

    invoke-virtual {p1, p2}, Lk6l;->c(Lj6l;)V

    new-instance p2, Lqz;

    const/16 p3, 0x10

    invoke-direct {p2, p0, p3}, Lqz;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lk6l;->a(La2l;)Lf6l;

    return-void
.end method


# virtual methods
.method public final a()Logf;
    .registers 3

    iget-object v0, p0, Lpgf;->h:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Logf;

    if-eqz v0, :cond_1f

    iget-object p0, p0, Lpgf;->b:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_1f

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->k0()Ljava/lang/String;

    move-result-object p0

    iget-object v1, v0, Logf;->a:Ljava/lang/String;

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1f

    return-object v0

    :cond_1f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final b(Lb2l;)V
    .registers 6

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->k0()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lpgf;->g:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_20

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    iget-object v0, p0, Lpgf;->i:Loml;

    const/4 v2, 0x0

    if-eqz v0, :cond_1b

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    iput-object v2, p0, Lpgf;->i:Loml;

    :cond_1b
    iget-object v0, p0, Lpgf;->h:Lode;

    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    :cond_20
    iput-object p1, p0, Lpgf;->g:Ljava/lang/String;

    sget-object v0, Lvqm;->a:Ljava/util/ArrayList;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lvqm;->c(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_33

    :cond_32
    return-void

    :cond_33
    new-instance v0, Lodf;

    const/4 v2, 0x1

    invoke-direct {v0, v2}, Lodf;-><init>(B)V

    iget-object v2, p0, Lpgf;->d:Lumi;

    invoke-virtual {v2, v0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v0

    new-instance v3, Lmgf;

    invoke-direct {v3, p0, p1, v1}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnml;->b(Lnml;)V

    invoke-virtual {v0, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    move-result-object p1

    iput-object p1, p0, Lpgf;->i:Loml;

    return-void
.end method

.method public final c(Lnl0;)V
    .registers 4

    iget-object p0, p0, Lpgf;->f:Ldu3;

    invoke-virtual {p0}, Ldu3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    check-cast p0, Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_f

    return-void

    :cond_f
    new-instance v0, Lo5f;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public final d(Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 7

    sget-object v0, Lvqm;->a:Ljava/util/ArrayList;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lvqm;->c(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_15

    const/4 p0, 0x0

    invoke-interface {p2, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_15
    iget-object v0, p0, Lpgf;->h:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Logf;

    if-eqz v0, :cond_2b

    iget-object v1, v0, Logf;->a:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2b

    invoke-interface {p2, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_2b
    new-instance v1, Lodf;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Lodf;-><init>(B)V

    iget-object p0, p0, Lpgf;->d:Lumi;

    invoke-virtual {p0, v1}, Lumi;->e(Ln5o;)Lnml;

    move-result-object v1

    new-instance v2, La32;

    const/16 v3, 0x15

    invoke-direct {v2, p1, p2, v0, v3}, La32;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v2}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v1, p0}, Lnml;->b(Lnml;)V

    invoke-virtual {v1, p1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method
