.class public final synthetic Lx5m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfl3;


# direct methods
.method public synthetic constructor <init>(Lfl3;B)V
    .registers 3

    iput-byte p2, p0, Lx5m;->a:B

    iput-object p1, p0, Lx5m;->b:Lfl3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-byte p1, p0, Lx5m;->a:B

    iget-object p0, p0, Lx5m;->b:Lfl3;

    packed-switch p1, :pswitch_data_16

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_b
    iget-object p1, p0, Lfl3;->s:Ljl3;

    iget-object v0, p0, Lfl3;->r:Lwx;

    invoke-virtual {v0, p1}, Lwx;->run(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
