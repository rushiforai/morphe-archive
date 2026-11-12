.class public final synthetic Lty;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lmo7;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lty;->a:B

    iput-object p1, p0, Lty;->b:Ljava/lang/Object;

    iput-object p2, p0, Lty;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final o(Z)V
    .registers 10

    iget-byte p1, p0, Lty;->a:B

    const/4 v0, 0x0

    iget-object v1, p0, Lty;->c:Ljava/lang/Object;

    iget-object p0, p0, Lty;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_196

    check-cast p0, Lmdh;

    check-cast v1, Llqh;

    iget-boolean p1, v1, Llqh;->a:Z

    new-instance v2, Lvvf;

    const/4 v3, 0x6

    invoke-direct {v2, v1, p0, v3}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v1, 0x2

    invoke-static {p0, p1, v0, v2, v1}, Lmdh;->b(Lmdh;ZLiqi;Lkotlin/jvm/functions/Function1;I)V

    return-void

    :pswitch_1b
    check-cast p0, Le3j;

    check-cast v1, Lcom/opera/android/OperaApplication;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    sget-object v1, Lh11;->j:Lh11;

    const/16 v2, 0x14

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Ld3j;->d(IZ)Lc3j;

    move-result-object v2

    iget-object v4, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    const-string v5, "osp.analytics_host"

    const-string v6, "osp.analytics_key"

    if-nez v2, :cond_4c

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, v0, v0}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5d

    :cond_4c
    iget-object v7, v2, Lqsh;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v2, v2, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v2, Ljava/lang/String;

    invoke-interface {v4, v5, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, v2, v7}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    :goto_5d
    sget-object v1, Ltc3;->j:Ltc3;

    const/16 v2, 0x15

    invoke-virtual {p0, v2, v3}, Ld3j;->d(IZ)Lc3j;

    move-result-object v2

    const-string v5, "osp.behavior_host"

    const-string v6, "osp.behavior_key"

    if-nez v2, :cond_75

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, v0, v0}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_86

    :cond_75
    iget-object v7, v2, Lqsh;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v2, v2, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v2, Ljava/lang/String;

    invoke-interface {v4, v5, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, v2, v7}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    :goto_86
    sget-object v1, Laxh;->j:Laxh;

    const/16 v2, 0x16

    invoke-virtual {p0, v2, v3}, Ld3j;->d(IZ)Lc3j;

    move-result-object v2

    const-string v5, "osp.requests_host"

    const-string v6, "osp.requests_key"

    if-nez v2, :cond_9e

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, v0, v0}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_af

    :cond_9e
    iget-object v7, v2, Lqsh;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v2, v2, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v2, Ljava/lang/String;

    invoke-interface {v4, v5, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, v2, v7}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    :goto_af
    sget-object v1, Lcef;->j:Lcef;

    const/16 v2, 0x24

    invoke-virtual {p0, v2, v3}, Ld3j;->d(IZ)Lc3j;

    move-result-object v2

    const-string v5, "osp.onboarding_host"

    const-string v6, "osp.onboarding_key"

    if-nez v2, :cond_c7

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, v0, v0}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_d8

    :cond_c7
    iget-object v7, v2, Lqsh;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v2, v2, Lc3j;->d:Ljava/lang/Comparable;

    check-cast v2, Ljava/lang/String;

    invoke-interface {v4, v5, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v6, v7}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, v2, v7}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    :goto_d8
    sget-object v1, Lbe7;->j:Lbe7;

    const/16 v2, 0x27

    invoke-virtual {p0, v2, v3}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    const-string v2, "osp.domains_host"

    const-string v3, "osp.domains_key"

    if-nez p0, :cond_f0

    invoke-interface {v4, v2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, v0, v0}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_101

    :cond_f0
    iget-object v0, p0, Lqsh;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    invoke-interface {v4, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v3, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1, p0, v0}, Lz43;->C(Ljava/lang/String;Ljava/lang/String;)V

    :goto_101
    invoke-virtual {p1}, Lnv6;->w()V

    return-void

    :pswitch_105
    check-cast p0, Lxnh;

    check-cast v1, Lxnc;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwnh;

    const/16 p1, 0x400

    invoke-virtual {p0, p1}, Lwnh;->b(I)Z

    move-result p1

    const/high16 v0, 0x8000000

    invoke-virtual {p0, v0}, Lwnh;->b(I)Z

    move-result v0

    const/high16 v2, 0x10000000

    invoke-virtual {p0, v2}, Lwnh;->b(I)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    iget-object v2, v1, Lxnc;->a:Lkze;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v2, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p1, v1, Lxnc;->b:Lkze;

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p1, v1, Lxnc;->c:Lkze;

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, p0}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, v1, Lxnc;->e:Lode;

    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_146
    check-cast p0, Lz1h;

    check-cast v1, Lno7;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Lz1h;->b(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_152
    check-cast p0, Lxk3;

    check-cast v1, Lxnh;

    invoke-virtual {v1}, Lno7;->i()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwnh;

    const/high16 v0, 0x800000

    invoke-virtual {p1, v0}, Lwnh;->a(I)Z

    move-result p1

    iput-boolean p1, p0, Lxk3;->e:Z

    return-void

    :pswitch_165
    check-cast p0, Lwy;

    check-cast v1, Lnn7;

    iget-object p0, p0, Lwy;->w:Lgy;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ley;

    iget-object p1, v1, Lnn7;->p:Ley;

    if-nez p1, :cond_17f

    iput-object p0, v1, Lnn7;->p:Ley;

    iget-object p0, v1, Lnn7;->r:Landroid/util/SparseArray;

    if-eqz p0, :cond_195

    invoke-virtual {v1}, Lnn7;->o()V

    goto :goto_195

    :cond_17f
    iget-wide v2, p1, Ley;->c:J

    iput-object p0, v1, Lnn7;->p:Ley;

    iget-wide p0, p0, Ley;->c:J

    cmp-long p0, p0, v2

    if-gez p0, :cond_195

    iget-object p0, v1, Lnn7;->m:Ln57;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-virtual {v1, p0, p1}, Lnn7;->m(J)V

    :cond_195
    :goto_195
    return-void

    :pswitch_data_196
    .packed-switch 0x0
        :pswitch_165
        :pswitch_152
        :pswitch_146
        :pswitch_105
        :pswitch_1b
    .end packed-switch
.end method
