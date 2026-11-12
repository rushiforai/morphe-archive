.class public final synthetic Let2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lc0l;Ljava/lang/String;)V
    .registers 3

    const/4 p1, 0x4

    iput-byte p1, p0, Let2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Let2;->b:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Let2;->a:B

    iput-object p1, p0, Let2;->b:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 9

    iget-byte v0, p0, Let2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    iget-object p0, p0, Let2;->b:Ljava/lang/String;

    packed-switch v0, :pswitch_data_130

    sget-object v0, Lsjo;->a:Ljava/util/List;

    sget-object v0, Lphf;->a:Lx79;

    iget-object v0, v0, Lx79;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const-string v1, "geoCountryCode"

    invoke-static {v0, v1}, Lsjo;->k(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_23

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_26

    :cond_23
    invoke-static {v1, p0}, Lsjo;->j(Ljava/lang/String;Ljava/lang/String;)V

    :cond_26
    return-void

    :pswitch_27
    invoke-static {p0}, Lvtp;->t(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_44

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_44

    new-instance v1, Lroj;

    const/16 v2, 0x1a

    invoke-direct {v1, p0, v0, v2}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lfmn;

    const/16 v2, 0x13

    invoke-direct {v0, p0, v1, v2}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lgxo;->a(Ljava/lang/Runnable;)V

    :cond_44
    return-void

    :pswitch_45
    sget-object v0, Lsjo;->d:Likp;

    new-instance v3, Landroid/util/Pair;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const-wide/32 v6, 0x1b7740

    add-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p0, v0, Likp;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    iget v4, v0, Likp;->b:I

    if-le v3, v4, :cond_7e

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v5

    sub-int/2addr v5, v4

    invoke-virtual {p0, v1, v5}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->clear()V

    shl-int/2addr v4, v2

    if-lt v3, v4, :cond_7e

    invoke-virtual {p0}, Ljava/util/ArrayList;->trimToSize()V

    :cond_7e
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v0, Likp;->a:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_8d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const-string v3, "PlaceHolder"

    if-eqz v2, :cond_b0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    iget-object v4, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "ExpireTimestamp"

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8d

    :cond_b0
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const-string v0, "missingUrls"

    invoke-static {v0, p0}, Lsjo;->j(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :pswitch_c2
    sget-object v0, Ls9g;->h:Ls9g;

    invoke-virtual {v0, p0, v1}, Ls9g;->f(Ljava/lang/String;Z)Ljag;

    move-result-object v0

    if-nez v0, :cond_d0

    sget-object v0, Lrmj;->a:Ln9h;

    invoke-virtual {v0, p0}, Ln9h;->k(Ljava/lang/String;)V

    goto :goto_113

    :cond_d0
    sget-object v1, Llag;->b:Llag;

    invoke-virtual {v0, v1}, Ljag;->b(Llag;)Ljava/lang/Boolean;

    move-result-object v3

    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_e4

    sget-object v0, Lrmj;->a:Ln9h;

    invoke-virtual {v0, p0}, Ln9h;->k(Ljava/lang/String;)V

    goto :goto_113

    :cond_e4
    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v0

    const/4 v1, -0x1

    if-nez v0, :cond_ee

    move v0, v1

    goto :goto_f6

    :cond_ee
    sget-object v3, Lb0l;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v3, v0

    :goto_f6
    if-eq v0, v1, :cond_10e

    if-eq v0, v2, :cond_104

    const/4 v1, 0x2

    if-eq v0, v1, :cond_113

    const/4 v1, 0x3

    if-eq v0, v1, :cond_10e

    invoke-static {}, Lh9o;->p()V

    goto :goto_113

    :cond_104
    sget-object v0, Lrmj;->a:Ln9h;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v0, v3, v4, v2, p0}, Ln9h;->j(JZLjava/lang/String;)Lsmj;

    goto :goto_113

    :cond_10e
    sget-object v0, Lrmj;->a:Ln9h;

    invoke-virtual {v0, p0}, Ln9h;->k(Ljava/lang/String;)V

    :cond_113
    :goto_113
    return-void

    :pswitch_114
    sget-object v0, Llqm;->d:Llqm;

    invoke-static {p0, v0, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    return-void

    :pswitch_11e
    sget-object v0, Lorg/chromium/content/browser/ChildProcessLauncherHelperImpl;->l:Lrl;

    invoke-static {p0}, Lveg;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, LJ/N;->MmS4zlEt(Ljava/lang/Object;)V

    return-void

    :pswitch_128
    invoke-static {p0}, LJ/N;->Mk6fI$HM(Ljava/lang/Object;)V

    return-void

    :pswitch_12c
    invoke-static {p0}, LJ/N;->MP0_t_nz(Ljava/lang/Object;)V

    return-void

    :pswitch_data_130
    .packed-switch 0x0
        :pswitch_12c
        :pswitch_128
        :pswitch_11e
        :pswitch_114
        :pswitch_c2
        :pswitch_45
        :pswitch_27
    .end packed-switch
.end method
