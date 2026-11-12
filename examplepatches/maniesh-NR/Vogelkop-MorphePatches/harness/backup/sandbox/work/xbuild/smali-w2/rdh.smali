.class public final synthetic Lrdh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lsdh;

.field public final synthetic c:Lhq8;


# direct methods
.method public synthetic constructor <init>(Lsdh;Lhq8;B)V
    .registers 4

    iput-byte p3, p0, Lrdh;->a:B

    iput-object p1, p0, Lrdh;->b:Lsdh;

    iput-object p2, p0, Lrdh;->c:Lhq8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte p1, p0, Lrdh;->a:B

    sget-object v0, Llqm;->f:Llqm;

    iget-object v1, p0, Lrdh;->c:Lhq8;

    iget-object p0, p0, Lrdh;->b:Lsdh;

    packed-switch p1, :pswitch_data_1a

    invoke-virtual {p0, v1, v0}, Lns8;->P(Lhq8;Llqm;)V

    invoke-virtual {p0, v1}, Lsdh;->b0(Lhq8;)V

    return-void

    :pswitch_12
    invoke-virtual {p0, v1, v0}, Lns8;->P(Lhq8;Llqm;)V

    invoke-virtual {p0, v1}, Lsdh;->b0(Lhq8;)V

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_12
    .end packed-switch
.end method
