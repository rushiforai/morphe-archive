.class public final synthetic Lsu7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwjh;


# direct methods
.method public synthetic constructor <init>(Lwjh;B)V
    .registers 3

    iput-byte p2, p0, Lsu7;->a:B

    iput-object p1, p0, Lsu7;->b:Lwjh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lsu7;->a:B

    iget-object p0, p0, Lsu7;->b:Lwjh;

    packed-switch p1, :pswitch_data_38

    new-instance p1, Lxw;

    iget-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Lm0a;

    invoke-direct {p1, v0}, Lxw;-><init>(Lm0a;)V

    iget-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Lo73;->p(Landroid/view/View;)V

    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p0, Lq2;

    invoke-virtual {p0}, Lq2;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_1f
    new-instance p1, Lxw;

    iget-object v0, p0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Lm0a;

    invoke-direct {p1, v0}, Lxw;-><init>(Lm0a;)V

    iget-object v0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Lo73;->p(Landroid/view/View;)V

    iget-object p0, p0, Lwjh;->f:Ljava/lang/Object;

    check-cast p0, Lq2;

    invoke-virtual {p0}, Lq2;->invoke()Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_38
    .packed-switch 0x0
        :pswitch_1f
    .end packed-switch
.end method
