.class public final synthetic Lve5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(B)V
    .registers 2

    .line 9
    iput-byte p1, p0, Lve5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(BI)V
    .registers 3

    .line 8
    iput-byte p1, p0, Lve5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ls62;)V
    .registers 2

    const/16 p1, 0x1d

    iput-byte p1, p0, Lve5;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 32

    move-object/from16 v0, p0

    iget-byte v0, v0, Lve5;->a:B

    const v1, 0x7f14011e

    const/4 v2, 0x5

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x3

    const/4 v6, 0x0

    const/4 v7, 0x1

    packed-switch v0, :pswitch_data_3da

    move-object/from16 v0, p1

    check-cast v0, Lu42;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_29

    if-eqz v0, :cond_29

    iget-object v0, v0, Lu42;->c:Lpu4;

    iget-wide v0, v0, Lpu4;->a:J

    new-instance v3, Lju4;

    invoke-direct {v3, v0, v1}, Lju4;-><init>(J)V

    :cond_29
    return-object v3

    :pswitch_2a
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    move-object/from16 v1, p2

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_3b
    move-object/from16 v0, p1

    check-cast v0, Ld8j;

    move-object/from16 v1, p2

    check-cast v1, [I

    array-length v2, v1

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    check-cast v0, Lg8j;

    invoke-virtual {v0, v1}, Lg8j;->b([I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_50
    move-object/from16 v0, p1

    check-cast v0, Lg0c;

    move-object/from16 v1, p2

    check-cast v1, [I

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, La0c;

    invoke-direct {v1}, La0c;-><init>()V

    const/16 v2, 0x1003

    invoke-static {v1, v2}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v1

    iget-object v0, v0, Lg0c;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1, v0}, Lzhj;->c(Landroid/content/Context;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6e
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Ln27;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    iget-object v2, v0, Lc6n;->j:Ln27;

    if-eq v1, v2, :cond_87

    iput-object v1, v0, Lc6n;->j:Ln27;

    iget-object v0, v0, Lc6n;->k:Lz3;

    if-eqz v0, :cond_87

    invoke-virtual {v0, v1}, Lz3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_87
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8a
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Lc8e;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    iget-object v2, v0, Lc6n;->h:Lc8e;

    if-eq v1, v2, :cond_a3

    iput-object v1, v0, Lc6n;->h:Lc8e;

    iget-object v0, v0, Lc6n;->i:Lq3;

    if-eqz v0, :cond_a3

    invoke-virtual {v0, v1}, Lq3;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a3
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a6
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    iput-object v1, v0, Lc6n;->E:Lkotlin/jvm/functions/Function1;

    new-instance v1, Lec1;

    invoke-direct {v1, v0, v5}, Lec1;-><init>(Lc6n;B)V

    iput-object v1, v0, Lc6n;->g:Lkotlin/jvm/functions/Function0;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_be
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    iput-object v1, v0, Lc6n;->C:Lkotlin/jvm/functions/Function1;

    new-instance v1, Lec1;

    invoke-direct {v1, v0, v2}, Lec1;-><init>(Lc6n;B)V

    iput-object v1, v0, Lc6n;->d:Lkotlin/jvm/functions/Function0;

    iput-boolean v7, v0, Lc6n;->e:Z

    iget-object v0, v0, Lc6n;->r:Lec1;

    invoke-virtual {v0}, Lec1;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_dd
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    iput-object v1, v0, Lc6n;->E:Lkotlin/jvm/functions/Function1;

    new-instance v1, Lec1;

    invoke-direct {v1, v0, v5}, Lec1;-><init>(Lc6n;B)V

    iput-object v1, v0, Lc6n;->g:Lkotlin/jvm/functions/Function0;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_f5
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    iput-object v1, v0, Lc6n;->C:Lkotlin/jvm/functions/Function1;

    new-instance v1, Lec1;

    invoke-direct {v1, v0, v2}, Lec1;-><init>(Lc6n;B)V

    iput-object v1, v0, Lc6n;->d:Lkotlin/jvm/functions/Function0;

    iput-boolean v7, v0, Lc6n;->e:Z

    iget-object v0, v0, Lc6n;->r:Lec1;

    invoke-virtual {v0}, Lec1;->invoke()Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_114
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Lkotlin/jvm/functions/Function1;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    iput-object v1, v0, Lc6n;->D:Lkotlin/jvm/functions/Function1;

    new-instance v1, Lec1;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lec1;-><init>(Lc6n;B)V

    iput-object v1, v0, Lc6n;->f:Lkotlin/jvm/functions/Function0;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_12d
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Ld2c;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_147

    if-ne v1, v7, :cond_143

    move v6, v7

    goto :goto_147

    :cond_143
    invoke-static {}, Lh9o;->p()V

    goto :goto_14c

    :cond_147
    :goto_147
    invoke-virtual {v0, v6}, Landroid/view/View;->setLayoutDirection(I)V

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_14c
    return-object v3

    :pswitch_14d
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Lrki;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    iget-object v2, v0, Lc6n;->m:Lrki;

    if-eq v1, v2, :cond_165

    iput-object v1, v0, Lc6n;->m:Lrki;

    const v2, 0x7f0a0c9c

    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_165
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_168
    move-object/from16 v0, p1

    check-cast v0, Lm3c;

    move-object/from16 v1, p2

    check-cast v1, Lndc;

    invoke-static {v0}, Lnb6;->Q(Lm3c;)Lc6n;

    move-result-object v0

    iget-object v2, v0, Lc6n;->l:Lndc;

    if-eq v1, v2, :cond_180

    iput-object v1, v0, Lc6n;->l:Lndc;

    const v2, 0x7f0a0c99

    invoke-virtual {v0, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_180
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_183
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/String;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/String;

    const-string v2, "ro.debuggable"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19b

    const-string v2, "1"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1ab

    :cond_19b
    const-string v2, "ro.secure"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1ac

    const-string v0, "0"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1ac

    :cond_1ab
    move v6, v7

    :cond_1ac
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_1b1
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v1

    invoke-static {v0, v1}, Lr41;->a(Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1c6
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Laoh;->m(I)I

    move-result v1

    invoke-static {v0, v1}, Lyi4;->d(Lih5;I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1db
    move-object/from16 v0, p1

    check-cast v0, Ljt2;

    move-object/from16 v1, p2

    check-cast v1, [I

    array-length v2, v1

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    check-cast v0, Lot2;

    invoke-virtual {v0, v1}, Lot2;->a([I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1f0
    move-object/from16 v0, p1

    check-cast v0, Lrj;

    move-object/from16 v1, p2

    check-cast v1, [I

    array-length v2, v1

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    invoke-virtual {v0, v1}, Lrj;->a([I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_203
    move-object/from16 v0, p1

    check-cast v0, La7j;

    move-object/from16 v1, p2

    check-cast v1, Ljava/util/Set;

    new-instance v2, Lok;

    sget-object v3, Lti3;->b:Lti3;

    invoke-static {v1, v3, v7}, Laib;->O(Ljava/util/Set;Lti3;Z)Ljava/util/List;

    move-result-object v3

    sget-object v4, Lti3;->c:Lti3;

    invoke-static {v1, v4, v7}, Laib;->O(Ljava/util/Set;Lti3;Z)Ljava/util/List;

    move-result-object v4

    sget-object v5, Lti3;->d:Lti3;

    invoke-static {v1, v5, v6}, Laib;->O(Ljava/util/Set;Lti3;Z)Ljava/util/List;

    move-result-object v1

    invoke-direct {v2, v0, v3, v4, v1}, Lok;-><init>(La7j;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v2

    :pswitch_223
    move-object/from16 v0, p1

    check-cast v0, Lrj;

    move-object/from16 v1, p2

    check-cast v1, [I

    iget-object v0, v0, Lrj;->b:Lgjm;

    sget-object v1, Lvj;->a:Lvj;

    invoke-virtual {v0, v1, v6}, Lgjm;->e(Ln37;Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_235
    move-object/from16 v0, p1

    check-cast v0, Lrj;

    move-object/from16 v1, p2

    check-cast v1, [I

    iget-object v0, v0, Lrj;->b:Lgjm;

    sget-object v1, Lij;->a:Lij;

    invoke-virtual {v0, v1, v6}, Lgjm;->e(Ln37;Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_247
    move-object/from16 v0, p1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v0, p2

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_258
    move-object/from16 v0, p1

    check-cast v0, Lpg;

    move-object/from16 v1, p2

    check-cast v1, Lpg;

    sget-object v2, Lng;->a:Lng;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_26e

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_270

    :cond_26e
    sget-object v2, Log;->a:Log;

    :cond_270
    return-object v2

    :pswitch_271
    move-object/from16 v0, p1

    check-cast v0, Landroid/view/View;

    move-object/from16 v0, p2

    check-cast v0, Lef;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_27c
    move-object/from16 v0, p1

    check-cast v0, Ld8j;

    move-object/from16 v1, p2

    check-cast v1, [I

    array-length v2, v1

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    check-cast v0, Lg8j;

    invoke-virtual {v0, v1}, Lg8j;->a([I)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_291
    move-object/from16 v0, p1

    check-cast v0, Ld8j;

    move-object/from16 v1, p2

    check-cast v1, [I

    array-length v2, v1

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([II)[I

    move-result-object v1

    check-cast v0, Lg8j;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lo2;

    new-instance v3, Loba;

    invoke-direct {v3, v4, v6, v1}, Loba;-><init>(II[I)V

    invoke-direct {v2, v3}, Lo2;-><init>(Loba;)V

    iget-object v0, v0, Lg8j;->b:Lgjm;

    invoke-virtual {v0, v2, v6}, Lgjm;->e(Ln37;Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2b5
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v1, p2

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    and-int/lit8 v2, v1, 0x3

    if-eq v2, v4, :cond_2c6

    move v6, v7

    :cond_2c6
    and-int/2addr v1, v7

    check-cast v0, Lvt9;

    invoke-virtual {v0, v1, v6}, Lvt9;->N(IZ)Z

    move-result v1

    if-eqz v1, :cond_30a

    new-instance v11, Lx62;

    new-instance v1, Lt40;

    const/16 v2, 0x13

    invoke-direct {v1, v2}, Lt40;-><init>(B)V

    const/high16 v2, 0x41800000    # 16.0f

    invoke-direct {v11, v2, v7, v1}, Lx62;-><init>(FZLy62;)V

    const/4 v1, 0x0

    invoke-static {v7, v1, v2}, La26;->c(IFF)Lzvf;

    move-result-object v10

    sget-object v8, Lmpj;->c:Li39;

    invoke-virtual {v0}, Lvt9;->K()Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Lhh5;->a:Lzpa;

    if-ne v1, v2, :cond_2f6

    new-instance v1, Lmr3;

    const/16 v2, 0x1d

    invoke-direct {v1, v2}, Lmr3;-><init>(B)V

    invoke-virtual {v0, v1}, Lvt9;->g0(Ljava/lang/Object;)V

    :cond_2f6
    move-object/from16 v16, v1

    check-cast v16, Lkotlin/jvm/functions/Function1;

    const v18, 0x30006186

    const/16 v19, 0x1ea

    const/4 v9, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v17, v0

    invoke-static/range {v8 .. v19}, Lsgb;->c(Lc8e;Lu6c;Lzvf;Lz62;Lrd3;Lh89;ZLv51;Lkotlin/jvm/functions/Function1;Lih5;II)V

    goto :goto_30f

    :cond_30a
    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lvt9;->Q()V

    :goto_30f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_312
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v3, v2, 0x3

    if-eq v3, v4, :cond_323

    move v6, v7

    :cond_323
    and-int/2addr v2, v7

    check-cast v0, Lvt9;

    invoke-virtual {v0, v2, v6}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_365

    sget-object v8, Lmpj;->a:Li39;

    invoke-static {v0, v1}, Lmzg;->q(Lih5;I)Ljava/lang/String;

    move-result-object v7

    sget-object v1, Labm;->a:Lhp7;

    invoke-virtual {v0, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwam;

    iget-object v1, v1, Lwam;->f:Likl;

    new-instance v2, Lpel;

    invoke-direct {v2, v5}, Lpel;-><init>(I)V

    const/16 v27, 0x0

    const v28, 0x1fbfc

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    const-wide/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v26, 0x30

    move-object/from16 v25, v0

    move-object/from16 v24, v1

    move-object/from16 v17, v2

    invoke-static/range {v7 .. v28}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_36a

    :cond_365
    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lvt9;->Q()V

    :goto_36a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_36d
    move-object/from16 v0, p1

    check-cast v0, Lih5;

    move-object/from16 v2, p2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    and-int/lit8 v3, v2, 0x3

    if-eq v3, v4, :cond_37e

    move v6, v7

    :cond_37e
    and-int/2addr v2, v7

    check-cast v0, Lvt9;

    invoke-virtual {v0, v2, v6}, Lvt9;->N(IZ)Z

    move-result v2

    if-eqz v2, :cond_3d1

    sget-object v6, Lmpj;->a:Li39;

    sget-object v2, Lpof;->b:Ldof;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v10, 0x0

    const/16 v11, 0xa

    const/high16 v7, 0x41c00000    # 24.0f

    const/4 v8, 0x0

    const/high16 v9, 0x41c00000    # 24.0f

    invoke-static/range {v6 .. v11}, La26;->b0(Lc8e;FFFFI)Lc8e;

    move-result-object v8

    invoke-static {v0, v1}, Lmzg;->q(Lih5;I)Ljava/lang/String;

    move-result-object v7

    sget-object v1, Labm;->a:Lhp7;

    invoke-virtual {v0, v1}, Lvt9;->j(Lg7h;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwam;

    iget-object v1, v1, Lwam;->f:Likl;

    new-instance v2, Lpel;

    invoke-direct {v2, v5}, Lpel;-><init>(I)V

    const/16 v27, 0x0

    const v28, 0x1fbfc

    const-wide/16 v9, 0x0

    const-wide/16 v11, 0x0

    const/4 v13, 0x0

    const-wide/16 v14, 0x0

    const/16 v16, 0x0

    const-wide/16 v18, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v26, 0x0

    move-object/from16 v25, v0

    move-object/from16 v24, v1

    move-object/from16 v17, v2

    invoke-static/range {v7 .. v28}, Lijl;->b(Ljava/lang/String;Lc8e;JJLki9;JLbgl;Lpel;JIZIILikl;Lih5;III)V

    goto :goto_3d6

    :cond_3d1
    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Lvt9;->Q()V

    :goto_3d6
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_3da
    .packed-switch 0x0
        :pswitch_36d
        :pswitch_312
        :pswitch_2b5
        :pswitch_291
        :pswitch_27c
        :pswitch_271
        :pswitch_258
        :pswitch_247
        :pswitch_235
        :pswitch_223
        :pswitch_203
        :pswitch_1f0
        :pswitch_1db
        :pswitch_1c6
        :pswitch_1b1
        :pswitch_183
        :pswitch_168
        :pswitch_14d
        :pswitch_12d
        :pswitch_114
        :pswitch_f5
        :pswitch_dd
        :pswitch_be
        :pswitch_a6
        :pswitch_8a
        :pswitch_6e
        :pswitch_50
        :pswitch_3b
        :pswitch_2a
    .end packed-switch
.end method
