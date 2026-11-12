.class public final Ljl6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llmn;


# instance fields
.field public final synthetic a:B

.field public b:I

.field public c:I

.field public final d:Ljava/lang/Object;

.field public e:Ljava/lang/Object;

.field public f:Ljava/lang/Object;

.field public g:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .registers 4

    const/4 v0, 0x2

    iput-byte v0, p0, Ljl6;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lesg;

    const/16 v1, 0x13

    invoke-direct {v0, v1}, Lesg;-><init>(B)V

    iput-object v0, p0, Ljl6;->d:Ljava/lang/Object;

    new-instance v0, Lv3d;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lv3d;-><init>(B)V

    iput-object v0, p0, Ljl6;->e:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ljl6;->f:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ljl6;->g:Ljava/lang/Object;

    iput p1, p0, Ljl6;->b:I

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;Lgjf;II)V
    .registers 7

    const/4 v0, 0x1

    iput-byte v0, p0, Ljl6;->a:B

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Ljl6;->f:Ljava/lang/Object;

    .line 44
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Ljl6;->g:Ljava/lang/Object;

    .line 45
    iput-object p1, p0, Ljl6;->d:Ljava/lang/Object;

    .line 46
    iput-object p2, p0, Ljl6;->e:Ljava/lang/Object;

    .line 47
    iput p3, p0, Ljl6;->b:I

    .line 48
    iput p4, p0, Ljl6;->c:I

    .line 49
    new-instance p0, Landroid/graphics/BitmapShader;

    sget-object p2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {p0, p1, p2, p2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lumi;Lk6l;Lx5f;)V
    .registers 7

    const/4 v0, 0x3

    iput-byte v0, p0, Ljl6;->a:B

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Ljl6;->d:Ljava/lang/Object;

    .line 52
    const-string v0, "sessionrestore"

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    invoke-static {p1, p2, v0, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Ljl6;->e:Ljava/lang/Object;

    .line 53
    iput-object p3, p0, Ljl6;->f:Ljava/lang/Object;

    .line 54
    iput-object p4, p0, Ljl6;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/widget/UrlFieldEditText;)V
    .registers 3

    const/4 v0, 0x4

    iput-byte v0, p0, Ljl6;->a:B

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Ljl6;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljmn;Landroid/view/View;Lo2c;IILandroid/animation/TimeAnimator;)V
    .registers 8

    const/4 v0, 0x5

    iput-byte v0, p0, Ljl6;->a:B

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Ljl6;->d:Ljava/lang/Object;

    iput-object p3, p0, Ljl6;->e:Ljava/lang/Object;

    iput p4, p0, Ljl6;->b:I

    iput p5, p0, Ljl6;->c:I

    iput-object p6, p0, Ljl6;->f:Ljava/lang/Object;

    iput-object p1, p0, Ljl6;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Loj9;Loj9;IILyg2;Lah2;)V
    .registers 8

    const/4 v0, 0x0

    iput-byte v0, p0, Ljl6;->a:B

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Ljl6;->d:Ljava/lang/Object;

    .line 63
    iput-object p2, p0, Ljl6;->e:Ljava/lang/Object;

    .line 64
    iput p3, p0, Ljl6;->b:I

    .line 65
    iput p4, p0, Ljl6;->c:I

    .line 66
    iput-object p5, p0, Ljl6;->f:Ljava/lang/Object;

    .line 67
    iput-object p6, p0, Ljl6;->g:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lrr;Ljava/lang/String;I)V
    .registers 5

    const/4 v0, 0x6

    iput-byte v0, p0, Ljl6;->a:B

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Ljl6;->f:Ljava/lang/Object;

    iput-object p2, p0, Ljl6;->g:Ljava/lang/Object;

    iput p3, p0, Ljl6;->c:I

    .line 58
    iput-object p1, p0, Ljl6;->d:Ljava/lang/Object;

    .line 59
    iput-object p2, p0, Ljl6;->e:Ljava/lang/Object;

    .line 60
    iput p3, p0, Ljl6;->b:I

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Class;I)V
    .registers 5

    invoke-virtual {p0, p1}, Ljl6;->m(Ljava/lang/Class;)Ljava/util/NavigableMap;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_30

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/4 v1, 0x1

    if-ne p0, v1, :cond_1f

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {p1, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_1f
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    sub-int/2addr p2, v1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1, p0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_30
    new-instance p1, Ljava/lang/NullPointerException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Tried to decrement empty size, size: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", this: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast v0, Ljmn;

    const/4 v1, 0x0

    iput-object v1, v0, Ljmn;->C:Ll45;

    iget-object p0, p0, Ljl6;->f:Ljava/lang/Object;

    check-cast p0, Landroid/animation/TimeAnimator;

    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    return-void
.end method

.method public final c()V
    .registers 3

    iget-object v0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast v0, Ljmn;

    const/4 v1, 0x0

    iput-object v1, v0, Ljmn;->C:Ll45;

    iget-object p0, p0, Ljl6;->f:Ljava/lang/Object;

    check-cast p0, Landroid/animation/TimeAnimator;

    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljmn;->K0(Z)V

    return-void
.end method

.method public final d(Lqjn;)V
    .registers 6

    iget-object v0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast v0, Ljmn;

    iget-object v1, p1, Lqjn;->g:Landroid/graphics/Bitmap;

    iput-object v1, v0, Ljmn;->v:Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    iput-object v1, v0, Ljmn;->C:Ll45;

    iget-object v1, p0, Ljl6;->f:Ljava/lang/Object;

    check-cast v1, Landroid/animation/TimeAnimator;

    invoke-virtual {v1}, Landroid/animation/Animator;->end()V

    iget-object v1, p0, Ljl6;->d:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget v3, p0, Ljl6;->b:I

    invoke-virtual {p1, v3, v2}, Lqjn;->a(ILandroid/content/Context;)Llkn;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    iget p0, p0, Ljl6;->c:I

    int-to-float p0, p0

    invoke-virtual {v1, p0}, Landroid/view/ViewPropertyAnimator;->translationZ(F)Landroid/view/ViewPropertyAnimator;

    iput-object p1, v0, Ljmn;->w:Llkn;

    iget-object p0, v0, Ljmn;->A:Lw6j;

    iput-object p1, p0, Lw6j;->e:Ljava/lang/Object;

    iget-object v1, p0, Lw6j;->a:Ljava/lang/Object;

    check-cast v1, Lzjn;

    const/4 v3, 0x0

    iput v3, v1, Lzjn;->a:F

    const/high16 v3, 0x3f000000    # 0.5f

    iput v3, v1, Lzjn;->b:F

    iput v3, v1, Lzjn;->c:F

    invoke-virtual {p1}, Llkn;->b()I

    move-result p1

    if-lez p1, :cond_6f

    iget-object p0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast p0, Llkn;

    invoke-virtual {p0}, Llkn;->a()I

    move-result p0

    if-lez p0, :cond_6f

    const/4 p0, 0x0

    iput-boolean p0, v0, Ljmn;->D:Z

    iget-object p1, v0, Ljmn;->z:Lkmn;

    iget-object p1, p1, Lkmn;->i:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->i:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Landroid/view/View;->setAlpha(F)V

    const/16 p0, 0xbb8

    const/16 p1, 0x3e8

    invoke-virtual {v0, p0, p1}, Ljmn;->G0(II)V

    return-void

    :cond_6f
    iget-object p0, v0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->i:Landroid/widget/TextView;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v0, Ljmn;->z:Lkmn;

    iget-object p0, p0, Lkmn;->i:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    return-void
.end method

.method public final e(Laln;)V
    .registers 12

    iget-object v0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast v0, Ljmn;

    iput-object p1, v0, Ljmn;->x:Laln;

    invoke-interface {p1}, Laln;->b()Lg7j;

    move-result-object v1

    const/4 v2, 0x1

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eqz v1, :cond_34

    iget-object v5, v0, Ljmn;->J:Lg7j;

    if-eq v5, v1, :cond_34

    iget-object v5, v0, Ljmn;->z:Lkmn;

    iget-object v5, v5, Lkmn;->q:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v5, v0, Ljmn;->z:Lkmn;

    iget-object v5, v5, Lkmn;->r:Lcom/opera/android/ui/catalog/widget/OperaSwitch;

    new-instance v6, Liwf;

    const/4 v7, 0x2

    invoke-direct {v6, p0, v1, v7}, Liwf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v6}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    iget-boolean v5, v0, Ljmn;->K:Z

    if-nez v5, :cond_3b

    iget-object v5, v0, Ljmn;->F:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v5, v1, v4}, Lcom/opera/android/settings/SettingsManager;->U(Lg7j;Z)V

    iput-boolean v2, v0, Ljmn;->K:Z

    goto :goto_3b

    :cond_34
    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->q:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_3b
    :goto_3b
    iget-object v1, v0, Ljmn;->H:Lx4i;

    iget-object v1, v1, Lx4i;->h:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-interface {p1}, Laln;->getId()Ljava/lang/String;

    move-result-object v5

    if-eqz v1, :cond_52

    invoke-interface {v1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lk15;

    goto :goto_53

    :cond_52
    const/4 v1, 0x0

    :goto_53
    if-eqz v1, :cond_a9

    invoke-virtual {v1}, Lk15;->a()Z

    move-result v5

    if-nez v5, :cond_a9

    const v5, 0x7f0a0cca

    invoke-virtual {v0, v5}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v5

    if-eqz v5, :cond_67

    invoke-interface {v5, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_67
    iget-object v5, v0, Ljmn;->z:Lkmn;

    iget-object v5, v5, Lkmn;->p:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v5, v0, Ljmn;->z:Lkmn;

    iget-object v5, v5, Lkmn;->p:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v7

    iget-wide v8, v1, Lk15;->b:J

    invoke-static {v7, v8, v9, v4}, Lupj;->o(Landroid/content/Context;JZ)Landroid/text/SpannableString;

    move-result-object v7

    new-array v2, v2, [Ljava/lang/CharSequence;

    aput-object v7, v2, v4

    const v4, 0x7f140ecc

    invoke-static {v6, v4, v2}, Lphj;->X(Landroid/content/Context;I[Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v2

    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, v0, Ljmn;->z:Lkmn;

    iget-object v2, v2, Lkmn;->p:Lcom/google/android/material/button/MaterialButton;

    new-instance v4, Lobn;

    invoke-direct {v4, p0, v1, v3}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->k:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->m:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_c8

    :cond_a9
    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->k:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Ljmn;->Q0()V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->p:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->k:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->m:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    :goto_c8
    invoke-virtual {v0, p1}, Ljmn;->N0(Laln;)V

    invoke-virtual {v0}, Ljmn;->M0()V

    iget-object v1, p0, Ljl6;->d:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object p0, p0, Ljl6;->e:Ljava/lang/Object;

    check-cast p0, Lo2c;

    invoke-interface {p1, v1, p0}, Laln;->g(Landroid/content/Context;Lo2c;)Lh06;

    move-result-object p0

    iget-object p1, v0, Ljmn;->B:Lexd;

    if-eqz p1, :cond_e7

    sget-object v1, Lhjm;->a:Lhjm;

    invoke-virtual {p1, v1}, Llz3;->b(Lhjm;)Z

    :cond_e7
    iput-object p0, v0, Ljmn;->y:Lh06;

    invoke-virtual {v0}, Ljmn;->O0()V

    return-void
.end method

.method public final f()V
    .registers 3

    iget-object v0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast v0, Ljmn;

    const/4 v1, 0x0

    iput-object v1, v0, Ljmn;->C:Ll45;

    iget-object p0, p0, Ljl6;->f:Ljava/lang/Object;

    check-cast p0, Landroid/animation/TimeAnimator;

    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljmn;->K0(Z)V

    return-void
.end method

.method public final g(Landroid/graphics/Canvas;IIII)V
    .registers 11

    iget-object v0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Ljl6;->f:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Paint;

    iget-object v2, p0, Ljl6;->e:Ljava/lang/Object;

    check-cast v2, Lgjf;

    sub-int/2addr p4, p2

    iget v3, p0, Ljl6;->b:I

    invoke-virtual {v2, p4, v3}, Lgjf;->b(II)Lbcd;

    move-result-object v2

    int-to-float p4, p4

    iget-object v3, p0, Ljl6;->d:Ljava/lang/Object;

    check-cast v3, Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr p4, v4

    sub-int/2addr p5, p3

    int-to-float p5, p5

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr p5, v3

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v4, p4, v3

    if-nez v4, :cond_39

    cmpl-float v3, p5, v3

    if-nez v3, :cond_39

    invoke-virtual {v1}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object p4

    const/4 p5, 0x0

    invoke-virtual {p4, p5}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    goto :goto_47

    :cond_39
    invoke-static {p4, p5}, Ljava/lang/Math;->max(FF)F

    move-result p4

    invoke-virtual {v0, p4, p4}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v1}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object p4

    invoke-virtual {p4, v0}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    :goto_47
    new-instance p4, Landroid/graphics/Path;

    iget-object p5, v2, Lbcd;->c:Landroid/graphics/Path;

    invoke-direct {p4, p5}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    int-to-float p2, p2

    int-to-float p3, p3

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, p4, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    iget p0, p0, Ljl6;->c:I

    if-eqz p0, :cond_60

    invoke-virtual {v2, p1, p0}, Lbcd;->a(Landroid/graphics/Canvas;I)V

    :cond_60
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public final h(I)V
    .registers 7

    :cond_0
    :goto_0
    iget v0, p0, Ljl6;->c:I

    if-le v0, p1, :cond_45

    iget-object v0, p0, Ljl6;->d:Ljava/lang/Object;

    check-cast v0, Lesg;

    invoke-virtual {v0}, Lesg;->D()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lqyn;->k(Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljl6;->j(Ljava/lang/Class;)Lr24;

    move-result-object v1

    iget v2, p0, Ljl6;->c:I

    invoke-virtual {v1, v0}, Lr24;->a(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v1}, Lr24;->b()I

    move-result v4

    mul-int/2addr v4, v3

    sub-int/2addr v2, v4

    iput v2, p0, Ljl6;->c:I

    invoke-virtual {v1, v0}, Lr24;->a(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p0, v3, v2}, Ljl6;->a(Ljava/lang/Class;I)V

    iget-byte v2, v1, Lr24;->a:B

    packed-switch v2, :pswitch_data_46

    const-string v2, "IntegerArrayPool"

    goto :goto_3a

    :pswitch_38
    const-string v2, "ByteArrayPool"

    :goto_3a
    const/4 v3, 0x2

    invoke-static {v2, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1, v0}, Lr24;->a(Ljava/lang/Object;)I

    goto :goto_0

    :cond_45
    return-void

    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_38
    .end packed-switch
.end method

.method public final declared-synchronized i(Ljava/lang/Class;I)Ljava/lang/Object;
    .registers 6

    monitor-enter p0

    :try_start_1
    invoke-virtual {p0, p1}, Ljl6;->m(Ljava/lang/Class;)Ljava/util/NavigableMap;

    move-result-object v0

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/NavigableMap;->ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_25

    iget v1, p0, Ljl6;->c:I

    if-eqz v1, :cond_23

    iget v2, p0, Ljl6;->b:I

    div-int/2addr v2, v1

    const/4 v1, 0x2

    if-ge v2, v1, :cond_23

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    shl-int/lit8 v2, p2, 0x3

    if-gt v1, v2, :cond_25

    :cond_23
    const/4 v1, 0x1

    goto :goto_26

    :cond_25
    const/4 v1, 0x0

    :goto_26
    iget-object v2, p0, Ljl6;->e:Ljava/lang/Object;

    check-cast v2, Lv3d;

    if-eqz v1, :cond_47

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iget-object v0, v2, Ln1;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsng;

    if-nez v0, :cond_40

    invoke-virtual {v2}, Lv3d;->H0()Lsng;

    move-result-object v0

    :cond_40
    check-cast v0, Lu3d;

    iput p2, v0, Lu3d;->b:I

    iput-object p1, v0, Lu3d;->c:Ljava/lang/Class;

    goto :goto_5d

    :cond_47
    iget-object v0, v2, Ln1;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayDeque;

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsng;

    if-nez v0, :cond_57

    invoke-virtual {v2}, Lv3d;->H0()Lsng;

    move-result-object v0

    :cond_57
    check-cast v0, Lu3d;

    iput p2, v0, Lu3d;->b:I

    iput-object p1, v0, Lu3d;->c:Ljava/lang/Class;

    :goto_5d
    invoke-virtual {p0, v0, p1}, Ljl6;->k(Lu3d;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1
    :try_end_61
    .catchall {:try_start_1 .. :try_end_61} :catchall_65

    monitor-exit p0

    return-object p1

    :goto_63
    :try_start_63
    monitor-exit p0
    :try_end_64
    .catchall {:try_start_63 .. :try_end_64} :catchall_65

    throw p1

    :catchall_65
    move-exception p1

    goto :goto_63
.end method

.method public final j(Ljava/lang/Class;)Lr24;
    .registers 4

    iget-object p0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lr24;

    if-nez v0, :cond_3c

    const-class v0, [I

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1b

    new-instance v0, Lr24;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lr24;-><init>(B)V

    goto :goto_29

    :cond_1b
    const-class v0, [B

    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2d

    new-instance v0, Lr24;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lr24;-><init>(B)V

    :goto_29
    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :cond_2d
    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "No array pool found for: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_3c
    return-object v0
.end method

.method public final k(Lu3d;Ljava/lang/Class;)Ljava/lang/Object;
    .registers 7

    invoke-virtual {p0, p2}, Ljl6;->j(Ljava/lang/Class;)Lr24;

    move-result-object v0

    iget-object v1, p0, Ljl6;->d:Ljava/lang/Object;

    check-cast v1, Lesg;

    invoke-virtual {v1, p1}, Lesg;->r(Lsng;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_24

    iget p1, p0, Ljl6;->c:I

    invoke-virtual {v0, v1}, Lr24;->a(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v0}, Lr24;->b()I

    move-result v3

    mul-int/2addr v3, v2

    sub-int/2addr p1, v3

    iput p1, p0, Ljl6;->c:I

    invoke-virtual {v0, v1}, Lr24;->a(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {p0, p2, p1}, Ljl6;->a(Ljava/lang/Class;I)V

    return-object v1

    :cond_24
    iget p0, p1, Lu3d;->b:I

    iget-byte p1, v0, Lr24;->a:B

    packed-switch p1, :pswitch_data_32

    new-array p0, p0, [I

    goto :goto_30

    :pswitch_2e
    new-array p0, p0, [B

    :goto_30
    return-object p0

    nop

    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_2e
    .end packed-switch
.end method

.method public final l(Ljava/lang/String;)I
    .registers 4

    const/4 v0, 0x6

    :try_start_1
    iget-object p0, p0, Ljl6;->e:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const/4 v1, 0x5

    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    invoke-static {v0}, Lvep;->B(I)[I

    move-result-object p1

    if-ltz p0, :cond_1c

    array-length v1, p1

    if-ge p0, v1, :cond_1c

    aget p0, p1, p0
    :try_end_1b
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1b} :catch_1c

    return p0

    :catch_1c
    :cond_1c
    return v0
.end method

.method public final m(Ljava/lang/Class;)Ljava/util/NavigableMap;
    .registers 3

    iget-object p0, p0, Ljl6;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/NavigableMap;

    if-nez v0, :cond_14

    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    invoke-virtual {p0, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_14
    return-object v0
.end method

.method public final n()Z
    .registers 2

    iget-object p0, p0, Ljl6;->d:Ljava/lang/Object;

    check-cast p0, Loj9;

    iget-object p0, p0, Loj9;->n:Ljava/lang/String;

    const-string v0, "audio/raw"

    invoke-static {p0, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final declared-synchronized o(Ljava/lang/Object;)V
    .registers 7

    monitor-enter p0

    :try_start_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljl6;->j(Ljava/lang/Class;)Lr24;

    move-result-object v1

    invoke-virtual {v1, p1}, Lr24;->a(Ljava/lang/Object;)I

    move-result v2

    invoke-virtual {v1}, Lr24;->b()I

    move-result v1

    mul-int/2addr v1, v2

    iget v3, p0, Ljl6;->b:I

    div-int/lit8 v3, v3, 0x2

    if-gt v1, v3, :cond_6a

    iget-object v3, p0, Ljl6;->e:Ljava/lang/Object;

    check-cast v3, Lv3d;

    iget-object v4, v3, Ln1;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayDeque;

    invoke-virtual {v4}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lsng;

    if-nez v4, :cond_2c

    invoke-virtual {v3}, Lv3d;->H0()Lsng;

    move-result-object v4

    :cond_2c
    check-cast v4, Lu3d;

    iput v2, v4, Lu3d;->b:I

    iput-object v0, v4, Lu3d;->c:Ljava/lang/Class;

    iget-object v2, p0, Ljl6;->d:Ljava/lang/Object;

    check-cast v2, Lesg;

    invoke-virtual {v2, v4, p1}, Lesg;->A(Lsng;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljl6;->m(Ljava/lang/Class;)Ljava/util/NavigableMap;

    move-result-object p1

    iget v0, v4, Lu3d;->b:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    iget v2, v4, Lu3d;->b:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v0, :cond_57

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v3, v0

    :cond_57
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget p1, p0, Ljl6;->c:I

    add-int/2addr p1, v1

    iput p1, p0, Ljl6;->c:I

    iget p1, p0, Ljl6;->b:I

    invoke-virtual {p0, p1}, Ljl6;->h(I)V
    :try_end_68
    .catchall {:try_start_1 .. :try_end_68} :catchall_6e

    monitor-exit p0

    return-void

    :cond_6a
    monitor-exit p0

    return-void

    :goto_6c
    :try_start_6c
    monitor-exit p0
    :try_end_6d
    .catchall {:try_start_6c .. :try_end_6d} :catchall_6e

    throw p1

    :catchall_6e
    move-exception p1

    goto :goto_6c
.end method

.method public final p(Lcom/opera/android/browser/SessionRestore$State;)V
    .registers 20

    move-object/from16 v0, p0

    iget-object v0, v0, Ljl6;->f:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Lk6l;

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/opera/android/browser/SessionRestore$State;->b:Ln9g;

    iget-object v2, v1, Lk6l;->c:Ljava/util/HashMap;

    iget-object v3, v1, Lk6l;->q:Lh7f;

    iget-object v4, v1, Lk6l;->b:Ljava/util/ArrayList;

    sget-object v5, Lh6l;->a:Lh6l;

    invoke-virtual {v1, v5}, Lk6l;->h(Lh6l;)V

    :try_start_16
    iget-byte v7, v0, Ln9g;->b:B

    iget v8, v0, Ln9g;->a:I

    iget-object v9, v0, Ln9g;->c:Ljava/lang/Object;

    check-cast v9, Ljava/util/List;

    const/4 v11, 0x1

    if-eq v7, v11, :cond_23

    const/4 v7, 0x0

    goto :goto_40

    :cond_23
    if-ltz v8, :cond_3f

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v7

    if-ge v8, v7, :cond_3f

    invoke-interface {v9, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, La9l;

    invoke-interface {v7}, La9l;->k()Lz8l;

    move-result-object v7

    invoke-interface {v7}, Lz8l;->getUrl()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v7

    xor-int/2addr v7, v11

    goto :goto_40

    :cond_3f
    move v7, v11

    :goto_40
    iget-byte v0, v0, Ln9g;->b:B

    const/4 v12, 0x2

    if-ne v0, v12, :cond_47

    move v13, v11

    goto :goto_48

    :cond_47
    const/4 v13, 0x0

    :goto_48
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    const/4 v6, 0x0

    const/4 v15, 0x0

    :goto_4f
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v0

    if-ge v15, v0, :cond_d6

    invoke-interface {v9, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La9l;

    iget-object v12, v1, Lk6l;->a:Lxbf;

    invoke-interface {v0, v12}, La9l;->l(Lxbf;)Ld7l;

    move-result-object v12

    if-eqz v7, :cond_74

    invoke-interface {v0}, La9l;->k()Lz8l;

    move-result-object v0

    invoke-interface {v0}, Lz8l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_74

    move/from16 v16, v11

    goto :goto_76

    :cond_74
    const/16 v16, 0x0

    :goto_76
    invoke-virtual {v4, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, v12, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0, v12}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v16, :cond_8b

    invoke-virtual {v14, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8b
    iget-object v0, v12, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    if-eqz v0, :cond_98

    iget v0, v1, Lk6l;->n:I

    add-int/2addr v0, v11

    iput v0, v1, Lk6l;->n:I

    :cond_98
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v10, v0, -0x1

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Lg7f;

    invoke-direct {v11, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_a6
    invoke-virtual {v11}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_c0

    invoke-virtual {v11}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj6l;
    :try_end_b2
    .catchall {:try_start_16 .. :try_end_b2} :catchall_186

    move/from16 v17, v7

    const/4 v7, 0x1

    :try_start_b5
    invoke-interface {v0, v12, v10, v7}, Lj6l;->o(Lb2l;IZ)V
    :try_end_b8
    .catch Ljava/lang/RuntimeException; {:try_start_b5 .. :try_end_b8} :catch_b9
    .catchall {:try_start_b5 .. :try_end_b8} :catchall_186

    goto :goto_bd

    :catch_b9
    move-exception v0

    :try_start_ba
    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    :goto_bd
    move/from16 v7, v17

    goto :goto_a6

    :cond_c0
    move/from16 v17, v7

    iget-object v0, v1, Lk6l;->s:Lg6l;

    invoke-virtual {v12, v0}, Ld7l;->e0(La2l;)V

    if-nez v16, :cond_cf

    iget-object v0, v1, Lk6l;->x:Lb5l;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v6, v12

    :cond_cf
    add-int/lit8 v15, v15, 0x1

    move/from16 v7, v17

    const/4 v11, 0x1

    goto/16 :goto_4f

    :cond_d6
    move/from16 v17, v7

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v0, 0x0

    :goto_dd
    if-ge v0, v7, :cond_127

    invoke-virtual {v14, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v10, v0, 0x1

    check-cast v9, Lb2l;

    invoke-virtual {v4, v9}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-object v0, v9

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v11, Lg7f;

    invoke-direct {v11, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_102
    invoke-virtual {v11}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_118

    invoke-virtual {v11}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj6l;
    :try_end_10e
    .catchall {:try_start_ba .. :try_end_10e} :catchall_186

    const/4 v12, 0x0

    :try_start_10f
    invoke-interface {v0, v9, v12}, Lj6l;->L(Lb2l;Z)V
    :try_end_112
    .catch Ljava/lang/RuntimeException; {:try_start_10f .. :try_end_112} :catch_113
    .catchall {:try_start_10f .. :try_end_112} :catchall_186

    goto :goto_102

    :catch_113
    move-exception v0

    :try_start_114
    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_102

    :cond_118
    iget-object v0, v1, Lk6l;->t:Landroid/os/Handler;

    new-instance v11, Lwr9;

    const/16 v12, 0x15

    const/4 v15, 0x0

    invoke-direct {v11, v12, v1, v9, v15}, Lwr9;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0, v11}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move v0, v10

    goto :goto_dd

    :cond_127
    if-eqz v13, :cond_144

    iget v0, v1, Lk6l;->n:I

    if-nez v0, :cond_144

    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_13b

    const/4 v15, 0x0

    invoke-virtual {v1, v15}, Lk6l;->m(Z)Ld7l;

    move-result-object v6

    invoke-virtual {v1, v6, v15}, Lk6l;->g(Ld7l;I)V

    :cond_13b
    const/4 v7, 0x1

    invoke-virtual {v1, v7}, Lk6l;->m(Z)Ld7l;

    move-result-object v0

    invoke-virtual {v1, v6, v0, v7}, Lk6l;->f(Lb2l;Ld7l;Z)V

    goto :goto_160

    :cond_144
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_157

    if-nez v17, :cond_157

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    const/4 v6, 0x2

    invoke-virtual {v1, v0, v6}, Lk6l;->C(Lb2l;I)V

    goto :goto_160

    :cond_157
    const/4 v15, 0x0

    invoke-virtual {v1, v15}, Lk6l;->m(Z)Ld7l;

    move-result-object v0

    const/4 v7, 0x1

    invoke-virtual {v1, v6, v0, v7}, Lk6l;->f(Lb2l;Ld7l;Z)V

    :goto_160
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v6, Lg7f;

    invoke-direct {v6, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_168
    invoke-virtual {v6}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_182

    invoke-virtual {v6}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj6l;
    :try_end_174
    .catchall {:try_start_114 .. :try_end_174} :catchall_186

    :try_start_174
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    iget v3, v1, Lk6l;->n:I

    invoke-interface {v0, v3}, Lj6l;->d(I)V
    :try_end_17c
    .catch Ljava/lang/RuntimeException; {:try_start_174 .. :try_end_17c} :catch_17d
    .catchall {:try_start_174 .. :try_end_17c} :catchall_186

    goto :goto_168

    :catch_17d
    move-exception v0

    :try_start_17e
    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V
    :try_end_181
    .catchall {:try_start_17e .. :try_end_181} :catchall_186

    goto :goto_168

    :cond_182
    invoke-virtual {v1, v5}, Lk6l;->n(Lh6l;)V

    return-void

    :catchall_186
    move-exception v0

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v2}, Ljava/util/HashMap;->clear()V

    const/4 v2, 0x0

    iput-object v2, v1, Lk6l;->o:Lb2l;

    invoke-virtual {v1, v5}, Lk6l;->n(Lh6l;)V

    throw v0
.end method

.method public final q(I)V
    .registers 3

    iget-object p0, p0, Ljl6;->e:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const-string v0, "phase"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public final r()V
    .registers 5

    iget-object v0, p0, Ljl6;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Li2c;

    invoke-virtual {v1}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginStart()I

    move-result v1

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Li2c;

    invoke-virtual {v2}, Landroid/view/ViewGroup$MarginLayoutParams;->getMarginEnd()I

    move-result v2

    iget-object v3, p0, Ljl6;->f:Ljava/lang/Object;

    check-cast v3, Landroid/animation/ValueAnimator;

    if-eqz v3, :cond_29

    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    goto :goto_2a

    :cond_29
    move v3, v1

    :goto_2a
    iget-object p0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast p0, Landroid/animation/ValueAnimator;

    if-eqz p0, :cond_3b

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    goto :goto_3c

    :cond_3b
    move p0, v2

    :goto_3c
    if-ne v1, v3, :cond_41

    if-ne v2, p0, :cond_41

    return-void

    :cond_41
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Li2c;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginEnd(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public final toString()Ljava/lang/String;
    .registers 5

    iget-byte v0, p0, Ljl6;->a:B

    packed-switch v0, :pswitch_data_34

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object v0, p0, Ljl6;->f:Ljava/lang/Object;

    check-cast v0, Lrr;

    iget v1, p0, Ljl6;->c:I

    iget-object p0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Adapter in state "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, " completed in "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " with description: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_34
    .packed-switch 0x6
        :pswitch_a
    .end packed-switch
.end method
