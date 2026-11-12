.class public final synthetic Lm3g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 7
    iput-byte p1, p0, Lm3g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 8
    iput-byte p2, p0, Lm3g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lp3g;La4g;)V
    .registers 3

    const/4 p1, 0x0

    iput-byte p1, p0, Lm3g;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 21

    move-object/from16 v0, p0

    iget-byte v0, v0, Lm3g;->a:B

    const-string v1, "pending_cash_out"

    const-string v2, "pending_notification"

    const-string v3, "products"

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    packed-switch v0, :pswitch_data_282

    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1b
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_25
    sget-object v0, Lf4h;->a:Lf4h;

    move-object/from16 v0, p1

    check-cast v0, Lt41;

    invoke-virtual {v0, v6}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v7}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v5}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v11

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v12

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v13

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v14

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v15

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v16

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v17

    new-instance v8, Lz3h;

    invoke-direct/range {v8 .. v18}, Lz3h;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    return-object v8

    :pswitch_62
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6c
    move-object/from16 v0, p1

    check-cast v0, Lt41;

    invoke-virtual {v0, v6}, Lt41;->a(I)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    return-object v0

    :pswitch_78
    move-object/from16 v0, p1

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string v3, "android.intent.action.PROCESS_TEXT"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    const-string v3, "text/plain"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v1, v2, v6}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    move-object v3, v1

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v3

    :goto_a5
    if-ge v6, v3, :cond_d2

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Landroid/content/pm/ResolveInfo;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    iget-object v8, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v8, v8, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_cc

    iget-object v5, v5, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-boolean v7, v5, Landroid/content/pm/ActivityInfo;->exported:Z

    if-eqz v7, :cond_cf

    iget-object v5, v5, Landroid/content/pm/ActivityInfo;->permission:Ljava/lang/String;

    if-eqz v5, :cond_cc

    invoke-virtual {v0, v5}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result v5

    if-nez v5, :cond_cf

    :cond_cc
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_cf
    add-int/lit8 v6, v6, 0x1

    goto :goto_a5

    :cond_d2
    return-object v2

    :pswitch_d3
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Void;

    sget-object v0, Lf1h;->b:Lf1h;

    return-object v0

    :pswitch_da
    move-object/from16 v0, p1

    check-cast v0, Lpkj;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_ec

    if-eq v0, v7, :cond_ec

    if-eq v0, v5, :cond_ec

    invoke-static {}, Lh9o;->p()V

    goto :goto_ee

    :cond_ec
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_ee
    return-object v4

    :pswitch_ef
    move-object/from16 v0, p1

    check-cast v0, Lpkj;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_101

    if-eq v0, v7, :cond_101

    if-eq v0, v5, :cond_101

    invoke-static {}, Lh9o;->p()V

    goto :goto_103

    :cond_101
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_103
    return-object v4

    :pswitch_104
    move-object/from16 v0, p1

    check-cast v0, Lpkj;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_116

    if-eq v0, v7, :cond_116

    if-eq v0, v5, :cond_116

    invoke-static {}, Lh9o;->p()V

    goto :goto_118

    :cond_116
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_118
    return-object v4

    :pswitch_119
    move-object/from16 v0, p1

    check-cast v0, Lpkj;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_12b

    if-eq v0, v7, :cond_12b

    if-eq v0, v5, :cond_12b

    invoke-static {}, Lh9o;->p()V

    goto :goto_12d

    :cond_12b
    sget-object v4, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_12d
    return-object v4

    :pswitch_12e
    move-object/from16 v0, p1

    check-cast v0, Laog;

    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_13b

    invoke-virtual {v0}, Laog;->r()V

    :cond_13b
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_13e
    invoke-static/range {p1 .. p1}, Lsko;->g(Ljava/lang/Object;)Ljava/lang/ClassCastException;

    move-result-object v0

    throw v0

    :pswitch_143
    move-object/from16 v0, p1

    check-cast v0, Lm1i;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_14a
    new-instance v0, Lneg;

    invoke-direct {v0}, Lneg;-><init>()V

    return-object v0

    :pswitch_150
    new-instance v0, Lneg;

    invoke-direct {v0}, Lneg;-><init>()V

    return-object v0

    :pswitch_156
    move-object/from16 v0, p1

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v1, "enable_newsfeed"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_165
    move-object/from16 v0, p1

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    const-string v1, "live_scores_enabled"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_174
    move-object/from16 v0, p1

    check-cast v0, Laln;

    new-instance v1, Leef;

    invoke-direct {v1, v0}, Leef;-><init>(Laln;)V

    return-object v1

    :pswitch_17e
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    const-string v1, "<default>"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18c

    const-string v0, "NETWORK_529"

    :cond_18c
    return-object v0

    :pswitch_18d
    move-object/from16 v0, p1

    check-cast v0, Lq0j;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_194
    move-object/from16 v0, p1

    check-cast v0, Laqb;

    iput-boolean v7, v0, Laqb;->c:Z

    iput-boolean v6, v0, Laqb;->n:Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_19f
    move-object/from16 v0, p1

    check-cast v0, Lt41;

    invoke-virtual {v0, v6}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :pswitch_1a8
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1b2
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1bc
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1c6
    sget-object v0, Ls8g;->a:Ls8g;

    move-object/from16 v1, p1

    check-cast v1, Lt41;

    invoke-virtual {v1, v6}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v7}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v5}, Lt41;->b(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v3, v1}, Ls8g;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_1dd
    move-object/from16 v0, p1

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1e7
    move-object/from16 v1, p1

    check-cast v1, Ln6j;

    sget-object v0, Lg6g;->a:[Lg6g;

    const/4 v6, 0x0

    const/16 v7, 0x38

    const/4 v2, 0x3

    const v3, 0x7f141096

    const v4, 0x7f0a0992

    const/4 v5, 0x0

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x1

    const v3, 0x7f140f90

    const v4, 0x7f0a0986

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x2

    const v3, 0x7f1406dc

    const v4, 0x7f0a098f

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x4

    const v3, 0x7f14105a

    const v4, 0x7f0a0985

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x5

    const v3, 0x7f141060

    const v4, 0x7f0a098d

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/4 v2, 0x6

    const v3, 0x7f140f8f

    const v4, 0x7f0a0993

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v7, 0x30

    const/4 v2, 0x7

    const v3, 0x7f140f82

    const v4, 0x7f0a0988

    const v5, 0x7f080540

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v2, 0x8

    const v3, 0x7f140f89

    const v4, 0x7f0a098b

    const v5, 0x7f08061f

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    const/16 v2, 0x9

    const v3, 0x7f140f8c

    const v4, 0x7f0a098c

    const v5, 0x7f080543

    invoke-static/range {v1 .. v7}, Ln6j;->c(Ln6j;IIIILjava/util/List;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_25b
    move-object/from16 v0, p1

    check-cast v0, Lw3g;

    new-instance v1, Ln3g;

    iget v2, v0, Lw3g;->a:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    iget-object v3, v0, Lw3g;->c:Ljava/lang/String;

    iget-object v4, v0, Lw3g;->g:Ljava/lang/String;

    iget-object v5, v0, Lw3g;->f:Ljava/lang/String;

    iget-boolean v6, v0, Lw3g;->h:Z

    if-nez v6, :cond_27b

    iget-boolean v6, v0, Lw3g;->i:Z

    if-nez v6, :cond_27b

    iget-object v0, v0, Lw3g;->b:Lorg/chromium/url/GURL;

    iget-object v0, v0, Lorg/chromium/url/GURL;->a:Ljava/lang/String;

    move-object v7, v0

    goto :goto_27c

    :cond_27b
    move-object v7, v4

    :goto_27c
    const/4 v6, 0x0

    invoke-direct/range {v1 .. v7}, Ln3g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    nop

    :pswitch_data_282
    .packed-switch 0x0
        :pswitch_25b
        :pswitch_1e7
        :pswitch_1dd
        :pswitch_1c6
        :pswitch_1bc
        :pswitch_1b2
        :pswitch_1a8
        :pswitch_19f
        :pswitch_194
        :pswitch_18d
        :pswitch_17e
        :pswitch_174
        :pswitch_165
        :pswitch_156
        :pswitch_150
        :pswitch_14a
        :pswitch_143
        :pswitch_13e
        :pswitch_12e
        :pswitch_119
        :pswitch_104
        :pswitch_ef
        :pswitch_da
        :pswitch_d3
        :pswitch_78
        :pswitch_6c
        :pswitch_62
        :pswitch_25
        :pswitch_1b
    .end packed-switch
.end method
