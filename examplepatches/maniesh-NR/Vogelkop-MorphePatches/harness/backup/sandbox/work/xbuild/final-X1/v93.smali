.class public final Lv93;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lcq3;


# direct methods
.method public constructor <init>(Ly93;Lcq3;)V
    .registers 5

    iget-object v0, p2, Lcq3;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lv93;->b:Lcq3;

    iget-object p2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v0, Lnf;

    const/16 v1, 0xf

    invoke-direct {v0, p0, p1, v1}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
