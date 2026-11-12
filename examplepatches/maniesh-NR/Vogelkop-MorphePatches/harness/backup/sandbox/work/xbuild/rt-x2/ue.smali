.class public final Lue;
.super Ld43;
.source "SourceFile"


# instance fields
.field public final e:Lye;

.field public final f:Lq6e;

.field public final g:Lorm;

.field public final h:Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

.field public final i:Livn;

.field public final j:Lg1j;

.field public final k:Ljv0;

.field public final l:Lole;

.field public final m:Lte;

.field public n:Landroid/view/MenuItem;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lye;Livn;Lg1j;Lq6e;Lorm;Ljv0;Lte;)V
    .registers 13

    new-instance v0, Leme;

    instance-of v1, p2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    const/4 v2, 0x0

    if-eqz v1, :cond_b

    move-object v3, p2

    check-cast v3, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    goto :goto_c

    :cond_b
    move-object v3, v2

    :goto_c
    invoke-direct {v0, v3}, Leme;-><init>(Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;)V

    sget v3, Lhrj;->f:I

    invoke-direct {p0, p1, v0, v3}, Ld43;-><init>(Landroid/content/Context;Lgrj;I)V

    iput-object p2, p0, Lue;->e:Lye;

    iput-object p8, p0, Lue;->m:Lte;

    iput-object p5, p0, Lue;->f:Lq6e;

    iput-object p6, p0, Lue;->g:Lorm;

    if-eqz v1, :cond_21

    move-object v2, p2

    check-cast v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    :cond_21
    iput-object v2, p0, Lue;->h:Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iput-object p3, p0, Lue;->i:Livn;

    iput-object p4, p0, Lue;->j:Lg1j;

    iput-object p7, p0, Lue;->k:Ljv0;

    iget-object p2, p0, Ld43;->c:Lhrj;

    const p3, 0x7f0a095f

    iput p3, p2, Lhrj;->e:I

    new-instance p2, Lole;

    invoke-direct {p2, p0}, Lole;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lue;->l:Lole;

    new-instance p0, Lpad;

    const/4 p3, 0x2

    invoke-direct {p0, p1, p2, p3}, Lpad;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p0, v2, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->M:Ltyi;

    return-void
.end method


# virtual methods
.method public final b()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lue;->e:Lye;

    check-cast p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iget-object p0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->z:Ljava/lang/String;

    return-object p0
.end method

