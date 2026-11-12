.class public final Lmbf;
.super Llim;
.source "SourceFile"

# interfaces
.implements Ly43;


# instance fields
.field public final a:Lk6l;

.field public final b:Lz43;

.field public final c:Lpde;

.field public final d:Lpde;

.field public final e:Lpde;

.field public final f:Lpde;

.field public g:Ltk0;

.field public h:Z


# direct methods
.method public constructor <init>(Lk6l;Lz43;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmbf;->a:Lk6l;

    iput-object p2, p0, Lmbf;->b:Lz43;

    new-instance p2, Lpde;

    iget-object v0, p0, Lmbf;->g:Ltk0;

    if-nez v0, :cond_16

    iget-boolean v0, p0, Lmbf;->h:Z

    if-eqz v0, :cond_14

    sget-object v0, Ltk0;->d:Ltk0;

    goto :goto_16

    :cond_14
    sget-object v0, Ltk0;->e:Ltk0;

    :cond_16
    :goto_16
    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lmbf;->c:Lpde;

    new-instance p2, Lpde;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lmbf;->d:Lpde;

    new-instance p2, Lpde;

    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lmbf;->e:Lpde;

    new-instance p2, Lpde;

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-direct {p2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lmbf;->f:Lpde;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_3e

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result p1

    goto :goto_3f

    :cond_3e
    const/4 p1, 0x0

    :goto_3f
    iput-boolean p1, p0, Lmbf;->h:Z

    return-void
.end method


# virtual methods
.method public final O(Lx43;)V
    .registers 2

    iget-object p1, p0, Lmbf;->g:Ltk0;

    if-nez p1, :cond_d

    iget-boolean p1, p0, Lmbf;->h:Z

    if-eqz p1, :cond_b

    sget-object p1, Ltk0;->d:Ltk0;

    goto :goto_d

    :cond_b
    sget-object p1, Ltk0;->e:Ltk0;

    :cond_d
    :goto_d
    iget-object p0, p0, Lmbf;->c:Lpde;

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final R(Lb2l;)V
    .registers 3

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->n0()Z

    move-result p1

    iput-boolean p1, p0, Lmbf;->h:Z

    iget-object v0, p0, Lmbf;->g:Ltk0;

    if-nez v0, :cond_13

    if-eqz p1, :cond_11

    sget-object v0, Ltk0;->d:Ltk0;

    goto :goto_13

    :cond_11
    sget-object v0, Ltk0;->e:Ltk0;

    :cond_13
    :goto_13
    iget-object p0, p0, Lmbf;->c:Lpde;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final W(Lndc;)V
    .registers 6

    iget-object v0, p0, Lmbf;->a:Lk6l;

    iget-object v0, v0, Lk6l;->w:Lxg;

    new-instance v1, Lqz;

    const/16 v2, 0xf

    invoke-direct {v1, p0, v2}, Lqz;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lvme;

    const/16 v3, 0x13

    invoke-direct {v2, v3}, Lvme;-><init>(B)V

    invoke-static {v0, p1, v1, v2}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object p1, p0, Lmbf;->b:Lz43;

    if-eqz p1, :cond_20

    iget-object p1, p1, Lz43;->h:Ljava/lang/Object;

    check-cast p1, Li7f;

    invoke-virtual {p1, p0}, Li7f;->b(Ljava/lang/Object;)Z

    :cond_20
    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p1, p0, Lmbf;->b:Lz43;

    if-eqz p1, :cond_12

    iget-object p1, p1, Lz43;->h:Ljava/lang/Object;

    check-cast p1, Li7f;

    invoke-virtual {p1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    :cond_12
    return-void
.end method
