.class public final Lmm6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lki;

.field public final b:Lcom/opera/android/Lazy;

.field public final c:Lki;

.field public final d:Lki;

.field public final e:Lcq5;

.field public final f:Loi;

.field public final g:Lh7f;

.field public final h:Lx5f;


# direct methods
.method public constructor <init>(Lki;Lcom/opera/android/Lazy;Lki;Lki;Lcq5;Loi;Lx5f;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lmm6;->g:Lh7f;

    iput-object p1, p0, Lmm6;->a:Lki;

    iput-object p2, p0, Lmm6;->b:Lcom/opera/android/Lazy;

    iput-object p3, p0, Lmm6;->c:Lki;

    iput-object p4, p0, Lmm6;->d:Lki;

    iput-object p5, p0, Lmm6;->e:Lcq5;

    iput-object p6, p0, Lmm6;->f:Loi;

    iput-object p7, p0, Lmm6;->h:Lx5f;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lly3;

    iget-object p0, p0, Lmm6;->g:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lly3;

    iget-object p0, p0, Lmm6;->g:Lh7f;

    invoke-virtual {p0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a()Lyl6;
    .registers 1

    iget-object p0, p0, Lmm6;->b:Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyl6;

    return-object p0
.end method

.method public final b(Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 6

    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object v0

    iget-object v0, v0, Lyl6;->c:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "resume_type"

    const/4 v2, 0x3

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "resume_deep_link"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p1

    iget-object p0, p0, Lmm6;->f:Loi;

    invoke-virtual {p1, p0, p2}, Lyl6;->e(Loi;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c(Lvb0;Lac0;Ljava/lang/String;)V
    .registers 11

    iget-object v0, p0, Lmm6;->b:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lyl6;

    iget-object v2, p0, Lmm6;->h:Lx5f;

    const/4 v5, 0x0

    move-object v3, p1

    move-object v4, p2

    move-object v6, p3

    invoke-virtual/range {v1 .. v6}, Lyl6;->i(Lorm;Lvb0;Lac0;ZLjava/lang/String;)V

    return-void
.end method

.method public final e(ZLeej;Lqim;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v0, Lmm6;->c:Lki;

    iget-object v2, v2, Lki;->b:Ljava/lang/Object;

    check-cast v2, Lu59;

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v3

    iget-object v3, v3, Lyl6;->c:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    invoke-static {}, Lkm6;->values()[Lkm6;

    move-result-object v4

    const-string v5, "resume_type"

    const/4 v6, 0x0

    invoke-interface {v3, v5, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v7

    aget-object v4, v4, v7

    new-instance v7, Ljm6;

    sget-object v8, Lkm6;->d:Lkm6;

    const-string v9, "resume_deep_link"

    const/4 v10, 0x0

    if-ne v4, v8, :cond_31

    invoke-interface {v3, v9, v10}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_32

    :cond_31
    move-object v3, v10

    :goto_32
    invoke-direct {v7, v4, v3}, Ljm6;-><init>(Lkm6;Ljava/lang/String;)V

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v8

    iget-object v8, v8, Lyl6;->c:Lb59;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/SharedPreferences;

    invoke-interface {v8}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v11

    invoke-interface {v11, v5}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5, v9}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    const-string v9, "foreground_counter"

    invoke-interface {v8, v9, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v8

    const/4 v11, 0x1

    add-int/2addr v8, v11

    invoke-interface {v5, v9, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v5

    invoke-virtual {v5}, Lyl6;->d()Lsl6;

    move-result-object v5

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    const/4 v8, 0x2

    iget-object v12, v0, Lmm6;->h:Lx5f;

    packed-switch v4, :pswitch_data_20e

    if-eqz p1, :cond_1b4

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v3

    iget-object v3, v3, Lyl6;->c:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    const-string v4, "show_counter_auto"

    invoke-interface {v3, v4, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v4

    const/16 v5, 0x800

    iget-object v7, v0, Lmm6;->d:Lki;

    const-wide/32 v12, 0x5265c00

    if-gtz v4, :cond_ad

    invoke-interface {v3, v9, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, 0x3

    if-lt v3, v4, :cond_ad

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2}, Lu59;->H()Lt59;

    move-result-object v8

    iget-wide v14, v8, Lt59;->b:J

    add-long/2addr v14, v12

    cmp-long v3, v3, v14

    if-ltz v3, :cond_ad

    invoke-virtual {v7}, Lki;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lwnh;

    invoke-virtual {v3, v5}, Lwnh;->a(I)Z

    move-result v3

    if-nez v3, :cond_af

    :cond_ad
    move v3, v6

    goto :goto_b7

    :cond_af
    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v3

    invoke-virtual {v3}, Lyl6;->k()Z

    move-result v3

    :goto_b7
    sget-object v4, Lijm;->b:Lijm;

    if-eqz v3, :cond_da

    new-instance v2, Lxm5;

    invoke-direct {v2, v0}, Lxm5;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v0

    iget-object v3, v0, Lyl6;->c:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    iget-object v1, v1, Leej;->a:Lnej;

    new-instance v5, Lim6;

    invoke-direct {v5, v2, v0, v3, v6}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v5, v4}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_da
    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v3

    iget-object v8, v3, Lyl6;->c:Lb59;

    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/content/SharedPreferences;

    invoke-interface {v14, v9, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v9

    sget-object v15, Lkm6;->a:Lkm6;

    if-le v9, v11, :cond_165

    invoke-virtual {v3}, Lyl6;->g()Z

    move-result v9

    if-eqz v9, :cond_fc

    invoke-virtual {v3}, Lyl6;->f()Z

    move-result v3

    if-nez v3, :cond_fc

    move v3, v11

    goto :goto_fd

    :cond_fc
    move v3, v6

    :goto_fd
    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/content/SharedPreferences;

    move-wide/from16 v16, v12

    const-string v12, "show_enable_default_browser_dialog_on_startpage"

    invoke-interface {v9, v12, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v13

    if-eqz v13, :cond_115

    invoke-static {v9, v12}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    if-eqz v3, :cond_165

    sget-object v2, Lkm6;->e:Lkm6;

    goto :goto_166

    :cond_115
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v12

    if-eqz v3, :cond_165

    iget-object v3, v0, Lmm6;->e:Lcq5;

    invoke-virtual {v3}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lf8f;

    invoke-virtual {v3}, Lf8f;->k()Z

    move-result v3

    if-eqz v3, :cond_165

    invoke-virtual {v2}, Lu59;->H()Lt59;

    move-result-object v2

    iget-wide v2, v2, Lt59;->b:J

    add-long v2, v2, v16

    cmp-long v2, v12, v2

    if-ltz v2, :cond_165

    invoke-virtual {v7}, Lki;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwnh;

    invoke-virtual {v2, v5}, Lwnh;->a(I)Z

    move-result v2

    if-eqz v2, :cond_151

    const-string v2, "last_show_auto"

    move-wide/from16 v18, v12

    const-wide/16 v11, 0x0

    invoke-interface {v14, v2, v11, v12}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    add-long v2, v2, v16

    cmp-long v2, v18, v2

    if-ltz v2, :cond_165

    :cond_151
    invoke-virtual {v8}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/SharedPreferences;

    const-string v3, "show_enable_default_second_browser_dialog_on_startpage"

    invoke-interface {v2, v3, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_165

    invoke-static {v2, v3}, Lcom/appsflyer/internal/j;->a(Landroid/content/SharedPreferences;Ljava/lang/String;)V

    sget-object v2, Lkm6;->f:Lkm6;

    goto :goto_166

    :cond_165
    move-object v2, v15

    :goto_166
    if-eq v2, v15, :cond_1b4

    new-instance v3, Ljm6;

    invoke-direct {v3, v2, v10}, Ljm6;-><init>(Lkm6;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    packed-switch v2, :pswitch_data_21e

    goto :goto_1b4

    :pswitch_175
    invoke-virtual {v0, v3}, Lmm6;->h(Ljm6;)V

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v2

    invoke-virtual {v2}, Lyl6;->c()Z

    move-result v2

    if-eqz v2, :cond_192

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v2

    new-instance v3, Lem6;

    const/4 v9, 0x1

    invoke-direct {v3, v0, v1, v9}, Lem6;-><init>(Lmm6;Leej;B)V

    iget-object v0, v0, Lmm6;->f:Loi;

    invoke-virtual {v2, v0, v3}, Lyl6;->e(Loi;Ljava/lang/Runnable;)V

    return-void

    :cond_192
    new-instance v2, Lxm5;

    invoke-direct {v2, v0}, Lxm5;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v0

    iget-object v3, v0, Lyl6;->c:Lb59;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/SharedPreferences;

    iget-object v1, v1, Leej;->a:Lnej;

    new-instance v5, Lim6;

    invoke-direct {v5, v2, v0, v3, v6}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v5, v4}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_1b1
    invoke-virtual {v0, v3}, Lmm6;->g(Ljm6;)V

    :cond_1b4
    :goto_1b4
    return-void

    :pswitch_1b5
    move-object v1, v5

    new-instance v5, Lbl6;

    invoke-direct {v5, v0, v8}, Lbl6;-><init>(Ljava/lang/Object;B)V

    sget-object v3, Lac0;->i:Lac0;

    const/4 v4, 0x0

    move-object/from16 v2, p3

    invoke-virtual/range {v0 .. v5}, Lmm6;->f(Lsl6;Lqim;Lac0;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :pswitch_1c4
    sget-object v1, Lac0;->h:Lac0;

    invoke-virtual {v0, v10, v1, v10}, Lmm6;->c(Lvb0;Lac0;Ljava/lang/String;)V

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v0

    invoke-virtual {v0, v12}, Lyl6;->h(Lx5f;)V

    return-void

    :pswitch_1d1
    sget-object v1, Lac0;->g:Lac0;

    invoke-virtual {v0, v10, v1, v10}, Lmm6;->c(Lvb0;Lac0;Ljava/lang/String;)V

    invoke-virtual {v0}, Lmm6;->a()Lyl6;

    move-result-object v0

    invoke-virtual {v0, v12}, Lyl6;->h(Lx5f;)V

    return-void

    :pswitch_1de
    move-object v2, v5

    new-instance v5, Lgl6;

    const/4 v9, 0x1

    invoke-direct {v5, v0, v1, v7, v9}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v4, v3

    sget-object v3, Lac0;->d:Lac0;

    move-object v1, v2

    move-object/from16 v2, p3

    invoke-virtual/range {v0 .. v5}, Lmm6;->f(Lsl6;Lqim;Lac0;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :pswitch_1ef
    move-object v2, v5

    new-instance v5, Lem6;

    invoke-direct {v5, v0, v1, v6}, Lem6;-><init>(Lmm6;Leej;B)V

    sget-object v3, Lac0;->b:Lac0;

    const/4 v4, 0x0

    move-object v1, v2

    move-object/from16 v2, p3

    invoke-virtual/range {v0 .. v5}, Lmm6;->f(Lsl6;Lqim;Lac0;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :pswitch_1ff
    move-object v1, v5

    new-instance v5, Lbl6;

    invoke-direct {v5, v0, v8}, Lbl6;-><init>(Ljava/lang/Object;B)V

    sget-object v3, Lac0;->c:Lac0;

    const/4 v4, 0x0

    move-object/from16 v2, p3

    invoke-virtual/range {v0 .. v5}, Lmm6;->f(Lsl6;Lqim;Lac0;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :pswitch_data_20e
    .packed-switch 0x1
        :pswitch_1ff
        :pswitch_1ef
        :pswitch_1de
        :pswitch_1d1
        :pswitch_1c4
        :pswitch_1b5
    .end packed-switch

    :pswitch_data_21e
    .packed-switch 0x0
        :pswitch_1b1
        :pswitch_1b1
        :pswitch_1b1
        :pswitch_1b1
        :pswitch_175
        :pswitch_175
        :pswitch_1b1
    .end packed-switch
.end method

.method public final f(Lsl6;Lqim;Lac0;Ljava/lang/String;Ljava/lang/Runnable;)V
    .registers 7

    sget-object v0, Lvb0;->b:Lvb0;

    invoke-virtual {p0, v0, p3, p4}, Lmm6;->c(Lvb0;Lac0;Ljava/lang/String;)V

    invoke-virtual {p1}, Lsl6;->b()Z

    move-result p1

    if-eqz p1, :cond_3c

    new-instance p1, Lg7f;

    iget-object p3, p0, Lmm6;->g:Lh7f;

    invoke-direct {p1, p3}, Lg7f;-><init>(Lh7f;)V

    :goto_12
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_31

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lly3;

    iget-byte p4, p3, Lly3;->a:B

    iget-object p3, p3, Lly3;->b:Ljava/lang/Object;

    packed-switch p4, :pswitch_data_64

    check-cast p3, Ldaj;

    invoke-virtual {p3}, Ldaj;->g()V

    goto :goto_12

    :pswitch_2b
    check-cast p3, Lny3;

    invoke-virtual {p3}, Lny3;->c()V

    goto :goto_12

    :cond_31
    new-instance p1, Lig;

    invoke-direct {p1, p0, p2}, Lig;-><init>(Lmm6;Lqim;)V

    const-wide/16 p2, 0xc8

    invoke-static {p1, p2, p3}, Lvml;->d(Ljava/lang/Runnable;J)V

    goto :goto_5a

    :cond_3c
    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ltl6;->a()Z

    move-result p1

    if-eqz p1, :cond_5a

    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p1

    invoke-virtual {p1}, Lyl6;->d()Lsl6;

    move-result-object p1

    invoke-virtual {p1}, Lsl6;->c()Z

    move-result p1

    if-nez p1, :cond_5a

    invoke-interface {p5}, Ljava/lang/Runnable;->run()V

    :cond_5a
    :goto_5a
    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p1

    iget-object p0, p0, Lmm6;->h:Lx5f;

    invoke-virtual {p1, p0}, Lyl6;->h(Lx5f;)V

    return-void

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_2b
    .end packed-switch
.end method

.method public final g(Ljm6;)V
    .registers 3

    invoke-virtual {p0, p1}, Lmm6;->h(Ljm6;)V

    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p1

    iget-object p0, p0, Lmm6;->f:Loi;

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Lyl6;->e(Loi;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final h(Ljm6;)V
    .registers 4

    invoke-virtual {p0}, Lmm6;->a()Lyl6;

    move-result-object p0

    iget-object p0, p0, Lyl6;->c:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    iget-object v0, p1, Ljm6;->a:Lkm6;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    const-string v1, "resume_type"

    invoke-interface {p0, v1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "resume_deep_link"

    iget-object p1, p1, Ljm6;->b:Ljava/lang/String;

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final i()V
    .registers 4

    iget-object v0, p0, Lmm6;->a:Lki;

    iget-object v0, v0, Lki;->b:Ljava/lang/Object;

    check-cast v0, Lqim;

    iget-object v0, v0, Lqim;->d:Lnej;

    new-instance v1, Log5;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Log5;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
