.class public final Lw6n;
.super Lz6n;
.source "SourceFile"


# instance fields
.field public final b:Lnck;

.field public final c:Ltjn;

.field public d:I

.field public final e:Lpyl;


# direct methods
.method public constructor <init>(Lnck;ILagm;Ltjn;)V
    .registers 6

    iget-object v0, p1, Lnck;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lw6n;->b:Lnck;

    iput-object p4, p0, Lw6n;->c:Ltjn;

    const/16 v0, 0x16

    iput v0, p0, Lw6n;->d:I

    new-instance v0, Lpyl;

    iget-object p1, p1, Lnck;->d:Lcom/opera/android/custom_views/StylingImageView;

    invoke-direct {v0, p1, p3, p2, p4}, Lpyl;-><init>(Landroid/view/View;Lagm;ILtjn;)V

    iput-object v0, p0, Lw6n;->e:Lpyl;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    invoke-interface {p4}, Ltjn;->a()I

    move-result p3

    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    invoke-interface {p4}, Ltjn;->a()I

    move-result p3

    iput p3, p2, Landroid/view/ViewGroup$LayoutParams;->height:I

    new-instance p2, Lpkm;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p3}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
