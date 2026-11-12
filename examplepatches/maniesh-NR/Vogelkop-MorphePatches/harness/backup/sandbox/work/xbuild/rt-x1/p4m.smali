.class public final synthetic Lp4m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr4m;

.field public final synthetic c:Lvz5;

.field public final synthetic d:Lb2l;

.field public final synthetic e:Lcom/opera/android/translate_web_pages/TranslationData;


# direct methods
.method public synthetic constructor <init>(Lr4m;Lvz5;Lb2l;Lcom/opera/android/translate_web_pages/TranslationData;B)V
    .registers 6

    iput-byte p5, p0, Lp4m;->a:B

    iput-object p1, p0, Lp4m;->b:Lr4m;

    iput-object p2, p0, Lp4m;->c:Lvz5;

    iput-object p3, p0, Lp4m;->d:Lb2l;

    iput-object p4, p0, Lp4m;->e:Lcom/opera/android/translate_web_pages/TranslationData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lp4m;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object v4, p0, Lp4m;->e:Lcom/opera/android/translate_web_pages/TranslationData;

    iget-object v5, p0, Lp4m;->d:Lb2l;

    iget-object v6, p0, Lp4m;->c:Lvz5;

    iget-object p0, p0, Lp4m;->b:Lr4m;

    const/4 v7, 0x0

    packed-switch v0, :pswitch_data_14c

    iget-object v0, p0, Lr4m;->d:Lh5m;

    iget-object v8, p0, Lr4m;->g:Lv3m;

    invoke-virtual {v0, v6}, Lh5m;->b(Lvz5;)V

    iget-object v9, p0, Lr4m;->e:Ltjm;

    iget-object v10, v9, Ltjm;->c:Lv3m;

    invoke-static {v10, v5}, Ltjm;->I0(Lv3m;Lb2l;)Z

    move-result v10

    if-nez v10, :cond_2c

    invoke-virtual {p0}, Lr4m;->b0()V

    if-eqz v6, :cond_f3

    invoke-virtual {p0}, Lr4m;->a0()V

    goto/16 :goto_f3

    :cond_2c
    if-nez v6, :cond_34

    iput-byte v2, p0, Lr4m;->k:B

    iput-boolean v2, p0, Lr4m;->o:Z

    goto/16 :goto_f3

    :cond_34
    iget-object v6, p0, Lr4m;->a:Ll8l;

    move-object v10, v5

    check-cast v10, Ld7l;

    iget-object v10, v10, Ld7l;->j:Le7l;

    invoke-interface {v10}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v6, v10}, Ll8l;->H0(Ljava/lang/String;)V

    iget-object v6, p0, Lr4m;->c:Lb0c;

    iget-object v10, v4, Lcom/opera/android/translate_web_pages/TranslationData;->b:Ljava/lang/String;

    invoke-virtual {v6, v5, v10}, Lb0c;->I0(Lb2l;Ljava/lang/String;)V

    iget v4, v4, Lcom/opera/android/translate_web_pages/TranslationData;->a:I

    if-ne v4, v1, :cond_de

    invoke-virtual {p0}, Lr4m;->W()Lszb;

    move-result-object v1

    sget-object v4, Lio7;->A:Lio7;

    if-nez v1, :cond_5a

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v1, v7

    goto :goto_72

    :cond_5a
    iget-object v6, v8, Lv3m;->a:Landroid/content/Context;

    sget-object v10, Lbvn;->k:Lsjn;

    invoke-static {v6, v4, v10}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v6

    check-cast v6, Lbvn;

    invoke-virtual {v6}, Lno7;->i()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lavn;

    iget-object v6, v6, Lavn;->b:Ljava/util/HashMap;

    invoke-virtual {v6, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    :goto_72
    iget-object v6, p0, Lr4m;->b:Ly4m;

    iget-object v10, v6, Ly4m;->d:Lv3m;

    iget-object v11, v6, Ly4m;->i:Lszb;

    if-nez v11, :cond_85

    invoke-virtual {v10}, Lv3m;->d()Lszb;

    move-result-object v11

    iput-object v11, v6, Ly4m;->i:Lszb;

    invoke-virtual {v10, v11}, Lv3m;->i(Lszb;)V

    iget-object v11, v6, Ly4m;->i:Lszb;

    :cond_85
    invoke-static {v11}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v6, v8, Lv3m;->a:Landroid/content/Context;

    sget-object v8, Lbvn;->k:Lsjn;

    invoke-static {v6, v4, v8}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v4

    check-cast v4, Lbvn;

    invoke-virtual {v4}, Lno7;->i()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lavn;

    iget-object v4, v4, Lavn;->b:Ljava/util/HashMap;

    invoke-virtual {v4, v11}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    iget-object v6, v0, Lh5m;->g:Lj5m;

    if-eqz v6, :cond_cd

    iget-object v6, v6, Lj5m;->d:Lkze;

    invoke-virtual {v6}, Lekc;->g()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ld5m;

    invoke-virtual {v6}, Ld5m;->b()Z

    move-result v6

    if-eqz v6, :cond_cd

    iget-object v6, v0, Lh5m;->g:Lj5m;

    iget-object v6, v6, Lj5m;->b:Ljava/lang/String;

    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_cd

    iget-object v6, v0, Lh5m;->g:Lj5m;

    iget-object v6, v6, Lj5m;->c:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_cd

    invoke-virtual {p0, v5, v3}, Lr4m;->Y(Lb2l;I)V

    invoke-virtual {p0, v5}, Lr4m;->d0(Lb2l;)V

    goto :goto_f3

    :cond_cd
    invoke-virtual {v0}, Lh5m;->a()V

    if-eqz v1, :cond_de

    if-eqz v4, :cond_de

    invoke-virtual {v0, v1, v4}, Lh5m;->c(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v5, v3}, Lr4m;->Y(Lb2l;I)V

    invoke-virtual {p0, v5}, Lr4m;->d0(Lb2l;)V

    goto :goto_f3

    :cond_de
    invoke-static {v5}, Luy3;->F(Lb9l;)Luy3;

    move-result-object v0

    if-eqz v0, :cond_e6

    iget-object v7, v0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    :cond_e6
    if-eqz v7, :cond_ed

    iget v0, v7, Lcom/opera/android/browser/chromium/ChromiumContent;->O:I

    if-lez v0, :cond_ed

    move v2, v3

    :cond_ed
    invoke-virtual {v9, v2}, Ltjm;->J0(Z)V

    invoke-virtual {p0, v5}, Lr4m;->d0(Lb2l;)V

    :cond_f3
    :goto_f3
    return-void

    :pswitch_f4
    iget-object v0, p0, Lr4m;->a:Ll8l;

    iget-object v8, p0, Lr4m;->d:Lh5m;

    invoke-virtual {v8, v6}, Lh5m;->b(Lvz5;)V

    iget-object v6, p0, Lr4m;->e:Ltjm;

    iget-object v6, v6, Ltjm;->c:Lv3m;

    invoke-static {v6, v5}, Ltjm;->I0(Lv3m;Lb2l;)Z

    move-result v6

    if-nez v6, :cond_10c

    invoke-virtual {p0}, Lr4m;->b0()V

    invoke-virtual {p0}, Lr4m;->a0()V

    goto :goto_14a

    :cond_10c
    iget-object v6, v0, Ll8l;->c:Lk8l;

    move-object v8, v5

    check-cast v8, Ld7l;

    iget-object v8, v8, Ld7l;->j:Le7l;

    invoke-interface {v8}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ll8l;->H0(Ljava/lang/String;)V

    iget-object v0, v0, Ll8l;->c:Lk8l;

    if-eqz v0, :cond_12c

    if-eqz v6, :cond_12d

    iget-object v0, v0, Lk8l;->a:Ljava/lang/String;

    if-eqz v0, :cond_12c

    iget-object v6, v6, Lk8l;->a:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12d

    :cond_12c
    move v3, v2

    :cond_12d
    iget-object v0, p0, Lr4m;->c:Lb0c;

    if-eqz v3, :cond_133

    iget-object v7, v4, Lcom/opera/android/translate_web_pages/TranslationData;->b:Ljava/lang/String;

    :cond_133
    invoke-virtual {v0, v5, v7}, Lb0c;->I0(Lb2l;Ljava/lang/String;)V

    iget v0, v4, Lcom/opera/android/translate_web_pages/TranslationData;->a:I

    if-eq v0, v1, :cond_13b

    move v1, v2

    :cond_13b
    invoke-virtual {p0}, Lr4m;->W()Lszb;

    move-result-object v0

    if-eqz v0, :cond_145

    invoke-virtual {p0, v5, v1}, Lr4m;->Z(Lb2l;I)V

    goto :goto_147

    :cond_145
    iput-byte v1, p0, Lr4m;->k:B

    :goto_147
    invoke-virtual {p0, v5}, Lr4m;->d0(Lb2l;)V

    :goto_14a
    return-void

    nop

    :pswitch_data_14c
    .packed-switch 0x0
        :pswitch_f4
    .end packed-switch
.end method
