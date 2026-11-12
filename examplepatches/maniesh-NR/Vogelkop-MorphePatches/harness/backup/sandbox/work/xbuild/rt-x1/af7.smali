.class public final synthetic Laf7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ligi;


# direct methods
.method public synthetic constructor <init>(Ligi;B)V
    .registers 3

    iput-byte p2, p0, Laf7;->a:B

    iput-object p1, p0, Laf7;->b:Ligi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 12

    iget-byte v0, p0, Laf7;->a:B

    iget-object p0, p0, Laf7;->b:Ligi;

    packed-switch v0, :pswitch_data_ce

    iget-object v0, p0, Ligi;->d:Ljava/lang/Object;

    check-cast v0, Lsf7;

    check-cast p1, Ljava/lang/Boolean;

    iget-object p1, p0, Ligi;->g:Ljava/lang/Object;

    check-cast p1, Lvwh;

    iget-object v1, p0, Ligi;->f:Ljava/lang/Object;

    check-cast v1, Lre7;

    iget-object v2, v1, Lre7;->d:Landroid/net/Uri;

    iget-object v3, p0, Ligi;->b:Ljava/lang/Object;

    check-cast v3, Ldx3;

    invoke-static {v3, v2}, Llg7;->e(Landroid/content/Context;Landroid/net/Uri;)Z

    move-result v3

    const/16 v4, 0x1388

    if-nez v3, :cond_2f

    new-instance p0, Lglj;

    const v2, 0x7f1407b6

    invoke-direct {p0, v2, v4}, Lglj;-><init>(II)V

    invoke-interface {p1, p0}, Lvwh;->f(Lo93;)V

    goto :goto_70

    :cond_2f
    const-string v3, "content"

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_76

    invoke-virtual {v1}, Lre7;->i()Z

    move-result v3

    const-wide/16 v5, 0x0

    if-eqz v3, :cond_46

    iget-wide v7, v1, Lre7;->j:J

    goto :goto_47

    :cond_46
    move-wide v7, v5

    :goto_47
    iget-object v3, v0, Lsf7;->a:Lrf7;

    invoke-virtual {v2}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v1, v2}, Lrf7;->f(Lre7;Ljava/lang/String;)J

    move-result-wide v2

    cmp-long v5, v2, v5

    if-gez v5, :cond_61

    new-instance p0, Lglj;

    const v2, 0x7f1405a3

    invoke-direct {p0, v2, v4}, Lglj;-><init>(II)V

    invoke-interface {p1, p0}, Lvwh;->f(Lo93;)V

    goto :goto_70

    :cond_61
    cmp-long v2, v7, v2

    if-lez v2, :cond_76

    new-instance p0, Lglj;

    const v2, 0x7f140b49

    invoke-direct {p0, v2, v4}, Lglj;-><init>(II)V

    invoke-interface {p1, p0}, Lvwh;->f(Lo93;)V

    :goto_70
    iget-object p0, v0, Lsf7;->a:Lrf7;

    invoke-virtual {p0, v1}, Lrf7;->s(Lre7;)V

    goto :goto_a4

    :cond_76
    iget-object p1, p0, Ligi;->e:Ljava/lang/Object;

    move-object v2, p1

    check-cast v2, Lx5f;

    const/4 v8, 0x0

    invoke-virtual {v1}, Lre7;->c()Lnc0;

    move-result-object v9

    sget-object v3, Lkc0;->e:Lkc0;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v9}, Lx5f;->N(Lkc0;Lmc0;ZZZZLnc0;)V

    invoke-virtual {v1}, Lre7;->b()V

    iget-object p1, p0, Ligi;->c:Ljava/lang/Object;

    check-cast p1, Lumi;

    sget-object v0, Lpn7;->b:Lon7;

    const/16 v0, 0xc8

    sget-object v1, Lun7;->d:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    new-instance v2, Lr94;

    const/16 v3, 0x1d

    invoke-direct {v2, p0, v3}, Lr94;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, v0, v1, v2}, Lfac;->B(Lumi;JLkotlin/jvm/functions/Function0;)Loml;

    :goto_a4
    return-void

    :pswitch_a5
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_bb

    iget-object p1, p0, Ligi;->d:Ljava/lang/Object;

    check-cast p1, Lsf7;

    iget-object p1, p1, Lsf7;->a:Lrf7;

    iget-object p0, p0, Ligi;->f:Ljava/lang/Object;

    check-cast p0, Lre7;

    invoke-virtual {p1, p0}, Lrf7;->s(Lre7;)V

    goto :goto_cc

    :cond_bb
    iget-object p1, p0, Ligi;->b:Ljava/lang/Object;

    check-cast p1, Ldx3;

    iget-object v0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Lx5f;

    new-instance v1, Laf7;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Laf7;-><init>(Ligi;B)V

    invoke-static {p1, v0, v1}, Lcqp;->n0(Ldx3;Lx5f;Lcom/opera/api/Callback;)V

    :goto_cc
    return-void

    nop

    :pswitch_data_ce
    .packed-switch 0x0
        :pswitch_a5
    .end packed-switch
.end method
