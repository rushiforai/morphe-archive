.class public final Lcu;
.super Leu;
.source "SourceFile"

# interfaces
.implements Lh4a;


# instance fields
.field public final c:Ljt;

.field public final d:Lbs;

.field public e:Lis;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lbs;)V
    .registers 6

    const v0, 0x7f0d0030

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p1, v0, v1, v2}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_32

    new-instance v0, Ljt;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {v0, p1, v2}, Ljt;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;B)V

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lcu;->c:Ljt;

    iput-object p2, p0, Lcu;->d:Lbs;

    new-instance p2, Lgf;

    const/4 v0, 0x6

    invoke-direct {p2, p0, v0}, Lgf;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lks8;

    const/4 v1, 0x2

    invoke-direct {v0, p2, v1}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lzt;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void

    :cond_32
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public final U(Ljs;)V
    .registers 5

    check-cast p1, Lis;

    iput-object p1, p0, Lcu;->e:Lis;

    iget-object p1, p1, Lis;->c:Lst;

    iget-object v0, p1, Lst;->d:Ljava/lang/Integer;

    iget-object p0, p0, Lcu;->c:Ljt;

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    iget-object v1, p0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v2, Llxh;

    invoke-direct {v2, v0}, Llxh;-><init>(I)V

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    :cond_1a
    iget-object p0, p0, Ljt;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v0, p1, Lst;->a:Lpxh;

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object v0, p1, Lst;->b:Ljava/lang/String;

    invoke-static {p0, v0}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-boolean p1, p1, Lst;->k:Z

    if-eqz p1, :cond_33

    new-instance p1, Llxh;

    const v0, 0x7f0805ee

    invoke-direct {p1, v0}, Llxh;-><init>(I)V

    goto :goto_3b

    :cond_33
    new-instance p1, Llxh;

    const v0, 0x7f0804e3

    invoke-direct {p1, v0}, Llxh;-><init>(I)V

    :goto_3b
    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->v(Lb8h;)V

    return-void
.end method

.method public final l(Landroid/graphics/Rect;)V
    .registers 2

    const/4 p0, 0x0

    invoke-virtual {p1, p0, p0, p0, p0}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method