.method public final c(I)V
    .registers 5

    iget-object v0, p0, Lue;->e:Lye;

    check-cast v0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iget-object v0, v0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->z:Ljava/lang/String;

    const/16 v1, 0x3e8

    invoke-static {v1, v0}, Lxih;->r(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_24

    iget-object v1, p0, Lue;->g:Lorm;

    check-cast v1, Lx5f;

    iget-boolean v2, v1, Lx5f;->h:Z

    if-eqz v2, :cond_1f

    const/16 v2, 0xe

    invoke-virtual {v1, v2}, Lx5f;->o(I)V

    :cond_1f
    iget-object p0, p0, Lue;->i:Livn;

    invoke-interface {p0, p1, v0}, Livn;->d(ILjava/lang/String;)V

    :cond_24
    return-void
.end method

.method public final onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 7

    invoke-super {p0, p1, p2}, Ld43;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_f

    iget-object v0, p0, Lue;->e:Lye;

    invoke-virtual {v0}, Lye;->g()Z

    move-result v2

    if-nez v2, :cond_10

    :cond_f
    return v1

    :cond_10
    iget-object v2, p0, Lue;->n:Landroid/view/MenuItem;

    if-eq p2, v2, :cond_1d

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    const v3, 0x7f0a096a

    if-ne v2, v3, :cond_24

    :cond_1d
    invoke-virtual {p0, v1}, Lue;->c(I)V

    invoke-virtual {v0}, Lye;->e()V

    return v1

    :cond_24
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    const v3, 0x7f0a095e

    if-ne v2, v3, :cond_3b

    move-object p1, v0

    check-cast p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iget-object p1, p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->z:Ljava/lang/String;

    iget-object p0, p0, Lue;->k:Ljv0;

    invoke-interface {p0, p1}, Ljv0;->l(Ljava/lang/String;)V

    invoke-virtual {v0}, Lye;->e()V

    return v1

    :cond_3b
    invoke-interface {p2}, Landroid/view/MenuItem;->getGroupId()I

    move-result v2

    const v3, 0x7f0a0968

    if-ne v2, v3, :cond_99

    invoke-interface {p2}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v2

    if-eqz v2, :cond_99

    invoke-interface {p2}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    if-eqz v2, :cond_99

    invoke-interface {p2}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Ld43;->b:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_99

    invoke-interface {p2}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    const-string v3, "android.intent.action.PROCESS_TEXT"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_99

    invoke-interface {p2}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "com.opera.android.SearchInOpera"

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_91

    const/4 p1, 0x3

    invoke-virtual {p0, p1}, Lue;->c(I)V

    goto :goto_95

    :cond_91
    const/4 p1, 0x2

    invoke-virtual {p0, p1}, Lue;->c(I)V

    :goto_95
    invoke-virtual {v0}, Lye;->e()V

    return v1

    :cond_99
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v2

    const v3, 0x7f0a0065

    if-ne v2, v3, :cond_b0

    move-object p1, v0

    check-cast p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iget-object p1, p1, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->z:Ljava/lang/String;

    iget-object p0, p0, Lue;->j:Lg1j;

    invoke-interface {p0, p1}, Lg1j;->k(Ljava/lang/String;)V

    invoke-virtual {v0}, Lye;->e()V

    return v1

    :cond_b0
    invoke-virtual {v0, p1, p2}, Lye;->h(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 5

    iget-object p0, p0, Lue;->e:Lye;

    check-cast p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iget-object p2, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->d:Lorg/chromium/ui/base/WindowAndroid;

    const/4 v0, 0x0

    if-eqz p2, :cond_2d

    iget-object p2, p2, Lorg/chromium/ui/base/WindowAndroid;->f:Lb2b;

    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/content/Context;

    if-nez p2, :cond_15

    const/4 p2, 0x0

    goto :goto_20

    :cond_15
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v1, 0x7f0c0047

    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    :goto_20
    const/4 v1, 0x2

    if-lt p2, v1, :cond_2d

    iget-object p0, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->c:Landroid/content/Context;

    const p2, 0x7f140084

    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_2e

    :cond_2d
    move-object p0, v0

    :goto_2e
    invoke-virtual {p1, p0}, Landroid/view/ActionMode;->setTitle(Ljava/lang/CharSequence;)V

    invoke-virtual {p1, v0}, Landroid/view/ActionMode;->setSubtitle(Ljava/lang/CharSequence;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final onDestroyActionMode(Landroid/view/ActionMode;)V
    .registers 6

    invoke-super {p0, p1}, Ld43;->onDestroyActionMode(Landroid/view/ActionMode;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lue;->n:Landroid/view/MenuItem;

    iget-object p0, p0, Lue;->e:Lye;

    check-cast p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    iput-object p1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->n:Landroid/view/ActionMode;

    iget-object p1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->o:Lb7f;

    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->D()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p1, v0}, Lb7f;->d(Ljava/lang/Object;)V

    iget-boolean p1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->y:Z

    if-eqz p1, :cond_33

    iget-object p1, p0, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->e:Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    invoke-virtual {p1}, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->h()Lorg/chromium/content/browser/RenderWidgetHostViewImpl;

    move-result-object p1

    if-eqz p1, :cond_30

    iget-wide v0, p1, Lorg/chromium/content/browser/RenderWidgetHostViewImpl;->a:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-eqz p1, :cond_30

    invoke-static {v0, v1}, LJ/N;->MQWja$xA(J)V

    :cond_30
    invoke-virtual {p0}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->r()V

    :cond_33
    return-void
.end method

.method public final onGetContentRect(Landroid/view/ActionMode;Landroid/view/View;Landroid/graphics/Rect;)V
    .registers 8

    iget-object p1, p0, Lue;->e:Lye;

    invoke-virtual {p1, p3}, Lye;->m(Landroid/graphics/Rect;)V

    iget-object p0, p0, Lue;->m:Lte;

    invoke-interface {p0}, Lte;->i()I

    move-result p1

    const/4 v0, 0x0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-interface {p0}, Lte;->d()I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    if-nez p1, :cond_1c

    if-eqz p0, :cond_6b

    :cond_1c
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {p2, v1}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    const/4 v2, 0x2

    new-array v2, v2, [I

    invoke-virtual {p2, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    aget v0, v2, v0

    neg-int v0, v0

    const/4 v3, 0x1

    aget v2, v2, v3

    neg-int v2, v2

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Rect;->offset(II)V

    iget v0, v1, Landroid/graphics/Rect;->top:I

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget v0, v1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v2, p0

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/high16 v0, 0x42800000    # 64.0f

    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {v0, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    iget v0, p3, Landroid/graphics/Rect;->top:I

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p3, Landroid/graphics/Rect;->top:I

    sub-int/2addr v0, p1

    if-ge v0, p2, :cond_6b

    iget v0, p3, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p0, v0

    if-lt p0, p2, :cond_64

    iget p0, v1, Landroid/graphics/Rect;->top:I

    iput p0, p3, Landroid/graphics/Rect;->top:I

    return-void

    :cond_64
    add-int/2addr p1, p2

    iput p1, p3, Landroid/graphics/Rect;->top:I

    if-ge v0, p1, :cond_6b

    iput p1, p3, Landroid/graphics/Rect;->bottom:I

    :cond_6b
    return-void
.end method

.method public final onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 9

    iget-object v0, p0, Lue;->e:Lye;

    invoke-virtual {v0, p2}, Lye;->n(Landroid/view/Menu;)V

    invoke-super {p0, p1, p2}, Ld43;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    invoke-virtual {p0}, Lue;->b()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    iput-object v0, p0, Lue;->n:Landroid/view/MenuItem;

    const/4 v0, 0x1

    if-eqz p1, :cond_6d

    iget-object v1, p0, Lue;->l:Lole;

    invoke-virtual {v1, p1}, Lole;->E(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6d

    iget-object p1, p0, Ld43;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f140f02

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x1020041

    invoke-interface {p2, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    if-nez v3, :cond_39

    const v3, 0x7f0a0b65

    invoke-interface {p2, v3}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    if-eqz v3, :cond_4a

    :cond_39
    const p1, 0x7f0a0962

    const v2, 0x7f0a096a

    invoke-interface {p2, p1, v2, v0, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lue;->n:Landroid/view/MenuItem;

    const/4 p0, 0x2

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setShowAsActionFlags(I)Landroid/view/MenuItem;

    return v0

    :cond_4a
    const/high16 v3, 0x41c00000    # 24.0f

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-static {v3, v4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v3

    const v4, 0x7f0a095f

    const/4 v5, 0x0

    invoke-interface {p2, v4, v2, v5, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p2

    iput-object p2, p0, Lue;->n:Landroid/view/MenuItem;

    iget-object p2, p0, Lue;->f:Lq6e;

    invoke-virtual {p2}, Lq6e;->b()Leri;

    move-result-object p2

    invoke-static {p2, p1, v3}, Leti;->d(Leri;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p1

    iget-object p0, p0, Lue;->n:Landroid/view/MenuItem;

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    :cond_6d
    return v0
.end method
