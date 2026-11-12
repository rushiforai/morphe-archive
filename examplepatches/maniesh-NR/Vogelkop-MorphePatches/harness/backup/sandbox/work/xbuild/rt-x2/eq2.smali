.class public final synthetic Leq2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field public final synthetic a:Lfq2;

.field public final synthetic b:Landroid/widget/ArrayAdapter;

.field public final synthetic c:Lfw;


# direct methods
.method public synthetic constructor <init>(Lfq2;Landroid/widget/ArrayAdapter;Lfw;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Leq2;->a:Lfq2;

    iput-object p2, p0, Leq2;->b:Landroid/widget/ArrayAdapter;

    iput-object p3, p0, Leq2;->c:Lfw;

    return-void
.end method


# virtual methods
.method public final onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6

    iget-object p1, p0, Leq2;->b:Landroid/widget/ArrayAdapter;

    invoke-virtual {p1, p3}, Landroid/widget/ArrayAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsp2;

    iget-object p1, p1, Lsp2;->a:Ljava/lang/String;

    iget-object p2, p0, Leq2;->a:Lfq2;

    iget-object p3, p2, Lfq2;->g:Liq2;

    iget-object p0, p0, Leq2;->c:Lfw;

    iget-object p4, p0, Lfw;->a:Lew;

    invoke-virtual {p3, p4, p1}, Liq2;->O0(Lew;Ljava/lang/String;)V

    invoke-virtual {p2, p0, p1}, Ltp2;->Y(Lfw;Ljava/lang/String;)V

    iget-object p1, p2, Lfq2;->c:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p0, p0, Lfw;->e:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    return-void
.end method
