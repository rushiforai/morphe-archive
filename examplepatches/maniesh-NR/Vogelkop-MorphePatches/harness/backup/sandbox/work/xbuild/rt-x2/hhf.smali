.class public final synthetic Lhhf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmhf;


# direct methods
.method public synthetic constructor <init>(Lmhf;B)V
    .registers 3

    iput-byte p2, p0, Lhhf;->a:B

    iput-object p1, p0, Lhhf;->b:Lmhf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lhhf;->a:B

    iget-object p0, p0, Lhhf;->b:Lmhf;

    packed-switch p1, :pswitch_data_26

    iget-object p1, p0, Lmhf;->g:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnhf;

    iget-object p1, p1, Lnhf;->b:Lhxk;

    check-cast p1, Lkxk;

    iget-object p1, p1, Lkxk;->f:Landroidx/fragment/app/w;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_1e
    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_22
    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_data_26
    .packed-switch 0x0
        :pswitch_22
        :pswitch_1e
    .end packed-switch
.end method
