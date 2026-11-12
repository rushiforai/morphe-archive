.class public final Lp98;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxbh;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lp98;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)Z
    .registers 2

    iget-byte p0, p0, Lp98;->a:B

    packed-switch p0, :pswitch_data_14

    const/4 p0, 0x4

    if-ne p1, p0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0

    :pswitch_c
    const/4 p0, 0x5

    if-ne p1, p0, :cond_11

    const/4 p0, 0x1

    goto :goto_12

    :cond_11
    const/4 p0, 0x0

    :goto_12
    return p0

    nop

    :pswitch_data_14
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final b(ILandroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;)Lwbh;
    .registers 16

    iget-byte p0, p0, Lp98;->a:B

    const-string v0, "Failed requirement."

    const/4 v1, 0x0

    packed-switch p0, :pswitch_data_92

    const/4 p0, 0x4

    if-ne p1, p0, :cond_18

    new-instance v2, Lr98;

    const/4 v8, 0x1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v2 .. v8}, Lr98;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;B)V

    move-object v1, v2

    goto :goto_1b

    :cond_18
    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_1b
    return-object v1

    :pswitch_1c
    move-object v3, p2

    move-object p2, p3

    move-object p3, p4

    move-object p4, p5

    move-object p5, p6

    const/4 p0, 0x5

    if-ne p1, p0, :cond_8d

    new-instance p0, Lr98;

    const/4 p6, 0x0

    move-object p1, v3

    invoke-direct/range {p0 .. p6}, Lr98;-><init>(Landroid/content/Context;Lorm;Lskm;Landroid/os/Bundle;Ls0f;B)V

    const-string p1, "esim_push_notification_variant_id"

    const/4 p2, -0x1

    invoke-virtual {p4, p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    move-result p3

    if-eq p3, p2, :cond_8b

    sget-object p2, Lq98;->f:Lwu5;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lq98;->k:Lh58;

    invoke-virtual {p2}, Lz4;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_3f
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_51

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    move-object p5, p4

    check-cast p5, Lq98;

    iget-byte p5, p5, Lq98;->a:B

    if-ne p5, p3, :cond_3f

    goto :goto_52

    :cond_51
    move-object p4, v1

    :goto_52
    check-cast p4, Lq98;

    if-eqz p4, :cond_85

    iget p1, p4, Lq98;->b:I

    iput p1, p0, Lwbh;->e:I

    iget-object p1, p4, Lq98;->c:Ljava/lang/String;

    iput-object p1, p0, Lwbh;->k:Ljava/lang/String;

    :try_start_5e
    iget-object p1, p4, Lq98;->d:Lpxh;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p1, p2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lwbh;->f:Ljava/lang/String;

    iget-object p1, p4, Lq98;->e:Lrxh;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p1, p2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lwbh;->g:Ljava/lang/String;
    :try_end_7e
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_5e .. :try_end_7e} :catch_7f

    goto :goto_8b

    :catch_7f
    move-exception v0

    move-object p0, v0

    invoke-static {p0}, Lt3p;->n(Ljava/lang/Throwable;)V

    goto :goto_90

    :cond_85
    new-instance p0, Ldjb;

    invoke-direct {p0, p1, v1}, Ldjb;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw p0

    :cond_8b
    :goto_8b
    move-object v1, p0

    goto :goto_90

    :cond_8d
    invoke-static {v0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_90
    return-object v1

    nop

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_1c
    .end packed-switch
.end method
