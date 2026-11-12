.class public final Low8;
.super Lcu8;
.source "SourceFile"


# instance fields
.field public final synthetic m:Lxw8;


# direct methods
.method public constructor <init>(Lxw8;Ltni;)V
    .registers 3

    iput-object p1, p0, Low8;->m:Lxw8;

    invoke-direct {p0, p2}, Lcu8;-><init>(Ltni;)V

    return-void
.end method


# virtual methods
.method public final P(Landroid/view/ViewGroup;I)Lab2;
    .registers 4

    invoke-super {p0, p1, p2}, Lha2;->P(Landroid/view/ViewGroup;I)Lab2;

    move-result-object p1

    iget-object p0, p0, Low8;->m:Lxw8;

    iget-object p0, p0, Lxw8;->u:Lisd;

    invoke-virtual {p1}, Lab2;->U()I

    move-result v0

    iget-object p0, p0, Lisd;->b:Ljava/lang/Object;

    check-cast p0, Landroid/util/SparseIntArray;

    invoke-virtual {p0, p2, v0}, Landroid/util/SparseIntArray;->put(II)V

    return-object p1
.end method

.method public final bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 3

    invoke-virtual {p0, p1, p2}, Low8;->P(Landroid/view/ViewGroup;I)Lab2;

    move-result-object p0

    return-object p0
.end method
