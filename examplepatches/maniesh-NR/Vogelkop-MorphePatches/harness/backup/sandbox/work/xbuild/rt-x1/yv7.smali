.class public final Lyv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lupm;


# instance fields
.field public final a:Lfe5;

.field public final b:Landroid/content/Context;

.field public final c:Lhz4;

.field public final d:Liv7;

.field public final e:Lqv7;

.field public final f:Llv7;

.field public final g:Llv7;

.field public final h:Ligi;

.field public final i:Lpde;

.field public final j:Lxbf;

.field public final k:Lz61;

.field public l:Lcom/opera/android/widget/UrlFieldEditText;

.field public m:Z

.field public final n:Lxv7;

.field public final o:Lxpm;

.field public final p:Lm0a;

.field public q:Lbn7;


# direct methods
.method public constructor <init>(Lfe5;Landroid/content/Context;Lhz4;Liv7;Lqv7;Llv7;Llv7;Ligi;Lki;Lx5f;)V
    .registers 25

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyv7;->a:Lfe5;

    iput-object v1, p0, Lyv7;->b:Landroid/content/Context;

    iput-object v2, p0, Lyv7;->c:Lhz4;

    iput-object v3, p0, Lyv7;->d:Liv7;

    move-object/from16 v4, p5

    iput-object v4, p0, Lyv7;->e:Lqv7;

    move-object/from16 v4, p6

    iput-object v4, p0, Lyv7;->f:Llv7;

    move-object/from16 v4, p7

    iput-object v4, p0, Lyv7;->g:Llv7;

    move-object/from16 v4, p8

    iput-object v4, p0, Lyv7;->h:Ligi;

    new-instance v4, Lpde;

    new-instance v5, Luv7;

    sget-object v7, Llbf;->a:Llbf;

    sget-object v8, Lvv7;->b:Lvv7;

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Luv7;-><init>(ZLlbf;Lvv7;Lyl2;Lpvb;)V

    invoke-direct {v4, v5}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v4, p0, Lyv7;->i:Lpde;

    new-instance v4, Lz61;

    const/16 v5, 0x8

    invoke-direct {v4, p0, v5}, Lz61;-><init>(Ljava/lang/Object;B)V

    iput-object v4, p0, Lyv7;->k:Lz61;

    new-instance v4, Lcom/opera/android/widget/UrlFieldEditText;

    invoke-direct {v4, v1}, Lcom/opera/android/widget/UrlFieldEditText;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v4, v3, Liv7;->k:Lpde;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    const/4 v5, 0x1

    xor-int/2addr v4, v5

    iput-boolean v4, p0, Lyv7;->m:Z

    new-instance v4, Lxv7;

    invoke-direct {v4, p0}, Lxv7;-><init>(Lyv7;)V

    iput-object v4, p0, Lyv7;->n:Lxv7;

    new-instance v4, Lxpm;

    iget-object v6, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-direct {v4, v6}, Lxpm;-><init>(Lcom/opera/android/widget/UrlFieldEditText;)V

    iput-object v4, p0, Lyv7;->o:Lxpm;

    iget-object v4, v2, Lhz4;->c:Ljava/lang/Object;

    check-cast v4, Ld8e;

    invoke-virtual {v4}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lm0a;

    iput-object v4, p0, Lyv7;->p:Lm0a;

    new-instance v6, Lxbf;

    new-instance v7, Lsv7;

    const/4 v8, 0x0

    invoke-direct {v7, p0, v8}, Lsv7;-><init>(Lyv7;B)V

    new-instance v9, Lsv7;

    invoke-direct {v9, p0, v5}, Lsv7;-><init>(Lyv7;B)V

    move-object v10, v9

    new-instance v9, Lsv7;

    const/4 v13, 0x2

    invoke-direct {v9, p0, v13}, Lsv7;-><init>(Lyv7;B)V

    move-object v11, v10

    new-instance v10, Ltv7;

    invoke-direct {v10, p0, v8}, Ltv7;-><init>(Lyv7;B)V

    iget-object v2, v2, Lhz4;->f:Ljava/lang/Object;

    move-object v12, v2

    check-cast v12, Ldbf;

    move-object v8, v11

    move-object/from16 v11, p9

    invoke-direct/range {v6 .. v12}, Lxbf;-><init>(Lesk;Lesk;Lesk;Lkotlin/jvm/functions/Function1;Lesk;Ldbf;)V

    iput-object v6, p0, Lyv7;->j:Lxbf;

    iget-object v2, v3, Liv7;->f:Lpde;

    new-instance v6, Ltv7;

    invoke-direct {v6, p0, v5}, Ltv7;-><init>(Lyv7;B)V

    new-instance v5, Lug;

    const/16 v7, 0x15

    invoke-direct {v5, v6, v7}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, p1, v5}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v2, v3, Liv7;->k:Lpde;

    new-instance v3, Ltv7;

    invoke-direct {v3, p0, v13}, Ltv7;-><init>(Lyv7;B)V

    new-instance v5, Lug;

    invoke-direct {v5, v3, v7}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, p1, v5}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v2, v4, Lm0a;->e:Lpde;

    new-instance v3, Ltv7;

    const/4 v4, 0x3

    invoke-direct {v3, p0, v4}, Ltv7;-><init>(Lyv7;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v3, v7}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, p1, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    const v2, 0x7f141339

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/OperaEditText;->g(Ljava/lang/String;)V

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    move-object/from16 v0, p10

    iput-object v0, p0, Lcom/opera/android/widget/UrlFieldEditText;->z:Lx5f;

    return-void
