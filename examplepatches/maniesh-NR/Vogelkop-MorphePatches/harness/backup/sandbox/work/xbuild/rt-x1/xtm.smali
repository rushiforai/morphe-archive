.class public final Lxtm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lmo7;


# instance fields
.field public final a:Lxnh;

.field public final b:Lcom/opera/android/settings/SettingsManager;

.field public final c:Lqfb;

.field public final d:Lx5f;

.field public final e:Losf;

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lxnh;Lqfb;Lx5f;Losf;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxtm;->b:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lxtm;->a:Lxnh;

    iput-object p3, p0, Lxtm;->c:Lqfb;

    iput-object p4, p0, Lxtm;->d:Lx5f;

    iput-object p5, p0, Lxtm;->e:Losf;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p2, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method


# virtual methods
.method public final M(Ljava/lang/String;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, -0x1

    sparse-switch v0, :sswitch_data_56

    goto :goto_4e

    :sswitch_9
    const-string v0, "ga_usage_statistics"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4e

    const/4 v1, 0x6

    goto :goto_4e

    :sswitch_13
    const-string v0, "personalized_default"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4e

    const/4 v1, 0x5

    goto :goto_4e

    :sswitch_1d
    const-string v0, "collect_website_categories"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4e

    const/4 v1, 0x4

    goto :goto_4e

    :sswitch_27
    const-string v0, "process_news_topics"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4e

    const/4 v1, 0x3

    goto :goto_4e

    :sswitch_31
    const-string v0, "process_location"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4e

    const/4 v1, 0x2

    goto :goto_4e

    :sswitch_3b
    const-string v0, "personalized_news"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4e

    const/4 v1, 0x1

    goto :goto_4e

    :sswitch_45
    const-string v0, "personalized_ads"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4e

    const/4 v1, 0x0

    :cond_4e
    :goto_4e
    packed-switch v1, :pswitch_data_74

    return-void

    :pswitch_52
    invoke-virtual {p0}, Lxtm;->a()V

    return-void

    :sswitch_data_56
    .sparse-switch
        -0x32e5283f -> :sswitch_45
        -0x29b9f21e -> :sswitch_3b
        -0x11e807b -> :sswitch_31
        0x1745640 -> :sswitch_27
        0x17d94d75 -> :sswitch_1d
        0x305544d2 -> :sswitch_13
        0x6f2acf46 -> :sswitch_9
    .end sparse-switch

    :pswitch_data_74
    .packed-switch 0x0
        :pswitch_52
        :pswitch_52
        :pswitch_52
        :pswitch_52
        :pswitch_52
        :pswitch_52
        :pswitch_52
    .end packed-switch
.end method

.method public final a()V
    .registers 20

    move-object/from16 v0, p0

    iget-object v1, v0, Lxtm;->d:Lx5f;

    iget-object v2, v1, Lx5f;->d:Lzpa;

    iget-object v3, v0, Lxtm;->e:Losf;

    iget-object v4, v3, Losf;->d:Lqie;

    iget-object v5, v3, Losf;->a:Lumi;

    iget-object v6, v3, Losf;->e:Lmgh;

    iget-object v7, v3, Losf;->b:Lpsp;

    iget-boolean v8, v0, Lxtm;->f:Z

    if-eqz v8, :cond_1d1

    iget-object v8, v0, Lxtm;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v8}, Lcom/opera/android/settings/SettingsManager;->I()Z

    move-result v9

    const-string v10, "personalized_ads"

    invoke-virtual {v8, v10}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result v10

    const-string v11, "personalized_news"

    invoke-virtual {v8, v11}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result v11

    const/4 v12, 0x2

    const/4 v13, 0x1

    if-eqz v9, :cond_ac

    iget-object v14, v0, Lxtm;->a:Lxnh;

    invoke-virtual {v14}, Lno7;->i()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lwnh;

    invoke-virtual {v14, v12}, Lwnh;->a(I)Z

    move-result v14

    if-nez v14, :cond_72

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v14

    invoke-virtual {v14, v2}, Lx56;->x(Lzpa;)Lea0;

    move-result-object v15

    const/4 v12, 0x5

    invoke-virtual {v15, v12, v13, v10}, Ljf0;->r(IIZ)V

    invoke-virtual {v1, v14}, Lx5f;->U0(Lx56;)V

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v14

    new-instance v15, Lyj0;

    invoke-direct {v15, v7, v14}, Lyj0;-><init>(Lpsp;Lt56;)V

    invoke-virtual {v15}, Lyj0;->a()Lfa0;

    move-result-object v15

    iget-object v15, v15, Lfa0;->a:Lda0;

    invoke-virtual {v15, v12, v13, v10}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v14}, Lmgh;->c(Ljf0;)Z

    move-result v12

    if-nez v12, :cond_72

    new-instance v12, Lrml;

    sget-object v14, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v12, v14, v5}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v14, Lmsf;

    invoke-direct {v14, v3, v13}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {v12, v14}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v12

    invoke-virtual {v12, v4}, Lplk;->m(Lqie;)Lp1j;

    :cond_72
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v12

    invoke-virtual {v12, v2}, Lx56;->x(Lzpa;)Lea0;

    move-result-object v14

    const/4 v15, 0x6

    invoke-virtual {v14, v15, v13, v11}, Ljf0;->r(IIZ)V

    invoke-virtual {v1, v12}, Lx5f;->U0(Lx56;)V

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v12

    new-instance v14, Lyj0;

    invoke-direct {v14, v7, v12}, Lyj0;-><init>(Lpsp;Lt56;)V

    invoke-virtual {v14}, Lyj0;->a()Lfa0;

    move-result-object v14

    iget-object v14, v14, Lfa0;->a:Lda0;

    invoke-virtual {v14, v15, v13, v11}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v12}, Lmgh;->c(Ljf0;)Z

    move-result v12

    if-nez v12, :cond_ac

    new-instance v12, Lrml;

    sget-object v14, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v12, v14, v5}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v14, Lmsf;

    invoke-direct {v14, v3, v13}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {v12, v14}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v12

    invoke-virtual {v12, v4}, Lplk;->m(Lqie;)Lp1j;

    :cond_ac
    const-string v12, "ga_usage_statistics"

    invoke-virtual {v8, v12}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v12

    const-string v14, "collect_website_categories"

    invoke-virtual {v8, v14}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v14

    const-string v15, "process_news_topics"

    invoke-virtual {v8, v15}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v15

    const-string v13, "process_location"

    invoke-virtual {v8, v13}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v8

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v13

    move/from16 v16, v9

    new-instance v9, Lyj0;

    invoke-direct {v9, v7, v13}, Lyj0;-><init>(Lpsp;Lt56;)V

    invoke-virtual {v9}, Lyj0;->a()Lfa0;

    move-result-object v9

    iget-object v9, v9, Lfa0;->a:Lda0;

    move/from16 v17, v11

    const/4 v11, 0x0

    move/from16 v18, v10

    const/4 v10, 0x1

    invoke-virtual {v9, v11, v10, v12}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v13}, Lmgh;->c(Ljf0;)Z

    move-result v9

    if-nez v9, :cond_f7

    new-instance v9, Lrml;

    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v9, v11, v5}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v11, Lmsf;

    invoke-direct {v11, v3, v10}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {v9, v11}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v9

    invoke-virtual {v9, v4}, Lplk;->m(Lqie;)Lp1j;

    :cond_f7
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    invoke-virtual {v9, v2}, Lx56;->x(Lzpa;)Lea0;

    move-result-object v11

    const/4 v13, 0x2

    invoke-virtual {v11, v13, v10, v14}, Ljf0;->r(IIZ)V

    invoke-virtual {v1, v9}, Lx5f;->U0(Lx56;)V

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v9

    new-instance v11, Lyj0;

    invoke-direct {v11, v7, v9}, Lyj0;-><init>(Lpsp;Lt56;)V

    invoke-virtual {v11}, Lyj0;->a()Lfa0;

    move-result-object v11

    iget-object v11, v11, Lfa0;->a:Lda0;

    invoke-virtual {v11, v13, v10, v14}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v9}, Lmgh;->c(Ljf0;)Z

    move-result v9

    if-nez v9, :cond_131

    new-instance v9, Lrml;

    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v9, v11, v5}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v11, Lmsf;

    invoke-direct {v11, v3, v10}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {v9, v11}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v9

    invoke-virtual {v9, v4}, Lplk;->m(Lqie;)Lp1j;

    :cond_131
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    invoke-virtual {v9, v2}, Lx56;->x(Lzpa;)Lea0;

    move-result-object v11

    const/16 v13, 0x9

    invoke-virtual {v11, v13, v10, v15}, Ljf0;->r(IIZ)V

    invoke-virtual {v1, v9}, Lx5f;->U0(Lx56;)V

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v9

    new-instance v11, Lyj0;

    invoke-direct {v11, v7, v9}, Lyj0;-><init>(Lpsp;Lt56;)V

    invoke-virtual {v11}, Lyj0;->a()Lfa0;

    move-result-object v11

    iget-object v11, v11, Lfa0;->a:Lda0;

    const/16 v13, 0x8

    invoke-virtual {v11, v13, v10, v15}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v9}, Lmgh;->c(Ljf0;)Z

    move-result v9

    if-nez v9, :cond_16e

    new-instance v9, Lrml;

    sget-object v11, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v9, v11, v5}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v11, Lmsf;

    invoke-direct {v11, v3, v10}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {v9, v11}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v9

    invoke-virtual {v9, v4}, Lplk;->m(Lqie;)Lp1j;

    :cond_16e
    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v9

    invoke-virtual {v9, v2}, Lx56;->x(Lzpa;)Lea0;

    move-result-object v2

    const/16 v11, 0xa

    invoke-virtual {v2, v11, v10, v8}, Ljf0;->r(IIZ)V

    invoke-virtual {v1, v9}, Lx5f;->U0(Lx56;)V

    invoke-static {}, Lpsp;->f()Lt56;

    move-result-object v1

    new-instance v2, Lyj0;

    invoke-direct {v2, v7, v1}, Lyj0;-><init>(Lpsp;Lt56;)V

    invoke-virtual {v2}, Lyj0;->a()Lfa0;

    move-result-object v2

    iget-object v2, v2, Lfa0;->a:Lda0;

    const/16 v7, 0x9

    invoke-virtual {v2, v7, v10, v8}, Ljf0;->r(IIZ)V

    invoke-virtual {v6, v1}, Lmgh;->c(Ljf0;)Z

    move-result v1

    if-nez v1, :cond_1ab

    new-instance v1, Lrml;

    sget-object v2, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v1, v2, v5}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v2, Lmsf;

    invoke-direct {v2, v3, v10}, Lmsf;-><init>(Losf;B)V

    invoke-virtual {v1, v2}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v1

    invoke-virtual {v1, v4}, Lplk;->m(Lqie;)Lp1j;

    :cond_1ab
    const-wide/16 v1, 0x1

    iget-object v0, v0, Lxtm;->c:Lqfb;

    invoke-virtual {v0, v1, v2, v12}, Lqfb;->n(JZ)V

    const-wide/16 v1, 0x10

    invoke-virtual {v0, v1, v2, v14}, Lqfb;->n(JZ)V

    const-wide/16 v1, 0x80

    invoke-virtual {v0, v1, v2, v15}, Lqfb;->n(JZ)V

    const-wide/16 v1, 0x100

    invoke-virtual {v0, v1, v2, v8}, Lqfb;->n(JZ)V

    if-eqz v16, :cond_1d1

    const-wide/16 v1, 0x2

    move/from16 v3, v18

    invoke-virtual {v0, v1, v2, v3}, Lqfb;->n(JZ)V

    const-wide/16 v1, 0x4

    move/from16 v3, v17

    invoke-virtual {v0, v1, v2, v3}, Lqfb;->n(JZ)V

    :cond_1d1
    return-void
.end method

.method public final o(Z)V
    .registers 2

    const/4 p1, 0x1

    iput-boolean p1, p0, Lxtm;->f:Z

    invoke-virtual {p0}, Lxtm;->a()V

    return-void
.end method
