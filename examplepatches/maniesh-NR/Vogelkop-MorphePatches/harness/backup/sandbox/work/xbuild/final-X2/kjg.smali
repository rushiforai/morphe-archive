.class public final synthetic Lkjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lk37;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ltjg;


# direct methods
.method public synthetic constructor <init>(Ltjg;B)V
    .registers 3

    iput-byte p2, p0, Lkjg;->a:B

    iput-object p1, p0, Lkjg;->b:Ltjg;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a([Lmkg;)V
    .registers 7

    iget-byte v0, p0, Lkjg;->a:B

    const/4 v1, -0x1

    iget-object p0, p0, Lkjg;->b:Ltjg;

    packed-switch v0, :pswitch_data_44

    :pswitch_8
    iget-object v0, p0, Ltjg;->i:Lujc;

    iget-object v0, v0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->getNextWindowIndex()I

    move-result v0

    if-ne v0, v1, :cond_1e

    iget-object v0, p0, Ltjg;->i:Lujc;

    iget-object v0, v0, Lgk9;->b:Lgig;

    invoke-interface {v0}, Lgig;->getCurrentTimeline()Lgql;

    move-result-object v0

    invoke-virtual {v0}, Lgql;->o()I

    move-result v0

    :cond_1e
    iget-object p0, p0, Ltjg;->k:Lokg;

    invoke-virtual {p0, v0, p1}, Lokg;->a(I[Lmkg;)V

    return-void

    :pswitch_24
    new-instance v0, Lljg;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lljg;-><init>(Ltjg;B)V

    iget-object v2, p0, Ltjg;->v:Ljava/util/ArrayList;

    new-instance v3, Lq2g;

    const/4 v4, 0x3

    invoke-direct {v3, p0, v0, v4}, Lq2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p0, Ltjg;->k:Lokg;

    const-wide/16 v2, 0x0

    invoke-virtual {p0, p1, v1, v2, v3}, Lokg;->d([Lmkg;IJ)V

    return-void

    :pswitch_3d
    iget-object p0, p0, Ltjg;->k:Lokg;

    invoke-virtual {p0, v1, p1}, Lokg;->a(I[Lmkg;)V

    return-void

    nop

    :pswitch_data_44
    .packed-switch 0x0
        :pswitch_3d
        :pswitch_8
        :pswitch_24
    .end packed-switch
.end method

.method public final b()V
    .registers 2

    iget-byte v0, p0, Lkjg;->a:B

    iget-object p0, p0, Lkjg;->b:Ltjg;

    packed-switch v0, :pswitch_data_10

    invoke-virtual {p0}, Ltjg;->h()V

    return-void

    :pswitch_b
    invoke-virtual {p0}, Ltjg;->h()V

    return-void

    nop

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_b
    .end packed-switch
.end method
