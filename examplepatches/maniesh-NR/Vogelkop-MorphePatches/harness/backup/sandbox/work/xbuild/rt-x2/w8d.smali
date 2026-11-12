.class public final synthetic Lw8d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Z)V
    .registers 4

    .line 11
    iput-byte p1, p0, Lw8d;->a:B

    iput-object p2, p0, Lw8d;->c:Ljava/lang/Object;

    iput-boolean p3, p0, Lw8d;->b:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(La9d;I)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lw8d;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lw8d;->c:Ljava/lang/Object;

    iput-boolean p2, p0, Lw8d;->b:Z

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 16

    iget-byte v0, p0, Lw8d;->a:B

    const/4 v1, 0x1

    iget-boolean v2, p0, Lw8d;->b:Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    iget-object v5, p0, Lw8d;->c:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_15a

    check-cast v5, Lbf9;

    check-cast p1, Ljava/util/List;

    iput-object v4, v5, Lbf9;->o:Lih4;

    invoke-virtual {v5, p1}, Lbf9;->v(Ljava/util/List;)Z

    move-result p0

    if-eqz p0, :cond_1c

    invoke-virtual {v5, p1}, Lbf9;->J(Ljava/util/List;)Lpwl;

    goto :goto_32

    :cond_1c
    if-eqz v2, :cond_32

    new-instance p0, Lwe9;

    const/4 p1, 0x4

    invoke-direct {p0, v5, p1}, Lwe9;-><init>(Lbf9;B)V

    new-instance p1, Lssi;

    invoke-direct {p1}, Lssi;-><init>()V

    iput-object p0, p1, Lssi;->b:Ljava/lang/Object;

    const-wide/16 v0, 0x7d0

    invoke-static {p1, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    iput-object p1, v5, Lbf9;->o:Lih4;

    :cond_32
    :goto_32
    return-void

    :pswitch_33
    move-object v7, v5

    check-cast v7, Liji;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_bb

    iget-boolean p1, v7, Liji;->v:Z

    if-eqz p1, :cond_45

    invoke-virtual {v7, v1}, Liji;->l(Z)V

    :cond_45
    invoke-virtual {v7}, Liji;->Z()Z

    move-result v0

    if-eqz v0, :cond_bb

    invoke-virtual {v7}, Liji;->p()Ljava/lang/String;

    move-result-object v8

    iget-object v10, v7, Liji;->p:Landroid/net/Uri;

    sget-object v0, Lvml;->d:Lumi;

    invoke-virtual {v10}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    const-string v2, "file"

    invoke-static {v1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    iget-boolean v9, p0, Lw8d;->b:Z

    if-eqz v1, :cond_99

    move-object v13, v8

    new-instance v8, Ljava/io/File;

    invoke-virtual {v10}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v8, p0, v13}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0, v13}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {v7, p0}, Liji;->q(Landroid/net/Uri;)Lfji;

    move-result-object p0

    iget-object v11, v7, Liji;->e:Lfji;

    new-instance v6, Lxii;

    move-object v12, v10

    move-object v10, p0

    invoke-direct/range {v6 .. v13}, Lxii;-><init>(Liji;Ljava/io/File;ZLfji;Lfji;Landroid/net/Uri;Ljava/lang/String;)V

    move-object v8, v10

    move-object v9, v11

    move-object v10, v12

    invoke-virtual {v0, v6}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance v6, Lnrd;

    move v11, p1

    invoke-direct/range {v6 .. v11}, Lnrd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {p0, v6}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    invoke-virtual {p0, v4, v4}, Loml;->a(Ljava/lang/Object;Ljri;)V

    goto :goto_bb

    :cond_99
    move v11, p1

    new-instance p0, Lyii;

    invoke-direct {p0, v10, v3}, Lyii;-><init>(Landroid/net/Uri;B)V

    invoke-virtual {v0, p0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance v6, Lzii;

    move v12, v11

    move-object v11, v0

    invoke-direct/range {v6 .. v12}, Lzii;-><init>(Liji;Ljava/lang/String;ZLandroid/net/Uri;Lumi;Z)V

    invoke-virtual {p0, v6}, Lnml;->c(Ln5o;)Loml;

    move-result-object p0

    iget-object p1, v7, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {p0, p1, v4}, Loml;->a(Ljava/lang/Object;Ljri;)V

    :cond_bb
    :goto_bb
    return-void

    :pswitch_bc
    check-cast v5, Lxbf;

    check-cast p1, Lc3g;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p1, :cond_c8

    iget-wide p0, p1, Lc3g;->a:J

    goto :goto_ca

    :cond_c8
    const-wide/16 p0, 0x0

    :goto_ca
    iget-object v0, v5, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lx79;

    iget-object v1, v0, Lx79;->e:Ljava/lang/Object;

    check-cast v1, Lx79;

    if-nez v1, :cond_11c

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    if-eqz v2, :cond_11c

    sub-long/2addr v6, p0

    const-wide/32 p0, 0x44aa200

    cmp-long p0, v6, p0

    if-lez p0, :cond_11c

    new-instance p0, Lx79;

    iget-object p1, v0, Lx79;->c:Ljava/lang/Object;

    check-cast p1, Lkw0;

    invoke-direct {p0, p1}, Lx79;-><init>(Ljava/lang/Object;)V

    iput-object p0, v0, Lx79;->e:Ljava/lang/Object;

    new-instance p0, Lr2g;

    invoke-direct {p0, v0, v5, v3}, Lr2g;-><init>(Lx79;Lxbf;B)V

    iget-object p1, v0, Lx79;->a:Ljava/lang/Object;

    check-cast p1, Lqie;

    iget-object p1, p1, Lqie;->b:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/Lazy;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    sget-object v1, Laik;->a:[Ljava/lang/String;

    if-nez p1, :cond_106

    const-string p1, ""

    :cond_106
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_110

    invoke-virtual {p0, v4}, Lr2g;->run(Ljava/lang/Object;)V

    goto :goto_11c

    :cond_110
    iget-object v1, v0, Lx79;->b:Ljava/lang/Object;

    check-cast v1, Le00;

    new-instance v2, Ls2g;

    invoke-direct {v2, v0, p0, p1, v3}, Ls2g;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Le00;->a(Lcom/opera/api/Callback;)V

    :cond_11c
    :goto_11c
    return-void

    :pswitch_11d
    check-cast v5, La9d;

    check-cast p1, Lylk;

    iget-object v0, p1, Lk8;->a:Ljava/lang/Object;

    iget-object p1, p1, Lk8;->b:Ljava/lang/Object;

    check-cast p1, Lemk;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    if-eqz p1, :cond_156

    if-eq p1, v1, :cond_135

    const/4 p0, 0x2

    if-ne p1, p0, :cond_158

    check-cast v0, Lzlk;

    goto :goto_158

    :cond_135
    check-cast v0, Lbmk;

    iget-object p1, v5, La9d;->i:Lz77;

    iget-object v6, v5, La9d;->f:Lfmk;

    iget-object v7, v5, La9d;->l:Lqb7;

    invoke-virtual {v5}, La9d;->Q()Ljava/lang/String;

    move-result-object v9

    new-instance v0, Ltim;

    new-instance v4, Lh8d;

    iget-boolean v8, p0, Lw8d;->b:Z

    invoke-direct/range {v4 .. v9}, Lh8d;-><init>(Lg8d;Lfmk;Lqb7;ILjava/lang/String;)V

    invoke-direct {v0, v4}, Ltim;-><init>(Luim;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {p1, v0, p0}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_158

    :cond_156
    check-cast v0, Lcmk;

    :cond_158
    :goto_158
    return-void

    nop

    :pswitch_data_15a
    .packed-switch 0x0
        :pswitch_11d
        :pswitch_bc
        :pswitch_33
    .end packed-switch
.end method
