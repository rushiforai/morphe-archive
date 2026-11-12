.class public final Laq2;
.super Lhq2;
.source "SourceFile"


# instance fields
.field public final b:Lcom/google/android/material/textfield/TextInputLayout;

.field public final synthetic c:Liq2;


# direct methods
.method public constructor <init>(Liq2;Landroid/view/View;)V
    .registers 3

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Laq2;->c:Liq2;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const p2, 0x7f0a05ef

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p1, p0, Laq2;->b:Lcom/google/android/material/textfield/TextInputLayout;

    return-void
.end method
