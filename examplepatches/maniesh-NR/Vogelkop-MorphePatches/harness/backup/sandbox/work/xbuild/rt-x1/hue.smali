.class public final Lhue;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final synthetic b:Lkue;

.field public final c:Lcom/opera/android/ui/catalog/widget/OperaChip;


# direct methods
.method public constructor <init>(Lkue;Landroid/view/View;)V
    .registers 4

    iput-object p1, p0, Lhue;->b:Lkue;

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iget-object p1, p1, Lkue;->h:Ljava/util/HashSet;

    invoke-virtual {p1, p0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    const p1, 0x7f0a0757

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaChip;

    iput-object p1, p0, Lhue;->c:Lcom/opera/android/ui/catalog/widget/OperaChip;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    new-instance p1, Lzvd;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
