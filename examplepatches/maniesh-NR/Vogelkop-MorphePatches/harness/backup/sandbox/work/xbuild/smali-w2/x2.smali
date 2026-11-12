.class public final synthetic Lx2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(BLjava/lang/Object;Lkotlin/jvm/functions/Function1;)V
    .registers 4

    iput-byte p1, p0, Lx2;->a:B

    iput-object p3, p0, Lx2;->c:Ljava/lang/Object;

    iput-object p2, p0, Lx2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 10
    iput-byte p3, p0, Lx2;->a:B

    iput-object p1, p0, Lx2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lx2;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Lx2;->a:B

    const/16 v1, 0x17

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-object v6, p0, Lx2;->c:Ljava/lang/Object;

    iget-object p0, p0, Lx2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3d6

    check-cast p0, Lj03;

    check-cast v6, Lo3c;

    iget-object v0, p0, Lj03;->r:Lpaj;

    iget-object v1, v6, Lo3c;->a:Luh4;

    invoke-interface {v1}, Lmk7;->e()J

    move-result-wide v1

    invoke-virtual {v6}, Lo3c;->getLayoutDirection()Ld2c;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3, v6}, Lpaj;->a(JLd2c;Ln27;)Lw7d;

    move-result-object v0

    iput-object v0, p0, Lj03;->w:Lw7d;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_28
    check-cast p0, Lqf5;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    iput-object v6, p0, Lqf5;->c:Lkotlin/jvm/functions/Function0;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31
    check-cast p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    check-cast v6, Ljava/lang/String;

    sget v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->o:I

    invoke-virtual {p0}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->F()Lgjm;

    move-result-object p0

    new-instance v0, Lzv7;

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-direct {v0, v1}, Lzv7;-><init>(I)V

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_4a
    check-cast p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    check-cast v6, Lj2g;

    sget v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->o:I

    invoke-virtual {p0}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->F()Lgjm;

    move-result-object v0

    new-instance v1, Lku;

    invoke-direct {v1, v6, v4}, Lku;-><init>(Lj2g;Z)V

    new-instance v2, Lt02;

    const/16 v3, 0x10

    invoke-direct {v2, p0, v3}, Lt02;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lug;

    const/4 v4, 0x7

    invoke-direct {v3, v2, v4}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1, p0, v3}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_6c
    check-cast p0, Lot2;

    check-cast v6, Lg2b;

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "text/comma-separated-values"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    iget-object p0, p0, Lot2;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object p0

    check-cast p0, Lhjf;

    invoke-virtual {p0, v0, v6}, Lhjf;->D(Landroid/content/Intent;Lni;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_8f
    check-cast p0, Lgg2;

    check-cast v6, Lei7;

    iget-object v0, p0, Lgg2;->w:Lsf2;

    iget-object v0, v0, Lsf2;->b:Landroid/widget/ImageView;

    invoke-virtual {v0, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lgg2;->w:Lsf2;

    iget-object v0, v0, Lsf2;->b:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-wide v3, Lgg2;->F:J

    invoke-static {v3, v4}, Lpn7;->f(J)J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v2, Lxa;

    invoke-direct {v2, p0, v6, v1}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_bb
    move-object v1, p0

    check-cast v1, Ls62;

    check-cast v6, Lcom/opera/android/Lazy;

    new-instance v0, Lqyj;

    invoke-virtual {v1}, Ls62;->d()Lekc;

    move-result-object v2

    iget-object p0, v1, Ls62;->j:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrni;

    iget-object v3, p0, Lrni;->b:Lkze;

    iget-object v4, v1, Ls62;->x:Lg22;

    new-instance v5, Lk62;

    const/4 p0, 0x2

    invoke-direct {v5, v1, p0}, Lk62;-><init>(Ls62;B)V

    iget-object v7, v1, Ls62;->g:Lyv3;

    new-instance v8, Ll62;

    const/4 p0, 0x3

    invoke-direct {v8, v1, p0}, Ll62;-><init>(Ls62;B)V

    invoke-direct/range {v0 .. v8}, Lqyj;-><init>(Lndc;Lekc;Lkze;Lg22;Lk62;Lcom/opera/android/Lazy;Lyv3;Ll62;)V

    iget-object p0, v1, Ls62;->r:Lc12;

    iput-object v0, p0, Lc12;->h:Lqyj;

    iget-object p0, p0, Lc12;->i:Lwnm;

    iget-object v1, v0, Lqyj;->j:Lode;

    invoke-virtual {p0, v1}, Lwnm;->t(Lekc;)V

    return-object v0

    :pswitch_ef
    check-cast p0, Ls62;

    check-cast v6, Lz5i;

    sget-object v0, Lc62;->x:Lc62;

    invoke-virtual {v6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_131

    sget-object v0, Lz52;->x:Lz52;

    invoke-virtual {v6, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_106

    sget-object v5, Lt52;->k:Lt52;

    goto :goto_131

    :cond_106
    instance-of v0, v6, Ly52;

    if-eqz v0, :cond_114

    new-instance v5, Ls52;

    check-cast v6, Ly52;

    iget-object v0, v6, Ly52;->x:Ljava/lang/String;

    invoke-direct {v5, v0}, Ls52;-><init>(Ljava/lang/String;)V

    goto :goto_131

    :cond_114
    instance-of v0, v6, Lb62;

    if-eqz v0, :cond_124

    new-instance v5, Lv52;

    check-cast v6, Lb62;

    iget-object v0, v6, Lb62;->x:Ljava/lang/String;

    iget-object v1, v6, Lb62;->y:Ljava/lang/String;

    invoke-direct {v5, v0, v1}, Lv52;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_131

    :cond_124
    instance-of v0, v6, La62;

    if-eqz v0, :cond_14a

    new-instance v5, Lu52;

    check-cast v6, La62;

    iget-object v0, v6, La62;->x:Ljava/lang/String;

    invoke-direct {v5, v0}, Lu52;-><init>(Ljava/lang/String;)V

    :cond_131
    :goto_131
    if-nez v5, :cond_13b

    iget-object p0, p0, Ls62;->t:Lkze;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    goto :goto_147

    :cond_13b
    invoke-virtual {p0}, Ls62;->c()Lp62;

    move-result-object v0

    new-instance v1, Lm62;

    invoke-direct {v1, p0, v3}, Lm62;-><init>(Ls62;B)V

    invoke-virtual {v0, v5, v1}, Lp62;->a(Lwyh;Lm62;)V

    :goto_147
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_14d

    :cond_14a
    invoke-static {}, Lh9o;->p()V

    :goto_14d
    return-object v5

    :pswitch_14e
    check-cast p0, Lky1;

    check-cast v6, Ls62;

    new-instance v0, Lbi;

    invoke-direct {v0, v6, v1}, Lbi;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lwth;

    const/16 v2, 0xb

    invoke-direct {v1, v6, v2}, Lwth;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v6, v0, v1}, Lky1;->a(Lndc;Lcy1;Lgy1;)Liy1;

    move-result-object p0

    return-object p0

    :pswitch_163
    check-cast p0, Lcom/opera/android/Lazy;

    check-cast v6, Lj32;

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/io/File;

    iget-object v1, v6, Lj32;->e:Ljava/lang/String;

    const-string v2, ".data"

    invoke-static {v1, v2}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0

    :pswitch_17b
    check-cast p0, Lx22;

    move-object v9, v6

    check-cast v9, Lv22;

    new-instance v0, Lm02;

    iget-object p0, p0, Lx22;->p:Ll32;

    new-instance v7, Lq2;

    const/4 v13, 0x0

    const/4 v14, 0x6

    const/4 v8, 0x0

    const-class v10, Lv22;

    const-string v11, "onStorageLoaded"

    const-string v12, "onStorageLoaded()V"

    invoke-direct/range {v7 .. v14}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v0, p0, v7}, Lm02;-><init>(Ll32;Lq2;)V

    return-object v0

    :pswitch_196
    check-cast p0, Landroid/content/pm/PackageManager;

    check-cast v6, Lwt1;

    iget-object v0, v6, Lwt1;->a:Landroid/content/pm/ApplicationInfo;

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-static {p0, v0}, Lrab;->c(Landroid/content/pm/PackageManager;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1a3
    check-cast p0, Lat1;

    check-cast v6, Landroid/content/Context;

    iput-boolean v4, p0, Lat1;->r:Z

    iget-object p0, p0, Lat1;->g:Lyl6;

    invoke-static {v6}, Loi;->d(Landroid/content/Context;)Loi;

    move-result-object v0

    invoke-virtual {p0, v0, v5}, Lyl6;->e(Loi;Ljava/lang/Runnable;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b5
    check-cast v6, Lkotlin/jvm/functions/Function1;

    check-cast p0, Ljs1;

    iget-object p0, p0, Ljs1;->a:Lc7j;

    invoke-interface {v6, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c1
    check-cast p0, Lgs1;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Lgs1;->a:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lms1;

    iget-object v0, p0, Lms1;->d:Lc7j;

    iget-object v1, p0, Lms1;->c:Lc7j;

    if-eq v0, v1, :cond_1f9

    iget-object v1, p0, Lms1;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "app_font"

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-virtual {v1, v0, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    iget-object v0, p0, Lms1;->d:Lc7j;

    iput-object v0, p0, Lms1;->c:Lc7j;

    iget-object v0, p0, Lms1;->e:Lnak;

    invoke-virtual {p0}, Lms1;->f()Lks1;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v5, p0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    new-instance p0, Lyzh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    :cond_1f9
    invoke-interface {v6}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1ff
    check-cast p0, Lor4;

    invoke-interface {p0, v6}, Lc1j;->b(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_207
    check-cast p0, Lpqh;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    invoke-interface {v6}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lpqh;->a:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_214
    check-cast p0, Lva1;

    check-cast v6, Ljava/lang/String;

    new-instance v0, Ly91;

    invoke-virtual {p0}, Lva1;->n()Lto9;

    move-result-object p0

    invoke-virtual {p0, v6}, Lto9;->l(Ljava/lang/String;)Lap9;

    move-result-object p0

    invoke-direct {v0, p0}, Ly91;-><init>(Lap9;)V

    return-object v0

    :pswitch_226
    check-cast p0, Lva1;

    check-cast v6, Lto9;

    iget-object p0, p0, Lva1;->a:Lqsk;

    if-eqz p0, :cond_235

    invoke-interface {p0}, Lqsk;->getWritableDatabase()Lto9;

    move-result-object p0

    if-eqz p0, :cond_235

    move-object v6, p0

    :cond_235
    return-object v6

    :pswitch_236
    check-cast p0, Lsoi;

    check-cast v6, Lb41;

    iget-object v0, p0, Lsoi;->e:Leoi;

    iget-object v1, p0, Lsoi;->f:Leoi;

    iget-object v3, p0, Lsoi;->c:Ljava/lang/Float;

    iget-object v4, p0, Lsoi;->d:Ljava/lang/Float;

    if-eqz v0, :cond_258

    if-eqz v3, :cond_258

    iget-object v5, v0, Leoi;->a:Lkotlin/jvm/functions/Function0;

    invoke-interface {v5}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Number;

    invoke-virtual {v5}, Ljava/lang/Number;->floatValue()F

    move-result v5

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    sub-float/2addr v5, v3

    goto :goto_259

    :cond_258
    move v5, v2

    :goto_259
    if-eqz v1, :cond_26f

    if-eqz v4, :cond_26f

    iget-object v3, v1, Leoi;->a:Lkotlin/jvm/functions/Function0;

    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->floatValue()F

    move-result v3

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    sub-float/2addr v3, v4

    goto :goto_270

    :cond_26f
    move v3, v2

    :goto_270
    cmpg-float v4, v5, v2

    if-nez v4, :cond_278

    cmpg-float v2, v3, v2

    if-eqz v2, :cond_2da

    :cond_278
    iget v2, p0, Lsoi;->a:I

    invoke-virtual {v6, v2}, Lb41;->A(I)I

    move-result v2

    invoke-virtual {v6}, Lb41;->s()Ljde;

    move-result-object v3

    iget v4, v6, Lb41;->k:I

    invoke-virtual {v3, v4}, Ljde;->e(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lm0j;

    if-eqz v3, :cond_297

    :try_start_28c
    iget-object v4, v6, Lb41;->m:Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    if-eqz v4, :cond_297

    invoke-virtual {v6, v3}, Lb41;->k(Lm0j;)Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->s(Landroid/graphics/Rect;)V
    :try_end_297
    .catch Ljava/lang/IllegalStateException; {:try_start_28c .. :try_end_297} :catch_297

    :catch_297
    :cond_297
    invoke-virtual {v6}, Lb41;->s()Ljde;

    move-result-object v3

    iget v4, v6, Lb41;->l:I

    invoke-virtual {v3, v4}, Ljde;->e(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lm0j;

    if-eqz v3, :cond_2b0

    :try_start_2a5
    iget-object v4, v6, Lb41;->n:Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;

    if-eqz v4, :cond_2b0

    invoke-virtual {v6, v3}, Lb41;->k(Lm0j;)Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroidx/core/view/accessibility/AccessibilityNodeInfoCompat;->s(Landroid/graphics/Rect;)V
    :try_end_2b0
    .catch Ljava/lang/IllegalStateException; {:try_start_2a5 .. :try_end_2b0} :catch_2b0

    :catch_2b0
    :cond_2b0
    iget-object v3, v6, Lb41;->d:Lv31;

    invoke-virtual {v3}, Landroid/view/View;->invalidate()V

    invoke-virtual {v6}, Lb41;->s()Ljde;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljde;->e(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lm0j;

    if-eqz v3, :cond_2da

    iget-object v3, v3, Lm0j;->a:Lk0j;

    if-eqz v3, :cond_2da

    iget-object v3, v3, Lk0j;->c:Lm3c;

    if-eqz v3, :cond_2da

    if-eqz v0, :cond_2d0

    iget-object v4, v6, Lb41;->p:Ljde;

    invoke-virtual {v4, v2, v0}, Ljde;->i(ILjava/lang/Object;)V

    :cond_2d0
    if-eqz v1, :cond_2d7

    iget-object v4, v6, Lb41;->q:Ljde;

    invoke-virtual {v4, v2, v1}, Ljde;->i(ILjava/lang/Object;)V

    :cond_2d7
    invoke-virtual {v6, v3}, Lb41;->w(Lm3c;)V

    :cond_2da
    if-eqz v0, :cond_2e6

    iget-object v0, v0, Leoi;->a:Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    iput-object v0, p0, Lsoi;->c:Ljava/lang/Float;

    :cond_2e6
    if-eqz v1, :cond_2f2

    iget-object v0, v1, Leoi;->a:Lkotlin/jvm/functions/Function0;

    invoke-interface {v0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Float;

    iput-object v0, p0, Lsoi;->d:Ljava/lang/Float;

    :cond_2f2
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2f5
    check-cast p0, Lv31;

    check-cast v6, Landroid/view/KeyEvent;

    invoke-static {p0, v6}, Lv31;->e(Lv31;Landroid/view/KeyEvent;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_302
    check-cast p0, Ldw3;

    check-cast v6, Lmy0;

    invoke-virtual {p0}, Ldw3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lekc;

    new-instance v0, Ly2;

    const/16 v1, 0x18

    invoke-direct {v0, v1}, Ly2;-><init>(B)V

    invoke-static {p0, v0}, Lb8h;->j(Lekc;Lkotlin/jvm/functions/Function1;)Lh42;

    move-result-object p0

    iget-object v0, v6, Lmy0;->a:Lcom/opera/android/BrowserActivity;

    new-instance v1, Lky0;

    invoke-direct {v1, v6, v3}, Lky0;-><init>(Lmy0;B)V

    new-instance v2, Lug;

    invoke-direct {v2, v1, v4}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {p0, v0, v2}, Lekc;->j(Lndc;Lf7f;)V

    return-object p0

    :pswitch_327
    check-cast v6, Lkotlin/jvm/functions/Function1;

    check-cast p0, Lrx8;

    new-instance v0, Lvke;

    invoke-virtual {p0}, Lrx8;->a()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lrx8;->b:Lt0g;

    invoke-virtual {v2}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v3, p0, Lrx8;->c:Lt0g;

    invoke-virtual {v3}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iget-object p0, p0, Lrx8;->d:Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    invoke-direct {v0, v1, v2, v3, p0}, Lvke;-><init>(Ljava/lang/String;ZZZ)V

    invoke-interface {v6, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_366
    check-cast p0, Lgx0;

    check-cast v6, Lwf5;

    iget-object p0, p0, Lgx0;->b:Lpa;

    invoke-virtual {p0}, Lpa;->invoke()Ljava/lang/Object;

    check-cast v6, Lxf5;

    iget-object p0, v6, Lxf5;->a:Lyf5;

    sget-object v0, Lhjm;->b:Lhjm;

    invoke-virtual {p0, v0}, Ld63;->finish(Lhjm;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_37b
    check-cast p0, Lcu;

    check-cast v6, Lis;

    iget-object p0, p0, Lcu;->d:Lbs;

    invoke-interface {p0, v6}, Lbs;->a(Lis;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_387
    check-cast p0, Lau;

    check-cast v6, Lis;

    iget-object p0, p0, Lau;->d:Lbs;

    invoke-interface {p0, v6}, Lbs;->a(Lis;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_393
    check-cast p0, Lfg;

    check-cast v6, Lxo8;

    iget-object v0, p0, Lfg;->l:Lxo8;

    invoke-static {v0, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3a1

    iput-object v5, p0, Lfg;->l:Lxo8;

    :cond_3a1
    invoke-virtual {v6}, Lxo8;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3a7
    check-cast p0, Lrmg;

    check-cast v6, Lzf;

    invoke-virtual {p0, v6}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3b1
    check-cast p0, Lejc;

    check-cast v6, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {p0, v6}, Lejc;->f(Landroid/view/accessibility/AccessibilityManager;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_3bb
    check-cast p0, Lq0g;

    check-cast v6, Lkotlin/jvm/functions/Function1;

    invoke-virtual {p0}, Lq0g;->h()I

    move-result v0

    add-int/2addr v0, v4

    invoke-virtual {p0, v0}, Lq0g;->i(I)V

    invoke-virtual {p0}, Lq0g;->h()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v6, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_3d6
    .packed-switch 0x0
        :pswitch_3bb
        :pswitch_3b1
        :pswitch_3a7
        :pswitch_393
        :pswitch_387
        :pswitch_37b
        :pswitch_366
        :pswitch_327
        :pswitch_302
        :pswitch_2f5
        :pswitch_236
        :pswitch_226
        :pswitch_214
        :pswitch_207
        :pswitch_1ff
        :pswitch_1c1
        :pswitch_1b5
        :pswitch_1a3
        :pswitch_196
        :pswitch_17b
        :pswitch_163
        :pswitch_14e
        :pswitch_ef
        :pswitch_bb
        :pswitch_8f
        :pswitch_6c
        :pswitch_4a
        :pswitch_31
        :pswitch_28
    .end packed-switch
.end method
