.class public final synthetic Lki4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqp5;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ligi;


# direct methods
.method public synthetic constructor <init>(Ligi;B)V
    .registers 3

    iput-byte p2, p0, Lki4;->a:B

    iput-object p1, p0, Lki4;->b:Ligi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 4

    iget-byte v0, p0, Lki4;->a:B

    iget-object p0, p0, Lki4;->b:Ligi;

    packed-switch v0, :pswitch_data_48

    check-cast p1, Lap2;

    invoke-static {}, Lxug;->i()V

    iget-object p0, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p0, Ls1h;

    if-eqz p0, :cond_26

    iget v0, p0, Ls1h;->a:I

    iget p1, p1, Lap2;->a:I

    if-ne v0, p1, :cond_26

    iget-object p0, p0, Ls1h;->f:Lxwh;

    invoke-static {}, Lxug;->i()V

    iget-boolean p0, p0, Lxwh;->f:Z

    if-nez p0, :cond_26

    invoke-static {}, Lxug;->i()V

    const/4 p0, 0x0

    throw p0

    :cond_26
    return-void

    :pswitch_27
    check-cast p1, Ls1h;

    invoke-virtual {p0, p1}, Ligi;->b0(Ls1h;)V

    iget-object p0, p0, Ligi;->g:Ljava/lang/Object;

    check-cast p0, Ls6h;

    iget-object v0, p0, Ls6h;->b:Ljava/lang/Object;

    check-cast v0, Ls1h;

    if-nez v0, :cond_38

    const/4 v0, 0x1

    goto :goto_39

    :cond_38
    const/4 v0, 0x0

    :goto_39
    const-string v1, "Pending request should be null"

    invoke-static {v1, v0}, Ljpo;->n(Ljava/lang/String;Z)V

    iput-object p1, p0, Ls6h;->b:Ljava/lang/Object;

    return-void

    :pswitch_41
    check-cast p1, Ls1h;

    invoke-virtual {p0, p1}, Ligi;->b0(Ls1h;)V

    return-void

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_41
        :pswitch_27
    .end packed-switch
.end method
