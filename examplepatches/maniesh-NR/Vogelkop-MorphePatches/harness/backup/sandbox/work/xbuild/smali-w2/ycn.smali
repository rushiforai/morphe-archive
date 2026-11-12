.class public final synthetic Lycn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbdn;


# direct methods
.method public synthetic constructor <init>(Lbdn;B)V
    .registers 3

    iput-byte p2, p0, Lycn;->a:B

    iput-object p1, p0, Lycn;->b:Lbdn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-byte p1, p0, Lycn;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Lycn;->b:Lbdn;

    packed-switch p1, :pswitch_data_2e

    iget-object p0, p0, Lbdn;->c:Lydn;

    iget-object p0, p0, Lydn;->f:Lqq8;

    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2}, Lqq8;->n(J)V

    iget-object p0, p0, Lqq8;->c:Ljava/lang/Object;

    check-cast p0, Lydn;

    invoke-virtual {p0, v0}, Lydn;->D(Z)V

    return-void

    :pswitch_19
    iget-object p0, p0, Lbdn;->b:Lz0c;

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lz0c;->g(I)V

    return-void

    :pswitch_20
    iget-object p0, p0, Lbdn;->b:Lz0c;

    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lz0c;->g(I)V

    return-void

    :pswitch_27
    iget-object p0, p0, Lbdn;->b:Lz0c;

    invoke-virtual {p0, v0}, Lz0c;->g(I)V

    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_27
        :pswitch_20
        :pswitch_19
    .end packed-switch
.end method
