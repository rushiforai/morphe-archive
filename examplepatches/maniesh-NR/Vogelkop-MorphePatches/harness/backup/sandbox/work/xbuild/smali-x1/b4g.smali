.class public final Lb4g;
.super Lo73;
.source "SourceFile"


# instance fields
.field public j:Landroid/graphics/Rect;

.field public final k:Llq2;

.field public final l:Lab;

.field public final synthetic m:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;)V
    .registers 5

    iput-object p1, p0, Lb4g;->m:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    invoke-direct {p0}, Lo73;-><init>()V

    new-instance v0, Llq2;

    new-instance v1, Lq02;

    const/16 v2, 0x16

    invoke-direct {v1, p0, v2}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, p1, v1}, Llq2;-><init>(Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;Lq02;)V

    iput-object v0, p0, Lb4g;->k:Llq2;

    new-instance p1, Lab;

    const/16 v0, 0x19

    invoke-direct {p1, p0, v0}, Lab;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lb4g;->l:Lab;

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)I
    .registers 2

    const p0, 0x800003

    return p0
.end method

.method public final e(Landroid/view/View;)I
    .registers 4

    invoke-super {p0, p1}, Lo73;->e(Landroid/view/View;)I

    move-result p1

    iget-object v0, p0, Lb4g;->j:Landroid/graphics/Rect;

    if-nez v0, :cond_1f

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lb4g;->j:Landroid/graphics/Rect;

    iget-object v0, p0, Lo73;->a:Ldkf;

    const v1, 0x7f0407b8

    invoke-static {v1, v0}, Lf03;->x(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1f

    iget-object v1, p0, Lb4g;->j:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    :cond_1f
    iget-object p0, p0, Lb4g;->j:Landroid/graphics/Rect;

    iget p0, p0, Landroid/graphics/Rect;->left:I

    sub-int/2addr p1, p0

    return p1
.end method

.method public final g()I
    .registers 1

    const p0, 0x7f04078f

    return p0
.end method

.method public final m(Lr9i;Landroid/view/View;)V
    .registers 5

    invoke-virtual {p0, p1}, Lb4g;->q(Lr9i;)V

    iget-object p2, p1, Lr9i;->d:Ljava/lang/Object;

    check-cast p2, Lo66;

    const v0, 0x7fffffff

    iput v0, p2, Lo66;->u:I

    const/4 v0, 0x1

    iput-boolean v0, p2, Lo66;->B:Z

    const/4 v1, 0x0

    iput-boolean v1, p2, Lo66;->y:Z

    invoke-virtual {p1, v0}, Lr9i;->S(Z)V

    iput-boolean v0, p2, Lo66;->C:Z

    iput-boolean v0, p2, Lo66;->z:Z

    iget-object p1, p2, Lo66;->f:Ll56;

    if-eqz p1, :cond_1f

    iput-boolean v0, p1, Landroidx/appcompat/widget/ListPopupWindow;->l:Z

    :cond_1f
    iput-object p0, p2, Lo66;->x:Lb4g;

    iget-object p1, p0, Lb4g;->m:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    iget-object p1, p1, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p1

    iget-object p1, p1, Ldx3;->m:Li7f;

    iget-object v1, p0, Lb4g;->l:Lab;

    invoke-virtual {p1, v1}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p0, Lb4g;->k:Llq2;

    iget-object p1, p0, Llq2;->e:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    iget-object p1, p1, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->b:Lhuh;

    iget v1, p1, Lhuh;->a:F

    invoke-virtual {p1, v1}, Lhuh;->a(F)F

    move-result v1

    iput v1, p0, Llq2;->a:F

    iget v1, p1, Lhuh;->b:F

    invoke-virtual {p1, v1}, Lhuh;->a(F)F

    move-result v1

    iput v1, p0, Llq2;->b:F

    iget-object p0, p0, Llq2;->c:Lq02;

    iget-object p1, p1, Lhuh;->l:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result p0

    if-nez p0, :cond_5e

    iput-boolean v0, p2, Lo66;->A:Z

    invoke-virtual {p2}, Lo66;->j()Z

    move-result p0

    if-eqz p0, :cond_5e

    invoke-virtual {p2, v0}, Lo66;->a(Z)V

    :cond_5e
    return-void
.end method

.method public final onDismiss()V
    .registers 3

    invoke-super {p0}, Lo73;->onDismiss()V

    iget-object v0, p0, Lb4g;->k:Llq2;

    iget-object v1, v0, Llq2;->e:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    iget-object v1, v1, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->b:Lhuh;

    iget-object v0, v0, Llq2;->c:Lq02;

    iget-object v1, v1, Lhuh;->l:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lb4g;->m:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    iget-object v1, v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->a:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v1

    iget-object v1, v1, Ldx3;->m:Li7f;

    iget-object p0, p0, Lb4g;->l:Lab;

    invoke-virtual {v1, p0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p0, v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->e:Lb4g;

    if-eqz p0, :cond_28

    iget-wide v0, v0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->f:J

    invoke-static {v0, v1}, LJ/N;->MyFetNYO(J)V

    :cond_28
    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    iget-object p0, p0, Lb4g;->m:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    if-eqz p1, :cond_d

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    return p0

    :cond_d
    iget-wide p0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->f:J

    invoke-static {p0, p1}, LJ/N;->MBk$J_UY(J)V

    const/4 p0, 0x1

    return p0
.end method

.method public final q(Lr9i;)V
    .registers 5

    iget-object p1, p1, Lr9i;->c:Ljava/lang/Object;

    check-cast p1, Lm66;

    invoke-virtual {p1}, Litd;->clear()V

    iget-object v0, p0, Lo73;->a:Ldkf;

    iget-object p0, p0, Lb4g;->m:Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;

    iget-object p0, p0, Lcom/opera/android/browser/passwordmanager/PasswordGenerationPopupView;->g:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz p0, :cond_20

    invoke-virtual {p1, v1, v1, v1, p0}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object p0

    const v2, 0x7f0805a8

    invoke-virtual {p0, v2}, Lptd;->setIcon(I)Landroid/view/MenuItem;

    const v2, 0x7f0d0085

    invoke-virtual {p0, v2}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    :cond_20
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v2, 0x7f1401b7

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v2, 0x7f1402c6

    invoke-virtual {p0, v2, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x1

    invoke-virtual {p1, v1, v0, v1, p0}, Litd;->a(IIILjava/lang/CharSequence;)Lptd;

    move-result-object p0

    const p1, 0x7f0d0084

    invoke-virtual {p0, p1}, Lptd;->setActionView(I)Landroid/view/MenuItem;

    return-void
.end method
