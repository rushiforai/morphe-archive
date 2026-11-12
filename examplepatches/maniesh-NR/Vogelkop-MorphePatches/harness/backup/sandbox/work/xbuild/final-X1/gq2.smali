.class public final Lgq2;
.super Landroid/database/DataSetObserver;
.source "SourceFile"


# instance fields
.field public final a:Lew;

.field public final b:Landroid/widget/ArrayAdapter;

.field public final c:Landroid/widget/AutoCompleteTextView;

.field public final synthetic d:Liq2;


# direct methods
.method public constructor <init>(Liq2;Lew;Landroid/widget/ArrayAdapter;Landroid/widget/AutoCompleteTextView;)V
    .registers 5

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lgq2;->d:Liq2;

    invoke-direct {p0}, Landroid/database/DataSetObserver;-><init>()V

    iput-object p2, p0, Lgq2;->a:Lew;

    iput-object p3, p0, Lgq2;->b:Landroid/widget/ArrayAdapter;

    iput-object p4, p0, Lgq2;->c:Landroid/widget/AutoCompleteTextView;

    return-void
.end method


# virtual methods
.method public final onChanged()V
    .registers 5

    iget-object v0, p0, Lgq2;->d:Liq2;

    iget-object v0, v0, Liq2;->v:Ljava/util/HashMap;

    iget-object v1, p0, Lgq2;->a:Lew;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const/4 v1, 0x0

    :goto_d
    iget-object v2, p0, Lgq2;->b:Landroid/widget/ArrayAdapter;

    invoke-virtual {v2}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v3

    if-ge v1, v3, :cond_2c

    invoke-virtual {v2, v1}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsp2;

    iget-object v2, v2, Lsp2;->a:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_29

    iget-object p0, p0, Lgq2;->c:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p0, v1}, Landroid/widget/AutoCompleteTextView;->setListSelection(I)V

    return-void

    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    :cond_2c
    return-void
.end method

.method public final onInvalidated()V
    .registers 1

    return-void
.end method
