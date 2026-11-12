.class public final Lcom/opera/android/history/h;
.super Lo73;
.source "SourceFile"


# instance fields
.field public final synthetic j:Lztn;

.field public final synthetic k:Lcom/opera/android/history/g;


# direct methods
.method public constructor <init>(Lztn;Lcom/opera/android/history/g;)V
    .registers 3

    iput-object p1, p0, Lcom/opera/android/history/h;->j:Lztn;

    iput-object p2, p0, Lcom/opera/android/history/h;->k:Lcom/opera/android/history/g;

    invoke-direct {p0}, Lo73;-><init>()V

    return-void
.end method


# virtual methods
.method public final m(Lr9i;Landroid/view/View;)V
    .registers 3

    const p0, 0x7f100010

    invoke-virtual {p1, p0}, Lr9i;->L(I)V

    iget-object p0, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lm66;

    const p1, 0x7f0a0694

    invoke-virtual {p0, p1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    const/4 p2, 0x0

    invoke-interface {p1, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const p1, 0x7f0a06a2

    invoke-virtual {p0, p1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 8

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a069a

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/opera/android/history/h;->j:Lztn;

    const/4 v4, 0x1

    iget-object p0, p0, Lcom/opera/android/history/h;->k:Lcom/opera/android/history/g;

    if-ne v0, v1, :cond_21

    iget-object p1, v3, Lztn;->c:Lga6;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    iget-object p1, p1, Lga6;->b:Ljava/lang/Object;

    check-cast p1, Ldda;

    invoke-virtual {p1}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p1

    invoke-virtual {p1, p0, v2}, Lcom/opera/android/history/f;->h(Ljava/util/List;Z)V

    return v4

    :cond_21
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0699

    if-ne v0, v1, :cond_3c

    iget-object p1, v3, Lztn;->c:Lga6;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    iget-object p1, p1, Lga6;->b:Ljava/lang/Object;

    check-cast p1, Ldda;

    invoke-virtual {p1}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p1

    invoke-virtual {p1, p0, v4}, Lcom/opera/android/history/f;->h(Ljava/util/List;Z)V

    return v4

    :cond_3c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0691

    if-ne v0, v1, :cond_5e

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lcom/opera/android/history/g;->b:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {p0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getId()J

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Long;

    move-result-object p0

    invoke-static {p0}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {v3, p0}, Lztn;->L(Ljava/util/List;)V

    return v4

    :cond_5e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a068e

    if-ne v0, v1, :cond_75

    iget-object p1, v3, Lztn;->a:Landroidx/fragment/app/r;

    iget-object p0, p0, Lcom/opera/android/history/g;->a:Lcom/opera/android/history/c;

    iget-object p0, p0, Lcom/opera/android/history/c;->a:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {p0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getUrl()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Llcp;->m(Landroid/content/Context;Ljava/lang/String;)V

    return v4

    :cond_75
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a06a1

    if-ne p1, v0, :cond_a5

    new-instance p1, Lghf;

    iget-object v0, p0, Lcom/opera/android/history/g;->a:Lcom/opera/android/history/c;

    iget-object v0, v0, Lcom/opera/android/history/c;->a:Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    invoke-interface {v0}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getUrl()Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/history/g;->e:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    new-instance v1, Li4d;

    new-instance v2, Le5f;

    const/16 v5, 0xa

    invoke-direct {v2, v0, p0, v5}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-direct {v1, v2}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {p1, v1}, Lghf;-><init>(Li4d;)V

    iget-object p0, v3, Lztn;->a:Landroidx/fragment/app/r;

    invoke-virtual {p1, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    return v4

    :cond_a5
    return v2
.end method
