.class public final synthetic Lmv7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lrv7;


# direct methods
.method public synthetic constructor <init>(Lrv7;B)V
    .registers 3

    iput-byte p2, p0, Lmv7;->a:B

    iput-object p1, p0, Lmv7;->b:Lrv7;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    iget-byte v0, p0, Lmv7;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lmv7;->b:Lrv7;

    packed-switch v0, :pswitch_data_22

    iget-object v0, p0, Lrv7;->l:Lj1k;

    invoke-virtual {v0}, Lj1k;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_1b

    iget-object p0, p0, Lrv7;->n:Lyv7;

    invoke-virtual {p0, v1}, Lyv7;->m(Z)V

    :cond_1b
    return-void

    :pswitch_1c
    iput-boolean v1, p0, Lrv7;->r:Z

    invoke-virtual {p0}, Lrv7;->d()V

    return-void

    :pswitch_data_22
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method
