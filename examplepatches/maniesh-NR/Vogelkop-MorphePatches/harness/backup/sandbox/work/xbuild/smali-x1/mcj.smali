.class public final Lmcj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Loeb;
.implements Lybf;
.implements Lfd2;
.implements Lkl9;
.implements Lbcf;
.implements Lmmn;
.implements Lylo;
.implements La2i;


# instance fields
.field public final a:Ljava/lang/Object;

.field public b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 6

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Lnrl;

    const/16 v1, 0x1a

    invoke-direct {v0, v1}, Lnrl;-><init>(B)V

    iput-object v0, p0, Lmcj;->b:Ljava/lang/Object;

    .line 79
    new-instance v0, Lzzh;

    const/16 v1, 0xb

    invoke-direct {v0, p0, v1}, Lzzh;-><init>(Ljava/lang/Object;B)V

    .line 80
    new-instance v1, Lb94;

    const/4 v2, 0x0

    invoke-direct {v1, p2, v0, v2}, Lb94;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 v0, 0x1

    .line 81
    new-array v0, v0, [Lbg1;

    aput-object v1, v0, v2

    .line 82
    const-string v1, "ps"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lmcj;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/Window;)V
    .registers 3

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lmcj;->a:Ljava/lang/Object;

    .line 76
    iput-object p1, p0, Lmcj;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroidx/viewpager/widget/ViewPager;)V
    .registers 2

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmcj;->b:Ljava/lang/Object;

    .line 85
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lmcj;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/ad/interstitial/AdActivity;I)V
    .registers 7

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/app/Dialog;

    const v1, 0x7f15001b

    invoke-direct {v0, p1, v1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lmcj;->a:Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v1, p2, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    iput-object p2, p0, Lmcj;->b:Ljava/lang/Object;

    invoke-virtual {v0, p2}, Landroid/app/Dialog;->setContentView(Landroid/view/View;)V

    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_3c

    const/16 p2, 0x30

    invoke-virtual {p0, p2}, Landroid/view/Window;->setGravity(I)V

    const/4 p2, -0x1

    const/4 v0, -0x2

    invoke-virtual {p0, p2, v0}, Landroid/view/Window;->setLayout(II)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06003d

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/Window;->setStatusBarColor(I)V

    :cond_3c
    return-void
.end method

.method public constructor <init>(Lctp;)V
    .registers 4

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lmcj;->b:Ljava/lang/Object;

    iput-object p1, p0, Lmcj;->a:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lh61;Lvlo;Lrgh;)V
    .registers 4

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmcj;->a:Ljava/lang/Object;

    iput-object p2, p0, Lmcj;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 68
    iput-object p1, p0, Lmcj;->a:Ljava/lang/Object;

    iput-object p2, p0, Lmcj;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 4

    .line 69
    iput-object p1, p0, Lmcj;->b:Ljava/lang/Object;

    iput-object p2, p0, Lmcj;->a:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lnak;Lnak;Ljava/util/List;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lmcj;->a:Ljava/lang/Object;

    const/16 p3, 0xa

    const/4 v0, 0x0

    if-eqz p4, :cond_35

    sget-object p1, Lnsl;->l:Lh58;

    new-instance p2, Ljava/util/ArrayList;

    invoke-static {p1, p3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p3

    invoke-direct {p2, p3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {p1, p1}, Lsko;->e(Lh58;Lh58;)Lw4;

    move-result-object p1

    :goto_19
    invoke-virtual {p1}, Lw4;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_2e

    invoke-virtual {p1}, Lw4;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lnsl;

    new-instance p4, Losl;

    invoke-direct {p4, p3, v0, v0}, Losl;-><init>(Lnsl;ZZ)V

    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_19

    :cond_2e
    new-instance p1, Lxd6;

    const/4 p3, 0x7

    invoke-direct {p1, p2, p3}, Lxd6;-><init>(Ljava/lang/Object;B)V

    goto :goto_41

    :cond_35
    new-instance p4, Lx11;

    const/4 v1, 0x0

    invoke-direct {p4, p3, v1, p0}, Lx11;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance p3, Lya9;

    invoke-direct {p3, p1, p2, p4, v0}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object p1, p3

    :goto_41
    iput-object p1, p0, Lmcj;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lorg/chromium/content_public/browser/WebContents;)V
    .registers 2

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lmcj;->a:Ljava/lang/Object;

    .line 73
    invoke-interface {p1}, Lorg/chromium/content_public/browser/WebContents;->k0()Lorg/chromium/ui/base/WindowAndroid;

    move-result-object p1

    iput-object p1, p0, Lmcj;->b:Ljava/lang/Object;

    return-void
.end method

.method public static g(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 3

    const-wide v0, 0x3f91df46a2529d39L    # 0.017453292519943295

    invoke-static {v0, v1}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-static {p0}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method

.method public static i(Ljava/math/BigDecimal;Ljava/util/Calendar;)Ljava/util/Calendar;
    .registers 10

    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    invoke-virtual {p1}, Ljava/util/Calendar;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Calendar;

    sget-object v1, Ljava/math/BigDecimal;->ZERO:Ljava/math/BigDecimal;

    invoke-virtual {p0, v1}, Ljava/math/BigDecimal;->compareTo(Ljava/math/BigDecimal;)I

    move-result v2

    const/4 v3, -0x1

    const/16 v4, 0xb

    if-ne v2, v3, :cond_24

    const-wide/high16 v2, 0x4038000000000000L    # 24.0

    invoke-static {v2, v3}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    const/16 v2, -0x18

    invoke-virtual {v0, v4, v2}, Ljava/util/Calendar;->add(II)V

    :cond_24
    invoke-virtual {p0}, Ljava/math/BigDecimal;->toPlainString()Ljava/lang/String;

    move-result-object p0

    const-string v2, "\\."

    invoke-virtual {p0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    const/4 v2, 0x0

    aget-object v3, p0, v2

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    new-instance v5, Ljava/math/BigDecimal;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "0."

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v7, 0x1

    aget-object p0, p0, v7

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v5, p0}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    const-wide/16 v6, 0x3c

    invoke-static {v6, v7}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {v5, p0}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object p0

    sget-object v5, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    invoke-virtual {p0, v2, v5}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigDecimal;->intValue()I

    move-result v5

    const/16 v6, 0x3c

    if-ne v5, v6, :cond_66

    add-int/lit8 v3, v3, 0x1

    goto :goto_67

    :cond_66
    move-object v1, p0

    :goto_67
    const/16 p0, 0x18

    if-ne v3, p0, :cond_6c

    move v3, v2

    :cond_6c
    invoke-virtual {v0, v4, v3}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xc

    invoke-virtual {v1}, Ljava/math/BigDecimal;->intValue()I

    move-result v1

    invoke-virtual {v0, p0, v1}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xd

    invoke-virtual {v0, p0, v2}, Ljava/util/Calendar;->set(II)V

    const/16 p0, 0xe

    invoke-virtual {v0, p0, v2}, Ljava/util/Calendar;->set(II)V

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeZone()Ljava/util/TimeZone;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    return-object v0
.end method

.method public static s(Landroid/view/Window;Z)Z
    .registers 3

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    if-eqz p1, :cond_d

    or-int/lit8 p1, v0, 0x10

    goto :goto_f

    :cond_d
    and-int/lit8 p1, v0, -0x11

    :goto_f
    if-ne v0, p1, :cond_13

    const/4 p0, 0x0

    return p0

    :cond_13
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    const/4 p0, 0x1

    return p0
.end method

.method public static u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;
    .registers 3

    const/4 v0, 0x4

    sget-object v1, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    invoke-virtual {p0, v0, v1}, Ljava/math/BigDecimal;->setScale(ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a()Ljava/lang/Object;
    .registers 4

    iget-object v0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Lh61;

    iget-object v0, v0, Lh61;->a:Landroid/content/Context;

    iget-object p0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast p0, Lvlo;

    invoke-virtual {p0}, Lvlo;->a()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ligp;

    new-instance v1, Lyfp;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lyfp;-><init>(B)V

    new-instance v2, Lolo;

    invoke-direct {v2, v0, p0, v1}, Lolo;-><init>(Landroid/content/Context;Ligp;Lyfp;)V

    return-object v2
.end method

.method public final b(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    check-cast p1, Ljava/lang/Void;

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iget-object p0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SystemSettings;

    iget-object p0, p0, Lcom/opera/android/settings/SystemSettings;->a:Landroid/content/ContentResolver;

    const-string v0, "show_password"

    const/4 v1, 0x1

    invoke-static {p0, v0, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result p0

    if-eq p0, v1, :cond_17

    const/4 v1, 0x0

    :cond_17
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public final c()I
    .registers 1

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Ln3k;

    invoke-virtual {p0}, Ln3k;->getAsInt()I

    move-result p0

    return p0
.end method

.method public final d(Lilm;)V
    .registers 5

    iget-object v0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Ls14;

    iget-object v0, v0, Ls14;->c:Ljava/lang/Object;

    check-cast v0, Lqln;

    iget-object v0, v0, Lqln;->f:Lami;

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    new-instance v1, Lilm;

    const/16 v2, 0xe

    invoke-direct {v1, p1, v2}, Lilm;-><init>(Ljava/lang/Object;B)V

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lami;->k(Ljava/lang/String;ILcom/opera/api/Callback;)V

    return-void
.end method

.method public final e(Lxco;Ljava/util/Calendar;Z)Ljava/math/BigDecimal;
    .registers 29

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-object v2, v0, Lmcj;->a:Ljava/lang/Object;

    check-cast v2, Lpad;

    iget-object v0, v0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/TimeZone;

    invoke-virtual {v1, v0}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    const/4 v3, 0x6

    if-eqz p3, :cond_14

    move v4, v3

    goto :goto_16

    :cond_14
    const/16 v4, 0x12

    :goto_16
    int-to-long v4, v4

    invoke-static {v4, v5}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v4

    iget-object v5, v2, Lpad;->c:Ljava/lang/Object;

    check-cast v5, Ljava/math/BigDecimal;

    const-wide/16 v6, 0xf

    invoke-static {v6, v7}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v8

    sget-object v9, Ljava/math/RoundingMode;->HALF_EVEN:Ljava/math/RoundingMode;

    const/4 v10, 0x4

    invoke-virtual {v5, v8, v10, v9}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    const-wide/16 v11, 0x18

    invoke-static {v11, v12}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v4, v5, v10, v9}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v4

    new-instance v5, Ljava/math/BigDecimal;

    invoke-virtual {v1, v3}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-direct {v5, v3}, Ljava/math/BigDecimal;-><init>(I)V

    invoke-virtual {v5, v4}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-static {v3}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    new-instance v4, Ljava/math/BigDecimal;

    const-string v5, "0.9856"

    invoke-direct {v4, v5}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v3}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-static {v4}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    new-instance v5, Ljava/math/BigDecimal;

    const-string v8, "3.289"

    invoke-direct {v5, v8}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-static {v4}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    new-instance v5, Ljava/math/BigDecimal;

    invoke-static {v4}, Lmcj;->g(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v8

    invoke-virtual {v8}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    invoke-direct {v5, v13, v14}, Ljava/math/BigDecimal;-><init>(D)V

    new-instance v8, Ljava/math/BigDecimal;

    invoke-static {v4}, Lmcj;->g(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v13

    const-wide/16 v14, 0x2

    invoke-static {v14, v15}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v13

    invoke-static {v13}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v13

    invoke-virtual {v13}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v13

    invoke-direct {v8, v13, v14}, Ljava/math/BigDecimal;-><init>(D)V

    new-instance v13, Ljava/math/BigDecimal;

    const-string v14, "1.916"

    invoke-direct {v13, v14}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v13}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-static {v5}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    new-instance v5, Ljava/math/BigDecimal;

    const-string v13, "0.020"

    invoke-direct {v5, v13}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v8, v5}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-static {v5}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    new-instance v8, Ljava/math/BigDecimal;

    const-string v13, "282.634"

    invoke-direct {v8, v13}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v4}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v13

    const-wide v15, 0x4076800000000000L    # 360.0

    cmpl-double v5, v13, v15

    const-wide/16 v13, 0x168

    if-lez v5, :cond_e1

    invoke-static {v13, v14}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    :cond_e1
    invoke-static {v4}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-static {v4}, Lmcj;->g(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v17

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->sin(D)D

    move-result-wide v17

    invoke-static/range {v17 .. v18}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v5

    new-instance v8, Ljava/math/BigDecimal;

    move-wide/from16 v17, v6

    const-string v6, "0.39782"

    invoke-direct {v8, v6}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-static {v5}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->asin(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-static {v6}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    move-object/from16 v7, p1

    iget-object v7, v7, Lxco;->a:Ljava/math/BigDecimal;

    invoke-static {v7}, Lmcj;->g(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v7}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v7

    iget-object v8, v2, Lpad;->b:Ljava/lang/Object;

    check-cast v8, Ljava/math/BigDecimal;

    invoke-static {v8}, Lmcj;->g(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->sin(D)D

    move-result-wide v19

    move-wide/from16 v21, v11

    invoke-static/range {v19 .. v20}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v11

    invoke-static {v8}, Lmcj;->g(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v8

    invoke-virtual {v8}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->cos(D)D

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v8

    invoke-virtual {v5, v11}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v6, v8}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v5, v6, v10, v9}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-static {v5}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-virtual {v5}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v6

    const-wide/high16 v11, -0x4010000000000000L    # -1.0

    cmpg-double v6, v6, v11

    if-ltz v6, :cond_2ed

    invoke-virtual {v5}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v6

    const-wide/high16 v11, 0x3ff0000000000000L    # 1.0

    cmpl-double v6, v6, v11

    if-gtz v6, :cond_2ed

    invoke-virtual {v5}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Math;->acos(D)D

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/math/BigDecimal;->valueOf(D)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-static {v5}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    new-instance v6, Ljava/math/BigDecimal;

    const-wide v7, 0x404ca5dc1a63c1f8L    # 57.29577951308232

    invoke-direct {v6, v7, v8}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-virtual {v5, v6}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    invoke-static {v5}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    if-eqz p3, :cond_1b0

    invoke-static {v13, v14}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v5

    :cond_1b0
    invoke-static/range {v17 .. v18}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v5, v6, v10, v9}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v5

    new-instance v6, Ljava/math/BigDecimal;

    invoke-static {v4}, Lmcj;->g(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v11

    invoke-virtual {v11}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Math;->tan(D)D

    move-result-wide v11

    invoke-direct {v6, v11, v12}, Ljava/math/BigDecimal;-><init>(D)V

    new-instance v11, Ljava/math/BigDecimal;

    invoke-direct {v11, v7, v8}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-virtual {v6, v11}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-static {v6}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    new-instance v11, Ljava/math/BigDecimal;

    const-string v12, "0.91764"

    invoke-direct {v11, v12}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v11}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-static {v6}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    new-instance v11, Ljava/math/BigDecimal;

    invoke-static {v6}, Lmcj;->g(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v19

    move-wide/from16 v23, v13

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->atan(D)D

    move-result-wide v13

    invoke-direct {v11, v13, v14}, Ljava/math/BigDecimal;-><init>(D)V

    new-instance v6, Ljava/math/BigDecimal;

    invoke-direct {v6, v7, v8}, Ljava/math/BigDecimal;-><init>(D)V

    invoke-virtual {v11, v6}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-static {v6}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-static {v6}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v6}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    const-wide/16 v11, 0x0

    cmpg-double v7, v7, v11

    if-gez v7, :cond_21c

    invoke-static/range {v23 .. v24}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    goto :goto_22c

    :cond_21c
    invoke-virtual {v6}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    cmpl-double v7, v7, v15

    if-lez v7, :cond_22c

    invoke-static/range {v23 .. v24}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v6

    :cond_22c
    :goto_22c
    const-wide/16 v7, 0x5a

    invoke-static {v7, v8}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v7

    sget-object v8, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    const/4 v13, 0x0

    invoke-virtual {v4, v7, v13, v8}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v6, v7, v13, v8}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-static/range {v17 .. v18}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v6

    invoke-virtual {v4, v6, v10, v9}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v4

    new-instance v6, Ljava/math/BigDecimal;

    const-string v7, "0.06571"

    invoke-direct {v6, v7}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v6}, Ljava/math/BigDecimal;->multiply(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v5, v4}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    new-instance v4, Ljava/math/BigDecimal;

    const-string v5, "6.622"

    invoke-direct {v4, v5}, Ljava/math/BigDecimal;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v3}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v4

    cmpg-double v4, v4, v11

    const-wide/high16 v5, 0x4038000000000000L    # 24.0

    if-gez v4, :cond_286

    invoke-static/range {v21 .. v22}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    goto :goto_296

    :cond_286
    invoke-virtual {v3}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v7

    cmpl-double v4, v7, v5

    if-lez v4, :cond_296

    invoke-static/range {v21 .. v22}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    :cond_296
    :goto_296
    invoke-static {v3}, Lmcj;->u(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v3

    iget-object v2, v2, Lpad;->c:Ljava/lang/Object;

    check-cast v2, Ljava/math/BigDecimal;

    invoke-static/range {v17 .. v18}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v4

    invoke-virtual {v2, v4, v10, v9}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    new-instance v3, Ljava/math/BigDecimal;

    const/16 v4, 0xf

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/math/BigDecimal;-><init>(I)V

    new-instance v4, Ljava/math/BigDecimal;

    const v7, 0x36ee80

    invoke-direct {v4, v7}, Ljava/math/BigDecimal;-><init>(I)V

    new-instance v7, Ljava/math/MathContext;

    const/4 v8, 0x2

    invoke-direct {v7, v8}, Ljava/math/MathContext;-><init>(I)V

    invoke-virtual {v3, v4, v7}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;Ljava/math/MathContext;)Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/TimeZone;->inDaylightTime(Ljava/util/Date;)Z

    move-result v0

    if-eqz v0, :cond_2db

    sget-object v0, Ljava/math/BigDecimal;->ONE:Ljava/math/BigDecimal;

    invoke-virtual {v2, v0}, Ljava/math/BigDecimal;->add(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v2

    :cond_2db
    invoke-virtual {v2}, Ljava/math/BigDecimal;->doubleValue()D

    move-result-wide v0

    cmpl-double v0, v0, v5

    if-lez v0, :cond_2ec

    invoke-static/range {v21 .. v22}, Ljava/math/BigDecimal;->valueOf(J)Ljava/math/BigDecimal;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/math/BigDecimal;->subtract(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    move-result-object v0

    return-object v0

    :cond_2ec
    return-object v2

    :cond_2ed
    const/4 v0, 0x0

    return-object v0
.end method

.method public final f()I
    .registers 1

    iget-object p0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast p0, Ln3k;

    invoke-virtual {p0}, Ln3k;->getAsInt()I

    move-result p0

    return p0
.end method

.method public final h(Lzhj;)V
    .registers 3

    iget-object v0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Lqim;

    invoke-virtual {v0}, Lqim;->b()Z

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Ldx3;

    invoke-interface {p0, p1}, Lkl9;->h(Lzhj;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Lqim;->e(Z)V

    return-void
.end method

.method public final j()V
    .registers 3

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Li7f;

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    :goto_9
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_28

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljje;

    iget-byte v1, p0, Ljje;->a:B

    iget-object p0, p0, Ljje;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_2a

    check-cast p0, Lp8f;

    invoke-virtual {p0}, Lp8f;->L()V

    goto :goto_9

    :pswitch_22
    check-cast p0, Lx77;

    invoke-virtual {p0}, Lx77;->q()V

    goto :goto_9

    :cond_28
    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_22
    .end packed-switch
.end method

.method public final k()Lcom/google/android/gms/tasks/Task;
    .registers 9

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Lctp;

    iget-object v0, p0, Lctp;->b:Ljava/lang/String;

    sget-object v1, Lctp;->c:Lm20;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v2, "requestInAppReview (%s)"

    invoke-virtual {v1, v2, v0}, Lm20;->b(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lctp;->a:Lsup;

    if-nez v0, :cond_6f

    const/4 p0, 0x0

    new-array p0, p0, [Ljava/lang/Object;

    const-string v0, "PlayCore"

    const/4 v2, 0x6

    invoke-static {v0, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, v1, Lm20;->b:Ljava/lang/String;

    const-string v1, "Play Store app is either not installed or not the official version"

    invoke-static {v0, v1, p0}, Lm20;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    :cond_28
    new-instance p0, Ly1i;

    new-instance v0, Lcom/google/android/gms/common/api/Status;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sget-object v4, Lpop;->a:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_44

    const-string v4, ""

    goto :goto_5a

    :cond_44
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    sget-object v6, Lpop;->b:Ljava/util/HashMap;

    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    const-string v6, " (https://developer.android.com/reference/com/google/android/play/core/review/model/ReviewErrorCode.html#"

    const-string v7, ")"

    invoke-static {v4, v6, v5, v7}, Lp3p;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    :goto_5a
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Review Error(%d): %s"

    invoke-static {v1, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v2, v1}, Lcom/google/android/gms/common/api/Status;-><init>(ILjava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/google/android/gms/common/api/ApiException;-><init>(Lcom/google/android/gms/common/api/Status;)V

    invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0

    :cond_6f
    new-instance v1, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-direct {v1}, Lcom/google/android/gms/tasks/TaskCompletionSource;-><init>()V

    new-instance v2, Ljsp;

    invoke-direct {v2, p0, v1, v1}, Ljsp;-><init>(Lctp;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/tasks/TaskCompletionSource;)V

    new-instance p0, Lntp;

    invoke-direct {p0, v0, v1, v1, v2}, Lntp;-><init>(Lsup;Lcom/google/android/gms/tasks/TaskCompletionSource;Lcom/google/android/gms/tasks/TaskCompletionSource;Ljsp;)V

    invoke-virtual {v0}, Lsup;->a()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-virtual {v1}, Lcom/google/android/gms/tasks/TaskCompletionSource;->getTask()Lcom/google/android/gms/tasks/Task;

    move-result-object p0

    return-object p0
.end method

.method public final l(I)V
    .registers 3

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "giveaway_eligibility"

    invoke-static {p0, v0, p1}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    return-void
.end method

.method public final l0(Landroid/view/View;Lg3o;)Lg3o;
    .registers 8

    iget-object v0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    invoke-static {p1, p2}, Lr5n;->h(Landroid/view/View;Lg3o;)Lg3o;

    move-result-object p1

    iget-object p2, p1, Lg3o;->a:Ld3o;

    invoke-virtual {p2}, Ld3o;->s()Z

    move-result p2

    if-eqz p2, :cond_11

    return-object p1

    :cond_11
    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Rect;

    invoke-virtual {p1}, Lg3o;->b()I

    move-result p2

    iput p2, p0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p1}, Lg3o;->d()I

    move-result p2

    iput p2, p0, Landroid/graphics/Rect;->top:I

    invoke-virtual {p1}, Lg3o;->c()I

    move-result p2

    iput p2, p0, Landroid/graphics/Rect;->right:I

    invoke-virtual {p1}, Lg3o;->a()I

    move-result p2

    iput p2, p0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p2

    const/4 v1, 0x0

    :goto_32
    if-ge v1, p2, :cond_6f

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1}, Lr5n;->c(Landroid/view/View;Lg3o;)Lg3o;

    move-result-object v2

    invoke-virtual {v2}, Lg3o;->b()I

    move-result v3

    iget v4, p0, Landroid/graphics/Rect;->left:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p0, Landroid/graphics/Rect;->left:I

    invoke-virtual {v2}, Lg3o;->d()I

    move-result v3

    iget v4, p0, Landroid/graphics/Rect;->top:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p0, Landroid/graphics/Rect;->top:I

    invoke-virtual {v2}, Lg3o;->c()I

    move-result v3

    iget v4, p0, Landroid/graphics/Rect;->right:I

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, p0, Landroid/graphics/Rect;->right:I

    invoke-virtual {v2}, Lg3o;->a()I

    move-result v2

    iget v3, p0, Landroid/graphics/Rect;->bottom:I

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iput v2, p0, Landroid/graphics/Rect;->bottom:I

    add-int/lit8 v1, v1, 0x1

    goto :goto_32

    :cond_6f
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x24

    if-lt p2, v0, :cond_7b

    new-instance p2, Lt2o;

    invoke-direct {p2, p1}, Lt2o;-><init>(Lg3o;)V

    goto :goto_a8

    :cond_7b
    const/16 v0, 0x23

    if-lt p2, v0, :cond_85

    new-instance p2, Ls2o;

    invoke-direct {p2, p1}, Ls2o;-><init>(Lg3o;)V

    goto :goto_a8

    :cond_85
    const/16 v0, 0x22

    if-lt p2, v0, :cond_8f

    new-instance p2, Lr2o;

    invoke-direct {p2, p1}, Lr2o;-><init>(Lg3o;)V

    goto :goto_a8

    :cond_8f
    const/16 v0, 0x1f

    if-lt p2, v0, :cond_99

    new-instance p2, Lq2o;

    invoke-direct {p2, p1}, Lq2o;-><init>(Lg3o;)V

    goto :goto_a8

    :cond_99
    const/16 v0, 0x1e

    if-lt p2, v0, :cond_a3

    new-instance p2, Lp2o;

    invoke-direct {p2, p1}, Lp2o;-><init>(Lg3o;)V

    goto :goto_a8

    :cond_a3
    new-instance p2, Lo2o;

    invoke-direct {p2, p1}, Lo2o;-><init>(Lg3o;)V

    :goto_a8
    iget p1, p0, Landroid/graphics/Rect;->left:I

    iget v0, p0, Landroid/graphics/Rect;->top:I

    iget v1, p0, Landroid/graphics/Rect;->right:I

    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    invoke-static {p1, v0, v1, p0}, Lr9b;->c(IIII)Lr9b;

    move-result-object p0

    invoke-virtual {p2, p0}, Lo2o;->h(Lr9b;)V

    invoke-virtual {p2}, Lo2o;->b()Lg3o;

    move-result-object p0

    return-object p0
.end method

.method public final m(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "giveaway_subscription"

    invoke-static {p0, v0, p1}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final n(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "info_data"

    invoke-static {p0, v0, p1}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final o(Z)V
    .registers 3

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "stale"

    invoke-static {p0, v0, p1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    return-void
.end method

.method public final onResult(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Ljava/util/HashMap;

    iget-object v0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SystemSettings;

    iput-object p1, v0, Lcom/opera/android/settings/SystemSettings;->c:Ljava/util/HashMap;

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Lqt3;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lqt3;->run()V

    :cond_11
    return-void
.end method

.method public final p(J)V
    .registers 4

    iget-object p0, p0, Lmcj;->a:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "last_request"

    invoke-interface {p0, v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final q()Lneb;
    .registers 4

    new-instance v0, Llcj;

    new-instance v1, Llld;

    const/16 v2, 0x1a

    invoke-direct {v1, p0, v2}, Llld;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Llcj;-><init>(Llld;)V

    return-object v0
.end method

.method public final r(Z)V
    .registers 3

    iget-object v0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/Window;

    invoke-static {v0, p1}, Lmcj;->s(Landroid/view/Window;Z)Z

    move-result p1

    if-eqz p1, :cond_d

    invoke-virtual {p0}, Lmcj;->j()V

    :cond_d
    return-void
.end method

.method public final t(Z)V
    .registers 4

    iget-object v0, p0, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Landroid/view/Window;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v1

    if-eqz p1, :cond_11

    or-int/lit16 p1, v1, 0x2000

    goto :goto_13

    :cond_11
    and-int/lit16 p1, v1, -0x2001

    :goto_13
    if-ne v1, p1, :cond_16

    return-void

    :cond_16
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    invoke-virtual {p0}, Lmcj;->j()V

    return-void
.end method
