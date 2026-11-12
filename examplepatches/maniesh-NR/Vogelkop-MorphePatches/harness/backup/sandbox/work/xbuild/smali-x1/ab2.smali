.class public abstract Lab2;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public b:Lja2;

.field public final c:Lkze;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    new-instance p1, Lkze;

    sget-object v0, Log;->a:Log;

    invoke-direct {p1, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lab2;->c:Lkze;

    return-void
.end method


# virtual methods
.method public U()I
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public V(Lja2;Z)V
    .registers 3

    return-void
.end method

.method public X(Z)V
    .registers 2

    return-void
.end method

.method public Y()V
    .registers 1

    return-void
.end method

.method public Z()Lmq;
    .registers 1

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lmq;

    return-object p0
.end method

.method public final a0()Lja2;
    .registers 1

    iget-object p0, p0, Lab2;->b:Lja2;

    if-eqz p0, :cond_5

    return-object p0

    :cond_5
    const-string p0, "Item is null"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public onDestroy()V
    .registers 1

    return-void
.end method
