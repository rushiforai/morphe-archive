.class public final synthetic Lzt7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lx77;

.field public final synthetic c:Lcu7;


# direct methods
.method public synthetic constructor <init>(Lx77;Lcu7;B)V
    .registers 4

    iput-byte p3, p0, Lzt7;->a:B

    iput-object p1, p0, Lzt7;->b:Lx77;

    iput-object p2, p0, Lzt7;->c:Lcu7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lzt7;->a:B

    iget-object v0, p0, Lzt7;->c:Lcu7;

    iget-object p0, p0, Lzt7;->b:Lx77;

    packed-switch p1, :pswitch_data_22

    iget-object p1, v0, Lcu7;->k:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lx77;->m(Ljava/lang/String;)V

    return-void

    :pswitch_f
    iget-object p1, v0, Lcu7;->k:Ljava/lang/String;

    iget-object p0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast p0, Lwjh;

    iget-object p0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Liy1;

    invoke-virtual {p0, p1}, Liy1;->h(Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
