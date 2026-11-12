.class public final Lss8;
.super Lk6k;
.source "SourceFile"


# instance fields
.field public final synthetic d:B

.field public final e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Li7k;Lmbf;Le6k;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Lss8;->d:B

    iput-object p1, p0, Lss8;->e:Ljava/lang/Object;

    iput-object p2, p0, Lss8;->f:Ljava/lang/Object;

    .line 22
    invoke-direct {p0, p3, p1}, Lk6k;-><init>(Le6k;Lu5k;)V

    return-void
.end method

.method public constructor <init>(Lts8;Le6k;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lss8;->d:B

    iput-object p1, p0, Lss8;->f:Ljava/lang/Object;

    invoke-direct {p0, p2, p1}, Lk6k;-><init>(Le6k;Lu5k;)V

    new-instance p2, Lhv8;

    iget-object p1, p1, Lts8;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Lhv8;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lss8;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a()Lkv8;
    .registers 2

    iget-byte v0, p0, Lss8;->d:B

    packed-switch v0, :pswitch_data_12

    sget-object p0, Ljv8;->a:Ljv8;

    sget-object p0, Ljv8;->b:Lkv8;

    return-object p0

    :pswitch_a
    iget-object p0, p0, Lss8;->e:Ljava/lang/Object;

    check-cast p0, Lhv8;

    iget-object p0, p0, Lhv8;->e:Lkv8;

    return-object p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final b(Le6k;)Lmv8;
    .registers 3

    iget-byte v0, p0, Lss8;->d:B

    packed-switch v0, :pswitch_data_16

    sget-object p0, Ljv8;->a:Ljv8;

    return-object p0

    :pswitch_8
    sget-object v0, Le6k;->h:Le6k;

    if-ne p1, v0, :cond_11

    iget-object p0, p0, Lss8;->e:Ljava/lang/Object;

    check-cast p0, Lhv8;

    goto :goto_15

    :cond_11
    invoke-super {p0, p1}, Lk6k;->b(Le6k;)Lmv8;

    move-result-object p0

    :goto_15
    return-object p0

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_8
    .end packed-switch
.end method

.method public final c(Lbz3;)I
    .registers 3

    iget-byte v0, p0, Lss8;->d:B

    packed-switch v0, :pswitch_data_2c

    iget-object p0, p0, Lss8;->e:Ljava/lang/Object;

    check-cast p0, Li7k;

    iget-object p0, p0, Li7k;->j:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lh7k;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    :pswitch_18
    iget-object p0, p0, Lss8;->f:Ljava/lang/Object;

    check-cast p0, Lts8;

    iget-object p0, p0, Lts8;->u:Lagm;

    invoke-virtual {p0}, Lagm;->q()Lab2;

    move-result-object p0

    check-cast p0, Lrs8;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0, p1}, Ljym;->j(Landroid/view/View;Lbz3;)I

    move-result p0

    return p0

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_18
    .end packed-switch
.end method

.method public final d(Lbz3;)Z
    .registers 4

    iget-byte v0, p0, Lss8;->d:B

    iget-object v1, p0, Lss8;->f:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_30

    iget-object p0, p0, Lss8;->e:Ljava/lang/Object;

    check-cast p0, Li7k;

    invoke-virtual {p0}, Li7k;->z()Z

    move-result p0

    if-eqz p0, :cond_1b

    sget-object p0, Le6k;->d:Le6k;

    invoke-virtual {p1, p0}, Lbz3;->b(Le6k;)Z

    move-result p0

    if-nez p0, :cond_1b

    const/4 p0, 0x1

    goto :goto_1c

    :cond_1b
    const/4 p0, 0x0

    :goto_1c
    check-cast v1, Lmbf;

    iget-object p1, v1, Lmbf;->f:Lpde;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return p0

    :pswitch_28
    check-cast v1, Lts8;

    invoke-virtual {v1}, Lts8;->z()Z

    move-result p0

    return p0

    nop

    :pswitch_data_30
    .packed-switch 0x0
        :pswitch_28
    .end packed-switch
.end method
