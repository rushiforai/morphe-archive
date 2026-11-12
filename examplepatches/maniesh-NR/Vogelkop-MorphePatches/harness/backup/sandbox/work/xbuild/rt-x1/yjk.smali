.class public final Lyjk;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lb7k;

.field public c:Late;


# direct methods
.method public constructor <init>(Lb7k;)V
    .registers 4

    iget-object v0, p1, Lb7k;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lyjk;->b:Lb7k;

    iget-object p1, p1, Lb7k;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v0, Lkkf;

    const/16 v1, 0x1d

    invoke-direct {v0, p0, v1}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_1b

    return-void

    :cond_1b
    invoke-static {p0, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method
