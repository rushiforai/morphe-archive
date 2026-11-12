.class public final Lubf;
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
.field public final a:Lumi;

.field public final b:Llgf;

.field public final c:Lx77;

.field public final d:Ljh;

.field public e:Ljava/lang/String;

.field public f:Lyl2;

.field public final synthetic g:Lvbf;


# direct methods
.method public constructor <init>(Lvbf;Lumi;Ls28;Lpt3;Lmdh;Lqdh;Lcul;Lwcd;Liuh;Lwok;)V
    .registers 25

    move-object/from16 v0, p2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lubf;->g:Lvbf;

    new-instance v1, Ljh;

    const/4 v2, 0x6

    invoke-direct {v1, v2}, Ljh;-><init>(B)V

    iput-object v1, p0, Lubf;->d:Ljh;

    const-string v1, ""

    iput-object v1, p0, Lubf;->e:Ljava/lang/String;

    iput-object v0, p0, Lubf;->a:Lumi;

    new-instance v2, Llgf;

    iget-object p1, p1, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance v4, Lvx;

    const/16 v1, 0x1b

    invoke-direct {v4, p1, v1}, Lvx;-><init>(Ljava/lang/Object;B)V

    move-object v6, p0

    move-object/from16 v13, p3

    move-object/from16 v5, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    move-object/from16 v11, p9

    move-object/from16 v12, p10

    invoke-direct/range {v2 .. v13}, Llgf;-><init>(Landroid/content/Context;Lesk;Lpt3;Lppm;Lmdh;Lqdh;Lcul;Lwcd;Liuh;Lwok;Ls28;)V

    iput-object v2, p0, Lubf;->b:Llgf;

    new-instance v1, Lx77;

    const/16 v2, 0x1d

    invoke-direct {v1, v0, p1, v2}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v1, p0, Lubf;->c:Lx77;

    return-void
.end method


