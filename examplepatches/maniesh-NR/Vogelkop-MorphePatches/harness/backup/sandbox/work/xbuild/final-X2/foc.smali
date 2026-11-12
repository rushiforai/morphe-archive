.class public final Lfoc;
.super Lzkc;
.source "SourceFile"


# instance fields
.field public final c:Lalc;

.field public final d:Lokc;

.field public final e:Li16;

.field public final f:Ligi;

.field public g:Lpmc;


# direct methods
.method public constructor <init>(Lalc;Lokc;Lpkc;Lnoc;)V
    .registers 8

    iget-object v0, p1, Lalc;->b:Landroid/view/View;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lfoc;->c:Lalc;

    iput-object p2, p0, Lfoc;->d:Lokc;

    new-instance p2, Li16;

    iget-object v0, p1, Lalc;->e:Lmlc;

    new-instance v1, Leoc;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Leoc;-><init>(Lfoc;B)V

    const/4 v2, 0x2

    invoke-direct {p2, v0, v1, v2}, Li16;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p2, p0, Lfoc;->e:Li16;

    new-instance p2, Ligi;

    iget-object v0, p1, Lalc;->d:Ly83;

    new-instance v1, Leoc;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Leoc;-><init>(Lfoc;B)V

    invoke-direct {p2, v0, v1, p3, p4}, Ligi;-><init>(Ly83;Lkotlin/jvm/functions/Function0;Lpkc;Lnoc;)V

    iput-object p2, p0, Lfoc;->f:Ligi;

    iget-object p1, p1, Lalc;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance p2, Lsma;

    const/16 p3, 0xd

    invoke-direct {p2, p0, p3}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lzt;

    const/16 p3, 0x9

    invoke-direct {p2, p0, p3}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method


# virtual methods
.method public final U()V
    .registers 2

    iget-object p0, p0, Lfoc;->f:Ligi;

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Ly83;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Ligi;->r0(Ly83;Z)V

    return-void
.end method

.method public final V()V
    .registers 1

    iget-object p0, p0, Lfoc;->f:Ligi;

    invoke-virtual {p0}, Ligi;->a0()V

    return-void
.end method
