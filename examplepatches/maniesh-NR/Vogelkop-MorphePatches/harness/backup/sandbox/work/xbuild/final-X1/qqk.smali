.class public final Lqqk;
.super Lro9;
.source "SourceFile"


# instance fields
.field public final l:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>()V
    .registers 2

    const/16 v0, 0x1c

    invoke-direct {p0, v0}, Lro9;-><init>(B)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lqqk;->l:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final t(I)Landroidx/recyclerview/widget/i;
    .registers 2

    invoke-super {p0, p1}, Lro9;->t(I)Landroidx/recyclerview/widget/i;

    move-result-object p1

    if-eqz p1, :cond_13

    iget-object p0, p0, Lqqk;->l:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_13

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0}, Lu8n;->g(Landroid/view/View;)V

    :cond_13
    return-object p1
.end method
