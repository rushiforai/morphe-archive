.class public final synthetic Lab;
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

    iput-byte p2, p0, Lab;->a:B

    iput-object p1, p0, Lab;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run(Ljava/lang/Object;)V
    .registers 14

    iget-byte v0, p0, Lab;->a:B

    const v1, 0x7f140800

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object p0, p0, Lab;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_390

    check-cast p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    check-cast p1, Ljava/lang/Boolean;

    sget p1, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->o:I

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_18
    check-cast p0, Lst2;

    check-cast p1, La4g;

    iput-object p1, p0, Lst2;->e:La4g;

    iget-object p0, p0, Lst2;->d:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_24
    check-cast p0, Lbv1;

    check-cast p1, Ljava/util/List;

    iput-object p1, p0, Lbv1;->d:Ljava/util/List;

    iget-object p1, p0, Lbv1;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_57

    iget-object v0, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3a
    :goto_3a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_57

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/autofill/AutofillItem;

    iget-object v2, v1, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3a

    iget-object v2, v1, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    invoke-virtual {p1, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_3a

    :cond_57
    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void

    :pswitch_5b
    check-cast p0, Lmr2;

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Lmr2;->y:Lfr2;

    if-nez v0, :cond_64

    move-object v0, v4

    :cond_64
    iget-object v1, v0, Lfr2;->c:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Lgr2;

    iget-object v5, v0, Lfr2;->d:Lmr2;

    const v6, 0x7f140231

    invoke-virtual {v5, v6}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "SELECT_BUTTON"

    invoke-direct {v3, v5, v7, v6}, Lgr2;-><init>(Lmr2;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_82
    :goto_82
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/opera/android/autofill/Address;

    iget-object v6, v3, Lcom/opera/android/autofill/Address;->n:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I

    move-result v6

    if-eqz v6, :cond_82

    new-instance v6, Lgr2;

    invoke-direct {v6, v5, v3}, Lgr2;-><init>(Lmr2;Lcom/opera/android/autofill/Address;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_82

    :cond_9f
    new-instance p1, Lgr2;

    const v3, 0x7f1401fa

    invoke-virtual {v5, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v6, "ADD_BUTTON"

    invoke-direct {p1, v5, v6, v3}, Lgr2;-><init>(Lmr2;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    iget-object p1, p0, Lmr2;->y:Lfr2;

    if-nez p1, :cond_be

    move-object p1, v4

    :cond_be
    iget-object v0, p0, Lmr2;->x:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lfr2;->b(Ljava/lang/String;)I

    move-result p1

    iget-object v0, p0, Lmr2;->y:Lfr2;

    if-nez v0, :cond_c9

    move-object v0, v4

    :cond_c9
    invoke-virtual {v0, p1}, Lfr2;->a(I)Lgr2;

    move-result-object v0

    iget-object p0, p0, Lmr2;->w:Lro9;

    if-eqz p0, :cond_d2

    move-object v4, p0

    :cond_d2
    iget-object p0, v0, Lgr2;->b:Ljava/lang/CharSequence;

    invoke-virtual {v4, p1, p0}, Lro9;->a0(ILjava/lang/CharSequence;)V

    return-void

    :pswitch_d8
    check-cast p0, Lb4g;

    check-cast p1, Landroid/graphics/PointF;

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object v0

    if-eqz v0, :cond_122

    iget-object p0, p0, Lb4g;->m:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    iget-object v1, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    if-eqz v1, :cond_111

    filled-new-array {v5, v5}, [I

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->getLocationInWindow([I)V

    new-instance v1, Landroid/graphics/Rect;

    iget-object p0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    iget-object p0, p0, Lnc1;->b:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Rect;

    invoke-direct {v1, p0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    aget p0, v2, v5

    aget v2, v2, v3

    invoke-virtual {v1, p0, v2}, Landroid/graphics/Rect;->offset(II)V

    iget p0, p1, Landroid/graphics/PointF;->x:F

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    iget p1, p1, Landroid/graphics/PointF;->y:F

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-virtual {v1, p0, p1}, Landroid/graphics/Rect;->contains(II)Z

    move-result v5

    :cond_111
    if-nez v5, :cond_122

    iget-object p0, v0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lo66;

    invoke-virtual {p0}, Lo66;->j()Z

    move-result p1

    if-eqz p1, :cond_122

    iget-object p0, p0, Lo66;->f:Ll56;

    invoke-virtual {p0}, Landroidx/appcompat/widget/ListPopupWindow;->dismiss()V

    :cond_122
    return-void

    :pswitch_123
    check-cast p0, Ljava/util/concurrent/atomic/AtomicBoolean;

    check-cast p1, Landroid/graphics/drawable/Animatable;

    invoke-virtual {p0, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void

    :pswitch_12b
    check-cast p0, Ldz8;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, v4}, Ldz8;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_133
    check-cast p0, Lpi2;

    check-cast p1, Ljava/lang/Long;

    iput-object v4, p0, Lpi2;->h:Lih4;

    if-nez p1, :cond_13e

    invoke-virtual {p0, v2}, Lhi2;->c(I)V

    :cond_13e
    return-void

    :pswitch_13f
    check-cast p0, Lmgh;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lmgh;->e(Ljava/lang/Object;)V

    return-void

    :pswitch_147
    check-cast p0, La32;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    iget-object v0, p0, La32;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, La32;->c:Ljava/lang/Object;

    check-cast v1, Lzy9;

    iget-object p0, p0, La32;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    if-nez p1, :cond_169

    new-instance p1, Lkj2;

    const v2, 0x7f1403c4

    invoke-direct {p1, v0, v2, v1, p0}, Lkj2;-><init>(Landroid/content/Context;ILzy9;Ljava/lang/Runnable;)V

    invoke-virtual {p1}, Lsj2;->e()V

    goto :goto_16e

    :cond_169
    if-eqz p0, :cond_16e

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_16e
    :goto_16e
    return-void

    :pswitch_16f
    check-cast p0, Lfd2;

    invoke-interface {p0, p1}, Lfd2;->onResult(Ljava/lang/Object;)V

    return-void

    :pswitch_175
    check-cast p0, Lxa;

    check-cast p1, Lu42;

    invoke-virtual {p0}, Lxa;->run()V

    return-void

    :pswitch_17d
    check-cast p0, Ls62;

    check-cast p1, Lu42;

    iget-object p0, p0, Ls62;->s:Lode;

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_187
    check-cast p0, Lr9i;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    iget-wide v0, p0, Lcom/opera/android/webcore/WebcoreRpcBridge;->a:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_19a

    invoke-static {v0, v1, p1}, LJ/N;->MM1UajSt(JLjava/lang/Object;)V

    :cond_19a
    return-void

    :pswitch_19b
    check-cast p0, Lu59;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1a8

    const v1, 0x7f141429

    :cond_1a8
    invoke-virtual {p0, v1}, Lu59;->N(I)V

    return-void

    :pswitch_1ac
    check-cast p0, Ll12;

    check-cast p1, Landroid/net/Uri;

    if-nez p1, :cond_1b8

    iget-object p0, p0, Ll12;->a:Lpjn;

    invoke-virtual {p0, v1}, Lpjn;->m(I)V

    goto :goto_1d5

    :cond_1b8
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v8

    new-instance v6, Lcmn;

    const/4 v9, 0x0

    const/4 v10, 0x5

    const/4 v7, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lcmn;-><init>(Ljava/lang/String;Ljava/lang/String;IIZ)V

    iget-object p0, p0, Ll12;->c:Lp12;

    iget-object p0, p0, Lp12;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    new-instance p1, Ldmn;

    sget-object v0, Lwln;->h:Lwln;

    invoke-direct {p1, v0, v6}, Ldmn;-><init>(Lwln;Lcmn;)V

    invoke-virtual {p0, p1, v5}, Lgjm;->e(Ln37;Z)V

    :goto_1d5
    return-void

    :pswitch_1d6
    check-cast p0, Lfka;

    check-cast p1, Lz92;

    iget-object p1, p1, Lz92;->a:Ljava/lang/String;

    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lfka;->n(Ltw7;)V

    return-void

    :pswitch_1e5
    check-cast p0, Lfka;

    check-cast p1, Lvyn;

    new-instance v0, Luha;

    iget-object v1, p1, Lvyn;->a:Ljava/lang/String;

    iget-object v3, p1, Lvyn;->b:Ljava/lang/String;

    iget-object v4, p1, Lvyn;->c:Ljava/lang/String;

    new-instance v5, Lxha;

    iget-object v2, p1, Lvyn;->d:Ljava/lang/String;

    iget-object p1, p1, Lvyn;->e:Ljava/lang/String;

    invoke-direct {v5, v2, p1}, Lxha;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v1

    invoke-direct/range {v0 .. v5}, Luha;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lxha;)V

    new-instance p1, Lsw7;

    invoke-direct {p1, v0}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lfka;->n(Ltw7;)V

    return-void

    :pswitch_207
    check-cast p0, Ls02;

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Ls02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_20f
    check-cast p0, Lab;

    check-cast p1, Ljava/lang/String;

    new-instance v0, Lz92;

    invoke-direct {v0, p1}, Lz92;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lab;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_21c
    check-cast p0, Ld12;

    check-cast p1, Lz92;

    iget-object v0, p1, Lz92;->a:Ljava/lang/String;

    new-instance v1, Lc4;

    const/16 v2, 0x1c

    invoke-direct {v1, p1, v2}, Lc4;-><init>(Ljava/lang/Object;B)V

    const-string p1, "OFA.CHAT_KEY"

    invoke-interface {p0, p1, v0, v1}, Ld12;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Runnable;)V

    return-void

    :pswitch_22f
    check-cast p0, Lg01;

    check-cast p1, Ljava/lang/String;

    iget-object v0, p0, Lg01;->u:Landroidx/appcompat/widget/SearchView;

    if-eqz v0, :cond_23a

    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    :cond_23a
    iget-object p0, p0, Lg01;->s:Lgjm;

    new-instance v0, Lc9g;

    invoke-direct {v0, p1}, Lc9g;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v5}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_245
    check-cast p0, Lnz0;

    check-cast p1, Landroid/app/Dialog;

    instance-of v0, p1, Lbz0;

    if-eqz v0, :cond_252

    check-cast p1, Lbz0;

    invoke-virtual {p0, p1}, Lnz0;->onDialogViewsInflated(Lbz0;)V

    :cond_252
    return-void

    :pswitch_253
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast p1, Landroid/graphics/Bitmap;

    if-eqz p1, :cond_25f

    new-instance v0, Lww0;

    invoke-direct {v0, p1}, Lww0;-><init>(Landroid/graphics/Bitmap;)V

    goto :goto_261

    :cond_25f
    sget-object v0, Luw0;->a:Luw0;

    :goto_261
    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_265
    check-cast p0, Liu2;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Liu2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_275
    check-cast p0, Ls00;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Ls00;->t:Ljava/lang/String;

    return-void

    :pswitch_27c
    check-cast p0, Le00;

    check-cast p1, Lc00;

    iget-object v0, p0, Le00;->g:Ljava/util/ArrayList;

    if-eqz v0, :cond_2bd

    if-eqz p1, :cond_2a7

    iput-object p1, p0, Le00;->e:Lc00;

    iget-object v0, p0, Le00;->c:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "advertising_id"

    iget-object v2, p1, Lc00;->a:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "limit_ad_tracking"

    iget-boolean p1, p1, Lc00;->b:Z

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_2a7
    iget-object p1, p0, Le00;->g:Ljava/util/ArrayList;

    iput-object v4, p0, Le00;->g:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p0

    :goto_2af
    if-ge v5, p0, :cond_2bd

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 v5, v5, 0x1

    check-cast v0, Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_2af

    :cond_2bd
    return-void

    :pswitch_2be
    check-cast p0, Li5o;

    check-cast p1, Lnz;

    iput-object p1, p0, Li5o;->k:Ljava/lang/Object;

    invoke-virtual {p0}, Li5o;->i()V

    return-void

    :pswitch_2c8
    check-cast p0, Let;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Let;->u(Landroid/graphics/Bitmap;)V

    return-void

    :pswitch_2d0
    check-cast p0, Ldb;

    check-cast p1, Ljava/util/List;

    iget-object v0, p0, Ldb;->b:Lb59;

    if-eqz p1, :cond_38e

    invoke-virtual {p0}, Ldb;->b()Ljh0;

    move-result-object v1

    sget-object v6, Ljh0;->c:Ljh0;

    if-ne v1, v6, :cond_38e

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    const-string v6, "account_type"

    if-eqz v1, :cond_2f3

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, v6, v2}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    goto/16 :goto_38e

    :cond_2f3
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v3, :cond_300

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbvj;

    goto :goto_331

    :cond_300
    invoke-virtual {p0}, Ldb;->c()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_327

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_30a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_327

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lbvj;

    iget-object v8, v7, Lbvj;->b:Ljava/lang/String;

    invoke-static {v8, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_326

    iget-object v8, v7, Lbvj;->c:Ljava/lang/String;

    invoke-static {v8, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_30a

    :cond_326
    move-object v4, v7

    :cond_327
    if-nez v4, :cond_330

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbvj;

    goto :goto_331

    :cond_330
    move-object p0, v4

    :goto_331
    iget-object p0, p0, Lbvj;->a:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result p1

    const/4 v1, 0x3

    const/4 v4, -0x1

    sparse-switch p1, :sswitch_data_3ce

    goto :goto_362

    :sswitch_33d
    const-string p1, "facebook"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_362

    move v2, v1

    goto :goto_365

    :sswitch_347
    const-string p1, "vk"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_365

    goto :goto_362

    :sswitch_350
    const-string p1, "twitter"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_362

    move v2, v3

    goto :goto_365

    :sswitch_35a
    const-string p1, "google"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_364

    :cond_362
    :goto_362
    move v2, v4

    goto :goto_365

    :cond_364
    move v2, v5

    :cond_365
    :goto_365
    packed-switch v2, :pswitch_data_3e0

    goto :goto_38e

    :pswitch_369
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, v6, v1}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    goto :goto_38e

    :pswitch_373
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const/4 p1, 0x6

    :goto_37a
    invoke-static {p0, v6, p1}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    goto :goto_38e

    :pswitch_37e
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const/4 p1, 0x5

    goto :goto_37a

    :pswitch_386
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const/4 p1, 0x4

    goto :goto_37a

    :cond_38e
    :goto_38e
    return-void

    nop

    :pswitch_data_390
    .packed-switch 0x0
        :pswitch_2d0
        :pswitch_2c8
        :pswitch_2be
        :pswitch_27c
        :pswitch_275
        :pswitch_265
        :pswitch_253
        :pswitch_245
        :pswitch_22f
        :pswitch_21c
        :pswitch_20f
        :pswitch_207
        :pswitch_1e5
        :pswitch_1d6
        :pswitch_1ac
        :pswitch_19b
        :pswitch_187
        :pswitch_17d
        :pswitch_175
        :pswitch_16f
        :pswitch_147
        :pswitch_13f
        :pswitch_133
        :pswitch_12b
        :pswitch_123
        :pswitch_d8
        :pswitch_5b
        :pswitch_24
        :pswitch_18
    .end packed-switch

    :sswitch_data_3ce
    .sparse-switch
        -0x49eca1c7 -> :sswitch_35a
        -0x369e558d -> :sswitch_350
        0xeb5 -> :sswitch_347
        0x1da19ac6 -> :sswitch_33d
    .end sparse-switch

    :pswitch_data_3e0
    .packed-switch 0x0
        :pswitch_386
        :pswitch_37e
        :pswitch_373
        :pswitch_369
    .end packed-switch
.end method
