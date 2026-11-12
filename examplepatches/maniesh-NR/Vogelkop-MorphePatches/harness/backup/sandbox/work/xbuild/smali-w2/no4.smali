.class public final synthetic Lno4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfjc;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lfig;

.field public final synthetic c:Lfig;


# direct methods
.method public synthetic constructor <init>(Lfig;Lfig;B)V
    .registers 4

    iput-byte p3, p0, Lno4;->a:B

    iput-object p1, p0, Lno4;->b:Lfig;

    iput-object p2, p0, Lno4;->c:Lfig;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)V
    .registers 5

    iget-byte v0, p0, Lno4;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lno4;->c:Lfig;

    iget-object p0, p0, Lno4;->b:Lfig;

    check-cast p1, Leig;

    packed-switch v0, :pswitch_data_22

    invoke-interface {p1, v1}, Leig;->onPositionDiscontinuity(I)V

    invoke-interface {p1, v1, p0, v2}, Leig;->n(ILfig;Lfig;)V

    return-void

    :pswitch_13
    invoke-interface {p1, v1}, Leig;->onPositionDiscontinuity(I)V

    invoke-interface {p1, v1, p0, v2}, Leig;->n(ILfig;Lfig;)V

    return-void

    :pswitch_1a
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Leig;->onPositionDiscontinuity(I)V

    invoke-interface {p1, v0, p0, v2}, Leig;->n(ILfig;Lfig;)V

    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1a
        :pswitch_13
    .end packed-switch
.end method
