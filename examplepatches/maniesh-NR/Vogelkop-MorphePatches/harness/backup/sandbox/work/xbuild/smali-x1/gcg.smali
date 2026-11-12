.class public final synthetic Lgcg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhcg;


# direct methods
.method public synthetic constructor <init>(Lhcg;B)V
    .registers 3

    iput-byte p2, p0, Lgcg;->a:B

    iput-object p1, p0, Lgcg;->b:Lhcg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lgcg;->a:B

    const/4 v0, 0x0

    iget-object p0, p0, Lgcg;->b:Lhcg;

    packed-switch p1, :pswitch_data_7e

    invoke-virtual {p0}, Lhcg;->I0()Llcg;

    move-result-object p0

    iget-object p0, p0, Llcg;->d:Ljt2;

    check-cast p0, Lot2;

    iget-object p0, p0, Lot2;->b:Lgjm;

    new-instance p1, Lsr2;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v0}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_1b
    invoke-virtual {p0}, Lhcg;->I0()Llcg;

    move-result-object p0

    iget-object p0, p0, Llcg;->d:Ljt2;

    new-array p1, v0, [I

    check-cast p0, Lot2;

    invoke-virtual {p0, p1}, Lot2;->a([I)V

    return-void

    :pswitch_29
    invoke-virtual {p0}, Lhcg;->I0()Llcg;

    move-result-object p0

    iget-object p0, p0, Llcg;->d:Ljt2;

    new-array p1, v0, [I

    check-cast p0, Lot2;

    invoke-virtual {p0, p1}, Lot2;->b([I)V

    return-void

    :pswitch_37
    invoke-virtual {p0}, Lhcg;->I0()Llcg;

    move-result-object p0

    iget-object p0, p0, Llcg;->d:Ljt2;

    check-cast p0, Lot2;

    invoke-virtual {p0}, Lot2;->d()V

    return-void

    :pswitch_43
    invoke-virtual {p0}, Lhcg;->I0()Llcg;

    move-result-object p0

    iget-object p0, p0, Llcg;->e:Lhxk;

    new-array p1, v0, [I

    check-cast p0, Lkxk;

    invoke-virtual {p0, p1}, Lkxk;->a([I)V

    return-void

    :pswitch_51
    invoke-virtual {p0}, Lhcg;->I0()Llcg;

    move-result-object p0

    iget-object p0, p0, Llcg;->e:Lhxk;

    check-cast p0, Lkxk;

    iget-object p1, p0, Lkxk;->a:Lji;

    invoke-virtual {p1}, Lji;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ldb;

    iget-object v0, p0, Lkxk;->b:Lwv1;

    iget-object v0, v0, Lwv1;->b:Lb6h;

    invoke-interface {v0}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxb;

    iget-object p0, p0, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Lxb;->e:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldpf;

    new-instance v1, Lz8b;

    invoke-direct {v1, p0, p1}, Lz8b;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ldpf;->a(Lhpf;)V

    return-void

    :pswitch_data_7e
    .packed-switch 0x0
        :pswitch_51
        :pswitch_43
        :pswitch_37
        :pswitch_29
        :pswitch_1b
    .end packed-switch
.end method
