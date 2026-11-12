.class public final synthetic Lldh;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lldh;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lldh;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_35c

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lslk;

    iget-object p0, p0, Lslk;->a:Lm59;

    if-eqz p1, :cond_1a

    const-wide/32 v4, 0xdbba00

    goto :goto_1d

    :cond_1a
    const-wide/32 v4, 0x36ee80

    :goto_1d
    iget p1, p0, Lm59;->b:I

    int-to-long v6, p1

    cmp-long p1, v4, v6

    if-eqz p1, :cond_35

    long-to-int p1, v4

    iput p1, p0, Lm59;->b:I

    iget-object p1, p0, Lm59;->e:Ljava/lang/Object;

    check-cast p1, Loml;

    if-eqz p1, :cond_32

    invoke-virtual {p1, v3}, Loml;->cancel(Z)Z

    iput-object v1, p0, Lm59;->e:Ljava/lang/Object;

    :cond_32
    invoke-virtual {p0}, Lm59;->i()V

    :cond_35
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_38
    check-cast p1, Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lw0k;

    iput-boolean v2, p0, Lw0k;->h:Z

    iput-object p1, p0, Lw0k;->g:Landroid/graphics/drawable/Drawable;

    iget-object p0, p0, Lw0k;->i:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_48
    if-ge v3, v0, :cond_56

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v3, v3, 0x1

    check-cast v1, Lcom/opera/api/Callback;

    invoke-interface {v1, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_48

    :cond_56
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_59
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt5h;

    invoke-virtual {p0, p1}, Lt5h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    return-object p0

    :pswitch_64
    check-cast p1, Lwcj;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lvcj;

    iget-object v0, p0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-interface {p1, v0}, Lwcj;->a(Landroid/content/Context;)V

    iget-object v0, p0, Lvcj;->f:Lrii;

    invoke-interface {p1}, Lwcj;->getId()Ljava/lang/String;

    move-result-object p1

    iget-object v0, v0, Lrii;->b:Ljava/lang/Object;

    check-cast v0, Lcq;

    iput-object p1, v0, Lcq;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ldej;->b()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_85
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_suggested_speed_dials"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_99
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_suggestion_provider_ai_prompts"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ad
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_suggestion_provider_recommendations"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c1
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "enable_google_ai_mode"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d5
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "autocomplete_omnibar"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_e9
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    const-string v0, "enable_suggestion_provider_bookmarks"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    const-string v0, "enable_suggestion_provider_speeddials"

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_102
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_suggestion_provider_history"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_116
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_suggestion_provider_clipboard"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12a
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_suggestion_provider_ai_recent_activity"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_13e
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_recent_searches"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_152
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_frequently_visited_sites"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_166
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_product_suggestion"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_17a
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    const-string v0, "enable_trending_searches"

    iget-object p0, p0, Lqsi;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0, p1, v0}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_18e
    move-object v0, p1

    check-cast v0, Lfum;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object v2, p0, Lh3i;->l:Lnak;

    :cond_199
    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object p1, p0

    check-cast p1, Lfum;

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a7

    move-object p1, v1

    :cond_1a7
    invoke-virtual {v2, p0, p1}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_199

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1b0
    check-cast p1, Lc2i;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object v0, p0, Lh3i;->j:Ljava/util/LinkedHashSet;

    iget-object v1, p1, Lc2i;->j:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1d2

    iget-object p0, p0, Lh3i;->d:Lt3e;

    new-instance v0, Lcb8;

    invoke-static {p1}, Lh3i;->l(Lc2i;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcb8;-><init>(Ljava/lang/String;)V

    check-cast p0, Lh5e;

    invoke-virtual {p0, v0}, Lh5e;->t(Lfb8;)V

    :cond_1d2
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1d5
    move-object v2, p1

    check-cast v2, Lc2i;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    move-object v1, p0

    check-cast v1, Lh3i;

    iget-object p0, v1, Lh3i;->d:Lt3e;

    new-instance p1, Lua8;

    invoke-static {v2}, Lh3i;->l(Lc2i;)Ljava/lang/String;

    move-result-object v0

    sget-object v3, Lxd8;->c:Lxd8;

    invoke-direct {p1, v0, v3}, Lua8;-><init>(Ljava/lang/String;Lxd8;)V

    check-cast p0, Lh5e;

    invoke-virtual {p0, p1}, Lh5e;->t(Lfb8;)V

    iget-object p0, v1, Lh3i;->i:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_233

    iget-object p0, v2, Lc2i;->i:Lc2h;

    sget-object p1, Lc2h;->g:Lc2h;

    const/4 v7, 0x3

    const/4 v8, 0x0

    if-ne p0, p1, :cond_220

    iget-object v4, v2, Lc2i;->h:Lgz5;

    if-eqz v4, :cond_233

    iget-object v3, v2, Lc2i;->b:Ljava/lang/String;

    if-eqz v3, :cond_233

    iget-object p0, v1, Lh3i;->h:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_233

    invoke-static {v1}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object p0

    new-instance v0, Lk54;

    const/4 v5, 0x0

    const/4 v6, 0x6

    invoke-direct/range {v0 .. v6}, Lk54;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/io/Serializable;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p0, v8, v8, v0, v7}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_233

    :cond_220
    iget-object v3, v2, Lc2i;->f:Lec;

    if-eqz v3, :cond_233

    invoke-static {v1}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object p0

    new-instance v0, Lhz1;

    const/16 v5, 0x1a

    move-object v4, v8

    invoke-direct/range {v0 .. v5}, Lhz1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p0, v4, v4, v0, v7}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_233
    :goto_233
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_236
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lbwg;->H(Ljava/lang/String;)Lgpm;

    move-result-object v0

    if-eqz v0, :cond_254

    iget-object v3, p0, Lh3i;->c:Lu2i;

    iget-object v3, v3, Lu2i;->a:Lo7i;

    sget-object v4, Lcc;->c:Lcc;

    invoke-virtual {v3, v0, v4}, Lo7i;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt0i;

    goto :goto_255

    :cond_254
    move-object v0, v1

    :goto_255
    if-eqz v0, :cond_25e

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    instance-of v0, v0, Lq0i;

    xor-int/2addr v0, v2

    if-eq v0, v2, :cond_27c

    :cond_25e
    iget-object p0, p0, Lh3i;->l:Lnak;

    new-instance v0, Ldum;

    sget-object v2, Lahk;->d0:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lshk;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    new-instance v3, Ludk;

    invoke-direct {v3, v2, p1}, Ludk;-><init>(Lshk;Ljava/util/List;)V

    invoke-direct {v0, v3, v1}, Ldum;-><init>(Lsdk;Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v1, v0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_27c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_27f
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lzqj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lj2;

    sget-object v0, Ll2;->a:Lf2;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    new-array v0, v0, [Ll2;

    sget-object v1, Lf2;->b:Lk2;

    aput-object v1, v0, v3

    aput-object v1, v0, v2

    invoke-static {v0}, Le82;->B([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v0}, Lj2;-><init>(Ljava/util/List;)V

    invoke-static {p1}, Lk1g;->N(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lj2;->b(Ljava/lang/String;)Lz1;

    move-result-object p0

    iget-object p0, p0, Lz1;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/List;

    new-instance p1, Larj;

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/math/BigInteger;

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/math/BigInteger;

    invoke-direct {p1, v0, p0}, Larj;-><init>(Ljava/math/BigInteger;Ljava/math/BigInteger;)V

    return-object p1

    :pswitch_2bd
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqpb;

    iget-object v0, p0, Lrpb;->b:Lx79;

    const-class v1, Lkotlinx/serialization/json/c;

    invoke-static {v1}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v1

    invoke-static {v0, v1}, Lzwg;->p(Lx79;Lytb;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-virtual {p0, p1, v0}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/json/c;

    return-object p0

    :pswitch_2d8
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lx1;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Ll2;->a:Lf2;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lf2;->b:Lk2;

    invoke-static {p1}, Lk1g;->N(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc2;->b(Ljava/lang/String;)Lz1;

    move-result-object p0

    iget-object p0, p0, Lz1;->a:Ljava/lang/Object;

    check-cast p0, Ljava/math/BigInteger;

    return-object p0

    :pswitch_2f5
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_305
    check-cast p1, Lsx8;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lojh;

    iput-object p1, p0, Lojh;->d:Lsx8;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_310
    check-cast p1, Lsx8;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lojh;

    iput-object p1, p0, Lojh;->d:Lsx8;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31b
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_32b
    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqdh;

    iget-object p0, p0, Lqdh;->a:Lii;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt9f;

    new-instance v0, Lfvh;

    invoke-direct {v0}, Lfvh;-><init>()V

    invoke-virtual {v0}, Lfvh;->c()V

    invoke-virtual {v0, p1}, Lfvh;->h(Ljava/lang/String;)V

    invoke-static {v0, p0}, Lj7c;->q(Lfvh;Lt9f;)Lokhttp3/internal/connection/RealCall;

    move-result-object p0

    return-object p0

    :pswitch_349
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lmdh;

    iget-object v0, p0, Lmdh;->h:Lh42;

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lmdh;->c:Lcul;

    invoke-virtual {p0}, Lcul;->e()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_data_35c
    .packed-switch 0x0
        :pswitch_349
        :pswitch_32b
        :pswitch_31b
        :pswitch_310
        :pswitch_305
        :pswitch_2f5
        :pswitch_2d8
        :pswitch_2bd
        :pswitch_27f
        :pswitch_236
        :pswitch_1d5
        :pswitch_1b0
        :pswitch_18e
        :pswitch_17a
        :pswitch_166
        :pswitch_152
        :pswitch_13e
        :pswitch_12a
        :pswitch_116
        :pswitch_102
        :pswitch_e9
        :pswitch_d5
        :pswitch_c1
        :pswitch_ad
        :pswitch_99
        :pswitch_85
        :pswitch_64
        :pswitch_59
        :pswitch_38
    .end packed-switch
.end method
