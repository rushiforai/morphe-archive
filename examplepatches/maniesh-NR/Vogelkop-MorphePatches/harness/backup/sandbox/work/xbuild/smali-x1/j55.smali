.class public final Lj55;
.super Lcom/opera/android/suggestion/SuggestionProviderBridge;
.source "SourceFile"

# interfaces
.implements Landroid/content/ClipboardManager$OnPrimaryClipChangedListener;


# instance fields
.field public final d:Landroid/view/ViewGroup;

.field public final e:Landroid/content/Context;

.field public final f:Landroid/content/ClipboardManager;

.field public final g:Lxpm;

.field public final h:Lpde;

.field public final i:Ltsd;

.field public final j:Lbrk;

.field public final k:Loji;

.field public l:Z

.field public m:I

.field public n:Z

.field public o:Landroid/content/ClipDescription;

.field public p:Li55;

.field public final q:Lh55;


# direct methods
.method public constructor <init>(Lfe5;Landroid/view/ViewGroup;Landroid/content/Context;Landroid/content/ClipboardManager;Lxpm;Lpde;Ltsd;Lbrk;Loji;)V
    .registers 11

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/opera/android/suggestion/SuggestionProviderBridge;-><init>(I)V

    iput-object p2, p0, Lj55;->d:Landroid/view/ViewGroup;

    iput-object p3, p0, Lj55;->e:Landroid/content/Context;

    iput-object p4, p0, Lj55;->f:Landroid/content/ClipboardManager;

    iput-object p5, p0, Lj55;->g:Lxpm;

    iput-object p6, p0, Lj55;->h:Lpde;

    iput-object p7, p0, Lj55;->i:Ltsd;

    iput-object p8, p0, Lj55;->j:Lbrk;

    iput-object p9, p0, Lj55;->k:Loji;

    const/4 p3, 0x1

    iput-boolean p3, p0, Lj55;->n:Z

    new-instance p5, Li55;

    const-string p6, ""

    const/4 p8, 0x0

    invoke-direct {p5, p6, p8, p8, v0}, Li55;-><init>(Ljava/lang/String;Lcom/opera/android/suggestion/Suggestion;Lcom/opera/android/suggestion/Suggestion;Z)V

    iput-object p5, p0, Lj55;->p:Li55;

    new-instance p5, Lh55;

    invoke-direct {p5, p0}, Lh55;-><init>(Lj55;)V

    iput-object p5, p0, Lj55;->q:Lh55;

    invoke-virtual {p4, p0}, Landroid/content/ClipboardManager;->addPrimaryClipChangedListener(Landroid/content/ClipboardManager$OnPrimaryClipChangedListener;)V

    invoke-virtual {p2}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p2

    invoke-virtual {p2, p5}, Landroid/view/ViewTreeObserver;->addOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    invoke-virtual {p0}, Lj55;->onPrimaryClipChanged()V

    new-instance p2, Lbo3;

    const/16 p4, 0x1a

    invoke-direct {p2, p0, p4}, Lbo3;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lcl4;

    invoke-direct {p0, p2, p3}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p7, p1, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final cancel()V
    .registers 1

    return-void
.end method

