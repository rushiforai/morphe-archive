.class public final Ly8n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr8n;


# static fields
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


# instance fields
.field public final synthetic a:B

.field public final b:Lff2;

.field public final c:Lff2;

.field public final d:Lff2;

.field public final e:Lff2;


# direct methods
.method static synthetic constructor <clinit>()V
    .registers 1

    const v0, 0x7f0400a0

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->f:[I

    const v0, 0x7f0400a1

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->g:[I

    const v0, 0x7f0409ff

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->h:[I

    const v0, 0x7f040a00

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->i:[I

    const v0, 0x7f0400a0

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->j:[I

    const v0, 0x7f0408fe

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->k:[I

    const v0, 0x7f040817

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->l:[I

    const v0, 0x7f040539

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->m:[I

    const v0, 0x7f04054d

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->n:[I

    const v0, 0x7f04054e

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->o:[I

    const v0, 0x1010098

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->p:[I

    const v0, 0x10100d4

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->q:[I

    const v0, 0x1010098

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->r:[I

    const v0, 0x1010099

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->s:[I

    const v0, 0x101009a

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->t:[I

    const v0, 0x1010034

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Ly8n;->u:[I

    return-void
.end method

.method public synthetic constructor <init>(Lff2;Lff2;Lff2;Lff2;B)V
    .registers 6

    iput-byte p5, p0, Ly8n;->a:B

    iput-object p1, p0, Ly8n;->b:Lff2;

    iput-object p2, p0, Ly8n;->c:Lff2;

    iput-object p3, p0, Ly8n;->d:Lff2;

    iput-object p4, p0, Ly8n;->e:Lff2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .registers 8

    iget-byte v0, p0, Ly8n;->a:B

    iget-object v1, p0, Ly8n;->e:Lff2;

    iget-object v2, p0, Ly8n;->d:Lff2;

    iget-object v3, p0, Ly8n;->c:Lff2;

    iget-object v4, p0, Ly8n;->b:Lff2;

    packed-switch v0, :pswitch_data_172

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Ly8n;->r:[I

    invoke-virtual {p0, v0, v4, v1}, Ly8n;->b(Landroid/content/Context;Lff2;[I)Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_2e

    instance-of v4, p1, Landroid/widget/TextView;

    if-eqz v4, :cond_24

    move-object v4, p1

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_2e

    :cond_24
    instance-of v4, p1, Lcom/opera/android/custom_views/TabCountButton;

    if-eqz v4, :cond_2e

    move-object v4, p1

    check-cast v4, Lcom/opera/android/custom_views/TabCountButton;

    invoke-virtual {v4, v1}, Lcom/opera/android/custom_views/TabCountButton;->f(Landroid/content/res/ColorStateList;)V

    :cond_2e
    :goto_2e
    instance-of v1, p1, Landroid/widget/TextView;

    if-eqz v1, :cond_4e

    check-cast p1, Landroid/widget/TextView;

    sget-object v1, Ly8n;->s:[I

    invoke-virtual {p0, v0, v3, v1}, Ly8n;->b(Landroid/content/Context;Lff2;[I)Landroid/content/res/ColorStateList;

    move-result-object v1

    if-eqz v1, :cond_43

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setHighlightColor(I)V

    :cond_43
    sget-object v1, Ly8n;->t:[I

    invoke-virtual {p0, v0, v2, v1}, Ly8n;->b(Landroid/content/Context;Lff2;[I)Landroid/content/res/ColorStateList;

    move-result-object p0

    if-eqz p0, :cond_4e

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setHintTextColor(Landroid/content/res/ColorStateList;)V

    :cond_4e
    return-void

    :pswitch_4f
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    check-cast p1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    iget-object v0, p1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->p:Lov0;

    if-eqz v4, :cond_6a

    invoke-virtual {v4, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_6a

    invoke-static {p0, v4}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget-object v5, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v5, v4}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_6a
    if-eqz v3, :cond_7d

    invoke-virtual {v3, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v3

    if-eqz v3, :cond_7d

    invoke-static {p0, v3}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v3

    iget-object v4, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v4, v3}, Landroid/widget/ImageView;->setImageTintList(Landroid/content/res/ColorStateList;)V

    :cond_7d
    if-eqz v2, :cond_90

    invoke-virtual {v2, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_90

    invoke-static {p0, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v2

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :cond_90
    if-eqz v1, :cond_9f

    invoke-virtual {v1, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v0

    if-eqz v0, :cond_9f

    invoke-static {p0, v0}, Lff2;->h(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_9f
    return-void

    :pswitch_a0
    move-object p0, p1

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v4, :cond_bb

    invoke-virtual {v4, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v0

    if-eqz v0, :cond_bb

    invoke-static {p1, v0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_bb

    invoke-virtual {p0, v0}, Lcom/google/android/material/button/MaterialButton;->I(Landroid/content/res/ColorStateList;)V

    :cond_bb
    if-eqz v3, :cond_cc

    invoke-virtual {v3, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v0

    if-eqz v0, :cond_cc

    invoke-static {p1, v0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_cc

    invoke-virtual {p0, v0}, Lcom/google/android/material/button/MaterialButton;->H(Landroid/content/res/ColorStateList;)V

    :cond_cc
    if-eqz v2, :cond_dd

    invoke-virtual {v2, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v0

    if-eqz v0, :cond_dd

    invoke-static {p1, v0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_dd

    invoke-virtual {p0, v0}, Lcom/google/android/material/button/MaterialButton;->F(Landroid/content/res/ColorStateList;)V

    :cond_dd
    if-eqz v1, :cond_f5

    invoke-virtual {v1, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v0

    if-eqz v0, :cond_f5

    invoke-static {p1, v0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p1

    if-eqz p1, :cond_f5

    iget-object v0, p0, Lcom/google/android/material/button/MaterialButton;->i:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_f5

    iput-object p1, p0, Lcom/google/android/material/button/MaterialButton;->i:Landroid/content/res/ColorStateList;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/google/android/material/button/MaterialButton;->K(Z)V

    :cond_f5
    return-void

    :pswitch_f6
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz v2, :cond_108

    invoke-virtual {v2, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v2

    if-eqz v2, :cond_108

    invoke-static {p0, v2}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_109

    :cond_108
    move-object p0, v0

    :goto_109
    if-eqz p0, :cond_111

    move-object v2, p1

    check-cast v2, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v2, p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_111
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    if-eqz v1, :cond_126

    invoke-virtual {v1, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_126

    invoke-static {}, Landroid/graphics/PorterDuff$Mode;->values()[Landroid/graphics/PorterDuff$Mode;

    move-result-object v1

    iget p0, p0, Landroid/util/TypedValue;->data:I

    aget-object p0, v1, p0

    goto :goto_127

    :cond_126
    move-object p0, v0

    :goto_127
    if-eqz p0, :cond_12f

    move-object v1, p1

    check-cast v1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v1, p0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    :cond_12f
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    if-eqz v4, :cond_140

    invoke-virtual {v4, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object v1

    if-eqz v1, :cond_140

    invoke-static {p0, v1}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_141

    :cond_140
    move-object p0, v0

    :goto_141
    if-eqz p0, :cond_14f

    move-object v1, p1

    check-cast v1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-object v2, v1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->d:Landroid/content/res/ColorStateList;

    if-eq v2, p0, :cond_14f

    iput-object p0, v1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->d:Landroid/content/res/ColorStateList;

    invoke-virtual {v1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->g()V

    :cond_14f
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    if-eqz v3, :cond_163

    invoke-virtual {v3, p0}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_163

    invoke-static {}, Landroid/graphics/PorterDuff$Mode;->values()[Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    iget p0, p0, Landroid/util/TypedValue;->data:I

    aget-object v0, v0, p0

    :cond_163
    if-eqz v0, :cond_170

    check-cast p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-object p0, p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->e:Landroid/graphics/PorterDuff$Mode;

    if-eq p0, v0, :cond_170

    iput-object v0, p1, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->e:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->g()V

    :cond_170
    return-void

    nop

    :pswitch_data_172
    .packed-switch 0x0
        :pswitch_f6
        :pswitch_a0
        :pswitch_4f
    .end packed-switch
.end method

.method public final b(Landroid/content/Context;Lff2;[I)Landroid/content/res/ColorStateList;
    .registers 4

    if-eqz p2, :cond_9

    invoke-virtual {p2, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-nez p0, :cond_28

    goto :goto_13

    :cond_9
    iget-object p0, p0, Ly8n;->e:Lff2;

    if-eqz p0, :cond_13

    invoke-virtual {p0, p1}, Lff2;->c(Landroid/content/Context;)Landroid/util/TypedValue;

    move-result-object p0

    if-nez p0, :cond_15

    :cond_13
    :goto_13
    const/4 p0, 0x0

    return-object p0

    :cond_15
    iget p0, p0, Landroid/util/TypedValue;->resourceId:I

    new-instance p2, Landroid/util/TypedValue;

    invoke-direct {p2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p1, p0, p3}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 p3, 0x0

    invoke-virtual {p0, p3, p2}, Landroid/content/res/TypedArray;->getValue(ILandroid/util/TypedValue;)Z

    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    move-object p0, p2

    :cond_28
    invoke-static {p1, p0}, Lff2;->f(Landroid/content/Context;Landroid/util/TypedValue;)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method
