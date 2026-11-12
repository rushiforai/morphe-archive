.class public abstract Liq2;
.super Lltl;
.source "SourceFile"


# instance fields
.field public A:Lkf;

.field public B:Lpq3;

.field public final C:Ljava/util/ArrayList;

.field public final D:Ljava/util/ArrayList;

.field public E:Z

.field public F:Les2;

.field public G:Ljava/lang/String;

.field public H:Ljava/lang/String;

.field public I:Ljava/lang/String;

.field public J:Ljava/lang/String;

.field public K:Ljava/util/HashSet;

.field public final r:Lcom/opera/android/autofill/AutofillManager;

.field public final s:Lcom/opera/android/autofill/Address;

.field public final t:Lcom/opera/android/autofill/AddressEditorManager;

.field public final u:Ldt1;

.field public final v:Ljava/util/HashMap;

.field public final w:Lkdg;

.field public final x:Lbq2;

.field public final y:Ldq2;

.field public z:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>(IILcom/opera/android/autofill/AutofillManager;Lgw;Lcom/opera/android/autofill/Address;)V
    .registers 7

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    invoke-virtual {v0, p1}, Lu7k;->s(I)V

    iget-object p1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast p1, Litl;

    iput p2, p1, Litl;->b:I

    const/4 p2, 0x1

    iput p2, p1, Litl;->k:I

    invoke-direct {p0, p1}, Lltl;-><init>(Litl;)V

    new-instance p1, Ldt1;

    invoke-direct {p1, p0}, Ldt1;-><init>(Liq2;)V

    iput-object p1, p0, Liq2;->u:Ldt1;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Liq2;->v:Ljava/util/HashMap;

    new-instance p2, Lkdg;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Liq2;->w:Lkdg;

    new-instance p2, Lbq2;

    invoke-direct {p2, p0}, Lbq2;-><init>(Liq2;)V

    iput-object p2, p0, Liq2;->x:Lbq2;

    new-instance p2, Ldq2;

    invoke-direct {p2, p1}, Ldq2;-><init>(Ldt1;)V

    iput-object p2, p0, Liq2;->y:Ldq2;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Liq2;->D:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Liq2;->K:Ljava/util/HashSet;

    iput-object p3, p0, Liq2;->r:Lcom/opera/android/autofill/AutofillManager;

    new-instance p1, Lcom/opera/android/autofill/AddressEditorManager;

    iget-object p2, p4, Lgw;->a:Lhjf;

    invoke-direct {p1, p2}, Lcom/opera/android/autofill/AddressEditorManager;-><init>(Lhjf;)V

    iput-object p1, p0, Liq2;->t:Lcom/opera/android/autofill/AddressEditorManager;

    iput-object p5, p0, Liq2;->s:Lcom/opera/android/autofill/Address;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    invoke-static {p1}, LJ/N;->MCCiGG4f(Ljava/lang/Object;)V

    invoke-static {p1}, Liq2;->L0(Ljava/util/Map;)Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Liq2;->C:Ljava/util/ArrayList;

    return-void
.end method

