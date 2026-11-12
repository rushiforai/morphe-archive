.class public final Lo35;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lr25;

.field public final b:Lcom/opera/android/ui/catalog/widget/OperaListItem;


# direct methods
.method public constructor <init>(Lp35;Landroid/view/LayoutInflater;Lr25;Z)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lo35;->a:Lr25;

    iget-object v0, p1, Lp35;->t:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    const v2, 0x7f0d0380

    invoke-virtual {p2, v2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iput-object p2, p0, Lo35;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p0, p1, Lp35;->t:Landroid/view/ViewGroup;

    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p0, p3, Lr25;->b:Lrxh;

    invoke-virtual {p2, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    invoke-virtual {p3}, Lr25;->b()I

    move-result p0

    if-eqz p0, :cond_26

    invoke-static {p0, p2}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    :cond_26
    iget p0, p3, Lr25;->d:I

    new-instance p3, Llxh;

    invoke-direct {p3, p0}, Llxh;-><init>(I)V

    invoke-virtual {p2, p3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    new-instance p0, Lvw;

    invoke-direct {p0, p4, p1}, Lvw;-><init>(ZLp35;)V

    iput-object p0, p2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    return-void
.end method
