.class public final Lal4;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lvs;

.field public c:Lcom/opera/android/autofill/CreditCard;

.field public final synthetic d:Lyw;


# direct methods
.method public constructor <init>(Lyw;Lvs;)V
    .registers 4

    iput-object p1, p0, Lal4;->d:Lyw;

    iget-object p1, p2, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lal4;->b:Lvs;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lu7;

    const/16 v0, 0x1a

    invoke-direct {p2, p0, v0}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method
