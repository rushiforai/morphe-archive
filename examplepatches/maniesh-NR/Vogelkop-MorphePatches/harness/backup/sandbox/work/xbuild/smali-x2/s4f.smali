.class public final synthetic Ls4f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Ls4f;->a:B

    iput-object p1, p0, Ls4f;->b:Ljava/lang/Object;

    iput-object p2, p0, Ls4f;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 16

    iget-byte v0, p0, Ls4f;->a:B

    const/4 v1, 0x7

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v6, p0, Ls4f;->c:Ljava/lang/Object;

    iget-object p0, p0, Ls4f;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_34e

    check-cast p0, Loc7;

    check-cast v6, Lokhttp3/internal/dns/StateMachineDnsCall;

    invoke-static {p0, v6}, Lokhttp3/internal/dns/StateMachineDnsCall;->a(Loc7;Lokhttp3/internal/dns/StateMachineDnsCall;)Lkotlin/Unit;

    move-result-object p0

    return-object p0

    :pswitch_17
    check-cast p0, Ls4b;

    check-cast v6, Ltsd;

    new-instance v0, Lm8k;

    iget-object v7, p0, Ls4b;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v8

    const v9, 0x7f0d03c4

    invoke-virtual {v8, v9, v7, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_6e

    new-instance v4, Lb7k;

    invoke-direct {v4, v3, v5, v5}, Lb7k;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iget-object v5, p0, Ls4b;->g:Ljava/lang/Object;

    check-cast v5, Lt8k;

    iget-object p0, p0, Ls4b;->h:Ljava/lang/Object;

    check-cast p0, Lhv3;

    iget-object v7, v4, Lb7k;->b:Landroid/view/View;

    invoke-direct {v0, v7}, Lab2;-><init>(Landroid/view/View;)V

    new-instance v8, Lz61;

    invoke-direct {v8, v7}, Lz61;-><init>(Landroid/view/View;)V

    iget-object v8, v8, Lz61;->b:Ljava/lang/Object;

    check-cast v8, Lkze;

    new-instance v9, Lwj;

    invoke-direct {v9, v4, v5, v1}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v6, v8, v9}, La26;->T(Lekc;Likc;Lf7f;)V

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v4, 0x7f141339

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {v7, v3}, Landroid/view/View;->setClickable(Z)V

    new-instance v1, Lmze;

    invoke-direct {v1, p0, v2}, Lmze;-><init>(Lhv3;B)V

    invoke-virtual {v7, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object v4, v0

    goto :goto_73

    :cond_6e
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_73
    return-object v4

    :pswitch_74
    check-cast p0, Lk8k;

    check-cast v6, Ltsd;

    new-instance v0, Lj8k;

    iget-object v1, p0, Lk8k;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v2

    const v3, 0x7f0d03c3

    invoke-virtual {v2, v3, v1, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0a0039

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Landroid/widget/FrameLayout;

    if-eqz v9, :cond_ce

    const v2, 0x7f0a003a

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Landroid/widget/FrameLayout;

    if-eqz v10, :cond_ce

    const v2, 0x7f0a0b63

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v11, :cond_ce

    const v2, 0x7f0a0b64

    invoke-static {v2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v12, :cond_ce

    new-instance v7, Lor2;

    move-object v8, v1

    check-cast v8, Landroid/widget/LinearLayout;

    const/16 v13, 0x1a

    invoke-direct/range {v7 .. v13}, Lor2;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;B)V

    iget-object v1, p0, Lk8k;->h:Lpde;

    iget-object p0, p0, Lk8k;->f:Lfd;

    invoke-direct {v0, v7, v1, p0, v6}, Lj8k;-><init>(Lor2;Lpde;Lfd;Ltsd;)V

    move-object v4, v0

    goto :goto_df

    :cond_ce
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Missing required view with ID: "

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_df
    return-object v4

    :pswitch_e0
    check-cast p0, Ljava/lang/Integer;

    check-cast v6, Lqzj;

    if-eqz p0, :cond_eb

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_f1

    :cond_eb
    iget-object p0, v6, Lqzj;->a:Landroid/content/Context;

    invoke-static {p0}, Lnr8;->e(Landroid/content/Context;)I

    move-result p0

    :goto_f1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :pswitch_f6
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v6, Lfum;

    invoke-interface {p0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_100
    check-cast p0, Lnsj;

    check-cast v6, Leo8;

    iget-object v0, v6, Leo8;->a:Ljava/lang/Object;

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_123

    iget-object v0, v6, Leo8;->b:Ljava/util/ArrayList;

    new-instance v1, Ltji;

    const/16 v2, 0x18

    invoke-direct {v1, p0, v2}, Ltji;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lo95;->v(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V

    iget-object p0, v6, Leo8;->c:Lznh;

    if-eqz p0, :cond_123

    iget-object v0, p0, Lznh;->a:Lfi5;

    if-eqz v0, :cond_123

    invoke-virtual {v0, p0, v4}, Lfi5;->s(Lznh;Ljava/lang/Object;)Lmjb;

    :cond_123
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_126
    check-cast p0, Lvnj;

    check-cast v6, Lpnj;

    iput-boolean v5, p0, Lvnj;->f:Z

    iget-object v0, v6, Lpnj;->a:Ljava/lang/String;

    sget-object v1, Lnnj;->a:Lnnj;

    invoke-virtual {p0, v0, v1}, Lvnj;->l(Ljava/lang/String;Lifd;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_136
    check-cast p0, Landroid/content/Context;

    check-cast v6, Ljava/lang/String;

    invoke-virtual {p0, v6, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0

    :pswitch_13f
    check-cast p0, Lpsi;

    check-cast v6, Lt00;

    iget-object p0, p0, Lpsi;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, v6}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_14b
    check-cast p0, Lz1h;

    check-cast v6, Lpsi;

    invoke-virtual {v6}, Lpsi;->a()Lmsi;

    move-result-object v0

    iget-object p0, p0, Lz1h;->e:Lp04;

    invoke-interface {p0, v0}, Lc1j;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    new-instance v0, Los4;

    invoke-direct {v0, p0}, Los4;-><init>(Ljava/lang/Object;)V

    return-object v0

    :pswitch_15f
    check-cast p0, Ljava/lang/String;

    check-cast v6, Lyqi;

    sget-object v0, Lnng;->c:Lnng;

    new-array v1, v5, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    new-instance v2, Lxqi;

    invoke-direct {v2, v6, v5}, Lxqi;-><init>(Lyqi;B)V

    invoke-static {p0, v0, v1, v2}, Lxug;->f(Ljava/lang/String;Lxvg;[Lkotlinx/serialization/descriptors/SerialDescriptor;Lkotlin/jvm/functions/Function1;)Ld2j;

    move-result-object p0

    return-object p0

    :pswitch_171
    check-cast p0, Lj4c;

    check-cast v6, Lwj9;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu0a;

    iget-object v0, p0, Lu0a;->a:Lpde;

    iget-object v1, v6, Lwj9;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    new-instance v4, Ltji;

    invoke-direct {v4, v6, v3}, Ltji;-><init>(Ljava/lang/Object;B)V

    new-instance v3, Lw4i;

    invoke-direct {v3, v4, v2}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v3}, Lekc;->j(Lndc;Lf7f;)V

    return-object p0

    :pswitch_18f
    check-cast p0, Lyhe;

    check-cast v6, Ln3i;

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lgjm;

    invoke-virtual {p0, v6, v5}, Lgjm;->e(Ln37;Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_19d
    check-cast p0, Lnx5;

    check-cast v6, Lt2i;

    new-instance v0, Lagb;

    const/16 v1, 0x15

    invoke-direct {v0, v1, v4, v6}, Lagb;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 v1, 0x3

    invoke-static {p0, v4, v4, v0, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1af
    check-cast p0, Lldh;

    check-cast v6, Lc2i;

    invoke-virtual {p0, v6}, Lldh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b9
    check-cast p0, Lkotlin/text/Regex;

    check-cast v6, Ljava/lang/String;

    sget-object v0, Lkotlin/text/Regex;->b:Lgrh;

    iget-object p0, p0, Lkotlin/text/Regex;->a:Ljava/util/regex/Pattern;

    invoke-virtual {p0, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0, v5}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v0

    if-eqz v0, :cond_1d0

    new-instance v4, Lucd;

    invoke-direct {v4, p0, v6}, Lucd;-><init>(Ljava/util/regex/Matcher;Ljava/lang/CharSequence;)V

    :cond_1d0
    return-object v4

    :pswitch_1d1
    check-cast p0, Ltee;

    check-cast v6, Lfi5;

    iget-object v0, p0, Ltee;->b:[Ljava/lang/Object;

    iget-object p0, p0, Ltee;->a:[J

    array-length v3, p0

    sub-int/2addr v3, v2

    if-ltz v3, :cond_215

    move v2, v5

    :goto_1de
    aget-wide v7, p0, v2

    not-long v9, v7

    shl-long/2addr v9, v1

    and-long/2addr v9, v7

    const-wide v11, -0x7f7f7f7f7f7f7f80L    # -2.937446524422997E-306

    and-long/2addr v9, v11

    cmp-long v4, v9, v11

    if-eqz v4, :cond_210

    sub-int v4, v2, v3

    not-int v4, v4

    ushr-int/lit8 v4, v4, 0x1f

    const/16 v9, 0x8

    rsub-int/lit8 v4, v4, 0x8

    move v10, v5

    :goto_1f7
    if-ge v10, v4, :cond_20e

    const-wide/16 v11, 0xff

    and-long/2addr v11, v7

    const-wide/16 v13, 0x80

    cmp-long v11, v11, v13

    if-gez v11, :cond_20a

    shl-int/lit8 v11, v2, 0x3

    add-int/2addr v11, v10

    aget-object v11, v0, v11

    invoke-virtual {v6, v11}, Lfi5;->z(Ljava/lang/Object;)V

    :cond_20a
    shr-long/2addr v7, v9

    add-int/lit8 v10, v10, 0x1

    goto :goto_1f7

    :cond_20e
    if-ne v4, v9, :cond_215

    :cond_210
    if-eq v2, v3, :cond_215

    add-int/lit8 v2, v2, 0x1

    goto :goto_1de

    :cond_215
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_218
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v6, Lmdh;

    if-eqz p0, :cond_225

    invoke-virtual {v6}, Lmdh;->a()Ljava/util/List;

    move-result-object v0

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_225
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_228
    check-cast p0, Lubh;

    check-cast v6, Lq0f;

    invoke-virtual {p0, v6}, Lubh;->e(Lj14;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_232
    check-cast p0, Landroid/content/Context;

    check-cast v6, Llw4;

    iget-object v0, v6, Llw4;->a:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    const-string v1, ".preferences_pb"

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Li41;->q(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    return-object p0

    :pswitch_245
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v6, Lang;

    check-cast v6, Lwmg;

    iget-object v0, v6, Lwmg;->a:Ljava/lang/String;

    invoke-interface {p0, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_253
    check-cast p0, Lreg;

    check-cast v6, Lwf5;

    iget-object p0, p0, Lreg;->a:Lgb3;

    invoke-virtual {p0}, Lgb3;->invoke()Ljava/lang/Object;

    check-cast v6, Lxf5;

    invoke-virtual {v6}, Lxf5;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_264
    check-cast p0, Lkotlin/jvm/functions/Function1;

    check-cast v6, Lrdf;

    invoke-interface {p0, v6}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_26e
    check-cast p0, Ljava/util/List;

    check-cast v6, Lt6g;

    check-cast p0, Ljava/lang/Iterable;

    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_281

    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_298

    :cond_281
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_285
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_298

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lekc;

    invoke-virtual {v0}, Lekc;->i()Z

    move-result v0

    if-nez v0, :cond_285

    goto :goto_29b

    :cond_298
    invoke-virtual {v6}, Lt6g;->h()V

    :goto_29b
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_29e
    check-cast p0, Llld;

    check-cast v6, Laof;

    iget-object p0, p0, Llld;->b:Ljava/lang/Object;

    check-cast p0, Lt0g;

    invoke-virtual {p0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Laof;

    if-ne v0, v6, :cond_2c3

    invoke-virtual {p0, v4}, Lt0g;->setValue(Ljava/lang/Object;)V

    iget-object p0, v6, Laof;->a:Lgsj;

    iget-object p0, p0, Lgsj;->c:Lbsj;

    if-eqz p0, :cond_2bc

    iget-object p0, p0, Lbsj;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    :cond_2bc
    iget-object p0, v6, Laof;->b:Lwg5;

    sget-object v0, Lhjm;->a:Lhjm;

    invoke-virtual {p0, v0}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2c3
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2c6
    check-cast p0, Lk6l;

    check-cast v6, Lwjb;

    iget-object p0, p0, Lk6l;->s:Lg6l;

    invoke-virtual {p0, v6}, Lg6l;->H(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2d2
    check-cast p0, Lb7f;

    check-cast v6, Lwa;

    invoke-virtual {p0, v6}, Lb7f;->a(Lorg/chromium/base/Callback;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2dc
    check-cast p0, Lkotlin/coroutines/CoroutineContext;

    check-cast v6, Ljtf;

    new-instance v0, Lqmb;

    const/16 v1, 0x12

    invoke-direct {v0, v1, v4, v6}, Lqmb;-><init>(BLmt5;Ljava/lang/Object;)V

    sget-object v1, Ljz9;->a:Ljz9;

    invoke-static {v1, p0, v0, v2}, Ll54;->c(Lnx5;Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;I)Lwci;

    move-result-object p0

    iget-object p0, p0, Lwci;->b:Ljava/lang/Object;

    check-cast p0, Lu34;

    return-object p0

    :pswitch_2f2
    move-object v1, p0

    check-cast v1, Ljava/lang/String;

    check-cast v6, Li58;

    sget-object v2, Lxik;->e:Lxik;

    new-array p0, v5, [Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-static {v1}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_327

    sget-object v0, Lxik;->b:Lxik;

    if-eq v2, v0, :cond_321

    new-instance v5, Lt15;

    invoke-direct {v5, v1}, Lt15;-><init>(Ljava/lang/String;)V

    iget-object v0, v6, Li58;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/List;

    iput-object v0, v5, Lt15;->b:Ljava/util/List;

    new-instance v0, Ld2j;

    iget-object v3, v5, Lt15;->c:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-static {p0}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-direct/range {v0 .. v5}, Ld2j;-><init>(Ljava/lang/String;Lxvg;ILjava/util/List;Lt15;)V

    move-object v4, v0

    goto :goto_32c

    :cond_321
    const-string p0, "For StructureKind.CLASS please use \'buildClassSerialDescriptor\' instead"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_32c

    :cond_327
    const-string p0, "Blank serial names are prohibited"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_32c
    return-object v4

    :pswitch_32d
    check-cast p0, Lnqh;

    check-cast v6, Lt4f;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Only found "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lnqh;->a:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " digits in a row, but need to parse "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lt4f;->b()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_34e
    .packed-switch 0x0
        :pswitch_32d
        :pswitch_2f2
        :pswitch_2dc
        :pswitch_2d2
        :pswitch_2c6
        :pswitch_29e
        :pswitch_26e
        :pswitch_264
        :pswitch_253
        :pswitch_245
        :pswitch_232
        :pswitch_228
        :pswitch_218
        :pswitch_1d1
        :pswitch_1b9
        :pswitch_1af
        :pswitch_19d
        :pswitch_18f
        :pswitch_171
        :pswitch_15f
        :pswitch_14b
        :pswitch_13f
        :pswitch_136
        :pswitch_126
        :pswitch_100
        :pswitch_f6
        :pswitch_e0
        :pswitch_74
        :pswitch_17
    .end packed-switch
.end method
