.class public final synthetic Lo4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr4m;


# direct methods
.method public synthetic constructor <init>(Lr4m;B)V
    .registers 3

    iput-byte p2, p0, Lo4m;->a:B

    iput-object p1, p0, Lo4m;->b:Lr4m;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lo4m;->a:B

    sget-object v1, Lio7;->A:Lio7;

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    iget-object p0, p0, Lo4m;->b:Lr4m;

    packed-switch v0, :pswitch_data_13e

    iget-object v0, p0, Lr4m;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0, v3}, Lr4m;->Z(Lb2l;I)V

    return-void

    :pswitch_14
    invoke-virtual {p0}, Lr4m;->W()Lszb;

    move-result-object v0

    iget-object v2, p0, Lr4m;->g:Lv3m;

    if-nez v0, :cond_20

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_39

    :cond_20
    iget-object v2, v2, Lv3m;->a:Landroid/content/Context;

    sget-object v3, Lbvn;->k:Lsjn;

    invoke-static {v2, v1, v3}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v1

    check-cast v1, Lbvn;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lavn;

    iget-object v1, v1, Lavn;->b:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Ljava/lang/String;

    :goto_39
    iget-object v0, p0, Lr4m;->j:Lkze;

    if-nez v4, :cond_3f

    const-string v4, ""

    :cond_3f
    invoke-virtual {v0, v4}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lr4m;->f0()V

    return-void

    :pswitch_46
    invoke-virtual {p0}, Lr4m;->f0()V

    return-void

    :pswitch_4a
    iget-object v0, p0, Lr4m;->e:Ltjm;

    invoke-virtual {v0, v2}, Ltjm;->J0(Z)V

    iget-object v0, p0, Lr4m;->d:Lh5m;

    iget-object v1, v0, Lh5m;->c:Lcbl;

    invoke-virtual {v1}, Lcbl;->run()V

    iget-object v0, v0, Lh5m;->f:Lvz5;

    if-eqz v0, :cond_5f

    iget-object v0, v0, Lvz5;->i:Ljava/lang/Object;

    check-cast v0, Ld7h;

    goto :goto_60

    :cond_5f
    move-object v0, v4

    :goto_60
    if-eqz v0, :cond_7d

    iget-object p0, p0, Lr4m;->b:Ly4m;

    iget-object v1, p0, Ly4m;->d:Lv3m;

    iget-object v2, p0, Ly4m;->i:Lszb;

    if-nez v2, :cond_75

    invoke-virtual {v1}, Lv3m;->d()Lszb;

    move-result-object v2

    iput-object v2, p0, Ly4m;->i:Lszb;

    invoke-virtual {v1, v2}, Lv3m;->i(Lszb;)V

    iget-object v2, p0, Ly4m;->i:Lszb;

    :cond_75
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lps0;->d:Lps0;

    invoke-virtual {v0, v4, v2, p0}, Ld7h;->d(Lszb;Lszb;Lps0;)V

    :cond_7d
    return-void

    :pswitch_7e
    iget-object v0, p0, Lr4m;->a:Ll8l;

    invoke-virtual {v0, v4}, Ll8l;->H0(Ljava/lang/String;)V

    iget-object v0, p0, Lr4m;->c:Lb0c;

    iput-object v4, v0, Lb0c;->e:Lszb;

    iput-object v4, v0, Lb0c;->f:Lszb;

    iput-byte v2, v0, Lb0c;->d:B

    invoke-virtual {v0}, Ln1;->v0()V

    iget-object v0, p0, Lr4m;->d:Lh5m;

    invoke-virtual {v0}, Lh5m;->a()V

    iget-object p0, p0, Lr4m;->e:Ltjm;

    invoke-virtual {p0, v2}, Ltjm;->J0(Z)V

    return-void

    :pswitch_99
    iget-object v0, p0, Lr4m;->e:Ltjm;

    invoke-virtual {v0, v2}, Ltjm;->J0(Z)V

    iget-object p0, p0, Lr4m;->d:Lh5m;

    invoke-virtual {p0}, Lh5m;->a()V

    return-void

    :pswitch_a4
    iget-object v0, p0, Lr4m;->d:Lh5m;

    invoke-virtual {v0}, Lh5m;->a()V

    iget-object v0, p0, Lr4m;->f:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v0, v3}, Lr4m;->Z(Lb2l;I)V

    return-void

    :pswitch_b1
    iget-object v0, p0, Lr4m;->b:Ly4m;

    iget-object v1, v0, Ly4m;->d:Lv3m;

    invoke-virtual {v1}, Lv3m;->g()Z

    move-result v2

    if-eq v2, v3, :cond_c9

    iget-object v2, v1, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v4, "translate_web_pages_enabled"

    invoke-virtual {v2, v3, v4}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    invoke-virtual {v1}, Lv3m;->d()Lszb;

    move-result-object v2

    invoke-virtual {v1, v2}, Lv3m;->i(Lszb;)V

    :cond_c9
    iget-object v0, v0, Ly4m;->d:Lv3m;

    iget-object v0, v0, Lv3m;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "translate_web_pages_backup_translation_method_enabled"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    if-eq v2, v3, :cond_d8

    invoke-virtual {v0, v3, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_d8
    new-instance v0, Lo4m;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Lo4m;-><init>(Lr4m;B)V

    invoke-virtual {p0, v0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    iput-boolean v3, p0, Lr4m;->l:Z

    return-void

    :pswitch_e4
    iget-object v0, p0, Lr4m;->d:Lh5m;

    invoke-virtual {p0}, Lr4m;->W()Lszb;

    move-result-object v2

    iget-object v3, p0, Lr4m;->g:Lv3m;

    if-nez v2, :cond_f2

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_10b

    :cond_f2
    iget-object v4, v3, Lv3m;->a:Landroid/content/Context;

    sget-object v5, Lbvn;->k:Lsjn;

    invoke-static {v4, v1, v5}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v4

    check-cast v4, Lbvn;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lavn;

    iget-object v4, v4, Lavn;->b:Ljava/util/HashMap;

    invoke-virtual {v4, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    move-object v4, v2

    check-cast v4, Ljava/lang/String;

    :goto_10b
    iget-object p0, p0, Lr4m;->b:Ly4m;

    iget-object v2, p0, Ly4m;->d:Lv3m;

    iget-object v5, p0, Ly4m;->i:Lszb;

    if-nez v5, :cond_11e

    invoke-virtual {v2}, Lv3m;->d()Lszb;

    move-result-object v5

    iput-object v5, p0, Ly4m;->i:Lszb;

    invoke-virtual {v2, v5}, Lv3m;->i(Lszb;)V

    iget-object v5, p0, Ly4m;->i:Lszb;

    :cond_11e
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, v3, Lv3m;->a:Landroid/content/Context;

    sget-object v2, Lbvn;->k:Lsjn;

    invoke-static {p0, v1, v2}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object p0

    check-cast p0, Lbvn;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lavn;

    iget-object p0, p0, Lavn;->b:Ljava/util/HashMap;

    invoke-virtual {p0, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, v4, p0}, Lh5m;->c(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    nop

    :pswitch_data_13e
    .packed-switch 0x0
        :pswitch_e4
        :pswitch_b1
        :pswitch_a4
        :pswitch_99
        :pswitch_7e
        :pswitch_4a
        :pswitch_46
        :pswitch_14
    .end packed-switch
.end method
