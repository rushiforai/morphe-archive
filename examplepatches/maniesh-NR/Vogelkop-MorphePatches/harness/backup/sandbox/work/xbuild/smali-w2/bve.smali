.class public final Lbve;
.super Lcve;
.source "SourceFile"


# instance fields
.field public final synthetic h:B

.field public final i:Lkf;


# direct methods
.method public constructor <init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;Lx5f;B)V
    .registers 9

    iput-byte p8, p0, Lbve;->h:B

    packed-switch p8, :pswitch_data_3a

    invoke-direct/range {p0 .. p6}, Lcve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;)V

    invoke-static {p1}, Lkf;->d(Landroid/view/View;)Lkf;

    move-result-object p1

    iput-object p1, p0, Lbve;->i:Lkf;

    iget-object p0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p1, Lz6b;

    new-instance p2, Lave;

    const/4 p3, 0x0

    invoke-direct {p2, p7, p3}, Lave;-><init>(Lx5f;B)V

    invoke-direct {p1, p2}, Lz6b;-><init>(Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    return-void

    :pswitch_1f
    invoke-direct/range {p0 .. p6}, Lcve;-><init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;)V

    invoke-static {p1}, Lkf;->d(Landroid/view/View;)Lkf;

    move-result-object p1

    iput-object p1, p0, Lbve;->i:Lkf;

    iget-object p0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p1, Lz6b;

    new-instance p2, Lave;

    const/4 p3, 0x1

    invoke-direct {p2, p7, p3}, Lave;-><init>(Lx5f;B)V

    invoke-direct {p1, p2}, Lz6b;-><init>(Lkotlin/jvm/functions/Function0;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    return-void

    nop

    :pswitch_data_3a
    .packed-switch 0x1
        :pswitch_1f
    .end packed-switch
.end method


# virtual methods
.method public final f0()[Landroid/view/View;
    .registers 4

    iget-byte v0, p0, Lbve;->h:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Lbve;->i:Lkf;

    packed-switch v0, :pswitch_data_1c

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-array v0, v2, [Landroid/view/View;

    aput-object p0, v0, v1

    return-object v0

    :pswitch_12
    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-array v0, v2, [Landroid/view/View;

    aput-object p0, v0, v1

    return-object v0

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
