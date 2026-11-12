.class public final synthetic Lj9c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lk9c;


# direct methods
.method public synthetic constructor <init>(Lk9c;B)V
    .registers 3

    iput-byte p2, p0, Lj9c;->a:B

    iput-object p1, p0, Lj9c;->b:Lk9c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lj9c;->a:B

    iget-object p0, p0, Lj9c;->b:Lk9c;

    packed-switch p1, :pswitch_data_2e

    iget-object p1, p0, Lk9c;->c:Ltah;

    iget-object p1, p1, Ltah;->k:Ljava/lang/Object;

    check-cast p1, Lxnf;

    invoke-virtual {p1, p0}, Lxnf;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_11
    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_15
    iget-object p1, p0, Lk9c;->c:Ltah;

    iget-object p1, p1, Ltah;->i:Ljava/lang/Object;

    check-cast p1, Lxnf;

    invoke-virtual {p1, p0}, Lxnf;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_1f
    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :pswitch_23
    iget-object p1, p0, Lk9c;->c:Ltah;

    iget-object p1, p1, Ltah;->g:Ljava/lang/Object;

    check-cast p1, Lxnf;

    invoke-virtual {p1, p0}, Lxnf;->run(Ljava/lang/Object;)V

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_23
        :pswitch_1f
        :pswitch_15
        :pswitch_11
    .end packed-switch
.end method
