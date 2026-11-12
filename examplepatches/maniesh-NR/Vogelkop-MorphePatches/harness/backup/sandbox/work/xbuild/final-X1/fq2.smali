.class public final Lfq2;
.super Ltp2;
.source "SourceFile"


# instance fields
.field public final c:Lcom/google/android/material/textfield/TextInputLayout;

.field public final d:Landroid/widget/AutoCompleteTextView;

.field public e:Landroid/widget/ArrayAdapter;

.field public f:Lgq2;

.field public final synthetic g:Liq2;


# direct methods
.method public constructor <init>(Liq2;Landroid/view/View;)V
    .registers 3

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lfq2;->g:Liq2;

    invoke-direct {p0, p1, p2}, Ltp2;-><init>(Liq2;Landroid/view/View;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const p2, 0x7f0a0097

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p1, p0, Lfq2;->c:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const p2, 0x7f0a0098

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/AutoCompleteTextView;

    iput-object p1, p0, Lfq2;->d:Landroid/widget/AutoCompleteTextView;

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 3

    iget-object v0, p0, Lfq2;->f:Lgq2;

    if-eqz v0, :cond_c

    iget-object v1, p0, Lfq2;->e:Landroid/widget/ArrayAdapter;

    invoke-virtual {v1, v0}, Landroid/widget/BaseAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lfq2;->f:Lgq2;

    :cond_c
    return-void
.end method

.method public final V(Lfw;)V
    .registers 10

    invoke-virtual {p0, p1}, Ltp2;->X(Lfw;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lfq2;->c:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    new-instance v0, Lzp2;

    const/4 v2, 0x1

    invoke-direct {v0, p0, v2}, Lzp2;-><init>(Ljava/lang/Object;B)V

    iget-object v3, p0, Lfq2;->d:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v3, v0}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object v0, p1, Lfw;->a:Lew;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    const v5, 0x7f0d03b6

    iget-object v6, p0, Lfq2;->g:Liq2;

    if-eqz v4, :cond_30

    if-eq v4, v2, :cond_24

    return-void

    :cond_24
    new-instance v2, Landroid/widget/ArrayAdapter;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v7, v6, Liq2;->D:Ljava/util/ArrayList;

    invoke-direct {v2, v4, v5, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    goto :goto_3b

    :cond_30
    new-instance v2, Landroid/widget/ArrayAdapter;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v7, v6, Liq2;->C:Ljava/util/ArrayList;

    invoke-direct {v2, v4, v5, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    :goto_3b
    invoke-virtual {v3, v2}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    iput-object v2, p0, Lfq2;->e:Landroid/widget/ArrayAdapter;

    new-instance v4, Lgq2;

    invoke-direct {v4, v6, v0, v2, v3}, Lgq2;-><init>(Liq2;Lew;Landroid/widget/ArrayAdapter;Landroid/widget/AutoCompleteTextView;)V

    iput-object v4, p0, Lfq2;->f:Lgq2;

    iget-object v5, p0, Lfq2;->e:Landroid/widget/ArrayAdapter;

    invoke-virtual {v5, v4}, Landroid/widget/BaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    new-instance v4, Leq2;

    invoke-direct {v4, p0, v2, p1}, Leq2;-><init>(Lfq2;Landroid/widget/ArrayAdapter;Lfw;)V

    invoke-virtual {v3, v4}, Landroid/widget/AutoCompleteTextView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p0, v6, Liq2;->v:Ljava/util/HashMap;

    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    const/4 v0, 0x0

    :goto_5d
    invoke-virtual {v2}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v3

    if-ge v0, v3, :cond_80

    invoke-virtual {v2, v0}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lsp2;

    iget-object v3, v3, Lsp2;->a:Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7d

    invoke-virtual {v2, v0}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsp2;

    iget-object p0, p0, Lsp2;->b:Ljava/lang/String;

    invoke-static {v1, p0}, Lq9n;->F(Lcom/google/android/material/textfield/TextInputLayout;Ljava/lang/CharSequence;)V

    goto :goto_80

    :cond_7d
    add-int/lit8 v0, v0, 0x1

    goto :goto_5d

    :cond_80
    :goto_80
    iget-object p0, p1, Lfw;->e:Ljava/lang/String;

    invoke-virtual {v1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void
.end method
