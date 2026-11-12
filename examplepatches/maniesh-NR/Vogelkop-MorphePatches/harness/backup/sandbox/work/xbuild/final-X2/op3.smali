.class public final synthetic Lop3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lnwf;


# direct methods
.method public synthetic constructor <init>(Lnwf;B)V
    .registers 3

    iput-byte p2, p0, Lop3;->a:B

    iput-object p1, p0, Lop3;->b:Lnwf;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-byte v0, p0, Lop3;->a:B

    const/4 v1, 0x3

    iget-object p0, p0, Lop3;->b:Lnwf;

    packed-switch v0, :pswitch_data_22

    new-instance p1, Lxp3;

    invoke-direct {p1, p0, v1}, Lxp3;-><init>(Lt0h;B)V

    return-void

    :pswitch_e
    new-instance v0, Lbbl;

    invoke-direct {v0, p0, p1, v1}, Lbbl;-><init>(Lnwf;Landroid/view/View;B)V

    return-void

    :pswitch_14
    new-instance p1, Lxp3;

    invoke-direct {p1, p0, v1}, Lxp3;-><init>(Lt0h;B)V

    return-void

    :pswitch_1a
    new-instance v0, Lbbl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lbbl;-><init>(Lnwf;Landroid/view/View;B)V

    return-void

    nop

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_14
        :pswitch_e
    .end packed-switch
.end method
