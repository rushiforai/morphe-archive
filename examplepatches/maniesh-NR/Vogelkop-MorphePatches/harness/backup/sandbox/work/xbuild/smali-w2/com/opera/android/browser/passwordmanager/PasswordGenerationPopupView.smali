.class public final Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final b:Lhuh;

.field public c:Landroid/graphics/Rect;

.field public d:Lnc1;

.field public e:Lb4g;

.field public f:J

.field public g:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLcom/opera/android/browser/chromium/ChromiumContent;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->c:Landroid/graphics/Rect;

    iput-object p3, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p3}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p3

    check-cast p3, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    iget-object p3, p3, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->g:Lhuh;

    iput-object p3, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->b:Lhuh;

    iput-wide p1, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->f:J

    return-void
.end method

.method public static create(JLcom/opera/android/browser/chromium/ChromiumContent;)Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;
    .registers 4
    .param p2    # Lcom/opera/android/browser/chromium/ChromiumContent;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-boolean v0, p2, Lcom/opera/android/browser/chromium/ChromiumContent;->r:Z

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return-object p0

    :cond_6
    new-instance v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    invoke-direct {v0, p0, p1, p2}, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;-><init>(JLcom/opera/android/browser/chromium/ChromiumContent;)V

    return-object v0
.end method


# virtual methods
.method public final destroy()V
    .registers 3

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->f:J

    return-void
.end method

.method public final hide()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->e:Lb4g;

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    iget-object v2, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->S:Z

    iput-object v1, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->e:Lb4g;

    invoke-virtual {v0}, Lo73;->b()Z

    :cond_f
    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iput-object v1, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    :cond_20
    return-void
.end method

.method public final show()V
    .registers 9

    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->e:Lb4g;

    if-nez v0, :cond_b

    new-instance v0, Lb4g;

    invoke-direct {v0, p0}, Lb4g;-><init>(Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;)V

    iput-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->e:Lb4g;

    :cond_b
    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    iget-object v1, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-nez v0, :cond_31

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->getView()Landroid/view/View;

    move-result-object v0

    new-instance v2, Lnc1;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lnc1;-><init>(Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;Landroid/content/Context;)V

    iput-object v2, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_31
    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v2

    iget-object v3, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->e:Lb4g;

    const/4 v4, 0x1

    if-lez v2, :cond_45

    invoke-virtual {v3, v0}, Lo73;->o(Landroid/view/View;)V

    goto :goto_6e

    :cond_45
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Landroid/util/TypedValue;

    invoke-direct {v5}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v6

    const v7, 0x7f0406f1

    invoke-virtual {v6, v7, v5, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    iget v5, v5, Landroid/util/TypedValue;->resourceId:I

    new-instance v6, Ldkf;

    invoke-direct {v6, v2, v5}, Ldkf;-><init>(Landroid/content/Context;I)V

    iput-object v6, v3, Lo73;->b:Ldkf;

    iput-object v6, v3, Lo73;->a:Ldkf;

    new-instance v2, Lkq2;

    invoke-direct {v2, p0, v0}, Lkq2;-><init>(Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;Landroid/view/View;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :goto_6e
    iput-boolean v4, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->S:Z

    iget-object p0, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_76
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_86

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0}, Liz4;->h()V

    goto :goto_76

    :cond_86
    return-void
.end method

.method public final update(IIIILjava/lang/String;)V
    .registers 12
    .param p5    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->b:Lhuh;

    iget v1, v0, Lhuh;->k:F

    iget v0, v0, Lhuh;->j:F

    int-to-float v2, p1

    mul-float/2addr v2, v0

    float-to-int v2, v2

    int-to-float v3, p2

    mul-float/2addr v3, v0

    add-float/2addr v3, v1

    float-to-int v3, v3

    add-int/2addr p1, p3

    int-to-float p1, p1

    mul-float/2addr p1, v0

    float-to-double v4, p1

    invoke-static {v4, v5}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v4

    double-to-int p1, v4

    add-int/2addr p2, p4

    int-to-float p2, p2

    mul-float/2addr v0, p2

    add-float/2addr v0, v1

    float-to-double p2, v0

    invoke-static {p2, p3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide p2

    double-to-int p2, p2

    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3, v2, v3, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p5, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->g:Ljava/lang/String;

    iput-object p3, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->c:Landroid/graphics/Rect;

    iget-object p1, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->d:Lnc1;

    if-eqz p1, :cond_30

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    :cond_30
    iget-object p0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->e:Lb4g;

    if-eqz p0, :cond_3d

    invoke-virtual {p0}, Lo73;->f()Lr9i;

    move-result-object p1

    if-eqz p1, :cond_3d

    invoke-virtual {p0, p1}, Lb4g;->q(Lr9i;)V

    :cond_3d
    return-void
.end method
