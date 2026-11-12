.class public final synthetic Lcn3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ldn3;


# direct methods
.method public synthetic constructor <init>(Ldn3;B)V
    .registers 3

    iput-byte p2, p0, Lcn3;->a:B

    iput-object p1, p0, Lcn3;->b:Ldn3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte p1, p0, Lcn3;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Lcn3;->b:Ldn3;

    packed-switch p1, :pswitch_data_32

    iget-object p1, p0, Ldn3;->k:Lgn3;

    iget-object v1, p1, Lgn3;->v:Lvx;

    iget-object v1, v1, Lvx;->b:Ljava/lang/Object;

    check-cast v1, Lim3;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v1

    if-eqz v1, :cond_22

    iget-object p1, p1, Lgn3;->i:Ldb;

    new-instance v2, Lfv2;

    const/16 v3, 0xd

    invoke-direct {v2, p0, v3}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, p1, v2, v0}, Lxih;->w(Landroidx/fragment/app/w;Ldb;Lfv2;Z)V

    :cond_22
    return-void

    :pswitch_23
    iget-object p1, p0, Ldn3;->k:Lgn3;

    iget-object v1, p1, Lgn3;->H:Lsom;

    iput-boolean v0, v1, Lsom;->j:Z

    iget-object p1, p1, Lgn3;->s:Lxm3;

    iget-object p0, p0, Le7n;->i:Lqhc;

    invoke-virtual {p1, p0}, Lxm3;->K(Lqhc;)V

    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_23
    .end packed-switch
.end method
