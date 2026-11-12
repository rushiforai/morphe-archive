.class public final synthetic Lnzg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lozg;

.field public final synthetic c:[[B

.field public final synthetic d:Landroid/widget/TextView;


# direct methods
.method public synthetic constructor <init>(Lozg;[[BLandroid/widget/TextView;B)V
    .registers 5

    iput-byte p4, p0, Lnzg;->a:B

    iput-object p1, p0, Lnzg;->b:Lozg;

    iput-object p2, p0, Lnzg;->c:[[B

    iput-object p3, p0, Lnzg;->d:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, Lnzg;->a:B

    const/4 v1, -0x1

    const/4 v2, 0x0

    iget-object v3, p0, Lnzg;->d:Landroid/widget/TextView;

    iget-object v4, p0, Lnzg;->c:[[B

    iget-object p0, p0, Lnzg;->b:Lozg;

    check-cast p1, Landroid/view/View;

    packed-switch v0, :pswitch_data_8c

    iget-object p1, p0, Lozg;->a:Lumi;

    iget-object v0, p0, Lozg;->d:Lx5f;

    sget-object v5, Len0;->m:Len0;

    invoke-virtual {v0, v5}, Lx5f;->n0(Len0;)V

    iget-boolean v0, p0, Lozg;->e:Z

    const/4 v5, 0x1

    if-eqz v0, :cond_42

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    instance-of v0, v0, Lxzg;

    if-eqz v0, :cond_2c

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lxzg;

    :cond_2c
    if-eqz v2, :cond_31

    invoke-virtual {v2}, Landroidx/fragment/app/i;->dismiss()V

    :cond_31
    new-instance p0, Lrq4;

    invoke-direct {p0, p1, v4, v5}, Lrq4;-><init>(Lumi;[[BZ)V

    invoke-static {p0, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzhj;->c(Landroid/content/Context;)V

    goto :goto_4c

    :cond_42
    new-instance v0, Lqq4;

    iget-object v1, p0, Lozg;->c:Lwzg;

    invoke-direct {v0, p1, v4, v1, v5}, Lqq4;-><init>(Lumi;[[BLwzg;Z)V

    invoke-virtual {p0, v0}, Lj83;->g0(Lj83;)V

    :goto_4c
    return-void

    :pswitch_4d
    iget-object p1, p0, Lozg;->a:Lumi;

    iget-object v0, p0, Lozg;->d:Lx5f;

    sget-object v5, Len0;->j:Len0;

    invoke-virtual {v0, v5}, Lx5f;->n0(Len0;)V

    iget-boolean v0, p0, Lozg;->e:Z

    const/4 v5, 0x0

    if-eqz v0, :cond_80

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    instance-of v0, v0, Lxzg;

    if-eqz v0, :cond_6a

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p0

    move-object v2, p0

    check-cast v2, Lxzg;

    :cond_6a
    if-eqz v2, :cond_6f

    invoke-virtual {v2}, Landroidx/fragment/app/i;->dismiss()V

    :cond_6f
    new-instance p0, Lrq4;

    invoke-direct {p0, p1, v4, v5}, Lrq4;-><init>(Lumi;[[BZ)V

    invoke-static {p0, v1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzhj;->c(Landroid/content/Context;)V

    goto :goto_8a

    :cond_80
    new-instance v0, Lqq4;

    iget-object v1, p0, Lozg;->c:Lwzg;

    invoke-direct {v0, p1, v4, v1, v5}, Lqq4;-><init>(Lumi;[[BLwzg;Z)V

    invoke-virtual {p0, v0}, Lj83;->g0(Lj83;)V

    :goto_8a
    return-void

    nop

    :pswitch_data_8c
    .packed-switch 0x0
        :pswitch_4d
    .end packed-switch
.end method
