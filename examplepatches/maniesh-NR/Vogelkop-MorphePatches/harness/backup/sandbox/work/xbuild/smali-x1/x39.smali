.class public final Lx39;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lx39;->a:B

    iput-object p1, p0, Lx39;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .registers 6

    iget-byte p1, p0, Lx39;->a:B

    const/4 v0, 0x1

    iget-object p0, p0, Lx39;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_6a

    check-cast p0, Landroidx/appcompat/widget/SearchView;

    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->m()V

    return v0

    :pswitch_e
    check-cast p0, Liji;

    iget-object p1, p0, Liji;->o:Lrf2;

    iget-object p1, p1, Lrf2;->k:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p1}, Landroid/view/View;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_1f

    invoke-virtual {p0, v0}, Liji;->l(Z)V

    :cond_1f
    return v0

    :pswitch_20
    check-cast p0, Lcom/opera/android/bar/FindInPage;

    const/4 p1, 0x3

    if-eq p2, p1, :cond_35

    if-eqz p3, :cond_57

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result p1

    const/16 p2, 0x42

    if-ne p1, p2, :cond_57

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-ne p1, v0, :cond_57

    :cond_35
    iget p1, p0, Lcom/opera/android/bar/FindInPage;->e:I

    if-gt p1, v0, :cond_57

    iget-object p1, p0, Lcom/opera/android/bar/FindInPage;->c:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_63

    iget-object p1, p0, Lcom/opera/android/bar/FindInPage;->c:Ljava/lang/String;

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->c:Ljava/lang/String;

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/opera/android/bar/FindInPage;->g:Z

    iget-object p3, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    iput-object p1, p3, Lzg;->c:Ljava/lang/Object;

    iget-object v1, p3, Lzg;->b:Ljava/lang/Object;

    check-cast v1, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {v1, p1, v0, p2}, LJ/N;->MaMXv1PI(Ljava/lang/Object;Ljava/lang/Object;ZZ)I

    move-result p1

    iput p1, p3, Lzg;->a:I

    goto :goto_63

    :cond_57
    sget p1, Lcom/opera/android/bar/FindInPage;->w:I

    const p1, 0x7f0a0494

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    :cond_63
    :goto_63
    iget-object p0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {p0}, Landroid/view/View;->clearFocus()V

    return v0

    nop

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_20
        :pswitch_e
    .end packed-switch
.end method
