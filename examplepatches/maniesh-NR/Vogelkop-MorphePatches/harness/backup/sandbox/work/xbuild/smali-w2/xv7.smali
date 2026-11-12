.class public final Lxv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lspm;
.implements Lppm;
.implements Landroid/widget/TextView$OnEditorActionListener;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/view/View$OnKeyListener;


# instance fields
.field public a:Lyl2;

.field public final b:Llgf;

.field public final c:Ljh;

.field public d:Ljava/lang/String;

.field public final synthetic e:Lyv7;


# direct methods
.method public constructor <init>(Lyv7;)V
    .registers 15

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxv7;->e:Lyv7;

    new-instance v0, Llgf;

    iget-object v1, p1, Lyv7;->b:Landroid/content/Context;

    new-instance v2, Lsv7;

    const/4 v12, 0x3

    invoke-direct {v2, p1, v12}, Lsv7;-><init>(Lyv7;B)V

    iget-object v3, p1, Lyv7;->c:Lhz4;

    iget-object v4, v3, Lhz4;->k:Ljava/lang/Object;

    check-cast v4, Lpt3;

    iget-object v5, v3, Lhz4;->l:Ljava/lang/Object;

    check-cast v5, Lmdh;

    iget-object v6, v3, Lhz4;->m:Ljava/lang/Object;

    check-cast v6, Lqdh;

    iget-object v7, v3, Lhz4;->n:Ljava/lang/Object;

    check-cast v7, Lcul;

    iget-object v8, v3, Lhz4;->q:Ljava/lang/Object;

    check-cast v8, Lwcd;

    iget-object v9, v3, Lhz4;->r:Ljava/lang/Object;

    check-cast v9, Liuh;

    iget-object v10, v3, Lhz4;->s:Ljava/lang/Object;

    check-cast v10, Lwok;

    iget-object v3, v3, Lhz4;->i:Ljava/lang/Object;

    move-object v11, v3

    check-cast v11, Ls28;

    move-object v3, v4

    move-object v4, p0

    invoke-direct/range {v0 .. v11}, Llgf;-><init>(Landroid/content/Context;Lesk;Lpt3;Lppm;Lmdh;Lqdh;Lcul;Lwcd;Liuh;Lwok;Ls28;)V

    iput-object v0, v4, Lxv7;->b:Llgf;

    new-instance p0, Ljh;

    const/4 v0, 0x6

    invoke-direct {p0, v0}, Ljh;-><init>(B)V

    iput-object p0, v4, Lxv7;->c:Ljh;

    const-string p0, ""

    iput-object p0, v4, Lxv7;->d:Ljava/lang/String;

    iget-object p0, p1, Lyv7;->a:Lfe5;

    iget-object v0, p0, Lfe5;->b:Lqdc;

    new-instance v2, Ltu7;

    invoke-direct {v2, v4, v12}, Ltu7;-><init>(Ljava/lang/Object;B)V

    const/4 v4, 0x0

    const/16 v5, 0xd

    const/4 v1, 0x0

    const/4 v3, 0x0

    invoke-static/range {v0 .. v5}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    return-void
.end method


