.class public final synthetic Lmlp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ly46;


# direct methods
.method public synthetic constructor <init>(Ly46;B)V
    .registers 3

    iput-byte p2, p0, Lmlp;->a:B

    iput-object p1, p0, Lmlp;->b:Ly46;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Lmlp;->a:B

    iget-object p0, p0, Lmlp;->b:Ly46;

    packed-switch p1, :pswitch_data_1c

    iget-object p0, p0, Ly46;->b:Ljava/lang/Object;

    check-cast p0, Lqqo;

    if-eqz p0, :cond_10

    invoke-virtual {p0}, Lqqo;->invoke()Ljava/lang/Object;

    :cond_10
    return-void

    :pswitch_11
    iget-object p0, p0, Ly46;->b:Ljava/lang/Object;

    check-cast p0, Lqqo;

    if-eqz p0, :cond_1a

    invoke-virtual {p0}, Lqqo;->invoke()Ljava/lang/Object;

    :cond_1a
    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_11
    .end packed-switch
.end method
