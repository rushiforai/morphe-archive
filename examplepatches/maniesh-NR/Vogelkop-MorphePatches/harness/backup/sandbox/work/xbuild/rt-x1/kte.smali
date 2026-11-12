.class public final synthetic Lkte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpte;


# direct methods
.method public synthetic constructor <init>(Lpte;B)V
    .registers 3

    iput-byte p2, p0, Lkte;->a:B

    iput-object p1, p0, Lkte;->b:Lpte;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Lkte;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lkte;->b:Lpte;

    packed-switch v0, :pswitch_data_2e

    iget-object p0, p0, Lpte;->G:Lyqa;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lyqa;->r(Landroid/content/Context;)V

    return-void

    :pswitch_12
    invoke-static {p0}, Lvtp;->M(Landroidx/fragment/app/Fragment;)Z

    move-result p1

    if-nez p1, :cond_22

    iget-object p0, p0, Lpte;->t:Lgjm;

    new-instance p1, Lpb6;

    invoke-direct {p1}, Lpb6;-><init>()V

    invoke-virtual {p0, p1, v1}, Lgjm;->e(Ln37;Z)V

    :cond_22
    return-void

    :pswitch_23
    iget-object p0, p0, Lpte;->t:Lgjm;

    new-instance p1, Lxse;

    invoke-direct {p1, v1}, Lxse;-><init>(I)V

    invoke-virtual {p0, p1, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_23
        :pswitch_12
    .end packed-switch
.end method