# virtual methods
.method public final a(Lyl2;)V
    .registers 11

    invoke-virtual {p0}, Lxv7;->k()Z

    move-result v0

    if-eqz v0, :cond_7b

    iget-object v0, p0, Lxv7;->e:Lyv7;

    iget-object v1, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz p1, :cond_7b

    invoke-interface {p1}, Lyl2;->a()Z

    move-result v2

    if-nez v2, :cond_1e

    iget-boolean v2, v0, Lyv7;->m:Z

    if-eqz v2, :cond_7b

    :cond_1e
    invoke-interface {p1, v1}, Lyl2;->g(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_7b

    invoke-virtual {p0}, Lxv7;->b()V

    iget-object v1, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Lyl2;->j(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7b

    iget-object v2, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-interface {p1}, Lyl2;->d()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    invoke-interface {p1}, Lyl2;->d()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-interface {v3, v4, v5}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/opera/android/widget/UrlFieldEditText;->x(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    iput-object p1, p0, Lxv7;->a:Lyl2;

    invoke-interface {p1}, Lyl2;->i()V

    iget-object p0, v0, Lyv7;->i:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Luv7;

    const/4 v1, 0x0

    const/4 v3, 0x5

    invoke-static {v0, v1, p1, v1, v3}, Lyv7;->d(Lyv7;Llbf;Lyl2;Lpvb;I)Lvv7;

    move-result-object v5

    const/4 v7, 0x0

    const/16 v8, 0x13

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v6, p1

    invoke-static/range {v2 .. v8}, Luv7;->a(Luv7;ZLlbf;Lvv7;Lyl2;Lpvb;I)Luv7;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_7b
    return-void
.end method

.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    iget-object p0, p0, Lxv7;->e:Lyv7;

    invoke-virtual {p0}, Lyv7;->o()V

    return-void
.end method

.method public final b()V
    .registers 13

    iget-object v0, p0, Lxv7;->a:Lyl2;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-interface {v0}, Lyl2;->b()Laua;

    move-result-object v0

    iget-object v1, p0, Lxv7;->e:Lyv7;

    iget-object v2, v1, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    if-eqz v0, :cond_27

    if-eqz v2, :cond_27

    invoke-interface {v2, v0}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    invoke-interface {v2, v0}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v4

    if-ltz v3, :cond_24

    if-ltz v4, :cond_24

    invoke-interface {v2, v3, v4}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    :cond_24
    invoke-interface {v2, v0}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    :cond_27
    const/4 v9, 0x0

    iput-object v9, p0, Lxv7;->a:Lyl2;

    iget-object p0, v1, Lyv7;->i:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Luv7;

    const/4 v0, 0x0

    const/4 v2, 0x5

    invoke-static {v1, v0, v9, v0, v2}, Lyv7;->d(Lyv7;Llbf;Lyl2;Lpvb;I)Lvv7;

    move-result-object v8

    const/4 v10, 0x0

    const/16 v11, 0x13

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v5 .. v11}, Luv7;->a(Luv7;ZLlbf;Lvv7;Lyl2;Lpvb;I)Luv7;

    move-result-object v0

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public final d(II)V
    .registers 12

    iget-object p0, p0, Lxv7;->e:Lyv7;

    iget-object v0, p0, Lyv7;->i:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Luv7;

    if-le p2, p1, :cond_28

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    sget-object p1, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionStart()I

    move-result p1

    if-nez p1, :cond_28

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result p1

    invoke-virtual {p0}, Lbq1;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-ne p1, p0, :cond_28

    const/4 p0, 0x1

    :goto_26
    move v3, p0

    goto :goto_2a

    :cond_28
    const/4 p0, 0x0

    goto :goto_26

    :goto_2a
    const/4 v7, 0x0

    const/16 v8, 0x1e

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v8}, Luv7;->a(Luv7;ZLlbf;Lvv7;Lyl2;Lpvb;I)Luv7;

    move-result-object p0

    invoke-static {v0, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object p0, p0, Lxv7;->e:Lyv7;

    iget-object p0, p0, Lyv7;->c:Lhz4;

    iget-object p0, p0, Lhz4;->d:Ljava/lang/Object;

    check-cast p0, Ldbf;

    sget-object v0, Lqk0;->P:Lqk0;

    invoke-virtual {p0, v0}, Ldbf;->A(Lqk0;)V

    iget-object p0, p0, Ldbf;->a:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez p0, :cond_16

    const/4 p0, 0x0

    :cond_16
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lgbf;->m(Z)V

    return-void
.end method

.method public final f(Z)V
    .registers 8

    iget-object p0, p0, Lxv7;->e:Lyv7;

    iget-object v0, p0, Lyv7;->c:Lhz4;

    sget-object v1, Lowe;->c:Lowe;

    iget-object v1, v1, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_26

    iget-object v1, v0, Lhz4;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v4, "night_mode_overlay_keyboard"

    invoke-virtual {v1, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    iget-object v1, v0, Lhz4;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v4, "night_mode_switch_theme"

    invoke-virtual {v1, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    move v1, v2

    goto :goto_27

    :cond_26
    move v1, v3

    :goto_27
    iget-object v4, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const-class v5, Landroid/app/Activity;

    invoke-static {v4, v5}, Lq9n;->l(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Context;

    move-result-object v4

    check-cast v4, Landroid/app/Activity;

    if-nez v1, :cond_45

    if-eqz p1, :cond_45

    iget-boolean v1, v0, Lhz4;->a:Z

    if-nez v1, :cond_45

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/4 v5, 0x2

    invoke-static {v1, v5}, Lvtp;->W(Landroid/view/Window;I)V

    :cond_45
    if-nez p1, :cond_64

    iget-object v1, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1, v3}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    iget-object v1, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v1

    if-eqz v1, :cond_69

    iget-object v1, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v3

    const-string v5, ""

    invoke-virtual {v1, v3, v5}, Lcom/opera/android/widget/UrlFieldEditText;->x(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_69

    :cond_64
    iget-object v1, p0, Lyv7;->f:Llv7;

    invoke-virtual {v1}, Llv7;->invoke()Ljava/lang/Object;

    :cond_69
    :goto_69
    invoke-virtual {p0, p1}, Lyv7;->m(Z)V

    iget-object v1, v0, Lhz4;->d:Ljava/lang/Object;

    check-cast v1, Ldbf;

    invoke-virtual {v1, p1}, Ldbf;->x(Z)V

    if-nez p1, :cond_98

    iget-boolean p1, v0, Lhz4;->a:Z

    if-nez p1, :cond_98

    iget-object p1, v0, Lhz4;->j:Ljava/lang/Object;

    check-cast p1, Lumi;

    invoke-virtual {v4}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    new-instance v1, Lau3;

    invoke-direct {v1, v0, v2}, Lau3;-><init>(Landroid/view/Window;B)V

    invoke-interface {p1, v1}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0xc8

    invoke-virtual/range {v0 .. v5}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_98
    invoke-virtual {p0}, Lyv7;->o()V

    return-void
.end method

.method public final g()V
    .registers 4

    iget-object v0, p0, Lxv7;->a:Lyl2;

    iget-object v1, p0, Lxv7;->e:Lyv7;

    if-eqz v0, :cond_1a

    invoke-interface {v0}, Lyl2;->b()Laua;

    move-result-object v0

    iget-object v2, v1, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v2

    if-nez v2, :cond_1a

    if-eqz v0, :cond_1a

    iget-object v0, v0, Laua;->d:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    :cond_1a
    iget-object v0, v1, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lxv7;->j(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final h()V
    .registers 2

    iget-object p0, p0, Lxv7;->c:Ljh;

    const/4 v0, 0x1

    iput-boolean v0, p0, Ljh;->a:Z

    return-void
.end method

.method public final i()V
    .registers 5

    iget-object v0, p0, Lxv7;->e:Lyv7;

    iget-object v1, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    if-eqz v1, :cond_17

    iget-object v0, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    new-instance v2, Lwv7;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3}, Lwv7;-><init>(Lcom/opera/android/widget/UrlFieldEditText;B)V

    iget-object p0, p0, Lxv7;->c:Ljh;

    invoke-virtual {p0, v1, v2}, Ljh;->e(Landroid/text/Editable;Ljava/lang/Runnable;)V

    :cond_17
    return-void
.end method

.method public final j(Ljava/lang/CharSequence;)V
    .registers 6

    iget-object v0, p0, Lxv7;->e:Lyv7;

    iget-object v1, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v1

    if-eqz v1, :cond_11

    iget-object v2, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_12

    :cond_11
    move-object v2, p1

    :goto_12
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_23

    iget-object v1, v0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_24

    :cond_23
    move-object v1, v2

    :goto_24
    invoke-virtual {v0}, Lyv7;->n()V

    invoke-virtual {p0}, Lxv7;->k()Z

    move-result v3

    if-eqz v3, :cond_36

    iget-object v3, p0, Lxv7;->b:Llgf;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Llgf;->k(Ljava/lang/String;)V

    :cond_36
    iget-object p1, p0, Lxv7;->d:Ljava/lang/String;

    invoke-static {p1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3f

    return-void

    :cond_3f
    iget-object p1, p0, Lxv7;->a:Lyl2;

    if-eqz p1, :cond_56

    invoke-interface {p1, v1}, Lyl2;->j(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_53

    invoke-interface {p1}, Lyl2;->a()Z

    move-result p1

    if-nez p1, :cond_56

    iget-boolean p1, v0, Lyv7;->m:Z

    if-nez p1, :cond_56

    :cond_53
    invoke-virtual {p0}, Lxv7;->b()V

    :cond_56
    iput-object v2, p0, Lxv7;->d:Ljava/lang/String;

    iget-object p0, v0, Lyv7;->c:Lhz4;

    iget-object p0, p0, Lhz4;->d:Ljava/lang/Object;

    check-cast p0, Ldbf;

    iget-object p0, p0, Ldbf;->q:Lgbf;

    iget-object p0, p0, Lgbf;->b:Lz43;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final k()Z
    .registers 3

    iget-object p0, p0, Lxv7;->e:Lyv7;

    iget-object v0, p0, Lyv7;->c:Lhz4;

    iget-object v0, v0, Lhz4;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "autocomplete_omnibar"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->C()Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result p0

    if-nez p0, :cond_20

    const/4 p0, 0x1

    return p0

    :cond_20
    const/4 p0, 0x0

    return p0
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 7

    const/4 p1, 0x0

    const/4 v0, 0x3

    if-eq p2, v0, :cond_14

    invoke-static {p3}, Loup;->g0(Landroid/view/KeyEvent;)Z

    move-result v1

    if-nez v1, :cond_14

    const/4 v1, 0x6

    if-eq p2, v1, :cond_14

    invoke-static {p3}, Loup;->g0(Landroid/view/KeyEvent;)Z

    move-result p2

    if-nez p2, :cond_14

    return p1

    :cond_14
    iget-object p0, p0, Lxv7;->e:Lyv7;

    iget-object p2, p0, Lyv7;->g:Llv7;

    invoke-virtual {p2}, Llv7;->invoke()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_25

    return p1

    :cond_25
    iget-object p2, p0, Lyv7;->j:Lxbf;

    new-instance p3, Lwbf;

    iget-object v1, p2, Lxbf;->e:Ljava/lang/Object;

    check-cast v1, Lesk;

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lsko;->s(Ljava/lang/Object;)V

    sget-object v1, Lqkk;->b:Lqkk;

    sget-object v2, Llqm;->a:Llqm;

    invoke-direct {p3, p2, v1, p1, v2}, Lwbf;-><init>(Lxbf;Lj7h;ILlqm;)V

    iget-object p0, p0, Lyv7;->c:Lhz4;

    iget-object p0, p0, Lhz4;->p:Ljava/lang/Object;

    check-cast p0, Ldbf;

    iget-object p2, p3, Lwbf;->d:Llbf;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    const/4 v1, 0x1

    if-eqz p2, :cond_66

    if-eq p2, v1, :cond_61

    const/4 v2, 0x2

    if-eq p2, v2, :cond_5b

    if-ne p2, v0, :cond_57

    sget-object p1, Lqk0;->o:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    goto :goto_66

    :cond_57
    invoke-static {}, Lh9o;->p()V

    return p1

    :cond_5b
    sget-object p1, Lqk0;->e:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    goto :goto_66

    :cond_61
    sget-object p1, Lqk0;->d:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    :cond_66
    :goto_66
    invoke-virtual {p3}, Lwbf;->b()V

    return v1
.end method

.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 p1, 0x0

    invoke-static {p1, p3}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result p3

    if-eqz p3, :cond_10

    const/16 p3, 0x6f

    if-ne p2, p3, :cond_10

    invoke-virtual {p0}, Lxv7;->e()V

    const/4 p0, 0x1

    return p0

    :cond_10
    return p1
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .registers 2

    iget-object p0, p0, Lxv7;->e:Lyv7;

    iget-object p0, p0, Lyv7;->c:Lhz4;

    iget-object p0, p0, Lhz4;->d:Ljava/lang/Object;

    check-cast p0, Ldbf;

    invoke-virtual {p0}, Ldbf;->y()Z

    move-result p0

    return p0
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 6

    iget-object v0, p0, Lxv7;->c:Ljh;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljh;->i(Ljava/lang/CharSequence;III)V

    invoke-virtual {p0, p1}, Lxv7;->j(Ljava/lang/CharSequence;)V

    return-void
.end method
