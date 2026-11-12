.class public final synthetic Luyd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lwyd;


# direct methods
.method public synthetic constructor <init>(Lwyd;B)V
    .registers 3

    iput-byte p2, p0, Luyd;->a:B

    iput-object p1, p0, Luyd;->b:Lwyd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Luyd;->a:B

    iget-object p0, p0, Luyd;->b:Lwyd;

    packed-switch v0, :pswitch_data_18

    invoke-virtual {p0}, Lwyd;->cancel()V

    return-void

    :pswitch_b
    iget-object v0, p0, Lwyd;->c:Lglh;

    new-instance v1, Ltyd;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ltyd;-><init>(Lwyd;B)V

    invoke-virtual {v0, v1}, Lglh;->f(Lcom/opera/api/Callback;)V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
