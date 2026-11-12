.class public final synthetic Lb83;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ly73;


# direct methods
.method public synthetic constructor <init>(Ly73;B)V
    .registers 3

    iput-byte p2, p0, Lb83;->a:B

    iput-object p1, p0, Lb83;->b:Ly73;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 3

    iget-byte v0, p0, Lb83;->a:B

    iget-object p0, p0, Lb83;->b:Ly73;

    check-cast p1, La4g;

    packed-switch v0, :pswitch_data_40

    iget-object v0, p0, Ly73;->c:Ljava/lang/Object;

    check-cast v0, Lyqa;

    iget-boolean p0, p0, Ly73;->b:Z

    if-eqz p0, :cond_17

    if-eqz p1, :cond_23

    invoke-virtual {p1}, La4g;->a()V

    goto :goto_23

    :cond_17
    iget-object p0, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, La4g;

    if-eqz p0, :cond_20

    invoke-virtual {p0}, La4g;->a()V

    :cond_20
    invoke-virtual {v0, p1}, Lyqa;->q(La4g;)V

    :cond_23
    :goto_23
    return-void

    :pswitch_24
    iget-object v0, p0, Ly73;->c:Ljava/lang/Object;

    check-cast v0, Lyqa;

    iget-boolean p0, p0, Ly73;->b:Z

    if-eqz p0, :cond_32

    if-eqz p1, :cond_3e

    invoke-virtual {p1}, La4g;->a()V

    goto :goto_3e

    :cond_32
    iget-object p0, v0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, La4g;

    if-eqz p0, :cond_3b

    invoke-virtual {p0}, La4g;->a()V

    :cond_3b
    invoke-virtual {v0, p1}, Lyqa;->q(La4g;)V

    :cond_3e
    :goto_3e
    return-void

    nop

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_24
    .end packed-switch
.end method
