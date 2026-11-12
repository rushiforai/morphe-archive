.class public final Lex0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lndc;

.field public final b:Lj4c;

.field public final c:Lk6l;

.field public final d:Lpde;

.field public final e:Lpde;

.field public f:Lqdc;

.field public final g:Ldx0;

.field public h:Lpde;

.field public final i:Lk9;


# direct methods
.method public constructor <init>(Lndc;Lj4c;Lk6l;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lex0;->a:Lndc;

    iput-object p2, p0, Lex0;->b:Lj4c;

    iput-object p3, p0, Lex0;->c:Lk6l;

    new-instance v0, Lpde;

    sget-object v1, Ll08;->a:Ll08;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lex0;->d:Lpde;

    new-instance v0, Lpde;

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lex0;->e:Lpde;

    new-instance v0, Ldx0;

    invoke-direct {v0, p0}, Ldx0;-><init>(Lex0;)V

    iput-object v0, p0, Lex0;->g:Ldx0;

    new-instance v0, Lk9;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Lk9;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lex0;->i:Lk9;

    new-instance v0, Lbx0;

    invoke-direct {v0, p0}, Lbx0;-><init>(Lex0;)V

    new-instance v1, Lax0;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lax0;-><init>(Lex0;B)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-static {p2, v2, v0, v1}, Lz5i;->e0(Lcom/opera/android/Lazy;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    new-instance p2, Lcx0;

    invoke-direct {p2, p0}, Lcx0;-><init>(Lex0;)V

    new-instance v0, Lax0;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lax0;-><init>(Lex0;B)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-static {p3, p0, p2, v0}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Lex0;->c:Lk6l;

    invoke-virtual {v0}, Lk6l;->A()Lb2l;

    move-result-object v0

    iget-object v1, p0, Lex0;->f:Lqdc;

    const/4 v2, 0x0

    if-eqz v1, :cond_e

    iget-object v1, v1, Lqdc;->i:Lqcc;

    goto :goto_f

    :cond_e
    move-object v1, v2

    :goto_f
    sget-object v3, Lqcc;->e:Lqcc;

    if-ne v1, v3, :cond_23

    iget-object v1, p0, Lex0;->b:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb22;

    invoke-virtual {v1, v0}, Lx22;->g(Lb2l;)Lv22;

    move-result-object v0

    if-eqz v0, :cond_23

    iget-object v2, v0, Lv22;->d:Lpde;

    :cond_23
    iget-object v0, p0, Lex0;->h:Lpde;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2c

    return-void

    :cond_2c
    iget-object v0, p0, Lex0;->h:Lpde;

    iget-object v1, p0, Lex0;->i:Lk9;

    if-eqz v0, :cond_35

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    :cond_35
    iput-object v2, p0, Lex0;->h:Lpde;

    if-eqz v2, :cond_3f

    iget-object p0, p0, Lex0;->a:Lndc;

    invoke-virtual {v2, p0, v1}, Lekc;->j(Lndc;Lf7f;)V

    return-void

    :cond_3f
    sget-object v0, Ll08;->a:Ll08;

    iget-object v1, p0, Lex0;->d:Lpde;

    invoke-static {v1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p0, p0, Lex0;->e:Lpde;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()V
    .registers 4

    iget-object v0, p0, Lex0;->c:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    iget-object v2, p0, Lex0;->b:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb22;

    invoke-virtual {v2, v0}, Lx22;->g(Lb2l;)Lv22;

    move-result-object v0

    if-eqz v0, :cond_17

    iget-object v1, v0, Lv22;->f:Lqdc;

    :cond_17
    iget-object v0, p0, Lex0;->f:Lqdc;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    return-void

    :cond_20
    iget-object v0, p0, Lex0;->f:Lqdc;

    iget-object v2, p0, Lex0;->g:Ldx0;

    if-eqz v0, :cond_29

    invoke-virtual {v0, v2}, Lqdc;->b(Lmdc;)V

    :cond_29
    iput-object v1, p0, Lex0;->f:Lqdc;

    if-eqz v1, :cond_30

    invoke-virtual {v1, v2}, Lqdc;->a(Lmdc;)V

    :cond_30
    invoke-virtual {p0}, Lex0;->a()V

    return-void
.end method
