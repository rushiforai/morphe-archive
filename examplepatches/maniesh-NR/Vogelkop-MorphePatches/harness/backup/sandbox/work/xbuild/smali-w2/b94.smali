.class public final synthetic Lb94;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbg1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lb94;->a:B

    iput-object p1, p0, Lb94;->b:Ljava/lang/Object;

    iput-object p2, p0, Lb94;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 6

    iget-byte v0, p0, Lb94;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_d6

    iget-object v0, p0, Lb94;->b:Ljava/lang/Object;

    check-cast v0, Lswk;

    iget-object p0, p0, Lb94;->c:Ljava/lang/Object;

    check-cast p0, Ln6k;

    check-cast p1, Landroid/content/SharedPreferences;

    iget-object p1, v0, Lswk;->b:Lumi;

    new-instance v2, Ljri;

    const/16 v3, 0x14

    invoke-direct {v2, p0, v0, v3}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p1, v2}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :pswitch_22
    iget-object v0, p0, Lb94;->b:Ljava/lang/Object;

    check-cast v0, Llag;

    iget-object p0, p0, Lb94;->c:Ljava/lang/Object;

    check-cast p0, Lb94;

    check-cast p1, [Lkag;

    array-length v1, p1

    new-array v1, v1, [Lcag;

    :goto_2f
    array-length v3, p1

    if-ge v2, v3, :cond_3d

    aget-object v3, p1, v2

    invoke-static {v0, v3}, Lf03;->l(Llag;Lkag;)Lcag;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_2f

    :cond_3d
    invoke-virtual {p0, v1}, Lb94;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_41
    iget-object v0, p0, Lb94;->b:Ljava/lang/Object;

    check-cast v0, Lx5f;

    iget-object p0, p0, Lb94;->c:Ljava/lang/Object;

    check-cast p0, Lwsf;

    check-cast p1, Landroid/content/SharedPreferences;

    const-string v1, "need"

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_a0

    iget-object p1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-virtual {v1, p1}, Lx56;->I(Lzpa;)Lin0;

    move-result-object p1

    const/16 v2, 0x35

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v3, v3}, Ljf0;->r(IIZ)V

    invoke-virtual {v0, v1}, Lx5f;->U0(Lx56;)V

    iget-object p1, p0, Lwsf;->b:Lqs7;

    invoke-static {}, Lqs7;->u()Lv56;

    move-result-object v0

    new-instance v1, Lak0;

    invoke-direct {v1, p1, v0}, Lak0;-><init>(Lqs7;Lv56;)V

    iget-object p1, v1, Lak0;->e:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljn0;

    iget-object p1, p1, Ljn0;->a:Lhn0;

    const/4 v1, 0x6

    invoke-virtual {p1, v1, v3, v3}, Ljf0;->r(IIZ)V

    iget-object p1, p0, Lwsf;->e:Lmgh;

    invoke-virtual {p1, v0}, Lmgh;->c(Ljf0;)Z

    move-result p1

    if-nez p1, :cond_a0

    iget-object p1, p0, Lwsf;->a:Lumi;

    new-instance v0, Lrml;

    sget-object v1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v0, v1, p1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance p1, Lo5f;

    const/16 v1, 0x11

    invoke-direct {p1, p0, v1}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p1

    iget-object p0, p0, Lwsf;->d:Lqie;

    invoke-virtual {p1, p0}, Lplk;->m(Lqie;)Lp1j;

    :cond_a0
    return-void

    :pswitch_a1
    iget-object p1, p0, Lb94;->b:Ljava/lang/Object;

    check-cast p1, Lg92;

    iget-object p0, p0, Lb94;->c:Ljava/lang/Object;

    check-cast p0, Lbg1;

    iget-object v0, p1, Lg92;->f:Ljava/util/HashMap;

    monitor-enter v0

    :try_start_ac
    iget-object v1, p1, Lg92;->f:Ljava/util/HashMap;

    invoke-virtual {v1, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbg1;
    :try_end_b4
    .catchall {:try_start_ac .. :try_end_b4} :catchall_bd

    monitor-exit v0

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :catchall_bd
    move-exception p0

    monitor-exit v0

    throw p0

    :pswitch_c0
    iget-object v0, p0, Lb94;->b:Ljava/lang/Object;

    check-cast v0, Ltcl;

    iget-object p0, p0, Lb94;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    new-instance v3, Lc94;

    invoke-direct {v3, p0, p1, v2}, Lc94;-><init>(Lcom/opera/api/Callback;Ljava/lang/Object;B)V

    invoke-interface {v0, v3}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    invoke-virtual {p0, v1}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    nop

    :pswitch_data_d6
    .packed-switch 0x0
        :pswitch_c0
        :pswitch_a1
        :pswitch_41
        :pswitch_22
    .end packed-switch
.end method
