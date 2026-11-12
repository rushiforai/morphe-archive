.class public final Lwbf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lj7h;

.field public final b:I

.field public final c:Llqm;

.field public final d:Llbf;

.field public final e:Ljava/lang/String;

.field public final f:Leri;

.field public final g:Z

.field public final h:Z

.field public final synthetic i:Lxbf;


# direct methods
.method public constructor <init>(Lxbf;Lj7h;ILlqm;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwbf;->i:Lxbf;

    iput-object p2, p0, Lwbf;->a:Lj7h;

    iput p3, p0, Lwbf;->b:I

    iput-object p4, p0, Lwbf;->c:Llqm;

    iget-object p2, p1, Lxbf;->b:Ljava/lang/Object;

    check-cast p2, Lesk;

    invoke-interface {p2}, Lesk;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Leri;

    iput-object p2, p0, Lwbf;->f:Leri;

    iget-object p2, p1, Lxbf;->c:Ljava/lang/Object;

    check-cast p2, Lesk;

    invoke-interface {p2}, Lesk;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    invoke-static {p2}, Lwqm;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p4

    if-nez p4, :cond_29

    const/4 v0, 0x1

    goto :goto_2a

    :cond_29
    const/4 v0, 0x0

    :goto_2a
    iput-boolean v0, p0, Lwbf;->g:Z

    const-string v0, "http"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p4

    iput-boolean p4, p0, Lwbf;->h:Z

    invoke-static {p2}, Lcom/opera/android/browser/UrlMangler;->e(Ljava/lang/String;)Z

    move-result p4

    if-nez p4, :cond_53

    iget-object v0, p1, Lxbf;->d:Ljava/lang/Object;

    check-cast v0, Lesk;

    invoke-interface {v0}, Lesk;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lyl2;

    if-eqz v0, :cond_53

    invoke-interface {v0, p2}, Lyl2;->j(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_50

    invoke-interface {v0}, Lyl2;->h()Ljava/lang/String;

    move-result-object p2

    :cond_50
    invoke-interface {v0}, Lyl2;->c()V

    :cond_53
    invoke-static {p2}, Laik;->t(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lmdb;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p3, :cond_6e

    if-nez p4, :cond_6e

    iget-object p1, p1, Lxbf;->f:Ljava/lang/Object;

    check-cast p1, Lkotlin/jvm/functions/Function1;

    invoke-interface {p1, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Llbf;

    goto :goto_70

    :cond_6e
    sget-object p1, Llbf;->c:Llbf;

    :goto_70
    iput-object p1, p0, Lwbf;->d:Llbf;

    iput-object p2, p0, Lwbf;->e:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lwbf;->d:Llbf;

    sget-object v1, Llbf;->d:Llbf;

    iget-object p0, p0, Lwbf;->e:Ljava/lang/String;

    if-ne v0, v1, :cond_10

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p0}, LJ/N;->MFm_rV1m(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    :cond_10
    return-object p0
.end method

.method public final b()V
    .registers 14

    iget-object v0, p0, Lwbf;->i:Lxbf;

    iget-object v0, v0, Lxbf;->g:Ljava/lang/Object;

    check-cast v0, Ldbf;

    invoke-virtual {p0}, Lwbf;->a()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Ldbf;->q:Lgbf;

    iget-object v2, v2, Lgbf;->s:Lay;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzqi;

    iget-object v3, v3, Lzqi;->b:Lmrk;

    invoke-virtual {v3}, Lmrk;->d()Z

    move-result v3

    iget-object v4, p0, Lwbf;->c:Llqm;

    if-eqz v3, :cond_6e

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzqi;

    iget-object v2, v2, Lzqi;->b:Lmrk;

    iget-object v3, v2, Lmrk;->h:Liv7;

    iget-object v5, v2, Lmrk;->b:Landroid/view/ViewGroup;

    invoke-static {v1}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_36

    invoke-virtual {v3}, Liv7;->b()Z

    move-result v1

    if-eqz v1, :cond_48

    :cond_36
    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lz5i;->r0(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_48

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lz5i;->v0(Landroid/content/Context;)V

    return-void

    :cond_48
    iget-object v1, v2, Lmrk;->Q:Lpvb;

    if-eqz v1, :cond_6e

    sget-object v5, Llqm;->a:Llqm;

    if-ne v4, v5, :cond_6e

    invoke-interface {v1}, Lpvb;->a()Z

    move-result v5

    if-nez v5, :cond_64

    iget-object v3, v3, Liv7;->k:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_6e

    :cond_64
    invoke-interface {v1}, Lpvb;->a()Z

    move-result p0

    iput-boolean p0, v2, Lmrk;->U:Z

    invoke-interface {v1}, Lpvb;->f()V

    return-void

    :cond_6e
    iget-object v0, v0, Ldbf;->q:Lgbf;

    iget-object v1, v0, Lgbf;->g:Lyz9;

    iget-object v2, v0, Lgbf;->s:Lay;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzqi;

    iget-object v3, v3, Lzqi;->b:Lmrk;

    invoke-virtual {v3}, Lmrk;->d()Z

    move-result v3

    iget-object v5, p0, Lwbf;->d:Llbf;

    const/4 v6, 0x3

    const/4 v7, 0x2

    const/4 v8, 0x0

    const/4 v9, 0x1

    if-eqz v3, :cond_109

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lzqi;

    iget-object v2, v2, Lzqi;->b:Lmrk;

    sget-object v3, Llbf;->c:Llbf;

    if-ne v5, v3, :cond_96

    move v3, v9

    goto :goto_97

    :cond_96
    move v3, v8

    :goto_97
    iput-boolean v3, v2, Lmrk;->U:Z

    iget-object v3, v2, Lmrk;->G:Lrv7;

    iget-object v10, v2, Lmrk;->S:Ljava/lang/Integer;

    invoke-virtual {v3, v5, v10}, Lrv7;->b(Llbf;Ljava/lang/Integer;)V

    iget-object v2, v2, Lmrk;->N:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Loqk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lqkk;->b:Lqkk;

    iget-object v10, p0, Lwbf;->a:Lj7h;

    invoke-virtual {v10, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d3

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_ce

    if-eq v3, v9, :cond_cb

    if-eq v3, v7, :cond_c8

    if-ne v3, v6, :cond_c4

    sget-object v3, Lcl0;->g:Lcl0;

    goto :goto_d0

    :cond_c4
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_c8
    sget-object v3, Lcl0;->d:Lcl0;

    goto :goto_d0

    :cond_cb
    sget-object v3, Lcl0;->c:Lcl0;

    goto :goto_d0

    :cond_ce
    sget-object v3, Lcl0;->b:Lcl0;

    :goto_d0
    iput-object v3, v2, Loqk;->d:Lcl0;

    goto :goto_109

    :cond_d3
    instance-of v3, v10, Lpkk;

    if-eqz v3, :cond_ed

    check-cast v10, Lpkk;

    iget-object v3, v10, Lpkk;->b:Ltaf;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eq v3, v9, :cond_e8

    if-ne v3, v7, :cond_109

    sget-object v3, Lcl0;->e:Lcl0;

    iput-object v3, v2, Loqk;->d:Lcl0;

    goto :goto_109

    :cond_e8
    sget-object v3, Lcl0;->f:Lcl0;

    iput-object v3, v2, Loqk;->d:Lcl0;

    goto :goto_109

    :cond_ed
    sget-object v2, Lrkk;->b:Lrkk;

    invoke-virtual {v10, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_109

    sget-object v2, Lskk;->b:Lskk;

    invoke-virtual {v10, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_109

    sget-object v2, Ltkk;->b:Ltkk;

    invoke-virtual {v10, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_109

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_109
    :goto_109
    invoke-virtual {v0, v8}, Lgbf;->m(Z)V

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    if-eq v2, v9, :cond_141

    if-eq v2, v7, :cond_117

    if-eq v2, v6, :cond_141

    return-void

    :cond_117
    iget v2, p0, Lwbf;->b:I

    if-nez v2, :cond_11d

    iget v2, v0, Lgbf;->y:I

    :cond_11d
    move v5, v2

    if-nez v5, :cond_131

    invoke-virtual {p0}, Lwbf;->a()Ljava/lang/String;

    move-result-object v7

    iget-boolean v9, v0, Lgbf;->x:Z

    iget-object v6, v1, Lyz9;->a:Lwth;

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v8, 0x6

    iget-object v12, p0, Lwbf;->f:Leri;

    invoke-virtual/range {v6 .. v12}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    return-void

    :cond_131
    invoke-virtual {p0}, Lwbf;->a()Ljava/lang/String;

    move-result-object v4

    iget-boolean v6, v0, Lgbf;->x:Z

    iget-object v3, v1, Lyz9;->a:Lwth;

    const/4 v7, 0x1

    const/4 v8, 0x0

    iget-object v9, p0, Lwbf;->f:Leri;

    invoke-virtual/range {v3 .. v9}, Lwth;->K(Ljava/lang/String;IZIZLeri;)V

    return-void

    :cond_141
    invoke-virtual {p0}, Lwbf;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, v4, v8}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput-byte v9, v0, Lvx3;->o:B

    iget-boolean v1, p0, Lwbf;->g:Z

    iput-boolean v1, v0, Lvx3;->m:Z

    iget-boolean p0, p0, Lwbf;->h:Z

    iput-boolean p0, v0, Lvx3;->n:Z

    invoke-static {v0}, Lam2;->v(Lvx3;)V

    return-void
.end method
