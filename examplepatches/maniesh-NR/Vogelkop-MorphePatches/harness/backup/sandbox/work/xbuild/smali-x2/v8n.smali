.class public final Lv8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
.field public static final d:[I

.field public static final e:[I

.field public static final f:[I

.field public static final g:[I

.field public static final h:[I

.field public static final i:[I

.field public static final j:[I

.field public static final k:[I

.field public static final l:[I

.field public static final m:[I

.field public static final n:[I

.field public static final o:[I

.field public static final p:[I

.field public static final q:[I

.field public static final r:[I

.field public static final s:[I

.field public static final t:[I

.field public static final u:[I

.field public static final v:[I

.field public static final w:[I

.field public static final x:[I

.field public static final y:[I


# instance fields
.field public final synthetic a:B

.field public final b:Lff2;

.field public final c:Lff2;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    const v0, 0x10100d4

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->d:[I

    const v0, 0x7f040628

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->e:[I

    const v0, 0x1010175

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->f:[I

    const v0, 0x1010176

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->g:[I

    const v0, 0x7f040a2d

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->h:[I

    const v0, 0x7f04055d

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->i:[I

    const v0, 0x7f0403dd

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->j:[I

    const v0, 0x7f0403d7

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->k:[I

    const v0, 0x1010109

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->l:[I

    const v0, 0x101046d

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->m:[I

    const v0, 0x7f040a40

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->n:[I

    const v0, 0x7f040a35

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->o:[I

    const v0, 0x7f040a2d

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->p:[I

    const v0, 0x7f04055d

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->q:[I

    const v0, 0x7f040155

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->r:[I

    const v0, 0x7f040127

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->s:[I

    const v0, 0x7f04084e

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->t:[I

    const v0, 0x7f04084c

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->u:[I

    const v0, 0x7f0402f2

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->v:[I

    const v0, 0x7f0402d7

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->w:[I

    const v0, 0x7f040a69

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->x:[I

    const v0, 0x7f040a68

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lv8n;->y:[I

    return-void
.end method

.method public synthetic constructor <init>(Lff2;Lff2;B)V
    .registers 4

    iput-byte p3, p0, Lv8n;->a:B

    iput-object p1, p0, Lv8n;->b:Lff2;

    iput-object p2, p0, Lv8n;->c:Lff2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 6

    iget-byte v0, p0, Lv8n;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lv8n;->c:Lff2;

    iget-object p0, p0, Lv8n;->b:Lff2;

    packed-switch v0, :pswitch_data_2bc

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast p1, Lcom/opera/android/StatusBarDrawingFrameLayout;

    if-eqz p0, :cond_18

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-nez p0, :cond_1a

    :cond_18
    move-object p0, v1

    goto :goto_1e

    :cond_1a
    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_1e
    if-eqz p0, :cond_27

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    invoke-virtual {p1, p0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    :cond_27
    if-eqz v2, :cond_33

    invoke-virtual {v2, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_33

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :cond_33
    if-eqz v1, :cond_42

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    iget v0, p1, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    if-eq p0, v0, :cond_42

    iput p0, p1, Lcom/opera/android/StatusBarDrawingFrameLayout;->k:I

    invoke-virtual {p1}, Lcom/opera/android/StatusBarDrawingFrameLayout;->b()V

    :cond_42
    return-void

    :pswitch_43
    invoke-static {p1}, Lov0;->g(Landroid/view/View;)Lov0;

    move-result-object p1

    iget-object v0, p1, Lov0;->b:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    if-eqz p0, :cond_55

    invoke-virtual {p0, v3}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-nez p0, :cond_57

    :cond_55
    move-object p0, v1

    goto :goto_5b

    :cond_57
    invoke-static {v3, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_5b
    if-eqz p0, :cond_6d

    new-instance v3, Lexh;

    invoke-direct {v3, p0}, Lexh;-><init>(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v3, p0}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_6d
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    if-eqz v2, :cond_7d

    invoke-virtual {v2, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_7d

    invoke-static {p0, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :cond_7d
    if-eqz v1, :cond_93

    iget-object p0, p1, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    new-instance p1, Lexh;

    invoke-direct {p1, v1}, Lexh;-><init>(Landroid/content/res/ColorStateList;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcxh;->b(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_93
    return-void

    :pswitch_94
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast p1, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz p0, :cond_af

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_af

    iget-object v1, p1, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object v1, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v1, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    :cond_af
    if-eqz v2, :cond_c4

    invoke-virtual {v2, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_c4

    iget-object p1, p1, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1, p0}, Lcom/opera/android/custom_views/StylingImageView;->c(Landroid/content/res/ColorStateList;)V

    :cond_c4
    return-void

    :pswitch_c5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p0, :cond_d1

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-nez p0, :cond_d3

    :cond_d1
    move-object p0, v1

    goto :goto_d7

    :cond_d3
    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_d7
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v2, :cond_e7

    invoke-virtual {v2, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_e7

    invoke-static {v0, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :cond_e7
    check-cast p1, Lcom/google/android/material/checkbox/MaterialCheckBox;

    if-eqz p0, :cond_ee

    invoke-virtual {p1, p0}, Lcom/google/android/material/checkbox/MaterialCheckBox;->setButtonTintList(Landroid/content/res/ColorStateList;)V

    :cond_ee
    if-eqz v1, :cond_f9

    iget-object p0, p1, Lcom/google/android/material/checkbox/MaterialCheckBox;->o:Landroid/content/res/ColorStateList;

    if-eq p0, v1, :cond_f9

    iput-object v1, p1, Lcom/google/android/material/checkbox/MaterialCheckBox;->o:Landroid/content/res/ColorStateList;

    invoke-virtual {p1}, Lcom/google/android/material/checkbox/MaterialCheckBox;->b()V

    :cond_f9
    return-void

    :pswitch_fa
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p0, :cond_106

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-nez p0, :cond_108

    :cond_106
    move-object p0, v1

    goto :goto_10c

    :cond_108
    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_10c
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v2, :cond_11c

    invoke-virtual {v2, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_11c

    invoke-static {v0, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :cond_11c
    check-cast p1, Lcom/google/android/material/progressindicator/LinearProgressIndicator;

    if-eqz p0, :cond_12f

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    iget-object v0, p1, Lo83;->a:Lp83;

    iget v2, v0, Lp83;->f:I

    if-eq v2, p0, :cond_12f

    iput p0, v0, Lp83;->f:I

    invoke-virtual {p1}, Lo83;->invalidate()V

    :cond_12f
    if-eqz v1, :cond_13c

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    filled-new-array {p0}, [I

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/android/material/progressindicator/LinearProgressIndicator;->f([I)V

    :cond_13c
    return-void

    :pswitch_13d
    instance-of v0, p1, Lcom/opera/android/widget/GradientSlider;

    if-eqz v0, :cond_17c

    check-cast p1, Lcom/opera/android/widget/GradientSlider;

    iget-object v0, p1, Lcom/opera/android/widget/GradientSlider;->f1:Landroid/content/res/ColorStateList;

    if-eqz p0, :cond_15c

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_15c

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_15c

    move-object v0, p0

    :cond_15c
    iget-object p0, p1, Lcom/opera/android/widget/GradientSlider;->g1:Landroid/content/res/ColorStateList;

    if-eqz v2, :cond_175

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v2, v1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    if-eqz v1, :cond_175

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_175

    move-object p0, v1

    :cond_175
    iput-object v0, p1, Lcom/opera/android/widget/GradientSlider;->f1:Landroid/content/res/ColorStateList;

    iput-object p0, p1, Lcom/opera/android/widget/GradientSlider;->g1:Landroid/content/res/ColorStateList;

    invoke-virtual {p1}, Landroid/view/View;->postInvalidate()V

    :cond_17c
    return-void

    :pswitch_17d
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1a1

    invoke-static {v0, p0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    if-eqz v2, :cond_1a1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v2, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_19e

    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :cond_19e
    invoke-virtual {p1, v1}, Landroid/view/View;->setForegroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_1a1
    return-void

    :pswitch_1a2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p1, Lcom/opera/android/custom_views/StylingTextView;->i:Lzg;

    iget-object v3, v1, Lzg;->c:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/drawable/Drawable;

    iget-object v1, v1, Lzg;->d:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    if-eqz p0, :cond_1be

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1be

    invoke-static {v0, p0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    :cond_1be
    if-eqz v2, :cond_1ca

    invoke-virtual {v2, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_1ca

    invoke-static {v0, p0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_1ca
    invoke-virtual {p1, v3, v1}, Lcom/opera/android/custom_views/StylingTextView;->s(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_1ce
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p0, :cond_1da

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-nez p0, :cond_1dc

    :cond_1da
    move-object p0, v1

    goto :goto_1e0

    :cond_1dc
    invoke-static {v0, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_1e0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v2, :cond_1f0

    invoke-virtual {v2, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_1f0

    invoke-static {v0, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v1

    :cond_1f0
    check-cast p1, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz p0, :cond_203

    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    iget-object v0, p1, Lo83;->a:Lp83;

    iget v2, v0, Lp83;->f:I

    if-eq v2, p0, :cond_203

    iput p0, v0, Lp83;->f:I

    invoke-virtual {p1}, Lo83;->invalidate()V

    :cond_203
    if-eqz v1, :cond_210

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p0

    filled-new-array {p0}, [I

    move-result-object p0

    invoke-virtual {p1, p0}, Lo83;->f([I)V

    :cond_210
    return-void

    :pswitch_211
    check-cast p1, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v2, :cond_21f

    invoke-virtual {v2, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-nez v2, :cond_221

    :cond_21f
    move-object v2, v1

    goto :goto_225

    :cond_221
    invoke-static {v0, v2}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :goto_225
    if-eqz v2, :cond_22a

    invoke-virtual {p1, v2}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_22a
    const-string v3, "mPopup"

    invoke-static {p1, v3}, Lmzg;->h(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_236

    instance-of v3, p1, Landroid/widget/ListPopupWindow;

    if-nez v3, :cond_238

    :cond_236
    move-object p1, v1

    goto :goto_23a

    :cond_238
    check-cast p1, Landroid/widget/ListPopupWindow;

    :goto_23a
    if-eqz p1, :cond_263

    if-eqz p0, :cond_248

    invoke-virtual {p0, v0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_248

    invoke-static {v0, p0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_248
    invoke-virtual {p1, v1}, Landroid/widget/ListPopupWindow;->setListSelector(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1}, Landroid/widget/ListPopupWindow;->getListView()Landroid/widget/ListView;

    move-result-object p0

    if-eqz p0, :cond_263

    invoke-virtual {p0, v1}, Landroid/widget/AbsListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eqz p1, :cond_263

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    invoke-static {p0, v2}, Lq9n;->B(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    :cond_263
    return-void

    :pswitch_264
    instance-of v0, p1, Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v0, :cond_26b

    move-object v1, p1

    check-cast v1, Lcom/google/android/material/appbar/AppBarLayout;

    :cond_26b
    if-eqz v1, :cond_2ba

    if-eqz v2, :cond_286

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v2, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p1

    if-eqz p1, :cond_286

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_286

    invoke-static {v1, p1}, Lq9n;->B(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V

    :cond_286
    if-eqz p0, :cond_2ba

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_2ba

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_2ba

    iget-object p1, v1, Lcom/google/android/material/appbar/AppBarLayout;->m:Landroid/content/res/ColorStateList;

    if-eq p1, p0, :cond_2a9

    iput-object p0, v1, Lcom/google/android/material/appbar/AppBarLayout;->m:Landroid/content/res/ColorStateList;

    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/google/android/material/appbar/AppBarLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_2a9
    invoke-virtual {v1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-boolean v0, v1, Lcom/google/android/material/appbar/AppBarLayout;->k:Z

    if-eqz v0, :cond_2ba

    instance-of v0, p1, Lzdd;

    if-eqz v0, :cond_2ba

    check-cast p1, Lzdd;

    invoke-virtual {p1, p0}, Lzdd;->u(Landroid/content/res/ColorStateList;)V

    :cond_2ba
    return-void

    nop

    :pswitch_data_2bc
    .packed-switch 0x0
        :pswitch_264
        :pswitch_211
        :pswitch_1ce
        :pswitch_1a2
        :pswitch_17d
        :pswitch_13d
        :pswitch_fa
        :pswitch_c5
        :pswitch_94
        :pswitch_43
    .end packed-switch
.end method
