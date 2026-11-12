.class public final synthetic Lhu5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/opera/api/Callback;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Leq6;Leof;Lhmk;)V
    .registers 4

    const/16 p1, 0x13

    iput-byte p1, p0, Lhu5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lhu5;->b:Ljava/lang/Object;

    iput-object p3, p0, Lhu5;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 12
    iput-byte p3, p0, Lhu5;->a:B

    iput-object p1, p0, Lhu5;->b:Ljava/lang/Object;

    iput-object p2, p0, Lhu5;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Lhu5;->a:B

    const/4 v2, -0x1

    const/4 v3, 0x5

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v8, v0, Lhu5;->c:Ljava/lang/Object;

    iget-object v0, v0, Lhu5;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_670

    check-cast v0, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;

    check-cast v8, Lk2g;

    move-object/from16 v1, p1

    check-cast v1, Lr3g;

    sget v3, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->i:I

    if-eqz v1, :cond_3a

    invoke-virtual {v0}, Lcom/opera/android/autofill/OperaAutofillIntentDispatcherActivity;->v()Lyif;

    move-result-object v3

    if-eqz v3, :cond_25

    iget-object v7, v3, Lyif;->c:Landroid/widget/inline/InlinePresentationSpec;

    :cond_25
    invoke-virtual {v8, v0, v1, v7, v6}, Lk2g;->c(Landroid/content/Context;Lr3g;Landroid/widget/inline/InlinePresentationSpec;Z)Landroid/service/autofill/Dataset;

    move-result-object v1

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3}, Landroid/content/Intent;-><init>()V

    const-string v4, "android.view.autofill.extra.AUTHENTICATION_RESULT"

    invoke-virtual {v3, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    invoke-virtual {v0, v2, v3}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_3d

    :cond_3a
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :goto_3d
    return-void

    :pswitch_3e
    check-cast v0, Lmdf;

    check-cast v8, Lp65;

    move-object/from16 v1, p1

    check-cast v1, Lw9k;

    sget-object v2, Lkl0;->g:Lkl0;

    sget-object v3, Lgl0;->c:Lgl0;

    invoke-virtual {v0, v2, v3}, Lmdf;->a(Lkl0;Lgl0;)V

    iget-object v0, v8, Lp65;->a:Ljh;

    iget-object v2, v0, Ljh;->c:Ljava/lang/Object;

    check-cast v2, Lwv1;

    iget-object v2, v2, Lwv1;->b:Lb6h;

    invoke-interface {v2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorm;

    iget-boolean v3, v0, Ljh;->a:Z

    check-cast v2, Lx5f;

    sget-object v4, Lvb0;->b:Lvb0;

    invoke-virtual {v2, v4, v3}, Lx5f;->E(Lvb0;Z)V

    iput-boolean v5, v0, Ljh;->b:Z

    iget-object v0, v1, Lw9k;->a:Ly9k;

    iget-object v1, v1, Lw9k;->b:Lz65;

    invoke-virtual {v0, v1, v5}, Ly9k;->l0(Lz65;Z)V

    return-void

    :pswitch_6e
    check-cast v0, Lpdf;

    check-cast v8, Lyl6;

    move-object/from16 v1, p1

    check-cast v1, Lw9k;

    iput-object v1, v0, Lpdf;->n:Lw9k;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Loi;

    invoke-virtual {v8, v0, v7}, Lyl6;->e(Loi;Ljava/lang/Runnable;)V

    return-void

    :pswitch_82
    check-cast v0, Lmdf;

    check-cast v8, Lw9k;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_9e

    sget-object v1, Lkl0;->f:Lkl0;

    sget-object v2, Lgl0;->b:Lgl0;

    invoke-virtual {v0, v1, v2}, Lmdf;->a(Lkl0;Lgl0;)V

    iget-object v0, v8, Lw9k;->a:Ly9k;

    iget-object v1, v8, Lw9k;->b:Lz65;

    invoke-virtual {v0, v1, v5}, Ly9k;->l0(Lz65;Z)V

    :cond_9e
    return-void

    :pswitch_9f
    check-cast v0, Lcom/opera/api/Callback;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Lf8a;->h:Lf8a;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Offers-"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "{userId}"

    invoke-static {v8, v2, v1}, Lkotlin/text/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_c5
    check-cast v0, Lfge;

    check-cast v8, Landroid/text/Editable;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_da

    iget-object v0, v0, Lfge;->F:Lcom/opera/android/custom_views/StylingEditText;

    if-eqz v0, :cond_da

    invoke-interface {v8}, Landroid/text/Editable;->clear()V

    :cond_da
    return-void

    :pswitch_db
    check-cast v0, Lo1e;

    check-cast v8, Lpjg;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_f4

    iget-boolean v1, v0, Lo1e;->e:Z

    if-nez v1, :cond_f7

    invoke-virtual {v0}, Lo1e;->n0()V

    invoke-virtual {v8}, Lpjg;->run()V

    goto :goto_f7

    :cond_f4
    invoke-virtual {v0}, Lo1e;->j0()V

    :cond_f7
    :goto_f7
    return-void

    :pswitch_f8
    check-cast v0, Lwub;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Lwub;->a:Ljava/lang/Object;

    check-cast v0, Ldvc;

    iget-object v0, v0, Ldvc;->t:Lgvc;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v2, v0, Lgvc;->b:Ljava/util/List;

    new-instance v1, Lc83;

    invoke-direct {v1, v0}, Lc83;-><init>(Lgvc;)V

    invoke-virtual {v1, v8}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_119
    check-cast v0, Lkotlin/jvm/functions/Function0;

    check-cast v8, Landroid/widget/ImageView;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/Bitmap;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_130

    invoke-virtual {v8, v1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :cond_130
    return-void

    :pswitch_131
    check-cast v0, Lru9;

    check-cast v8, Lcom/opera/api/Callback;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    move v2, v5

    move v3, v2

    :cond_13f
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_184

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljv5;

    iget-object v7, v4, Ljv5;->b:Ljava/lang/String;

    iget-object v9, v4, Ljv5;->a:Ljava/lang/String;

    iget-boolean v10, v4, Ljv5;->e:Z

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_13f

    iget-object v7, v4, Ljv5;->d:Ljava/lang/String;

    const-string v11, "/"

    invoke-static {v7, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_13f

    iget-object v4, v4, Ljv5;->c:Ljava/lang/String;

    const-string v7, ".google.com"

    invoke-static {v4, v7}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13f

    if-nez v10, :cond_179

    const-string v4, "SID"

    invoke-static {v9, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13f

    move v3, v6

    if-eqz v2, :cond_13f

    goto :goto_184

    :cond_179
    const-string v4, "HSID"

    invoke-static {v9, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13f

    move v2, v6

    if-eqz v3, :cond_13f

    :cond_184
    :goto_184
    if-eqz v3, :cond_189

    if-eqz v2, :cond_189

    move v5, v6

    :cond_189
    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "browser.google_sign_in"

    invoke-interface {v1, v2, v5}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-interface {v8, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_1a1
    check-cast v0, Leof;

    check-cast v8, Lhmk;

    move-object/from16 v1, p1

    check-cast v1, Lyah;

    iget-object v2, v1, Lk8;->a:Ljava/lang/Object;

    iget-object v1, v1, Lk8;->b:Ljava/lang/Object;

    check-cast v1, Lcbh;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_1bf

    if-ne v1, v6, :cond_1ff

    check-cast v2, Lzah;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Leof;->run(Ljava/lang/Object;)V

    goto :goto_1ff

    :cond_1bf
    check-cast v2, Lbbh;

    iget-object v1, v2, Lbbh;->a:Lcsh;

    invoke-virtual {v1, v5}, Lh1b;->u(I)La1b;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_1ca
    invoke-virtual {v1}, Lq4;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f2

    invoke-virtual {v1}, Lq4;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Luah;

    if-eqz v3, :cond_1ca

    iget-object v4, v3, Luah;->a:Ljava/lang/String;

    iget-object v5, v8, Lhmk;->b:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1ca

    iget-object v3, v3, Luah;->e:Lh1b;

    iget-object v4, v8, Lhmk;->a:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lh1b;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1ca

    invoke-static {v2}, Lorf;->h(Ljava/lang/Object;)Lewg;

    move-result-object v1

    goto :goto_1f4

    :cond_1f2
    sget-object v1, Lh3;->a:Lh3;

    :goto_1f4
    invoke-virtual {v1}, Lorf;->g()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Leof;->run(Ljava/lang/Object;)V

    :cond_1ff
    :goto_1ff
    return-void

    :pswitch_200
    check-cast v0, Lo8f;

    check-cast v8, Lpy9;

    move-object/from16 v1, p1

    check-cast v1, Lky9;

    invoke-virtual {v8}, Lpy9;->f()Lqtg;

    move-result-object v1

    invoke-virtual {v0, v1}, Lo8f;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_210
    check-cast v0, Lzc9;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_21f

    move-object v7, v8

    :cond_21f
    invoke-virtual {v0, v7}, Lzc9;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_223
    check-cast v0, Lpc9;

    move-object v1, v8

    check-cast v1, Lcom/opera/api/Callback;

    move-object/from16 v2, p1

    check-cast v2, Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_230
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_253

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lje9;

    iget-wide v9, v3, Lje9;->a:J

    iget-object v11, v3, Lje9;->b:Ljava/lang/String;

    iget-object v12, v3, Lje9;->c:Ljava/lang/String;

    iget-object v13, v3, Lje9;->d:Ljava/lang/String;

    iget-object v14, v3, Lje9;->e:Ljava/lang/String;

    iget-object v15, v3, Lje9;->f:Ljava/lang/String;

    iget-object v3, v3, Lje9;->g:Ljava/lang/String;

    const/16 v17, 0x0

    move-object v8, v0

    move-object/from16 v16, v3

    invoke-virtual/range {v8 .. v17}, Lpc9;->f(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_230

    :cond_253
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-interface {v1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_259
    check-cast v0, Lbf9;

    check-cast v8, Lzzh;

    move-object/from16 v1, p1

    check-cast v1, Lq43;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz v8, :cond_26b

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v8, v2}, Lzzh;->run(Ljava/lang/Object;)V

    :cond_26b
    iget v1, v1, Lq43;->a:I

    const/16 v2, 0x191

    if-ne v1, v2, :cond_274

    invoke-virtual {v0}, Lbf9;->N()V

    :cond_274
    return-void

    :pswitch_275
    check-cast v0, Lmyk;

    check-cast v8, Lzzh;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :catch_281
    :cond_281
    :goto_281
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_30c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lhe9;

    iget-wide v9, v2, Lhe9;->a:J

    iget-object v3, v2, Lhe9;->b:Ljava/lang/String;

    iget-object v6, v2, Lhe9;->c:Ljava/lang/String;

    iget-object v2, v2, Lhe9;->d:Ljava/lang/String;

    iget-object v11, v0, Lmyk;->h:Ljava/util/HashMap;

    invoke-virtual {v11, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lhi2;

    if-eqz v3, :cond_281

    iget-object v11, v0, Lmyk;->a:Lbf9;

    invoke-virtual {v11}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v6, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v6

    invoke-static {v2, v5}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    invoke-virtual {v11}, Lbf9;->x()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object v11

    if-eqz v11, :cond_2bd

    invoke-static {v4, v11, v2, v5}, Lp36;->a(ILjavax/crypto/spec/SecretKeySpec;[BZ)Ljavax/crypto/Cipher;

    move-result-object v2

    if-eqz v2, :cond_2bd

    :try_start_2b8
    invoke-virtual {v2, v6}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v2
    :try_end_2bc
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2b8 .. :try_end_2bc} :catch_2bd
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2b8 .. :try_end_2bc} :catch_2bd

    goto :goto_2be

    :catch_2bd
    :cond_2bd
    move-object v2, v7

    :goto_2be
    if-eqz v2, :cond_2c6

    new-instance v6, Ljava/lang/String;

    invoke-direct {v6, v2}, Ljava/lang/String;-><init>([B)V

    goto :goto_2c7

    :cond_2c6
    move-object v6, v7

    :goto_2c7
    if-eqz v6, :cond_281

    :try_start_2c9
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2ce
    .catch Lorg/json/JSONException; {:try_start_2c9 .. :try_end_2ce} :catch_281

    iget-wide v11, v3, Lhi2;->e:J

    cmp-long v6, v9, v11

    if-lez v6, :cond_281

    iput-wide v9, v3, Lhi2;->e:J

    :try_start_2d6
    const-string v6, "name"

    invoke-virtual {v2, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    invoke-static {v11}, Lorb;->u(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    if-eqz v11, :cond_2f5

    invoke-static {v11}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string v11, "data"

    new-instance v12, Lorb;

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v12, v2}, Lorb;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v3, v9, v10, v6, v12}, Lhi2;->g(JLjava/lang/String;Lorb;)V

    goto :goto_281

    :cond_2f5
    new-instance v2, Lorg/json/JSONException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " is null"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_30c
    .catch Lorg/json/JSONException; {:try_start_2d6 .. :try_end_30c} :catch_281

    :cond_30c
    if-eqz v8, :cond_313

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v8, v0}, Lzzh;->run(Ljava/lang/Object;)V

    :cond_313
    return-void

    :pswitch_314
    check-cast v0, Lcd9;

    check-cast v8, Lhu5;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-object v0, v0, Lcd9;->u:Lod9;

    if-eqz v0, :cond_32e

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_329

    sget-object v0, Lad9;->a:Lad9;

    goto :goto_32b

    :cond_329
    sget-object v0, Lad9;->b:Lad9;

    :goto_32b
    invoke-virtual {v8, v0}, Lhu5;->run(Ljava/lang/Object;)V

    :cond_32e
    return-void

    :pswitch_32f
    check-cast v0, Lrma;

    check-cast v8, Ljava/lang/String;

    move-object/from16 v1, p1

    check-cast v1, Lad9;

    iget-object v2, v0, Lrma;->f:Ljava/lang/Object;

    check-cast v2, Lcd9;

    iget-object v9, v0, Lrma;->d:Ljava/lang/Object;

    check-cast v9, Lbf9;

    iget v10, v0, Lrma;->b:I

    const/4 v11, 0x4

    if-ne v10, v11, :cond_39d

    iput v5, v0, Lrma;->b:I

    iput-object v7, v0, Lrma;->i:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    const/16 v7, 0xc

    if-eqz v5, :cond_375

    if-eq v5, v6, :cond_354

    if-ne v5, v4, :cond_39d

    :cond_354
    iget-object v0, v0, Lrma;->h:Ljava/lang/Object;

    check-cast v0, Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    invoke-virtual {v9, v8}, Lbf9;->g(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lad9;->c:Lad9;

    if-ne v1, v0, :cond_369

    const v0, 0x7f140798

    goto :goto_36c

    :cond_369
    const v0, 0x7f140796

    :goto_36c
    new-instance v1, Lbr;

    invoke-direct {v1, v2, v0, v7}, Lbr;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {v2, v1}, Lcd9;->z0(Ljava/lang/Runnable;)V

    goto :goto_39d

    :cond_375
    new-instance v1, Lbm8;

    invoke-direct {v1, v0, v7}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v9}, Lbf9;->r()I

    move-result v5

    sget-object v6, Lbf9;->A:Lbxl;

    if-lt v5, v4, :cond_396

    iget-object v5, v9, Lbf9;->n:Lzd2;

    if-nez v5, :cond_396

    invoke-virtual {v9}, Lbf9;->s()Lmyk;

    move-result-object v5

    if-nez v5, :cond_390

    invoke-virtual {v1, v4}, Lbm8;->f(I)V

    goto :goto_399

    :cond_390
    new-instance v6, Lli2;

    invoke-direct {v6, v5, v2, v8, v1}, Lli2;-><init>(Lmyk;Lgi2;Ljava/lang/String;Lbm8;)V

    goto :goto_399

    :cond_396
    invoke-virtual {v1, v4}, Lbm8;->f(I)V

    :goto_399
    iput v3, v0, Lrma;->b:I

    iput-object v6, v0, Lrma;->i:Ljava/lang/Object;

    :cond_39d
    :goto_39d
    return-void

    :pswitch_39e
    check-cast v0, Lww8;

    check-cast v8, Lhv2;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    iget-boolean v0, v0, Lww8;->e:Z

    iget-boolean v1, v8, Lhv2;->h:Z

    if-eq v1, v0, :cond_3c5

    iput-boolean v0, v8, Lhv2;->h:Z

    iget-boolean v1, v8, Lhv2;->f:Z

    if-eqz v1, :cond_3b6

    if-eqz v0, :cond_3b6

    iput-boolean v5, v8, Lhv2;->f:Z

    :cond_3b6
    if-nez v0, :cond_3c5

    iget-object v0, v8, Lhv2;->g:Lc53;

    if-eqz v0, :cond_3c5

    iget-object v1, v8, Lhv2;->e:Lip1;

    invoke-virtual {v1, v0}, Lip1;->accept(Ljava/lang/Object;)V

    iput-object v7, v8, Lhv2;->g:Lc53;

    iput-boolean v6, v8, Lhv2;->f:Z

    :cond_3c5
    invoke-virtual {v8}, Lhv2;->e()V

    return-void

    :pswitch_3c9
    check-cast v0, Loz2;

    check-cast v8, Lrq8;

    move-object/from16 v1, p1

    check-cast v1, Lcj9;

    new-instance v9, Lnq8;

    iget-object v1, v1, Lcj9;->a:Ljava/lang/String;

    if-eqz v1, :cond_3dd

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    :cond_3dd
    if-nez v7, :cond_3e1

    const-string v7, ""

    :cond_3e1
    move-object v10, v7

    invoke-static {}, Lcom/opera/android/browser/obml/Platform;->c()Ljava/lang/String;

    move-result-object v11

    iget-object v1, v8, Lrq8;->d:Ljv1;

    invoke-virtual {v1}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lhs3;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const-string v2, "of"

    if-eqz v1, :cond_400

    if-eq v1, v6, :cond_3fe

    if-eq v1, v4, :cond_400

    invoke-static {}, Lh9o;->p()V

    goto :goto_419

    :cond_3fe
    const-string v2, "ob"

    :cond_400
    move-object v12, v2

    iget-object v1, v8, Lrq8;->e:Ljv1;

    invoke-virtual {v1}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Ljava/lang/String;

    iget-object v1, v8, Lrq8;->f:Ljv1;

    invoke-virtual {v1}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Ljava/lang/String;

    invoke-direct/range {v9 .. v14}, Lnq8;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v9}, Loz2;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_419
    return-void

    :pswitch_41a
    check-cast v0, Lcom/opera/api/Callback;

    check-cast v8, Lk5o;

    move-object/from16 v1, p1

    check-cast v1, Ld3j;

    iget-object v1, v8, Lk5o;->b:Ljava/lang/Object;

    check-cast v1, Ljv1;

    invoke-virtual {v1}, Ljv1;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_42e
    check-cast v0, Ls28;

    check-cast v8, Ljava/io/File;

    move-object/from16 v1, p1

    check-cast v1, [B

    :try_start_436
    sget-object v2, Lo36;->a:[I

    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    const-string v3, "AES"

    invoke-direct {v2, v1, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    iget-object v1, v0, Ls28;->e:Ljava/lang/Object;

    check-cast v1, Lumi;

    new-instance v3, Lgl6;

    const/16 v4, 0x13

    invoke-direct {v3, v0, v8, v2, v4}, Lgl6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v1, v3}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    invoke-virtual {v0, v7}, Lnml;->a(Ljava/lang/Object;)Loml;
    :try_end_451
    .catch Ljava/lang/IllegalArgumentException; {:try_start_436 .. :try_end_451} :catch_452

    goto :goto_455

    :catch_452
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    :goto_455
    return-void

    :pswitch_456
    check-cast v0, Lxn4;

    check-cast v8, Lcom/google/android/gms/cast/framework/CastSession;

    move-object/from16 v1, p1

    check-cast v1, Lzn4;

    iget-object v2, v0, Lxn4;->s:Ljava/util/HashMap;

    if-nez v1, :cond_473

    invoke-virtual {v2, v8}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb18;

    if-eqz v1, :cond_484

    new-instance v1, La18;

    invoke-direct {v1, v0, v8, v6}, La18;-><init>(Lxn4;Lcom/google/android/gms/cast/framework/CastSession;B)V

    invoke-static {v1}, Lvml;->c(Ljava/lang/Runnable;)V

    goto :goto_484

    :cond_473
    invoke-virtual {v2, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb18;

    if-nez v2, :cond_47f

    invoke-virtual {v1}, Lzn4;->a()V

    goto :goto_484

    :cond_47f
    iput-object v1, v2, Lb18;->a:Lzn4;

    invoke-virtual {v0, v8, v2}, Lxn4;->R(Lcom/google/android/gms/cast/framework/CastSession;Lb18;)V

    :cond_484
    :goto_484
    return-void

    :pswitch_485
    check-cast v0, Landroid/graphics/drawable/LayerDrawable;

    check-cast v8, Ligi;

    move-object/from16 v1, p1

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-nez v1, :cond_4ab

    iget-object v1, v8, Ligi;->f:Ljava/lang/Object;

    check-cast v1, Landroid/content/Context;

    const v2, 0x7f0805c5

    invoke-static {v2, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_4aa

    const v3, 0x7f0402c8

    const v4, 0x7f06063b

    invoke-static {v3, v1, v4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {v2, v1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    move-object v7, v2

    :cond_4aa
    move-object v1, v7

    :cond_4ab
    invoke-virtual {v0, v5, v1}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_4b2
    check-cast v0, Lif7;

    check-cast v8, Landroid/net/Uri;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_4f0

    iget-object v1, v0, Lif7;->z:Lrc9;

    iget-object v0, v0, Lif7;->A:Lib9;

    iget-object v1, v1, Lrc9;->b:Lbf9;

    iget-wide v2, v0, Lhb9;->b:J

    invoke-virtual {v1}, Lbf9;->q()Lpc9;

    move-result-object v0

    if-eqz v0, :cond_4f0

    iget-object v1, v0, Lpc9;->g:Lqie;

    iget-object v4, v0, Lpc9;->b:Lumi;

    new-instance v5, Lcc9;

    invoke-direct {v5, v0, v2, v3, v8}, Lcc9;-><init>(Lpc9;JLandroid/net/Uri;)V

    invoke-interface {v4, v5}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v2

    new-instance v3, Ldc9;

    const/4 v5, 0x3

    invoke-direct {v3, v0, v5}, Ldc9;-><init>(Lpc9;B)V

    invoke-virtual {v4, v3}, Lumi;->f(Ln5o;)Lnml;

    move-result-object v0

    invoke-virtual {v2, v0}, Lnml;->b(Lnml;)V

    new-instance v0, Loml;

    invoke-direct {v0, v2}, Loml;-><init>(Lnml;)V

    invoke-virtual {v1, v0, v7}, Lqie;->n(Loml;Ljava/lang/Object;)Lp1j;

    :cond_4f0
    return-void

    :pswitch_4f1
    check-cast v0, Lwjh;

    check-cast v8, Legd;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget v3, v8, Legd;->d:I

    if-ne v3, v2, :cond_503

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    move v3, v5

    goto :goto_50b

    :cond_503
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lt v3, v2, :cond_50b

    move v3, v5

    move v6, v3

    :cond_50b
    :goto_50b
    if-ge v5, v6, :cond_555

    add-int v13, v5, v3

    invoke-interface {v1, v13}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lykg;

    iget-object v4, v2, Lykg;->a:Ljava/lang/String;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_552

    iget-object v2, v2, Lykg;->b:Ljava/lang/String;

    if-nez v2, :cond_525

    invoke-virtual {v8}, Legd;->a()Ljava/lang/String;

    move-result-object v2

    :cond_525
    iget-object v9, v0, Lwjh;->e:Ljava/lang/Object;

    move-object v15, v9

    check-cast v15, Ljava/util/ArrayList;

    new-instance v9, Lmkg;

    new-instance v10, Lujd;

    invoke-direct {v10}, Lujd;-><init>()V

    iput-object v2, v10, Lujd;->a:Ljava/lang/CharSequence;

    invoke-static {v4}, Lsfe;->L(Landroid/net/Uri;)Landroid/os/Bundle;

    move-result-object v2

    iput-object v2, v10, Lujd;->H:Landroid/os/Bundle;

    new-instance v2, Lvjd;

    invoke-direct {v2, v10}, Lvjd;-><init>(Lujd;)V

    move-object v4, v9

    new-instance v9, Legd;

    iget-object v10, v8, Legd;->a:Lre7;

    iget-object v11, v8, Legd;->b:Landroid/net/Uri;

    iget-object v12, v8, Legd;->c:Ljava/lang/String;

    iget v14, v8, Legd;->e:I

    invoke-direct/range {v9 .. v14}, Legd;-><init>(Lre7;Landroid/net/Uri;Ljava/lang/String;II)V

    invoke-direct {v4, v2, v9, v7, v7}, Lmkg;-><init>(Lvjd;Legd;Landroid/graphics/Bitmap;Ljava/lang/String;)V

    invoke-virtual {v15, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_552
    add-int/lit8 v5, v5, 0x1

    goto :goto_50b

    :cond_555
    invoke-virtual {v0}, Lwjh;->k()V

    return-void

    :pswitch_559
    check-cast v0, Landroid/content/Context;

    check-cast v8, Llqm;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    sget-object v2, Llk6;->a:Llk6;

    new-instance v2, Lxgf;

    invoke-direct {v2, v1}, Lxgf;-><init>(Ljava/lang/String;)V

    iput-object v8, v2, Lxgf;->m:Llqm;

    iput-boolean v6, v2, Lxgf;->n:Z

    invoke-static {v0, v2}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    return-void

    :pswitch_570
    check-cast v0, Lo16;

    check-cast v8, Lcom/opera/android/autofill/AutofillManager;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_57c
    :goto_57c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5a7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/autofill/CreditCard;

    iget-object v4, v0, Lo16;->b:Ljava/util/HashMap;

    iget-object v5, v2, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v4, :cond_57c

    iget-object v5, v8, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v6, v5, Lnrl;->a:Z

    if-eqz v6, :cond_59e

    invoke-static {v2, v4}, LJ/N;->MFIUe29u(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_57c

    :cond_59e
    new-instance v6, Lbi2;

    invoke-direct {v6, v2, v4, v3}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v6}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    goto :goto_57c

    :cond_5a7
    return-void

    :pswitch_5a8
    check-cast v0, Li9c;

    check-cast v8, Lhz;

    move-object/from16 v1, p1

    check-cast v1, Lisl;

    instance-of v2, v1, Ljsl;

    if-eqz v2, :cond_5c0

    move-object v2, v1

    check-cast v2, Ljsl;

    iget-object v2, v2, Ljsl;->a:Ljava/lang/String;

    iput-object v2, v0, Li9c;->g:Ljava/lang/Object;

    invoke-virtual {v8, v1}, Lhz;->run(Ljava/lang/Object;)V

    goto/16 :goto_642

    :cond_5c0
    sget-object v2, Lhsl;->a:Lhsl;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_63f

    iget-object v4, v0, Li9c;->d:Ljava/lang/Object;

    check-cast v4, Lghj;

    iget-object v7, v4, Lghj;->a:Ldb;

    invoke-virtual {v7}, Ldb;->f()Z

    move-result v7

    if-nez v7, :cond_63b

    iget-object v4, v4, Lghj;->b:Lyv3;

    invoke-virtual {v4}, Lyv3;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_63b

    iget-object v1, v0, Li9c;->e:Ljava/lang/Object;

    check-cast v1, Lk42;

    iget-object v4, v0, Li9c;->a:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_5f4

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_642

    :cond_5f4
    iget-boolean v7, v0, Li9c;->b:Z

    if-eqz v7, :cond_637

    iput-boolean v5, v0, Li9c;->b:Z

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v2, v1, Lk42;->d:Lh42;

    iget-object v4, v0, Li9c;->c:Ljava/lang/Object;

    check-cast v4, Lndc;

    new-instance v5, Lwg5;

    const/16 v7, 0x8

    invoke-direct {v5, v0, v7}, Lwg5;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lcl4;

    invoke-direct {v0, v5, v3}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v4, v0}, Lekc;->j(Lndc;Lf7f;)V

    iput-boolean v6, v1, Lk42;->e:Z

    iget-object v0, v1, Lk42;->d:Lh42;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_642

    iget-boolean v0, v1, Lk42;->e:Z

    if-eqz v0, :cond_642

    iget-boolean v0, v1, Lk42;->f:Z

    if-nez v0, :cond_642

    iput-boolean v6, v1, Lk42;->f:Z

    iget-object v0, v1, Lk42;->c:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/oauth2/OperaAccessTokenProvider;

    new-instance v2, Lj42;

    invoke-direct {v2, v1}, Lj42;-><init>(Lk42;)V

    invoke-virtual {v0, v2}, Lcom/opera/android/oauth2/OperaAccessTokenProvider;->b(Lchf;)V

    goto :goto_642

    :cond_637
    invoke-virtual {v8, v2}, Lhz;->run(Ljava/lang/Object;)V

    goto :goto_642

    :cond_63b
    invoke-virtual {v8, v1}, Lhz;->run(Ljava/lang/Object;)V

    goto :goto_642

    :cond_63f
    invoke-static {}, Lh9o;->p()V

    :cond_642
    :goto_642
    return-void

    :pswitch_643
    check-cast v0, Lku5;

    check-cast v8, Ljava/lang/Runnable;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iput-object v1, v0, Lku5;->f:Ljava/util/List;

    iget-boolean v1, v0, Lku5;->g:Z

    invoke-interface {v8}, Ljava/lang/Runnable;->run()V

    iget-boolean v2, v0, Lku5;->g:Z

    if-ne v2, v1, :cond_66e

    if-eqz v2, :cond_66e

    iget-object v0, v0, Lku5;->e:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_65e
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_66e

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lju5;

    invoke-interface {v1}, Lju5;->onDataChanged()V

    goto :goto_65e

    :cond_66e
    return-void

    nop

    :pswitch_data_670
    .packed-switch 0x0
        :pswitch_643
        :pswitch_5a8
        :pswitch_570
        :pswitch_559
        :pswitch_4f1
        :pswitch_4b2
        :pswitch_485
        :pswitch_456
        :pswitch_42e
        :pswitch_41a
        :pswitch_3c9
        :pswitch_39e
        :pswitch_32f
        :pswitch_314
        :pswitch_275
        :pswitch_259
        :pswitch_223
        :pswitch_210
        :pswitch_200
        :pswitch_1a1
        :pswitch_131
        :pswitch_119
        :pswitch_f8
        :pswitch_db
        :pswitch_c5
        :pswitch_9f
        :pswitch_82
        :pswitch_6e
        :pswitch_3e
    .end packed-switch
.end method