# virtual methods
.method public final a(Lyl2;)V
    .registers 7

    invoke-virtual {p0}, Lubf;->k()Z

    move-result v0

    if-eqz v0, :cond_54

    iget-object v0, p0, Lubf;->g:Lvbf;

    iget-object v1, v0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    if-eqz p1, :cond_54

    invoke-interface {p1, v1}, Lyl2;->g(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_54

    invoke-virtual {p0}, Lubf;->b()V

    iget-object v0, v0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Lyl2;->j(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_54

    invoke-interface {p1}, Lyl2;->d()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-interface {p1}, Lyl2;->d()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-interface {v2, v3, v4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/widget/UrlFieldEditText;->x(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    iput-object p1, p0, Lubf;->f:Lyl2;

    invoke-interface {p1}, Lyl2;->i()V

    invoke-virtual {p0, p1}, Lubf;->l(Lyl2;)V

    :cond_54
    return-void
.end method

.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    iget-object p0, p0, Lubf;->g:Lvbf;

    invoke-virtual {p0}, Lvbf;->u()V

    return-void
.end method

.method public final b()V
    .registers 6

    iget-object v0, p0, Lubf;->f:Lyl2;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-interface {v0}, Lyl2;->b()Laua;

    move-result-object v0

    if-eqz v0, :cond_33

    iget-object v1, p0, Lubf;->g:Lvbf;

    iget-object v2, v1, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v1, v1, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-interface {v2, v0}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3, v0}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v3

    if-ltz v2, :cond_2c

    if-ltz v3, :cond_2c

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4, v2, v3}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    :cond_2c
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1, v0}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    :cond_33
    const/4 v0, 0x0

    iput-object v0, p0, Lubf;->f:Lyl2;

    invoke-virtual {p0, v0}, Lubf;->l(Lyl2;)V

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public final d(II)V
    .registers 5

    iget-object p0, p0, Lubf;->g:Lvbf;

    invoke-virtual {p0}, Lvbf;->q()V

    iget-object p1, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionStart()I

    move-result p2

    if-nez p2, :cond_1f

    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result p2

    invoke-virtual {p1}, Lbq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-ne p2, p1, :cond_1f

    const/4 p1, 0x1

    goto :goto_20

    :cond_1f
    const/4 p1, 0x0

    :goto_20
    const-wide/16 v0, 0x8

    invoke-virtual {p0, v0, v1, p1}, Lvbf;->r(JZ)V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object p0, p0, Lubf;->g:Lvbf;

    iget-object p0, p0, Lvbf;->x:Ldbf;

    sget-object v0, Lqk0;->P:Lqk0;

    invoke-virtual {p0, v0}, Ldbf;->A(Lqk0;)V

    iget-object p0, p0, Ldbf;->a:Lhv3;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez p0, :cond_12

    const/4 p0, 0x0

    :cond_12
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lgbf;->m(Z)V

    return-void
.end method

.method public final f(Z)V
    .registers 21

    move-object/from16 v0, p0

    move/from16 v1, p1

    sget-object v2, Lowe;->c:Lowe;

    iget-object v2, v2, Lowe;->a:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object v5, v0, Lubf;->g:Lvbf;

    if-eqz v2, :cond_28

    iget-object v2, v5, Lvbf;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v6, "night_mode_overlay_keyboard"

    invoke-virtual {v2, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_28

    iget-object v2, v5, Lvbf;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v6, "night_mode_switch_theme"

    invoke-virtual {v2, v6}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_28

    move v2, v3

    goto :goto_29

    :cond_28
    move v2, v4

    :goto_29
    iget-object v6, v5, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v7, v5, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    iget-boolean v8, v5, Lvbf;->a:Z

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    const-class v9, Landroid/app/Activity;

    invoke-static {v6, v9}, Lq9n;->l(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Context;

    move-result-object v6

    check-cast v6, Landroid/app/Activity;

    if-nez v2, :cond_49

    if-eqz v1, :cond_49

    if-nez v8, :cond_49

    invoke-virtual {v6}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    const/4 v9, 0x2

    invoke-static {v2, v9}, Lvtp;->W(Landroid/view/Window;I)V

    :cond_49
    if-nez v1, :cond_61

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-static {v2, v4}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    invoke-virtual {v7}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v2

    if-eqz v2, :cond_61

    invoke-virtual {v7}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v2

    const-string v4, ""

    invoke-virtual {v7, v2, v4}, Lcom/opera/android/widget/UrlFieldEditText;->x(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    :cond_61
    iget-object v2, v0, Lubf;->c:Lx77;

    iget-object v4, v2, Lx77;->d:Ljava/lang/Object;

    check-cast v4, Loml;

    if-eqz v4, :cond_6f

    invoke-virtual {v4, v3}, Loml;->cancel(Z)Z

    const/4 v4, 0x0

    iput-object v4, v2, Lx77;->d:Ljava/lang/Object;

    :cond_6f
    const-wide/16 v9, 0x0

    if-eqz v1, :cond_79

    if-nez v8, :cond_79

    const-wide/16 v11, 0x96

    move-wide v15, v11

    goto :goto_7a

    :cond_79
    move-wide v15, v9

    :goto_7a
    cmp-long v4, v15, v9

    if-nez v4, :cond_91

    iget-object v4, v2, Lx77;->c:Ljava/lang/Object;

    check-cast v4, Landroid/view/View;

    if-eqz v1, :cond_8b

    invoke-static {v4}, Lq9n;->H(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_91

    goto :goto_b2

    :cond_8b
    invoke-static {v4}, Lq9n;->u(Landroid/view/View;)Z

    move-result v4

    if-nez v4, :cond_b2

    :cond_91
    iget-object v4, v2, Lx77;->b:Ljava/lang/Object;

    check-cast v4, Lumi;

    new-instance v7, Lkqd;

    const/16 v9, 0xe

    invoke-direct {v7, v2, v9}, Lkqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v7}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v4

    new-instance v13, Loml;

    invoke-direct {v13, v4}, Loml;-><init>(Lnml;)V

    iput-object v13, v2, Lx77;->d:Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v14

    sget-object v17, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v18, 0x0

    invoke-virtual/range {v13 .. v18}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_b2
    :goto_b2
    iget-object v2, v5, Lvbf;->x:Ldbf;

    invoke-virtual {v2, v1}, Ldbf;->x(Z)V

    if-nez v1, :cond_d8

    if-nez v8, :cond_d8

    invoke-virtual {v6}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    new-instance v2, Lau3;

    invoke-direct {v2, v1, v3}, Lau3;-><init>(Landroid/view/Window;B)V

    iget-object v0, v0, Lubf;->a:Lumi;

    invoke-interface {v0, v2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v1, Loml;

    invoke-direct {v1, v0}, Loml;-><init>(Lnml;)V

    sget-object v5, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v6, 0x0

    const/4 v2, 0x0

    const-wide/16 v3, 0xc8

    invoke-virtual/range {v1 .. v6}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_d8
    return-void
.end method

.method public final g()V
    .registers 4

    iget-object v0, p0, Lubf;->g:Lvbf;

    iget-object v1, v0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v1

    if-nez v1, :cond_20

    iget-object v1, p0, Lubf;->f:Lyl2;

    if-eqz v1, :cond_20

    invoke-interface {v1}, Lyl2;->b()Laua;

    move-result-object v1

    if-eqz v1, :cond_20

    iget-object v1, p0, Lubf;->f:Lyl2;

    invoke-interface {v1}, Lyl2;->b()Laua;

    move-result-object v1

    iget-object v1, v1, Laua;->d:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    :cond_20
    iget-object v0, v0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lubf;->j(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final h()V
    .registers 2

    iget-object p0, p0, Lubf;->d:Ljh;

    const/4 v0, 0x1

    iput-boolean v0, p0, Ljh;->a:Z

    return-void
.end method

.method public final i()V
    .registers 5

    iget-object v0, p0, Lubf;->g:Lvbf;

    iget-object v1, v0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    if-eqz v1, :cond_1a

    iget-object v0, v0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v2, Lwv7;

    const/4 v3, 0x1

    invoke-direct {v2, v0, v3}, Lwv7;-><init>(Lcom/opera/android/widget/UrlFieldEditText;B)V

    iget-object p0, p0, Lubf;->d:Ljh;

    invoke-virtual {p0, v1, v2}, Ljh;->e(Landroid/text/Editable;Ljava/lang/Runnable;)V

    :cond_1a
    return-void
.end method

.method public final j(Ljava/lang/CharSequence;)V
    .registers 6

    iget-object v0, p0, Lubf;->g:Lvbf;

    iget-object v1, v0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v2, v0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-virtual {v2}, Lcom/opera/android/widget/UrlFieldEditText;->r()Ljava/lang/CharSequence;

    move-result-object v3

    goto :goto_12

    :cond_11
    move-object v3, p1

    :goto_12
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    if-eqz v1, :cond_21

    invoke-virtual {v2}, Lcom/opera/android/widget/UrlFieldEditText;->q()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_22

    :cond_21
    move-object v1, v3

    :goto_22
    invoke-virtual {v0}, Lvbf;->t()V

    invoke-virtual {p0}, Lubf;->k()Z

    move-result v2

    if-eqz v2, :cond_34

    iget-object v2, p0, Lubf;->b:Llgf;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Llgf;->k(Ljava/lang/String;)V

    :cond_34
    iget-object p1, p0, Lubf;->e:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3d

    return-void

    :cond_3d
    iget-object p1, p0, Lubf;->f:Lyl2;

    if-eqz p1, :cond_4a

    invoke-interface {p1, v1}, Lyl2;->j(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4a

    invoke-virtual {p0}, Lubf;->b()V

    :cond_4a
    iput-object v3, p0, Lubf;->e:Ljava/lang/String;

    iget-object p0, v0, Lvbf;->x:Ldbf;

    iget-object p0, p0, Ldbf;->q:Lgbf;

    iget-object p0, p0, Lgbf;->b:Lz43;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final k()Z
    .registers 3

    iget-object p0, p0, Lubf;->g:Lvbf;

    iget-object v0, p0, Lvbf;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "autocomplete_omnibar"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Lcom/opera/android/widget/UrlFieldEditText;->C()Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object p0, p0, Lvbf;->s:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Lcom/opera/android/widget/UrlFieldEditText;->s()Z

    move-result p0

    if-nez p0, :cond_1e

    const/4 p0, 0x1

    return p0

    :cond_1e
    const/4 p0, 0x0

    return p0
.end method

.method public final l(Lyl2;)V
    .registers 4

    iget-object v0, p0, Lubf;->g:Lvbf;

    invoke-virtual {v0}, Lvbf;->q()V

    if-eqz p1, :cond_13

    new-instance v1, Lrn9;

    invoke-direct {v1, p0, p1}, Lrn9;-><init>(Lubf;Lyl2;)V

    invoke-interface {p1, v1}, Lyl2;->e(Lxl2;)Z

    move-result p0

    if-eqz p0, :cond_13

    return-void

    :cond_13
    const-wide/16 p0, 0x1000

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lvbf;->r(JZ)V

    iget-object p0, v0, Lvbf;->q:Lv73;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lv73;->p(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object p0, p0, Lubf;->g:Lvbf;

    iget-object p0, p0, Lvbf;->x:Ldbf;

    sget-object p1, Lhbf;->b:Lhbf;

    iget-object p0, p0, Ldbf;->q:Lgbf;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lgbf;->l(Lbsi;Lhbf;)V

    iget-object p0, p0, Lgbf;->s:Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzqi;

    iget-object p1, p0, Lzqi;->b:Lmrk;

    iget-object p0, p0, Lzqi;->b:Lmrk;

    invoke-virtual {p1}, Lmrk;->d()Z

    move-result p1

    if-nez p1, :cond_2c

    iget-object p1, p0, Lmrk;->C:Lhqk;

    iget-object p1, p1, Lhqk;->y:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_29

    return-void

    :cond_29
    invoke-virtual {p0, v0}, Lmrk;->h(Lbsi;)V

    :cond_2c
    return-void
.end method

.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 7

    const/4 p1, 0x0

    if-eqz p3, :cond_52

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p2

    const/16 v0, 0x42

    if-ne p2, v0, :cond_52

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p2

    const/4 p3, 0x1

    if-ne p2, p3, :cond_51

    iget-object p0, p0, Lubf;->g:Lvbf;

    iget-object p2, p0, Lvbf;->A:Lxbf;

    iget-object p0, p0, Lvbf;->y:Ldbf;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lwbf;

    iget-object v1, p2, Lxbf;->e:Ljava/lang/Object;

    check-cast v1, Lesk;

    invoke-interface {v1}, Lesk;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-static {v1}, Lsko;->s(Ljava/lang/Object;)V

    sget-object v1, Lqkk;->b:Lqkk;

    sget-object v2, Llqm;->a:Llqm;

    invoke-direct {v0, p2, v1, p1, v2}, Lwbf;-><init>(Lxbf;Lj7h;ILlqm;)V

    iget-object p1, v0, Lwbf;->d:Llbf;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eq p1, p3, :cond_49

    const/4 p2, 0x2

    if-eq p1, p2, :cond_43

    const/4 p2, 0x3

    if-ne p1, p2, :cond_4e

    sget-object p1, Lqk0;->o:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    goto :goto_4e

    :cond_43
    sget-object p1, Lqk0;->e:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    goto :goto_4e

    :cond_49
    sget-object p1, Lqk0;->d:Lqk0;

    invoke-virtual {p0, p1}, Ldbf;->A(Lqk0;)V

    :cond_4e
    :goto_4e
    invoke-virtual {v0}, Lwbf;->b()V

    :cond_51
    return p3

    :cond_52
    return p1
.end method

.method public final onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .registers 4

    const/4 p1, 0x0

    invoke-static {p1, p3}, Lfr3;->H(ILandroid/view/KeyEvent;)Z

    move-result p3

    if-eqz p3, :cond_10

    const/16 p3, 0x6f

    if-ne p2, p3, :cond_10

    invoke-virtual {p0}, Lubf;->e()V

    const/4 p0, 0x1

    return p0

    :cond_10
    return p1
.end method

.method public final onLongClick(Landroid/view/View;)Z
    .registers 2

    iget-object p0, p0, Lubf;->g:Lvbf;

    iget-object p0, p0, Lvbf;->x:Ldbf;

    invoke-virtual {p0}, Ldbf;->y()Z

    move-result p0

    return p0
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 6

    iget-object v0, p0, Lubf;->d:Ljh;

    invoke-virtual {v0, p1, p2, p3, p4}, Ljh;->i(Ljava/lang/CharSequence;III)V

    invoke-virtual {p0, p1}, Lubf;->j(Ljava/lang/CharSequence;)V

    return-void
.end method
