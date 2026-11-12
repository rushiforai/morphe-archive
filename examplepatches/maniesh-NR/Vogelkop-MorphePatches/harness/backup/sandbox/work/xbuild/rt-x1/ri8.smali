.class public final synthetic Lri8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:I

.field public final synthetic c:Z

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BILjava/lang/Object;Z)V
    .registers 5

    iput-byte p1, p0, Lri8;->a:B

    iput-object p3, p0, Lri8;->d:Ljava/lang/Object;

    iput p2, p0, Lri8;->b:I

    iput-boolean p4, p0, Lri8;->c:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Lri8;->a:B

    iget-boolean v1, p0, Lri8;->c:Z

    iget v2, p0, Lri8;->b:I

    iget-object p0, p0, Lri8;->d:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_36

    check-cast p0, Lqfn;

    const/4 v0, 0x0

    iput-object v0, p0, Lqfn;->a:Lri8;

    iget-object p0, p0, Lqfn;->d:Lrfn;

    new-instance v0, Ltcn;

    invoke-direct {v0, p0, v2, v1}, Ltcn;-><init>(Lrfn;IZ)V

    invoke-virtual {p0, v0}, Lmgn;->b(Llgn;)V

    return-void

    :pswitch_1b
    check-cast p0, Lzi8;

    iget-object v0, p0, Lzi8;->u:Lel6;

    iget-object p0, p0, Lzi8;->a:[Lmuh;

    aget-object p0, p0, v2

    iget-object p0, p0, Lmuh;->a:Lq83;

    iget-byte p0, p0, Lq83;->b:B

    invoke-virtual {v0}, Lel6;->U()Ld11;

    move-result-object v3

    new-instance v4, Lzk6;

    invoke-direct {v4, v3, v2, p0, v1}, Lzk6;-><init>(Ld11;IIZ)V

    const/16 p0, 0x409

    invoke-virtual {v0, v3, p0, v4}, Lel6;->V(Ld11;ILfjc;)V

    return-void

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_1b
    .end packed-switch
.end method
