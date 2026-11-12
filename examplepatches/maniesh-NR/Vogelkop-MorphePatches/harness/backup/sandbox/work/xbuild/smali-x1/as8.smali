.class public final synthetic Las8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lns8;

.field public final synthetic c:Lhq8;


# direct methods
.method public synthetic constructor <init>(Lns8;Lhq8;B)V
    .registers 4

    iput-byte p3, p0, Las8;->a:B

    iput-object p1, p0, Las8;->b:Lns8;

    iput-object p2, p0, Las8;->c:Lhq8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Las8;->a:B

    iget-object v0, p0, Las8;->c:Lhq8;

    iget-object p0, p0, Las8;->b:Lns8;

    packed-switch p1, :pswitch_data_16

    sget-object p1, Llqm;->h:Llqm;

    invoke-virtual {p0, v0, p1}, Lns8;->P(Lhq8;Llqm;)V

    return-void

    :pswitch_f
    sget-object p1, Llqm;->f:Llqm;

    invoke-virtual {p0, v0, p1}, Lns8;->P(Lhq8;Llqm;)V

    return-void

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_f
    .end packed-switch
.end method
