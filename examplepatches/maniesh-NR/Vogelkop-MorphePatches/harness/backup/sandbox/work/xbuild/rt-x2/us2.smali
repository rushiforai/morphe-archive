.class public final synthetic Lus2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lbt2;


# direct methods
.method public synthetic constructor <init>(Lbt2;B)V
    .registers 3

    iput-byte p2, p0, Lus2;->a:B

    iput-object p1, p0, Lus2;->b:Lbt2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lus2;->a:B

    iget-object p0, p0, Lus2;->b:Lbt2;

    packed-switch v0, :pswitch_data_32

    iget-object v0, p0, Lbt2;->h:Lov0;

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lbt2;->b:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    const/4 v0, 0x0

    iput-object v0, p0, Lbt2;->h:Lov0;

    iget-object p0, p0, Lbt2;->c:Lnak;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v0, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_1d
    return-void

    :pswitch_1e
    iget-object v0, p0, Lbt2;->f:Lxs2;

    new-instance v1, Lus2;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lus2;-><init>(Lbt2;B)V

    iget-boolean p0, v0, Lxs2;->d:Z

    if-nez p0, :cond_2e

    invoke-virtual {v1}, Lus2;->run()V

    goto :goto_30

    :cond_2e
    iput-object v1, v0, Lxs2;->g:Lus2;

    :goto_30
    return-void

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_1e
    .end packed-switch
.end method
