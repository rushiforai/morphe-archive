.class public final synthetic Lzzh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lzzh;->a:B

    iput-object p1, p0, Lzzh;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Lzzh;->a:B

    const/4 v2, -0x1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    iget-object v0, v0, Lzzh;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_5d0

    check-cast v0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;

    move-object/from16 v1, p1

    check-cast v1, Laf9;

    sget v2, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->T:I

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v2

    if-nez v2, :cond_2c

    sget-object v2, Laf9;->a:Laf9;

    if-ne v1, v2, :cond_2c

    invoke-virtual {v0}, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->F0()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_2c

    invoke-virtual {v0, v1, v8, v8}, Lcom/opera/android/FullscreenWebActivity;->s0(Landroid/net/Uri;II)V

    :cond_2c
    return-void

    :pswitch_2d
    check-cast v0, Lsa4;

    move-object/from16 v1, p1

    check-cast v1, Lixl;

    iput-object v6, v0, Lsa4;->m:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eq v1, v7, :cond_7b

    if-eq v1, v5, :cond_72

    iget-object v1, v0, Lsa4;->h:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_45
    :goto_45
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_7e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lmyf;

    new-instance v3, Ljxl;

    invoke-direct {v3, v0, v8}, Ljxl;-><init>(Lsa4;B)V

    iput-object v3, v2, Lmyf;->a:Ljxl;

    new-instance v3, Lj99;

    invoke-direct {v3, v2, v4}, Lj99;-><init>(Ljava/lang/Object;B)V

    iput-object v3, v2, Lmyf;->e:Lj99;

    iget-object v5, v2, Lmyf;->b:Lbf9;

    invoke-virtual {v5, v3}, Lbf9;->b(Lhxl;)V

    invoke-virtual {v5}, Lbf9;->u()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_45

    invoke-virtual {v2, v3}, Lmyf;->c(Ljava/util/List;)V

    goto :goto_45

    :cond_72
    iget v1, v0, Lsa4;->d:I

    or-int/2addr v1, v5

    iput v1, v0, Lsa4;->d:I

    invoke-virtual {v0}, Lsa4;->f()V

    goto :goto_7e

    :cond_7b
    invoke-virtual {v0}, Lsa4;->f()V

    :cond_7e
    :goto_7e
    return-void

    :pswitch_7f
    check-cast v0, Lzzh;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_8e

    sget-object v1, Lixl;->a:Lixl;

    goto :goto_90

    :cond_8e
    sget-object v1, Lixl;->b:Lixl;

    :goto_90
    invoke-virtual {v0, v1}, Lzzh;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_94
    check-cast v0, Lzzh;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    if-nez v1, :cond_9d

    move v7, v8

    :cond_9d
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lzzh;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_a5
    check-cast v0, Llel;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "<b>Detector info</b><br>Is rooted: <b>"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "</b><br>Is emulator: <b>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "</b><br>Is monkey: <b>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "</b><br>Using frida: <b>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "</b><br>"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Llel;->e:Lcr2;

    iget-object v0, v0, Lcr2;->j:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_f4
    check-cast v0, Ljyk;

    move-object/from16 v1, p1

    check-cast v1, Lq43;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lzz2;->c(Ljava/lang/Boolean;)V

    return-void

    :pswitch_100
    check-cast v0, Lr72;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lr72;->c:Ljava/lang/Object;

    check-cast v1, Lih4;

    if-eqz v1, :cond_124

    iput-object v6, v0, Lr72;->c:Ljava/lang/Object;

    iget-byte v1, v0, Lr72;->a:B

    int-to-long v1, v1

    const/4 v4, 0x5

    iput-byte v4, v0, Lr72;->a:B

    iget-object v4, v0, Lr72;->b:Ljava/lang/Object;

    check-cast v4, Lq65;

    iget-object v0, v0, Lr72;->d:Ljava/lang/Object;

    check-cast v0, Lmyk;

    iget-object v0, v0, Lmyk;->d:Lumi;

    invoke-virtual {v4, v0, v1, v2, v3}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    :cond_124
    return-void

    :pswitch_125
    check-cast v0, Ljyk;

    move-object/from16 v1, p1

    check-cast v1, Lq43;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lzz2;->c(Ljava/lang/Boolean;)V

    return-void

    :pswitch_131
    check-cast v0, Lzz2;

    move-object/from16 v1, p1

    check-cast v1, Lcom/opera/android/oauth2/OperaAccessToken;

    iget-boolean v2, v0, Lzz2;->a:Z

    if-nez v2, :cond_141

    invoke-virtual {v0, v1}, Lzz2;->d(Lcom/opera/android/oauth2/OperaAccessToken;)Lih4;

    move-result-object v1

    iput-object v1, v0, Lzz2;->c:Ljava/lang/Object;

    :cond_141
    return-void

    :pswitch_142
    check-cast v0, Lji2;

    move-object/from16 v1, p1

    check-cast v1, Lq43;

    iget-object v1, v1, Lq43;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lji2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_14e
    check-cast v0, Lzxk;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    iput-object v6, v0, Lzxk;->j:Landroid/os/CancellationSignal;

    return-void

    :pswitch_157
    check-cast v0, Lkxk;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_167

    const v2, 0x7f140eae

    goto :goto_16a

    :cond_167
    const v2, 0x7f140803

    :goto_16a
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_173

    const/16 v1, 0x9c4

    goto :goto_175

    :cond_173
    const/16 v1, 0x1388

    :goto_175
    invoke-virtual {v0, v2, v1}, Lkxk;->b(II)V

    return-void

    :pswitch_179
    check-cast v0, Lvpk;

    move-object/from16 v1, p1

    check-cast v1, Look;

    iget v1, v0, Lvpk;->e:I

    if-ne v1, v2, :cond_185

    iput v5, v0, Lvpk;->e:I

    :cond_185
    return-void

    :pswitch_186
    check-cast v0, Ljs6;

    move-object/from16 v1, p1

    check-cast v1, Ltq8;

    iget-object v0, v0, Ljs6;->e:Ljava/lang/Object;

    check-cast v0, Lqlk;

    invoke-virtual {v0}, Lqlk;->run()V

    return-void

    :pswitch_194
    check-cast v0, Lnr8;

    move-object/from16 v1, p1

    check-cast v1, Lcom/opera/api/Callback;

    new-instance v2, La0k;

    invoke-direct {v2, v1, v0}, La0k;-><init>(Lcom/opera/api/Callback;Lnr8;)V

    invoke-virtual {v0, v2}, Lnr8;->f(Ljava/lang/Runnable;)V

    return-void

    :pswitch_1a3
    check-cast v0, Lcpk;

    move-object/from16 v1, p1

    check-cast v1, Ltq8;

    iget-boolean v2, v0, Lcpk;->f:Z

    if-nez v2, :cond_1d0

    iput-object v1, v0, Lcpk;->e:Ltq8;

    invoke-virtual {v1, v0}, Ltq8;->t(Lsq8;)V

    iget-object v1, v0, Lcpk;->e:Ltq8;

    iget-object v1, v1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :cond_1ba
    :goto_1ba
    if-ge v8, v2, :cond_1d0

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v8, v8, 0x1

    check-cast v3, Lhq8;

    invoke-virtual {v3}, Lhq8;->j()Z

    move-result v4

    if-eqz v4, :cond_1ba

    check-cast v3, Ltq8;

    invoke-virtual {v3, v0}, Ltq8;->t(Lsq8;)V

    goto :goto_1ba

    :cond_1d0
    return-void

    :pswitch_1d1
    check-cast v0, Lbok;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0}, Lab2;->a0()Lja2;

    move-result-object v0

    check-cast v0, Laok;

    iget-object v0, v0, Laok;->c:Lvpk;

    iget v2, v0, Lvpk;->f:I

    if-eq v1, v2, :cond_1f1

    if-eqz v2, :cond_1ea

    move v7, v8

    :cond_1ea
    iput v1, v0, Lvpk;->f:I

    if-eqz v7, :cond_1f1

    invoke-virtual {v0}, Lvpk;->a()V

    :cond_1f1
    return-void

    :pswitch_1f2
    check-cast v0, Lwmk;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_22e

    iget-object v0, v0, Lwmk;->c:Lvmk;

    iget-wide v1, v0, Lvmk;->g:J

    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-nez v4, :cond_218

    const-wide/16 v1, 0x5

    invoke-static {v1, v2}, Lavj;->e(J)J

    move-result-wide v1

    const-wide/16 v4, 0x1

    add-long/2addr v1, v4

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    iput-wide v1, v0, Lvmk;->g:J

    goto :goto_222

    :cond_218
    const-wide/32 v3, 0x5265c00

    shl-long/2addr v1, v7

    invoke-static {v3, v4, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    iput-wide v1, v0, Lvmk;->g:J

    :goto_222
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, v0, Lvmk;->g:J

    add-long/2addr v1, v3

    iput-wide v1, v0, Lvmk;->h:J

    invoke-virtual {v0}, Lvmk;->a()V

    :cond_22e
    return-void

    :pswitch_22f
    check-cast v0, Lmcj;

    move-object/from16 v1, p1

    check-cast v1, Landroid/content/SharedPreferences;

    iget-object v0, v0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Lnrl;

    invoke-virtual {v0}, Lnrl;->K()V

    return-void

    :pswitch_23d
    move-object v1, v0

    check-cast v1, Lfmk;

    move-object/from16 v0, p1

    check-cast v0, Lv3h;

    iget-object v3, v1, Lfmk;->c:Lode;

    iput-object v6, v1, Lfmk;->f:Lzzh;

    iget-object v4, v0, Lk8;->a:Ljava/lang/Object;

    iget-object v0, v0, Lk8;->b:Ljava/lang/Object;

    check-cast v0, Ly3h;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    sget-object v5, Lemk;->c:Lemk;

    if-eqz v0, :cond_26c

    if-ne v0, v7, :cond_3eb

    check-cast v4, Lw3h;

    new-instance v0, Lylk;

    new-instance v2, Lzlk;

    invoke-direct {v2}, Lzlk;-><init>()V

    invoke-direct {v0, v2, v5}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v1}, Lfmk;->a()V

    goto/16 :goto_3eb

    :cond_26c
    check-cast v4, Lx3h;

    iget-object v0, v4, Lx3h;->b:Lcsh;

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2a1

    const-string v4, "initialCapacity"

    const/4 v9, 0x4

    invoke-static {v9, v4}, Lscd;->q(ILjava/lang/String;)V

    new-array v4, v9, [Ljava/lang/Object;

    invoke-virtual {v0, v8}, Lh1b;->u(I)La1b;

    move-result-object v9

    const/4 v0, 0x0

    move v10, v7

    move v11, v8

    move-object v7, v4

    move v4, v0

    :goto_287
    invoke-virtual {v9}, Lq4;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3c1

    invoke-virtual {v9}, Lq4;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v12, v0

    check-cast v12, Lnsh;

    iget-object v0, v1, Lfmk;->b:Ljava/util/Map;

    iget-object v13, v12, Lnsh;->a:Ljava/lang/String;

    invoke-interface {v0, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Lzsk;

    if-nez v13, :cond_2a5

    :cond_2a1
    move-object/from16 p0, v1

    goto/16 :goto_3cc

    :cond_2a5
    iget-object v14, v13, Lzsk;->b:Ljava/lang/String;

    iget-object v15, v1, Lfmk;->e:Ljvg;

    iget-object v8, v12, Lnsh;->a:Ljava/lang/String;

    iget-object v0, v15, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, Lni6;

    iget-object v2, v0, Lni6;->a:Lb59;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0, v8, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_328

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v16

    if-eqz v16, :cond_328

    :try_start_2c3
    new-instance v6, Lorb;

    invoke-direct {v6, v0}, Lorb;-><init>(Ljava/lang/String;)V
    :try_end_2c8
    .catch Lorg/json/JSONException; {:try_start_2c3 .. :try_end_2c8} :catch_2fd

    :try_start_2c8
    const-string v0, "expiration_time"

    invoke-virtual {v6, v0}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lyjb;->a(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0
    :try_end_2d2
    .catch Ljava/text/ParseException; {:try_start_2c8 .. :try_end_2d2} :catch_2ec
    .catch Lorg/json/JSONException; {:try_start_2c8 .. :try_end_2d2} :catch_2fd

    move-object/from16 p0, v1

    :try_start_2d4
    new-instance v1, Lulk;
    :try_end_2d6
    .catch Lorg/json/JSONException; {:try_start_2d4 .. :try_end_2d6} :catch_2ff

    move-object/from16 p1, v2

    :try_start_2d8
    const-string v2, "offer_id"

    invoke-virtual {v6, v2}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_2de
    .catch Lorg/json/JSONException; {:try_start_2d8 .. :try_end_2de} :catch_301

    move-object/from16 v17, v9

    :try_start_2e0
    const-string v9, "is_personalized"

    iget-object v6, v6, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v6, v9}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    invoke-direct {v1, v2, v0, v6}, Lulk;-><init>(Ljava/lang/String;Ljava/util/Date;Z)V

    goto :goto_304

    :catch_2ec
    move-exception v0

    move-object/from16 p0, v1

    move-object/from16 p1, v2

    move-object/from16 v17, v9

    new-instance v1, Lorg/json/JSONException;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_2fd
    .catch Lorg/json/JSONException; {:try_start_2e0 .. :try_end_2fd} :catch_303

    :catch_2fd
    move-object/from16 p0, v1

    :catch_2ff
    move-object/from16 p1, v2

    :catch_301
    move-object/from16 v17, v9

    :catch_303
    const/4 v1, 0x0

    :goto_304
    if-eqz v1, :cond_32d

    iget-object v0, v15, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Lr4k;

    invoke-virtual {v0, v1}, Lr4k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_32d

    invoke-virtual/range {p1 .. p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0, v8}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_326
    const/4 v1, 0x0

    goto :goto_32d

    :cond_328
    move-object/from16 p0, v1

    move-object/from16 v17, v9

    goto :goto_326

    :cond_32d
    :goto_32d
    if-eqz v1, :cond_341

    iget-object v0, v1, Lulk;->a:Ljava/lang/String;

    invoke-static {v12, v14, v0}, Lauj;->h(Lnsh;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_342

    iget-boolean v1, v1, Lulk;->c:Z

    invoke-static {v12, v0, v1}, Ly7h;->e(Lnsh;IZ)Lxlk;

    move-result-object v0

    if-eqz v0, :cond_342

    goto :goto_381

    :cond_341
    const/4 v2, -0x1

    :cond_342
    const-string v0, "freetrial"

    invoke-static {v12, v14, v0}, Lauj;->h(Lnsh;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-ne v0, v2, :cond_376

    iget-object v0, v12, Lnsh;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v6, 0x0

    :goto_352
    if-ge v6, v1, :cond_373

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v6, v6, 0x1

    check-cast v8, Ltlk;

    iget-object v9, v8, Ltlk;->a:Ljava/lang/String;

    invoke-static {v9, v14}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_370

    iget-object v8, v8, Ltlk;->b:Ljava/lang/String;

    if-eqz v8, :cond_36e

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v8

    if-nez v8, :cond_370

    :cond_36e
    const/4 v1, -0x1

    goto :goto_378

    :cond_370
    add-int/lit8 v2, v2, 0x1

    goto :goto_352

    :cond_373
    const/4 v1, -0x1

    const/4 v2, -0x1

    goto :goto_378

    :cond_376
    move v1, v2

    move v2, v0

    :goto_378
    if-ne v2, v1, :cond_37c

    const/4 v0, 0x0

    goto :goto_381

    :cond_37c
    const/4 v6, 0x0

    invoke-static {v12, v2, v6}, Ly7h;->e(Lnsh;IZ)Lxlk;

    move-result-object v0

    :goto_381
    if-nez v0, :cond_38a

    :goto_383
    move-object/from16 v9, v17

    const/4 v6, 0x0

    move-object/from16 v1, p0

    goto/16 :goto_287

    :cond_38a
    new-instance v2, Lamk;

    invoke-direct {v2, v13, v12, v0}, Lamk;-><init>(Lzsk;Lnsh;Lxlk;)V

    array-length v6, v7

    add-int/lit8 v8, v11, 0x1

    invoke-static {v6, v8}, Lw0b;->b(II)I

    move-result v6

    array-length v9, v7

    if-le v6, v9, :cond_39e

    invoke-static {v7, v6}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    :cond_39e
    aput-object v2, v7, v11

    iget v2, v2, Lamk;->d:F

    cmpg-float v6, v4, v2

    if-gez v6, :cond_3a7

    move v4, v2

    :cond_3a7
    iget-object v0, v0, Lxlk;->a:Lwlk;

    if-eqz v0, :cond_3be

    iget-object v0, v0, Lwlk;->c:Lo9g;

    iget v2, v0, Lo9g;->a:I

    if-nez v2, :cond_3be

    iget v2, v0, Lo9g;->b:I

    if-nez v2, :cond_3be

    iget v2, v0, Lo9g;->c:I

    const/4 v6, 0x7

    mul-int/2addr v2, v6

    iget v0, v0, Lo9g;->d:I

    add-int/2addr v2, v0

    if-eq v2, v6, :cond_3bf

    :cond_3be
    const/4 v10, 0x0

    :cond_3bf
    move v11, v8

    goto :goto_383

    :cond_3c1
    move-object/from16 p0, v1

    new-instance v6, Lbmk;

    invoke-static {v11, v7}, Lh1b;->o(I[Ljava/lang/Object;)Lcsh;

    move-result-object v0

    invoke-direct {v6, v0, v4, v10}, Lbmk;-><init>(Lcsh;FZ)V

    :goto_3cc
    if-nez v6, :cond_3dc

    new-instance v0, Lylk;

    new-instance v1, Lzlk;

    invoke-direct {v1}, Lzlk;-><init>()V

    invoke-direct {v0, v1, v5}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v0}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_3eb

    :cond_3dc
    new-instance v0, Lylk;

    iget-object v1, v6, Ln1;->b:Ljava/lang/Object;

    check-cast v1, Lemk;

    invoke-direct {v0, v6, v1}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v3, v0}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual/range {p0 .. p0}, Lfmk;->a()V

    :cond_3eb
    :goto_3eb
    return-void

    :pswitch_3ec
    check-cast v0, Lslk;

    move-object/from16 v1, p1

    check-cast v1, Lprh;

    if-eqz v1, :cond_404

    instance-of v2, v1, Lnrh;

    if-nez v2, :cond_404

    instance-of v1, v1, Lorh;

    if-eqz v1, :cond_401

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lslk;->b(Ljava/lang/Runnable;)V

    goto :goto_404

    :cond_401
    invoke-static {}, Lh9o;->p()V

    :cond_404
    :goto_404
    return-void

    :pswitch_405
    check-cast v0, Ld0k;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Ld0k;->m:I

    iget-object v1, v0, Ld0k;->f:Lh42;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llpk;

    invoke-virtual {v0, v1}, Ld0k;->a0(Llpk;)V

    return-void

    :pswitch_41d
    check-cast v0, Lvcj;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget v2, v0, Lvcj;->i:I

    check-cast v1, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_430
    :goto_430
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_445

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Lwcj;

    instance-of v6, v6, Lan8;

    if-nez v6, :cond_430

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_430

    :cond_445
    new-instance v4, Ljava/util/ArrayList;

    const/16 v5, 0xa

    invoke-static {v3, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x0

    :goto_455
    if-ge v7, v6, :cond_468

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lwcj;

    new-instance v9, Ltcj;

    invoke-direct {v9, v8}, Ltcj;-><init>(Lwcj;)V

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_455

    :cond_468
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_471
    :goto_471
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_486

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Lwcj;

    instance-of v7, v7, Lan8;

    if-eqz v7, :cond_471

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_471

    :cond_486
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v3, v5}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v5

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v8, 0x0

    :goto_494
    if-ge v8, v5, :cond_4a7

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v8, v8, 0x1

    check-cast v6, Lwcj;

    new-instance v7, Ltcj;

    invoke-direct {v7, v6}, Ltcj;-><init>(Lwcj;)V

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_494

    :cond_4a7
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v5, v0, Lvcj;->e:Lqn;

    if-eqz v5, :cond_4c4

    add-int/lit8 v5, v2, -0x1

    invoke-static {v4, v5}, Lkotlin/collections/CollectionsKt;->e0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v4, Lrcj;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4cd

    :cond_4c4
    invoke-static {v4, v2}, Lkotlin/collections/CollectionsKt;->e0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v4

    check-cast v4, Ljava/util/Collection;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :goto_4cd
    iget-object v4, v0, Lvcj;->g:Ldt1;

    invoke-virtual {v4, v3}, Ldt1;->K(Ljava/util/Collection;)V

    iget-object v0, v0, Lvcj;->h:Ldt1;

    invoke-static {v1, v2}, Lkotlin/collections/CollectionsKt;->e0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v0, v1}, Ldt1;->K(Ljava/util/Collection;)V

    return-void

    :pswitch_4de
    move-object v1, v6

    check-cast v0, Ly1h;

    move-object/from16 v2, p1

    check-cast v2, Landroid/graphics/Bitmap;

    new-instance v3, Lxta;

    if-eqz v2, :cond_4ef

    new-instance v6, Lj71;

    invoke-direct {v6, v2}, Lj71;-><init>(Landroid/graphics/Bitmap;)V

    goto :goto_4f0

    :cond_4ef
    move-object v6, v1

    :goto_4f0
    invoke-direct {v3, v6}, Lxta;-><init>(Lj71;)V

    invoke-virtual {v0, v3}, Ly1h;->setValue(Ljava/lang/Object;)V

    return-void

    :pswitch_4f7
    check-cast v0, Lzg;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    iget-object v2, v0, Lzg;->b:Ljava/lang/Object;

    check-cast v2, Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v0, v0, Lzg;->a:I

    invoke-static {v3, v1, v0}, Leti;->b(Landroid/content/Context;Landroid/graphics/Bitmap;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_50f
    check-cast v0, Lgii;

    move-object/from16 v5, p1

    check-cast v5, Lre7;

    iget-object v2, v0, Lgii;->f:Lcom/opera/android/BrowserActivity;

    if-eqz v2, :cond_524

    iget-object v1, v0, Lgii;->a:Landroid/content/Context;

    iget-object v3, v0, Lgii;->g:Lr9g;

    iget-object v4, v0, Lgii;->c:Lrf7;

    iget-object v6, v0, Lgii;->k:Lx5f;

    invoke-static/range {v1 .. v6}, Ligi;->u0(Landroid/content/Context;Lcom/opera/android/BrowserActivity;Lvwh;Lrf7;Lre7;Lorm;)V

    :cond_524
    return-void

    :pswitch_525
    check-cast v0, Liii;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v2, v0, Liii;->z:Lh7b;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Liii;->B:Lqie;

    if-eqz v1, :cond_553

    iget-object v0, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Lwjh;

    iget-object v0, v0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmta;

    if-eqz v0, :cond_55a

    iget-object v0, v0, Lmta;->a:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lota;

    if-eqz v0, :cond_55a

    invoke-virtual {v0}, Lota;->b()V

    goto :goto_55a

    :cond_553
    iget-object v0, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Lwjh;

    invoke-virtual {v0, v2}, Lwjh;->s(Lfji;)V

    :cond_55a
    :goto_55a
    return-void

    :pswitch_55b
    check-cast v0, Lv48;

    move-object/from16 v1, p1

    check-cast v1, La4g;

    iget-object v2, v1, La4g;->a:Ljava/util/List;

    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1}, La4g;->a()V

    iget-object v0, v0, Lv48;->b:Luim;

    check-cast v0, Lf0i;

    iget-boolean v1, v0, Lo1e;->e:Z

    if-nez v1, :cond_5a3

    iget-object v1, v0, Lf0i;->g:Ly83;

    iget-object v1, v1, Ly83;->h:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const v4, 0x7f140eb2

    invoke-virtual {v0, v4}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-lez v2, :cond_59c

    const-string v2, "\n\n"

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const v2, 0x7f140eb3

    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_59c
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a(Ljava/lang/String;)V

    :cond_5a3
    return-void

    :pswitch_5a4
    check-cast v0, Landroidx/fragment/app/w;

    move-object/from16 v1, p1

    check-cast v1, Ltvh;

    const/4 v6, 0x0

    invoke-static {v0, v6, v1}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    return-void

    :pswitch_5af
    move v6, v8

    check-cast v0, La0i;

    move-object/from16 v1, p1

    check-cast v1, Landroid/view/View;

    iput-boolean v7, v0, La0i;->d:Z

    sget-object v1, Lhjm;->a:Lhjm;

    iput-object v1, v0, Ld63;->mDismissReason:Lhjm;

    iget-object v0, v0, La0i;->a:Lbz0;

    invoke-virtual {v0}, Lzp1;->dismiss()V

    const-string v0, "https://support-vpn-pro.opera.com/"

    sget-object v1, Llqm;->v:Llqm;

    invoke-static {v0, v1, v6}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput v4, v0, Lvx3;->b:I

    invoke-static {v0, v7, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    return-void

    nop

    :pswitch_data_5d0
    .packed-switch 0x0
        :pswitch_5af
        :pswitch_5a4
        :pswitch_55b
        :pswitch_525
        :pswitch_50f
        :pswitch_4f7
        :pswitch_4de
        :pswitch_41d
        :pswitch_405
        :pswitch_3ec
        :pswitch_23d
        :pswitch_22f
        :pswitch_1f2
        :pswitch_1d1
        :pswitch_1a3
        :pswitch_194
        :pswitch_186
        :pswitch_179
        :pswitch_157
        :pswitch_14e
        :pswitch_142
        :pswitch_131
        :pswitch_125
        :pswitch_100
        :pswitch_f4
        :pswitch_a5
        :pswitch_94
        :pswitch_7f
        :pswitch_2d
    .end packed-switch
.end method
