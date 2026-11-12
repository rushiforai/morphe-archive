.class public final synthetic Ltmi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 5

    iput-byte p4, p0, Ltmi;->a:B

    iput-object p1, p0, Ltmi;->b:Ljava/lang/Object;

    iput-object p2, p0, Ltmi;->c:Ljava/lang/Object;

    iput-object p3, p0, Ltmi;->d:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Ltmi;->b:Ljava/lang/Object;

    check-cast v0, Lkol;

    iget-object v1, p0, Ltmi;->c:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    iget-object p0, p0, Ltmi;->d:Ljava/lang/Object;

    check-cast p0, Lzwg;

    check-cast p1, Lv7l;

    const/4 v2, 0x0

    iput-object v2, v0, Lkol;->i:Lne5;

    sget-object v3, Lt7l;->a:Lt7l;

    invoke-static {p1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    iget p0, v0, Lkol;->f:I

    const/4 p1, 0x1

    if-ge p0, p1, :cond_38

    add-int/2addr p0, p1

    iput p0, v0, Lkol;->f:I

    iget-object p0, v0, Lkol;->l:Lyqa;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->x0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lj8l;

    iget-object v0, v0, Lkol;->e:Lhol;

    iget-object v0, v0, Lhol;->a:Lfol;

    iget v0, v0, Lfol;->c:I

    invoke-virtual {p0, v0, p1}, Lj8l;->a(II)V

    :cond_38
    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    goto :goto_5c

    :cond_3c
    instance-of v1, p1, Lu7l;

    if-eqz v1, :cond_5f

    sget-object v1, Lkol;->r:Landroid/graphics/drawable/ColorDrawable;

    iget-object v1, v0, Lkol;->a:Landroid/content/Context;

    check-cast p1, Lu7l;

    iget-object p1, p1, Lu7l;->a:Lyni;

    invoke-virtual {v0}, Lkol;->a()Lcyj;

    move-result-object v2

    invoke-static {v1, p1, v2}, Lxvg;->s(Landroid/content/Context;Lyni;Lcyj;)Lir;

    move-result-object p1

    new-instance v1, Lznl;

    invoke-virtual {p0}, Lzwg;->j()Leol;

    move-result-object p0

    invoke-direct {v1, p0}, Lznl;-><init>(Leol;)V

    invoke-virtual {v0, p1, v1}, Lkol;->i(Landroid/graphics/drawable/Drawable;Lbwg;)V

    :goto_5c
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_5f
    invoke-static {}, Lh9o;->p()V

    return-object v2
.end method

.method private final b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Ltmi;->b:Ljava/lang/Object;

    check-cast v0, Lxg1;

    iget-object v1, p0, Ltmi;->c:Ljava/lang/Object;

    check-cast v1, Lbeo;

    iget-object p0, p0, Ltmi;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    check-cast p1, Lspa;

    sget-object v2, Lapa;->b:Lapa;

    const-string v2, "POST"

    invoke-static {v2}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v2

    iput-object v2, p1, Lspa;->b:Lapa;

    iget-object v2, p1, Lspa;->a:Ltgm;

    iget-object v1, v1, Lbeo;->a:Ljava/lang/String;

    const-string v3, "api/v1/auth/tokens"

    invoke-static {v1, v3, v2}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    const-class v1, Lxg1;

    const/4 v2, 0x0

    if-nez v0, :cond_2b

    sget-object v0, Lb4f;->a:Lb4f;

    iput-object v0, p1, Lspa;->d:Ljava/lang/Object;

    goto :goto_2d

    :cond_2b
    iput-object v0, p1, Lspa;->d:Ljava/lang/Object;

    :goto_2d
    invoke-static {v1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    :try_start_31
    invoke-static {v1}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v2
    :try_end_35
    .catchall {:try_start_31 .. :try_end_35} :catchall_35

    :catchall_35
    invoke-static {v0, v2, p1}, Lz1m;->p(Ls15;Lcam;Lspa;)V

    sget-object v0, Lvpa;->a:Ljf2;

    iget-object p1, p1, Lspa;->c:Lg9a;

    const-string v0, "X-ApiKey"

    invoke-virtual {p1, v0, p0}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Content-Type"

    const-string v0, "application/json"

    invoke-virtual {p1, p0, v0}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private final c(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    iget-object v0, p0, Ltmi;->b:Ljava/lang/Object;

    check-cast v0, Lrk1;

    iget-object v1, p0, Ltmi;->c:Ljava/lang/Object;

    check-cast v1, Lweo;

    iget-object p0, p0, Ltmi;->d:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    check-cast p1, Lspa;

    sget-object v2, Lapa;->b:Lapa;

    const-string v2, "POST"

    invoke-static {v2}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v2

    iput-object v2, p1, Lspa;->b:Lapa;

    iget-object v2, p1, Lspa;->a:Ltgm;

    iget-object v1, v1, Lweo;->a:Ljava/lang/String;

    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/4 v3, 0x3

    invoke-static {v3, p0}, Ll75;->f(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "api/v1/market/product/"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "/purchase"

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lugm;->b(Ltgm;Ljava/lang/String;)Ltgm;

    const-class p0, Lrk1;

    const/4 v1, 0x0

    if-nez v0, :cond_4b

    sget-object v0, Lb4f;->a:Lb4f;

    iput-object v0, p1, Lspa;->d:Ljava/lang/Object;

    goto :goto_4d

    :cond_4b
    iput-object v0, p1, Lspa;->d:Ljava/lang/Object;

    :goto_4d
    invoke-static {p0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    :try_start_51
    invoke-static {p0}, Luqh;->d(Ljava/lang/Class;)Lcam;

    move-result-object v1
    :try_end_55
    .catchall {:try_start_51 .. :try_end_55} :catchall_55

    :catchall_55
    invoke-static {v0, v1, p1}, Lz1m;->p(Ls15;Lcam;Lspa;)V

    sget-object p0, Lvpa;->a:Ljf2;

    iget-object p0, p1, Lspa;->c:Lg9a;

    const-string p1, "Authorization"

    const-string v0, ""

    invoke-virtual {p0, p1, v0}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Accept-Language"

    invoke-virtual {p0, p1, v0}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "Content-Type"

    const-string v0, "application/json"

    invoke-virtual {p0, p1, v0}, Leik;->i(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 32

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Ltmi;->a:B

    const/16 v3, 0x13

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    iget-object v7, v0, Ltmi;->d:Ljava/lang/Object;

    iget-object v8, v0, Ltmi;->c:Ljava/lang/Object;

    iget-object v9, v0, Ltmi;->b:Ljava/lang/Object;

    const/4 v10, 0x0

    packed-switch v2, :pswitch_data_b98

    check-cast v9, Lzfo;

    check-cast v8, Ljava/lang/String;

    check-cast v7, Ljava/lang/String;

    move-object v0, v1

    check-cast v0, Lspa;

    sget-object v1, Lapa;->b:Lapa;

    const-string v1, "GET"

    invoke-static {v1}, Lz4o;->i0(Ljava/lang/String;)Lapa;

    move-result-object v1

    iput-object v1, v0, Lspa;->b:Lapa;

    iget-object v1, v0, Lspa;->a:Ltgm;

    iget-object v2, v9, Lzfo;->a:Ljava/lang/String;

    const-string v3, "q/popular_events"

    invoke-static {v2, v3, v1}, Lz1m;->s(Ljava/lang/String;Ljava/lang/String;Ltgm;)V

    if-eqz v8, :cond_38

    const-string v1, "user_preferred_language"

    invoke-static {v0, v1, v8}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_38
    if-eqz v7, :cond_3f

    const-string v1, "user_preferred_country"

    invoke-static {v0, v1, v7}, Lynh;->g(Lspa;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3f
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_42
    invoke-direct/range {p0 .. p1}, Ltmi;->c(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_47
    invoke-direct/range {p0 .. p1}, Ltmi;->b(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_4c
    check-cast v9, Lgil;

    check-cast v8, Lwth;

    check-cast v7, Ljava/lang/Long;

    move-object v0, v1

    check-cast v0, Ltw7;

    invoke-virtual {v0}, Ltw7;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_67

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v9, v0}, Lgil;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_73

    :cond_67
    check-cast v0, Ljava/util/Collection;

    new-instance v1, Lgil;

    invoke-direct {v1, v9, v7, v3}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v8, v0, v1}, Lwth;->A(Ljava/util/Collection;Lkotlin/jvm/functions/Function1;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_73
    return-object v0

    :pswitch_74
    check-cast v9, Ljava/lang/String;

    check-cast v8, [B

    check-cast v7, Ljava/lang/String;

    move-object v0, v1

    check-cast v0, Lwa1;

    invoke-interface {v0, v10, v9}, Lwa1;->w(ILjava/lang/String;)V

    invoke-interface {v0, v6, v8}, Lwa1;->z(I[B)V

    invoke-interface {v0, v4, v7}, Lwa1;->w(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_89
    invoke-direct/range {p0 .. p1}, Ltmi;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :pswitch_8e
    check-cast v9, Ldil;

    check-cast v8, Lnx5;

    check-cast v7, Landroid/content/Context;

    move-object v0, v1

    check-cast v0, Lifl;

    iget-object v1, v0, Lifl;->a:Ldee;

    iget-object v0, v0, Lifl;->a:Ldee;

    sget-object v2, Lwfl;->b:Lwfl;

    invoke-virtual {v1, v2}, Ldee;->a(Ljava/lang/Object;)V

    sget-object v1, Ltfl;->b:[Ltfl;

    invoke-virtual {v9}, Ldil;->l()Lmil;

    move-result-object v1

    iget-wide v11, v1, Lmil;->b:J

    invoke-static {v11, v12}, Lxjl;->c(J)Z

    move-result v1

    if-nez v1, :cond_ba

    invoke-virtual {v9}, Ldil;->h()Z

    move-result v1

    if-eqz v1, :cond_ba

    iget-object v1, v9, Ldil;->g:Lf31;

    if-eqz v1, :cond_ba

    move v1, v6

    goto :goto_bb

    :cond_ba
    move v1, v10

    :goto_bb
    new-instance v3, Lxhl;

    invoke-direct {v3, v9, v5, v6}, Lxhl;-><init>(Ldil;Lmt5;B)V

    new-instance v11, Leek;

    const/16 v12, 0xe

    invoke-direct {v11, v8, v3, v12}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    new-instance v13, Lgil;

    invoke-direct {v13, v11, v5, v10}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz v1, :cond_e6

    sget-object v1, Lvtp;->g:Ljava/lang/Object;

    const v11, 0x1040003

    invoke-virtual {v3, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v11, Lsfl;

    const v14, 0x1010311

    invoke-direct {v11, v1, v3, v14, v13}, Lsfl;-><init>(Ljava/lang/Object;Ljava/lang/String;ILkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v11}, Ldee;->a(Ljava/lang/Object;)V

    :cond_e6
    sget-object v1, Ltfl;->b:[Ltfl;

    invoke-virtual {v9}, Ldil;->l()Lmil;

    move-result-object v1

    iget-wide v13, v1, Lmil;->b:J

    invoke-static {v13, v14}, Lxjl;->c(J)Z

    move-result v1

    if-nez v1, :cond_fa

    iget-object v1, v9, Ldil;->g:Lf31;

    if-eqz v1, :cond_fa

    move v1, v6

    goto :goto_fb

    :cond_fa
    move v1, v10

    :goto_fb
    new-instance v3, Lxhl;

    invoke-direct {v3, v9, v5, v4}, Lxhl;-><init>(Ldil;Lmt5;B)V

    new-instance v11, Leek;

    invoke-direct {v11, v8, v3, v12}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    new-instance v13, Lgil;

    invoke-direct {v13, v11, v5, v10}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz v1, :cond_124

    sget-object v1, Lvtp;->h:Ljava/lang/Object;

    const v11, 0x1040001

    invoke-virtual {v3, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v11, Lsfl;

    const v14, 0x1010312

    invoke-direct {v11, v1, v3, v14, v13}, Lsfl;-><init>(Ljava/lang/Object;Ljava/lang/String;ILkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v11}, Ldee;->a(Ljava/lang/Object;)V

    :cond_124
    sget-object v1, Ltfl;->b:[Ltfl;

    invoke-virtual {v9}, Ldil;->h()Z

    move-result v1

    if-eqz v1, :cond_140

    iget-object v1, v9, Ldil;->w:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_140

    iget-object v1, v9, Ldil;->g:Lf31;

    if-eqz v1, :cond_140

    move v1, v6

    goto :goto_141

    :cond_140
    move v1, v10

    :goto_141
    new-instance v3, Lxhl;

    const/4 v11, 0x3

    invoke-direct {v3, v9, v5, v11}, Lxhl;-><init>(Ldil;Lmt5;B)V

    new-instance v11, Leek;

    invoke-direct {v11, v8, v3, v12}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    new-instance v8, Lgil;

    invoke-direct {v8, v11, v5, v10}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz v1, :cond_16b

    sget-object v1, Lvtp;->i:Ljava/lang/Object;

    const v11, 0x104000b

    invoke-virtual {v3, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v11, Lsfl;

    const v12, 0x1010313

    invoke-direct {v11, v1, v3, v12, v8}, Lsfl;-><init>(Ljava/lang/Object;Ljava/lang/String;ILkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v11}, Ldee;->a(Ljava/lang/Object;)V

    :cond_16b
    sget-object v1, Ltfl;->b:[Ltfl;

    invoke-virtual {v9}, Ldil;->l()Lmil;

    move-result-object v1

    iget-wide v11, v1, Lmil;->b:J

    invoke-static {v11, v12}, Lxjl;->d(J)I

    move-result v1

    invoke-virtual {v9}, Ldil;->l()Lmil;

    move-result-object v3

    iget-object v3, v3, Lmil;->a:Lsf1;

    iget-object v3, v3, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-eq v1, v3, :cond_187

    move v1, v6

    goto :goto_188

    :cond_187
    move v1, v10

    :goto_188
    new-instance v3, Liil;

    invoke-direct {v3, v9, v10}, Liil;-><init>(Ldil;B)V

    new-instance v8, Liil;

    invoke-direct {v8, v9, v6}, Liil;-><init>(Ldil;B)V

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    new-instance v12, Lgil;

    invoke-direct {v12, v8, v3, v10}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz v1, :cond_1b1

    sget-object v1, Lvtp;->j:Ljava/lang/Object;

    const v3, 0x104000d

    invoke-virtual {v11, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v8, Lsfl;

    const v11, 0x101037e

    invoke-direct {v8, v1, v3, v11, v12}, Lsfl;-><init>(Ljava/lang/Object;Ljava/lang/String;ILkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v8}, Ldee;->a(Ljava/lang/Object;)V

    :cond_1b1
    sget-object v1, Ltfl;->b:[Ltfl;

    invoke-virtual {v9}, Ldil;->h()Z

    move-result v1

    if-eqz v1, :cond_1c5

    invoke-virtual {v9}, Ldil;->l()Lmil;

    move-result-object v1

    iget-wide v11, v1, Lmil;->b:J

    invoke-static {v11, v12}, Lxjl;->c(J)Z

    move-result v1

    if-nez v1, :cond_1c6

    :cond_1c5
    move v6, v10

    :cond_1c6
    new-instance v1, Liil;

    invoke-direct {v1, v9, v4}, Liil;-><init>(Ldil;B)V

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    new-instance v4, Lgil;

    invoke-direct {v4, v1, v5, v10}, Lgil;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    if-eqz v6, :cond_1e7

    sget-object v1, Lvtp;->k:Ljava/lang/Object;

    const v5, 0x104001a

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    new-instance v5, Lsfl;

    invoke-direct {v5, v1, v3, v10, v4}, Lsfl;-><init>(Ljava/lang/Object;Ljava/lang/String;ILkotlin/jvm/functions/Function1;)V

    invoke-virtual {v0, v5}, Ldee;->a(Ljava/lang/Object;)V

    :cond_1e7
    invoke-virtual {v0, v2}, Ldee;->a(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1ed
    check-cast v9, Lkub;

    check-cast v8, Lghl;

    check-cast v7, Llqh;

    move-object v0, v1

    check-cast v0, Lqhl;

    invoke-virtual {v9}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, -0x1

    packed-switch v1, :pswitch_data_bc6

    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_6cf

    :pswitch_203
    iget-object v0, v8, Lghl;->h:Lokm;

    iget-object v1, v0, Lokm;->b:Lrgh;

    if-eqz v1, :cond_22e

    iget-object v2, v1, Lrgh;->a:Ljava/lang/Object;

    check-cast v2, Lrgh;

    iput-object v2, v0, Lokm;->b:Lrgh;

    iget-object v2, v1, Lrgh;->b:Ljava/lang/Object;

    check-cast v2, Lmil;

    iget-object v3, v0, Lokm;->a:Lrgh;

    new-instance v4, Lrgh;

    invoke-direct {v4, v3, v2}, Lrgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v4, v0, Lokm;->a:Lrgh;

    iget v3, v0, Lokm;->c:I

    iget-object v2, v2, Lmil;->a:Lsf1;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v3

    iput v2, v0, Lokm;->c:I

    iget-object v0, v1, Lrgh;->b:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lmil;

    :cond_22e
    if-eqz v5, :cond_6cd

    iget-object v0, v8, Lghl;->j:Llw5;

    invoke-virtual {v0, v5}, Llw5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_6cd

    :pswitch_237
    iget-object v1, v8, Lghl;->h:Lokm;

    iget-object v2, v0, Lqhl;->h:Lmil;

    iget-object v3, v0, Lqhl;->g:Lsf1;

    iget-wide v6, v0, Lqhl;->f:J

    const/4 v0, 0x4

    invoke-static {v2, v3, v6, v7, v0}, Lmil;->a(Lmil;Lsf1;JI)Lmil;

    move-result-object v0

    invoke-virtual {v1, v0}, Lokm;->a(Lmil;)V

    iget-object v0, v8, Lghl;->h:Lokm;

    iget-object v1, v0, Lokm;->a:Lrgh;

    if-eqz v1, :cond_278

    iget-object v2, v1, Lrgh;->a:Ljava/lang/Object;

    check-cast v2, Lrgh;

    if-eqz v2, :cond_278

    iput-object v2, v0, Lokm;->a:Lrgh;

    iget v3, v0, Lokm;->c:I

    iget-object v4, v1, Lrgh;->b:Ljava/lang/Object;

    check-cast v4, Lmil;

    iget-object v4, v4, Lmil;->a:Lsf1;

    iget-object v4, v4, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v3, v4

    iput v3, v0, Lokm;->c:I

    iget-object v1, v1, Lrgh;->b:Ljava/lang/Object;

    check-cast v1, Lmil;

    iget-object v3, v0, Lokm;->b:Lrgh;

    new-instance v4, Lrgh;

    invoke-direct {v4, v3, v1}, Lrgh;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    iput-object v4, v0, Lokm;->b:Lrgh;

    iget-object v0, v2, Lrgh;->b:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Lmil;

    :cond_278
    if-eqz v5, :cond_6cd

    iget-object v0, v8, Lghl;->j:Llw5;

    invoke-virtual {v0, v5}, Llw5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_6cd

    :pswitch_281
    iget-boolean v0, v8, Lghl;->e:Z

    if-nez v0, :cond_295

    new-instance v0, Lyb5;

    const-string v1, "\t"

    invoke-direct {v0, v1, v6}, Lyb5;-><init>(Ljava/lang/String;I)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v8, v0}, Lghl;->a(Ljava/util/List;)V

    goto/16 :goto_6cd

    :cond_295
    iput-boolean v10, v7, Llqh;->a:Z

    goto/16 :goto_6cd

    :pswitch_299
    iget-boolean v0, v8, Lghl;->e:Z

    if-nez v0, :cond_2ad

    new-instance v0, Lyb5;

    const-string v1, "\n"

    invoke-direct {v0, v1, v6}, Lyb5;-><init>(Ljava/lang/String;I)V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v8, v0}, Lghl;->a(Ljava/util/List;)V

    goto/16 :goto_6cd

    :cond_2ad
    iget-object v0, v8, Lghl;->a:Lgbc;

    iget-object v0, v0, Lgbc;->x:Llw5;

    iget v1, v8, Lghl;->k:I

    iget-object v0, v0, Llw5;->b:Lgbc;

    iget-object v0, v0, Lgbc;->r:Lnvb;

    invoke-virtual {v0, v1}, Lnvb;->a(I)Z

    move-result v0

    iput-boolean v0, v7, Llqh;->a:Z

    goto/16 :goto_6cd

    :pswitch_2bf
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    iget-wide v1, v0, Lqhl;->f:J

    sget v3, Lxjl;->c:I

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    long-to-int v1, v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :pswitch_2dd
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2f8

    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v1

    if-eqz v1, :cond_2f5

    invoke-virtual {v0}, Lqhl;->n()V

    goto :goto_2f8

    :cond_2f5
    invoke-virtual {v0}, Lqhl;->o()V

    :cond_2f8
    :goto_2f8
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_2fd
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_318

    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v1

    if-eqz v1, :cond_315

    invoke-virtual {v0}, Lqhl;->o()V

    goto :goto_318

    :cond_315
    invoke-virtual {v0}, Lqhl;->n()V

    :cond_318
    :goto_318
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_31d
    invoke-virtual {v0}, Lqhl;->n()V

    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_325
    invoke-virtual {v0}, Lqhl;->o()V

    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_32d
    invoke-virtual {v0}, Lqhl;->l()V

    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_335
    invoke-virtual {v0}, Lqhl;->j()V

    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_33d
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v2, v0, Lqhl;->g:Lsf1;

    iget-object v3, v2, Lsf1;->b:Ljava/lang/String;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_37e

    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v3

    if-eqz v3, :cond_369

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_37e

    invoke-virtual {v0}, Lqhl;->d()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_37e

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto :goto_37e

    :cond_369
    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_37e

    invoke-virtual {v0}, Lqhl;->e()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_37e

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    :cond_37e
    :goto_37e
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_383
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v2, v0, Lqhl;->g:Lsf1;

    iget-object v3, v2, Lsf1;->b:Ljava/lang/String;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3c4

    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v3

    if-eqz v3, :cond_3af

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3c4

    invoke-virtual {v0}, Lqhl;->e()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_3c4

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto :goto_3c4

    :cond_3af
    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3c4

    invoke-virtual {v0}, Lqhl;->d()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_3c4

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    :cond_3c4
    :goto_3c4
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_3c9
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v2, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_3e0

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    :cond_3e0
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_3e5
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_3f6

    invoke-virtual {v0, v10, v10}, Lqhl;->q(II)V

    :cond_3f6
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_3fb
    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_410

    iget-object v1, v0, Lqhl;->i:Lojl;

    if-eqz v1, :cond_410

    invoke-virtual {v0, v1, v6}, Lqhl;->h(Lojl;I)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    :cond_410
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_415
    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_42a

    iget-object v1, v0, Lqhl;->i:Lojl;

    if-eqz v1, :cond_42a

    invoke-virtual {v0, v1, v2}, Lqhl;->h(Lojl;I)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    :cond_42a
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_42f
    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_444

    iget-object v1, v0, Lqhl;->c:Lnjl;

    if-eqz v1, :cond_444

    invoke-virtual {v0, v1, v6}, Lqhl;->g(Lnjl;I)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    :cond_444
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_449
    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_45e

    iget-object v1, v0, Lqhl;->c:Lnjl;

    if-eqz v1, :cond_45e

    invoke-virtual {v0, v1, v2}, Lqhl;->g(Lnjl;I)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    :cond_45e
    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_463
    invoke-virtual {v0}, Lqhl;->m()V

    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_46b
    invoke-virtual {v0}, Lqhl;->i()V

    invoke-virtual {v0}, Lqhl;->p()V

    goto/16 :goto_6cd

    :pswitch_473
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v2, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_6cd

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v10, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :pswitch_48c
    new-instance v1, Lbvk;

    const/16 v2, 0x15

    invoke-direct {v1, v2}, Lbvk;-><init>(B)V

    invoke-virtual {v0, v1}, Lqhl;->a(Lkotlin/jvm/functions/Function1;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_6cd

    invoke-virtual {v8, v0}, Lghl;->a(Ljava/util/List;)V

    goto/16 :goto_6cd

    :pswitch_49e
    new-instance v1, Lbvk;

    const/16 v2, 0x14

    invoke-direct {v1, v2}, Lbvk;-><init>(B)V

    invoke-virtual {v0, v1}, Lqhl;->a(Lkotlin/jvm/functions/Function1;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_6cd

    invoke-virtual {v8, v0}, Lghl;->a(Ljava/util/List;)V

    goto/16 :goto_6cd

    :pswitch_4b0
    new-instance v1, Lbvk;

    invoke-direct {v1, v3}, Lbvk;-><init>(B)V

    invoke-virtual {v0, v1}, Lqhl;->a(Lkotlin/jvm/functions/Function1;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_6cd

    invoke-virtual {v8, v0}, Lghl;->a(Ljava/util/List;)V

    goto/16 :goto_6cd

    :pswitch_4c0
    new-instance v1, Lbvk;

    const/16 v2, 0x12

    invoke-direct {v1, v2}, Lbvk;-><init>(B)V

    invoke-virtual {v0, v1}, Lqhl;->a(Lkotlin/jvm/functions/Function1;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_6cd

    invoke-virtual {v8, v0}, Lghl;->a(Ljava/util/List;)V

    goto/16 :goto_6cd

    :pswitch_4d2
    new-instance v1, Lbvk;

    const/16 v2, 0x11

    invoke-direct {v1, v2}, Lbvk;-><init>(B)V

    invoke-virtual {v0, v1}, Lqhl;->a(Lkotlin/jvm/functions/Function1;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_6cd

    invoke-virtual {v8, v0}, Lghl;->a(Ljava/util/List;)V

    goto/16 :goto_6cd

    :pswitch_4e4
    new-instance v1, Lbvk;

    const/16 v2, 0x10

    invoke-direct {v1, v2}, Lbvk;-><init>(B)V

    invoke-virtual {v0, v1}, Lqhl;->a(Lkotlin/jvm/functions/Function1;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_6cd

    invoke-virtual {v8, v0}, Lghl;->a(Ljava/util/List;)V

    goto/16 :goto_6cd

    :pswitch_4f6
    iget-object v0, v8, Lghl;->b:Ldil;

    invoke-virtual {v0}, Ldil;->c()V

    goto/16 :goto_6cd

    :pswitch_4fd
    iget-object v0, v8, Lghl;->b:Ldil;

    invoke-virtual {v0}, Ldil;->o()V

    goto/16 :goto_6cd

    :pswitch_504
    iget-object v0, v8, Lghl;->b:Ldil;

    invoke-virtual {v0, v10}, Ldil;->a(Z)Ld3k;

    goto/16 :goto_6cd

    :pswitch_50b
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v2, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_6cd

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :pswitch_524
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    invoke-virtual {v0, v10, v10}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :pswitch_537
    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    iget-object v1, v0, Lqhl;->i:Lojl;

    if-eqz v1, :cond_6cd

    invoke-virtual {v0, v1, v6}, Lqhl;->h(Lojl;I)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :pswitch_54e
    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    iget-object v1, v0, Lqhl;->i:Lojl;

    if-eqz v1, :cond_6cd

    invoke-virtual {v0, v1, v2}, Lqhl;->h(Lojl;I)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :pswitch_565
    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    iget-object v1, v0, Lqhl;->c:Lnjl;

    if-eqz v1, :cond_6cd

    invoke-virtual {v0, v1, v6}, Lqhl;->g(Lnjl;I)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :pswitch_57c
    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    iget-object v1, v0, Lqhl;->c:Lnjl;

    if-eqz v1, :cond_6cd

    invoke-virtual {v0, v1, v2}, Lqhl;->g(Lnjl;I)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :pswitch_593
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v1

    if-eqz v1, :cond_5ac

    invoke-virtual {v0}, Lqhl;->n()V

    goto/16 :goto_6cd

    :cond_5ac
    invoke-virtual {v0}, Lqhl;->o()V

    goto/16 :goto_6cd

    :pswitch_5b1
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v1

    if-eqz v1, :cond_5ca

    invoke-virtual {v0}, Lqhl;->o()V

    goto/16 :goto_6cd

    :cond_5ca
    invoke-virtual {v0}, Lqhl;->n()V

    goto/16 :goto_6cd

    :pswitch_5cf
    invoke-virtual {v0}, Lqhl;->n()V

    goto/16 :goto_6cd

    :pswitch_5d4
    invoke-virtual {v0}, Lqhl;->o()V

    goto/16 :goto_6cd

    :pswitch_5d9
    invoke-virtual {v0}, Lqhl;->l()V

    goto/16 :goto_6cd

    :pswitch_5de
    invoke-virtual {v0}, Lqhl;->j()V

    goto/16 :goto_6cd

    :pswitch_5e3
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v2, v0, Lqhl;->g:Lsf1;

    iget-object v3, v2, Lsf1;->b:Ljava/lang/String;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_6cd

    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v3

    if-eqz v3, :cond_610

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    invoke-virtual {v0}, Lqhl;->e()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_6cd

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :cond_610
    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    invoke-virtual {v0}, Lqhl;->d()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_6cd

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :pswitch_627
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v2, v0, Lqhl;->g:Lsf1;

    iget-object v3, v2, Lsf1;->b:Ljava/lang/String;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_6cd

    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v3

    if-eqz v3, :cond_654

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    invoke-virtual {v0}, Lqhl;->d()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_6cd

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto/16 :goto_6cd

    :cond_654
    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    invoke-virtual {v0}, Lqhl;->e()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_6cd

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto :goto_6cd

    :pswitch_66a
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    iget-wide v1, v0, Lqhl;->f:J

    invoke-static {v1, v2}, Lxjl;->c(J)Z

    move-result v1

    if-eqz v1, :cond_684

    invoke-virtual {v0}, Lqhl;->m()V

    goto :goto_6cd

    :cond_684
    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v1

    iget-wide v2, v0, Lqhl;->f:J

    if-eqz v1, :cond_694

    invoke-static {v2, v3}, Lxjl;->e(J)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto :goto_6cd

    :cond_694
    invoke-static {v2, v3}, Lxjl;->f(J)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto :goto_6cd

    :pswitch_69c
    iget-object v1, v0, Lqhl;->e:Lwjl;

    iput-object v5, v1, Lwjl;->a:Ljava/lang/Float;

    iget-object v1, v0, Lqhl;->g:Lsf1;

    iget-object v1, v1, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_6cd

    iget-wide v1, v0, Lqhl;->f:J

    invoke-static {v1, v2}, Lxjl;->c(J)Z

    move-result v1

    if-eqz v1, :cond_6b6

    invoke-virtual {v0}, Lqhl;->i()V

    goto :goto_6cd

    :cond_6b6
    invoke-virtual {v0}, Lqhl;->f()Z

    move-result v1

    iget-wide v2, v0, Lqhl;->f:J

    if-eqz v1, :cond_6c6

    invoke-static {v2, v3}, Lxjl;->f(J)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    goto :goto_6cd

    :cond_6c6
    invoke-static {v2, v3}, Lxjl;->e(J)I

    move-result v1

    invoke-virtual {v0, v1, v1}, Lqhl;->q(II)V

    :cond_6cd
    :goto_6cd
    :pswitch_6cd
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_6cf
    return-object v5

    :pswitch_6d0
    check-cast v9, Lc37;

    check-cast v8, Llw5;

    check-cast v7, Lpqh;

    move-object v0, v1

    check-cast v0, Ljava/util/List;

    iget-object v1, v7, Lpqh;->a:Ljava/lang/Object;

    check-cast v1, Ldjl;

    invoke-virtual {v9, v0}, Lc37;->b(Ljava/util/List;)Lmil;

    move-result-object v0

    if-eqz v1, :cond_6e6

    invoke-virtual {v1, v5, v0}, Ldjl;->a(Lmil;Lmil;)V

    :cond_6e6
    invoke-virtual {v8, v0}, Llw5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6ec
    check-cast v9, Llqh;

    check-cast v8, Lrf1;

    check-cast v7, Lrwj;

    move-object v0, v1

    check-cast v0, Lrf1;

    iget-boolean v1, v9, Llqh;->a:Z

    if-eqz v1, :cond_737

    iget-object v1, v0, Lrf1;->a:Ljava/lang/Object;

    iget v2, v0, Lrf1;->c:I

    iget v3, v0, Lrf1;->b:I

    instance-of v1, v1, Lrwj;

    if-eqz v1, :cond_737

    iget v1, v8, Lrf1;->b:I

    if-ne v3, v1, :cond_737

    iget v1, v8, Lrf1;->c:I

    if-ne v2, v1, :cond_737

    new-instance v1, Lrf1;

    if-nez v7, :cond_733

    new-instance v10, Lrwj;

    const/16 v28, 0x0

    const v29, 0xffff

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const-wide/16 v20, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const-wide/16 v25, 0x0

    const/16 v27, 0x0

    invoke-direct/range {v10 .. v29}, Lrwj;-><init>(JJLki9;Lgi9;Lhi9;Llh9;Ljava/lang/String;JLua3;Lvil;Lawc;JLbgl;Ljaj;I)V

    move-object v7, v10

    :cond_733
    invoke-direct {v1, v7, v3, v2}, Lrf1;-><init>(Ljava/lang/Object;II)V

    goto :goto_738

    :cond_737
    move-object v1, v0

    :goto_738
    invoke-virtual {v8, v0}, Lrf1;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, v9, Llqh;->a:Z

    return-object v1

    :pswitch_73f
    check-cast v9, Lx8l;

    check-cast v8, Lmgh;

    check-cast v7, Lesi;

    move-object v0, v1

    check-cast v0, Lkotlin/Unit;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iget-object v2, v8, Lmgh;->b:Ljava/lang/Object;

    check-cast v2, Lehc;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_75a
    :goto_75a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/high16 v4, -0x80000000

    if-eqz v3, :cond_7d3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lu8l;

    iget-object v5, v3, Lu8l;->e:Lzyk;

    iget-object v6, v3, Lu8l;->e:Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget-object v11, v3, Lu8l;->a:Lesk;

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_75a

    invoke-interface {v11}, Lesk;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    iget v12, v9, Lx8l;->g:I

    iget v13, v9, Lx8l;->h:I

    invoke-static {v5, v7, v12, v13}, Ldbh;->i(Ljava/lang/String;Lesi;II)I

    move-result v5

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    iget v13, v9, Lx8l;->i:I

    iget v14, v9, Lx8l;->j:I

    invoke-static {v12, v7, v13, v14}, Ldbh;->j(Ljava/lang/String;Lesi;II)I

    move-result v12

    invoke-static {v5, v12}, Ljava/lang/Math;->max(II)I

    move-result v5

    if-eq v5, v4, :cond_75a

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-interface {v11}, Lesk;->get()Ljava/lang/Object;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v17, v4

    check-cast v17, Ljava/lang/String;

    iget v3, v3, Lu8l;->d:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    new-instance v13, Lcom/opera/android/suggestion/Suggestion;

    const/16 v22, 0x0

    const/16 v14, 0x17

    const-string v16, ""

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v23, -0x1

    move-object/from16 v21, v16

    move/from16 v20, v5

    invoke-direct/range {v13 .. v24}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-virtual {v1, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_75a

    :cond_7d3
    iget-object v2, v8, Lmgh;->c:Ljava/lang/Object;

    check-cast v2, Lehc;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_7db
    :goto_7db
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_829

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lv8l;

    iget-object v5, v3, Lv8l;->b:Ljava/lang/String;

    invoke-interface {v0, v5}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_7db

    iget-object v6, v3, Lv8l;->a:Ljava/lang/String;

    iget v8, v9, Lx8l;->k:I

    iget v11, v9, Lx8l;->l:I

    invoke-static {v6, v7, v8, v11}, Ldbh;->i(Ljava/lang/String;Lesi;II)I

    move-result v6

    iget v8, v9, Lx8l;->m:I

    iget v11, v9, Lx8l;->n:I

    invoke-static {v5, v7, v8, v11}, Ldbh;->j(Ljava/lang/String;Lesi;II)I

    move-result v8

    invoke-static {v6, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    if-eq v6, v4, :cond_7db

    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v13, v3, Lv8l;->a:Ljava/lang/String;

    iget-object v15, v3, Lv8l;->b:Ljava/lang/String;

    new-instance v11, Lcom/opera/android/suggestion/Suggestion;

    const/16 v20, 0x0

    const/16 v12, 0x18

    const-string v14, ""

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v21, -0x1

    const/16 v22, 0x0

    move-object/from16 v19, v14

    move/from16 v18, v6

    invoke-direct/range {v11 .. v22}, Lcom/opera/android/suggestion/Suggestion;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrn9;Ljava/lang/String;ILjava/lang/String;IILjava/lang/Object;)V

    invoke-virtual {v1, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7db

    :cond_829
    new-instance v0, Lw8l;

    invoke-direct {v0, v10}, Lw8l;-><init>(B)V

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    iget-byte v1, v9, Lx8l;->f:B

    invoke-static {v0, v1}, Lkotlin/collections/CollectionsKt;->e0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object v0

    return-object v0

    :pswitch_83b
    check-cast v9, Lc8l;

    check-cast v8, Lmcj;

    check-cast v7, Lp6l;

    move-object v0, v1

    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    instance-of v1, v0, Lq0i;

    if-nez v1, :cond_84b

    move-object v5, v0

    :cond_84b
    check-cast v5, Ljava/util/List;

    if-eqz v5, :cond_8ab

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v5, Ljava/lang/Iterable;

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_85a
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_875

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lm7l;

    iget-object v3, v2, Lm7l;->c:Ll7l;

    iget-object v3, v3, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v2, v2, Lm7l;->b:Ll7l;

    iget-object v2, v2, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_85a

    :cond_875
    iget-object v1, v9, Lc8l;->h:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_87b
    if-ge v10, v2, :cond_896

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v10, v10, 0x1

    check-cast v3, Lx7l;

    iget-object v3, v3, Lx7l;->c:Lm7l;

    iget-object v4, v3, Lm7l;->c:Ll7l;

    iget-object v4, v4, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    iget-object v3, v3, Lm7l;->b:Ll7l;

    iget-object v3, v3, Ll7l;->a:Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_87b

    :cond_896
    iget-object v1, v9, Lc8l;->b:Lumi;

    new-instance v2, Lrml;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v2, v3, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Ld7k;

    invoke-direct {v1, v8, v0, v7}, Ld7k;-><init>(Lmcj;Ljava/util/LinkedHashSet;Lp6l;)V

    invoke-virtual {v2, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v0

    invoke-virtual {v0}, Lplk;->l()Loml;

    :cond_8ab
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_8ae
    check-cast v9, Lhd;

    check-cast v8, Ljava/util/List;

    check-cast v7, Lp4j;

    move-object v0, v1

    check-cast v0, Lkotlin/Unit;

    new-instance v0, Lz4l;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v7}, Lp4j;->d()I

    move-result v2

    invoke-direct {v0, v1, v2}, Lz4l;-><init>(II)V

    iget-object v1, v9, Lhd;->g:Ljava/lang/Object;

    check-cast v1, La5l;

    iget-object v2, v9, Lhd;->c:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    iget-object v3, v9, Lhd;->d:Ljava/lang/Object;

    check-cast v3, Lp6l;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_8ee

    if-ne v3, v6, :cond_8ea

    iget-object v1, v1, La5l;->d:Ln9h;

    iget-object v1, v1, Ln9h;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    new-instance v3, Ly4l;

    invoke-direct {v3, v2}, Ly4l;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_8fc

    :cond_8ea
    invoke-static {}, Lh9o;->p()V

    goto :goto_909

    :cond_8ee
    iget-object v1, v1, La5l;->c:Ln9h;

    iget-object v1, v1, Ln9h;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedHashMap;

    new-instance v3, Ly4l;

    invoke-direct {v3, v2}, Ly4l;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_8fc
    iget-boolean v1, v9, Lhd;->b:Z

    if-nez v1, :cond_907

    iget-object v1, v9, Lhd;->e:Ljava/lang/Object;

    check-cast v1, Ln6k;

    invoke-virtual {v1, v0}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_907
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_909
    return-object v5

    :pswitch_90a
    check-cast v9, Ldyk;

    check-cast v8, Loe6;

    check-cast v7, Lj31;

    move-object v0, v1

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_935

    iget-object v0, v9, Ldyk;->e:Lzxk;

    iget-object v1, v8, Loe6;->a:Lne6;

    iget-object v0, v0, Lzxk;->g:Lh5k;

    iget-object v2, v0, Lh5k;->b:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashSet;

    iput-boolean v6, v0, Lh5k;->a:Z

    iget-object v0, v0, Lh5k;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashSet;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Lj31;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_93a

    :cond_935
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v7, v0}, Lj31;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_93a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_93d
    check-cast v9, Lqyj;

    check-cast v8, Ld22;

    check-cast v7, Ltji;

    move-object v0, v1

    check-cast v0, Lc22;

    iget-object v1, v9, Lqyj;->k:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_970

    iget v1, v9, Lqyj;->h:I

    if-lez v1, :cond_970

    iget-object v1, v9, Lqyj;->b:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_970

    iget-object v1, v8, Ld22;->a:Ljava/lang/String;

    iget-object v2, v0, Lc22;->a:Ljava/lang/String;

    iget-boolean v0, v0, Lc22;->b:Z

    invoke-virtual {v9, v1, v2, v0, v7}, Lqyj;->l(Ljava/lang/String;Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)V

    goto :goto_983

    :cond_970
    iget-object v1, v9, Lqyj;->n:Lrzh;

    if-eqz v1, :cond_97a

    iget-object v0, v0, Lc22;->a:Ljava/lang/String;

    invoke-interface {v1, v0}, Lrzh;->l(Ljava/lang/String;)V

    goto :goto_983

    :cond_97a
    iget-object v0, v0, Lc22;->a:Ljava/lang/String;

    new-instance v1, Loql;

    invoke-direct {v1, v0, v7, v10}, Loql;-><init>(Ljava/lang/String;Lkotlin/jvm/functions/Function1;I)V

    iput-object v1, v9, Lqyj;->n:Lrzh;

    :goto_983
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_986
    check-cast v9, Lynj;

    check-cast v8, Landroid/net/Uri;

    check-cast v7, Ljava/lang/String;

    move-object v0, v1

    check-cast v0, Landroid/net/Uri;

    iget-boolean v1, v9, Lynj;->j:Z

    if-eqz v1, :cond_996

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_9d8

    :cond_996
    if-eqz v0, :cond_9ae

    new-instance v1, Lnwa;

    invoke-direct {v1, v9, v4}, Lnwa;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v9, Lynj;->b:Ldeg;

    invoke-virtual {v2, v0}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object v0

    iget-object v2, v9, Lynj;->c:Lqfl;

    invoke-virtual {v2, v0}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ldwh;->f(Lacl;)V

    iput-object v1, v9, Lynj;->i:Lnwa;

    goto :goto_9d6

    :cond_9ae
    invoke-virtual {v8}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, LJ/N;->MeR1QuE8()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "User-Agent: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, v5}, Lcom/opera/android/browser/SimpleUrlLoader;->a(Ljava/lang/String;Ljava/lang/String;Lyun;)Lcom/opera/android/browser/SimpleUrlLoader;

    move-result-object v0

    iget-object v1, v9, Lynj;->e:Lhoj;

    new-instance v2, Lxnj;

    invoke-direct {v2, v9, v6}, Lxnj;-><init>(Lynj;B)V

    invoke-interface {v1, v0, v7, v2}, Lhoj;->m(Lcom/opera/android/browser/SimpleUrlLoader;Ljava/lang/String;Lxnj;)V

    iput-object v0, v9, Lynj;->h:Lcom/opera/android/browser/SimpleUrlLoader;

    :goto_9d6
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_9d8
    return-object v0

    :pswitch_9d9
    check-cast v9, Ljava/util/List;

    check-cast v8, [Ljava/io/File;

    check-cast v7, Leoj;

    move-object v0, v1

    check-cast v0, Lkotlin/Unit;

    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v9, Ljava/lang/Iterable;

    invoke-interface {v9}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_9ed
    :goto_9ed
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a18

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lx4l;

    invoke-virtual {v2}, Lx4l;->a()Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_9ed

    new-instance v3, Ljava/io/File;

    iget-object v4, v7, Leoj;->c:Livg;

    invoke-virtual {v4}, Livg;->y()Ljava/io/File;

    move-result-object v4

    sget-object v5, Lf8a;->e:Lf8a;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_9ed

    :cond_a18
    array-length v1, v8

    :goto_a19
    if-ge v10, v1, :cond_a29

    aget-object v2, v8, v10

    invoke-interface {v0, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a26

    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    :cond_a26
    add-int/lit8 v10, v10, 0x1

    goto :goto_a19

    :cond_a29
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_a2c
    check-cast v9, Lfnj;

    check-cast v8, Lvnj;

    check-cast v7, Ljava/util/ArrayList;

    move-object v0, v1

    check-cast v0, Lonj;

    if-eqz v0, :cond_ab1

    instance-of v1, v0, Lpnj;

    if-eqz v1, :cond_a87

    iget-object v1, v9, Lfnj;->a:Ljava/util/LinkedHashMap;

    check-cast v0, Lpnj;

    iget-object v2, v0, Lpnj;->c:Lkotlin/jvm/functions/Function1;

    iget-object v3, v0, Lpnj;->b:Llnj;

    iget-object v0, v0, Lpnj;->a:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lifd;

    if-eqz v1, :cond_a6b

    iget-object v4, v8, Lvnj;->e:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    :cond_a53
    :goto_a53
    if-ge v10, v5, :cond_aac

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v10, v10, 0x1

    check-cast v9, Lonj;

    invoke-virtual {v8, v3, v0, v1}, Lvnj;->h(Llnj;Ljava/lang/String;Lifd;)V

    if-eqz v2, :cond_a53

    new-instance v9, Lkotlin/Pair;

    invoke-direct {v9, v2, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a53

    :cond_a6b
    iget-object v1, v9, Lfnj;->c:Ljava/util/LinkedHashSet;

    invoke-interface {v1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a85

    iget-object v1, v9, Lfnj;->a:Ljava/util/LinkedHashMap;

    sget-object v3, Lnnj;->a:Lnnj;

    invoke-interface {v1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v2, :cond_aac

    new-instance v0, Lkotlin/Pair;

    invoke-direct {v0, v2, v3}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_aac

    :cond_a85
    move v6, v10

    goto :goto_aac

    :cond_a87
    instance-of v1, v0, Lsnj;

    if-eqz v1, :cond_a95

    check-cast v0, Lsnj;

    iget-object v1, v0, Lsnj;->a:Ljava/lang/String;

    iget-object v0, v0, Lsnj;->b:Llnj;

    invoke-virtual {v8, v1, v0}, Lvnj;->d(Ljava/lang/String;Llnj;)V

    goto :goto_aac

    :cond_a95
    instance-of v1, v0, Lqnj;

    if-eqz v1, :cond_aa3

    check-cast v0, Lqnj;

    iget-object v1, v0, Lqnj;->a:Ljava/lang/String;

    iget-object v0, v0, Lqnj;->b:Llnj;

    invoke-virtual {v8, v1, v0}, Lvnj;->b(Ljava/lang/String;Llnj;)V

    goto :goto_aac

    :cond_aa3
    instance-of v0, v0, Lrnj;

    if-eqz v0, :cond_ab1

    sget-object v0, Lmnj;->a:Lmnj;

    invoke-virtual {v8}, Lvnj;->c()V

    :cond_aac
    :goto_aac
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    goto :goto_ab4

    :cond_ab1
    invoke-static {}, Lh9o;->p()V

    :goto_ab4
    return-object v5

    :pswitch_ab5
    check-cast v9, Ljava/util/LinkedHashMap;

    check-cast v8, Ljava/util/LinkedHashMap;

    check-cast v7, Lvnj;

    move-object v0, v1

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->longValue()J

    move-result-wide v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v9, v0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Set;

    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_afd

    invoke-interface {v8, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ltnj;

    iget-object v3, v3, Ltnj;->a:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    iget-object v3, v7, Lvnj;->h:Landroid/database/sqlite/SQLiteDatabase;

    if-eqz v3, :cond_aea

    move-object v5, v3

    :cond_aea
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v1

    const-string v2, "icons"

    const-string v3, "id=?"

    invoke-virtual {v5, v2, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-interface {v9, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_afe

    :cond_afd
    move v6, v10

    :goto_afe
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_b03
    check-cast v9, Lwg5;

    check-cast v8, Lwjj;

    check-cast v7, Lah5;

    move-object v0, v1

    check-cast v0, Ljava/lang/Throwable;

    invoke-virtual {v9, v0}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v8, Lwjj;->c:Ljava/lang/Object;

    check-cast v1, Lp04;

    invoke-virtual {v1, v0, v10}, Lp04;->h(Ljava/lang/Throwable;Z)Z

    :goto_b16
    invoke-virtual {v1}, Lp04;->v()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Los4;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_b24

    invoke-virtual {v7, v2, v0}, Lah5;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b16

    :cond_b24
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b27
    check-cast v9, Leyi;

    move-object v12, v8

    check-cast v12, Lhai;

    move-object v0, v7

    check-cast v0, Llqh;

    check-cast v1, Llmg;

    iget-wide v2, v1, Llmg;->c:J

    iget-object v4, v9, Leyi;->d:Ljava/lang/Object;

    check-cast v4, Ldil;

    invoke-virtual {v4}, Ldil;->i()Z

    move-result v5

    if-eqz v5, :cond_b60

    invoke-virtual {v4}, Ldil;->l()Lmil;

    move-result-object v5

    iget-object v5, v5, Lmil;->a:Lsf1;

    iget-object v5, v5, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_b60

    iget-object v5, v4, Ldil;->d:Lgbc;

    if-eqz v5, :cond_b60

    invoke-virtual {v5}, Lgbc;->d()Lojl;

    move-result-object v5

    if-eqz v5, :cond_b60

    invoke-virtual {v4}, Ldil;->l()Lmil;

    move-result-object v8

    const/4 v11, 0x0

    move-object v7, v9

    move-wide v9, v2

    invoke-virtual/range {v7 .. v12}, Leyi;->m(Lmil;JZLhai;)J

    move v10, v6

    :cond_b60
    if-eqz v10, :cond_b67

    invoke-virtual {v1}, Llmg;->a()V

    iput-boolean v6, v0, Llqh;->a:Z

    :cond_b67
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_b6a
    check-cast v9, Lali;

    check-cast v8, Lsmi;

    check-cast v7, Lknl;

    invoke-virtual {v8}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v9, v0, v1}, Lali;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_b91

    iget-object v0, v7, Lknl;->c:Loml;

    if-nez v0, :cond_b94

    iget-object v0, v7, Lknl;->a:Lumi;

    iget-wide v1, v7, Lknl;->b:J

    iget-object v3, v7, Lknl;->d:Lp7l;

    invoke-static {v0, v1, v2, v3}, Lfac;->B(Lumi;JLkotlin/jvm/functions/Function0;)Loml;

    move-result-object v0

    iput-object v0, v7, Lknl;->c:Loml;

    goto :goto_b94

    :cond_b91
    invoke-virtual {v7}, Lknl;->c()V

    :cond_b94
    :goto_b94
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    nop

    :pswitch_data_b98
    .packed-switch 0x0
        :pswitch_b6a
        :pswitch_b27
        :pswitch_b03
        :pswitch_ab5
        :pswitch_a2c
        :pswitch_9d9
        :pswitch_986
        :pswitch_93d
        :pswitch_90a
        :pswitch_8ae
        :pswitch_83b
        :pswitch_73f
        :pswitch_6ec
        :pswitch_6d0
        :pswitch_1ed
        :pswitch_8e
        :pswitch_89
        :pswitch_74
        :pswitch_4c
        :pswitch_47
        :pswitch_42
    .end packed-switch

    :pswitch_data_bc6
    .packed-switch 0x0
        :pswitch_69c
        :pswitch_66a
        :pswitch_627
        :pswitch_5e3
        :pswitch_5de
        :pswitch_5d9
        :pswitch_5d4
        :pswitch_5cf
        :pswitch_5b1
        :pswitch_593
        :pswitch_57c
        :pswitch_565
        :pswitch_6cd
        :pswitch_54e
        :pswitch_537
        :pswitch_524
        :pswitch_50b
        :pswitch_504
        :pswitch_4fd
        :pswitch_4f6
        :pswitch_4e4
        :pswitch_4d2
        :pswitch_4c0
        :pswitch_4b0
        :pswitch_49e
        :pswitch_48c
        :pswitch_473
        :pswitch_46b
        :pswitch_463
        :pswitch_449
        :pswitch_42f
        :pswitch_415
        :pswitch_3fb
        :pswitch_3e5
        :pswitch_3c9
        :pswitch_383
        :pswitch_33d
        :pswitch_335
        :pswitch_32d
        :pswitch_325
        :pswitch_31d
        :pswitch_2fd
        :pswitch_2dd
        :pswitch_2bf
        :pswitch_299
        :pswitch_281
        :pswitch_237
        :pswitch_203
        :pswitch_6cd
    .end packed-switch
.end method