.end method

.method public static d(Lyv7;Llbf;Lyl2;Lpvb;I)Lvv7;
    .registers 7

    iget-object v0, p0, Lyv7;->i:Lpde;

    and-int/lit8 v1, p4, 0x1

    if-eqz v1, :cond_e

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Luv7;

    iget-object p1, p1, Luv7;->b:Llbf;

    :cond_e
    and-int/lit8 v1, p4, 0x2

    if-eqz v1, :cond_1a

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Luv7;

    iget-object p2, p2, Luv7;->d:Lyl2;

    :cond_1a
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_26

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Luv7;

    iget-object p3, p3, Luv7;->e:Lpvb;

    :cond_26
    iget-object p4, p0, Lyv7;->d:Liv7;

    sget-object v0, Llbf;->a:Llbf;

    if-ne p1, v0, :cond_2f

    sget-object p0, Lvv7;->b:Lvv7;

    return-object p0

    :cond_2f
    invoke-virtual {p4}, Liv7;->b()Z

    move-result v0

    if-eqz v0, :cond_38

    sget-object p0, Lvv7;->d:Lvv7;

    return-object p0

    :cond_38
    iget-object p0, p0, Lyv7;->p:Lm0a;

    iget-object p0, p0, Lm0a;->e:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ll0a;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p4, Liv7;->k:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    const/4 p4, 0x0

    if-eqz p2, :cond_59

    invoke-interface {p2}, Lyl2;->a()Z

    move-result v0

    goto :goto_5a

    :cond_59
    move v0, p4

    :goto_5a
    if-eqz p3, :cond_61

    invoke-interface {p3}, Lpvb;->a()Z

    move-result v1

    goto :goto_62

    :cond_61
    move v1, p4

    :goto_62
    if-nez p0, :cond_8f

    if-nez v0, :cond_8f

    if-nez v1, :cond_8f

    const/4 p0, 0x1

    if-eqz p2, :cond_73

    invoke-interface {p2}, Lyl2;->a()Z

    move-result p2

    if-nez p2, :cond_73

    move p2, p0

    goto :goto_74

    :cond_73
    move p2, p4

    :goto_74
    if-eqz p3, :cond_7d

    invoke-interface {p3}, Lpvb;->a()Z

    move-result p3

    if-nez p3, :cond_7d

    move p4, p0

    :cond_7d
    if-nez p2, :cond_8c

    if-nez p4, :cond_8c

    sget-object p0, Llbf;->b:Llbf;

    if-eq p1, p0, :cond_8c

    sget-object p0, Llbf;->d:Llbf;

    if-eq p1, p0, :cond_8c

    sget-object p0, Lvv7;->c:Lvv7;

    return-object p0

    :cond_8c
    sget-object p0, Lvv7;->a:Lvv7;

    return-object p0

    :cond_8f
    sget-object p0, Lvv7;->c:Lvv7;

    return-object p0
