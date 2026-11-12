.class public final synthetic Lvx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lvx;->a:B

    iput-object p1, p0, Lvx;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lvx;->a:B

    iget-object p0, p0, Lvx;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1ba

    check-cast p0, Lcom/opera/android/autofill/OperaAutofillService;

    sget v0, Lcom/opera/android/autofill/OperaAutofillService;->d:I

    new-instance v0, Lrye;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v0, p0}, Lrye;-><init>(Landroid/content/Context;)V

    return-object v0

    :pswitch_15
    check-cast p0, Lcq5;

    invoke-virtual {p0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbef;

    return-object p0

    :pswitch_1e
    check-cast p0, Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Landroid/widget/TextView;->getHighlightColor()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_29
    check-cast p0, Lmhb;

    iget-object v0, p0, Lmhb;->d:Lbz;

    check-cast v0, Lyxe;

    iget-object v0, v0, Lyxe;->a:Lxd3;

    iget-object p0, p0, Lmhb;->c:Ljava/lang/Object;

    check-cast p0, Laz;

    iget-object v0, v0, Lxd3;->a:Lueg;

    invoke-virtual {v0, p0}, Lueg;->l(Laz;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_3c
    check-cast p0, Lfqe;

    iget-object p0, p0, Lfqe;->a:Landroid/content/Context;

    invoke-static {p0}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld3j;

    const/4 v0, 0x4

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Ld3j;->d(IZ)Lc3j;

    move-result-object p0

    if-eqz p0, :cond_57

    iget-object p0, p0, Lc3j;->d:Ljava/lang/Comparable;

    check-cast p0, Ljava/lang/String;

    goto :goto_59

    :cond_57
    const-string p0, "news.opera-api.com"

    :goto_59
    new-instance v0, Li4d;

    new-instance v1, Landroid/net/Uri$Builder;

    invoke-direct {v1}, Landroid/net/Uri$Builder;-><init>()V

    const-string v2, "https"

    invoke-virtual {v1, v2}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Li4d;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_73
    check-cast p0, Lrld;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    return-object p0

    :pswitch_7e
    check-cast p0, Lzqc;

    iget-object p0, p0, Lzqc;->o:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsqc;

    return-object p0

    :pswitch_89
    check-cast p0, Ltjc;

    new-instance v0, Lc36;

    iget-object v1, p0, Ltjc;->c:Landroid/content/Context;

    iget-object p0, p0, Ltjc;->a:Lumi;

    invoke-direct {v0, v1, p0}, Lc36;-><init>(Landroid/content/Context;Lumi;)V

    return-object v0

    :pswitch_95
    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_9c
    check-cast p0, Lcom/opera/android/Lazy;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :pswitch_a3
    check-cast p0, Lxw8;

    iget-object p0, p0, Lxw8;->o:Lkue;

    iget-object p0, p0, Lkue;->c:Landroid/view/View;

    invoke-static {p0}, Lq9n;->x(Landroid/view/View;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_b4
    check-cast p0, Lwg7;

    invoke-virtual {p0}, Lwg7;->M0()Lqm9;

    move-result-object p0

    return-object p0

    :pswitch_bb
    check-cast p0, Lbr6;

    iget-object p0, p0, Lbr6;->e:Ljava/lang/Object;

    check-cast p0, Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    invoke-virtual {p0}, Lt9f;->b()Ls9f;

    move-result-object p0

    sget-object v0, Lpn7;->b:Lon7;

    sget-object v0, Lun7;->e:Lun7;

    const/16 v1, 0x1e

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v2

    const-string v4, "duration"

    invoke-static {v4, v2, v3}, Lokhttp3/internal/_UtilJvmKt;->checkDuration-HG0u8IE(Ljava/lang/String;J)I

    move-result v2

    iput v2, p0, Ls9f;->y:I

    invoke-static {v1, v0}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    invoke-static {v4, v0, v1}, Lokhttp3/internal/_UtilJvmKt;->checkDuration-HG0u8IE(Ljava/lang/String;J)I

    move-result v0

    iput v0, p0, Ls9f;->z:I

    new-instance v0, Lt9f;

    invoke-direct {v0, p0}, Lt9f;-><init>(Ls9f;)V

    return-object v0

    :pswitch_ed
    check-cast p0, Lki;

    new-instance v0, Ljava/io/File;

    iget-object p0, p0, Lki;->b:Ljava/lang/Object;

    check-cast p0, Landroid/content/Context;

    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "ai_prompts"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0

    :pswitch_ff
    check-cast p0, Lt5d;

    invoke-virtual {p0}, Lt5d;->d0()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_10a
    check-cast p0, Lz43;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lz43;->n()Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_117
    check-cast p0, Lim3;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    return-object p0

    :pswitch_11e
    check-cast p0, Lsi3;

    iget-object p0, p0, Lsi3;->n:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Llj3;

    return-object p0

    :pswitch_129
    check-cast p0, Lekc;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ldpf;

    return-object p0

    :pswitch_132
    check-cast p0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    sget v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->o:I

    return-object p0

    :pswitch_137
    check-cast p0, Landroid/graphics/Bitmap;

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x41800000    # 16.0f

    div-float/2addr v1, v0

    invoke-static {v1, p0}, Lz5i;->m0(FLandroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :pswitch_14e
    check-cast p0, Lt42;

    iget-object p0, p0, Lt42;->v:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lwxe;->J(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_15b
    check-cast p0, Lb22;

    iget-object p0, p0, Lb22;->v:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lwxe;->J(Landroid/content/Context;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_168
    check-cast p0, Le00;

    invoke-virtual {p0}, Le00;->b()Lc00;

    move-result-object p0

    iget-object p0, p0, Lc00;->a:Ljava/lang/String;

    return-object p0

    :pswitch_171
    check-cast p0, Lc75;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ld75;

    return-object p0

    :pswitch_17a
    check-cast p0, Lit1;

    iget-object p0, p0, Lit1;->a:Landroid/content/Context;

    invoke-static {p0}, Lm5h;->k(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_183
    check-cast p0, Lht1;

    iget-object p0, p0, Lht1;->e:Lit1;

    iget-object p0, p0, Lit1;->a:Landroid/content/Context;

    invoke-static {p0}, Lm5h;->k(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_18e
    check-cast p0, Lat1;

    iget-object p0, p0, Lat1;->j:Lit1;

    iget-object p0, p0, Lit1;->a:Landroid/content/Context;

    invoke-static {p0}, Lm5h;->k(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :pswitch_199
    check-cast p0, Ljy0;

    new-instance v0, Liy0;

    invoke-direct {v0, p0}, Liy0;-><init>(Ljy0;)V

    return-object v0

    :pswitch_1a1
    check-cast p0, Lvzk;

    iget-object p0, p0, Lvzk;->a:Ljava/lang/Object;

    check-cast p0, Lcy;

    iget-object v0, p0, Lcy;->b:Ljava/lang/Object;

    check-cast v0, Lay;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->c()Z

    move-result v0

    if-eqz v0, :cond_1b8

    invoke-virtual {p0}, Lcy;->c()Lml;

    move-result-object p0

    iget-object p0, p0, Lml;->a:Ljava/lang/String;

    goto :goto_1b9

    :cond_1b8
    const/4 p0, 0x0

    :goto_1b9
    return-object p0

    :pswitch_data_1ba
    .packed-switch 0x0
        :pswitch_1a1
        :pswitch_199
        :pswitch_18e
        :pswitch_183
        :pswitch_17a
        :pswitch_171
        :pswitch_168
        :pswitch_15b
        :pswitch_14e
        :pswitch_137
        :pswitch_132
        :pswitch_129
        :pswitch_11e
        :pswitch_117
        :pswitch_10a
        :pswitch_ff
        :pswitch_ed
        :pswitch_bb
        :pswitch_b4
        :pswitch_a3
        :pswitch_9c
        :pswitch_95
        :pswitch_89
        :pswitch_7e
        :pswitch_73
        :pswitch_3c
        :pswitch_29
        :pswitch_1e
        :pswitch_15
    .end packed-switch
.end method
