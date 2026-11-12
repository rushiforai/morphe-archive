.class public final Lvr2;
.super Lct2;
.source "SourceFile"


# instance fields
.field public final b:Lvs;

.field public final synthetic c:Lwr2;


# direct methods
.method public constructor <init>(Lwr2;Lvs;Z)V
    .registers 4

    iput-object p1, p0, Lvr2;->c:Lwr2;

    iget-object p1, p2, Lvs;->b:Landroid/view/ViewGroup;

    check-cast p1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lvr2;->b:Lvs;

    iget-object p0, p2, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    if-eqz p3, :cond_13

    const/4 p1, 0x0

    goto :goto_15

    :cond_13
    const/16 p1, 0x8

    :goto_15
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method
