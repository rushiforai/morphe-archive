.class public final synthetic Lb0h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lf0h;


# direct methods
.method public synthetic constructor <init>(Lf0h;B)V
    .registers 3

    iput-byte p2, p0, Lb0h;->a:B

    iput-object p1, p0, Lb0h;->b:Lf0h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte v0, p0, Lb0h;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lb0h;->b:Lf0h;

    packed-switch v0, :pswitch_data_6c

    sget-object p1, Len0;->b:Len0;

    iget-object v0, p0, Lf0h;->d:Lx5f;

    invoke-virtual {v0, p1}, Lx5f;->n0(Len0;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    instance-of p1, p1, Lxzg;

    if-eqz p1, :cond_1e

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lxzg;

    :cond_1e
    if-eqz v1, :cond_23

    invoke-virtual {v1}, Landroidx/fragment/app/i;->dismiss()V

    :cond_23
    iget-object p0, p0, Lf0h;->f:Lgjm;

    new-instance p1, Lqk;

    invoke-direct {p1}, Lqk;-><init>()V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_2f
    iget-object p1, p0, Lf0h;->d:Lx5f;

    sget-object v0, Len0;->f:Len0;

    invoke-virtual {p1, v0}, Lx5f;->n0(Len0;)V

    new-instance v0, Li0h;

    iget-object v1, p0, Lf0h;->f:Lgjm;

    iget-object v2, p0, Lf0h;->b:Lp0h;

    invoke-direct {v0, v1, v2, p1}, Li0h;-><init>(Lgjm;Lp0h;Lx5f;)V

    invoke-virtual {p0, v0}, Lj83;->g0(Lj83;)V

    return-void

    :pswitch_43
    sget-object v0, Len0;->c:Len0;

    iget-object v2, p0, Lf0h;->d:Lx5f;

    invoke-virtual {v2, v0}, Lx5f;->n0(Len0;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    instance-of v0, v0, Lxzg;

    if-eqz v0, :cond_59

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragment()Landroidx/fragment/app/Fragment;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lxzg;

    :cond_59
    if-eqz v1, :cond_5e

    invoke-virtual {v1}, Landroidx/fragment/app/i;->dismiss()V

    :cond_5e
    const-class p0, Lwyl;

    invoke-static {p0}, Lzhj;->b(Ljava/lang/Class;)Lzhj;

    move-result-object p0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_43
        :pswitch_2f
    .end packed-switch
.end method
