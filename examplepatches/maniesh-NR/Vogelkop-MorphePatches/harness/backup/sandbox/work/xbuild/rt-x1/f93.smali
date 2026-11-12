.class public final Lf93;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk7j;
.implements Lq8j;
.implements Lxla;


# instance fields
.field public final a:Lisd;

.field public b:Z

.field public c:Ll0c;

.field public d:Ljava/lang/String;

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:Z

.field public final synthetic i:Lg93;


# direct methods
.method public constructor <init>(Lg93;Lisd;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lf93;->i:Lg93;

    iput-object p2, p0, Lf93;->a:Lisd;

    iget-object p1, p1, Lg93;->k:Lta7;

    new-instance p2, Lfv2;

    const/16 v0, 0x8

    invoke-direct {p2, p0, v0}, Lfv2;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p1, Lta7;->l:Ljava/lang/Object;

    check-cast p0, Lnrl;

    invoke-virtual {p0, p2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 1

    iget-object p0, p0, Lf93;->i:Lg93;

    invoke-virtual {p0}, Lt7j;->c()V

    return-void
.end method

.method public final b()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lf93;->h:Z

    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Ll1c;

    iget-boolean v0, p0, Lf93;->h:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x0

    iput-boolean v0, p0, Lf93;->b:Z

    if-nez p1, :cond_14

    const/4 p1, 0x1

    iput-boolean p1, p0, Lf93;->h:Z

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lf93;->d(Ld93;)V

    return-void

    :cond_14
    iget-object v0, p1, Ll1c;->c:Ll0c;

    iput-object v0, p0, Lf93;->c:Ll0c;

    iget-boolean p1, p1, Ll1c;->d:Z

    if-eqz p1, :cond_2a

    iget-object p1, p0, Lf93;->i:Lg93;

    iget-object p1, p1, Lg93;->k:Lta7;

    invoke-virtual {p1}, Lta7;->r()Lyla;

    move-result-object p1

    if-eqz p1, :cond_2a

    iget-object p1, p1, Lyla;->e:Ll0c;

    iput-object p1, p0, Lf93;->c:Ll0c;

    :cond_2a
    new-instance p1, Lig;

    const/16 v0, 0x9

    invoke-direct {p1, p0, v0}, Lig;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final d(Ld93;)V
    .registers 10

    iget-boolean v0, p0, Lf93;->h:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    if-eqz p1, :cond_2e

    iget-object v0, p0, Lf93;->i:Lg93;

    iget-object v0, v0, Lg93;->r:Loue;

    iget-object v1, p1, Ld93;->a:Lyla;

    iget-object v1, v1, Lyla;->b:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    iget-object v3, v0, Loue;->a:Lnv6;

    sget-wide v5, Loue;->b:J

    invoke-virtual {v1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2e

    iget-object v0, v3, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Lpd7;

    new-instance v2, Lni2;

    const/4 v7, 0x3

    invoke-direct/range {v2 .. v7}, Lni2;-><init>(Ljava/lang/Object;Ljava/lang/Object;JB)V

    invoke-virtual {v0, v2}, Lldk;->f(Ljava/lang/Runnable;)V

    :cond_2e
    iget-object p0, p0, Lf93;->a:Lisd;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_37

    const/4 v0, 0x1

    goto :goto_38

    :cond_37
    const/4 v0, 0x0

    :goto_38
    invoke-virtual {p0, p1, v0}, Lisd;->E(Ljava/lang/Object;Z)V

    return-void
.end method

.method public final e()V
    .registers 10

    iget-object v0, p0, Lf93;->c:Ll0c;

    const/4 v1, 0x1

    iget-object v2, p0, Lf93;->i:Lg93;

    if-nez v0, :cond_14

    iget-object v0, v2, Lg93;->k:Lta7;

    invoke-virtual {v0}, Lta7;->r()Lyla;

    move-result-object v0

    if-eqz v0, :cond_d1

    iget v0, v0, Lyla;->c:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_d1

    :cond_14
    iget-boolean v0, p0, Lf93;->g:Z

    if-nez v0, :cond_24

    iget-object v0, v2, Lg93;->q:Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lf93;->d:Ljava/lang/String;

    iput-boolean v1, p0, Lf93;->g:Z

    :cond_24
    iget-boolean v0, p0, Lf93;->f:Z

    if-nez v0, :cond_7a

    iget-object v0, v2, Lg93;->k:Lta7;

    invoke-virtual {v0}, Lta7;->r()Lyla;

    move-result-object v0

    if-eqz v0, :cond_4e

    iget-object v3, v2, Lg93;->n:Lfue;

    invoke-virtual {v3}, Lfue;->d()V

    iget-object v3, v3, Lfue;->a:Lcue;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-ne v3, v1, :cond_7a

    iget-object v3, p0, Lf93;->c:Ll0c;

    if-eqz v3, :cond_49

    iget-object v4, v0, Lyla;->e:Ll0c;

    invoke-virtual {v3, v4}, Ll0c;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4e

    :cond_49
    iget v0, v0, Lyla;->c:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_7a

    :cond_4e
    iget-boolean v0, p0, Lf93;->e:Z

    if-nez v0, :cond_d5

    iput-boolean v1, p0, Lf93;->e:Z

    iget-object v0, v2, Lg93;->l:Ls9i;

    iget-object v6, p0, Lf93;->c:Ll0c;

    iget-object v1, v2, Lg93;->o:Lvx;

    invoke-virtual {v1}, Lvx;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Li4d;

    iget-object v1, v1, Li4d;->b:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Landroid/net/Uri;

    iget-object v8, p0, Lf93;->d:Ljava/lang/String;

    new-instance v3, Lx79;

    iget-object v1, v0, Ls9i;->b:Ljava/lang/Object;

    move-object v4, v1

    check-cast v4, Landroid/content/Context;

    iget-object v0, v0, Ls9i;->c:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lga6;

    invoke-direct/range {v3 .. v8}, Lx79;-><init>(Landroid/content/Context;Lywh;Ll0c;Landroid/net/Uri;Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Lx79;->U(Lxla;)V

    return-void

    :cond_7a
    iget-object v0, v2, Lg93;->k:Lta7;

    invoke-virtual {v0}, Lta7;->r()Lyla;

    move-result-object v0

    iget-boolean v1, v0, Lyla;->d:Z

    if-eqz v1, :cond_af

    iget-object v1, v2, Lg93;->l:Ls9i;

    iget-object v6, p0, Lf93;->c:Ll0c;

    iget-object v3, v2, Lg93;->o:Lvx;

    invoke-virtual {v3}, Lvx;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Li4d;

    iget-object v3, v3, Li4d;->b:Ljava/lang/Object;

    move-object v7, v3

    check-cast v7, Landroid/net/Uri;

    iget-object v8, p0, Lf93;->d:Ljava/lang/String;

    new-instance v3, Lx79;

    iget-object v4, v1, Ls9i;->b:Ljava/lang/Object;

    check-cast v4, Landroid/content/Context;

    iget-object v1, v1, Ls9i;->c:Ljava/lang/Object;

    move-object v5, v1

    check-cast v5, Lga6;

    invoke-direct/range {v3 .. v8}, Lx79;-><init>(Landroid/content/Context;Lywh;Ll0c;Landroid/net/Uri;Ljava/lang/String;)V

    new-instance v1, Lxj;

    const/16 v4, 0x13

    invoke-direct {v1, p0, v0, v4}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v1}, Lx79;->U(Lxla;)V

    :cond_af
    iget-object v1, v2, Lg93;->p:Ljtg;

    iget-boolean v2, v2, Lg93;->s:Z

    iget-object v3, p0, Lf93;->d:Ljava/lang/String;

    invoke-virtual {v1}, Ljtg;->b()Z

    move-result v1

    if-eqz v1, :cond_c3

    if-eqz v2, :cond_c3

    const-wide v1, 0x241000000220209L

    goto :goto_c8

    :cond_c3
    const-wide v1, 0x240000000220209L

    :goto_c8
    new-instance v4, Ld93;

    invoke-direct {v4, v0, v1, v2, v3}, Ld93;-><init>(Lyla;JLjava/lang/String;)V

    invoke-virtual {p0, v4}, Lf93;->d(Ld93;)V

    return-void

    :cond_d1
    iget-boolean v0, p0, Lf93;->b:Z

    if-eqz v0, :cond_d6

    :cond_d5
    return-void

    :cond_d6
    iput-boolean v1, p0, Lf93;->b:Z

    iget-object v0, v2, Lg93;->m:Lp1c;

    invoke-virtual {v0, p0}, Lt7j;->b(Lq8j;)V

    return-void
.end method

.method public final f(Lyla;)V
    .registers 4

    iget-boolean v0, p0, Lf93;->h:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lf93;->f:Z

    iget-object v0, p0, Lf93;->i:Lg93;

    if-nez p1, :cond_14

    iget-object p1, v0, Lg93;->j:Landroid/content/Context;

    iget-object v1, p0, Lf93;->c:Ll0c;

    invoke-static {p1, v1}, Laib;->H(Landroid/content/Context;Ll0c;)Lyla;

    move-result-object p1

    :cond_14
    iget-object v0, v0, Lg93;->k:Lta7;

    invoke-virtual {v0, p1}, Lta7;->A(Lyla;)V

    invoke-virtual {p0}, Lf93;->e()V

    return-void
.end method
