.class public final Lc2p;
.super Lozb;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic i:B

.field public final synthetic j:Ly2p;


# direct methods
.method public synthetic constructor <init>(Ly2p;B)V
    .registers 3

    iput-byte p2, p0, Lc2p;->i:B

    iput-object p1, p0, Lc2p;->j:Ly2p;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lozb;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lc2p;->i:B

    const/4 v1, 0x0

    iget-object p0, p0, Lc2p;->j:Ly2p;

    packed-switch v0, :pswitch_data_a6

    iget-object v0, p0, Ly2p;->z:Lc4p;

    iget-object v0, v0, Lc4p;->j:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_27

    new-instance v2, Lsro;

    invoke-static {v0, v1, v1}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1e

    const-string v3, "download.main"

    :cond_1e
    iget-object p0, p0, Lvoo;->x:Ljava/io/File;

    if-eqz p0, :cond_23

    move-object v1, p0

    :cond_23
    invoke-direct {v2, v1, v3, v0}, Lyjo;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v2

    :cond_27
    return-object v1

    :pswitch_28
    iget-object v0, p0, Ly2p;->z:Lc4p;

    iget-object v0, v0, Lc4p;->k:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-eqz v0, :cond_47

    new-instance v2, Lsro;

    invoke-static {v0, v1, v1}, Landroid/webkit/URLUtil;->guessFileName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3e

    const-string v3, "download.ico"

    :cond_3e
    iget-object p0, p0, Lvoo;->x:Ljava/io/File;

    if-eqz p0, :cond_43

    move-object v1, p0

    :cond_43
    invoke-direct {v2, v1, v3, v0}, Lyjo;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v2

    :cond_47
    return-object v1

    :pswitch_48
    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    iget-object v1, p0, Ly2p;->z:Lc4p;

    iget-object v1, v1, Lc4p;->q:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lehc;->addAll(Ljava/util/Collection;)Z

    invoke-static {p0}, Ly2p;->g(Ly2p;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_62

    invoke-virtual {v0, p0}, Lehc;->addAll(Ljava/util/Collection;)Z

    :cond_62
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    return-object p0

    :pswitch_67
    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    iget-object v1, p0, Ly2p;->z:Lc4p;

    iget-object v1, v1, Lc4p;->r:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lehc;->addAll(Ljava/util/Collection;)Z

    invoke-static {p0}, Ly2p;->f(Ly2p;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_81

    invoke-virtual {v0, p0}, Lehc;->addAll(Ljava/util/Collection;)Z

    :cond_81
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    return-object p0

    :pswitch_86
    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v0

    iget-object v1, p0, Ly2p;->z:Lc4p;

    iget-object v1, v1, Lc4p;->t:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, v1}, Lehc;->addAll(Ljava/util/Collection;)Z

    invoke-static {p0}, Ly2p;->e(Ly2p;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_a0

    invoke-virtual {v0, p0}, Lehc;->addAll(Ljava/util/Collection;)Z

    :cond_a0
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_a6
    .packed-switch 0x0
        :pswitch_86
        :pswitch_67
        :pswitch_48
        :pswitch_28
    .end packed-switch
.end method
