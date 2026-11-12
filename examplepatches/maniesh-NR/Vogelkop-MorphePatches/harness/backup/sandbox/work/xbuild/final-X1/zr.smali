.class public final synthetic Lzr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Las;


# direct methods
.method public synthetic constructor <init>(Las;B)V
    .registers 3

    iput-byte p2, p0, Lzr;->a:B

    iput-object p1, p0, Lzr;->b:Las;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lzr;->a:B

    iget-object p0, p0, Lzr;->b:Las;

    packed-switch v0, :pswitch_data_2a

    invoke-virtual {p0}, Las;->Q0()V

    return-void

    :pswitch_b
    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    iget-object p1, p0, Las;->D:Lgjm;

    new-instance v0, Lpx7;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v2, Lz3;

    const/4 v3, 0x7

    invoke-direct {v2, p0, v3}, Lz3;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lpb;

    const/4 v3, 0x2

    invoke-direct {p0, v2, v3}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0, v1, p0}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
