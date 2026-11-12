.class public final Lpf;
.super Lcej;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public b:Z

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lpf;->a:B

    iput-object p1, p0, Lpf;->c:Ljava/lang/Object;

    iput-object p2, p0, Lpf;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final createSheet(Lmej;Lb2l;)Ldej;
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lpf;->a:B

    iget-object v3, v0, Lpf;->c:Ljava/lang/Object;

    const/4 v4, 0x0

    packed-switch v2, :pswitch_data_b0

    check-cast v3, Llp9;

    iget-object v2, v3, Llp9;->c:Lru9;

    invoke-virtual {v2}, Lru9;->b()Lnv6;

    move-result-object v2

    iget-object v5, v3, Llp9;->c:Lru9;

    iget-object v5, v5, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v6, "vpn.free_promo.1.show_count"

    invoke-interface {v5, v6, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    iget-object v7, v2, Lnv6;->a:Ljava/lang/Object;

    check-cast v7, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v7, v6, v5}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-string v8, "vpn.free_promo.1.show_timestamp"

    invoke-interface {v7, v8, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v2}, Lnv6;->w()V

    invoke-interface {v1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    new-instance v9, Llxh;

    const v5, 0x7f080a1e

    invoke-direct {v9, v5}, Llxh;-><init>(I)V

    new-instance v10, Lrxh;

    const v5, 0x7f141379

    invoke-direct {v10, v5}, Lrxh;-><init>(I)V

    new-instance v11, Lrxh;

    const v5, 0x7f1413f2

    invoke-direct {v11, v5}, Lrxh;-><init>(I)V

    new-instance v5, Lrxh;

    const v6, 0x7f140b4b

    invoke-direct {v5, v6}, Lrxh;-><init>(I)V

    new-instance v6, Ljp9;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    invoke-static {v2, v5}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v7

    const/4 v8, 0x0

    if-nez v7, :cond_66

    move-object v13, v8

    move-object v14, v13

    goto :goto_68

    :cond_66
    move-object v13, v5

    move-object v14, v6

    :goto_68
    new-instance v5, Lrxh;

    const v6, 0x7f141378

    invoke-direct {v5, v6}, Lrxh;-><init>(I)V

    iget-object v6, v0, Lpf;->d:Ljava/lang/Object;

    check-cast v6, Lb2l;

    new-instance v7, Lkp9;

    invoke-direct {v7, v0, v3, v6, v4}, Lkp9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2, v5}, Lo18;->h(Landroid/content/Context;Lrxh;)I

    move-result v0

    if-nez v0, :cond_83

    move-object v15, v8

    move-object/from16 v16, v15

    goto :goto_86

    :cond_83
    move-object v15, v5

    move-object/from16 v16, v7

    :goto_86
    new-instance v0, Lqf;

    new-instance v5, Lgua;

    const/4 v8, 0x0

    const/4 v12, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/16 v17, 0x1

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-direct/range {v5 .. v20}, Lgua;-><init>(Lfua;Llxh;Lc37;Llxh;Lpxh;Lpxh;Landroid/view/ViewGroup;Lpxh;Leua;Lpxh;Leua;ZLdxh;ZLm98;)V

    const/4 v2, 0x2

    invoke-direct {v0, v1, v5, v2}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    return-object v0

    :pswitch_9e
    new-instance v2, Lqf;

    check-cast v3, Lyu2;

    invoke-direct {v2, v1, v3, v4}, Lqf;-><init>(Lmej;Ljava/lang/Object;B)V

    new-instance v1, Lof;

    invoke-direct {v1, v0, v4}, Lof;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v2, Ldej;->a:Li7f;

    invoke-virtual {v0, v1}, Li7f;->b(Ljava/lang/Object;)Z

    return-object v2

    :pswitch_data_b0
    .packed-switch 0x0
        :pswitch_9e
    .end packed-switch
.end method

.method public final onFinished(Lhjm;)V
    .registers 8

    iget-byte v0, p0, Lpf;->a:B

    packed-switch v0, :pswitch_data_48

    invoke-super {p0, p1}, Lcej;->onFinished(Lhjm;)V

    return-void

    :pswitch_9
    iget-object p1, p0, Lpf;->c:Ljava/lang/Object;

    check-cast p1, Llp9;

    const/4 v0, 0x0

    iput-object v0, p1, Llp9;->g:Lpf;

    iget-object v0, p1, Llp9;->b:Lorm;

    iget-boolean p0, p0, Lpf;->b:Z

    if-eqz p0, :cond_19

    sget-object p0, Lvb0;->b:Lvb0;

    goto :goto_1b

    :cond_19
    sget-object p0, Lvb0;->d:Lvb0;

    :goto_1b
    iget-object p1, p1, Llp9;->c:Lru9;

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "vpn.free_promo.1.show_count"

    const/4 v2, 0x0

    invoke-interface {p1, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    int-to-long v3, p1

    check-cast v0, Lx5f;

    iget-boolean p1, v0, Lx5f;->h:Z

    if-eqz p1, :cond_47

    iget-object p1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v5, Lck0;

    invoke-direct {v5, p1, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v5}, Lck0;->d()Ltd0;

    move-result-object p1

    new-instance v5, Lq5f;

    invoke-direct {v5, v3, v4, p0, v2}, Lq5f;-><init>(JLvb0;B)V

    invoke-virtual {p1, v5}, Ltd0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v1}, Lx5f;->U0(Lx56;)V

    :cond_47
    return-void

    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
