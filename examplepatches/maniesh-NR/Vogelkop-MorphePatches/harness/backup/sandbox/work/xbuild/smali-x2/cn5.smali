.class public final Lcn5;
.super Lbn5;
.source "SourceFile"


# instance fields
.field public final b:Ljt;

.field public final c:Ljl4;


# direct methods
.method public constructor <init>(Ljt;Ljl4;)V
    .registers 4

    iget-object v0, p1, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lcn5;->b:Ljt;

    iput-object p2, p0, Lcn5;->c:Ljl4;

    return-void
.end method


# virtual methods
.method public final U(Lgn5;I)V
    .registers 6

    check-cast p1, Ldn5;

    iget-object v0, p0, Lcn5;->b:Ljt;

    iget-object v0, v0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget v1, p1, Ldn5;->b:I

    new-instance v2, Lrxh;

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget v1, p1, Ldn5;->c:I

    invoke-static {v1, v0}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iget-boolean v1, p1, Ldn5;->e:Z

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    iget-boolean v1, p1, Ldn5;->f:Z

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setEnabled(Z)V

    new-instance v1, Lso4;

    const/4 v2, 0x1

    invoke-direct {v1, p0, p1, p2, v2}, Lso4;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    iput-object v1, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    return-void
.end method

.method public final V()V
    .registers 2

    iget-object p0, p0, Lcn5;->b:Ljt;

    iget-object p0, p0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    return-void
.end method