.method public final g(Ljava/lang/String;ZZLyv4;)V
    .registers 5

    invoke-virtual {p0, p1}, Lj55;->h(Ljava/lang/String;)Li55;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lj55;->j(Li55;Z)V

    iget-object p0, p1, Li55;->b:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_19

    iget-boolean p2, p1, Li55;->d:Z

    if-nez p2, :cond_19

    filled-new-array {p0}, [Lcom/opera/android/suggestion/Suggestion;

    move-result-object p0

    invoke-static {p0}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p0

    goto :goto_2b

    :cond_19
    iget-object p0, p1, Li55;->c:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_26

    filled-new-array {p0}, [Lcom/opera/android/suggestion/Suggestion;

    move-result-object p0

    invoke-static {p0}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p0

    goto :goto_2b

    :cond_26
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    :goto_2b
    invoke-virtual {p4, p0}, Lyv4;->d(Ljava/util/List;)V

    return-void
.end method

.method public final h(Ljava/lang/String;)Li55;
    .registers 18

    move-object/from16 v0, p0

    iget-boolean v1, v0, Lj55;->l:Z

    const/4 v2, 0x0

    if-nez v1, :cond_56

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_56

    iget-object v1, v0, Lj55;->h:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_56

    iget-object v1, v0, Lj55;->j:Lbrk;

    invoke-virtual {v1}, Lbrk;->invoke()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_56

    iget-object v1, v0, Lj55;->g:Lxpm;

    iget-object v1, v1, Lxpm;->a:Lcom/opera/android/widget/UrlFieldEditText;

    iget-object v1, v1, Lcom/opera/android/widget/UrlFieldEditText;->G:Ljava/lang/String;

    invoke-static {v1}, Lwqm;->x(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_37

    move-object v8, v1

    goto :goto_38

    :cond_37
    move-object v8, v2

    :goto_38
    if-eqz v8, :cond_56

    iget-object v1, v0, Lj55;->e:Landroid/content/Context;

    const v2, 0x7f1411c9

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    new-instance v4, Lcom/opera/android/suggestion/Suggestion;

    const/4 v13, 0x0

    const/16 v5, 0xe

    const-string v7, ""

    const/4 v9, 0x0

    const/4 v10, 0x0

    const v11, 0x7fffffff

    const/4 v14, -0x1

    const/4 v15, 0x0

    move-object v12, v7

    invoke-direct/range {v4 .. v15}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    move-object v2, v4

    :cond_56
    new-instance v1, Li55;

    invoke-virtual/range {p0 .. p1}, Lj55;->i(Ljava/lang/String;)Lcom/opera/android/suggestion/Suggestion;

    move-result-object v3

    if-eqz v2, :cond_70

    iget-object v0, v0, Lj55;->i:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_70

    const/4 v0, 0x1

    :goto_6d
    move-object/from16 v4, p1

    goto :goto_72

    :cond_70
    const/4 v0, 0x0

    goto :goto_6d

    :goto_72
    invoke-direct {v1, v4, v2, v3, v0}, Li55;-><init>(Ljava/lang/String;Lcom/opera/android/suggestion/Suggestion;Lcom/opera/android/suggestion/Suggestion;Z)V

    return-object v1
.end method

.method public final i(Ljava/lang/String;)Lcom/opera/android/suggestion/Suggestion;
    .registers 23

    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_11c

    iget-object v1, v0, Lj55;->o:Landroid/content/ClipDescription;

    if-eqz v1, :cond_11c

    iget-object v3, v0, Lj55;->h:Lpde;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iget-object v4, v0, Lj55;->f:Landroid/content/ClipboardManager;

    iget-object v5, v0, Lj55;->e:Landroid/content/Context;

    const/16 v6, 0x1f

    const/4 v7, 0x0

    if-nez v3, :cond_7b

    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v8, 0x1

    if-lt v3, v6, :cond_45

    invoke-static {v1}, Lm41;->k(Landroid/content/ClipDescription;)I

    move-result v3

    const/4 v9, 0x2

    if-eq v3, v9, :cond_3e

    const/4 v9, 0x3

    if-ne v3, v9, :cond_78

    invoke-static {v1}, Lm41;->l(Landroid/content/ClipDescription;)F

    move-result v3

    const v9, 0x3f7d70a4    # 0.99f

    cmpl-float v3, v3, v9

    if-lez v3, :cond_78

    move v3, v8

    goto :goto_79

    :cond_3e
    const-string v3, "text/uri-list"

    invoke-virtual {v1, v3}, Landroid/content/ClipDescription;->hasMimeType(Ljava/lang/String;)Z

    move-result v3

    goto :goto_79

    :cond_45
    :try_start_45
    invoke-virtual {v4}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v3

    if-eqz v3, :cond_59

    invoke-virtual {v3}, Landroid/content/ClipData;->getItemCount()I

    move-result v9

    if-gtz v9, :cond_52

    move-object v3, v2

    :cond_52
    if-eqz v3, :cond_59

    invoke-virtual {v3, v7}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v3
    :try_end_58
    .catch Ljava/lang/SecurityException; {:try_start_45 .. :try_end_58} :catch_59

    goto :goto_5a

    :catch_59
    :cond_59
    move-object v3, v2

    :goto_5a
    if-eqz v3, :cond_67

    :try_start_5c
    invoke-virtual {v3, v5}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v3

    if-eqz v3, :cond_67

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_66
    .catch Ljava/lang/IllegalStateException; {:try_start_5c .. :try_end_66} :catch_67
    .catch Ljava/lang/SecurityException; {:try_start_5c .. :try_end_66} :catch_67

    goto :goto_68

    :catch_67
    :cond_67
    move-object v3, v2

    :goto_68
    if-eqz v3, :cond_6f

    invoke-static {v3}, Lmdb;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_70

    :cond_6f
    move-object v3, v2

    :goto_70
    if-eqz v3, :cond_78

    invoke-static {v3}, Lwqm;->x(Ljava/lang/String;)Z

    move-result v3

    xor-int/2addr v3, v8

    goto :goto_79

    :cond_78
    move v3, v7

    :goto_79
    if-nez v3, :cond_7c

    :cond_7b
    move v8, v7

    :cond_7c
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    if-ge v3, v6, :cond_82

    if-nez v8, :cond_ca

    :cond_82
    const-string v3, "text/*"

    invoke-virtual {v1, v3}, Landroid/content/ClipDescription;->hasMimeType(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11c

    const-string v3, "image/*"

    invoke-virtual {v1, v3}, Landroid/content/ClipDescription;->hasMimeType(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_11c

    invoke-virtual {v1}, Landroid/content/ClipDescription;->getTimestamp()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    if-eqz v8, :cond_a0

    const/16 v2, 0xd

    :goto_9e
    move v10, v2

    goto :goto_a3

    :cond_a0
    const/16 v2, 0xc

    goto :goto_9e

    :goto_a3
    if-eqz v8, :cond_a9

    const v2, 0x7f140446

    goto :goto_ac

    :cond_a9
    const v2, 0x7f140448

    :goto_ac
    invoke-virtual {v5, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    new-instance v14, Lrn9;

    invoke-direct {v14, v1, v8, v0}, Lrn9;-><init>(Ljava/lang/String;ZLj55;)V

    new-instance v9, Lcom/opera/android/suggestion/Suggestion;

    const-string v12, ""

    const/4 v13, 0x0

    const/4 v15, 0x0

    const v16, 0x7fffffff

    const/16 v18, 0x0

    const/16 v19, -0x1

    const/16 v20, 0x0

    move-object/from16 v17, v12

    invoke-direct/range {v9 .. v20}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v9

    :cond_ca
    :try_start_ca
    invoke-virtual {v4}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v0

    if-eqz v0, :cond_de

    invoke-virtual {v0}, Landroid/content/ClipData;->getItemCount()I

    move-result v1

    if-gtz v1, :cond_d7

    move-object v0, v2

    :cond_d7
    if-eqz v0, :cond_de

    invoke-virtual {v0, v7}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v0
    :try_end_dd
    .catch Ljava/lang/SecurityException; {:try_start_ca .. :try_end_dd} :catch_de

    goto :goto_df

    :catch_de
    :cond_de
    move-object v0, v2

    :goto_df
    if-eqz v0, :cond_ec

    :try_start_e1
    invoke-virtual {v0, v5}, Landroid/content/ClipData$Item;->coerceToText(Landroid/content/Context;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_ec

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_eb
    .catch Ljava/lang/IllegalStateException; {:try_start_e1 .. :try_end_eb} :catch_ec
    .catch Ljava/lang/SecurityException; {:try_start_e1 .. :try_end_eb} :catch_ec

    goto :goto_ed

    :catch_ec
    :cond_ec
    move-object v0, v2

    :goto_ed
    if-eqz v0, :cond_f4

    invoke-static {v0}, Lmdb;->h(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_f5

    :cond_f4
    move-object v0, v2

    :goto_f5
    if-eqz v0, :cond_11c

    invoke-static {v0}, Lwqm;->x(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_105

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->e(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_105

    move-object v5, v0

    goto :goto_106

    :cond_105
    move-object v5, v2

    :goto_106
    if-eqz v5, :cond_11c

    new-instance v3, Lcom/opera/android/suggestion/Suggestion;

    const/4 v12, 0x0

    const/16 v4, 0xd

    const-string v6, ""

    const/4 v8, 0x0

    const/4 v9, 0x0

    const v10, 0x7fffffff

    const/4 v13, -0x1

    const/4 v14, 0x0

    move-object v7, v5

    move-object v11, v6

    invoke-direct/range {v3 .. v14}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    return-object v3

    :cond_11c
    return-object v2
.end method

.method public final j(Li55;Z)V
    .registers 10

    iget-object v0, p1, Li55;->b:Lcom/opera/android/suggestion/Suggestion;

    iget-object v1, p1, Li55;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-boolean v2, p1, Li55;->d:Z

    iget-object v3, p0, Lj55;->p:Li55;

    invoke-virtual {p1, v3}, Li55;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_93

    iget-object v3, p0, Lj55;->p:Li55;

    iput-object p1, p0, Lj55;->p:Li55;

    iget-boolean p1, v3, Li55;->d:Z

    iget-object v4, p0, Lj55;->k:Loji;

    if-eq p1, v2, :cond_33

    iget-object p1, v4, Loji;->a:Ljava/lang/Object;

    check-cast p1, Lmrk;

    iget-object p1, p1, Lmrk;->F:Lp8f;

    iget-object p1, p1, Lp8f;->b:Ljava/lang/Object;

    check-cast p1, Lpde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lf55;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lf55;

    invoke-direct {v5, v2}, Lf55;-><init>(Z)V

    invoke-static {p1, v5}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    :cond_33
    const/4 p1, 0x1

    const/4 v5, 0x0

    if-eqz v1, :cond_42

    iget-boolean v6, p0, Lj55;->n:Z

    if-eqz v6, :cond_42

    iput-boolean v5, p0, Lj55;->n:Z

    iget v6, p0, Lj55;->m:I

    add-int/2addr v6, p1

    iput v6, p0, Lj55;->m:I

    :cond_42
    if-eqz p2, :cond_93

    iget-boolean p0, v3, Li55;->d:Z

    const/4 p2, 0x0

    if-nez p0, :cond_4c

    iget-object p0, v3, Li55;->b:Lcom/opera/android/suggestion/Suggestion;

    goto :goto_4d

    :cond_4c
    move-object p0, p2

    :goto_4d
    if-eqz p0, :cond_51

    move p0, p1

    goto :goto_52

    :cond_51
    move p0, v5

    :goto_52
    if-nez v2, :cond_56

    move-object v6, v0

    goto :goto_57

    :cond_56
    move-object v6, p2

    :goto_57
    if-eqz v6, :cond_5b

    move v6, p1

    goto :goto_5c

    :cond_5b
    move v6, v5

    :goto_5c
    if-eq p0, v6, :cond_84

    if-eqz v2, :cond_61

    move-object v0, p2

    :cond_61
    iget-object p0, v4, Loji;->a:Ljava/lang/Object;

    check-cast p0, Lmrk;

    invoke-virtual {p0}, Lmrk;->c()Z

    move-result v2

    if-eqz v2, :cond_84

    iget-object p0, p0, Lmrk;->C:Lhqk;

    const/4 v2, 0x3

    if-nez v0, :cond_79

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lxpk;->c:Lxpk;

    invoke-virtual {p0, p2, v2, v0}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    goto :goto_84

    :cond_79
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Lxpk;->c:Lxpk;

    invoke-virtual {p0, p2, v2, v6}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    invoke-virtual {p0, v0, v2, v6}, Lhqk;->I(Lcom/opera/android/suggestion/Suggestion;ILxpk;)Z

    :cond_84
    :goto_84
    iget-object p0, v3, Li55;->c:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_8a

    move p0, p1

    goto :goto_8b

    :cond_8a
    move p0, v5

    :goto_8b
    if-nez v1, :cond_8e

    move p1, v5

    :cond_8e
    if-eq p0, p1, :cond_93

    invoke-virtual {v4, v1}, Loji;->E(Lcom/opera/android/suggestion/Suggestion;)Z

    :cond_93
    return-void
.end method

.method public final onPrimaryClipChanged()V
    .registers 5

    const/4 v0, 0x0

    iput v0, p0, Lj55;->m:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lj55;->n:Z

    iget-object v2, p0, Lj55;->f:Landroid/content/ClipboardManager;

    invoke-virtual {v2}, Landroid/content/ClipboardManager;->getPrimaryClipDescription()Landroid/content/ClipDescription;

    move-result-object v2

    iput-object v2, p0, Lj55;->o:Landroid/content/ClipDescription;

    iget-object v2, p0, Lj55;->p:Li55;

    iget-object v2, v2, Li55;->a:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lj55;->i(Ljava/lang/String;)Lcom/opera/android/suggestion/Suggestion;

    move-result-object v2

    iget-object v3, p0, Lj55;->k:Loji;

    invoke-virtual {v3, v2}, Loji;->E(Lcom/opera/android/suggestion/Suggestion;)Z

    move-result v2

    if-eqz v2, :cond_29

    iget-boolean v2, p0, Lj55;->n:Z

    if-eqz v2, :cond_29

    iput-boolean v0, p0, Lj55;->n:Z

    iget v0, p0, Lj55;->m:I

    add-int/2addr v0, v1

    iput v0, p0, Lj55;->m:I

    :cond_29
    return-void
.end method