.end method


# virtual methods
.method public final a()Lwpm;
    .registers 1

    iget-object p0, p0, Lyv7;->o:Lxpm;

    return-object p0
.end method

.method public final b()V
    .registers 2

    iget-object v0, p0, Lyv7;->h:Ligi;

    invoke-virtual {v0}, Ligi;->v0()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lyv7;->m(Z)V

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    return-void
.end method

.method public final c()V
    .registers 2

    const-string v0, ""

    invoke-virtual {p0, v0}, Lyv7;->k(Ljava/lang/String;)V

    iget-object p0, p0, Lyv7;->e:Lqv7;

    invoke-virtual {p0}, Lqv7;->invoke()Ljava/lang/Object;

    return-void
.end method

.method public final e(I)Z
    .registers 2

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/OperaEditText;->f(I)Z

    move-result p0

    return p0
.end method

.method public final f()V
    .registers 1

    iget-object p0, p0, Lyv7;->h:Ligi;

    invoke-virtual {p0}, Ligi;->y0()V

    return-void
.end method

.method public final g()Lxbf;
    .registers 1

    iget-object p0, p0, Lyv7;->j:Lxbf;

    return-object p0
.end method

.method public final h()V
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lyv7;->m(Z)V

    return-void
.end method

.method public final i()Z
    .registers 1

    iget-object p0, p0, Lyv7;->h:Ligi;

    invoke-virtual {p0}, Ligi;->O()Z

    move-result p0

    return p0
.end method