.method public static L0(Ljava/util/Map;)Ljava/util/ArrayList;
    .registers 5

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_11
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_32

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    new-instance v2, Lsp2;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v2, v3, v1}, Lsp2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_32
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {p0}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/text/Collator;->setStrength(I)V

    new-instance v1, Lrp2;

    invoke-direct {v1, p0}, Lrp2;-><init>(Ljava/text/Collator;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object v0
.end method


# virtual methods
.method public final G0()Z
    .registers 4

    iget-object v0, p0, Liq2;->H:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Liq2;->I:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3a

    iget-object p0, p0, Liq2;->v:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lew;->b:Lew;

    if-eq v1, v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1a

    :cond_3a
    const/4 p0, 0x0

    return p0

    :cond_3c
    const/4 p0, 0x1

    return p0
.end method

.method public final H0()Lcom/opera/android/autofill/Address;
    .registers 18

    move-object/from16 v0, p0

    new-instance v1, Lcom/opera/android/autofill/Address;

    iget-object v2, v0, Liq2;->s:Lcom/opera/android/autofill/Address;

    iget-object v2, v2, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    sget-object v3, Lew;->j:Lew;

    iget-object v4, v0, Liq2;->v:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    sget-object v5, Lew;->i:Lew;

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    sget-object v6, Lew;->h:Lew;

    invoke-virtual {v4, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    sget-object v7, Lew;->c:Lew;

    invoke-virtual {v4, v7}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    sget-object v8, Lew;->d:Lew;

    invoke-virtual {v4, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    sget-object v9, Lew;->e:Lew;

    invoke-virtual {v4, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    sget-object v10, Lew;->g:Lew;

    invoke-virtual {v4, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    sget-object v11, Lew;->f:Lew;

    invoke-virtual {v4, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    sget-object v12, Lew;->b:Lew;

    invoke-virtual {v4, v12}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object v12, v1

    move-object v1, v2

    move-object v2, v3

    move-object v3, v5

    move-object v5, v7

    move-object v7, v9

    move-object v9, v11

    iget-object v11, v0, Liq2;->H:Ljava/lang/String;

    move-object v13, v12

    iget-object v12, v0, Liq2;->I:Ljava/lang/String;

    iget-object v0, v0, Liq2;->G:Ljava/lang/String;

    const-string v14, ""

    const/4 v15, 0x0

    move-object/from16 v16, v13

    move-object v13, v0

    move-object/from16 v0, v16

    move-object/from16 v16, v10

    move-object v10, v4

    move-object v4, v6

    move-object v6, v8

    move-object/from16 v8, v16

    invoke-direct/range {v0 .. v15}, Lcom/opera/android/autofill/Address;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    return-object v0
.end method

.method public final I0()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Liq2;->v:Ljava/util/HashMap;

    sget-object v1, Lew;->b:Lew;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_11

    return-object v0

    :cond_11
    iget-object p0, p0, Liq2;->s:Lcom/opera/android/autofill/Address;

    iget-object p0, p0, Lcom/opera/android/autofill/Address;->j:Ljava/lang/String;

    return-object p0
.end method

.method public final J0()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Liq2;->K:Ljava/util/HashSet;

    sget-object v1, Lyp2;->d:Lyp2;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    iget-object v0, p0, Liq2;->H:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v0

    if-nez v0, :cond_1a

    const v0, 0x7f140d35

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1a
    iget-object v0, p0, Liq2;->H:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_36

    iget-object v0, p0, Liq2;->H:Ljava/lang/String;

    invoke-virtual {p0}, Liq2;->I0()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, LJ/N;->MQ1o0vJQ(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_36

    const v0, 0x7f140206

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_36
    const/4 p0, 0x0

    return-object p0
.end method

.method public final K0()V
    .registers 14

    invoke-virtual {p0}, Liq2;->I0()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Liq2;->D:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    const/4 v1, 0x0

    iput-boolean v1, p0, Liq2;->E:Z

    new-instance v2, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Liq2;->z:Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f140203

    invoke-virtual {v3, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Liq2;->z:Landroid/app/ProgressDialog;

    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    iget-object v2, p0, Liq2;->t:Lcom/opera/android/autofill/AddressEditorManager;

    iget-object v3, p0, Liq2;->x:Lbq2;

    invoke-virtual {v2, v0, v3}, Lcom/opera/android/autofill/AddressEditorManager;->a(Ljava/lang/String;Lbq2;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Liq2;->s:Lcom/opera/android/autofill/Address;

    iget-object v3, v3, Lcom/opera/android/autofill/Address;->m:Ljava/lang/String;

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v3, v4}, LJ/N;->MSSlnHgJ(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const/4 v5, -0x1

    move v6, v1

    move v8, v6

    move v7, v5

    :goto_48
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v9

    sget-object v10, Lew;->b:Lew;

    const/4 v11, 0x1

    if-ge v6, v9, :cond_8a

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lfw;

    iget-object v12, v9, Lfw;->a:Lew;

    iget-boolean v9, v9, Lfw;->d:Z

    if-ne v12, v10, :cond_70

    if-eqz v6, :cond_6e

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lfw;

    invoke-virtual {v4, v1, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    if-ltz v7, :cond_6c

    add-int/lit8 v7, v7, 0x1

    :cond_6c
    move v8, v11

    goto :goto_87

    :cond_6e
    move v8, v11

    goto :goto_77

    :cond_70
    sget-object v10, Lew;->c:Lew;

    if-ne v12, v10, :cond_77

    if-nez v9, :cond_77

    move v7, v6

    :cond_77
    :goto_77
    if-ltz v7, :cond_87

    if-eqz v9, :cond_87

    add-int/lit8 v9, v6, -0x1

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lfw;

    invoke-virtual {v4, v9, v7}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    move v7, v5

    :cond_87
    :goto_87
    add-int/lit8 v6, v6, 0x1

    goto :goto_48

    :cond_8a
    if-ltz v7, :cond_a1

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v11

    if-ge v7, v5, :cond_a1

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v11

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfw;

    invoke-virtual {v4, v5, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_a1
    if-nez v8, :cond_b2

    new-instance v5, Lfw;

    const v6, 0x7f1401ff

    invoke-virtual {v2, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v5, v10, v2, v11, v11}, Lfw;-><init>(Lew;Ljava/lang/String;ZZ)V

    invoke-virtual {v4, v1, v5}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_b2
    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    iput-object v3, p0, Liq2;->G:Ljava/lang/String;

    iget-object v3, p0, Liq2;->u:Ldt1;

    iput-object v2, v3, Ldt1;->c:Ljava/lang/Object;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    new-array v5, v4, [I

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    move v6, v1

    :goto_c7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x2

    if-eqz v7, :cond_ee

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lfw;

    iget-boolean v9, v7, Lfw;->d:Z

    if-nez v9, :cond_e4

    iget-object v7, v7, Lfw;->a:Lew;

    sget-object v9, Lew;->d:Lew;

    if-eq v7, v9, :cond_e4

    sget-object v9, Lew;->e:Lew;

    if-eq v7, v9, :cond_e4

    move v7, v1

    goto :goto_e5

    :cond_e4
    move v7, v11

    :goto_e5
    add-int/lit8 v9, v6, 0x1

    if-nez v7, :cond_ea

    move v8, v11

    :cond_ea
    aput v8, v5, v6

    move v6, v9

    goto :goto_c7

    :cond_ee
    move v2, v1

    move v6, v2

    :goto_f0
    if-ge v2, v4, :cond_105

    aget v7, v5, v2

    if-ne v7, v11, :cond_f9

    add-int/lit8 v6, v6, 0x1

    goto :goto_102

    :cond_f9
    rem-int/lit8 v6, v6, 0x2

    if-eqz v6, :cond_101

    add-int/lit8 v6, v2, -0x1

    aput v8, v5, v6

    :cond_101
    move v6, v1

    :goto_102
    add-int/lit8 v2, v2, 0x1

    goto :goto_f0

    :cond_105
    iput-object v5, v3, Ldt1;->b:Ljava/lang/Object;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    iget-object p0, p0, Liq2;->w:Lkdg;

    iput-object v0, p0, Lkdg;->b:Ljava/lang/String;

    return-void
.end method

.method public M0()Z
    .registers 4

    invoke-virtual {p0}, Liq2;->H0()Lcom/opera/android/autofill/Address;

    move-result-object v0

    new-instance v1, Lva2;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lva2;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Liq2;->r:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/autofill/AutofillManager;->a(Lcom/opera/android/autofill/Address;Lcom/opera/android/autofill/AutofillManager$AutofillCallback;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final N0()V
    .registers 2

    iget-object v0, p0, Liq2;->B:Lpq3;

    iget-object v0, v0, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0}, Liq2;->G0()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-virtual {v0, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final O0(Lew;Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Liq2;->v:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    return-void

    :cond_d
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p2, Lew;->b:Lew;

    if-ne p1, p2, :cond_17

    invoke-virtual {p0}, Liq2;->K0()V

    :cond_17
    invoke-virtual {p0}, Liq2;->N0()V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Liq2;->A:Lkf;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/theme/ThemeableRecyclerView;

    new-instance p1, Lqp2;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lqp2;-><init>(B)V

    const-class v0, Landroid/widget/AutoCompleteTextView;

    invoke-static {p0, v0, p1}, Lq9n;->J(Landroid/view/View;Ljava/lang/Class;Lp9n;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 6

    invoke-super {p0}, Lryl;->onDestroy()V

    const/4 v0, 0x1

    iget-object p0, p0, Liq2;->t:Lcom/opera/android/autofill/AddressEditorManager;

    iput-boolean v0, p0, Lcom/opera/android/autofill/AddressEditorManager;->b:Z

    iget-wide v0, p0, Lcom/opera/android/autofill/AddressEditorManager;->c:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_15

    invoke-static {v0, v1}, LJ/N;->MGjUO7tV(J)V

    iput-wide v2, p0, Lcom/opera/android/autofill/AddressEditorManager;->c:J

    :cond_15
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 5

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Liq2;->v:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    iget-object p2, p0, Liq2;->s:Lcom/opera/android/autofill/Address;

    iget-object v0, p2, Lcom/opera/android/autofill/Address;->j:Ljava/lang/String;

    sget-object v1, Lew;->b:Lew;

    invoke-virtual {p1, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lew;->c:Lew;

    iget-object v1, p2, Lcom/opera/android/autofill/Address;->e:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lew;->d:Lew;

    iget-object v1, p2, Lcom/opera/android/autofill/Address;->f:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lew;->e:Lew;

    iget-object v1, p2, Lcom/opera/android/autofill/Address;->g:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lew;->f:Lew;

    iget-object v1, p2, Lcom/opera/android/autofill/Address;->i:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lew;->g:Lew;

    iget-object v1, p2, Lcom/opera/android/autofill/Address;->h:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lew;->h:Lew;

    iget-object v1, p2, Lcom/opera/android/autofill/Address;->d:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lew;->i:Lew;

    iget-object v1, p2, Lcom/opera/android/autofill/Address;->c:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lew;->j:Lew;

    iget-object v1, p2, Lcom/opera/android/autofill/Address;->b:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p2, Lcom/opera/android/autofill/Address;->k:Ljava/lang/String;

    iput-object p1, p0, Liq2;->H:Ljava/lang/String;

    iget-object p1, p2, Lcom/opera/android/autofill/Address;->l:Ljava/lang/String;

    iput-object p1, p0, Liq2;->I:Ljava/lang/String;

    invoke-virtual {p0}, Liq2;->N0()V

    new-instance p1, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    const/4 p2, 0x2

    invoke-direct {p1, p2}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(I)V

    iget-object p2, p0, Liq2;->y:Ldq2;

    iput-object p2, p1, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget-object p2, p0, Liq2;->A:Lkf;

    iget-object p2, p2, Lkf;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/theme/ThemeableRecyclerView;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Liq2;->A:Lkf;

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/theme/ThemeableRecyclerView;

    iget-object p2, p0, Liq2;->u:Ldt1;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p0}, Liq2;->K0()V

    invoke-virtual {p0}, Liq2;->N0()V

    return-void
.end method

.method public final u0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    invoke-static {p1, p2}, Lpq3;->b(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lpq3;

    move-result-object p1

    iput-object p1, p0, Liq2;->B:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f140ee9

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Liq2;->B:Lpq3;

    iget-object p1, p1, Lpq3;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lpp2;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lpp2;-><init>(Liq2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Liq2;->B:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    const p2, 0x7f1403bf

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Liq2;->B:Lpq3;

    iget-object p1, p1, Lpq3;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lpp2;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lpp2;-><init>(Liq2;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 5

    const v0, 0x7f0d006f

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz p1, :cond_18

    check-cast p1, Lcom/opera/android/theme/ThemeableRecyclerView;

    new-instance p2, Lkf;

    const/4 v0, 0x4

    invoke-direct {p2, v0, p1, p1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iput-object p2, p0, Liq2;->A:Lkf;

    return-void

    :cond_18
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
