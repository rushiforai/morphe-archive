.class public Lcom/p1/mobile/putong/core/util/CertificationUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/view/Window;)V
    .locals 1

    .line 1
    sget v0, Ll/lgc0;->a:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/view/Window;->setWindowAnimations(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Ll/pej0;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_verification_explain_close"

    .line 2
    .line 3
    const-string v0, "p_verification_explain"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pej0;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const-string p1, "e_verification_explain_go"

    .line 2
    .line 3
    const-string v0, "p_verification_explain"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 v0, 0x0

    .line 17
    const-string v1, "popup"

    .line 18
    .line 19
    invoke-interface {p1, p0, v0, v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->dn(Landroid/content/Context;ZLjava/lang/String;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic d(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e(Lcom/p1/mobile/putong/data/User;)I
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    sget p0, Ll/tbc0;->j:I

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_5

    .line 29
    .line 30
    sget p0, Ll/tbc0;->c:I

    .line 31
    .line 32
    return p0

    .line 33
    :cond_1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->w()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    sget p0, Ll/tbc0;->i:I

    .line 54
    .line 55
    return p0

    .line 56
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_5

    .line 61
    .line 62
    sget p0, Ll/tbc0;->b:I

    .line 63
    .line 64
    return p0

    .line 65
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    sget p0, Ll/tbc0;->o:I

    .line 72
    .line 73
    return p0

    .line 74
    :cond_4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-eqz p0, :cond_5

    .line 79
    .line 80
    sget p0, Ll/tbc0;->h:I

    .line 81
    .line 82
    return p0

    .line 83
    :cond_5
    const/4 p0, -0x1

    .line 84
    return p0
.end method

.method public static f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;Z)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static g(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;Z)Landroid/view/View;
    .locals 11

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    move-result-object v0

    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    move-result-object v0

    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    sget-object v0, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->BOTTOM_SHEET:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-eq p2, v0, :cond_7

    .line 2
    sget-object p3, Lcom/p1/mobile/android/ui/label/LabelStyle;->MAX:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->CARD:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-ne p2, v0, :cond_0

    goto :goto_0

    .line 4
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->PROFILE:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-ne p2, v0, :cond_1

    .line 5
    sget-object p3, Lcom/p1/mobile/android/ui/label/LabelStyle;->MIDDLE:Lcom/p1/mobile/android/ui/label/LabelStyle;

    goto :goto_0

    .line 6
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->IM:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-ne p2, v0, :cond_2

    .line 7
    sget-object p3, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    goto :goto_0

    .line 8
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->IM_EXP:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-ne p2, v0, :cond_3

    .line 9
    sget-object p3, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 10
    :cond_3
    :goto_0
    invoke-static {p0, p3}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->a(Landroid/content/Context;Lcom/p1/mobile/android/ui/label/LabelStyle;)Lcom/p1/mobile/android/ui/label/CommonLabelView;

    move-result-object p0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    move-result p2

    if-eqz p2, :cond_4

    .line 12
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    move-result-object p1

    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    sget-object p3, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->ID_VERIFIED:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 13
    invoke-virtual {p1, p2, p3}, Ll/t8r;->c(Lcom/p1/mobile/android/ui/label/LabelModule;Ll/zvl;)Ll/r8r;

    move-result-object p1

    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g(Ll/r8r;)V

    return-object p0

    .line 15
    :cond_4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 16
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    move-result-object p1

    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    sget-object p3, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->AVATAR_VERIFIED:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 17
    invoke-virtual {p1, p2, p3}, Ll/t8r;->c(Lcom/p1/mobile/android/ui/label/LabelModule;Ll/zvl;)Ll/r8r;

    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g(Ll/r8r;)V

    return-object p0

    .line 19
    :cond_5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isStudentVerified()Z

    move-result p1

    if-eqz p1, :cond_6

    .line 20
    invoke-static {}, Ll/t8r;->a()Ll/t8r;

    move-result-object p1

    sget-object p2, Lcom/p1/mobile/android/ui/label/LabelModule;->CORE:Lcom/p1/mobile/android/ui/label/LabelModule;

    sget-object p3, Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;->STUDENT:Lcom/p1/mobile/putong/core/ui/label/CoreLabelTag;

    .line 21
    invoke-virtual {p1, p2, p3}, Ll/t8r;->c(Lcom/p1/mobile/android/ui/label/LabelModule;Ll/zvl;)Ll/r8r;

    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/ui/label/CommonLabelView;->g(Ll/r8r;)V

    return-object p0

    :cond_6
    return-object v1

    .line 23
    :cond_7
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v2, Ll/afc0;->b:I

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lv/VLinear;

    .line 24
    sget v2, Ll/odc0;->q:I

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lv/VImage;

    .line 25
    sget v4, Ll/odc0;->u:I

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lv/VText;

    const/4 v5, 0x3

    .line 26
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 27
    sget v5, Ll/tbc0;->q:I

    .line 28
    invoke-static {p0, v5}, Ll/j26;->e(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 29
    instance-of v5, p0, Landroid/graphics/drawable/GradientDrawable;

    if-nez v5, :cond_8

    return-object v1

    .line 30
    :cond_8
    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    .line 31
    sget-object v5, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->CARD:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    const/high16 v6, 0x40c00000    # 6.0f

    if-eq p2, v5, :cond_c

    sget-object v7, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->BOTTOM_SHEET:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-ne p2, v7, :cond_9

    goto :goto_1

    .line 32
    :cond_9
    sget-object v7, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->PROFILE:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-ne p2, v7, :cond_a

    .line 33
    sget v7, Ll/tbc0;->l:I

    .line 34
    sget v8, Ll/tbc0;->e:I

    .line 35
    sget v9, Ll/tbc0;->s:I

    .line 36
    invoke-static {v6}, Ll/qa00;->d(F)I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {p0, v10}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    goto :goto_2

    .line 37
    :cond_a
    sget-object v7, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->IM:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-ne p2, v7, :cond_b

    .line 38
    sget v7, Ll/tbc0;->k:I

    .line 39
    sget v8, Ll/tbc0;->d:I

    .line 40
    sget v9, Ll/tbc0;->r:I

    const/high16 v10, 0x40800000    # 4.0f

    .line 41
    invoke-static {v10}, Ll/qa00;->d(F)I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {p0, v10}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    goto :goto_2

    :cond_b
    return-object v1

    .line 42
    :cond_c
    :goto_1
    sget v7, Ll/tbc0;->m:I

    .line 43
    sget v8, Ll/tbc0;->f:I

    .line 44
    sget v9, Ll/tbc0;->t:I

    if-eqz p3, :cond_d

    .line 45
    sget v7, Ll/tbc0;->n:I

    .line 46
    sget v8, Ll/tbc0;->g:I

    .line 47
    sget v9, Ll/tbc0;->u:I

    .line 48
    :cond_d
    invoke-static {v6}, Ll/qa00;->d(F)I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {p0, v10}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 49
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    move-result v10

    if-eqz v10, :cond_e

    .line 50
    invoke-virtual {v2, v7}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 51
    const-string p1, "\u5b9e\u540d\u00b7\u5934\u50cf\u672c\u4eba"

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 52
    const-string p1, "#FFFFBB00"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    if-eqz p3, :cond_10

    .line 53
    const-string p1, "#FFDF8D"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 54
    const-string p1, "#774800"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_3

    .line 55
    :cond_e
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    move-result v7

    if-eqz v7, :cond_f

    .line 56
    invoke-virtual {v2, v8}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 57
    const-string p1, "\u5934\u50cf\u672c\u4eba"

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    const-string p1, "#FF2BCCFF"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    if-eqz p3, :cond_10

    .line 59
    const-string p1, "#ACEBFF"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 60
    const-string p1, "#0C7292"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_3

    .line 61
    :cond_f
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isStudentVerified()Z

    move-result p1

    if-eqz p1, :cond_16

    .line 62
    invoke-virtual {v2, v9}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 63
    const-string p1, "\u5b66\u751f"

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 64
    const-string p1, "#FF00DAE3"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    if-eqz p3, :cond_10

    .line 65
    const-string p1, "#AAFCFF"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 66
    const-string p1, "#00858A"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v4, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 67
    :cond_10
    :goto_3
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 68
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    if-nez p0, :cond_11

    .line 69
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 p1, -0x2

    invoke-direct {p0, p1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 70
    :cond_11
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    const/high16 p3, 0x41400000    # 12.0f

    if-eq p2, v5, :cond_14

    .line 71
    sget-object v1, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->BOTTOM_SHEET:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-ne p2, v1, :cond_12

    goto :goto_4

    .line 72
    :cond_12
    sget-object v1, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->PROFILE:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    const/high16 v5, 0x40a00000    # 5.0f

    const/high16 v7, 0x41200000    # 10.0f

    if-ne p2, v1, :cond_13

    .line 73
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 74
    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 75
    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 p2, 0x41a00000    # 20.0f

    .line 76
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 77
    invoke-static {v5}, Ll/qa00;->d(F)I

    move-result p2

    invoke-static {v6}, Ll/qa00;->d(F)I

    move-result p3

    invoke-virtual {v0, p2, v3, p3, v3}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_5

    .line 78
    :cond_13
    sget-object p3, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->IM:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    if-ne p2, p3, :cond_15

    .line 79
    invoke-static {v7}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 80
    invoke-static {v7}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/high16 p2, 0x41100000    # 9.0f

    .line 81
    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 p2, 0x41600000    # 14.0f

    .line 82
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    const/high16 p2, 0x40000000    # 2.0f

    .line 83
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    invoke-static {v5}, Ll/qa00;->d(F)I

    move-result p3

    invoke-virtual {v0, p2, v3, p3, v3}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_5

    :cond_14
    :goto_4
    const/high16 p2, 0x41800000    # 16.0f

    .line 84
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result v1

    iput v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 85
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 86
    invoke-virtual {v4, p3}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 p2, 0x41c00000    # 24.0f

    .line 87
    invoke-static {p2}, Ll/qa00;->d(F)I

    move-result p2

    iput p2, p0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 88
    invoke-static {v6}, Ll/qa00;->d(F)I

    move-result p2

    const/high16 p3, 0x41000000    # 8.0f

    invoke-static {p3}, Ll/qa00;->d(F)I

    move-result p3

    invoke-virtual {v0, p2, v3, p3, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 89
    :cond_15
    :goto_5
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 90
    invoke-virtual {v2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0

    :cond_16
    return-object v1
.end method

.method public static h(Lcom/p1/mobile/putong/data/User;)I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->i(Lcom/p1/mobile/putong/data/User;Z)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static i(Lcom/p1/mobile/putong/data/User;Z)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    sget p0, Ll/tbc0;->M:I

    .line 22
    .line 23
    return p0

    .line 24
    :cond_0
    sget p0, Ll/tbc0;->o:I

    .line 25
    .line 26
    return p0

    .line 27
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_3

    .line 32
    .line 33
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    sget p0, Ll/tbc0;->I:I

    .line 48
    .line 49
    return p0

    .line 50
    :cond_2
    sget p0, Ll/tbc0;->h:I

    .line 51
    .line 52
    return p0

    .line 53
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isStudentVerified()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_5

    .line 58
    .line 59
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_4

    .line 72
    .line 73
    sget p0, Ll/tbc0;->Q:I

    .line 74
    .line 75
    return p0

    .line 76
    :cond_4
    sget p0, Ll/tbc0;->v:I

    .line 77
    .line 78
    return p0

    .line 79
    :cond_5
    if-nez p1, :cond_7

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_7

    .line 86
    .line 87
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_6

    .line 100
    .line 101
    sget p0, Ll/tbc0;->W:I

    .line 102
    .line 103
    return p0

    .line 104
    :cond_6
    sget p0, Ll/tbc0;->p:I

    .line 105
    .line 106
    return p0

    .line 107
    :cond_7
    const/4 p0, -0x1

    .line 108
    return p0
.end method

.method public static j(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 1
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isStudentVerified()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    sget-object v0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_canceled_profile_id_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p1, p0, v0}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ll/pk50;->f()Ll/rj50;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_canceled_profile_avatar_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p1, p0, v0}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    :cond_2
    return-void

    .line 74
    :cond_3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public static k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V
    .locals 14

    .line 1
    if-eqz p0, :cond_9

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "p_verification_explain"

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v2, "receiver_user_id"

    .line 28
    .line 29
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    filled-new-array {v2}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v0, v2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 43
    .line 44
    .line 45
    new-instance v2, Ll/pej0;

    .line 46
    .line 47
    invoke-direct {v2, p0}, Ll/pej0;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    const/4 v3, 0x1

    .line 51
    invoke-virtual {v2, v3}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setCanceledOnTouchOutside(Z)V

    .line 52
    .line 53
    .line 54
    sget v4, Ll/afc0;->a:I

    .line 55
    .line 56
    invoke-virtual {v2, v4}, Lcom/google/android/material/bottomsheet/BottomSheetDialog;->setContentView(I)V

    .line 57
    .line 58
    .line 59
    new-instance v4, Ll/qr4;

    .line 60
    .line 61
    invoke-direct {v4, v0}, Ll/qr4;-><init>(Ll/l4g0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, v4}, Landroid/app/Dialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-eqz v4, :cond_2

    .line 76
    .line 77
    const v4, 0x1020002

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, v4}, Landroid/view/Window;->findViewById(I)Landroid/view/View;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    sget v5, Ll/odc0;->p:I

    .line 85
    .line 86
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    check-cast v4, Landroid/widget/FrameLayout;

    .line 91
    .line 92
    sget v5, Ll/tbc0;->a0:I

    .line 93
    .line 94
    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundResource(I)V

    .line 95
    .line 96
    .line 97
    new-instance v4, Ll/rr4;

    .line 98
    .line 99
    invoke-direct {v4, v0}, Ll/rr4;-><init>(Landroid/view/Window;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v4}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 103
    .line 104
    .line 105
    :cond_2
    sget v0, Ll/odc0;->e:I

    .line 106
    .line 107
    invoke-virtual {v2, v0}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 112
    .line 113
    sget v4, Ll/odc0;->g:I

    .line 114
    .line 115
    invoke-virtual {v2, v4}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    sget v5, Ll/odc0;->a:I

    .line 120
    .line 121
    invoke-virtual {v2, v5}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    check-cast v5, Lv/VDraweeView;

    .line 126
    .line 127
    sget v6, Ll/odc0;->f:I

    .line 128
    .line 129
    invoke-virtual {v2, v6}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v6

    .line 133
    check-cast v6, Lv/VLinear;

    .line 134
    .line 135
    sget v7, Ll/odc0;->v:I

    .line 136
    .line 137
    invoke-virtual {v2, v7}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v7

    .line 141
    check-cast v7, Lv/VText;

    .line 142
    .line 143
    sget v8, Ll/odc0;->s:I

    .line 144
    .line 145
    invoke-virtual {v2, v8}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v8

    .line 149
    check-cast v8, Lv/VText;

    .line 150
    .line 151
    sget v9, Ll/odc0;->c:I

    .line 152
    .line 153
    invoke-virtual {v2, v9}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v9

    .line 157
    sget v10, Ll/odc0;->d:I

    .line 158
    .line 159
    invoke-virtual {v2, v10}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object v10

    .line 163
    check-cast v10, Lv/VText;

    .line 164
    .line 165
    sget v11, Ll/odc0;->b:I

    .line 166
    .line 167
    invoke-virtual {v2, v11}, Ll/nu0;->findViewById(I)Landroid/view/View;

    .line 168
    .line 169
    .line 170
    move-result-object v11

    .line 171
    if-eqz v0, :cond_9

    .line 172
    .line 173
    if-eqz v4, :cond_9

    .line 174
    .line 175
    if-eqz v5, :cond_9

    .line 176
    .line 177
    if-eqz v6, :cond_9

    .line 178
    .line 179
    if-eqz v7, :cond_9

    .line 180
    .line 181
    if-eqz v8, :cond_9

    .line 182
    .line 183
    if-eqz v11, :cond_9

    .line 184
    .line 185
    if-nez v9, :cond_3

    .line 186
    .line 187
    goto/16 :goto_3

    .line 188
    .line 189
    :cond_3
    sget-object v12, Ll/uqb0;->G:Ll/fsb0;

    .line 190
    .line 191
    const-string v13, "https://fe-static.tancdn.com/v1/images/eyJpZCI6IjRRTU9USU0yWVRaRUYzVEhSQllPRktLWVJGR1M3TDE0IiwidyI6NDY4LCJoIjo2ODMsImQiOjAsIm10IjoiaW1hZ2UvanBlZyIsImRoIjo0ODI4MzU3NzI2ODU2Njc3NjMzfQ.webp"

    .line 192
    .line 193
    invoke-virtual {v12, v11, v13}, Ll/fsb0;->D(Landroid/view/View;Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    const/4 v11, 0x3

    .line 197
    invoke-static {v11}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 198
    .line 199
    .line 200
    move-result-object v12

    .line 201
    invoke-virtual {v7, v12, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 202
    .line 203
    .line 204
    invoke-static {v11}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 205
    .line 206
    .line 207
    move-result-object v11

    .line 208
    invoke-virtual {v10, v11, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 209
    .line 210
    .line 211
    new-instance v10, Ll/sr4;

    .line 212
    .line 213
    invoke-direct {v10, v2}, Ll/sr4;-><init>(Ll/pej0;)V

    .line 214
    .line 215
    .line 216
    invoke-static {v4, v10}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 217
    .line 218
    .line 219
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 220
    .line 221
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 222
    .line 223
    .line 224
    move-result-object v10

    .line 225
    invoke-virtual {v10}, Lcom/p1/mobile/putong/data/Picture;->profileMiddle()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 226
    .line 227
    .line 228
    move-result-object v10

    .line 229
    invoke-virtual {v10}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v10

    .line 233
    invoke-virtual {v4, v5, v10}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    sget-object v4, Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;->BOTTOM_SHEET:Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;

    .line 237
    .line 238
    invoke-static {p0, p1, v4}, Lcom/p1/mobile/putong/core/util/CertificationUtil;->f(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/util/CertificationUtil$CertificationIconStyle;)Landroid/view/View;

    .line 239
    .line 240
    .line 241
    move-result-object v4

    .line 242
    if-nez v4, :cond_4

    .line 243
    .line 244
    goto/16 :goto_3

    .line 245
    .line 246
    :cond_4
    invoke-virtual {v6, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 247
    .line 248
    .line 249
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 250
    .line 251
    .line 252
    move-result-object v4

    .line 253
    invoke-interface {v4}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 254
    .line 255
    .line 256
    move-result-object v4

    .line 257
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 258
    .line 259
    .line 260
    move-result v5

    .line 261
    const-string v6, "\u5934\u50cf\u662f\u7528\u6237\u771f\u5b9e\u7167\u7247\uff0c\u5df2\u901a\u8fc7\u4eba\u8138\u5bf9\u6bd4"

    .line 262
    .line 263
    const-string v10, "\u5979"

    .line 264
    .line 265
    const-string v11, "\u4ed6"

    .line 266
    .line 267
    const-string v12, "male"

    .line 268
    .line 269
    if-eqz v5, :cond_6

    .line 270
    .line 271
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 272
    .line 273
    invoke-static {p1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 274
    .line 275
    .line 276
    move-result p1

    .line 277
    if-eqz p1, :cond_5

    .line 278
    .line 279
    move-object v10, v11

    .line 280
    :cond_5
    filled-new-array {v10}, [Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    const-string v5, "%s\u5df2\u5b8c\u6210\u5b9e\u540d\u548c\u5934\u50cf\u8ba4\u8bc1"

    .line 285
    .line 286
    invoke-static {v5, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 291
    .line 292
    .line 293
    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 294
    .line 295
    .line 296
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 297
    .line 298
    .line 299
    move-result p1

    .line 300
    xor-int/2addr p1, v3

    .line 301
    invoke-static {v9, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 302
    .line 303
    .line 304
    goto :goto_0

    .line 305
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 306
    .line 307
    .line 308
    move-result v5

    .line 309
    if-eqz v5, :cond_9

    .line 310
    .line 311
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 312
    .line 313
    invoke-static {p1, v12}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 314
    .line 315
    .line 316
    move-result p1

    .line 317
    if-eqz p1, :cond_7

    .line 318
    .line 319
    move-object v10, v11

    .line 320
    :cond_7
    filled-new-array {v10}, [Ljava/lang/Object;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    const-string v5, "%s\u5df2\u5b8c\u6210\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 325
    .line 326
    invoke-static {v5, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object p1

    .line 330
    invoke-virtual {v7, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 331
    .line 332
    .line 333
    invoke-virtual {v8, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {v4}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 337
    .line 338
    .line 339
    move-result p1

    .line 340
    xor-int/2addr p1, v3

    .line 341
    invoke-static {v9, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 342
    .line 343
    .line 344
    :goto_0
    invoke-static {v9}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 345
    .line 346
    .line 347
    move-result p1

    .line 348
    if-eqz p1, :cond_8

    .line 349
    .line 350
    const/high16 p1, 0x41400000    # 12.0f

    .line 351
    .line 352
    :goto_1
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 353
    .line 354
    .line 355
    move-result p1

    .line 356
    goto :goto_2

    .line 357
    :cond_8
    const/4 p1, 0x0

    .line 358
    goto :goto_1

    .line 359
    :goto_2
    invoke-static {v0, p1}, Ll/bnl0;->c0(Landroid/view/View;I)V

    .line 360
    .line 361
    .line 362
    new-instance p1, Ll/tr4;

    .line 363
    .line 364
    invoke-direct {p1, p0}, Ll/tr4;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 365
    .line 366
    .line 367
    invoke-static {v9, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 368
    .line 369
    .line 370
    const-string p0, "e_verification_explain_go"

    .line 371
    .line 372
    invoke-static {p0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v2}, Landroid/app/Dialog;->show()V

    .line 376
    .line 377
    .line 378
    :cond_9
    :goto_3
    return-void
.end method

.method public static l()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v2, "pending"

    .line 20
    .line 21
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 30
    .line 31
    const-string v1, "verified"

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    :cond_0
    const/4 v0, 0x1

    .line 40
    return v0

    .line 41
    :cond_1
    const/4 v0, 0x0

    .line 42
    return v0
.end method