.method public final j(Lpvb;)V
    .registers 11

    iget-object v0, p0, Lyv7;->i:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Luv7;

    const/4 v1, 0x0

    const/4 v3, 0x3

    invoke-static {p0, v1, v1, p1, v3}, Lyv7;->d(Lyv7;Llbf;Lyl2;Lpvb;I)Lvv7;

    move-result-object v5

    const/4 v6, 0x0

    const/16 v8, 0xb

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v7, p1

    invoke-static/range {v2 .. v8}, Luv7;->a(Luv7;ZLlbf;Lvv7;Lyl2;Lpvb;I)Luv7;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final k(Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    const/4 v1, 0x2

    const/4 v2, 0x0

    invoke-virtual {v0, p1, p1, v1, v2}, Lcom/opera/android/widget/UrlFieldEditText;->B(Ljava/lang/CharSequence;Ljava/lang/String;II)V

    iget-object p1, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Landroid/widget/TextView;->length()I

    move-result p0

    invoke-static {p1, p0}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    return-void
.end method

.method public final l(Ljava/lang/CharSequence;)Llbf;
    .registers 3

    invoke-static {p1}, Laik;->t(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_11

    sget-object p0, Llbf;->a:Llbf;

    return-object p0

    :cond_11
    iget-object v0, p0, Lyv7;->d:Liv7;

    iget-object v0, v0, Liv7;->k:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_49

    iget-object p0, p0, Lyv7;->c:Lhz4;

    iget-object p0, p0, Lhz4;->o:Ljava/lang/Object;

    check-cast p0, Lxnh;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lwnh;->b(I)Z

    move-result p0

    if-nez p0, :cond_43

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p0}, LJ/N;->Mhh3b1$p(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_43

    sget-object p0, Llbf;->d:Llbf;

    return-object p0

    :cond_43
    invoke-static {p1}, Lwqm;->x(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4c

    :cond_49
    sget-object p0, Llbf;->c:Llbf;

    return-object p0

    :cond_4c
    sget-object p0, Llbf;->b:Llbf;

    return-object p0
.end method

.method public final m(Z)V
    .registers 3

    iget-object v0, p0, Lyv7;->q:Lbn7;

    if-eqz v0, :cond_a

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lyv7;->q:Lbn7;

    :cond_a
    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    if-eqz p1, :cond_20

    invoke-static {v0}, Lq9n;->H(Landroid/view/View;)Z

    move-result p1

    if-nez p1, :cond_1f

    new-instance p1, Lbn7;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lbn7;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lyv7;->q:Lbn7;

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_1f
    return-void

    :cond_20
    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    return-void
.end method

.method public final n()V
    .registers 9

    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v0

    iget-object v1, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    if-eqz v0, :cond_f

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_17

    :cond_f
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_17
    invoke-virtual {p0, v0}, Lyv7;->l(Ljava/lang/CharSequence;)Llbf;

    move-result-object v3

    iget-object v0, p0, Lyv7;->i:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luv7;

    const/4 v2, 0x6

    const/4 v4, 0x0

    invoke-static {p0, v3, v4, v4, v2}, Lyv7;->d(Lyv7;Llbf;Lyl2;Lpvb;I)Lvv7;

    move-result-object v4

    const/4 v6, 0x0

    const/16 v7, 0x19

    const/4 v2, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Luv7;->a(Luv7;ZLlbf;Lvv7;Lyl2;Lpvb;I)Luv7;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final o()V
    .registers 8

    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v0

    iget-object v1, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    if-eqz v0, :cond_f

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_17

    :cond_f
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_17
    invoke-virtual {p0, v0}, Lyv7;->l(Ljava/lang/CharSequence;)Llbf;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    sget-object v3, Llbf;->b:Llbf;

    if-eq v0, v3, :cond_35

    sget-object v4, Llbf;->d:Llbf;

    if-eq v0, v4, :cond_35

    iget-object v4, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v4}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcs5;->J(Ljava/lang/CharSequence;)I

    move-result v4

    move v5, v2

    goto :goto_37

    :cond_35
    move v5, v1

    move v4, v2

    :goto_37
    iget-object v6, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v6, v6, Lcom/opera/android/custom_views/OperaEditText;->j:Ll2c;

    invoke-virtual {v6, v4}, Ll2c;->d(I)V

    iget-object v4, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    iget-boolean v6, v4, Lcom/opera/android/widget/UrlFieldEditText;->I:Z

    if-eq v5, v6, :cond_56

    iput-boolean v5, v4, Lcom/opera/android/widget/UrlFieldEditText;->I:Z

    invoke-static {v4}, Lcs5;->W(Landroid/view/View;)Z

    move-result v5

    iget-boolean v6, v4, Lcom/opera/android/widget/UrlFieldEditText;->I:Z

    if-nez v6, :cond_52

    if-eqz v5, :cond_52

    move v5, v1

    goto :goto_53

    :cond_52
    move v5, v2

    :goto_53
    invoke-virtual {v4, v5}, Landroid/view/View;->onRtlPropertiesChanged(I)V

    :cond_56
    iget-object v4, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-static {v4}, Lcs5;->W(Landroid/view/View;)Z

    move-result v4

    iget-object v5, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v5}, Landroid/widget/TextView;->getGravity()I

    move-result v5

    and-int/lit8 v5, v5, 0x70

    iget-object v6, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    if-eqz v4, :cond_6a

    const/4 v4, 0x5

    goto :goto_6b

    :cond_6a
    const/4 v4, 0x3

    :goto_6b
    or-int/2addr v4, v5

    invoke-virtual {v6, v4}, Landroid/widget/TextView;->setGravity(I)V

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    if-eq v0, v3, :cond_74

    move v1, v2

    :cond_74
    invoke-virtual {p0, v1}, Lcom/opera/android/widget/UrlFieldEditText;->E(Z)V

    return-void
.end method
