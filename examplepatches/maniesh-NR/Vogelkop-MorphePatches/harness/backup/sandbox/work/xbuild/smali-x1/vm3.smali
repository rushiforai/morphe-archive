.class public final Lvm3;
.super Loph;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(ILmrk;)V
    .registers 4

    const/4 v0, 0x4

    iput-byte v0, p0, Lvm3;->a:B

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput-boolean p1, p0, Lvm3;->b:Z

    iput-object p2, p0, Lvm3;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lcve;B)V
    .registers 3

    .line 14
    iput-byte p2, p0, Lvm3;->a:B

    iput-object p1, p0, Lvm3;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lgn3;)V
    .registers 3

    const/4 v0, 0x0

    iput-byte v0, p0, Lvm3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lvm3;->c:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lqtj;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lvm3;->a:B

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lvm3;->c:Ljava/lang/Object;

    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Lvm3;->b:Z

    return-void
.end method


# virtual methods
.method public final onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .registers 9

    iget-byte v0, p0, Lvm3;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object v3, p0, Lvm3;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_ae

    iget-boolean p0, p0, Lvm3;->b:Z

    if-eqz p0, :cond_1a

    const/4 p0, -0x1

    invoke-virtual {p1, p0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p0

    if-nez p0, :cond_1a

    invoke-virtual {p1, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p0

    if-eqz p0, :cond_29

    :cond_1a
    check-cast v3, Lmrk;

    iget-object p0, v3, Lmrk;->c:Lfbf;

    iget-object p0, p0, Lfbf;->a:Lgbf;

    iget-object p0, p0, Lgbf;->t:Lbpd;

    invoke-virtual {p0}, Lbpd;->y()Lupm;

    move-result-object p0

    invoke-interface {p0}, Lupm;->h()V

    :cond_29
    return-void

    :pswitch_2a
    if-nez p2, :cond_37

    iget-boolean p1, p0, Lvm3;->b:Z

    if-eqz p1, :cond_37

    iput-boolean v1, p0, Lvm3;->b:Z

    check-cast v3, Lqtj;

    invoke-virtual {v3}, Lqtj;->snapToTargetExistingView()V

    :cond_37
    return-void

    :pswitch_38
    iget-boolean v0, p0, Lvm3;->b:Z

    if-nez v0, :cond_63

    if-nez p2, :cond_63

    invoke-static {p1}, Lexg;->t(Landroidx/recyclerview/widget/RecyclerView;)Z

    move-result p1

    if-nez p1, :cond_63

    check-cast v3, Lkve;

    iget-object p1, v3, Lkve;->h:Lx5f;

    iget-boolean p2, p1, Lx5f;->h:Z

    if-eqz p2, :cond_61

    iget-object p2, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v0

    invoke-virtual {v0, p2}, Lx56;->E(Lzpa;)Lfi0;

    move-result-object v1

    invoke-virtual {v1, p2}, Lfi0;->z(Lzpa;)Llj0;

    move-result-object p2

    const/4 v1, 0x7

    invoke-virtual {p2, v1}, Ljf0;->e(I)V

    invoke-virtual {p1, v0}, Lx5f;->U0(Lx56;)V

    :cond_61
    iput-boolean v2, p0, Lvm3;->b:Z

    :cond_63
    return-void

    :pswitch_64
    iget-boolean v0, p0, Lvm3;->b:Z

    if-nez v0, :cond_99

    if-nez p2, :cond_99

    invoke-static {p1}, Lexg;->t(Landroidx/recyclerview/widget/RecyclerView;)Z

    move-result p1

    if-nez p1, :cond_99

    check-cast v3, Ljve;

    iget-object p1, v3, Ljve;->m:Lnb8;

    if-eqz p1, :cond_97

    iget-object p2, v3, Ljve;->i:Lx5f;

    iget-object p1, p1, Lnb8;->i:Ljava/lang/String;

    iget-boolean v0, p2, Lx5f;->h:Z

    if-eqz v0, :cond_97

    iget-object v0, p2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v3, Lck0;

    invoke-direct {v3, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v0, Lj5f;

    sget-object v4, Lod0;->b:Lod0;

    const/4 v5, 0x3

    invoke-direct {v0, p1, v4, v5}, Lj5f;-><init>(Ljava/lang/String;Lod0;I)V

    invoke-virtual {v3, v0}, Lck0;->j(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p2, v1}, Lx5f;->U0(Lx56;)V

    :cond_97
    iput-boolean v2, p0, Lvm3;->b:Z

    :cond_99
    return-void

    :pswitch_9a
    if-nez p2, :cond_9d

    move v1, v2

    :cond_9d
    iput-boolean v1, p0, Lvm3;->b:Z

    check-cast v3, Lgn3;

    invoke-virtual {v3}, Lgn3;->b()Lym3;

    move-result-object p0

    if-eqz p0, :cond_ac

    iget-object p0, p0, Lym3;->b:Landroid/util/SparseArray;

    invoke-virtual {p1, p0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    :cond_ac
    return-void

    nop

    :pswitch_data_ae
    .packed-switch 0x0
        :pswitch_9a
        :pswitch_64
        :pswitch_38
        :pswitch_2a
    .end packed-switch
.end method

.method public final onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 5

    iget-byte v0, p0, Lvm3;->a:B

    sparse-switch v0, :sswitch_data_22

    return-void

    :sswitch_6
    if-nez p2, :cond_a

    if-eqz p3, :cond_d

    :cond_a
    const/4 p1, 0x1

    iput-boolean p1, p0, Lvm3;->b:Z

    :cond_d
    return-void

    :sswitch_e
    iget-boolean p2, p0, Lvm3;->b:Z

    if-eqz p2, :cond_21

    iget-object p0, p0, Lvm3;->c:Ljava/lang/Object;

    check-cast p0, Lgn3;

    invoke-virtual {p0}, Lgn3;->b()Lym3;

    move-result-object p0

    if-eqz p0, :cond_21

    iget-object p0, p0, Lym3;->b:Landroid/util/SparseArray;

    invoke-virtual {p1, p0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    :cond_21
    return-void

    :sswitch_data_22
    .sparse-switch
        0x0 -> :sswitch_e
        0x3 -> :sswitch_6
    .end sparse-switch
.end method
