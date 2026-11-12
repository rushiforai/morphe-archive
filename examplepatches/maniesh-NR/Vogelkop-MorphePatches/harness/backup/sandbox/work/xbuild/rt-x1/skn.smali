.class public final synthetic Lskn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lukn;


# direct methods
.method public synthetic constructor <init>(Lukn;B)V
    .registers 3

    iput-byte p2, p0, Lskn;->a:B

    iput-object p1, p0, Lskn;->b:Lukn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-byte v0, p0, Lskn;->a:B

    iget-object p0, p0, Lskn;->b:Lukn;

    packed-switch v0, :pswitch_data_12

    iget-object p0, p0, Lukn;->y:Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->n(ZZ)V

    return-void

    :pswitch_e
    invoke-virtual {p0}, Lukn;->G0()V

    return-void

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
