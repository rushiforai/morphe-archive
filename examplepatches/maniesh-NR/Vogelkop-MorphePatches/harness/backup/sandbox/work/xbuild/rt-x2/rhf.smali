.class public final Lrhf;
.super Lrn;
.source "SourceFile"


# instance fields
.field public final synthetic m:B

.field public final synthetic n:Loo8;


# direct methods
.method public synthetic constructor <init>(Loo8;Landroid/app/Activity;Lzy;Ldl;B)V
    .registers 6

    iput-byte p5, p0, Lrhf;->m:B

    iput-object p1, p0, Lrhf;->n:Loo8;

    invoke-direct {p0, p1, p2, p3, p4}, Lrn;-><init>(Loo8;Landroid/app/Activity;Lzy;Ldl;)V

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 13

    iget-byte v0, p0, Lrhf;->m:B

    const/4 v1, 0x1

    iget-object v2, p0, Lrhf;->n:Loo8;

    iget-object v3, p0, Lk43;->c:Ljava/lang/String;

    iget-object v4, p0, Lrn;->k:Landroid/app/Activity;

    packed-switch v0, :pswitch_data_94

    new-instance v0, Lbp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v1, Lshf;

    invoke-direct {v1, v0, p0, v2}, Lshf;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v4, v3, v1}, Lphj;->d0(Landroid/content/Context;Ljava/lang/String;Lfie;)V

    return-void

    :pswitch_1a
    new-instance v0, Lbp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v5, Lp8f;

    invoke-direct {v5, p0, v0, v2, v1}, Lp8f;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Lwjo;->b:Lwjo;

    invoke-static {v5}, Lfcp;->a(Lcn;)Lkotlin/Unit;

    move-result-object v0

    if-eqz v0, :cond_55

    invoke-static {v5, v4}, Lfcp;->b(Lcn;Landroid/content/Context;)Lkotlin/Unit;

    move-result-object v0

    if-eqz v0, :cond_55

    invoke-static {v5, v3}, Lfcp;->c(Lcn;Ljava/lang/String;)Lkotlin/Unit;

    move-result-object v0

    if-eqz v0, :cond_55

    sget-object v0, Lfko;->a:Lejo;

    invoke-static {v4}, Lfko;->a(Landroid/content/Context;)V

    new-instance v0, Ldhb;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lpro;

    sget-object v4, Lsm;->e:Lsm;

    sget-object v6, Leq;->e:Leq;

    invoke-direct {v2, v3, v4, v6, p0}, Lpro;-><init>(Ljava/lang/String;Lsm;Leq;Lwjo;)V

    invoke-direct {v0, v1, v2}, Lk8;-><init>(Landroid/content/Context;Lpro;)V

    invoke-virtual {v0, v5}, Lk8;->J(Lcn;)V

    invoke-virtual {v0}, Lk8;->I()V

    :cond_55
    return-void

    :pswitch_56
    new-instance v0, Lbp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object v5, v2, Lbqi;->f:Lrm;

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eq v5, v1, :cond_76

    const/4 v1, 0x2

    if-eq v5, v1, :cond_72

    sget-object v10, Lv50;->n:Lv50;

    const/4 v11, 0x0

    const/4 v7, 0x0

    const-string v8, "Unknown banner ad format for Opera Ads"

    const/4 v9, 0x0

    move-object v6, p0

    invoke-virtual/range {v6 .. v11}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    goto :goto_92

    :cond_72
    move-object v6, p0

    sget-object p0, Leq;->d:Leq;

    goto :goto_79

    :cond_76
    move-object v6, p0

    sget-object p0, Leq;->c:Leq;

    :goto_79
    new-instance v1, Lz13;

    invoke-direct {v1, v4}, Lz13;-><init>(Landroid/content/Context;)V

    iget-object v4, v1, Lz13;->b:Ljava/lang/String;

    if-nez v4, :cond_84

    iput-object v3, v1, Lz13;->b:Ljava/lang/String;

    :cond_84
    iget-object v3, v1, Lz13;->a:Leq;

    if-nez v3, :cond_8a

    iput-object p0, v1, Lz13;->a:Leq;

    :cond_8a
    new-instance p0, Ls14;

    invoke-direct {p0, v0, v6, v1, v2}, Ls14;-><init>(Lbp;Lrhf;Lz13;Loo8;)V

    invoke-virtual {v1, p0}, Lz13;->g(Lu13;)V

    :goto_92
    return-void

    nop

    :pswitch_data_94
    .packed-switch 0x0
        :pswitch_56
        :pswitch_1a
    .end packed-switch
.end method
