.class public final synthetic Lbnc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhnc;


# direct methods
.method public synthetic constructor <init>(Lhnc;B)V
    .registers 3

    iput-byte p2, p0, Lbnc;->a:B

    iput-object p1, p0, Lbnc;->b:Lhnc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 4

    iget-byte v0, p0, Lbnc;->a:B

    const/4 v1, 0x0

    iget-object p0, p0, Lbnc;->b:Lhnc;

    packed-switch v0, :pswitch_data_2e

    iput-object v1, p0, Lhnc;->o:Lq65;

    invoke-virtual {p0}, Lhnc;->b()V

    return-void

    :pswitch_e
    iget-object v0, p0, Lhnc;->m:Lpr;

    if-eqz v0, :cond_21

    iget-object v0, p0, Lhnc;->n:Lewn;

    if-eqz v0, :cond_1d

    iget-object v0, v0, Lewn;->c:Lokhttp3/internal/ws/RealWebSocket;

    if-eqz v0, :cond_1d

    invoke-interface {v0}, Lmvn;->cancel()V

    :cond_1d
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lhnc;->a(Z)V

    :cond_21
    return-void

    :pswitch_22
    iget-object v0, p0, Lhnc;->m:Lpr;

    if-eqz v0, :cond_2d

    const-string v2, "ping"

    iget-object p0, p0, Lhnc;->j:Lgnc;

    invoke-virtual {v0, v2, v1, p0}, Lpr;->e(Ljava/lang/String;Ljava/util/List;Lv9i;)V

    :cond_2d
    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_22
        :pswitch_e
    .end packed-switch
.end method
