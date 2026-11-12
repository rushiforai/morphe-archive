.class public final synthetic Ljg4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqp5;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Ljg4;->a:B

    iput-object p1, p0, Ljg4;->b:Ljava/lang/Object;

    iput-object p2, p0, Ljg4;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 11

    iget-byte v0, p0, Ljg4;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, Ljg4;->c:Ljava/lang/Object;

    iget-object p0, p0, Ljg4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_142

    check-cast p0, Lh8d;

    move-object v6, v2

    check-cast v6, Lamk;

    move-object v5, p1

    check-cast v5, Ljava/lang/String;

    iget-object p1, p0, Lh8d;->g:Lg8d;

    iget-object v0, p0, Lh8d;->e:Ljava/lang/String;

    iget-object v2, v6, Lamk;->a:Lzsk;

    iget-object v2, v2, Lzsk;->a:Ljava/lang/String;

    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v4, p0, Lh8d;->f:Lqb7;

    const/4 v2, 0x0

    if-eqz v0, :cond_2d

    new-instance p1, Le8d;

    invoke-direct {p1, p0, v2}, Le8d;-><init>(Lh8d;B)V

    invoke-virtual {v4, v6, v5, p1}, Lqb7;->t(Lamk;Ljava/lang/String;Lcom/opera/api/Callback;)V

    goto/16 :goto_cf

    :cond_2d
    invoke-interface {p1}, Lg8d;->u()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Lg8d;->Q()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Le8d;

    invoke-direct {v7, p0, v1}, Le8d;-><init>(Lh8d;B)V

    iget-object p0, v4, Lqb7;->c:Ljava/lang/Object;

    check-cast p0, Llh4;

    iget-object p0, p0, Llh4;->b:Lcom/opera/api/Callback;

    if-eqz p0, :cond_63

    new-instance p0, Lef3;

    invoke-direct {p0}, Lef3;-><init>()V

    sget-object p1, Ljf3;->b:Ljf3;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_5b

    if-eq p1, v1, :cond_cf

    const/4 v0, 0x2

    if-ne p1, v0, :cond_cf

    check-cast p0, Lgf3;

    goto/16 :goto_cf

    :cond_5b
    check-cast p0, Lif3;

    iget-object p0, v7, Le8d;->b:Lh8d;

    invoke-interface {p0}, Lhf3;->E()V

    goto :goto_cf

    :cond_63
    move p0, v2

    new-instance v2, Llh4;

    new-instance v3, Lxx1;

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Lxx1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v3, p0}, Llh4;-><init>(Lcom/opera/api/Callback;B)V

    iput-object v2, v4, Lqb7;->c:Ljava/lang/Object;

    iget-object p0, v4, Lqb7;->a:Ljava/lang/Object;

    check-cast p0, Laf3;

    iget-object v3, v6, Lamk;->b:Lnsh;

    iget-object v4, v6, Lamk;->c:Lxlk;

    iget-object v6, v4, Lxlk;->d:Ljava/lang/String;

    iget-boolean v4, v4, Lxlk;->f:Z

    iget-boolean v7, p0, Laf3;->h:Z

    if-nez v7, :cond_91

    new-instance p0, Lff3;

    new-instance p1, Lgf3;

    invoke-direct {p1}, Lgf3;-><init>()V

    sget-object v0, Ljf3;->c:Ljf3;

    invoke-direct {p0, p1, v0}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, p0}, Llh4;->run(Ljava/lang/Object;)V

    goto :goto_cf

    :cond_91
    move v7, v4

    new-instance v4, Ltn;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    new-instance v8, Lei2;

    invoke-direct {v8}, Ljava/lang/Object;-><init>()V

    iput-boolean v1, v8, Lei2;->b:Z

    iput-object v8, v4, Ltn;->d:Ljava/lang/Object;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_ca

    new-instance v1, Lr40;

    invoke-direct {v1}, Lr40;-><init>()V

    iput-object v0, v1, Lr40;->b:Ljava/lang/String;

    new-instance v0, Lei2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v1, v1, Lr40;->b:Ljava/lang/String;

    iput-object v1, v0, Lei2;->a:Ljava/lang/String;

    iput-object v0, v4, Ltn;->d:Ljava/lang/Object;

    invoke-static {v4, v3, v6, v7, p1}, Lwyh;->V(Ltn;Lnsh;Ljava/lang/String;ZLjava/lang/String;)V

    if-eqz v5, :cond_bf

    iput-object v5, v4, Ltn;->b:Ljava/lang/Object;

    :cond_bf
    new-instance v0, Lue3;

    const/4 v5, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lue3;-><init>(Laf3;Llh4;Lnsh;Ltn;B)V

    invoke-virtual {v1, v0}, Laf3;->e(Lbg1;)V

    goto :goto_cf

    :cond_ca
    const-string p0, "Old SKU purchase information(token/id) or original external transaction id must be provided."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :cond_cf
    :goto_cf
    return-void

    :pswitch_d0
    check-cast p0, Len7;

    check-cast v2, Lvtk;

    check-cast p1, Lvo2;

    invoke-virtual {v2}, Lvtk;->close()V

    iget-object p1, p0, Len7;->h:Ljava/util/LinkedHashMap;

    invoke-interface {p1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/Surface;

    if-eqz p1, :cond_f6

    iget-object p0, p0, Len7;->a:Lan7;

    iget-object v0, p0, Llgf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {v0, v1}, Lrs9;->d(Ljava/util/concurrent/atomic/AtomicBoolean;Z)V

    iget-object v0, p0, Llgf;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Thread;

    invoke-static {v0}, Lrs9;->c(Ljava/lang/Thread;)V

    invoke-virtual {p0, p1, v1}, Llgf;->i(Landroid/view/Surface;Z)V

    :cond_f6
    return-void

    :pswitch_f7
    check-cast p0, Low6;

    check-cast v2, Lvtk;

    check-cast p1, Lvo2;

    invoke-virtual {v2}, Lvtk;->close()V

    iget-object p1, p0, Low6;->h:Ljava/util/LinkedHashMap;

    invoke-interface {p1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/Surface;

    if-eqz p1, :cond_11d

    iget-object p0, p0, Low6;->a:Llgf;

    iget-object v0, p0, Llgf;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-static {v0, v1}, Lrs9;->d(Ljava/util/concurrent/atomic/AtomicBoolean;Z)V

    iget-object v0, p0, Llgf;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Thread;

    invoke-static {v0}, Lrs9;->c(Ljava/lang/Thread;)V

    invoke-virtual {p0, p1, v1}, Llgf;->i(Landroid/view/Surface;Z)V

    :cond_11d
    return-void

    :pswitch_11e
    check-cast p0, Lole;

    check-cast v2, Lxd5;

    check-cast p1, Landroid/content/res/Configuration;

    iget-object p0, p0, Lole;->a:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-static {p0, p1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_134
    check-cast p0, Landroid/view/Surface;

    check-cast v2, Landroid/graphics/SurfaceTexture;

    check-cast p1, Lxo2;

    invoke-virtual {p0}, Landroid/view/Surface;->release()V

    invoke-virtual {v2}, Landroid/graphics/SurfaceTexture;->release()V

    return-void

    nop

    :pswitch_data_142
    .packed-switch 0x0
        :pswitch_134
        :pswitch_11e
        :pswitch_f7
        :pswitch_d0
    .end packed-switch
.end method
